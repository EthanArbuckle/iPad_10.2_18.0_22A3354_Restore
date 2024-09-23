@implementation SBTraitsExternalDisplayPipelineManager

- (SBTraitsExternalDisplayPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5
{
  SBTraitsExternalDisplayPipelineManager *v5;
  SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider *v6;
  SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider *rolesAndDefaultPoliciesProvider;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBTraitsExternalDisplayPipelineManager;
  v5 = -[SBTraitsPipelineManager initWithArbiter:sceneDelegate:userInterfaceStyleProvider:](&v9, sel_initWithArbiter_sceneDelegate_userInterfaceStyleProvider_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider);
    rolesAndDefaultPoliciesProvider = v5->_rolesAndDefaultPoliciesProvider;
    v5->_rolesAndDefaultPoliciesProvider = v6;

  }
  return v5;
}

- (void)setupDefaultPipelineForArbiter:(id)a3
{
  id v4;
  SBTraitsInputsAllUnknownOrientationValidator *v5;
  void *v6;
  SBTraitsZOrderDefaultResolver *v7;
  void *v8;
  SBTraitsOrientationDefaultResolutionPolicySpecifier *v9;
  SBTraitsOrientationDefaultTreeNodesSpecifier *v10;
  SBTraitsOrientationDefaultTreeResolver *v11;
  void *v12;
  SBTraitsUserInterfaceStyleDefaultResolver *v13;
  TRAParticipant *v14;
  TRAParticipant *activeOrientationParticipant;
  TRAParticipant *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "inputsValidationStage");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[SBTraitsInputsValidator initWithValidatorOrder:]([SBTraitsInputsAllUnknownOrientationValidator alloc], "initWithValidatorOrder:", &unk_1E91D0C50);
    objc_msgSend(v21, "addInputsValidator:update:", v5, 0);

    objc_msgSend(v4, "zOrderResolutionStage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBTraitsZOrderStageComponent initWithComponentOrder:]([SBTraitsZOrderDefaultResolver alloc], "initWithComponentOrder:", &unk_1E91D0C50);
    objc_msgSend(v6, "addStageResolver:", v7);

    objc_msgSend(v4, "orientationResolutionStage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBTraitsOrientationDefaultResolutionPolicySpecifier initWithComponentOrder:dataSource:]([SBTraitsOrientationDefaultResolutionPolicySpecifier alloc], "initWithComponentOrder:dataSource:", &unk_1E91D0C50, self->_rolesAndDefaultPoliciesProvider);
    objc_msgSend(v8, "addResolutionPolicySpecifier:update:", v9, 0);

    v10 = -[SBTraitsOrientationStageComponent initWithComponentOrder:]([SBTraitsOrientationDefaultTreeNodesSpecifier alloc], "initWithComponentOrder:", &unk_1E91D0C50);
    objc_msgSend(v8, "addNodesSpecificationsSpecifier:", v10);

    v11 = -[SBTraitsOrientationDefaultTreeResolver initWithComponentOrder:]([SBTraitsOrientationDefaultTreeResolver alloc], "initWithComponentOrder:", &unk_1E91D0C50);
    objc_msgSend(v8, "addStageResolver:", v11);

    objc_msgSend(v4, "userInterfaceStyleResolutionStage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBTraitsUserInterfaceStyleStageComponent initWithComponentOrder:]([SBTraitsUserInterfaceStyleDefaultResolver alloc], "initWithComponentOrder:", &unk_1E91D0C50);
    objc_msgSend(v12, "addStageResolver:", v13);

    objc_msgSend(v4, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRolePipelineManager"), self);
    v14 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();

    activeOrientationParticipant = self->_activeOrientationParticipant;
    self->_activeOrientationParticipant = v14;

    v16 = self->_activeOrientationParticipant;
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-Setup"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRAParticipant setNeedsUpdatePreferencesWithReason:](v16, "setNeedsUpdatePreferencesWithReason:", v20);

    -[TRAParticipant updatePreferencesIfNeeded](self->_activeOrientationParticipant, "updatePreferencesIfNeeded");
  }
}

- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SBTraitsExternalDisplayPipelineManager _updateInputsForCurrentUserInterfaceStyle](self, "_updateInputsForCurrentUserInterfaceStyle");
  -[SBTraitsExternalDisplayPipelineManager _noteInputsNeedUpdateWithAnimationSettings:fence:reason:](self, "_noteInputsNeedUpdateWithAnimationSettings:fence:reason:", v7, v6, CFSTR("User Interface Style Update"));

}

- (BOOL)supportsLiveDeviceRotation
{
  return 0;
}

- (TRAArbitrationInputs)inputs
{
  TRAArbitrationInputs *inputs;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  TRAArbitrationInputs *v14;
  TRAArbitrationInputs *v15;

  inputs = self->_inputs;
  if (!inputs)
  {
    -[SBTraitsPipelineManager sceneDelegate](self, "sceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "interfaceOrientation");

    v7 = objc_alloc(MEMORY[0x1E0DC08B8]);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIsPad:", objc_msgSend(v8, "userInterfaceIdiom") == 1);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A8]), "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", v6, v6);
    v11 = objc_alloc(MEMORY[0x1E0DC08C8]);
    -[SBTraitsPipelineManager userInterfaceStyleProvider](self, "userInterfaceStyleProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithUserInterfaceStyle:", objc_msgSend(v12, "currentStyle"));

    v14 = (TRAArbitrationInputs *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08B0]), "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", v9, v13, v10, 0, 0);
    v15 = self->_inputs;
    self->_inputs = v14;

    inputs = self->_inputs;
  }
  return inputs;
}

- (id)zOrderStageRoles
{
  return -[SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider orientationStageRoles](self->_rolesAndDefaultPoliciesProvider, "orientationStageRoles");
}

- (id)orientationStageRoles
{
  return -[SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider orientationStageRoles](self->_rolesAndDefaultPoliciesProvider, "orientationStageRoles");
}

- (id)ambientPresentationStageRoles
{
  return -[SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider ambientPresentationStageRoles](self->_rolesAndDefaultPoliciesProvider, "ambientPresentationStageRoles");
}

- (id)userInterfaceStyleStageRoles
{
  return -[SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider userInterfaceStyleStageRoles](self->_rolesAndDefaultPoliciesProvider, "userInterfaceStyleStageRoles");
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "updateZOrderLevelPreferencesWithBlock:", &__block_literal_global_144);
  objc_msgSend(v4, "updateOrientationPreferencesWithBlock:", &__block_literal_global_18_0);

}

uint64_t __82__SBTraitsExternalDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredZOrderLevel:", 1.79769313e308);
}

uint64_t __82__SBTraitsExternalDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportedOrientations:", 30);
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

  if (v6)
  {
    v7 = objc_msgSend(v11, "currentOrientation");
    if (v7 != objc_msgSend(v11, "previousOrientation"))
    {
      -[SBTraitsPipelineManager sceneDelegate](self, "sceneDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "windowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayLayoutPublisher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setInterfaceOrientation:", v7);

    }
  }

}

- (void)_updateInputsForCurrentUserInterfaceStyle
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TRAArbitrationInputs *v10;
  TRAArbitrationInputs *inputs;
  id v12;

  v3 = objc_alloc(MEMORY[0x1E0DC08C8]);
  -[SBTraitsPipelineManager userInterfaceStyleProvider](self, "userInterfaceStyleProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "initWithUserInterfaceStyle:", objc_msgSend(v4, "currentStyle"));

  v5 = objc_alloc(MEMORY[0x1E0DC08B0]);
  -[TRAArbitrationInputs interfaceIdiomInputs](self->_inputs, "interfaceIdiomInputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRAArbitrationInputs deviceOrientationInputs](self->_inputs, "deviceOrientationInputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRAArbitrationInputs keyboardInputs](self->_inputs, "keyboardInputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRAArbitrationInputs ambientPresentationInputs](self->_inputs, "ambientPresentationInputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (TRAArbitrationInputs *)objc_msgSend(v5, "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", v6, v12, v7, v8, v9);
  inputs = self->_inputs;
  self->_inputs = v10;

}

- (void)_noteInputsNeedUpdateWithAnimationSettings:(id)a3 fence:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  SEL v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[SBTraitsPipelineManager arbiter](self, "arbiter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0DC0898]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__SBTraitsExternalDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke;
  v18[3] = &unk_1E8EAC1F8;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = a2;
  v14 = v11;
  v15 = v10;
  v17 = v9;
  v16 = (void *)objc_msgSend(v13, "initWithBuilder:", v18);
  objc_msgSend(v12, "setNeedsUpdateArbitrationWithContext:", v16);

}

void __98__SBTraitsExternalDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogTraitsArbiter();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[ExternalPipeline] %{public}@ updating inputs with animation settings: %{public}@ fence: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08E8]), "initWithAnimationSettings:drawingFence:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setOrientationActuationContext:", v8);
  objc_msgSend(v3, "setUserInterfaceStyleActuationContext:", v8);
  objc_msgSend(v3, "setReason:", *(_QWORD *)(a1 + 48));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeOrientationParticipant, 0);
  objc_storeStrong((id *)&self->_rolesAndDefaultPoliciesProvider, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
