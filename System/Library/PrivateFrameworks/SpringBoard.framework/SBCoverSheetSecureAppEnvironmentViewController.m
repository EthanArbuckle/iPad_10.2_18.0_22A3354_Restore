@implementation SBCoverSheetSecureAppEnvironmentViewController

- (SBCoverSheetSecureAppEnvironmentViewController)initWithSecureAppViewController:(id)a3
{
  id v5;
  SBCoverSheetSecureAppEnvironmentViewController *v6;
  SBCoverSheetSecureAppEnvironmentViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  v6 = -[SBCoverSheetSecureAppEnvironmentViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_secureAppViewController, a3);
    v7->_currentOrientationMask = 30;
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleSecureApp")) & 1) != 0)
    {
      -[SBCoverSheetSecureAppEnvironmentViewController _acquireSecureAppTraitsParticipantIfNeeded](v7, "_acquireSecureAppTraitsParticipantIfNeeded");
    }
    else
    {
      +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:", v7);

    }
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SBCoverSheetSecureAppEnvironmentViewController _invalidateTraitsParticipantAndDelegateHelper](self, "_invalidateTraitsParticipantAndDelegateHelper");
  v3.receiver = self;
  v3.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  -[SBCoverSheetSecureAppEnvironmentViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  BSInvalidatable *secureAppViewController;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  -[SBCoverSheetSecureAppEnvironmentViewController viewDidLoad](&v5, sel_viewDidLoad);
  secureAppViewController = self->_secureAppViewController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SBCoverSheetSecureAppEnvironmentViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E8EA0048;
  v4[4] = self;
  -[SBCoverSheetSecureAppEnvironmentViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", secureAppViewController, 0, v4);
  -[SBCoverSheetSecureAppEnvironmentViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
}

void __61__SBCoverSheetSecureAppEnvironmentViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1024);
  v4 = a2;
  objc_msgSend(v3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "setFrame:");

  objc_msgSend(v6, "setAutoresizingMask:", 18);
  v4[2](v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  BSInvalidatable *v5;
  BSInvalidatable *biometricMatchingAssertion;
  NSObject *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  -[SBCoverSheetSecureAppEnvironmentViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPearlSupport") & 1) == 0)
  {
    objc_msgSend(v4, "acquireMatchingAssertionWithMode:reason:", 2, CFSTR("SBCoverSheetSecureAppEnvironmentViewController"));
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    biometricMatchingAssertion = self->_biometricMatchingAssertion;
    self->_biometricMatchingAssertion = v5;

    SBLogLockScreenBiometricCoordinator();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SBCoverSheetSecureAppEnvironmentViewController viewWillAppear:].cold.1();

  }
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleSecureApp")) & 1) == 0)
    -[SBCoverSheetSecureAppEnvironmentViewController _updateSupportedOrientationsMaskForSecureAppAction](self, "_updateSupportedOrientationsMaskForSecureAppAction");

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3)
  {
    -[SBCoverSheetSecureAppEnvironmentViewController _acquireSecureAppTraitsParticipantIfNeeded](self, "_acquireSecureAppTraitsParticipantIfNeeded", a3, a4);
    -[SBCoverSheetSecureAppEnvironmentViewController _actuateTraitsParticipantResolution](self, "_actuateTraitsParticipantResolution");
  }
  else
  {
    -[SBCoverSheetSecureAppEnvironmentViewController _invalidateTraitsParticipantAndDelegateHelper](self, "_invalidateTraitsParticipantAndDelegateHelper", 0, a4);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  -[SBCoverSheetSecureAppEnvironmentViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SBCoverSheetSecureAppEnvironmentViewController updateHomeGrabberHiddenAssertion:](self, "updateHomeGrabberHiddenAssertion:", 0);
  objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  BSInvalidatable **p_biometricMatchingAssertion;
  NSObject *v5;
  BSInvalidatable *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  -[SBCoverSheetSecureAppEnvironmentViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  p_biometricMatchingAssertion = &self->_biometricMatchingAssertion;
  if (self->_biometricMatchingAssertion)
  {
    SBLogLockScreenBiometricCoordinator();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBCoverSheetSecureAppEnvironmentViewController viewWillDisappear:].cold.1();

    -[BSInvalidatable invalidate](*p_biometricMatchingAssertion, "invalidate");
    v6 = *p_biometricMatchingAssertion;
    *p_biometricMatchingAssertion = 0;

  }
  objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleSecureApp")) & 1) != 0)
    return 30;
  -[SBCoverSheetSecureAppEnvironmentViewController _currentSecureAppAction](self, "_currentSecureAppAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "specifiesSupportedInterfaceOrientations");

  -[SBCoverSheetSecureAppEnvironmentViewController hostedAppSceneHandle](self, "hostedAppSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceOrientationEventsEnabled");

  if ((v4 & 1) == 0 && !v8)
    return 30;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  return XBInterfaceOrientationMaskForInterfaceOrientation();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_createTraitsSceneParticipantDelegate
{
  void *v3;
  void *v4;
  SBTraitsSceneParticipantDelegate *v5;
  void *v6;
  SBTraitsSceneParticipantDelegate *v7;
  SBTraitsSceneParticipantDelegate *v8;
  void *v9;
  uint64_t v10;

  -[SBCoverSheetSecureAppEnvironmentViewController _hostableEntityPresenter](self, "_hostableEntityPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "sceneHandleForTraitsParticipant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = -[SBTraitsSceneParticipantDelegate initWithSceneHandle:]([SBTraitsSceneParticipantDelegate alloc], "initWithSceneHandle:", v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  if (!self->_secureAppTraitsParticipantDelegateHelper)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "sceneForTraitsParticipant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = -[SBTraitsSceneParticipantDelegate initWithScene:]([SBTraitsSceneParticipantDelegate alloc], "initWithScene:", v6);

        v5 = v7;
      }

    }
    if (!self->_secureAppTraitsParticipantDelegateHelper)
    {
      v8 = [SBTraitsSceneParticipantDelegate alloc];
      -[BSInvalidatable applicationSceneHandle](self->_secureAppViewController, "applicationSceneHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBTraitsSceneParticipantDelegate initWithSceneHandle:](v8, "initWithSceneHandle:", v9);

      v5 = (SBTraitsSceneParticipantDelegate *)v10;
    }
  }

  return v5;
}

- (void)_acquireSecureAppTraitsParticipantIfNeeded
{
  void *v3;
  TRAParticipant *v4;
  TRAParticipant *secureAppTraitsParticipant;
  SBTraitsSceneParticipantDelegate *v6;
  SBTraitsSceneParticipantDelegate *secureAppTraitsParticipantDelegateHelper;
  SBTraitsSceneParticipantDelegate *v8;
  void *v9;
  SBTraitsSceneParticipantDelegate *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (!self->_secureAppTraitsParticipant)
  {
    if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleSecureApp")))
    {
      -[SBCoverSheetSecureAppEnvironmentViewController _traitsArbiter](self, "_traitsArbiter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleSecureApp"), self);
      v4 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
      secureAppTraitsParticipant = self->_secureAppTraitsParticipant;
      self->_secureAppTraitsParticipant = v4;

      -[SBCoverSheetSecureAppEnvironmentViewController _createTraitsSceneParticipantDelegate](self, "_createTraitsSceneParticipantDelegate");
      v6 = (SBTraitsSceneParticipantDelegate *)objc_claimAutoreleasedReturnValue();
      secureAppTraitsParticipantDelegateHelper = self->_secureAppTraitsParticipantDelegateHelper;
      self->_secureAppTraitsParticipantDelegateHelper = v6;

      -[SBTraitsSceneParticipantDelegate setArbiter:](self->_secureAppTraitsParticipantDelegateHelper, "setArbiter:", v3);
      -[SBTraitsSceneParticipantDelegate setParticipant:](self->_secureAppTraitsParticipantDelegateHelper, "setParticipant:", self->_secureAppTraitsParticipant);
      -[SBTraitsSceneParticipantDelegate setCanDetermineActiveOrientation:](self->_secureAppTraitsParticipantDelegateHelper, "setCanDetermineActiveOrientation:", 1);
      v8 = self->_secureAppTraitsParticipantDelegateHelper;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEBBD0] + -5.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTraitsSceneParticipantDelegate setPreferredSceneLevel:](v8, "setPreferredSceneLevel:", v9);

      -[SBTraitsSceneParticipantDelegate setOrientationModeOverride:](self->_secureAppTraitsParticipantDelegateHelper, "setOrientationModeOverride:", 2);
      objc_initWeak(&location, self);
      v10 = self->_secureAppTraitsParticipantDelegateHelper;
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __92__SBCoverSheetSecureAppEnvironmentViewController__acquireSecureAppTraitsParticipantIfNeeded__block_invoke;
      v14 = &unk_1E8EA3840;
      objc_copyWeak(&v15, &location);
      -[SBTraitsSceneParticipantDelegate setActuateOrientationAlongsideBlock:](v10, "setActuateOrientationAlongsideBlock:", &v11);
      -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_secureAppTraitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("setup"), v11, v12, v13, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);

    }
  }
}

void __92__SBCoverSheetSecureAppEnvironmentViewController__acquireSecureAppTraitsParticipantIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_actuateTraitsParticipantResolution");

}

- (void)_invalidateTraitsParticipantAndDelegateHelper
{
  SBTraitsSceneParticipantDelegate *secureAppTraitsParticipantDelegateHelper;
  TRAParticipant *secureAppTraitsParticipant;

  -[TRAParticipant invalidate](self->_secureAppTraitsParticipant, "invalidate");
  -[SBTraitsSceneParticipantDelegate invalidate](self->_secureAppTraitsParticipantDelegateHelper, "invalidate");
  secureAppTraitsParticipantDelegateHelper = self->_secureAppTraitsParticipantDelegateHelper;
  self->_secureAppTraitsParticipantDelegateHelper = 0;

  secureAppTraitsParticipant = self->_secureAppTraitsParticipant;
  self->_secureAppTraitsParticipant = 0;

}

- (void)_actuateTraitsParticipantResolution
{
  int64_t v3;
  void *v4;
  void *v5;
  BSInvalidatable *secureAppViewController;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = -[TRAParticipant sbf_currentOrientation](self->_secureAppTraitsParticipant, "sbf_currentOrientation");
  -[SBCoverSheetSecureAppEnvironmentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", v3, 1, 0, 0.0);

  secureAppViewController = self->_secureAppViewController;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fixedCoordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[BSInvalidatable setHostedAppReferenceSize:withInterfaceOrientation:](secureAppViewController, "setHostedAppReferenceSize:withInterfaceOrientation:", v3, v8, v9);

}

- (id)_traitsArbiter
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[BSInvalidatable applicationSceneHandle](self->_secureAppViewController, "applicationSceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowSceneForDisplayIdentity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "traitsArbiter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetSecureAppEnvironmentViewController.m"), 229, CFSTR("Unexpected nil window scene"));

    v8 = 0;
  }

  return v8;
}

- (void)updateOrientationSceneSettingsForParticipant:(id)a3
{
  -[SBTraitsSceneParticipantDelegate updateOrientationSceneSettingsForParticipant:](self->_secureAppTraitsParticipantDelegateHelper, "updateOrientationSceneSettingsForParticipant:", a3);
}

- (BOOL)needsActuationForUpdateReasons:(int64_t)a3
{
  return -[SBTraitsSceneParticipantDelegate needsActuationForUpdateReasons:](self->_secureAppTraitsParticipantDelegateHelper, "needsActuationForUpdateReasons:", a3);
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  SBTraitsSceneParticipantDelegate *secureAppTraitsParticipantDelegateHelper;
  id v5;

  secureAppTraitsParticipantDelegateHelper = self->_secureAppTraitsParticipantDelegateHelper;
  v5 = a4;
  -[SBTraitsSceneParticipantDelegate updatePreferencesWithUpdater:](secureAppTraitsParticipantDelegateHelper, "updatePreferencesWithUpdater:", v5);
  objc_msgSend(v5, "updateOrientationPreferencesWithBlock:", &__block_literal_global_208);

}

void __90__SBCoverSheetSecureAppEnvironmentViewController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  char v4;
  id v5;

  v5 = a2;
  v3 = __sb__runningInSpringBoard();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {
      objc_msgSend(v5, "setSupportedOrientations:", 2);
LABEL_8:

      goto LABEL_9;
    }
LABEL_5:
    objc_msgSend(v5, "setSupportedOrientations:", objc_msgSend(v5, "supportedOrientations"));
    if ((v4 & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (SBFEffectiveDeviceClass() == 2)
    goto LABEL_5;
  objc_msgSend(v5, "setSupportedOrientations:", 2);
LABEL_9:

}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  SBTraitsSceneParticipantDelegate *secureAppTraitsParticipantDelegateHelper;
  id v5;

  secureAppTraitsParticipantDelegateHelper = self->_secureAppTraitsParticipantDelegateHelper;
  objc_msgSend(a4, "orientationActuationContext", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBTraitsSceneParticipantDelegate actuateOrientationSettingsWithContext:](secureAppTraitsParticipantDelegateHelper, "actuateOrientationSettingsWithContext:", v5);

}

- (id)participantAssociatedWindows:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SBCoverSheetSecureAppEnvironmentViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBCoverSheetSecureAppEnvironmentViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v13 = a4;
  v8 = a5;
  -[SBCoverSheetSecureAppEnvironmentViewController participantAssociatedSceneIdentityTokens:](self, "participantAssociatedSceneIdentityTokens:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "bs_map:", &__block_literal_global_33_2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __110__SBCoverSheetSecureAppEnvironmentViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2;
    v14[3] = &unk_1E8E9E820;
    v15 = v13;
    v16 = v11;
    v12 = v11;
    objc_msgSend(v15, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Associated Scenes"), v8, v14);

  }
}

uint64_t __110__SBCoverSheetSecureAppEnvironmentViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringRepresentation");
}

uint64_t __110__SBCoverSheetSecureAppEnvironmentViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(a1 + 40), CFSTR("Associated Scene Tokens"), 0);
}

- (id)participantAssociatedSceneIdentityTokens:(id)a3
{
  return -[SBTraitsSceneParticipantDelegate participantAssociatedSceneIdentityTokens:](self->_secureAppTraitsParticipantDelegateHelper, "participantAssociatedSceneIdentityTokens:", a3);
}

- (BOOL)contentOccludesBackground
{
  return 1;
}

- (BOOL)canHostAnApp
{
  return -[BSInvalidatable canHostAnApp](self->_secureAppViewController, "canHostAnApp");
}

- (BOOL)isHostingAnApp
{
  return -[BSInvalidatable isHostingAnApp](self->_secureAppViewController, "isHostingAnApp");
}

- (id)hostedAppSceneHandle
{
  return (id)-[BSInvalidatable hostedAppSceneHandle](self->_secureAppViewController, "hostedAppSceneHandle");
}

- (id)hostedAppSceneHandles
{
  return (id)-[BSInvalidatable hostedAppSceneHandles](self->_secureAppViewController, "hostedAppSceneHandles");
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  -[BSInvalidatable hostedAppWillRotateToInterfaceOrientation:](self->_secureAppViewController, "hostedAppWillRotateToInterfaceOrientation:", a3);
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  return 0;
}

- (id)traitsParticipantForSceneHandle:(id)a3
{
  BSInvalidatable *secureAppViewController;
  id v5;
  id v6;
  TRAParticipant *v7;

  secureAppViewController = self->_secureAppViewController;
  v5 = a3;
  -[BSInvalidatable applicationSceneHandle](secureAppViewController, "applicationSceneHandle");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    v7 = self->_secureAppTraitsParticipant;
  else
    v7 = 0;
  return v7;
}

- (void)secureAppOfTypeDidTakeNewAssertion:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SecureApp of type: %lu took new assertion", (uint8_t *)&v6, 0xCu);
  }

  -[SBCoverSheetSecureAppEnvironmentViewController _updateSupportedOrientationsMaskForSecureAppAction](self, "_updateSupportedOrientationsMaskForSecureAppAction");
}

- (void)requestHomeGestureOwnership
{
  void *v3;
  void *v4;
  SBAudioCategoryZStackPolicyAssistant *v5;
  SBAudioCategoryZStackPolicyAssistant *audioCategoryZStackPolicyAssistant;
  SBPhysicalButtonZStackPolicyAssistant *v7;
  SBPhysicalButtonZStackPolicyAssistant *physicalButtonZStackPolicyAssistant;
  SBSystemApertureZStackPolicyAssistant *v9;
  SBSystemApertureZStackPolicyAssistant *systemApertureZStackPolicyAssistant;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SBCoverSheetSecureAppEnvironmentViewController zStackParticipant](self, "zStackParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SBCoverSheetSecureAppEnvironmentViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v5 = (SBAudioCategoryZStackPolicyAssistant *)-[SBAudioCategoryZStackPolicyAssistant initWithDelegate:]((id *)[SBAudioCategoryZStackPolicyAssistant alloc], self);
    audioCategoryZStackPolicyAssistant = self->_audioCategoryZStackPolicyAssistant;
    self->_audioCategoryZStackPolicyAssistant = v5;

    v7 = (SBPhysicalButtonZStackPolicyAssistant *)-[SBPhysicalButtonZStackPolicyAssistant initWithDelegate:]((id *)[SBPhysicalButtonZStackPolicyAssistant alloc], self);
    physicalButtonZStackPolicyAssistant = self->_physicalButtonZStackPolicyAssistant;
    self->_physicalButtonZStackPolicyAssistant = v7;

    v9 = (SBSystemApertureZStackPolicyAssistant *)-[SBSystemApertureZStackPolicyAssistant initWithDelegate:]((id *)[SBSystemApertureZStackPolicyAssistant alloc], self);
    systemApertureZStackPolicyAssistant = self->_systemApertureZStackPolicyAssistant;
    self->_systemApertureZStackPolicyAssistant = v9;

    -[SBCoverSheetSecureAppEnvironmentViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
    objc_msgSend(v14, "_sbWindowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zStackResolver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "acquireParticipantWithIdentifier:delegate:", 7, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetSecureAppEnvironmentViewController setZStackParticipant:](self, "setZStackParticipant:", v13);

  }
}

- (void)relinquishHomeGesture
{
  void *v3;
  void *v4;

  -[SBCoverSheetSecureAppEnvironmentViewController zStackParticipant](self, "zStackParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBCoverSheetSecureAppEnvironmentViewController zStackParticipant](self, "zStackParticipant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SBCoverSheetSecureAppEnvironmentViewController setZStackParticipant:](self, "setZStackParticipant:", 0);
  }
}

- (id)_currentSecureAppAction
{
  void *v2;
  void *v3;

  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secureAppAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateSupportedOrientationsMaskForSecureAppAction
{
  void *v3;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  unint64_t v6;
  unint64_t currentOrientationMask;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _BYTE v33[128];
  _QWORD v34[8];

  v34[6] = *MEMORY[0x1E0C80C00];
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleSecureApp")) & 1) == 0)
  {
    -[SBCoverSheetSecureAppEnvironmentViewController _currentSecureAppAction](self, "_currentSecureAppAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "specifiesSupportedInterfaceOrientations"))
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __100__SBCoverSheetSecureAppEnvironmentViewController__updateSupportedOrientationsMaskForSecureAppAction__block_invoke;
      v32[3] = &unk_1E8EB26D0;
      v32[4] = self;
      v5 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v32);
      v6 = objc_msgSend(v4, "supportedInterfaceOrientations");
      currentOrientationMask = self->_currentOrientationMask;
      v8 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "orientation");

      v11 = v5[2](v5, v8);
      v12 = v5[2](v5, v10);
      if (v6 != currentOrientationMask || v11 == 0 || v12 == 0)
      {
        self->_currentOrientationMask = v6;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v34[2] = v17;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v34[3] = v18;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v34[4] = v19;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34[5] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v29 != v25)
                objc_enumerationMutation(v22);
              v27 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "integerValue", (_QWORD)v28);
              if (v5[2](v5, v27))
              {
                objc_msgSend((id)SBApp, "_setDeviceOrientation:animated:logMessage:", v27, 0, CFSTR("[SBCSSecureAppEnvironmentVC] rotating device to match full screen secure app supported orientations."));
                objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:logMessage:", v27, CFSTR("[SBCSSecureAppEnvironmentVC] rotating native orientation to match full screen secure app supported orientations."));
                goto LABEL_22;
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
            if (v24)
              continue;
            break;
          }
        }
LABEL_22:

      }
    }

  }
}

BOOL __100__SBCoverSheetSecureAppEnvironmentViewController__updateSupportedOrientationsMaskForSecureAppAction__block_invoke(uint64_t a1, char a2)
{
  return (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 976) & (1 << a2)) != 0;
}

- (void)_updateIdleWarnModeForAlwaysOnEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  int v6;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "secureAppEnvironmentViewControllerShouldEnableIdleWarning:alwaysOnEnabled:", self, v3);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[BSInvalidatable setOverrideIdleWarnMode:](self->_secureAppViewController, "setOverrideIdleWarnMode:", v6 ^ 1u);
}

- (id)_hostableEntityPresenter
{
  BSInvalidatable *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = self->_secureAppViewController;
  else
    v3 = 0;
  return v3;
}

- (void)zStackParticipantDidChange:(id)a3
{
  -[SBCoverSheetSecureAppEnvironmentViewController updateHomeGrabberHiddenAssertion:](self, "updateHomeGrabberHiddenAssertion:", 1);
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  objc_msgSend(v5, "setActivationPolicyForParticipantsBelow:", 2);
  objc_msgSend(v5, "setSuppressSystemApertureForSystemChromeSuppression:", -[_SBLoadApplicationResult isSuccess]((_BOOL8)self->_systemApertureZStackPolicyAssistant));
  -[SBHomeScreenConfigurationServer connections]((uint64_t)self->_systemApertureZStackPolicyAssistant);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssociatedBundleIdentifiersToSuppressInSystemAperture:", v6);

  -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)self->_systemApertureZStackPolicyAssistant);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssociatedSceneIdentifiersToSuppressInSystemAperture:", v7);

  -[SBHomeScreenConfigurationServer authenticator]((uint64_t)self->_audioCategoryZStackPolicyAssistant);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioCategoriesDisablingVolumeHUD:", v8);

  -[SBHomeScreenConfigurationServer authenticator]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhysicalButtonSceneTargets:", v9);

  -[SBHomeScreenConfigurationServer queue]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCaptureButtonFullFidelityEventRequestingScenes:", v10);

  -[SBHomeScreenConfigurationServer connections]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForegroundCaptureSceneTargets:", v11);

}

- (void)audioCategoryZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("audioCategoryZStackPolicyAssistantDidChange"));
}

- (void)physicalButtonZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("physicalButtonZStackPolicyAssistantDidChange"));
}

- (void)systemApertureZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("systemApertureZStackPolicyAssistantDidChange"));
}

- (void)_updateZStackPolicyAssistants
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  -[SBCoverSheetSecureAppEnvironmentViewController _hostableEntityPresenter](self, "_hostableEntityPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  if (v3)
  {
    objc_msgSend(v3, "sceneHandleForTraitsParticipant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_opt_class();
      v6 = v4;
      if (v5)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
      }
      else
      {
        v7 = 0;
      }
      v14 = v7;

      if (v14)
      {
        objc_msgSend(v19, "homeGrabberViewForTraitsParticipant");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v14, v15);

      }
      objc_msgSend(v6, "sceneIfExists");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v19, "sceneForTraitsParticipant");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v13;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v13);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    -[SBAudioCategoryZStackPolicyAssistant setForegroundScenes:]((id *)&self->_audioCategoryZStackPolicyAssistant->super.isa, v16);
    -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)self->_physicalButtonZStackPolicyAssistant, v16);
    goto LABEL_29;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BSInvalidatable appView](self->_secureAppViewController, "appView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "homeGrabberView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSInvalidatable applicationSceneHandle](self->_secureAppViewController, "applicationSceneHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      v11 = v9;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v16 = v12;

    }
    else
    {
      v8 = 0;
      v16 = 0;
    }
    -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v16, v8);
    objc_msgSend(v16, "sceneIfExists");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    -[SBAudioCategoryZStackPolicyAssistant setForegroundScenes:]((id *)&self->_audioCategoryZStackPolicyAssistant->super.isa, v18);
    -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)self->_physicalButtonZStackPolicyAssistant, v18);

LABEL_29:
  }

}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  -[SBCoverSheetSecureAppEnvironmentViewController _updateIdleWarnModeForAlwaysOnEnabled:](self, "_updateIdleWarnModeForAlwaysOnEnabled:", a4);
}

- (void)updateHomeGrabberHiddenAssertion:(BOOL)a3
{
  _BOOL8 v3;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BSInvalidatable appView](self->_secureAppViewController, "appView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "homeGrabberView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);
      objc_msgSend(v7, "setPointerClickDelegate:", self);
      if (-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture"))
        -[SBCoverSheetSecureAppEnvironmentViewController relinquishHiddenAssertionForHomeGrabber:animated:](self, "relinquishHiddenAssertionForHomeGrabber:animated:", v7, v3);
      else
        -[SBCoverSheetSecureAppEnvironmentViewController takeHiddenAssertionForHomeGrabber:animated:](self, "takeHiddenAssertionForHomeGrabber:animated:", v7, v3);
      -[SBCoverSheetSecureAppEnvironmentViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "secureAppEnvironmentViewControllerOwnsHomeGestureDidChange");

      v6 = v9;
    }

  }
}

- (void)takeHiddenAssertionForHomeGrabber:(id)a3 animated:(BOOL)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a4)
  {
    v4 = (void *)MEMORY[0x1E0DA9E28];
    v5 = a3;
    objc_msgSend(v4, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hideForHomeGestureOwnershipAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "BSAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setHidden:forReason:withAnimationSettings:", 1, CFSTR("SBCoverSheetSecureAppEnvironmentViewController"), v8);
  }
  else
  {
    objc_msgSend(a3, "setHidden:forReason:withAnimationSettings:", 1, CFSTR("SBCoverSheetSecureAppEnvironmentViewController"), 0);
  }
  objc_msgSend(a3, "setHomeAffordanceInteractionEnabled:", 0);

}

- (void)relinquishHiddenAssertionForHomeGrabber:(id)a3 animated:(BOOL)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a4)
  {
    v4 = (void *)MEMORY[0x1E0DA9E28];
    v5 = a3;
    objc_msgSend(v4, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unhideForHomeGestureOwnershipAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "BSAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setHidden:forReason:withAnimationSettings:", 0, CFSTR("SBCoverSheetSecureAppEnvironmentViewController"), v8);
  }
  else
  {
    objc_msgSend(a3, "setHidden:forReason:withAnimationSettings:", 0, CFSTR("SBCoverSheetSecureAppEnvironmentViewController"), 0);
  }
  objc_msgSend(a3, "setHomeAffordanceInteractionEnabled:", 1);

}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  double result;

  objc_msgSend(a3, "suggestedEdgeSpacing");
  return result;
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  id v3;

  if (-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture", a3))
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unlockUIFromSource:withOptions:", 15, MEMORY[0x1E0C9AA70]);

  }
}

- (BSInvalidatable)secureAppViewController
{
  return self->_secureAppViewController;
}

- (SBCoverSheetSecureAppEnvironmentViewControllerDelegate)delegate
{
  return (SBCoverSheetSecureAppEnvironmentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureAppViewController, 0);
  objc_storeStrong((id *)&self->_systemApertureZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_physicalButtonZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_audioCategoryZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_secureAppTraitsParticipantDelegateHelper, 0);
  objc_storeStrong((id *)&self->_secureAppTraitsParticipant, 0);
  objc_storeStrong((id *)&self->_biometricMatchingAssertion, 0);
}

- (void)viewWillAppear:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "%@ acquired PreArmCaptureOnly assertion: %@");
}

- (void)viewWillDisappear:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "%@ released PreArmCaptureOnly assertion: %@");
}

@end
