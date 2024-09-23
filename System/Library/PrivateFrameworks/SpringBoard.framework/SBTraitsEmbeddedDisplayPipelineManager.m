@implementation SBTraitsEmbeddedDisplayPipelineManager

- (void)arbiter:(id)a3 willBeginUpdateWithContext:(id)a4
{
  ++self->_arbiterRunningUpdatesCount;
}

- (TRAArbitrationInputs)inputs
{
  return self->_inputs;
}

- (void)arbiter:(id)a3 didCompleteUpdateWithContext:(id)a4
{
  unint64_t v4;
  void *v5;
  id v6;

  v4 = self->_arbiterRunningUpdatesCount - 1;
  self->_arbiterRunningUpdatesCount = v4;
  if (!v4)
  {
    objc_msgSend(a4, "orientationActuationContext", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "drawingFence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

  }
}

- (void)_updateOrientationInputsDeferralAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[SBTraitsEmbeddedDisplayPipelineManager _isBacklightOn](self, "_isBacklightOn");
  v6 = !v5 | -[SBDeviceOrientationUpdateManager isCurrentlyDeferringOrientationUpdates](self->_systemOrientationLockManager, "isCurrentlyDeferringOrientationUpdates");
  -[SBTraitsInputsOrientationLockValidator setPrefersDeferringOrientationUpdates:](self->_orientationLockInputsValidator, "setPrefersDeferringOrientationUpdates:", v6);
  if ((v6 & 1) == 0)
    -[SBTraitsEmbeddedDisplayPipelineManager _noteInputsNeedUpdateAnimated:reason:](self, "_noteInputsNeedUpdateAnimated:reason:", v3, CFSTR("Stop deferring orientation inputs updates."));
}

- (id)defaultOrientationAnimationSettingsAnimatable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v7;

  v3 = a3;
  if (-[SBTraitsEmbeddedDisplayPipelineManager _isBacklightOn](self, "_isBacklightOn"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SBTraitsEmbeddedDisplayPipelineManager;
    -[SBTraitsPipelineManager defaultOrientationAnimationSettingsAnimatable:](&v7, sel_defaultOrientationAnimationSettingsAnimatable_, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_isBacklightOn
{
  return self->_backlightIsOn;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SBSwitcherLayoutTransitionNotes *v9;
  void *v10;
  SBSwitcherLayoutTransitionNotes *v11;
  void *v12;
  SBTraitsDockFollowsHomePolicySpecifier *dockFollowsHomeSpecifier;
  void *v14;
  SBTraitsControlCenterInIsolationPolicySpecifier *controlCenterIsolationSpecifier;
  void *v16;
  SBTraitsHomeInIsolationPolicySpecifier *homeIsolationSpecifier;
  SBTraitsHomeFollowsSwitcherRawPolicySpecifier *v18;
  SBTraitsHomeFollowsSwitcherRawPolicySpecifier *homeFollowsSwitcherSpecifier;
  void *v20;
  void *v21;
  SBTraitsHomeFollowsSwitcherRawPolicySpecifier *v22;
  void *v23;
  SBTraitsHomeInIsolationPolicySpecifier *v24;
  id v25;

  v5 = a4;
  -[SBTraitsPipelineManager arbiter](self, "arbiter");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationTransitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [SBSwitcherLayoutTransitionNotes alloc];
  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBSwitcherLayoutTransitionNotes initWithFromPreviousState:currentLayoutState:transitionRequest:](v9, "initWithFromPreviousState:currentLayoutState:transitionRequest:", v6, v7, v10);

  if (self->_dockFollowsHomeSpecifier)
  {
    objc_msgSend(v25, "orientationResolutionStage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeResolutionPolicySpecifier:", self->_dockFollowsHomeSpecifier);

    dockFollowsHomeSpecifier = self->_dockFollowsHomeSpecifier;
    self->_dockFollowsHomeSpecifier = 0;

  }
  if (self->_controlCenterIsolationSpecifier)
  {
    objc_msgSend(v25, "orientationResolutionStage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeResolutionPolicySpecifier:", self->_controlCenterIsolationSpecifier);

    controlCenterIsolationSpecifier = self->_controlCenterIsolationSpecifier;
    self->_controlCenterIsolationSpecifier = 0;

  }
  if (-[SBSwitcherLayoutTransitionNotes inAnySwitcher](v11, "inAnySwitcher")
    || -[SBSwitcherLayoutTransitionNotes inApp](v11, "inApp"))
  {
    if (self->_homeIsolationSpecifier)
    {
      objc_msgSend(v25, "orientationResolutionStage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeResolutionPolicySpecifier:", self->_homeIsolationSpecifier);

      homeIsolationSpecifier = self->_homeIsolationSpecifier;
      self->_homeIsolationSpecifier = 0;

    }
    if (!self->_homeFollowsSwitcherSpecifier)
    {
      v18 = -[SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier initWithComponentOrder:]([SBTraitsHomeFollowsSwitcherRawPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0AD0);
      homeFollowsSwitcherSpecifier = self->_homeFollowsSwitcherSpecifier;
      self->_homeFollowsSwitcherSpecifier = v18;

      objc_msgSend(v25, "orientationResolutionStage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addResolutionPolicySpecifier:animate:", self->_homeFollowsSwitcherSpecifier, 0);

    }
  }
  else if (-[SBSwitcherLayoutTransitionNotes inHomeScreen](v11, "inHomeScreen"))
  {
    if (self->_homeFollowsSwitcherSpecifier)
    {
      objc_msgSend(v25, "orientationResolutionStage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeResolutionPolicySpecifier:", self->_homeFollowsSwitcherSpecifier);

      v22 = self->_homeFollowsSwitcherSpecifier;
      self->_homeFollowsSwitcherSpecifier = 0;

    }
    if (self->_homeIsolationSpecifier)
    {
      objc_msgSend(v25, "orientationResolutionStage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeResolutionPolicySpecifier:", self->_homeIsolationSpecifier);

      v24 = self->_homeIsolationSpecifier;
      self->_homeIsolationSpecifier = 0;

    }
    if (-[SBSwitcherLayoutTransitionNotes stableInHomeScreen](v11, "stableInHomeScreen"))
      -[SBTraitsEmbeddedDisplayPipelineManager _addLastNonFlatOverrideInputsValidatorIfNeeded](self, "_addLastNonFlatOverrideInputsValidatorIfNeeded");
  }

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SBSwitcherLayoutTransitionNotes *v9;
  void *v10;
  SBSwitcherLayoutTransitionNotes *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  SBTraitsDockFollowsHomePolicySpecifier *v15;
  SBTraitsDockFollowsHomePolicySpecifier *v16;
  void *v17;
  void *v18;
  void *homeFollowsSwitcherSpecifier;
  SBTraitsHomeFollowsSwitcherRawPolicySpecifier *v20;
  SBTraitsHomeFollowsSwitcherRawPolicySpecifier *v21;
  void *v22;
  SBTraitsHomeInIsolationPolicySpecifier *v23;
  SBTraitsHomeInIsolationPolicySpecifier *homeIsolationSpecifier;
  SBTraitsDockFollowsHomePolicySpecifier *v25;
  SBTraitsDockFollowsHomePolicySpecifier *dockFollowsHomeSpecifier;
  void *v27;
  SBTraitsControlCenterInIsolationPolicySpecifier *v28;
  SBTraitsControlCenterInIsolationPolicySpecifier *controlCenterIsolationSpecifier;
  void *v30;
  id v31;

  v5 = a4;
  -[SBTraitsPipelineManager arbiter](self, "arbiter");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationTransitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [SBSwitcherLayoutTransitionNotes alloc];
  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBSwitcherLayoutTransitionNotes initWithFromPreviousState:currentLayoutState:transitionRequest:](v9, "initWithFromPreviousState:currentLayoutState:transitionRequest:", v6, v7, v10);

  v12 = -[SBSwitcherLayoutTransitionNotes fromHomeScreen](v11, "fromHomeScreen");
  v13 = -[SBSwitcherLayoutTransitionNotes inApp](v11, "inApp");
  v14 = v13;
  if (!v12)
  {
    if (!-[SBSwitcherLayoutTransitionNotes inHomeScreen](v11, "inHomeScreen"))
      goto LABEL_20;
    if (self->_homeFollowsSwitcherSpecifier)
    {
      if (-[SBSwitcherLayoutTransitionNotes isHomeButtonInitiated](v11, "isHomeButtonInitiated"))
      {
        objc_msgSend(v31, "orientationResolutionStage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeResolutionPolicySpecifier:animate:", self->_homeFollowsSwitcherSpecifier, 0);

        homeFollowsSwitcherSpecifier = self->_homeFollowsSwitcherSpecifier;
        self->_homeFollowsSwitcherSpecifier = 0;
      }
      else
      {
        if (self->_homeIsolationSpecifier)
          goto LABEL_18;
        v23 = -[SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier initWithComponentOrder:]([SBTraitsHomeInIsolationPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0AD0);
        homeIsolationSpecifier = self->_homeIsolationSpecifier;
        self->_homeIsolationSpecifier = v23;

        objc_msgSend(v31, "orientationResolutionStage");
        homeFollowsSwitcherSpecifier = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(homeFollowsSwitcherSpecifier, "addResolutionPolicySpecifier:animate:", self->_homeIsolationSpecifier, 0);
      }

    }
LABEL_18:
    if (!self->_dockFollowsHomeSpecifier)
    {
      v25 = -[SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier initWithComponentOrder:]([SBTraitsDockFollowsHomePolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0AE8);
      dockFollowsHomeSpecifier = self->_dockFollowsHomeSpecifier;
      self->_dockFollowsHomeSpecifier = v25;

      objc_msgSend(v31, "orientationResolutionStage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addResolutionPolicySpecifier:", self->_dockFollowsHomeSpecifier);

    }
LABEL_20:
    if (!-[SBSwitcherLayoutTransitionNotes fromApp](v11, "fromApp") || !v14)
      goto LABEL_23;
    goto LABEL_21;
  }
  if (v13 && !self->_dockFollowsHomeSpecifier)
  {
    v15 = -[SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier initWithComponentOrder:]([SBTraitsDockFollowsHomePolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0AE8);
    v16 = self->_dockFollowsHomeSpecifier;
    self->_dockFollowsHomeSpecifier = v15;

    objc_msgSend(v31, "orientationResolutionStage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addResolutionPolicySpecifier:", self->_dockFollowsHomeSpecifier);

  }
  if (-[SBSwitcherLayoutTransitionNotes inAnySwitcher](v11, "inAnySwitcher") && !self->_homeFollowsSwitcherSpecifier)
  {
    v20 = -[SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier initWithComponentOrder:]([SBTraitsHomeFollowsSwitcherRawPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0AD0);
    v21 = self->_homeFollowsSwitcherSpecifier;
    self->_homeFollowsSwitcherSpecifier = v20;

    objc_msgSend(v31, "orientationResolutionStage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addResolutionPolicySpecifier:animate:", self->_homeFollowsSwitcherSpecifier, 0);

    if (!v14)
      goto LABEL_8;
  }
  else if (!v14)
  {
LABEL_8:
    -[SBSwitcherLayoutTransitionNotes fromApp](v11, "fromApp");
    goto LABEL_23;
  }
LABEL_21:
  if (!self->_controlCenterIsolationSpecifier)
  {
    v28 = -[SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier initWithComponentOrder:]([SBTraitsControlCenterInIsolationPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0B18);
    controlCenterIsolationSpecifier = self->_controlCenterIsolationSpecifier;
    self->_controlCenterIsolationSpecifier = v28;

    objc_msgSend(v31, "orientationResolutionStage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addResolutionPolicySpecifier:update:", self->_controlCenterIsolationSpecifier, 0);

  }
LABEL_23:

}

- (void)_addLastNonFlatOverrideInputsValidatorIfNeeded
{
  SBTraitsInputsOrientationNonFlatOverrideValidator *v3;
  SBTraitsInputsOrientationNonFlatOverrideValidator *lastNonFlatOverrideInputsValidator;
  void *v5;
  id v6;

  if (!self->_lastNonFlatOverrideInputsValidator)
  {
    v3 = -[SBTraitsInputsValidator initWithValidatorOrder:]([SBTraitsInputsOrientationNonFlatOverrideValidator alloc], "initWithValidatorOrder:", &unk_1E91D0B48);
    lastNonFlatOverrideInputsValidator = self->_lastNonFlatOverrideInputsValidator;
    self->_lastNonFlatOverrideInputsValidator = v3;

    -[SBTraitsInputsOrientationNonFlatOverrideValidator setLastNonFlatOrientationOverride:](self->_lastNonFlatOverrideInputsValidator, "setLastNonFlatOrientationOverride:", -[TRAParticipant currentOrientation](self->_activeOrientationParticipant, "currentOrientation"));
    -[SBTraitsPipelineManager arbiter](self, "arbiter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputsValidationStage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addInputsValidator:", self->_lastNonFlatOverrideInputsValidator);

  }
}

void __98__SBTraitsEmbeddedDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[EmbeddedPipeline] %{public}@ updating inputs with animation settings: %{public}@ fence: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08E8]), "initWithAnimationSettings:drawingFence:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setOrientationActuationContext:", v8);
  objc_msgSend(v3, "setUserInterfaceStyleActuationContext:", v8);
  objc_msgSend(v3, "setReason:", *(_QWORD *)(a1 + 48));

}

- (void)_systemOrientationLockChanged:(id)a3
{
  -[SBTraitsEmbeddedDisplayPipelineManager _updateOrientationInputsDeferralAnimated:](self, "_updateOrientationInputsDeferralAnimated:", 1);
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "updateZOrderLevelPreferencesWithBlock:", &__block_literal_global_130);
  objc_msgSend(v4, "updateOrientationPreferencesWithBlock:", &__block_literal_global_85);

}

uint64_t __82__SBTraitsEmbeddedDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportedOrientations:", 30);
}

uint64_t __82__SBTraitsEmbeddedDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredZOrderLevel:", 1.79769313e308);
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SBTraitsInputsOrientationNonFlatOverrideValidator *lastNonFlatOverrideInputsValidator;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

  v7 = v25;
  if (v6)
  {
    -[TRAParticipant currentSettings](self->_activeOrientationParticipant, "currentSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orientationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "validatedOrientationInputs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "currentDeviceOrientation");

    -[TRAParticipant previousSettings](self->_activeOrientationParticipant, "previousSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "orientationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "validatedOrientationInputs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "currentDeviceOrientation");

    if (v11 != v15)
      -[SBDeviceOrientationUpdateManager _legacy_enqueueOrientationUpdateToDeviceOrientation:source:](self->_systemOrientationLockManager, "_legacy_enqueueOrientationUpdateToDeviceOrientation:source:", v11, CFSTR("pipeline manager"));
    v16 = objc_msgSend(v25, "sbf_currentOrientation");
    v17 = objc_msgSend(v25, "sbf_previousOrientation");
    v7 = v25;
    if (v16 != v17)
    {
      kdebug_trace();
      objc_msgSend(MEMORY[0x1E0CD28B0], "bs_performAfterCommit:", &__block_literal_global_90);
      lastNonFlatOverrideInputsValidator = self->_lastNonFlatOverrideInputsValidator;
      if (lastNonFlatOverrideInputsValidator)
        -[SBTraitsInputsOrientationNonFlatOverrideValidator setLastNonFlatOrientationOverride:](lastNonFlatOverrideInputsValidator, "setLastNonFlatOrientationOverride:", v16);
      +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:](SBAnimationUtilities, "animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:", v17, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (SBFIsIRDCResetAvailable())
      {
        objc_msgSend(v19, "duration");
        if (v20 > 0.0)
          CARenderServerFlushIRDC();
      }
      v21 = (void *)SBApp;
      objc_msgSend(v19, "duration");
      objc_msgSend(v21, "_legacy_noteInterfaceOrientationChanged:duration:updateMirroredDisplays:force:logMessage:", v16, 1, 1, CFSTR("SBTraitArbiterPipelineManager"));
      -[SBTraitsPipelineManager sceneDelegate](self, "sceneDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "windowScene");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "displayLayoutPublisher");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setInterfaceOrientation:", v16);

      v7 = v25;
    }
  }

}

uint64_t __82__SBTraitsEmbeddedDisplayPipelineManager_didChangeSettingsForParticipant_context___block_invoke()
{
  return kdebug_trace();
}

- (void)_noteInputsNeedUpdateAnimated:(BOOL)a3 reason:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBTraitsEmbeddedDisplayPipelineManager defaultOrientationAnimationSettingsAnimatable:](self, "defaultOrientationAnimationSettingsAnimatable:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBTraitsEmbeddedDisplayPipelineManager _noteInputsNeedUpdateWithAnimationSettings:fence:reason:](self, "_noteInputsNeedUpdateWithAnimationSettings:fence:reason:", v7, 0, v6);

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
  v18[2] = __98__SBTraitsEmbeddedDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke;
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

- (void)setKeyboardFocusContext:(id)a3
{
  id v4;
  SBTraitsInputsKeyboardFocusValidator *keyboardFocusInputsValidator;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SBTraitsInputsKeyboardFocusValidator *v12;
  SBTraitsInputsKeyboardFocusValidator *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBTraitsEmbeddedDisplayPipelineManager;
  -[SBTraitsPipelineManager setKeyboardFocusContext:](&v14, sel_setKeyboardFocusContext_, v4);
  keyboardFocusInputsValidator = self->_keyboardFocusInputsValidator;
  if (!keyboardFocusInputsValidator
    || (-[SBTraitsInputsKeyboardFocusValidator focusContext](keyboardFocusInputsValidator, "focusContext"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqual:", v4),
        v6,
        (v7 & 1) == 0))
  {
    -[SBTraitsPipelineManager arbiter](self, "arbiter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (self->_keyboardFocusInputsValidator)
    {
      if (!v4)
      {
        objc_msgSend(v8, "inputsValidationStage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeInputsValidator:", self->_keyboardFocusInputsValidator);

        v11 = self->_keyboardFocusInputsValidator;
        self->_keyboardFocusInputsValidator = 0;
LABEL_8:

      }
    }
    else if (v4)
    {
      v12 = objc_alloc_init(SBTraitsInputsKeyboardFocusValidator);
      v13 = self->_keyboardFocusInputsValidator;
      self->_keyboardFocusInputsValidator = v12;

      objc_msgSend(v9, "inputsValidationStage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addInputsValidator:", self->_keyboardFocusInputsValidator);
      goto LABEL_8;
    }
    -[SBTraitsInputsKeyboardFocusValidator setFocusContext:](self->_keyboardFocusInputsValidator, "setFocusContext:", v4);
    -[SBTraitsEmbeddedDisplayPipelineManager _noteInputsNeedUpdateAnimated:reason:](self, "_noteInputsNeedUpdateAnimated:reason:", 1, CFSTR("keyboard focus context changed"));

  }
}

- (SBTraitsEmbeddedDisplayPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBTraitsEmbeddedDisplayPipelineManager *v11;
  uint64_t v12;
  SBOrientationLockManager *userOrientationLockManager;
  uint64_t v14;
  SBDeviceOrientationUpdateManager *systemOrientationLockManager;
  SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *v16;
  SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *rolesAndDefaultPoliciesProvider;
  id v18;
  uint64_t v19;
  BSInvalidatable *stateCaptureInvalidatable;
  id v22;
  id location;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SBTraitsEmbeddedDisplayPipelineManager;
  v11 = -[SBTraitsPipelineManager initWithArbiter:sceneDelegate:userInterfaceStyleProvider:](&v24, sel_initWithArbiter_sceneDelegate_userInterfaceStyleProvider_, v8, v9, v10);
  if (v11)
  {
    +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    userOrientationLockManager = v11->_userOrientationLockManager;
    v11->_userOrientationLockManager = (SBOrientationLockManager *)v12;

    objc_msgSend((id)SBApp, "_legacy_deviceOrientationUpdateManager");
    v14 = objc_claimAutoreleasedReturnValue();
    systemOrientationLockManager = v11->_systemOrientationLockManager;
    v11->_systemOrientationLockManager = (SBDeviceOrientationUpdateManager *)v14;

    v16 = objc_alloc_init(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider);
    rolesAndDefaultPoliciesProvider = v11->_rolesAndDefaultPoliciesProvider;
    v11->_rolesAndDefaultPoliciesProvider = v16;

    objc_initWeak(&location, v11);
    v18 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v22, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v19 = objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = v11->_stateCaptureInvalidatable;
    v11->_stateCaptureInvalidatable = (BSInvalidatable *)v19;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v11;
}

id __99__SBTraitsEmbeddedDisplayPipelineManager_initWithArbiter_sceneDelegate_userInterfaceStyleProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_orientationStateDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_orientationStateDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TRAArbitrationInputs *inputs;
  __CFString *v10;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  -[SBTraitsPipelineManager arbiter](self, "arbiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return CFSTR("waiting for an arbiter to become available");
  +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Backlight is on (SBBacklightController %p)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(v4, "screenIsOn");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Backlight is on (SBTraitsEmbeddedDisplayPipelineManager %p)"), self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = CFSTR("Inputs");
  inputs = self->_inputs;
  if (inputs)
  {
    -[TRAArbitrationInputs description](inputs, "description");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("No inputs yet");
  }
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (inputs)
  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBTraitsPipelineManager arbiter](self, "arbiter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[SBTraitsEmbeddedDisplayPipelineManager _layoutCoordinator](self, "_layoutCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", 0);
  -[SBTraitsPipelineManager sceneDelegate](self, "sceneDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ambientPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)SBTraitsEmbeddedDisplayPipelineManager;
  -[SBTraitsEmbeddedDisplayPipelineManager dealloc](&v9, sel_dealloc);
}

- (void)setupDefaultPipelineForArbiter:(id)a3
{
  id v4;
  BKSAccelerometer *v5;
  BKSAccelerometer *accelerometer;
  TRAArbitrationKeyboardInputs *v7;
  TRAArbitrationKeyboardInputs *keyboardInputs;
  id v9;
  void *v10;
  TRAArbitrationInterfaceIdiomInputs *v11;
  TRAArbitrationInterfaceIdiomInputs *deviceIdiomInputs;
  TRAArbitrationDeviceOrientationInputs *v13;
  TRAArbitrationDeviceOrientationInputs *orientationInputs;
  id v15;
  void *v16;
  TRAArbitrationUserInterfaceStyleInputs *v17;
  TRAArbitrationUserInterfaceStyleInputs *userInterfaceStyleInputs;
  TRAArbitrationAmbientPresentationInputs *v19;
  TRAArbitrationAmbientPresentationInputs *ambientPresentationInputs;
  void *v21;
  SBTraitsInputsAllUnknownOrientationValidator *v22;
  SBTraitsInputsOrientationLockValidator *v23;
  SBTraitsInputsOrientationLockValidator *orientationLockInputsValidator;
  void *v25;
  SBTraitsZOrderDefaultResolver *v26;
  void *v27;
  SBTraitsOrientationDefaultResolutionPolicySpecifier *v28;
  SBTraitsOrientationDefaultTreeNodesSpecifier *v29;
  SBTraitsOrientationDefaultTreeResolver *v30;
  void *v31;
  SBTraitsAmbientPresentationDefaultResolver *v32;
  void *v33;
  SBTraitsUserInterfaceStyleDefaultResolver *v34;
  TRAParticipant *v35;
  TRAParticipant *activeOrientationParticipant;
  TRAParticipant *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  int64_t v44;
  int64_t v45;
  void *v46;
  void *v47;
  id v48;

  v4 = a3;
  if (v4)
  {
    v48 = v4;
    v5 = (BKSAccelerometer *)objc_alloc_init(MEMORY[0x1E0D00C40]);
    accelerometer = self->_accelerometer;
    self->_accelerometer = v5;

    -[BKSAccelerometer setDelegate:](self->_accelerometer, "setDelegate:", self);
    v7 = (TRAArbitrationKeyboardInputs *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08C0]), "initWithKeyboardFocusedParticipantUniqueIdentifier:", 0);
    keyboardInputs = self->_keyboardInputs;
    self->_keyboardInputs = v7;

    v9 = objc_alloc(MEMORY[0x1E0DC08B8]);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (TRAArbitrationInterfaceIdiomInputs *)objc_msgSend(v9, "initWithIsPad:", objc_msgSend(v10, "userInterfaceIdiom") == 1);
    deviceIdiomInputs = self->_deviceIdiomInputs;
    self->_deviceIdiomInputs = v11;

    -[SBTraitsEmbeddedDisplayPipelineManager _orientationInputsForDeviceOrientation:](self, "_orientationInputsForDeviceOrientation:", -[BKSAccelerometer currentDeviceOrientation](self->_accelerometer, "currentDeviceOrientation"));
    v13 = (TRAArbitrationDeviceOrientationInputs *)objc_claimAutoreleasedReturnValue();
    orientationInputs = self->_orientationInputs;
    self->_orientationInputs = v13;

    v15 = objc_alloc(MEMORY[0x1E0DC08C8]);
    -[SBTraitsPipelineManager userInterfaceStyleProvider](self, "userInterfaceStyleProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (TRAArbitrationUserInterfaceStyleInputs *)objc_msgSend(v15, "initWithUserInterfaceStyle:", objc_msgSend(v16, "currentStyle"));
    userInterfaceStyleInputs = self->_userInterfaceStyleInputs;
    self->_userInterfaceStyleInputs = v17;

    v19 = (TRAArbitrationAmbientPresentationInputs *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A0]), "initWithAmbientPresented:ambientDisplayStyle:", 0, 0);
    ambientPresentationInputs = self->_ambientPresentationInputs;
    self->_ambientPresentationInputs = v19;

    -[SBTraitsEmbeddedDisplayPipelineManager _updateInputs](self, "_updateInputs");
    objc_msgSend(v48, "inputsValidationStage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SBTraitsInputsValidator initWithValidatorOrder:]([SBTraitsInputsAllUnknownOrientationValidator alloc], "initWithValidatorOrder:", &unk_1E91D0AD0);
    v23 = -[SBTraitsInputsOrientationLockValidator initWithValidatorOrder:]([SBTraitsInputsOrientationLockValidator alloc], "initWithValidatorOrder:", &unk_1E91D0AE8);
    orientationLockInputsValidator = self->_orientationLockInputsValidator;
    self->_orientationLockInputsValidator = v23;

    objc_msgSend(v21, "addInputsValidator:update:", v22, 0);
    objc_msgSend(v21, "addInputsValidator:update:", self->_orientationLockInputsValidator, 0);
    objc_msgSend(v48, "zOrderResolutionStage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SBTraitsZOrderStageComponent initWithComponentOrder:]([SBTraitsZOrderDefaultResolver alloc], "initWithComponentOrder:", &unk_1E91D0B00);
    objc_msgSend(v25, "addStageResolver:", v26);

    objc_msgSend(v48, "orientationResolutionStage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[SBTraitsOrientationDefaultResolutionPolicySpecifier initWithComponentOrder:dataSource:]([SBTraitsOrientationDefaultResolutionPolicySpecifier alloc], "initWithComponentOrder:dataSource:", &unk_1E91D0B00, self->_rolesAndDefaultPoliciesProvider);
    objc_msgSend(v27, "addResolutionPolicySpecifier:update:", v28, 0);

    v29 = -[SBTraitsOrientationStageComponent initWithComponentOrder:]([SBTraitsOrientationDefaultTreeNodesSpecifier alloc], "initWithComponentOrder:", &unk_1E91D0B00);
    objc_msgSend(v27, "addNodesSpecificationsSpecifier:", v29);

    v30 = -[SBTraitsOrientationDefaultTreeResolver initWithComponentOrder:]([SBTraitsOrientationDefaultTreeResolver alloc], "initWithComponentOrder:", &unk_1E91D0B00);
    objc_msgSend(v27, "addStageResolver:", v30);

    objc_msgSend(v48, "ambientPresentationResolutionStage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[SBTraitsAmbientPresentationDefaultResolver initWithThresholdRole:componentOrder:]([SBTraitsAmbientPresentationDefaultResolver alloc], "initWithThresholdRole:componentOrder:", CFSTR("SBTraitsParticipantRoleAmbient"), &unk_1E91D0B00);
    objc_msgSend(v31, "addStageResolver:", v32);

    objc_msgSend(v48, "userInterfaceStyleResolutionStage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SBTraitsUserInterfaceStyleStageComponent initWithComponentOrder:]([SBTraitsUserInterfaceStyleDefaultResolver alloc], "initWithComponentOrder:", &unk_1E91D0B00);
    objc_msgSend(v33, "addStageResolver:", v34);

    objc_msgSend(v48, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRolePipelineManager"), self);
    v35 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
    activeOrientationParticipant = self->_activeOrientationParticipant;
    self->_activeOrientationParticipant = v35;

    v37 = self->_activeOrientationParticipant;
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%@-Setup"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRAParticipant setNeedsUpdatePreferencesWithReason:](v37, "setNeedsUpdatePreferencesWithReason:", v41);

    -[TRAParticipant updatePreferencesIfNeeded](self->_activeOrientationParticipant, "updatePreferencesIfNeeded");
    -[SBTraitsEmbeddedDisplayPipelineManager _updateOrientationEventsEnabledState](self, "_updateOrientationEventsEnabledState");
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "userInterfaceIdiom");

    if ((v43 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v44 = -[SBTraitsEmbeddedDisplayPipelineManager _bootOrientation](self, "_bootOrientation");
      if (v44)
      {
        v45 = v44;
        -[SBTraitsEmbeddedDisplayPipelineManager _addLastNonFlatOverrideInputsValidatorIfNeeded](self, "_addLastNonFlatOverrideInputsValidatorIfNeeded");
        -[SBTraitsInputsOrientationNonFlatOverrideValidator setLastNonFlatOrientationOverride:](self->_lastNonFlatOverrideInputsValidator, "setLastNonFlatOrientationOverride:", v45);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObserver:selector:name:object:", self, sel__userOrientationLockChanged_, *MEMORY[0x1E0DAC368], 0);
    objc_msgSend(v46, "addObserver:selector:name:object:", self, sel__controlCenterWillDismiss_, CFSTR("SBControlCenterControllerWillDismissNotification"), 0);
    objc_msgSend(v46, "addObserver:selector:name:object:", self, sel__controlCenterDidDismiss_, CFSTR("SBControlCenterControllerDidDismissNotification"), 0);
    objc_msgSend(v46, "addObserver:selector:name:object:", self, sel__systemOrientationLockChanged_, CFSTR("SBDeviceOrientationUpdateManager-DeferralAssertionAcquired"), 0);
    objc_msgSend(v46, "addObserver:selector:name:object:", self, sel__systemOrientationLockChanged_, CFSTR("SBDeviceOrientationUpdateManager-HasNoActiveDeferralAssertions"), 0);
    +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    self->_backlightIsOn = objc_msgSend(v47, "screenIsOn");
    objc_msgSend(v47, "addObserver:", self);
    objc_msgSend(v48, "addObserver:", self);

    v4 = v48;
  }

}

- (void)startObservingLayoutStateTransitions
{
  id v3;

  -[SBTraitsEmbeddedDisplayPipelineManager _layoutCoordinator](self, "_layoutCoordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)startListeningForLockScreenUIPresentations
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBTraitsPipelineManager sceneDelegate](self, "sceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__noteCoverSheetWillPresent, CFSTR("SBLockScreenUIWillPresentNotification"), v4);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__noteCoverSheetDidPresent, CFSTR("SBLockScreenUIDidPresentNotification"), v4);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__noteCoverSheetWillDismiss, CFSTR("SBLockScreenUIWillDismissNotification"), v4);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__noteCoverSheetDidDismiss, CFSTR("SBLockScreenUIDidDismissNotification"), v4);

}

- (void)startObservingAmbientPresentation
{
  void *v3;
  void *v4;
  id v5;

  -[SBTraitsPipelineManager sceneDelegate](self, "sceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientPresentationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SBTraitsEmbeddedDisplayPipelineManager ambientPresentationController:didUpdatePresented:](self, "ambientPresentationController:didUpdatePresented:", v5, objc_msgSend(v5, "isPresented"));
  objc_msgSend(v5, "addObserver:", self);

}

- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  TRAArbitrationUserInterfaceStyleInputs *v10;
  TRAArbitrationUserInterfaceStyleInputs *userInterfaceStyleInputs;
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0DC08C8];
  v7 = a4;
  v12 = a3;
  v8 = [v6 alloc];
  -[SBTraitsPipelineManager userInterfaceStyleProvider](self, "userInterfaceStyleProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (TRAArbitrationUserInterfaceStyleInputs *)objc_msgSend(v8, "initWithUserInterfaceStyle:", objc_msgSend(v9, "currentStyle"));
  userInterfaceStyleInputs = self->_userInterfaceStyleInputs;
  self->_userInterfaceStyleInputs = v10;

  -[SBTraitsEmbeddedDisplayPipelineManager _updateInputs](self, "_updateInputs");
  -[SBTraitsEmbeddedDisplayPipelineManager _noteInputsNeedUpdateWithAnimationSettings:fence:reason:](self, "_noteInputsNeedUpdateWithAnimationSettings:fence:reason:", v12, v7, CFSTR("User Interface Style changed"));

}

- (id)_layoutCoordinator
{
  void *v2;
  void *v3;

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layoutStateTransitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_userOrientationLockChanged:(id)a3
{
  int64_t v4;
  BOOL v5;

  v4 = -[SBOrientationLockManager effectiveLockedOrientation](self->_userOrientationLockManager, "effectiveLockedOrientation", a3);
  if (-[SBOrientationLockManager isEffectivelyLocked](self->_userOrientationLockManager, "isEffectivelyLocked"))
    v5 = (unint64_t)(v4 - 1) >= 4;
  else
    v5 = 1;
  if (v5)
    v4 = -[SBOrientationLockManager userLockOrientation](self->_userOrientationLockManager, "userLockOrientation");
  -[SBTraitsInputsOrientationLockValidator setLockOrientation:](self->_orientationLockInputsValidator, "setLockOrientation:", v4);
  -[SBTraitsEmbeddedDisplayPipelineManager _noteInputsNeedUpdateAnimated:reason:](self, "_noteInputsNeedUpdateAnimated:reason:", -[SBTraitsEmbeddedDisplayPipelineManager _isBacklightOn](self, "_isBacklightOn"), CFSTR("User orientation lock changed."));
}

- (void)_updateInputs
{
  TRAArbitrationInputs *v3;
  TRAArbitrationInputs *inputs;

  v3 = (TRAArbitrationInputs *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08B0]), "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", self->_deviceIdiomInputs, self->_userInterfaceStyleInputs, self->_orientationInputs, self->_keyboardInputs, self->_ambientPresentationInputs);
  inputs = self->_inputs;
  self->_inputs = v3;

}

- (void)_controlCenterWillDismiss:(id)a3
{
  SBTraitsControlCenterInIsolationPolicySpecifier *v4;
  SBTraitsControlCenterInIsolationPolicySpecifier *controlCenterIsolationSpecifier;
  void *v6;
  id v7;

  if (!self->_controlCenterIsolationSpecifier)
  {
    v4 = -[SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier initWithComponentOrder:]([SBTraitsControlCenterInIsolationPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0B18);
    controlCenterIsolationSpecifier = self->_controlCenterIsolationSpecifier;
    self->_controlCenterIsolationSpecifier = v4;

    -[SBTraitsPipelineManager arbiter](self, "arbiter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orientationResolutionStage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addResolutionPolicySpecifier:update:", self->_controlCenterIsolationSpecifier, 0);

  }
}

- (void)_controlCenterDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  SBTraitsControlCenterInIsolationPolicySpecifier *controlCenterIsolationSpecifier;

  if (self->_controlCenterIsolationSpecifier)
  {
    -[SBTraitsPipelineManager arbiter](self, "arbiter", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orientationResolutionStage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeResolutionPolicySpecifier:", self->_controlCenterIsolationSpecifier);

    controlCenterIsolationSpecifier = self->_controlCenterIsolationSpecifier;
    self->_controlCenterIsolationSpecifier = 0;

  }
}

- (id)zOrderStageRoles
{
  return -[SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider zOrderStageRoles](self->_rolesAndDefaultPoliciesProvider, "zOrderStageRoles");
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

- (void)backlightController:(id)a3 willAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SBLogTraitsArbiter();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    SBSBacklightChangeSourceDescription(a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2048;
    v15 = a4;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[EmbeddedPipeline] Backlight is animating with source: %{public}@ to factor: %.1f", (uint8_t *)&v12, 0x16u);

  }
  v10 = BSFloatGreaterThanFloat();
  v11 = -[SBTraitsEmbeddedDisplayPipelineManager _isBacklightOn](self, "_isBacklightOn");
  self->_backlightIsOn = v10;
  -[SBTraitsEmbeddedDisplayPipelineManager _updateOrientationEventsEnabledState](self, "_updateOrientationEventsEnabledState");
  if (v10 != v11)
    -[SBTraitsEmbeddedDisplayPipelineManager _updateOrientationInputsDeferralAnimated:](self, "_updateOrientationInputsDeferralAnimated:", 0);
}

- (void)_updateOrientationEventsEnabledState
{
  _BOOL4 v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;

  v3 = -[SBTraitsEmbeddedDisplayPipelineManager _isBacklightOn](self, "_isBacklightOn");
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "prefersAlwaysOnOrientation");

  v6 = v3 | v5;
  if ((_DWORD)v6 != -[BKSAccelerometer orientationEventsEnabled](self->_accelerometer, "orientationEventsEnabled"))-[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", v6);
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  TRAArbitrationDeviceOrientationInputs *v8;
  TRAArbitrationDeviceOrientationInputs *orientationInputs;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogTraitsArbiter();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    SBFStringForBSDeviceOrientation();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[EmbeddedPipeline][Accelerometer] did change device orientation to: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  -[SBTraitsEmbeddedDisplayPipelineManager _evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:](self, "_evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:", a4);
  -[SBTraitsEmbeddedDisplayPipelineManager _orientationInputsForDeviceOrientation:](self, "_orientationInputsForDeviceOrientation:", a4);
  v8 = (TRAArbitrationDeviceOrientationInputs *)objc_claimAutoreleasedReturnValue();
  orientationInputs = self->_orientationInputs;
  self->_orientationInputs = v8;

  -[SBTraitsEmbeddedDisplayPipelineManager _updateInputs](self, "_updateInputs");
  -[SBTraitsEmbeddedDisplayPipelineManager _noteInputsNeedUpdateAnimated:reason:](self, "_noteInputsNeedUpdateAnimated:reason:", -[SBTraitsEmbeddedDisplayPipelineManager _isBacklightOn](self, "_isBacklightOn"), CFSTR("Device orientation change"));
}

- (id)_orientationInputsForDeviceOrientation:(int64_t)a3
{
  int64_t NonFlatDeviceOrientation;

  NonFlatDeviceOrientation = a3;
  if ((unint64_t)(a3 - 1) < 4)
    goto LABEL_4;
  if (!self->_lastNonFlatOrientation)
  {
    NonFlatDeviceOrientation = BKHIDServicesGetNonFlatDeviceOrientation();
LABEL_4:
    self->_lastNonFlatOrientation = NonFlatDeviceOrientation;
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A8]), "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", a3, self->_lastNonFlatOrientation);
}

- (BOOL)supportsLiveDeviceRotation
{
  return self->_accelerometer != 0;
}

- (void)ambientPresentationController:(id)a3 willUpdatePresented:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  SBAmbientFollowsRawDeviceOrientationPolicySpecifier *ambientFollowsRawDeviceOrientationSpecifier;
  SBAmbientFollowsRawDeviceOrientationPolicySpecifier *v8;
  SBAmbientFollowsRawDeviceOrientationPolicySpecifier *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  -[SBTraitsPipelineManager arbiter](self, "arbiter", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ambientFollowsRawDeviceOrientationSpecifier = self->_ambientFollowsRawDeviceOrientationSpecifier;
  if (v4)
  {
    if (!ambientFollowsRawDeviceOrientationSpecifier)
    {
      v12 = v6;
      v8 = -[SBTraitsRoleFollowsDeviceOrientationPolicySpecifier initWithComponentOrder:]([SBAmbientFollowsRawDeviceOrientationPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0B30);
      v9 = self->_ambientFollowsRawDeviceOrientationSpecifier;
      self->_ambientFollowsRawDeviceOrientationSpecifier = v8;

      -[SBTraitsRoleFollowsDeviceOrientationPolicySpecifier setDeviceOrientationStateTypes:](self->_ambientFollowsRawDeviceOrientationSpecifier, "setDeviceOrientationStateTypes:", &unk_1E91CE6F8);
      objc_msgSend(v12, "orientationResolutionStage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addResolutionPolicySpecifier:", self->_ambientFollowsRawDeviceOrientationSpecifier);
LABEL_6:

      v6 = v12;
    }
  }
  else if (ambientFollowsRawDeviceOrientationSpecifier)
  {
    v12 = v6;
    objc_msgSend(v6, "orientationResolutionStage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeResolutionPolicySpecifier:", self->_ambientFollowsRawDeviceOrientationSpecifier);

    v10 = self->_ambientFollowsRawDeviceOrientationSpecifier;
    self->_ambientFollowsRawDeviceOrientationSpecifier = 0;
    goto LABEL_6;
  }

}

- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4
{
  id obj;

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08A0]), "initWithAmbientPresented:ambientDisplayStyle:", a4, SBTraitsAmbientDisplayStyleForAmbientDisplayStyle(objc_msgSend(a3, "ambientDisplayStyle")));
  if ((objc_msgSend(obj, "isEqual:", self->_ambientPresentationInputs) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ambientPresentationInputs, obj);
    -[SBTraitsEmbeddedDisplayPipelineManager _updateInputs](self, "_updateInputs");
    -[SBTraitsEmbeddedDisplayPipelineManager _noteInputsNeedUpdateAnimated:reason:](self, "_noteInputsNeedUpdateAnimated:reason:", 1, CFSTR("ambient presentation state changed"));
  }

}

- (void)ambientPresentationController:(id)a3 didUpdateAmbientDisplayStyle:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  id v8;
  uint64_t v9;
  id obj;

  v6 = a3;
  v7 = SBTraitsAmbientDisplayStyleForAmbientDisplayStyle(a4);
  v8 = objc_alloc(MEMORY[0x1E0DC08A0]);
  v9 = objc_msgSend(v6, "isPresented");

  obj = (id)objc_msgSend(v8, "initWithAmbientPresented:ambientDisplayStyle:", v9, v7);
  if ((objc_msgSend(obj, "isEqual:", self->_ambientPresentationInputs) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ambientPresentationInputs, obj);
    -[SBTraitsEmbeddedDisplayPipelineManager _updateInputs](self, "_updateInputs");
    -[SBTraitsEmbeddedDisplayPipelineManager _noteInputsNeedUpdateAnimated:reason:](self, "_noteInputsNeedUpdateAnimated:reason:", 1, CFSTR("ambient display style changed"));
  }

}

- (void)_noteCoverSheetWillPresent
{
  SBDeviceOrientationUpdateDeferralAssertion *v3;
  SBDeviceOrientationUpdateDeferralAssertion *deviceUpdateDeferralAssertion;
  SBTraitsCoverSheetInIsolationPolicySpecifier *v5;
  SBTraitsCoverSheetInIsolationPolicySpecifier *coverSheetIsolationSpecifier;
  void *v7;
  id v8;

  self->_isCoversheetPresented = 1;
  -[SBDeviceOrientationUpdateDeferralAssertion invalidate](self->_deviceUpdateDeferralAssertion, "invalidate");
  -[SBDeviceOrientationUpdateManager deviceOrientationUpdateDeferralAssertionWithReason:](self->_systemOrientationLockManager, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("Coversheet presentation"));
  v3 = (SBDeviceOrientationUpdateDeferralAssertion *)objc_claimAutoreleasedReturnValue();
  deviceUpdateDeferralAssertion = self->_deviceUpdateDeferralAssertion;
  self->_deviceUpdateDeferralAssertion = v3;

  if (!self->_coverSheetIsolationSpecifier)
  {
    v5 = -[SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier initWithComponentOrder:]([SBTraitsCoverSheetInIsolationPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0B60);
    coverSheetIsolationSpecifier = self->_coverSheetIsolationSpecifier;
    self->_coverSheetIsolationSpecifier = v5;

    -[SBTraitsPipelineManager arbiter](self, "arbiter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orientationResolutionStage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addResolutionPolicySpecifier:update:", self->_coverSheetIsolationSpecifier, 0);

  }
}

- (void)_noteCoverSheetDidPresent
{
  void *v3;
  SBTraitsCoverSheetInIsolationPolicySpecifier *coverSheetIsolationSpecifier;
  SBTraitsCoverSheetFollowsDeviceOrientationPolicySpecifier *v5;
  SBTraitsCoverSheetFollowsDeviceOrientationPolicySpecifier *coverSheetFollowsDeviceOrientationSpecifier;
  SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier *v7;
  SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier *coverSheetFollowsSecureAppOrientationSpecifier;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation *v13;
  SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation *unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation;
  void *v15;
  id v16;

  self->_isCoversheetPresented = 1;
  -[SBDeviceOrientationUpdateDeferralAssertion invalidate](self->_deviceUpdateDeferralAssertion, "invalidate");
  -[SBTraitsPipelineManager arbiter](self, "arbiter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_coverSheetIsolationSpecifier)
  {
    objc_msgSend(v16, "orientationResolutionStage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeResolutionPolicySpecifier:update:", self->_coverSheetIsolationSpecifier, 0);

    coverSheetIsolationSpecifier = self->_coverSheetIsolationSpecifier;
    self->_coverSheetIsolationSpecifier = 0;

  }
  if (!self->_coverSheetFollowsDeviceOrientationSpecifier)
  {
    v5 = -[SBTraitsRoleFollowsDeviceOrientationPolicySpecifier initWithComponentOrder:]([SBTraitsCoverSheetFollowsDeviceOrientationPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0B78);
    coverSheetFollowsDeviceOrientationSpecifier = self->_coverSheetFollowsDeviceOrientationSpecifier;
    self->_coverSheetFollowsDeviceOrientationSpecifier = v5;

    v7 = -[SBTraitsOrientationStageComponent initWithComponentOrder:]([SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0B90);
    coverSheetFollowsSecureAppOrientationSpecifier = self->_coverSheetFollowsSecureAppOrientationSpecifier;
    self->_coverSheetFollowsSecureAppOrientationSpecifier = v7;

    objc_msgSend(v16, "orientationResolutionStage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addResolutionPolicySpecifier:", self->_coverSheetFollowsDeviceOrientationSpecifier);

    objc_msgSend(v16, "orientationResolutionStage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addResolutionPolicySpecifier:update:", self->_coverSheetFollowsSecureAppOrientationSpecifier, 0);

  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12)
      goto LABEL_12;
  }
  if (!self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation)
  {
    v13 = -[SBTraitsOrientationStageComponent initWithComponentOrder:]([SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation alloc], "initWithComponentOrder:", &unk_1E91D0BA8);
    unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation = self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation;
    self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation = v13;

    objc_msgSend(v16, "orientationResolutionStage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addResolutionPolicySpecifier:", self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation);

  }
LABEL_12:

}

- (void)_noteCoverSheetWillDismiss
{
  SBDeviceOrientationUpdateDeferralAssertion *v3;
  SBDeviceOrientationUpdateDeferralAssertion *deviceUpdateDeferralAssertion;
  SBTraitsCoverSheetInIsolationPolicySpecifier *v5;
  SBTraitsCoverSheetInIsolationPolicySpecifier *coverSheetIsolationSpecifier;
  void *v7;
  id v8;

  self->_isCoversheetPresented = 0;
  -[SBTraitsEmbeddedDisplayPipelineManager _evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:](self, "_evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:", -[TRAArbitrationDeviceOrientationInputs currentDeviceOrientation](self->_orientationInputs, "currentDeviceOrientation"));
  -[SBDeviceOrientationUpdateDeferralAssertion invalidate](self->_deviceUpdateDeferralAssertion, "invalidate");
  -[SBDeviceOrientationUpdateManager deviceOrientationUpdateDeferralAssertionWithReason:](self->_systemOrientationLockManager, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("Coversheet dismissal"));
  v3 = (SBDeviceOrientationUpdateDeferralAssertion *)objc_claimAutoreleasedReturnValue();
  deviceUpdateDeferralAssertion = self->_deviceUpdateDeferralAssertion;
  self->_deviceUpdateDeferralAssertion = v3;

  if (!self->_coverSheetIsolationSpecifier)
  {
    v5 = -[SBTraitsRoleResolvesOrientationInIsolationPolicySpecifier initWithComponentOrder:]([SBTraitsCoverSheetInIsolationPolicySpecifier alloc], "initWithComponentOrder:", &unk_1E91D0B60);
    coverSheetIsolationSpecifier = self->_coverSheetIsolationSpecifier;
    self->_coverSheetIsolationSpecifier = v5;

    -[SBTraitsPipelineManager arbiter](self, "arbiter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orientationResolutionStage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addResolutionPolicySpecifier:update:", self->_coverSheetIsolationSpecifier, 0);

  }
}

- (void)_noteCoverSheetDidDismiss
{
  void *v3;
  SBTraitsCoverSheetInIsolationPolicySpecifier *coverSheetIsolationSpecifier;
  void *v5;
  SBTraitsCoverSheetFollowsDeviceOrientationPolicySpecifier *coverSheetFollowsDeviceOrientationSpecifier;
  void *v7;
  SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier *coverSheetFollowsSecureAppOrientationSpecifier;
  void *v9;
  SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation *unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation;
  id v11;

  self->_isCoversheetPresented = 0;
  -[SBDeviceOrientationUpdateDeferralAssertion invalidate](self->_deviceUpdateDeferralAssertion, "invalidate");
  -[SBTraitsPipelineManager arbiter](self, "arbiter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_coverSheetIsolationSpecifier)
  {
    objc_msgSend(v11, "orientationResolutionStage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeResolutionPolicySpecifier:update:", self->_coverSheetIsolationSpecifier, 0);

    coverSheetIsolationSpecifier = self->_coverSheetIsolationSpecifier;
    self->_coverSheetIsolationSpecifier = 0;

  }
  if (self->_coverSheetFollowsDeviceOrientationSpecifier)
  {
    objc_msgSend(v11, "orientationResolutionStage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeResolutionPolicySpecifier:", self->_coverSheetFollowsDeviceOrientationSpecifier);

    coverSheetFollowsDeviceOrientationSpecifier = self->_coverSheetFollowsDeviceOrientationSpecifier;
    self->_coverSheetFollowsDeviceOrientationSpecifier = 0;

  }
  if (self->_coverSheetFollowsSecureAppOrientationSpecifier)
  {
    objc_msgSend(v11, "orientationResolutionStage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeResolutionPolicySpecifier:", self->_coverSheetFollowsSecureAppOrientationSpecifier);

    coverSheetFollowsSecureAppOrientationSpecifier = self->_coverSheetFollowsSecureAppOrientationSpecifier;
    self->_coverSheetFollowsSecureAppOrientationSpecifier = 0;

  }
  if (self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation)
  {
    objc_msgSend(v11, "orientationResolutionStage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeResolutionPolicySpecifier:", self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation);

    unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation = self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation;
    self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation = 0;

  }
  -[SBTraitsEmbeddedDisplayPipelineManager _evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:](self, "_evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:", -[TRAArbitrationDeviceOrientationInputs currentDeviceOrientation](self->_orientationInputs, "currentDeviceOrientation"));

}

- (void)_evaluateNonFlatOverrideNecessityForCurrentDeviceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  SBTraitsInputsOrientationNonFlatOverrideValidator *lastNonFlatOverrideInputsValidator;
  id v15;

  -[SBTraitsPipelineManager arbiter](self, "arbiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_isCoversheetPresented)
  {
    v15 = v5;
    -[SBTraitsPipelineManager sceneDelegate](self, "sceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutStateProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v7, "unlockedEnvironmentMode");
    if ((unint64_t)(a3 - 1) > 3)
    {
      -[SBTraitsEmbeddedDisplayPipelineManager _addLastNonFlatOverrideInputsValidatorIfNeeded](self, "_addLastNonFlatOverrideInputsValidatorIfNeeded");
    }
    else
    {
      if (self->_lastNonFlatOverrideInputsValidator)
        v12 = v11 == 1;
      else
        v12 = 1;
      if (!v12)
      {
        objc_msgSend(v15, "inputsValidationStage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeInputsValidator:update:", self->_lastNonFlatOverrideInputsValidator, 0);

        lastNonFlatOverrideInputsValidator = self->_lastNonFlatOverrideInputsValidator;
        self->_lastNonFlatOverrideInputsValidator = 0;

      }
    }
    goto LABEL_11;
  }
  if (self->_lastNonFlatOverrideInputsValidator)
  {
    v15 = v5;
    objc_msgSend(v5, "inputsValidationStage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeInputsValidator:update:", self->_lastNonFlatOverrideInputsValidator, 0);

    v7 = self->_lastNonFlatOverrideInputsValidator;
    self->_lastNonFlatOverrideInputsValidator = 0;
LABEL_11:

    v5 = v15;
  }

}

- (int64_t)_bootOrientation
{
  int v2;
  int64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;

  v2 = MGGetSInt32Answer();
  v3 = 2;
  v4 = 4;
  if (v2 != 270)
    v4 = 0;
  if (v2 != 180)
    v3 = v4;
  v5 = 1;
  v6 = 3;
  if (v2 != 90)
    v6 = 0;
  if (v2)
    v5 = v6;
  if (v2 <= 179)
    return v5;
  else
    return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_activeOrientationParticipant, 0);
  objc_storeStrong((id *)&self->_ambientFollowsRawDeviceOrientationSpecifier, 0);
  objc_storeStrong((id *)&self->_unlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation, 0);
  objc_storeStrong((id *)&self->_coverSheetFollowsSecureAppOrientationSpecifier, 0);
  objc_storeStrong((id *)&self->_coverSheetFollowsDeviceOrientationSpecifier, 0);
  objc_storeStrong((id *)&self->_coverSheetIsolationSpecifier, 0);
  objc_storeStrong((id *)&self->_controlCenterIsolationSpecifier, 0);
  objc_storeStrong((id *)&self->_dockFollowsHomeSpecifier, 0);
  objc_storeStrong((id *)&self->_homeIsolationSpecifier, 0);
  objc_storeStrong((id *)&self->_homeFollowsSwitcherSpecifier, 0);
  objc_storeStrong((id *)&self->_rolesAndDefaultPoliciesProvider, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_deviceUpdateDeferralAssertion, 0);
  objc_storeStrong((id *)&self->_systemOrientationLockManager, 0);
  objc_storeStrong((id *)&self->_userOrientationLockManager, 0);
  objc_storeStrong((id *)&self->_keyboardFocusInputsValidator, 0);
  objc_storeStrong((id *)&self->_ambientPresentationInputs, 0);
  objc_storeStrong((id *)&self->_lastNonFlatOverrideInputsValidator, 0);
  objc_storeStrong((id *)&self->_orientationLockInputsValidator, 0);
  objc_storeStrong((id *)&self->_orientationInputs, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleInputs, 0);
  objc_storeStrong((id *)&self->_deviceIdiomInputs, 0);
  objc_storeStrong((id *)&self->_keyboardInputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_accelerometer, 0);
}

@end
