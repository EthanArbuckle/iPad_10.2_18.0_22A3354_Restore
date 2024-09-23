@implementation SBHUDController

- (id)presentedHUDControllerForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[SBHUDController presentedHUDs](self, "presentedHUDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__SBHUDController_presentedHUDControllerForIdentifier___block_invoke;
  v10[3] = &unk_1E8EABF88;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)presentedHUDs
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;

  -[SBHUDController hudViewController](self, "hudViewController");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[122];
  v4 = v2;

  return v4;
}

- (_SBHUDHostViewController)hudViewController
{
  return self->_hudViewController;
}

- (SBHUDController)init
{
  SBHUDController *v2;
  uint64_t v3;
  SBHUDSettings *settings;
  uint64_t v5;
  NSCountedSet *hudHiddenAssertions;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHUDController;
  v2 = -[SBHUDController init](&v9, sel_init);
  if (v2)
  {
    +[SBHUDDomain rootSettings](SBHUDDomain, "rootSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBHUDSettings *)v3;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    hudHiddenAssertions = v2->_hudHiddenAssertions;
    v2->_hudHiddenAssertions = (NSCountedSet *)v5;

    -[PTSettings addKeyObserver:](v2->_settings, "addKeyObserver:", v2);
    -[SBHUDController _setupStateCapture](v2, "_setupStateCapture");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__notificationFiredToDismissHUDs_, *MEMORY[0x1E0DAC2F0], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__notificationFiredToDismissHUDs_, CFSTR("SBLockScreenUIRelockedNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBHUDController _tearDown](self, "_tearDown");
  v3.receiver = self;
  v3.super_class = (Class)SBHUDController;
  -[SBHUDController dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SBHUDController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHUDController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHUDController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_windowScene, CFSTR("windowScene"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_settings, CFSTR("settings"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_hudHiddenAssertions, CFSTR("hudHiddenAssertions"));
  v8 = (id)objc_msgSend(v4, "appendPointer:withName:", self->_hudViewController, CFSTR("hudViewController"));
  -[SBHUDController presentedHUDs](self, "presentedHUDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = MEMORY[0x1E0C9AA60];
  if (v10)
    v13 = v10;
  else
    v13 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v13, CFSTR("presentedHUDs"), 1);

  -[SBHUDController knownHUDs](self, "knownHUDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = v15;
  else
    v17 = v12;
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v17, CFSTR("knownHUDs"), 1);

  return v4;
}

- (void)_setupStateCapture
{
  id v3;
  BSInvalidatable *v4;
  BSInvalidatable *stateCaptureHandle;
  id v6;
  id location;

  if (!self->_stateCaptureHandle)
  {
    objc_initWeak(&location, self);
    v3 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v6, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = self->_stateCaptureHandle;
    self->_stateCaptureHandle = v4;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

id __37__SBHUDController__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)presentingHUDs
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;

  -[SBHUDController hudViewController](self, "hudViewController");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[123];
  v4 = v2;

  return v4;
}

- (id)knownHUDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBHUDController presentedHUDs](self, "presentedHUDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBHUDController presentingHUDs](self, "presentingHUDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setByAddingObjectsFromSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObjectsFromSet:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v3)

  return v6;
}

- (BOOL)anyHUDsVisible
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBHUDController presentedHUDs](self, "presentedHUDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_filter:", &__block_literal_global_129);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

uint64_t __33__SBHUDController_anyHUDsVisible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVisible");
}

uint64_t __55__SBHUDController_presentedHUDControllerForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)knownHUDControllerForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[SBHUDController knownHUDs](self, "knownHUDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__SBHUDController_knownHUDControllerForIdentifier___block_invoke;
  v10[3] = &unk_1E8EABF88;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __51__SBHUDController_knownHUDControllerForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)HUDSessionForViewController:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[SBHUDController knownHUDControllerForIdentifier:](self, "knownHUDControllerForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SBHUDModel HUDModelForController:viewController:identifier:](_SBHUDModel, "HUDModelForController:viewController:identifier:", self, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqual:", v9))
    v10 = v8;
  else
    v10 = v9;
  v11 = v10;

  return v11;
}

- (id)acquireHUDHiddenAssertionForIdentifier:(id)a3 withReason:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  SBHUDController *v18;
  id v19;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D01868];
  v8 = a4;
  v9 = [v7 alloc];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __69__SBHUDController_acquireHUDHiddenAssertionForIdentifier_withReason___block_invoke;
  v17 = &unk_1E8EA8488;
  v18 = self;
  v19 = v6;
  v10 = v6;
  v11 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v10, v8, &v14);

  -[NSCountedSet addObject:](self->_hudHiddenAssertions, "addObject:", v10, v14, v15, v16, v17, v18);
  -[SBHUDController knownHUDControllerForIdentifier:](self, "knownHUDControllerForIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissAnimated:", 0);

  return v11;
}

uint64_t __69__SBHUDController_acquireHUDHiddenAssertionForIdentifier_withReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)dismissHUDs:(BOOL)a3
{
  _BOOL8 v3;
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

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SBHUDController knownHUDs](self, "knownHUDs", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "dismissAnimated:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_presentHUD:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSCountedSet *hudHiddenAssertions;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  hudHiddenAssertions = self->_hudHiddenAssertions;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSCountedSet countForObject:](hudHiddenAssertions, "countForObject:", v8);

  if (v9)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("s");
      *(_DWORD *)buf = 138412802;
      v18 = v11;
      if (v9 == 1)
        v12 = &stru_1E8EC7EC0;
      v19 = 2048;
      v20 = v9;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[SBHUDController] ignoring request to present HUD with identifier '%@' due to %lu outstanding assertion%@", buf, 0x20u);

    }
    goto LABEL_18;
  }
  -[SBHUDController windowScene](self, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SBHUDController _createHUDWindowIfNeeded](self, "_createHUDWindowIfNeeded");
    -[SBHUDController HUDWindow](self, "HUDWindow");
    v10 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isHidden](v10, "isHidden"))
      -[NSObject makeKeyAndVisible](v10, "makeKeyAndVisible");
    -[SBHUDController hudViewController](self, "hudViewController");
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    if (-[_SBHUDHostViewController isHUDBeingDismissed:](v14, (uint64_t)v6))
    {
      -[_SBHUDHostViewController reverseHUDDismissal:](v14, (uint64_t)v6);
    }
    else if ((objc_msgSend(v6, "isPresented") & 1) != 0 || objc_msgSend(v6, "isPresenting"))
    {
      objc_msgSend(v6, "rescheduleDismissalTimer");
      goto LABEL_17;
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__SBHUDController__presentHUD_animated___block_invoke;
    v15[3] = &unk_1E8EABFB0;
    v15[4] = self;
    v16 = v6;
    -[_SBHUDHostViewController presentHUD:animated:completion:](v14, v16, v4, v15);

LABEL_17:
    goto LABEL_18;
  }
  SBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SBHUDController _presentHUD:animated:].cold.1(v6, v10);
LABEL_18:

}

uint64_t __40__SBHUDController__presentHUD_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedTransitionForHUD:intendedState:finalState:", *(_QWORD *)(a1 + 40), 0, a2);
}

- (void)_dismissHUD:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id *v7;
  id *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  v6 = a3;
  -[SBHUDController hudViewController](self, "hudViewController");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (objc_msgSend(v7, "_transitionContextMatchingHUD:withinContainer:", v6, v7[125]),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[_SBHUDHostViewController reverseHUDPresentation:](v8, (uint64_t)v6);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__SBHUDController__dismissHUD_animated___block_invoke;
    v10[3] = &unk_1E8EABFB0;
    v10[4] = self;
    v11 = v6;
    -[_SBHUDHostViewController dismissHUD:animated:completion:](v8, v11, v4, v10);

  }
}

uint64_t __40__SBHUDController__dismissHUD_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedTransitionForHUD:intendedState:finalState:", *(_QWORD *)(a1 + 40), 1, a2);
}

- (void)_finishedTransitionForHUD:(id)a3 intendedState:(int64_t)a4 finalState:(int64_t)a5
{
  id v8;

  v8 = a3;
  if (a5 != a4)
    objc_msgSend(v8, "invalidateDismissalTimer");
  if (!a5)
    objc_msgSend(v8, "rescheduleDismissalTimer");
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("SBHUDController finishedTransitionForHUD"));
  -[SBHUDController _hideWindowIfPossible](self, "_hideWindowIfPossible");

}

- (void)windowSceneDidConnect:(id)a3
{
  id v5;
  SBFZStackParticipant *v6;
  SBFZStackParticipant *zStackParticipant;
  id v8;

  objc_storeStrong((id *)&self->_windowScene, a3);
  v5 = a3;
  objc_msgSend(v5, "zStackResolver");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acquireParticipantWithIdentifier:delegate:", 18, self);
  v6 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = v6;

}

- (void)_createHUDWindowIfNeeded
{
  SBHUDWindow *v4;
  _SBHUDHostViewController *v5;
  _SBHUDHostViewController *hudViewController;
  _SBHUDHostViewController *v7;
  void *v8;
  id v9;

  -[SBHUDController windowScene](self, "windowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHUDController.m"), 346, CFSTR("windowScene cannot be nil"));

  }
  -[SBHUDController HUDWindow](self, "HUDWindow");
  v4 = (SBHUDWindow *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (_SBHUDHostViewController *)-[_SBHUDHostViewController initWithHUDController:]([_SBHUDHostViewController alloc], self);
    hudViewController = self->_hudViewController;
    self->_hudViewController = v5;

    v7 = self->_hudViewController;
    if (v7)
      objc_storeWeak((id *)&v7->_delegate, self);
    v4 = -[SBFTouchPassThroughWindow initWithWindowScene:role:debugName:]([SBHUDWindow alloc], "initWithWindowScene:role:debugName:", v9, CFSTR("SBTraitsParticipantRoleHUD"), CFSTR("HUDWindow"));
    -[SBHUDWindow setRootViewController:](v4, "setRootViewController:", self->_hudViewController);
    -[SBHUDWindow setOpaque:](v4, "setOpaque:", 0);
    -[SBHUDWindow setWindowLevel:](v4, "setWindowLevel:", *MEMORY[0x1E0CEB660]);
    objc_storeStrong((id *)&self->_HUDWindow, v4);
  }

}

- (void)_hideWindowIfPossible
{
  uint64_t v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[SBHUDController presentedHUDs](self, "presentedHUDs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {

    goto LABEL_6;
  }
  -[SBHUDController hudViewController](self, "hudViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {

    return;
  }
  v4 = (id *)v3;
  v5 = objc_msgSend(*(id *)(v3 + 1000), "count");
  v6 = objc_msgSend(v4[126], "count");

  if (v6 + v5)
LABEL_6:
    -[UIWindow setHidden:](self->_HUDWindow, "setHidden:", 1);
}

- (void)_tearDown
{
  _SBHUDHostViewController *hudViewController;
  UIWindow *HUDWindow;
  BSInvalidatable *stateCaptureHandle;

  hudViewController = self->_hudViewController;
  if (hudViewController)
  {
    objc_storeWeak((id *)&hudViewController->_delegate, 0);
    hudViewController = self->_hudViewController;
  }
  self->_hudViewController = 0;

  -[UIWindow setHidden:](self->_HUDWindow, "setHidden:", 1);
  HUDWindow = self->_HUDWindow;
  self->_HUDWindow = 0;

  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  stateCaptureHandle = self->_stateCaptureHandle;
  self->_stateCaptureHandle = 0;

}

- (void)_notificationFiredToDismissHUDs:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[SBHUDController] Dismissing all HUDs because of notification: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SBHUDController dismissHUDs:](self, "dismissHUDs:", 1);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[SBHUDController dismissHUDs:](self, "dismissHUDs:", 0, a4);
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__44;
  v14 = __Block_byref_object_dispose__44;
  v15 = 0;
  -[SBHUDController presentedHUDs](self, "presentedHUDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__SBHUDController_zStackParticipant_updatePreferences___block_invoke;
    v9[3] = &unk_1E8EABFD8;
    v9[4] = &v10;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  }
  objc_msgSend(v7, "setPhysicalButtonSceneTargets:", v11[5]);

  _Block_object_dispose(&v10, 8);
}

void __55__SBHUDController_zStackParticipant_updatePreferences___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "HUDViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "physicalButtonSceneTargets");
  v9 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v9;
  if (v9)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v5, "addObjectsFromArray:", v9);
    v4 = (void *)v9;
  }

}

- (void)hudViewController:(id)a3 willDismissHUD:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "hudViewController:willDismissHUD:", v7, v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBHUDControllerWillDismissHUDNotificationName"), v5);

}

- (void)hudViewController:(id)a3 didDismissHUD:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "hudViewController:didDismissHUD:", v8, v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("SBHUDControllerDidDismissHUDNotificationName"), v6);

  -[SBHUDController _hideWindowIfPossible](self, "_hideWindowIfPossible");
}

- (void)hudViewController:(id)a3 didPresentHUD:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "hudViewController:didPresentHUD:", v7, v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBHUDControllerDidPresentHUDNotificationName"), v5);

}

- (void)hudViewController:(id)a3 willPresentHUD:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "hudViewController:willPresentHUD:", v7, v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBHUDControllerWillPresentHUDNotificationName"), v5);

}

+ (id)_defaultCrossfadeAnimatorForHUDController:(id)a3
{
  id v3;
  SBUIAnimationPropertyAnimator *v4;
  id v5;
  SBUIAnimationPropertyAnimator *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = [SBUIAnimationPropertyAnimator alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke;
  v8[3] = &unk_1E8EAC050;
  v9 = v3;
  v5 = v3;
  v6 = -[SBUIAnimationPropertyAnimator initWithPropertyAnimatorGenerator:](v4, "initWithPropertyAnimatorGenerator:", v8);

  return v6;
}

id __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v3 = a2;
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultHUDPresentationAnimationDuration");
  v8 = v7;

  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CEABB0];
  v13 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_2;
  v35[3] = &unk_1E8EAC000;
  v14 = v9;
  v36 = v14;
  v15 = v3;
  v37 = v15;
  v38 = v4;
  v16 = v10;
  v39 = v16;
  v40 = v5;
  v41 = v11;
  v17 = v11;
  v18 = v5;
  v19 = v4;
  objc_msgSend(v12, "performWithoutAnimation:", v35);
  v20 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_3;
  v32[3] = &unk_1E8E9E820;
  v21 = v14;
  v33 = v21;
  v22 = v16;
  v34 = v22;
  v23 = (void *)objc_msgSend(v20, "initWithDuration:curve:animations:", 0, v32, v8);
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_4;
  v28[3] = &unk_1E8EAC028;
  v29 = v21;
  v30 = v22;
  v31 = v15;
  v24 = v15;
  v25 = v22;
  v26 = v21;
  objc_msgSend(v23, "addCompletion:", v28);

  return v23;
}

uint64_t __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "initialFrameForViewController:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v3 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "initialFrameForViewController:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 72), "addSubview:", *(_QWORD *)(a1 + 56));
}

uint64_t __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_4(id *a1, uint64_t a2)
{
  if (a2)
  {
    if (a2 == 1)
    {
      objc_msgSend(a1[4], "setAlpha:", 1.0);
      objc_msgSend(a1[5], "setAlpha:", 0.0);
      objc_msgSend(a1[5], "removeFromSuperview");
    }
  }
  else
  {
    objc_msgSend(a1[4], "removeFromSuperview");
    objc_msgSend(a1[5], "setAlpha:", 1.0);
  }
  return objc_msgSend(a1[6], "completeTransition:", objc_msgSend(a1[6], "transitionWasCancelled") ^ 1);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_defaultCrossfadeAnimatorForHUDController:", self);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return (id)objc_msgSend((id)objc_opt_class(), "_defaultCrossfadeAnimatorForHUDController:", self);
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (UIWindow)HUDWindow
{
  return self->_HUDWindow;
}

- (SBHUDSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_hudViewController, 0);
  objc_storeStrong((id *)&self->_HUDWindow, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_hudHiddenAssertions, 0);
}

- (void)_presentHUD:(void *)a1 animated:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "[SBHUDController] ignoring request to present HUD with identifier '%@' due to windowScene being nil", (uint8_t *)&v4, 0xCu);

}

@end
