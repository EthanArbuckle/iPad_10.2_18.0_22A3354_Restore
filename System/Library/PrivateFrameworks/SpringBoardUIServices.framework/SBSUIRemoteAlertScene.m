@implementation SBSUIRemoteAlertScene

- (void)_readySceneForConnection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A471F000, log, OS_LOG_TYPE_ERROR, "Remote alert scene doesn't have its scene extension?!", v1, 2u);
}

void __49__SBSUIRemoteAlertScene__readySceneForConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setInitialRemoteAlertActivationContext:", 0);
  objc_msgSend(v2, "setInitialRemoteAlertConfigurationContext:", 0);

}

- (NSString)configurationIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (SBSRemoteAlertConfigurationContext)configurationContext
{
  void *v2;
  void *v3;
  void *v4;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBSUI_remoteAlertComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSRemoteAlertConfigurationContext *)v4;
}

- (SBSRemoteAlertActivationContext)activationContext
{
  void *v2;
  void *v3;
  void *v4;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBSUI_remoteAlertComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSRemoteAlertActivationContext *)v4;
}

- (void)deactivate
{
  id v2;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateClientSettings:", &__block_literal_global_2_0);

}

uint64_t __35__SBSUIRemoteAlertScene_deactivate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setWantsDeactivation:", 1);
}

- (void)invalidate
{
  id v2;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateClientSettings:", &__block_literal_global_3);

}

uint64_t __35__SBSUIRemoteAlertScene_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setWantsInvalidation:", 1);
}

- (void)setDisablesBanners:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SBSUIRemoteAlertScene_setDisablesBanners___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __44__SBSUIRemoteAlertScene_setDisablesBanners___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisablesBanners:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setDisablesAlertItems:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SBSUIRemoteAlertScene_setDisablesAlertItems___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __47__SBSUIRemoteAlertScene_setDisablesAlertItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisablesAlertItems:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setDisablesControlCenter:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBSUIRemoteAlertScene_setDisablesControlCenter___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __50__SBSUIRemoteAlertScene_setDisablesControlCenter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisablesControlCenter:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setDisablesSiri:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SBSUIRemoteAlertScene_setDisablesSiri___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __41__SBSUIRemoteAlertScene_setDisablesSiri___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisablesSiri:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setInteractiveScreenshotGestureDisabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__SBSUIRemoteAlertScene_setInteractiveScreenshotGestureDisabled___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __65__SBSUIRemoteAlertScene_setInteractiveScreenshotGestureDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisablesInteractiveScreenshotGesture:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setReachabilityDisabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SBSUIRemoteAlertScene_setReachabilityDisabled___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __49__SBSUIRemoteAlertScene_setReachabilityDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisablesReachability:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setAllowsAlertStacking:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SBSUIRemoteAlertScene_setAllowsAlertStacking___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __48__SBSUIRemoteAlertScene_setAllowsAlertStacking___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAllowsAlertStacking:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setAllowsMenuButtonDismissal:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SBSUIRemoteAlertScene_setAllowsMenuButtonDismissal___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __54__SBSUIRemoteAlertScene_setAllowsMenuButtonDismissal___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAllowsMenuButtonDismissal:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setDesiredHardwareButtonEvents:(unint64_t)a3
{
  id v4;
  _QWORD v5[5];

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SBSUIRemoteAlertScene_setDesiredHardwareButtonEvents___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v5[4] = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __56__SBSUIRemoteAlertScene_setDesiredHardwareButtonEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredHardwareButtonEvents:", *(_QWORD *)(a1 + 32));
}

- (void)setContentOpaque:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SBSUIRemoteAlertScene_setContentOpaque___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __42__SBSUIRemoteAlertScene_setContentOpaque___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentOpaque:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setWallpaperStyle:(int64_t)a3 animationSettings:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a4;
  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SBSUIRemoteAlertScene_setWallpaperStyle_animationSettings___block_invoke;
  v9[3] = &unk_1E4C3FA10;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "updateClientSettings:", v9);

}

void __61__SBSUIRemoteAlertScene_setWallpaperStyle_animationSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "isUISubclass"))
  {
    objc_msgSend(v6, "setBackgroundStyle:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "setAnimationSettings:", *(_QWORD *)(a1 + 32));
  }

}

- (void)setDismissalAnimationStyle:(int64_t)a3
{
  id v4;
  _QWORD v5[5];

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SBSUIRemoteAlertScene_setDismissalAnimationStyle___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v5[4] = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __52__SBSUIRemoteAlertScene_setDismissalAnimationStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDismissalAnimationStyle:", *(_QWORD *)(a1 + 32));
}

- (void)setSwipeDismissalStyle:(int64_t)a3
{
  id v4;
  _QWORD v5[5];

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SBSUIRemoteAlertScene_setSwipeDismissalStyle___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v5[4] = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __48__SBSUIRemoteAlertScene_setSwipeDismissalStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSwipeDismissalStyle:", *(_QWORD *)(a1 + 32));
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  id v4;
  _QWORD v5[5];

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SBSUIRemoteAlertScene_setWhitePointAdaptivityStyle___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v5[4] = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __54__SBSUIRemoteAlertScene_setWhitePointAdaptivityStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWhitePointAdaptivityStyle:", *(_QWORD *)(a1 + 32));
}

- (void)setBackgroundActivitiesToSuppress:(id)a3 animationSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__SBSUIRemoteAlertScene_setBackgroundActivitiesToSuppress_animationSettings___block_invoke;
  v11[3] = &unk_1E4C3FA38;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "updateClientSettings:", v11);

}

void __77__SBSUIRemoteAlertScene_setBackgroundActivitiesToSuppress_animationSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "setBackgroundActivitiesToSuppress:", v5);
  objc_msgSend(v6, "setAnimationSettings:", *(_QWORD *)(a1 + 40));

}

- (void)setContentOverlaysStatusBar:(BOOL)a3 animationSettings:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a4;
  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SBSUIRemoteAlertScene_setContentOverlaysStatusBar_animationSettings___block_invoke;
  v9[3] = &unk_1E4C3FA60;
  v11 = a3;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "updateClientSettings:", v9);

}

void __71__SBSUIRemoteAlertScene_setContentOverlaysStatusBar_animationSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;

  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = a3;
  objc_msgSend(a2, "setContentOverlaysStatusBar:", v5);
  objc_msgSend(v6, "setAnimationSettings:", *(_QWORD *)(a1 + 32));

}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a4;
  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SBSUIRemoteAlertScene_setIdleTimerDisabled_forReason___block_invoke;
  v9[3] = &unk_1E4C3FA60;
  v11 = a3;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v8, "updateClientSettings:", v9);

}

void __56__SBSUIRemoteAlertScene_setIdleTimerDisabled_forReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(unsigned __int8 *)(a1 + 40);
  v5 = a3;
  objc_msgSend(v5, "setWantsIdleTimerDisabled:", v4);
  objc_msgSend(v5, "setWantsIdleTimerDisabledReason:", *(_QWORD *)(a1 + 32));

}

- (void)setDesiredAutoLockDuration:(double)a3
{
  id v4;
  _QWORD v5[5];

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SBSUIRemoteAlertScene_setDesiredAutoLockDuration___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  *(double *)&v5[4] = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __52__SBSUIRemoteAlertScene_setDesiredAutoLockDuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredAutoLockDuration:", *(double *)(a1 + 32));
}

- (void)setDesiredIdleTimerSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SBSUIRemoteAlertScene_setDesiredIdleTimerSettings___block_invoke;
  v7[3] = &unk_1E4C3FA88;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateClientSettings:", v7);

}

uint64_t __53__SBSUIRemoteAlertScene_setDesiredIdleTimerSettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredIdleTimerSettings:", *(_QWORD *)(a1 + 32));
}

- (void)setOrientationChangedEventsDisabled:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SBSUIRemoteAlertScene_setOrientationChangedEventsDisabled___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v6 = a3;
  objc_msgSend(v4, "updateClientSettings:", v5);

}

uint64_t __61__SBSUIRemoteAlertScene_setOrientationChangedEventsDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOrientationChangedEventsDisabled:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setSceneDeactivationReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SBSUIRemoteAlertScene_setSceneDeactivationReason___block_invoke;
  v7[3] = &unk_1E4C3FA88;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateClientSettings:", v7);

}

uint64_t __52__SBSUIRemoteAlertScene_setSceneDeactivationReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredSceneDeactivationReason:", *(_QWORD *)(a1 + 32));
}

- (void)setInputHardwareEventsDisabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  SBLogTransientOverlay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identityToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Remote alert scene %{public}@ setting input hardware events disabled: %d", buf, 0x12u);

  }
  -[SBSUIRemoteAlertScene _FBSScene](self, "_FBSScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SBSUIRemoteAlertScene_setInputHardwareEventsDisabled___block_invoke;
  v9[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  v10 = v3;
  objc_msgSend(v8, "updateClientSettings:", v9);

}

uint64_t __56__SBSUIRemoteAlertScene_setInputHardwareEventsDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHIDEventDeferringDisabled:", *(unsigned __int8 *)(a1 + 32));
}

@end
