@implementation SBSUIRemoteAlertSceneHostComponent

- (void)setConfigurationIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBSUIRemoteAlertSceneHostComponent_setConfigurationIdentifier___block_invoke;
  v6[3] = &unk_1E4C40A58;
  v7 = v4;
  v5 = v4;
  -[SBSUIRemoteAlertSceneHostComponent _performSafeSettingsUpdate:](self, "_performSafeSettingsUpdate:", v6);

}

uint64_t __65__SBSUIRemoteAlertSceneHostComponent_setConfigurationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setConfigurationIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)setConfigurationContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SBSUIRemoteAlertSceneHostComponent_setConfigurationContext___block_invoke;
  v7[3] = &unk_1E4C40A80;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "configureParameters:", v7);

}

void __62__SBSUIRemoteAlertSceneHostComponent_setConfigurationContext___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__SBSUIRemoteAlertSceneHostComponent_setConfigurationContext___block_invoke_2;
  v3[3] = &unk_1E4C40428;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "updateClientSettingsWithBlock:", v3);

}

uint64_t __62__SBSUIRemoteAlertSceneHostComponent_setConfigurationContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInitialRemoteAlertConfigurationContext:", *(_QWORD *)(a1 + 32));
}

- (void)setActivationContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke;
    v13[3] = &unk_1E4C40AA8;
    v14 = v4;
    v7 = v4;
    -[SBSUIRemoteAlertSceneHostComponent _performSafeTransition:](self, "_performSafeTransition:", v13);
    v8 = v14;
  }
  else
  {
    -[FBSSceneComponent hostScene](self, "hostScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke_2;
    v11[3] = &unk_1E4C40A80;
    v12 = v4;
    v10 = v4;
    objc_msgSend(v9, "configureParameters:", v11);

    v8 = v12;
  }

}

uint64_t __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRemoteAlertActivationContext:", *(_QWORD *)(a1 + 32));
}

void __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke_3;
  v3[3] = &unk_1E4C40428;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "updateClientSettingsWithBlock:", v3);

}

uint64_t __59__SBSUIRemoteAlertSceneHostComponent_setActivationContext___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInitialRemoteAlertActivationContext:", *(_QWORD *)(a1 + 32));
}

- (void)setDefaultStatusBarHeightsForWindowScene:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v10, "statusBarManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBSSceneComponent hostScene](self, "hostScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__SBSUIRemoteAlertSceneHostComponent_setDefaultStatusBarHeightsForWindowScene___block_invoke;
    v11[3] = &unk_1E4C40A80;
    v12 = v7;
    v9 = v7;
    objc_msgSend(v8, "configureParameters:", v11);

  }
}

void __79__SBSUIRemoteAlertSceneHostComponent_setDefaultStatusBarHeightsForWindowScene___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__SBSUIRemoteAlertSceneHostComponent_setDefaultStatusBarHeightsForWindowScene___block_invoke_2;
  v3[3] = &unk_1E4C40A58;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "updateSettingsWithBlock:", v3);

}

void __79__SBSUIRemoteAlertSceneHostComponent_setDefaultStatusBarHeightsForWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "heightForOrientation:", 1);
  objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "heightForOrientation:", 2);
  objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", 2);
  objc_msgSend(*(id *)(a1 + 32), "heightForOrientation:", 4);
  objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", 4);
  objc_msgSend(*(id *)(a1 + 32), "heightForOrientation:", 3);
  objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", 3);

}

- (void)_performSafeSettingsUpdate:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v10 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  -[FBSSceneComponent hostScene](self, "hostScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__SBSUIRemoteAlertSceneHostComponent__performSafeSettingsUpdate___block_invoke;
    v13[3] = &unk_1E4C40AD0;
    v7 = &v14;
    v14 = v10;
    v8 = v10;
    objc_msgSend(v6, "performUpdate:", v13);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__SBSUIRemoteAlertSceneHostComponent__performSafeSettingsUpdate___block_invoke_2;
    v11[3] = &unk_1E4C40AF8;
    v7 = &v12;
    v12 = v10;
    v9 = v10;
    objc_msgSend(v6, "configureParameters:", v11);
  }

}

uint64_t __65__SBSUIRemoteAlertSceneHostComponent__performSafeSettingsUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__SBSUIRemoteAlertSceneHostComponent__performSafeSettingsUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSettingsWithBlock:", *(_QWORD *)(a1 + 32));
}

- (void)_performSafeTransition:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSMutableArray *pendingTransitioners;
  NSMutableArray *v9;
  NSMutableArray *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    -[FBSSceneComponent hostScene](self, "hostScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__SBSUIRemoteAlertSceneHostComponent__performSafeTransition___block_invoke;
    v12[3] = &unk_1E4C40AD0;
    v13 = v11;
    objc_msgSend(v6, "performUpdate:", v12);

    v7 = v13;
  }
  else
  {
    pendingTransitioners = self->_pendingTransitioners;
    if (!pendingTransitioners)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_pendingTransitioners;
      self->_pendingTransitioners = v9;

      pendingTransitioners = self->_pendingTransitioners;
    }
    v7 = (void *)MEMORY[0x1A85A1798](v11);
    -[NSMutableArray addObject:](pendingTransitioners, "addObject:", v7);
  }

}

uint64_t __61__SBSUIRemoteAlertSceneHostComponent__performSafeTransition___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleButtonActions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    -[FBSSceneComponent hostScene](self, "hostScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__SBSUIRemoteAlertSceneHostComponent_handleButtonActions___block_invoke;
    v8[3] = &unk_1E4C3F598;
    v9 = v7;
    objc_msgSend(v6, "performUpdate:", v8);

  }
}

uint64_t __58__SBSUIRemoteAlertSceneHostComponent_handleButtonActions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setButtonActions:", *(_QWORD *)(a1 + 32));
}

- (void)didInvalidateForRemoteAlertServiceInvalidation
{
  void *v3;
  int v4;
  id v5;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (v4)
  {
    -[FBSSceneComponent hostScene](self, "hostScene");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performUpdate:", &__block_literal_global_40);

  }
}

uint64_t __84__SBSUIRemoteAlertSceneHostComponent_didInvalidateForRemoteAlertServiceInvalidation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setInvalidatedForHostInvalidation:", 1);
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  _QWORD v4[4];
  CGRect v5;
  BOOL v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __118__SBSUIRemoteAlertSceneHostComponent_didTransitionToAttachedToWindowedAccessory_windowedAccessoryCutoutFrameInScreen___block_invoke;
  v4[3] = &__block_descriptor_65_e33_v16__0__FBSMutableSceneSettings_8l;
  v6 = a3;
  v5 = a4;
  -[SBSUIRemoteAlertSceneHostComponent _performSafeSettingsUpdate:](self, "_performSafeSettingsUpdate:", v4);
}

void __118__SBSUIRemoteAlertSceneHostComponent_didTransitionToAttachedToWindowedAccessory_windowedAccessoryCutoutFrameInScreen___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 64);
  v4 = a2;
  objc_msgSend(v4, "setAttachedToWindowedAccessory:", v3);
  objc_msgSend(v4, "setWindowedAccessoryCutoutFrameInScreen:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

- (BOOL)isAttachedToWindowedAccessory
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAttachedToWindowedAccessory");

  return v4;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowedAccessoryCutoutFrameInScreen");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)allowsAlertStacking
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsAlertStacking");

  return v4;
}

- (BOOL)isContentOpaque
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContentOpaque");

  return v4;
}

- (int64_t)dismissalAnimationStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dismissalAnimationStyle");

  return v4;
}

- (int64_t)swipeDismissalStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "swipeDismissalStyle");

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "statusBarStyle");
  return v4;
}

- (int)preferredStatusBarVisibility
{
  void *v2;
  void *v3;
  int v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "statusBarHidden") & 1) != 0 || (objc_msgSend(v3, "defaultStatusBarHidden") & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "contentOverlaysStatusBar"))
  {
    v4 = 0;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (NSSet)backgroundActivitiesToSuppress
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundActivitiesToSuppress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (double)desiredAutoLockDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "desiredAutoLockDuration");
  v5 = v4;

  return v5;
}

- (SBUIRemoteAlertIdleTimerSettings)desiredIdleTimerSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "desiredIdleTimerSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUIRemoteAlertIdleTimerSettings *)v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportedInterfaceOrientations");

  return v4;
}

- (BOOL)shouldDisableOrientationUpdates
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientationChangedEventsDisabled");

  return v4;
}

- (int64_t)whitePointAdaptivityStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "whitePointAdaptivityStyle");

  return v4;
}

- (NSNumber)preferredSceneDeactivationReason
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredSceneDeactivationReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (BOOL)hidEventDeferringDisabled
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hidEventDeferringDisabled");

  return v4;
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v5;

  objc_msgSend(a4, "transitionContext", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSUIRemoteAlertSceneHostComponent _flushPendingTransitionersWithContext:](self, "_flushPendingTransitionersWithContext:", v5);

}

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  -[SBSUIRemoteAlertSceneHostComponent _flushPendingTransitionersWithContext:](self, "_flushPendingTransitionersWithContext:", a5, a4);
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v5;

  objc_msgSend(a4, "transitionContext", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSUIRemoteAlertSceneHostComponent _flushPendingTransitionersWithContext:](self, "_flushPendingTransitionersWithContext:", v5);

}

- (void)_flushPendingTransitionersWithContext:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *pendingTransitioners;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_pendingTransitioners, "count"))
  {
    v5 = (void *)-[NSMutableArray copy](self->_pendingTransitioners, "copy");
    pendingTransitioners = self->_pendingTransitioners;
    self->_pendingTransitioners = 0;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  _BOOL4 v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(v13, "wantsInvalidation"))
  {
    objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidInvalidate:", self);
  }
  else
  {
    if (objc_msgSend(v13, "wantsDeactivation"))
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidDeactivate:", self);
    if (objc_msgSend(v11, "containsProperty:", sel_allowsAlertStacking))
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeAllowsAlertStacking:", self);
    if (objc_msgSend(v11, "containsProperty:", sel_isContentOpaque))
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeContentOpaque:", self);
    if (objc_msgSend(v11, "containsProperty:", sel_dismissalAnimationStyle))
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeDismissalAnimationStyle:", self);
    if (objc_msgSend(v11, "containsProperty:", sel_swipeDismissalStyle))
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeSwipeDismissalStyle:", self);
    if (objc_msgSend(v11, "containsProperty:", sel_backgroundActivitiesToSuppress))
    {
      objc_msgSend(v13, "animationSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponent:didChangeBackgroundActivitiesToSuppressWithAnimationSettings:", self, v15);

    }
    objc_msgSend(v13, "wantsIdleTimerDisabledReason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponent:didSetIdleTimerDisabled:forReason:", self, objc_msgSend(v13, "wantsIdleTimerDisabled"), v16);
    if (objc_msgSend(v11, "containsProperty:", sel_desiredAutoLockDuration))
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeDesiredAutoLockDuration:", self);
    if (objc_msgSend(v11, "containsProperty:", sel_desiredIdleTimerSettings))
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeDesiredIdleTimerSettings:", self);
    if (objc_msgSend(v11, "containsProperty:", sel_orientationChangedEventsDisabled))
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeShouldDisableOrientationUpdates:", self);
    objc_msgSend(v10, "clientSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    v19 = v17;
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

    if (v21)
    {
      v22 = v12;
      v23 = objc_msgSend(v21, "supportedInterfaceOrientations");
      if (v23 != objc_msgSend(v22, "supportedInterfaceOrientations"))
        objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeSupportedInterfaceOrientations:", self);
      v24 = objc_msgSend(v21, "whitePointAdaptivityStyle");
      if (v24 != objc_msgSend(v22, "whitePointAdaptivityStyle"))
        objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeWhitePointAdaptivityStyle:", self);
      v25 = objc_msgSend(v21, "statusBarHidden");
      if (v25 != objc_msgSend(v22, "statusBarHidden")
        || (v26 = objc_msgSend(v21, "statusBarStyle"), v26 != objc_msgSend(v22, "statusBarStyle"))
        || (v27 = objc_msgSend(v21, "contentOverlaysStatusBar"),
            v27 != objc_msgSend(v22, "contentOverlaysStatusBar")))
      {
        objc_msgSend(v13, "animationSettings");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "remoteAlertSceneHostComponent:didChangePreferredStatusBarVisibilityWithAnimationSettings:", self, v28);

      }
      v29 = objc_msgSend(v21, "backgroundStyle");
      if (v29 != objc_msgSend(v22, "backgroundStyle"))
      {
        objc_msgSend(v13, "animationSettings");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "remoteAlertSceneHostComponent:didChangeWallpaperStyleWithAnimationSettings:", self, v30);

      }
    }
    if (objc_msgSend(v11, "containsProperty:", sel_preferredSceneDeactivationReason))
      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangePreferredSceneDeactivationReason:", self);
    if (objc_msgSend(v11, "containsProperty:", sel_hidEventDeferringDisabled))
    {
      SBLogTransientOverlay();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = -[SBSUIRemoteAlertSceneHostComponent hidEventDeferringDisabled](self, "hidEventDeferringDisabled");
        objc_msgSend(v10, "identityToken");
        v36 = v16;
        v33 = v10;
        v34 = v12;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v38 = v32;
        v39 = 2114;
        v40 = v35;
        _os_log_impl(&dword_1A471F000, v31, OS_LOG_TYPE_DEFAULT, "received new clientSetting for hidEventDeferringDisabled: %d for remote alert scene %{public}@", buf, 0x12u);

        v12 = v34;
        v10 = v33;
        v16 = v36;
      }

      objc_msgSend(WeakRetained, "remoteAlertSceneHostComponentDidChangeHIDEventDeferringDisabled:", self);
    }

  }
}

- (SBSUIRemoteAlertSceneHostComponentDelegate)delegate
{
  return (SBSUIRemoteAlertSceneHostComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (SBSRemoteAlertConfigurationContext)configurationContext
{
  return self->_configurationContext;
}

- (SBSRemoteAlertActivationContext)activationContext
{
  return self->_activationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_configurationContext, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingTransitioners, 0);
}

@end
