@implementation SBTraitsContinuityDisplayPipelineManager

- (SBTraitsContinuityDisplayPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5
{
  SBTraitsContinuityDisplayPipelineManager *v5;
  SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *v6;
  SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *rolesAndDefaultPoliciesProvider;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBTraitsContinuityDisplayPipelineManager;
  v5 = -[SBTraitsPipelineManager initWithArbiter:sceneDelegate:userInterfaceStyleProvider:](&v9, sel_initWithArbiter_sceneDelegate_userInterfaceStyleProvider_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider);
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
  SBTraitsOrientationSupportTreeNodesSpecifier *v11;
  SBTraitsOrientationSupportTreeNodesSpecifier *orientationTreeNodesSpecifier;
  SBTraitsOrientationDefaultTreeResolver *v13;
  void *v14;
  SBTraitsUserInterfaceStyleDefaultResolver *v15;
  TRAParticipant *v16;
  TRAParticipant *activeOrientationParticipant;
  TRAParticipant *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "inputsValidationStage");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[SBTraitsInputsValidator initWithValidatorOrder:]([SBTraitsInputsAllUnknownOrientationValidator alloc], "initWithValidatorOrder:", &unk_1E91D19E8);
    objc_msgSend(v23, "addInputsValidator:update:", v5, 0);

    objc_msgSend(v4, "zOrderResolutionStage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBTraitsZOrderStageComponent initWithComponentOrder:]([SBTraitsZOrderDefaultResolver alloc], "initWithComponentOrder:", &unk_1E91D19E8);
    objc_msgSend(v6, "addStageResolver:", v7);

    objc_msgSend(v4, "orientationResolutionStage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBTraitsOrientationDefaultResolutionPolicySpecifier initWithComponentOrder:dataSource:]([SBTraitsOrientationDefaultResolutionPolicySpecifier alloc], "initWithComponentOrder:dataSource:", &unk_1E91D19E8, self->_rolesAndDefaultPoliciesProvider);
    objc_msgSend(v8, "addResolutionPolicySpecifier:update:", v9, 0);

    v10 = -[SBTraitsOrientationStageComponent initWithComponentOrder:]([SBTraitsOrientationDefaultTreeNodesSpecifier alloc], "initWithComponentOrder:", &unk_1E91D19E8);
    objc_msgSend(v8, "addNodesSpecificationsSpecifier:", v10);

    v11 = -[SBTraitsOrientationStageComponent initWithComponentOrder:]([SBTraitsOrientationSupportTreeNodesSpecifier alloc], "initWithComponentOrder:", &unk_1E91D1A00);
    orientationTreeNodesSpecifier = self->_orientationTreeNodesSpecifier;
    self->_orientationTreeNodesSpecifier = v11;

    objc_msgSend(v8, "addNodesSpecificationsSpecifier:", self->_orientationTreeNodesSpecifier);
    v13 = -[SBTraitsOrientationDefaultTreeResolver initWithComponentOrder:]([SBTraitsOrientationDefaultTreeResolver alloc], "initWithComponentOrder:", &unk_1E91D19E8);
    objc_msgSend(v8, "addStageResolver:", v13);

    objc_msgSend(v4, "userInterfaceStyleResolutionStage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBTraitsUserInterfaceStyleStageComponent initWithComponentOrder:]([SBTraitsUserInterfaceStyleDefaultResolver alloc], "initWithComponentOrder:", &unk_1E91D19E8);
    objc_msgSend(v14, "addStageResolver:", v15);

    objc_msgSend(v4, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRolePipelineManager"), self);
    v16 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();

    activeOrientationParticipant = self->_activeOrientationParticipant;
    self->_activeOrientationParticipant = v16;

    v18 = self->_activeOrientationParticipant;
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-Setup"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRAParticipant setNeedsUpdatePreferencesWithReason:](v18, "setNeedsUpdatePreferencesWithReason:", v22);

    -[TRAParticipant updatePreferencesIfNeeded](self->_activeOrientationParticipant, "updatePreferencesIfNeeded");
  }
}

- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SBTraitsContinuityDisplayPipelineManager _updateInputsForCurrentUserInterfaceStyle](self, "_updateInputsForCurrentUserInterfaceStyle");
  -[SBTraitsContinuityDisplayPipelineManager _noteInputsNeedUpdateWithAnimationSettings:fence:reason:](self, "_noteInputsNeedUpdateWithAnimationSettings:fence:reason:", v7, v6, CFSTR("User Interface Style Update"));

}

- (BOOL)supportsLiveDeviceRotation
{
  return 1;
}

- (TRAArbitrationInputs)inputs
{
  TRAArbitrationInputs *inputs;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  TRAArbitrationInputs *v11;
  TRAArbitrationInputs *v12;

  inputs = self->_inputs;
  if (!inputs)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC08B8]);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithIsPad:", objc_msgSend(v5, "userInterfaceIdiom") == 1);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A8]), "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", 1, 1);
    v8 = objc_alloc(MEMORY[0x1E0DC08C8]);
    -[SBTraitsPipelineManager userInterfaceStyleProvider](self, "userInterfaceStyleProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUserInterfaceStyle:", objc_msgSend(v9, "currentStyle"));

    v11 = (TRAArbitrationInputs *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08B0]), "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", v6, v10, v7, 0, 0);
    v12 = self->_inputs;
    self->_inputs = v11;

    inputs = self->_inputs;
  }
  return inputs;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  id v4;

  if (self->_currentDeviceOrientation != a3)
  {
    self->_currentDeviceOrientation = a3;
    -[SBTraitsContinuityDisplayPipelineManager _updateInputsForDeviceOrientation:](self, "_updateInputsForDeviceOrientation:");
    -[SBTraitsPipelineManager defaultOrientationAnimationSettingsAnimatable:](self, "defaultOrientationAnimationSettingsAnimatable:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBTraitsContinuityDisplayPipelineManager _noteInputsNeedUpdateWithAnimationSettings:fence:reason:](self, "_noteInputsNeedUpdateWithAnimationSettings:fence:reason:", v4, 0, CFSTR("Device orientation update"));

  }
}

- (id)zOrderStageRoles
{
  return -[SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider orientationStageRoles](self->_rolesAndDefaultPoliciesProvider, "orientationStageRoles");
}

- (id)orientationStageRoles
{
  return -[SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider orientationStageRoles](self->_rolesAndDefaultPoliciesProvider, "orientationStageRoles");
}

- (id)ambientPresentationStageRoles
{
  return -[SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider ambientPresentationStageRoles](self->_rolesAndDefaultPoliciesProvider, "ambientPresentationStageRoles");
}

- (id)userInterfaceStyleStageRoles
{
  return -[SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider userInterfaceStyleStageRoles](self->_rolesAndDefaultPoliciesProvider, "userInterfaceStyleStageRoles");
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "updateZOrderLevelPreferencesWithBlock:", &__block_literal_global_304);
  objc_msgSend(v4, "updateOrientationPreferencesWithBlock:", &__block_literal_global_82_1);

}

uint64_t __84__SBTraitsContinuityDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredZOrderLevel:", 1.79769313e308);
}

uint64_t __84__SBTraitsContinuityDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportedOrientations:", 30);
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  unint64_t v21;
  SBTraitsContinuityDisplayPipelineManager *v22;
  id v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[SBTraitsOrientationSupportTreeNodesSpecifier supportedOrientations](self->_orientationTreeNodesSpecifier, "supportedOrientations");
  v7 = objc_msgSend(v5, "currentOrientation");
  v25 = objc_msgSend(v5, "previousOrientation");
  if (v7 != v25 || self->_currentSupportedInterfaceOrientations != v6)
  {
    -[SBTraitsPipelineManager sceneDelegate](self, "sceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7 != v25)
    {
      v20 = (void *)v9;
      v21 = v6;
      v22 = self;
      v23 = v5;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(MEMORY[0x1E0CEA950], "screens");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v16, "displayIdentity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "isContinuityDisplay"))
            {
              v18 = objc_opt_respondsToSelector();

              if ((v18 & 1) != 0)
              {
                objc_msgSend((id)SBApp, "noteActiveInterfaceOrientationWillChangeToOrientation:screen:", v7, v16);
                objc_msgSend((id)SBApp, "noteActiveInterfaceOrientationDidChangeToOrientation:willAnimateWithSettings:fromOrientation:screen:", v7, v24, v25, v16);
              }
            }
            else
            {

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v13);
      }

      v10 = v20;
      objc_msgSend(v20, "displayLayoutPublisher");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setInterfaceOrientation:", v7);

      self = v22;
      v5 = v23;
      v6 = v21;
    }
    self->_currentSupportedInterfaceOrientations = v6;
    objc_msgSend(v8, "setInterfaceOrientation:supportedInterfaceOrientations:", v7, v6);

  }
}

- (void)_updateInputsForDeviceOrientation:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TRAArbitrationInputs *v9;
  TRAArbitrationInputs *inputs;
  id v11;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A8]), "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", a3, a3);
  v4 = objc_alloc(MEMORY[0x1E0DC08B0]);
  -[TRAArbitrationInputs interfaceIdiomInputs](self->_inputs, "interfaceIdiomInputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRAArbitrationInputs userInterfaceStyleInputs](self->_inputs, "userInterfaceStyleInputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRAArbitrationInputs keyboardInputs](self->_inputs, "keyboardInputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRAArbitrationInputs ambientPresentationInputs](self->_inputs, "ambientPresentationInputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (TRAArbitrationInputs *)objc_msgSend(v4, "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", v5, v6, v11, v7, v8);
  inputs = self->_inputs;
  self->_inputs = v9;

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
  v18[2] = __100__SBTraitsContinuityDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke;
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

void __100__SBTraitsContinuityDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[ContinuityPipeline] %{public}@ updating inputs with animation settings: %{public}@ fence: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08E8]), "initWithAnimationSettings:drawingFence:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setOrientationActuationContext:", v8);
  objc_msgSend(v3, "setUserInterfaceStyleActuationContext:", v8);
  objc_msgSend(v3, "setReason:", *(_QWORD *)(a1 + 48));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeOrientationParticipant, 0);
  objc_storeStrong((id *)&self->_orientationTreeNodesSpecifier, 0);
  objc_storeStrong((id *)&self->_rolesAndDefaultPoliciesProvider, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
