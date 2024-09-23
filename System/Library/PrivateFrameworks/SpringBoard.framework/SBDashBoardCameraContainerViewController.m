@implementation SBDashBoardCameraContainerViewController

- (SBDashBoardCameraContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBDashBoardCameraContainerViewController *v4;
  CSHostedEntityViewController *v5;
  CSHostedEntityViewController *hostedEntityViewController;
  id *v7;
  SBAudioCategoryZStackPolicyAssistant *audioCategoryZStackPolicyAssistant;
  id *v9;
  SBPhysicalButtonZStackPolicyAssistant *physicalButtonZStackPolicyAssistant;
  id *v11;
  SBSystemApertureZStackPolicyAssistant *systemApertureZStackPolicyAssistant;
  uint64_t v13;
  SBUIBiometricResource *biometricResource;
  uint64_t v15;
  SBFAuthenticationAssertionProviding *authenticationAssertionProvider;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBDashBoardCameraContainerViewController;
  v4 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (CSHostedEntityViewController *)objc_alloc_init(MEMORY[0x1E0D1BBD0]);
    hostedEntityViewController = v4->_hostedEntityViewController;
    v4->_hostedEntityViewController = v5;

    -[CSHostedEntityViewController setEntityPresenterDelegate:](v4->_hostedEntityViewController, "setEntityPresenterDelegate:", v4);
    -[CSHostedEntityViewController setPresenter:](v4->_hostedEntityViewController, "setPresenter:", v4);
    v7 = -[SBAudioCategoryZStackPolicyAssistant initWithDelegate:]((id *)[SBAudioCategoryZStackPolicyAssistant alloc], v4);
    audioCategoryZStackPolicyAssistant = v4->_audioCategoryZStackPolicyAssistant;
    v4->_audioCategoryZStackPolicyAssistant = (SBAudioCategoryZStackPolicyAssistant *)v7;

    v9 = -[SBPhysicalButtonZStackPolicyAssistant initWithDelegate:]((id *)[SBPhysicalButtonZStackPolicyAssistant alloc], v4);
    physicalButtonZStackPolicyAssistant = v4->_physicalButtonZStackPolicyAssistant;
    v4->_physicalButtonZStackPolicyAssistant = (SBPhysicalButtonZStackPolicyAssistant *)v9;

    v11 = -[SBSystemApertureZStackPolicyAssistant initWithDelegate:]((id *)[SBSystemApertureZStackPolicyAssistant alloc], v4);
    systemApertureZStackPolicyAssistant = v4->_systemApertureZStackPolicyAssistant;
    v4->_systemApertureZStackPolicyAssistant = (SBSystemApertureZStackPolicyAssistant *)v11;

    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    biometricResource = v4->_biometricResource;
    v4->_biometricResource = (SBUIBiometricResource *)v13;

    objc_msgSend((id)SBApp, "authenticationController");
    v15 = objc_claimAutoreleasedReturnValue();
    authenticationAssertionProvider = v4->_authenticationAssertionProvider;
    v4->_authenticationAssertionProvider = (SBFAuthenticationAssertionProviding *)v15;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFAuthenticationAssertion invalidate](self->_sustainAuthenticationAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardCameraContainerViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v3, sel_dealloc);
}

- (CSHostableEntity)hostedEntity
{
  return (CSHostableEntity *)-[CSHostedEntityViewController hostedEntity](self->_hostedEntityViewController, "hostedEntity");
}

- (void)setHostedEntity:(id)a3
{
  -[CSHostedEntityViewController setHostedEntity:](self->_hostedEntityViewController, "setHostedEntity:", a3);
}

- (NSSet)actionsToDeliverToHostableEntity
{
  return (NSSet *)-[CSHostedEntityViewController actionsToDeliverToHostableEntity](self->_hostedEntityViewController, "actionsToDeliverToHostableEntity");
}

- (void)setActionsToDeliverToHostableEntity:(id)a3
{
  -[CSHostedEntityViewController setActionsToDeliverToHostableEntity:](self->_hostedEntityViewController, "setActionsToDeliverToHostableEntity:", a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  SBTraitsOrientedContentViewController *v5;
  SBTraitsOrientedContentViewController *orientedContentViewController;
  void *v7;
  void *v8;
  SBTraitsOrientedContentViewController *v9;
  CSHostedEntityViewController *hostedEntityViewController;
  uint64_t v11;
  id v12;
  id v13;
  SBTraitsOrientedContentViewController *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SBDashBoardCameraContainerViewController *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBDashBoardCameraContainerViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v25, sel_viewDidLoad);
  -[SBDashBoardCameraContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc_init(SBTraitsOrientedContentViewController);
  orientedContentViewController = self->_orientedContentViewController;
  self->_orientedContentViewController = v5;

  -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSHostedEntityViewController view](self->_hostedEntityViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_orientedContentViewController;
  hostedEntityViewController = self->_hostedEntityViewController;
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__SBDashBoardCameraContainerViewController_viewDidLoad__block_invoke;
  v22[3] = &unk_1E8E9EA00;
  v23 = v8;
  v12 = v3;
  v24 = v12;
  v13 = v8;
  -[SBTraitsOrientedContentViewController bs_addChildViewController:animated:transitionBlock:](v9, "bs_addChildViewController:animated:transitionBlock:", hostedEntityViewController, 0, v22);
  v14 = self->_orientedContentViewController;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __55__SBDashBoardCameraContainerViewController_viewDidLoad__block_invoke_2;
  v18[3] = &unk_1E8EA3268;
  v19 = v12;
  v20 = v7;
  v21 = self;
  v15 = v7;
  v16 = v12;
  -[SBDashBoardCameraContainerViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v14, 0, v18);
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAllowsGroupOpacity:", 1);

}

void __55__SBDashBoardCameraContainerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void (**v5)(void);

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "setAutoresizingMask:", 18);
  v5[2]();

}

void __55__SBDashBoardCameraContainerViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
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
  void *v13;
  void *v14;
  void (**v15)(void);

  v3 = *(void **)(a1 + 32);
  v15 = a2;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");
  v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_referenceBoundsForBounds:", v5, v7, v9, v11);
  objc_msgSend(v12, "setContentViewBoundsInReferenceSpace:");
  objc_msgSend(*(id *)(a1 + 40), "setAutoresizingMask:", 18);
  v13 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1040), "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentView:", v14);

  v15[2]();
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  SBFAuthenticationAssertionProviding *authenticationAssertionProvider;
  void *v6;
  SBFAuthenticationAssertion *v7;
  SBFAuthenticationAssertion *sustainAuthenticationAssertion;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBDashBoardCameraContainerViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[SBDashBoardCameraContainerViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
  -[CSHostedEntityViewController setHostableEntityContentMode:](self->_hostedEntityViewController, "setHostableEntityContentMode:", 2);
  if (!self->_sustainAuthenticationAssertion)
  {
    SBLogDashBoard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "SBDashBoardCameraContainerViewController - taking sustain auth assertion", v9, 2u);
    }

    authenticationAssertionProvider = self->_authenticationAssertionProvider;
    -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFAuthenticationAssertionProviding createKeybagUnlockAssertionWithReason:](authenticationAssertionProvider, "createKeybagUnlockAssertionWithReason:", v6);
    v7 = (SBFAuthenticationAssertion *)objc_claimAutoreleasedReturnValue();
    sustainAuthenticationAssertion = self->_sustainAuthenticationAssertion;
    self->_sustainAuthenticationAssertion = v7;

    -[SBFAuthenticationAssertion activate](self->_sustainAuthenticationAssertion, "activate");
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCameraContainerViewController;
  -[SBDashBoardCameraContainerViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[SBDashBoardCameraContainerViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCameraContainerViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SBDashBoardCameraContainerViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  SBFAuthenticationAssertion *sustainAuthenticationAssertion;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardCameraContainerViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[CSHostedEntityViewController setHostableEntityContentMode:](self->_hostedEntityViewController, "setHostableEntityContentMode:", 1);
  if (self->_sustainAuthenticationAssertion)
  {
    SBLogDashBoard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "SBDashBoardCameraContainerViewController - relinquishing sustain auth assertion", v6, 2u);
    }

    -[SBFAuthenticationAssertion invalidate](self->_sustainAuthenticationAssertion, "invalidate");
    sustainAuthenticationAssertion = self->_sustainAuthenticationAssertion;
    self->_sustainAuthenticationAssertion = 0;

  }
  -[SBDashBoardCameraContainerViewController _invalidateTraitsParticipant](self, "_invalidateTraitsParticipant");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SBTraitsOrientedContentViewController *orientedContentViewController;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBDashBoardCameraContainerViewController;
  -[SBDashBoardCameraContainerViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v13, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  orientedContentViewController = self->_orientedContentViewController;
  v8 = objc_opt_class();
  v9 = v6;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v11, "traitsParticipant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBTraitsOrientedContentViewController setContainerParticipant:](orientedContentViewController, "setContainerParticipant:", v12);
  if (v9)
    -[SBDashBoardCameraContainerViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
  else
    -[CSHostedEntityViewController setHostableEntityContentMode:](self->_hostedEntityViewController, "setHostableEntityContentMode:", 1);

}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraContainerViewController;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v5, sel_aggregateBehavior_, v4);
  objc_msgSend(v4, "unionBehavior:", self->_hostedEntityViewController);
  if (-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport"))
    objc_msgSend(v4, "addRestrictedCapabilities:", 8);

}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraContainerViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v5, sel_aggregateAppearance_, v4);
  objc_msgSend(v4, "unionAppearance:", self->_hostedEntityViewController, v5.receiver, v5.super_class);

}

- (void)aggregatePresentation:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraContainerViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregatePresentation:](&v5, sel_aggregatePresentation_, v4);
  objc_msgSend(v4, "unionPresentation:", self->_hostedEntityViewController, v5.receiver, v5.super_class);

}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return -[CSHostedEntityViewController wouldHandleButtonEvent:](self->_hostedEntityViewController, "wouldHandleButtonEvent:", a3);
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardCameraContainerViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v7, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0
    || -[CSHostedEntityViewController handleEvent:](self->_hostedEntityViewController, "handleEvent:", v4))
  {
    v5 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canHostAnApp
{
  return -[CSHostedEntityViewController canHostAnApp](self->_hostedEntityViewController, "canHostAnApp");
}

- (BOOL)isHostingAnApp
{
  return -[CSHostedEntityViewController isHostingAnApp](self->_hostedEntityViewController, "isHostingAnApp");
}

- (id)hostedAppSceneHandle
{
  return (id)-[CSHostedEntityViewController hostedAppSceneHandle](self->_hostedEntityViewController, "hostedAppSceneHandle");
}

- (id)hostedAppSceneHandles
{
  return (id)-[CSHostedEntityViewController hostedAppSceneHandles](self->_hostedEntityViewController, "hostedAppSceneHandles");
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  return -[CSHostedEntityViewController handlesRotationIndependentOfCoverSheet](self->_hostedEntityViewController, "handlesRotationIndependentOfCoverSheet");
}

- (void)audioCategoryZStackPolicyAssistantDidChange:(id)a3
{
  id v3;

  -[SBDashBoardCameraContainerViewController _presentingDismissableModalViewController](self, "_presentingDismissableModalViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateZStackPreferencesWithReason:", CFSTR("audioCategoryZStackPolicyAssistantDidChange"));

}

- (void)physicalButtonZStackPolicyAssistantDidChange:(id)a3
{
  id v3;

  -[SBDashBoardCameraContainerViewController _presentingDismissableModalViewController](self, "_presentingDismissableModalViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateZStackPreferencesWithReason:", CFSTR("physicalButtonZStackPolicyAssistantDidChange"));

}

- (void)systemApertureZStackPolicyAssistantDidChange:(id)a3
{
  id v3;

  -[SBDashBoardCameraContainerViewController _presentingDismissableModalViewController](self, "_presentingDismissableModalViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateZStackPreferencesWithReason:", CFSTR("systemApertureZStackPolicyAssistantDidChange"));

}

- (void)addGrabberView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = objc_opt_class();
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
    -[CSHostedEntityViewController setHomeGrabberView:](self->_hostedEntityViewController, "setHomeGrabberView:", v7);

}

- (BOOL)wantsDefaultModalDismissalBehavior
{
  return 1;
}

- (void)dismissableModalViewController:(id)a3 updateZStackPreferences:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if ((-[SBDashBoardCameraContainerViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared") & 1) == 0)
  {
    objc_msgSend(v11, "setSuppressSystemApertureForSystemChromeSuppression:", -[_SBLoadApplicationResult isSuccess]((_BOOL8)self->_systemApertureZStackPolicyAssistant));
    -[SBHomeScreenConfigurationServer connections]((uint64_t)self->_systemApertureZStackPolicyAssistant);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssociatedBundleIdentifiersToSuppressInSystemAperture:", v5);

    -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)self->_systemApertureZStackPolicyAssistant);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssociatedSceneIdentifiersToSuppressInSystemAperture:", v6);

    -[SBHomeScreenConfigurationServer authenticator]((uint64_t)self->_audioCategoryZStackPolicyAssistant);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAudioCategoriesDisablingVolumeHUD:", v7);

    -[SBHomeScreenConfigurationServer authenticator]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPhysicalButtonSceneTargets:", v8);

    -[SBHomeScreenConfigurationServer queue]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCaptureButtonFullFidelityEventRequestingScenes:", v9);

    -[SBHomeScreenConfigurationServer connections]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setForegroundCaptureSceneTargets:", v10);

  }
}

- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[SBDashBoardCameraContainerViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))-[SBDashBoardCameraContainerViewController _acquireTraitsParticipantIfNeeded](self, "_acquireTraitsParticipantIfNeeded");
  objc_msgSend(v9, "sceneHandleForTraitsParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v9, "sceneForTraitsParticipant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v7, "setContentViewBoundsInReferenceSpace:");

  -[SBDashBoardCameraContainerViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
}

- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    -[CSHostedEntityViewController hostedEntity](self->_hostedEntityViewController, "hostedEntity");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v6)
    {
      -[SBDashBoardCameraContainerViewController _invalidateTraitsParticipant](self, "_invalidateTraitsParticipant");
      -[SBDashBoardCameraContainerViewController _updateZStackPolicyAssistants](self, "_updateZStackPolicyAssistants");
    }
  }

}

- (id)_presentingDismissableModalViewController
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[CSCoverSheetViewControllerBase _presenter](self, "_presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)_updateZStackPolicyAssistants
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CSHostedEntityViewController sceneHandleForTraitsParticipant](self->_hostedEntityViewController, "sceneHandleForTraitsParticipant");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v3 = objc_opt_class();
    v4 = v11;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v7 = v5;

    if (v7)
    {
      -[CSHostedEntityViewController homeGrabberView](self->_hostedEntityViewController, "homeGrabberView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v7, v8);

    }
    objc_msgSend(v4, "sceneIfExists");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CSHostedEntityViewController sceneForTraitsParticipant](self->_hostedEntityViewController, "sceneForTraitsParticipant");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[SBAudioCategoryZStackPolicyAssistant setForegroundScenes:]((id *)&self->_audioCategoryZStackPolicyAssistant->super.isa, v10);
  -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)self->_physicalButtonZStackPolicyAssistant, v10);

}

- (void)_acquireTraitsParticipantIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SBTraitsSceneParticipantDelegate *v7;
  SBTraitsSceneParticipantDelegate *traitsParticipantDelegate;
  void *v9;
  SBTraitsSceneParticipantDelegate *v10;
  SBTraitsSceneParticipantDelegate *v11;
  TRAParticipant *v12;
  TRAParticipant *traitsParticipant;
  SBTraitsSceneParticipantDelegate *v14;
  void *v15;
  void *v16;
  SBTraitsOrientedContentViewController *orientedContentViewController;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  SBTraitsSceneParticipantDelegate *v24;
  uint64_t v25;
  SBTraitsOrientedContentViewController *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;

  if (!self->_traitsParticipant)
  {
    -[SBDashBoardCameraContainerViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[SBDashBoardCameraContainerViewController _traitsArbiter](self, "_traitsArbiter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSHostedEntityViewController sceneHandleForTraitsParticipant](self->_hostedEntityViewController, "sceneHandleForTraitsParticipant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = -[SBTraitsSceneParticipantDelegate initWithSceneHandle:]([SBTraitsSceneParticipantDelegate alloc], "initWithSceneHandle:", v6);
        traitsParticipantDelegate = self->_traitsParticipantDelegate;
        self->_traitsParticipantDelegate = v7;

      }
      else
      {
        -[CSHostedEntityViewController sceneForTraitsParticipant](self->_hostedEntityViewController, "sceneForTraitsParticipant");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = -[SBTraitsSceneParticipantDelegate initWithScene:]([SBTraitsSceneParticipantDelegate alloc], "initWithScene:", v9);
          v11 = self->_traitsParticipantDelegate;
          self->_traitsParticipantDelegate = v10;

        }
      }
      if (self->_traitsParticipantDelegate)
      {
        objc_msgSend(v5, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleCoverSheetCamera"));
        v12 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
        traitsParticipant = self->_traitsParticipant;
        self->_traitsParticipant = v12;

        -[SBTraitsSceneParticipantDelegate setArbiter:](self->_traitsParticipantDelegate, "setArbiter:", v5);
        -[SBTraitsSceneParticipantDelegate setParticipant:](self->_traitsParticipantDelegate, "setParticipant:", self->_traitsParticipant);
        v14 = self->_traitsParticipantDelegate;
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "windowLevel");
        objc_msgSend(v15, "numberWithDouble:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTraitsSceneParticipantDelegate setPreferredSceneLevel:](v14, "setPreferredSceneLevel:", v16);

        -[SBTraitsOrientedContentViewController setContentParticipant:](self->_orientedContentViewController, "setContentParticipant:", self->_traitsParticipant);
        orientedContentViewController = self->_orientedContentViewController;
        v18 = objc_opt_class();
        v19 = v4;
        if (v18)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v19;
          else
            v20 = 0;
        }
        else
        {
          v20 = 0;
        }
        v21 = v20;

        objc_msgSend(v21, "traitsParticipant");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBTraitsOrientedContentViewController setContainerParticipant:](orientedContentViewController, "setContainerParticipant:", v22);
        -[SBTraitsOrientedContentViewController updateOrientationIfNeeded](self->_orientedContentViewController, "updateOrientationIfNeeded");
        -[SBTraitsOrientedContentViewController view](self->_orientedContentViewController, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setContentOrientation:", objc_msgSend(v23, "containerOrientation"));
        objc_initWeak(&location, self);
        v24 = self->_traitsParticipantDelegate;
        v25 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __77__SBDashBoardCameraContainerViewController__acquireTraitsParticipantIfNeeded__block_invoke;
        v29[3] = &unk_1E8EA3840;
        objc_copyWeak(&v30, &location);
        -[SBTraitsSceneParticipantDelegate setActuateOrientationAlongsideBlock:](v24, "setActuateOrientationAlongsideBlock:", v29);
        v26 = self->_orientedContentViewController;
        v27[0] = v25;
        v27[1] = 3221225472;
        v27[2] = __77__SBDashBoardCameraContainerViewController__acquireTraitsParticipantIfNeeded__block_invoke_2;
        v27[3] = &unk_1E8EA3868;
        objc_copyWeak(&v28, &location);
        -[SBTraitsOrientedContentViewController setActuateAlongsideBlock:](v26, "setActuateAlongsideBlock:", v27);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);

      }
    }

  }
}

void __77__SBDashBoardCameraContainerViewController__acquireTraitsParticipantIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[131], "updateOrientationIfNeeded");
    WeakRetained = v2;
  }

}

void __77__SBDashBoardCameraContainerViewController__acquireTraitsParticipantIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id *WeakRetained;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained[130], "setHostedAppReferenceSize:withInterfaceOrientation:", a2, a3, a4);
    WeakRetained = v8;
  }

}

- (void)_invalidateTraitsParticipant
{
  SBTraitsSceneParticipantDelegate *traitsParticipantDelegate;
  TRAParticipant *traitsParticipant;

  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  -[SBTraitsSceneParticipantDelegate invalidate](self->_traitsParticipantDelegate, "invalidate");
  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  self->_traitsParticipantDelegate = 0;

  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

}

- (id)_traitsArbiter
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBDashBoardCameraContainerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitsArbiter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardCameraContainerViewController.m"), 398, CFSTR("Unexpected nil window"));
    v7 = 0;
  }

  return v7;
}

- (CGRect)_referenceBoundsForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetHeight(a3);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v8 = CGRectGetWidth(v13);
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  if (v7 >= v8)
    v10 = v7;
  else
    v10 = v8;
  v11 = x;
  v12 = y;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sustainAuthenticationAssertion, 0);
  objc_storeStrong((id *)&self->_authenticationAssertionProvider, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_systemApertureZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_physicalButtonZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_audioCategoryZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_orientedContentViewController, 0);
  objc_storeStrong((id *)&self->_hostedEntityViewController, 0);
}

@end
