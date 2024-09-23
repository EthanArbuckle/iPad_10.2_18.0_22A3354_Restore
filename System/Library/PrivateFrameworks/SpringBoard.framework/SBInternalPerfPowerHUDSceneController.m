@implementation SBInternalPerfPowerHUDSceneController

- (id)scenesForBacklightSession
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_backlightParticipantScene);
  if ((objc_msgSend(WeakRetained, "isValid") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", WeakRetained);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureBacklightEnvironmentSceneProviderIfNecessary
{
  void *v3;

  if (!self->_registeredBacklightSceneProvider)
  {
    objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerBacklightEnvironmentSceneProvider:", self);

    self->_registeredBacklightSceneProvider = 1;
  }
}

- (void)windowSceneDidConnect:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_backlightParticipantScene);

  if (!WeakRetained)
  {
    v5 = -[SBSystemUISceneController _newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:](self, "_newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:", v6, 0);

  }
  -[SBInternalPerfPowerHUDSceneController _configureBacklightEnvironmentSceneProviderIfNecessary](self, "_configureBacklightEnvironmentSceneProviderIfNecessary");

}

- (void)windowSceneDidDisconnect:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBInternalPerfPowerHUDSceneController;
  -[SBSystemUISceneController windowSceneDidDisconnect:](&v5, sel_windowSceneDidDisconnect_, a3);
  objc_storeWeak((id *)&self->_backlightParticipantScene, 0);
  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterBacklightEnvironmentSceneProvider:", self);

  self->_registeredBacklightSceneProvider = 0;
}

+ (id)_setupInfo
{
  void *v2;
  void *v3;
  _QWORD v5[7];
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("class");
  v6[0] = objc_opt_class();
  v6[1] = MEMORY[0x1E0C9AAB0];
  v5[1] = CFSTR("enabled");
  v5[2] = CFSTR("jobLabel");
  v6[2] = CFSTR("com.apple.internal.PerfPowerHUD");
  v6[3] = CFSTR("SBTraitsParticipantRoleInternalPerfPowerHUD");
  v5[3] = CFSTR("traitsRole");
  v5[4] = CFSTR("hostLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEBBD0] + 260.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = v2;
  v6[5] = &unk_1E91D0968;
  v5[5] = CFSTR("vendingStrategy");
  v5[6] = CFSTR("workspaceID");
  v6[6] = CFSTR("com.apple.SpringBoard.SceneWorkspace.InternalPerfPowerHUD");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_newSceneControllerForWindowScene:(id)a3 sceneRequestOptions:(id)a4 traitsRole:(id)a5 level:(double)a6
{
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBInternalPerfPowerHUDSceneController;
  v7 = -[SBSystemUISceneController _newSceneControllerForWindowScene:sceneRequestOptions:traitsRole:level:](&v11, sel__newSceneControllerForWindowScene_sceneRequestOptions_traitsRole_level_, a3, a4, a5, a6);
  objc_msgSend(v7, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_backlightParticipantScene, v8);

  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateBacklightScenesForProvider:", self);

  return v7;
}

- (BOOL)registeredBacklightSceneProvider
{
  return self->_registeredBacklightSceneProvider;
}

- (void)setRegisteredBacklightSceneProvider:(BOOL)a3
{
  self->_registeredBacklightSceneProvider = a3;
}

- (FBScene)backlightParticipantScene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_backlightParticipantScene);
}

- (void)setBacklightParticipantScene:(id)a3
{
  objc_storeWeak((id *)&self->_backlightParticipantScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backlightParticipantScene);
}

@end
