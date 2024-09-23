@implementation SBTraitsPipelineManager

- (id)defaultOrientationAnimationSettingsAnimatable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  SBMedusa1oSettings *v6;
  SBMedusa1oSettings *medusaSettings;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  if (!self->_medusaSettings)
  {
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medusa1oSettings");
    v6 = (SBMedusa1oSettings *)objc_claimAutoreleasedReturnValue();
    medusaSettings = self->_medusaSettings;
    self->_medusaSettings = v6;

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = dbl_1D0E89410[(v9 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  -[SBMedusa1oSettings rotationSlowdownFactor](self->_medusaSettings, "rotationSlowdownFactor");
  v12 = v10 * v11;
  if (v3)
    v13 = v12;
  else
    v13 = 0.0;
  v14 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "settingsWithDuration:delay:timingFunction:", v15, v13, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (TRAArbiter)arbiter
{
  return (TRAArbiter *)objc_loadWeakRetained((id *)&self->_arbiter);
}

- (SBWindowSceneDelegate)sceneDelegate
{
  return (SBWindowSceneDelegate *)objc_loadWeakRetained((id *)&self->_sceneDelegate);
}

- (void)setKeyboardFocusContext:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardFocusContext, a3);
}

- (SBTraitsPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBTraitsPipelineManager *v12;
  SBTraitsPipelineManager *v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsPipelineManager.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInterfaceStyleProvider"));

  }
  v16.receiver = self;
  v16.super_class = (Class)SBTraitsPipelineManager;
  v12 = -[SBTraitsPipelineManager init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_arbiter, v9);
    objc_storeWeak((id *)&v13->_sceneDelegate, v10);
    objc_storeStrong((id *)&v13->_userInterfaceStyleProvider, a5);
  }

  return v13;
}

- (SBTraitsPipelineManager)initWithUserInterfaceStyleProvider:(id)a3
{
  return -[SBTraitsPipelineManager initWithArbiter:sceneDelegate:userInterfaceStyleProvider:](self, "initWithArbiter:sceneDelegate:userInterfaceStyleProvider:", 0, 0, a3);
}

- (id)newBlockBasedOrientationPolicySpecifier:(id)a3 forRole:(id)a4
{
  id v6;
  id v7;
  SBTraitsPipelineBlockBasedPolicySpecifier *v8;
  id WeakRetained;
  SBTraitsPipelineBlockBasedPolicySpecifier *v10;

  v6 = a4;
  v7 = a3;
  v8 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  v10 = -[SBTraitsPipelineBlockBasedPolicySpecifier initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:](v8, "initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:", v7, v6, &unk_1E91D09F8, WeakRetained);

  return v10;
}

- (id)newBlockBasedOrientationPolicySpecifier:(id)a3 forParticipant:(id)a4
{
  id v6;
  id v7;
  SBTraitsPipelineBlockBasedPolicySpecifier *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id WeakRetained;
  SBTraitsPipelineBlockBasedPolicySpecifier *v15;

  v6 = a4;
  v7 = a3;
  v8 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
  objc_msgSend(v6, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "currentZOrderLevel");
  v12 = v11;

  objc_msgSend(v10, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  v15 = -[SBTraitsPipelineBlockBasedPolicySpecifier initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:](v8, "initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:", v7, v9, v13, WeakRetained);

  return v15;
}

- (BOOL)supportsLiveDeviceRotation
{
  return 0;
}

- (SBUserInterfaceStyleProvider)userInterfaceStyleProvider
{
  return self->_userInterfaceStyleProvider;
}

- (void)setArbiter:(id)a3
{
  objc_storeWeak((id *)&self->_arbiter, a3);
}

- (void)setSceneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sceneDelegate, a3);
}

- (UIKBArbiterClientFocusContext)keyboardFocusContext
{
  return self->_keyboardFocusContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardFocusContext, 0);
  objc_destroyWeak((id *)&self->_sceneDelegate);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->_userInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
}

- (void)setupDefaultPipelineForArbiter:(id)a3
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_7();
}

- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_7();
}

- (TRAArbitrationInputs)inputs
{
  TRAArbitrationInputs *result;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)zOrderStageRoles
{
  id result;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)orientationStageRoles
{
  id result;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)ambientPresentationStageRoles
{
  id result;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)userInterfaceStyleStageRoles
{
  id result;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

@end
