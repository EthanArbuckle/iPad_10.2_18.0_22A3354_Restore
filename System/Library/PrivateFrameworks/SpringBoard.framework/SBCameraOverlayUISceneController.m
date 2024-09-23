@implementation SBCameraOverlayUISceneController

+ (id)_setupInfo
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[9];
  _QWORD v9[10];

  v9[9] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("class");
  v9[0] = objc_opt_class();
  v8[1] = CFSTR("enabled");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  if (CAMIsCameraOverlayAvailable())
    v3 = CAMIsCameraOverlayEnabled();
  else
    v3 = 0;
  objc_msgSend(v2, "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v9[2] = MEMORY[0x1E0C9AAA0];
  v8[2] = CFSTR("isDaemon");
  v8[3] = CFSTR("jobLabel");
  v9[3] = CFSTR("com.apple.CameraOverlayAngel");
  v8[4] = CFSTR("hostLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEBBD0] + 255.0 + 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  v9[5] = &unk_1E91D0D40;
  v8[5] = CFSTR("presentationStyle");
  v8[6] = CFSTR("traitsRole");
  v9[6] = CFSTR("SBTraitsParticipantRoleSystemUIScene");
  v9[7] = &unk_1E91D0D58;
  v8[7] = CFSTR("vendingStrategy");
  v8[8] = CFSTR("workspaceID");
  v9[8] = CFSTR("com.apple.SpringBoard.SceneWorkspace.CameraOverlayUI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDefaultPresenter:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBCameraOverlayUISceneController;
  -[SBSystemUISceneController setDefaultPresenter:](&v5, sel_setDefaultPresenter_, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setPresentingDelegate:", self);

}

- (SBCameraOverlayUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8
{
  SBCameraOverlayUISceneController *v8;
  void *v9;
  uint64_t v10;
  SBPhysicalButtonSceneOverrideManager *physicalButtonOverrideManager;
  uint64_t v12;
  BSInvalidatable *physicalButtonOverrideObserver;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBCameraOverlayUISceneController;
  v8 = -[SBSystemUISceneController initWithSceneWorkspaceIdentifier:clientProcessIdentity:sceneVendingPolicy:traitsRole:jobLabel:level:](&v15, sel_initWithSceneWorkspaceIdentifier_clientProcessIdentity_sceneVendingPolicy_traitsRole_jobLabel_level_, a3, a4, a5, a6, a7, a8);
  if (v8)
  {
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "physicalButtonSceneOverrideManager");
    v10 = objc_claimAutoreleasedReturnValue();
    physicalButtonOverrideManager = v8->_physicalButtonOverrideManager;
    v8->_physicalButtonOverrideManager = (SBPhysicalButtonSceneOverrideManager *)v10;

    -[SBPhysicalButtonSceneOverrideManager addObserver:forReason:]((id *)&v8->_physicalButtonOverrideManager->super.isa, (uint64_t)v8, (uint64_t)CFSTR("Camera Capture Overlay System UI Scene Controller"));
    v12 = objc_claimAutoreleasedReturnValue();
    physicalButtonOverrideObserver = v8->_physicalButtonOverrideObserver;
    v8->_physicalButtonOverrideObserver = (BSInvalidatable *)v12;

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  BSInvalidatable *physicalButtonOverrideObserver;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BSInvalidatable invalidate](self->_physicalButtonOverrideObserver, "invalidate");
  physicalButtonOverrideObserver = self->_physicalButtonOverrideObserver;
  self->_physicalButtonOverrideObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBCameraOverlayUISceneController;
  -[SBSystemUISceneController dealloc](&v5, sel_dealloc);
}

- (void)windowSceneDidConnect:(id)a3
{
  void *v4;
  SBFZStackParticipant *v5;
  SBFZStackParticipant *zStackParticipant;
  SBPhysicalButtonZStackPolicyAssistant *v7;
  SBPhysicalButtonZStackPolicyAssistant *zStackPhysicalButtonPolicyAssistant;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "isMainDisplayWindowScene") && !self->_zStackParticipant)
  {
    objc_msgSend(v9, "zStackResolver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "acquireParticipantWithIdentifier:delegate:", 21, self);
    v5 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
    zStackParticipant = self->_zStackParticipant;
    self->_zStackParticipant = v5;

    v7 = (SBPhysicalButtonZStackPolicyAssistant *)-[SBPhysicalButtonZStackPolicyAssistant initWithDelegate:]((id *)[SBPhysicalButtonZStackPolicyAssistant alloc], self);
    zStackPhysicalButtonPolicyAssistant = self->_zStackPhysicalButtonPolicyAssistant;
    self->_zStackPhysicalButtonPolicyAssistant = v7;

  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  SBPhysicalButtonZStackPolicyAssistant *zStackPhysicalButtonPolicyAssistant;
  SBFZStackParticipant *zStackParticipant;

  if (objc_msgSend(a3, "isMainDisplayWindowScene"))
  {
    zStackPhysicalButtonPolicyAssistant = self->_zStackPhysicalButtonPolicyAssistant;
    self->_zStackPhysicalButtonPolicyAssistant = 0;

    -[SBFZStackParticipant invalidate](self->_zStackParticipant, "invalidate");
    zStackParticipant = self->_zStackParticipant;
    self->_zStackParticipant = 0;

  }
}

- (void)scenePresenter:(id)a3 didPresentScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  SBSUIFeaturePolicyHostComponent *v18;
  SBSUIFeaturePolicyHostComponent *featurePolicyComponent;
  SBSUIFeaturePolicyHostComponent *v20;
  id v21;
  id v22;

  v22 = a3;
  v6 = a4;
  objc_msgSend(v6, "definition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uiSceneSessionRole");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "uiSceneSessionRole");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    v13 = objc_opt_class();
    objc_msgSend(v6, "componentForExtension:ofClass:", v13, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    v16 = v14;
    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    featurePolicyComponent = self->_featurePolicyComponent;
    self->_featurePolicyComponent = v18;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v20 = self->_featurePolicyComponent;
      v21 = v22;
      -[SBSUIFeaturePolicyHostComponent setDelegate:](v20, "setDelegate:", v21);
      objc_msgSend(v21, "featurePolicyHostComponentDidChangeShouldDisableReachability:", self->_featurePolicyComponent);

    }
  }

}

- (void)scenePresenter:(id)a3 willDismissScene:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  SBSUIFeaturePolicyHostComponent *featurePolicyComponent;
  id v11;

  objc_msgSend(a4, "definition", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiSceneSessionRole");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "uiSceneSessionRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "isEqual:", v8);

  if (v9)
  {
    -[SBSUIFeaturePolicyHostComponent setDelegate:](self->_featurePolicyComponent, "setDelegate:", 0);
    featurePolicyComponent = self->_featurePolicyComponent;
    self->_featurePolicyComponent = 0;

  }
}

- (id)_activeOverlayRequest
{
  return self->_activeOverlayRequester;
}

- (void)_setActiveOverlayRequest:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeOverlayRequester, a3);
    -[SBCameraOverlayUISceneController _updateActiveOverlayRequestSceneSettingsOnOverlayScene](self, "_updateActiveOverlayRequestSceneSettingsOnOverlayScene");
  }

}

- (void)_updateActiveOverlayRequestSceneSettingsOnOverlayScene
{
  id v3;
  _QWORD v4[5];

  -[SBSingleSceneController scene](self->_sceneController, "scene");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__SBCameraOverlayUISceneController__updateActiveOverlayRequestSceneSettingsOnOverlayScene__block_invoke;
  v4[3] = &unk_1E8EA2A30;
  v4[4] = self;
  objc_msgSend(v3, "updateSettingsWithBlock:", v4);

}

void __90__SBCameraOverlayUISceneController__updateActiveOverlayRequestSceneSettingsOnOverlayScene__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  v4 = a2;
  objc_msgSend(v3, "sceneRequestingOverlay");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayRequestingPID:", objc_msgSend(v6, "pid"));

  objc_msgSend(v11, "clientHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayRequestingBundleIdentifier:", v8);

  objc_msgSend(v11, "identityToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayRequestingSceneIdentityToken:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "auditTokenOfProcessRequestingOverlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayRequestingProcessAuditToken:", v10);

}

- (void)_activateSession:(id)a3
{
  SBSingleSceneController *sceneController;
  id v6;
  id v7;
  id v8;
  id v9;
  SBSingleSceneController *v10;
  SBSingleSceneController *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCameraOverlayUISceneController.m"), 172, CFSTR("Must have a target window scene."));

  }
  sceneController = self->_sceneController;
  if (!sceneController)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CEA948]);
    v7 = objc_alloc_init(MEMORY[0x1E0DAC468]);
    objc_msgSend(v6, "setSpecification:", v7);

    v8 = objc_alloc_init(MEMORY[0x1E0CEA788]);
    objc_msgSend(v8, "setDisablesReachability:", 1);
    objc_msgSend(v6, "setInitialClientSettings:", v8);
    v9 = -[SBSystemUISceneController _newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:](self, "_newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:", v13, v6);
    v10 = -[SBSystemUISceneController _newSceneControllerForWindowScene:withSceneRequestOptions:](self, "_newSceneControllerForWindowScene:withSceneRequestOptions:", v13, v9);
    v11 = self->_sceneController;
    self->_sceneController = v10;

    -[SBSingleSceneController setShouldBeKeptActiveWhileForeground:](self->_sceneController, "setShouldBeKeptActiveWhileForeground:", 1);
    -[SBSingleSceneController setSceneActive:](self->_sceneController, "setSceneActive:", 1);
    -[SBCameraOverlayUISceneController _updateActiveOverlayRequestSceneSettingsOnOverlayScene](self, "_updateActiveOverlayRequestSceneSettingsOnOverlayScene");
    -[SBCameraOverlayUISceneController _updateForegroundScenes](self, "_updateForegroundScenes");

    sceneController = self->_sceneController;
  }
  -[SBSingleSceneController setHidden:](sceneController, "setHidden:", 0);

}

- (void)_updateForegroundScenes
{
  SBPhysicalButtonZStackPolicyAssistant *zStackPhysicalButtonPolicyAssistant;
  SBSingleSceneController *sceneController;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  zStackPhysicalButtonPolicyAssistant = self->_zStackPhysicalButtonPolicyAssistant;
  sceneController = self->_sceneController;
  if (sceneController)
  {
    -[SBSingleSceneController scene](sceneController, "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)zStackPhysicalButtonPolicyAssistant, v5);

  }
  else
  {
    -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)zStackPhysicalButtonPolicyAssistant, MEMORY[0x1E0C9AA60]);
  }
}

- (void)_resetSceneRequiringOverlay
{
  -[SBCameraOverlayUISceneController _setSceneRequiringOverlay:](self, "_setSceneRequiringOverlay:", 0);
  -[SBCameraOverlayUISceneController physicalButtonSceneOverridesDidChange:](self, "physicalButtonSceneOverridesDidChange:", self->_physicalButtonOverrideManager);
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setActivationPolicyForParticipantsBelow:", 0);
  -[SBHomeScreenConfigurationServer queue]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCaptureButtonFullFidelityEventRequestingScenes:", v6);

}

- (void)physicalButtonZStackPolicyAssistantDidChange:(id)a3
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("physicalButtonZStackPolicyAssistantDidChange"));
}

- (void)physicalButtonSceneOverridesDidChange:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  _SBCameraOverlayRequest *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "cameraBehaviorSceneEligibleForSupplementalUI");
  objc_msgSend(v13, "cameraBehaviorScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "auditTokenForRequestingProcessOfCameraBehaviorScene");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4 && v5 && v6)
  {
    -[SBCameraOverlayUISceneController _sceneRequiringOverlay](self, "_sceneRequiringOverlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualObjects();

    if ((v9 & 1) == 0)
    {
      v10 = -[_SBCameraOverlayRequest initWithObservation:]([_SBCameraOverlayRequest alloc], "initWithObservation:", v13);
      -[SBCameraOverlayUISceneController _setActiveOverlayRequest:](self, "_setActiveOverlayRequest:", v10);

      -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "targetWindowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBCameraOverlayUISceneController _activateSession:](self, "_activateSession:", v12);
    }
  }
  else
  {
    -[SBCameraOverlayUISceneController _setActiveOverlayRequest:](self, "_setActiveOverlayRequest:", 0);
  }

}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 processIdentity:(id)a4 completion:(id)a5
{
  SBSingleSceneController *sceneController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCameraOverlayUISceneController;
  -[SBSystemUISceneController destroyScenesWithPersistentIdentifiers:processIdentity:completion:](&v7, sel_destroyScenesWithPersistentIdentifiers_processIdentity_completion_, a3, a4, a5);
  sceneController = self->_sceneController;
  self->_sceneController = 0;

  -[SBCameraOverlayUISceneController _updateForegroundScenes](self, "_updateForegroundScenes");
  -[SBCameraOverlayUISceneController _resetSceneRequiringOverlay](self, "_resetSceneRequiringOverlay");
}

- (FBScene)_sceneRequiringOverlay
{
  return self->__sceneRequiringOverlay;
}

- (void)_setSceneRequiringOverlay:(id)a3
{
  objc_storeStrong((id *)&self->__sceneRequiringOverlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sceneRequiringOverlay, 0);
  objc_storeStrong((id *)&self->_featurePolicyComponent, 0);
  objc_storeStrong((id *)&self->_activeOverlayRequester, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideObserver, 0);
  objc_storeStrong((id *)&self->_zStackPhysicalButtonPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideManager, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
}

@end
