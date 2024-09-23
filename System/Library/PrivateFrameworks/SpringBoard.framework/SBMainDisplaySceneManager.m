@implementation SBMainDisplaySceneManager

- (void)_noteDidCommitUpdateForScene:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) == 0)
  {
    objc_msgSend(v15, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D42708]);

    if (v5)
      -[SBMainDisplaySceneManager _updateLevelAndBackgroundSettingsForScene:transitionContext:](self, "_updateLevelAndBackgroundSettingsForScene:transitionContext:", v15, 0);
  }
  if (-[SBMainDisplaySceneManager _isExternalForegroundScene:](self, "_isExternalForegroundScene:", v15))
  {
    objc_msgSend(v15, "clientProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isApplicationProcess"))
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationWithBundleIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    objc_msgSend((id)SBApp, "appsRegisteredForVolumeEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v9);

    if (v11)
      objc_msgSend((id)SBApp, "setAppRegisteredForVolumeEvents:isActive:", v9, 1);
    objc_msgSend((id)SBApp, "appsRegisteredForLockButtonEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v9);

    if (v13)
      objc_msgSend((id)SBApp, "setAppRegisteredForLockButtonEvents:isActive:", v9, 1);
    -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHasMainSceneBeenForegroundAtLeastOnce:", 1);

  }
  -[SBFaceContactExpectationManager updateFaceContactExpectation](self->_faceContactExpectationManager, "updateFaceContactExpectation");

}

- (BOOL)_isExternalForegroundScene:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBMainDisplaySceneManager externalForegroundApplicationSceneHandles](self, "externalForegroundApplicationSceneHandles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SBClientSettingObserverContext *v15;
  void *v16;
  SBInternalClientSettingObserverContext *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SBSceneManager daemonScenes](self, "daemonScenes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "containsObject:", v10))
  {

LABEL_3:
    v15 = objc_alloc_init(SBClientSettingObserverContext);
    -[SBKeyboardClientSettingObserverContext setScene:]((uint64_t)v15, v10);
    -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v15, v16);

    -[SBCameraHardwareButton setDispatchingRuleAssertion:]((uint64_t)v15, v12);
    -[SBCameraHardwareButton setDeferringRuleAssertion:]((uint64_t)v15, v13);
    -[SBMainDisplaySceneManager _externalClientSettingsDiffInspector](self, "_externalClientSettingsDiffInspector");
    v17 = (SBInternalClientSettingObserverContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "evaluateWithInspector:context:", v17, v15);
LABEL_4:

    goto LABEL_11;
  }
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {

  }
  else
  {
    objc_msgSend(v10, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D42708]);

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(v10, "clientProcess");
  v15 = (SBClientSettingObserverContext *)objc_claimAutoreleasedReturnValue();
  if (-[SBClientSettingObserverContext isCurrentProcess](v15, "isCurrentProcess"))
  {
    objc_msgSend(v10, "clientSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isUISubclass");

    if (v21)
    {
      v17 = objc_alloc_init(SBInternalClientSettingObserverContext);
      -[SBKeyboardClientSettingObserverContext setScene:]((uint64_t)v17, v10);
      -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v17, v22);

      -[SBCameraHardwareButton setDispatchingRuleAssertion:]((uint64_t)v17, v12);
      objc_msgSend(v10, "uiClientSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBCameraHardwareButton setDeferringRuleAssertion:]((uint64_t)v17, v23);

      -[SBCameraHardwareButton setPhysicalButtonOverrideObserver:]((uint64_t)v17, v13);
      -[SBMainDisplaySceneManager _internalClientSettingsDiffInspector](self, "_internalClientSettingsDiffInspector");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "evaluateWithInspector:context:", v24, v17);

      goto LABEL_4;
    }
  }
LABEL_11:

  v25.receiver = self;
  v25.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager _scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:](&v25, sel__scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext_, v10, v11, v12, v13);

}

- (id)_appSceneClientSettingsDiffInspector
{
  UIApplicationSceneClientSettingsDiffInspector *appClientSettingsDiffInspector;
  UIApplicationSceneClientSettingsDiffInspector *v4;
  UIApplicationSceneClientSettingsDiffInspector *v5;
  UIApplicationSceneClientSettingsDiffInspector *v6;
  uint64_t v7;
  void *v8;
  UIApplicationSceneClientSettingsDiffInspector *v9;
  uint64_t v10;
  void *v11;
  UIApplicationSceneClientSettingsDiffInspector *v12;
  uint64_t v13;
  void *v14;
  UIApplicationSceneClientSettingsDiffInspector *v15;
  uint64_t v16;
  void *v17;
  UIApplicationSceneClientSettingsDiffInspector *v18;
  uint64_t v19;
  void *v20;
  UIApplicationSceneClientSettingsDiffInspector *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  UIApplicationSceneClientSettingsDiffInspector *v25;
  uint64_t v26;
  void *v27;
  UIApplicationSceneClientSettingsDiffInspector *v28;
  uint64_t v29;
  void *v30;
  UIApplicationSceneClientSettingsDiffInspector *v31;
  uint64_t v32;
  void *v33;
  UIApplicationSceneClientSettingsDiffInspector *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  UIApplicationSceneClientSettingsDiffInspector *v40;
  void *v41;
  UIApplicationSceneClientSettingsDiffInspector *v42;
  uint64_t v43;
  void *v44;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];

  appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  if (!appClientSettingsDiffInspector)
  {
    v4 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    v5 = self->_appClientSettingsDiffInspector;
    self->_appClientSettingsDiffInspector = v4;

    v6 = self->_appClientSettingsDiffInspector;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v7, &__block_literal_global_126_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeDefaultStatusBarStyleWithBlock:](v6, "observeDefaultStatusBarStyleWithBlock:", v8);

    v9 = self->_appClientSettingsDiffInspector;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v10, &__block_literal_global_127_0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeDefaultStatusBarHiddenWithBlock:](v9, "observeDefaultStatusBarHiddenWithBlock:", v11);

    v12 = self->_appClientSettingsDiffInspector;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v13, &__block_literal_global_128);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeDefaultPNGNameWithBlock:](v12, "observeDefaultPNGNameWithBlock:", v14);

    v15 = self->_appClientSettingsDiffInspector;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v16, &__block_literal_global_129_1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeDefaultPNGExpirationTimeWithBlock:](v15, "observeDefaultPNGExpirationTimeWithBlock:", v17);

    v18 = self->_appClientSettingsDiffInspector;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v19, &__block_literal_global_130_1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeIdleTimerDisabledWithBlock:](v18, "observeIdleTimerDisabledWithBlock:", v20);

    v21 = self->_appClientSettingsDiffInspector;
    v22 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_138;
    v48[3] = &unk_1E8EBB7B0;
    v48[4] = self;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v23, v48);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeProximityDetectionModesWithBlock:](v21, "observeProximityDetectionModesWithBlock:", v24);

    v25 = self->_appClientSettingsDiffInspector;
    v47[0] = v22;
    v47[1] = 3221225472;
    v47[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2_139;
    v47[3] = &unk_1E8EBB7B0;
    v47[4] = self;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v26, v47);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeBackgroundStyleWithBlock:](v25, "observeBackgroundStyleWithBlock:", v27);

    v28 = self->_appClientSettingsDiffInspector;
    v46[0] = v22;
    v46[1] = 3221225472;
    v46[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_5_146;
    v46[3] = &unk_1E8EBB7B0;
    v46[4] = self;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v29, v46);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeWindowOverlayInsetsWithBlock:](v28, "observeWindowOverlayInsetsWithBlock:", v30);

    v31 = self->_appClientSettingsDiffInspector;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v32, &__block_literal_global_148);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeReachabilitySupportedWithBlock:](v31, "observeReachabilitySupportedWithBlock:", v33);

    v34 = self->_appClientSettingsDiffInspector;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v35, &__block_literal_global_151_2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeBrightnessLevelWithBlock:](v34, "observeBrightnessLevelWithBlock:", v36);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "userInterfaceIdiom");

    if ((v38 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v39 = -[UIApplicationSceneClientSettingsDiffInspector observeActivationConditionsDataWithBlock:](self->_appClientSettingsDiffInspector, "observeActivationConditionsDataWithBlock:", &__block_literal_global_152_0);
    v40 = self->_appClientSettingsDiffInspector;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v39, &__block_literal_global_156_0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeCanvasTitleWithBlock:](v40, "observeCanvasTitleWithBlock:", v41);

    v42 = self->_appClientSettingsDiffInspector;
    __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v43, &__block_literal_global_158_0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observePreferredPointerLockStateWithBlock:](v42, "observePreferredPointerLockStateWithBlock:", v44);

    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  }
  return appClientSettingsDiffInspector;
}

- (id)externalForegroundApplicationSceneHandles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager externalForegroundApplicationSceneHandles](&v3, sel_externalForegroundApplicationSceneHandles);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)existingSceneHandleForScene:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager existingSceneHandleForScene:](&v4, sel_existingSceneHandleForScene_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)existingSceneHandleForSceneIdentity:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager existingSceneHandleForSceneIdentity:](&v4, sel_existingSceneHandleForSceneIdentity_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_shouldTrackScenesForDeactivation
{
  return 1;
}

- (id)_internalClientSettingsDiffInspector
{
  UIApplicationSceneClientSettingsDiffInspector *internalClientSettingsDiffInspector;
  UIApplicationSceneClientSettingsDiffInspector *v4;
  UIApplicationSceneClientSettingsDiffInspector *v5;
  UIApplicationSceneClientSettingsDiffInspector *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  UIApplicationSceneClientSettingsDiffInspector *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];

  internalClientSettingsDiffInspector = self->_internalClientSettingsDiffInspector;
  if (!internalClientSettingsDiffInspector)
  {
    v4 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    v5 = self->_internalClientSettingsDiffInspector;
    self->_internalClientSettingsDiffInspector = v4;

    v6 = self->_internalClientSettingsDiffInspector;
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_3;
    v15[3] = &unk_1E8EBB6E8;
    v15[4] = self;
    __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke(v8, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observeProximityDetectionModesWithBlock:](v6, "observeProximityDetectionModesWithBlock:", v9);

    v10 = self->_internalClientSettingsDiffInspector;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_4;
    v14[3] = &unk_1E8EBB6E8;
    v14[4] = self;
    __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke(v11, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneClientSettingsDiffInspector observePhysicalButtonConfigurationsWithBlock:](v10, "observePhysicalButtonConfigurationsWithBlock:", v12);

    internalClientSettingsDiffInspector = self->_internalClientSettingsDiffInspector;
  }
  return internalClientSettingsDiffInspector;
}

- (id)_externalClientSettingsDiffInspector
{
  FBSSceneClientSettingsDiffInspector *externalClientSettingsDiffInspector;
  FBSSceneClientSettingsDiffInspector *v4;
  FBSSceneClientSettingsDiffInspector *v5;
  FBSSceneClientSettingsDiffInspector *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  FBSSceneClientSettingsDiffInspector *v10;
  uint64_t v11;
  void *v12;
  FBSSceneClientSettingsDiffInspector *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  externalClientSettingsDiffInspector = self->_externalClientSettingsDiffInspector;
  if (!externalClientSettingsDiffInspector)
  {
    v4 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0D231D0]);
    v5 = self->_externalClientSettingsDiffInspector;
    self->_externalClientSettingsDiffInspector = v4;

    v6 = self->_externalClientSettingsDiffInspector;
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_3;
    v19[3] = &unk_1E8EBB8C0;
    v19[4] = self;
    __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke(v8, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneClientSettingsDiffInspector observePreferredLevelWithBlock:](v6, "observePreferredLevelWithBlock:", v9);

    v10 = self->_externalClientSettingsDiffInspector;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_4;
    v18[3] = &unk_1E8EBB8C0;
    v18[4] = self;
    __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke(v11, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneClientSettingsDiffInspector observePreferredSceneHostIdentifierWithBlock:](v10, "observePreferredSceneHostIdentifierWithBlock:", v12);

    v13 = self->_externalClientSettingsDiffInspector;
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_5;
    v17[3] = &unk_1E8EBB8C0;
    v17[4] = self;
    __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke(v14, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneClientSettingsDiffInspector observePreferredSceneHostIdentityWithBlock:](v13, "observePreferredSceneHostIdentityWithBlock:", v15);

    externalClientSettingsDiffInspector = self->_externalClientSettingsDiffInspector;
  }
  return externalClientSettingsDiffInspector;
}

void __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_3(uint64_t a1, id *a2)
{
  void *v2;
  id *v3;
  id v4;
  id *v5;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = a2;
    a2 = (id *)a2[1];
    v4 = v3[4];
  }
  else
  {
    v4 = 0;
  }
  v5 = a2;
  objc_msgSend(v2, "_updateLevelAndBackgroundSettingsForScene:transitionContext:", a2, v4);

}

void __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_5(uint64_t a1, id *a2)
{
  void *v2;
  id *v3;
  id v4;
  id *v5;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = a2;
    a2 = (id *)a2[1];
    v4 = v3[4];
  }
  else
  {
    v4 = 0;
  }
  v5 = a2;
  objc_msgSend(v2, "_updateLevelAndBackgroundSettingsForScene:transitionContext:", a2, v4);

}

- (void)_updateLevelAndBackgroundSettingsForScene:(id)a3 transitionContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  char v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "clientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredLevel");
  v9 = v8;
  objc_msgSend(v5, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isForeground");

  v12 = fmax(v9, 0.0);
  if (*MEMORY[0x1E0D22E40] <= v12)
    v13 = *MEMORY[0x1E0D22E40];
  else
    v13 = v12;
  objc_msgSend(v5, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "level");
  if (v15 == v13)
  {
    objc_msgSend(v5, "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isForeground");

    if (v11 == v17)
      goto LABEL_11;
  }
  else
  {

  }
  SBLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    v25 = 2048;
    v26 = v13;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "Scene %{public}@ is changing level to: %f", buf, 0x16u);
  }

  v19 = (void *)MEMORY[0x1E0CEA918];
  objc_msgSend(v6, "animationFence");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_synchronizeDrawingWithFence:", v20);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__SBMainDisplaySceneManager__updateLevelAndBackgroundSettingsForScene_transitionContext___block_invoke;
  v21[3] = &__block_descriptor_41_e33_v16__0__FBSMutableSceneSettings_8l;
  *(double *)&v21[4] = v13;
  v22 = v11;
  objc_msgSend(v5, "updateSettingsWithBlock:", v21);
LABEL_11:

}

- (BOOL)_shouldFenceTransitionForScene:(id)a3 updatedClientSettingsDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!-[SBMainDisplaySceneManager _isExternalForegroundScene:](self, "_isExternalForegroundScene:", v10))
    goto LABEL_7;
  objc_msgSend(v10, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deactivationReasons");
  if (!UIApplicationSceneDeactivationReasonMaskContainsReason())
  {

LABEL_7:
    v18.receiver = self;
    v18.super_class = (Class)SBMainDisplaySceneManager;
    v16 = -[SBSceneManager _shouldFenceTransitionForScene:updatedClientSettingsDiff:oldClientSettings:transitionContext:](&v18, sel__shouldFenceTransitionForScene_updatedClientSettingsDiff_oldClientSettings_transitionContext_, v10, v11, v12, v13);
    goto LABEL_8;
  }
  SBLogWorkspace();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v10;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "Not fencing scene transistion with scene: %{public}@ because it is deactivated for system gestures", buf, 0xCu);
  }

  v16 = 0;
LABEL_8:

  return v16;
}

- (void)_scene:(id)a3 interceptUpdateWithNewSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  SBDisplayReferenceModeMonitor *displayReferenceModeMonitor;
  SBDisplayReferenceModeMonitor *v15;
  SBDisplayReferenceModeMonitor *v16;
  SBDisplayReferenceModeMonitor *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v6 = a4;
  -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[SBSuspendedUnderLockManager interceptUpdateForScene:withNewSettings:](self->_lazy_suspendedUnderLockManager, "interceptUpdateForScene:withNewSettings:", v23, v6);
  objc_msgSend(v23, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isForeground");
  v10 = v9 ^ objc_msgSend(v6, "isForeground");

  if ((v10 & 1) != 0)
  {
    if ((objc_msgSend(v6, "isUISubclass") & 1) == 0)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(v23, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isForeground") & 1) == 0 || !objc_msgSend(v6, "isUISubclass"))
    {

      goto LABEL_12;
    }
  }
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:](SBDisplayReferenceModeMonitor, "canAddObserverForDisplayWithConfiguration:", v12);

  if ((v10 & 1) != 0)
  {
    if (!v13)
      goto LABEL_12;
  }
  else
  {

    if (!v13)
      goto LABEL_12;
  }
  displayReferenceModeMonitor = self->_displayReferenceModeMonitor;
  if (!displayReferenceModeMonitor)
  {
    v15 = objc_alloc_init(SBDisplayReferenceModeMonitor);
    v16 = self->_displayReferenceModeMonitor;
    self->_displayReferenceModeMonitor = v15;

    v17 = self->_displayReferenceModeMonitor;
    -[SBSceneManager displayIdentity](self, "displayIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDisplayReferenceModeMonitor addReferenceModeStatusObserver:forDisplayWithConfiguration:](v17, "addReferenceModeStatusObserver:forDisplayWithConfiguration:", self, v19);

    displayReferenceModeMonitor = self->_displayReferenceModeMonitor;
  }
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SBDisplayReferenceModeMonitor referenceModeStatusForDisplayWithConfiguration:](displayReferenceModeMonitor, "referenceModeStatusForDisplayWithConfiguration:", v21);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setScreenReferenceDisplayModeStatus:", v22);
LABEL_12:

}

uint64_t __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SBMainDisplayPolicyAggregator)policyAggregator
{
  return self->_policyAggregator;
}

- (BOOL)hasIdleTimerBehaviors
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[SBMainDisplaySceneManager _windowScene](self, "_windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutStateApplicationSceneHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (id)_windowScene
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)layoutStateManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layoutStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_noteDidChangeToVisibility:(unint64_t)a3 previouslyExisted:(BOOL)a4 forScene:(id)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;

  v5 = a4;
  v21 = a5;
  objc_msgSend(v21, "clientProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isApplicationProcess"))
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationWithBundleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  +[SBBackgroundActivityAttributionManager sharedInstance](SBBackgroundActivityAttributionManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateForegroundApplicationSceneHandles:withOptions:completion:", v16, -1, 0);

  if (v11)
    objc_msgSend(v11, "setHasProminentlyIndicatedLocationUseWhileForeground:", 0);
  if (a3 == 1)
  {
    if (v11)
    {
      if (objc_msgSend(v11, "hasRegisteredBackgroundActivityWithIdentifier:", *MEMORY[0x1E0DB0AF0]))
        objc_msgSend((id)SBApp, "nowLocatingAppDidEnterForeground:", v11);
      objc_msgSend(v12, "_setIdleTimerCoordinator:", self);
      v20 = -[SBMainDisplaySceneManager _proposeIdleTimerBehaviorForReason:](self, "_proposeIdleTimerBehaviorForReason:", CFSTR("SBAppDidEnterForeground"));
    }
  }
  else if (!a3 && v11)
  {
    objc_msgSend(v12, "_setIdleTimerCoordinator:", 0);
    if (v5)
      v18 = -[SBMainDisplaySceneManager _proposeIdleTimerBehaviorForReason:](self, "_proposeIdleTimerBehaviorForReason:", CFSTR("SBAppDidEnterBackground"));
    objc_msgSend((id)SBApp, "audioRecordingManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "verifyBackgroundAudioActivityForApplication:", v11);

  }
}

- (id)_proposeIdleTimerBehaviorForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBMainDisplaySceneManager coordinatorRequestedIdleTimerBehavior:](self, "coordinatorRequestedIdleTimerBehavior:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplaySceneManager idleTimerCoordinator](self, "idleTimerCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idleTimerProvider:didProposeBehavior:forReason:", self, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[SBMainDisplaySceneManager _windowScene](self, "_windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutStateApplicationSceneHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__SBMainDisplaySceneManager_coordinatorRequestedIdleTimerBehavior___block_invoke;
  v10[3] = &unk_1E8EBB8E8;
  v10[4] = &v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  if (*((_BYTE *)v12 + 24))
    +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior");
  else
    +[SBIdleTimerBehavior autoLockBehavior](SBIdleTimerBehavior, "autoLockBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)_scene:(id)a3 willUpdateWithSettings:(id)a4 transitionContext:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  id v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  id v25;

  v25 = a3;
  v7 = a4;
  v8 = (void *)SBApp;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v25, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Workspace will update scene with identifier %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateMirroredDisplayOrientationWithLogMessage:", v11);

  -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplaySceneManager externalForegroundApplicationSceneHandles](self, "externalForegroundApplicationSceneHandles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v12);

  if (v12 && v15)
  {
    v16 = objc_msgSend(v13, "isOccluded") ? objc_msgSend(v13, "isIgnoringOcclusions") : 1;
    v17 = objc_msgSend(v7, "isOccluded") ? objc_msgSend(v7, "isIgnoringOcclusions") ^ 1 : 0;
    if (((v16 | v17) & 1) == 0)
      v18 = -[SBMainDisplaySceneManager _proposeIdleTimerBehaviorForReason:](self, "_proposeIdleTimerBehaviorForReason:", CFSTR("SBApplicationSceneHandle"));
  }
  v19 = objc_msgSend(v13, "isForeground");
  v20 = objc_msgSend(v7, "isForeground");
  if (v12)
  {
    v21 = v20;
    -[SBMainDisplaySceneManager externalApplicationSceneHandles](self, "externalApplicationSceneHandles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsObject:", v12);

    if (((v19 ^ 1 | v21) & 1) == 0 && v23 && (objc_msgSend(v12, "shouldAlwaysDisplayLiveContent") & 1) == 0)
    {
      objc_msgSend(v25, "createSnapshot");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "saveSuspendSnapshot:", v24);

    }
  }

}

- (id)externalApplicationSceneHandles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager externalApplicationSceneHandles](&v3, sel_externalApplicationSceneHandles);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fetchOrCreateApplicationSceneHandleForRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager fetchOrCreateApplicationSceneHandleForRequest:](&v4, sel_fetchOrCreateApplicationSceneHandleForRequest_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_6_147(uint64_t a1, void *a2)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(a2, "updatedClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReachabilitySupported");

  if ((v3 & 1) == 0)
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateReachability");

  }
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "updatedClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "idleTimerDisabled");

  objc_msgSend(v2, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isForeground");

  SBLogIdleTimer();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "scene");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = "NO";
    if (v4)
      v10 = "YES";
    v11 = " (ignoring because isBackgrounded)";
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v20 = v10;
    v19 = 2080;
    if (v6)
      v11 = "";
    v21 = 2080;
    v22 = v11;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ is setting idleTimerDisabled to: %s%s", buf, 0x20u);

  }
  if (v6)
  {
    objc_msgSend(v2, "scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientProcess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("IdleTimerDisableChangedForMainDisplaySceneManager - client:"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resetIdleTimerForReason:", v16);

  }
}

void __67__SBMainDisplaySceneManager_coordinatorRequestedIdleTimerBehavior___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isValid"))
  {
    objc_msgSend(v6, "uiClientSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "idleTimerDisabled");

    objc_msgSend(v6, "clientProcess");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isApplicationProcess"))
      v10 = objc_msgSend(v9, "isBeingDebugged");
    else
      v10 = 0;
    if ((v8 | v10) == 1)
    {
      SBLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "sceneIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = 67109890;
        v14[1] = v8;
        v15 = 1024;
        v16 = v10;
        v17 = 2112;
        v18 = v12;
        v19 = 2048;
        v20 = v5;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "found a scene that has disabled the idle timer (idleTimerDisabled: %d, isBeingDebugged: %d): %@ (%p)", (uint8_t *)v14, 0x22u);

      }
      SBLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __67__SBMainDisplaySceneManager_coordinatorRequestedIdleTimerBehavior___block_invoke_cold_1((uint64_t)v5, v13);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }

  }
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_5_146(uint64_t a1, void *a2)
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a2;
  objc_msgSend(v28, "updatedClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryWindowOverlayInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(v28, "app");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v28;
  if (v12)
  {
    objc_msgSend(v28, "sceneHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sceneIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "currentLayoutState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "elementWithRole:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "isEqualToString:", v18);

    if ((v19 & 1) != 0)
    {
      v20 = 2;
    }
    else
    {
      objc_msgSend(v16, "elementWithRole:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uniqueIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v15, "isEqualToString:", v22);

      if (!v23)
      {
LABEL_7:

        v13 = v28;
        goto LABEL_8;
      }
      v20 = 3;
    }
    objc_msgSend((id)SBApp, "windowSceneManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "displayIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "windowSceneForDisplayIdentity:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pictureInPictureManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "applyPictureInPictureInsets:forSource:", v20, v5, v7, v9, v11);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_shouldAutoHostScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) != 0
    || (v4 = (void *)*MEMORY[0x1E0D42708],
        objc_msgSend(v3, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = objc_msgSend(v4, "isEqualToString:", v5),
        v5,
        (v4 & 1) == 0))
  {
    objc_msgSend(v3, "clientProcess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !objc_msgSend(v7, "isApplicationProcess") || objc_msgSend(v7, "isCurrentProcess");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  Class v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = NSClassFromString(CFSTR("UIKeyboardArbiterManager"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class performSelector:](v4, "performSelector:", sel_sharedArbiterManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "remoteKeyboardUndocked") ^ 1;

  }
  else
  {
    v6 = 0;
  }
  if (self->_isKeyboardDocked != v6)
  {
    self->_isKeyboardDocked = v6;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("SBKeyboardDockedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isKeyboardDocked);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("SBKeyboardDockedChangedNotification"), 0, v9);

  }
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager addObserver:](&v3, sel_addObserver_, a3);
}

void __89__SBMainDisplaySceneManager__updateLevelAndBackgroundSettingsForScene_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevel:", v3);
  objc_msgSend(v4, "setForeground:", *(unsigned __int8 *)(a1 + 40));

}

void __52__SBMainDisplaySceneManager__handleAction_forScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
    objc_msgSend(*(id *)(a1 + 32), "sendResponse:", v3);

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  -[NSMapTable objectForKey:](self->_blsActionHandlersForScenes, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "respondToActions:forFBScene:", v7, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "intersectSet:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  v14.receiver = self;
  v14.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager scene:didReceiveActions:](&v14, sel_scene_didReceiveActions_, v6, v7);

}

- (BOOL)_handleAction:(id)a3 forScene:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "UIActionType");
  if (v8 > 14)
  {
    if (v8 == 15)
    {
      if (os_variant_has_internal_content())
      {
        v25 = v6;
        if (objc_msgSend(v25, "shouldChangeOrientation"))
        {
          v26 = objc_msgSend(v25, "orientationRequested");
          if ((unint64_t)(v26 - 1) <= 3)
          {
            v42[0] = *MEMORY[0x1E0CA55C8];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v43[0] = v27;
            v42[1] = *MEMORY[0x1E0CA55B8];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v43[1] = v28;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "postNotificationName:object:userInfo:deliverImmediately:", *MEMORY[0x1E0CA55C0], 0, v29, 1);

          }
        }

      }
      goto LABEL_25;
    }
    if (v8 == 43)
    {
      v38 = 0;
      v39 = &v38;
      v40 = 0x2050000000;
      v16 = (void *)getLNAppConnectionListenerClass_softClass;
      v41 = getLNAppConnectionListenerClass_softClass;
      v17 = MEMORY[0x1E0C809B0];
      if (!getLNAppConnectionListenerClass_softClass)
      {
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __getLNAppConnectionListenerClass_block_invoke;
        v37[3] = &unk_1E8E9ED40;
        v37[4] = &v38;
        __getLNAppConnectionListenerClass_block_invoke((uint64_t)v37);
        v16 = (void *)v39[3];
      }
      v18 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v38, 8);
      objc_msgSend(v18, "sharedListener");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v17;
      v35[1] = 3221225472;
      v35[2] = __52__SBMainDisplaySceneManager__handleAction_forScene___block_invoke;
      v35[3] = &unk_1E8EB4D58;
      v36 = v6;
      objc_msgSend(v19, "handleAction:completionHandler:", v36, v35);

      goto LABEL_25;
    }
LABEL_18:
    v34.receiver = self;
    v34.super_class = (Class)SBMainDisplaySceneManager;
    if (-[SBSceneManager _handleAction:forScene:](&v34, sel__handleAction_forScene_, v6, v7))
    {
LABEL_25:
      v24 = 1;
      goto LABEL_26;
    }
LABEL_21:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = 0;
      goto LABEL_26;
    }
    -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
      SBWorkspaceSuspendApplicationScene(v31);

    goto LABEL_25;
  }
  if (v8 != 1)
  {
    if (v8 == 7)
    {
      if (-[SBMainDisplaySceneManager _isExternalForegroundScene:](self, "_isExternalForegroundScene:", v7))
      {
        objc_msgSend(v6, "statusBarStyleOverride");
        STUIBackgroundActivityIdentifierForStyleOverride();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "clientProcess");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "applicationWithBundleIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBMainDisplaySceneManager _windowScene](self, "_windowScene");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        SBWorkspaceHandleStatusBarReturnActionFromApp(v13, v14, v9, v15);

      }
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  objc_msgSend(v7, "clientProcess");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "isCurrentProcess"))
  {

    goto LABEL_21;
  }
  v21 = (void *)SBApp;
  objc_msgSend(v6, "url");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 1;
  objc_msgSend(v21, "applicationOpenURL:withApplication:animating:activationSettings:origin:notifyLSOnFailure:withResult:", v22, 0, 1, 0, v23, 1, 0);

LABEL_26:
  return v24;
}

- (SBMainDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5
{
  return -[SBMainDisplaySceneManager initWithReference:sceneIdentityProvider:presentationBinder:snapshotBehavior:](self, "initWithReference:sceneIdentityProvider:presentationBinder:snapshotBehavior:", a3, a4, a5, 1);
}

- (SBMainDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  SBMainDisplaySceneManager *v13;
  SBMainDisplaySceneManager *v14;
  void *v15;
  SBMainDisplayPolicyAggregator *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SBMainDisplayPolicyAggregator *policyAggregator;
  SBFaceContactExpectationManager *v21;
  SBFaceContactExpectationManager *faceContactExpectationManager;
  id *v23;
  SBPhysicalButtonSceneOverrideManager *physicalButtonSceneOverrideManager;
  id v25;
  uint64_t v26;
  BSInvalidatable *stateCaptureInvalidatable;
  uint64_t v29;
  id v30;
  id location;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v32.receiver = self;
  v32.super_class = (Class)SBMainDisplaySceneManager;
  v13 = -[SBSceneManager initWithReference:sceneIdentityProvider:presentationBinder:snapshotBehavior:](&v32, sel_initWithReference_sceneIdentityProvider_presentationBinder_snapshotBehavior_, v10, v11, v12, a6);
  v14 = v13;
  if (v13)
  {
    v13->_validInterfaceOrientation = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0CEB960], 0);
    v16 = [SBMainDisplayPolicyAggregator alloc];
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneManager displayIdentity](v14, "displayIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SBMainDisplayPolicyAggregator initWithDefaults:displayIdentity:](v16, "initWithDefaults:displayIdentity:", v17, v18);
    policyAggregator = v14->_policyAggregator;
    v14->_policyAggregator = (SBMainDisplayPolicyAggregator *)v19;

    v21 = -[SBFaceContactExpectationManager initWithSceneManager:]([SBFaceContactExpectationManager alloc], "initWithSceneManager:", v14);
    faceContactExpectationManager = v14->_faceContactExpectationManager;
    v14->_faceContactExpectationManager = v21;

    v23 = -[SBPhysicalButtonSceneOverrideManager initWithSceneManager:]((id *)[SBPhysicalButtonSceneOverrideManager alloc], v14);
    physicalButtonSceneOverrideManager = v14->_physicalButtonSceneOverrideManager;
    v14->_physicalButtonSceneOverrideManager = (SBPhysicalButtonSceneOverrideManager *)v23;

    objc_initWeak(&location, v14);
    v25 = MEMORY[0x1E0C80D38];
    v29 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v30, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v26 = objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = v14->stateCaptureInvalidatable;
    v14->stateCaptureInvalidatable = (BSInvalidatable *)v26;

    objc_msgSend(v11, "setDataSource:", v14, v29, 3221225472, __105__SBMainDisplaySceneManager_initWithReference_sceneIdentityProvider_presentationBinder_snapshotBehavior___block_invoke, &unk_1E8EA12C0);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return v14;
}

id __105__SBMainDisplaySceneManager_initWithReference_sceneIdentityProvider_presentationBinder_snapshotBehavior___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v17[0] = CFSTR("externalApplicationSceneHandles");
    objc_msgSend(WeakRetained, "externalApplicationSceneHandles");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (const __CFString *)v3;
    else
      v5 = CFSTR("none");
    v18[0] = v5;
    v17[1] = CFSTR("externalForegroundApplicationSceneHandles");
    objc_msgSend(v2, "externalForegroundApplicationSceneHandles");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = CFSTR("none");
    v18[1] = v8;
    v17[2] = CFSTR("currentLayoutState");
    objc_msgSend(v2, "currentLayoutState");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = CFSTR("none");
    v18[2] = v11;
    v17[3] = CFSTR("hasIdleTimerBehaviors");
    if (objc_msgSend(v2, "hasIdleTimerBehaviors"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v18[3] = v12;
    v17[4] = CFSTR("suspendedUnderLock");
    if (objc_msgSend(v2, "isSuspendedUnderLock"))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v18[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_internalClientSettingsDiffInspector, "removeAllObservers");
  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_appClientSettingsDiffInspector, "removeAllObservers");
  -[FBSSceneClientSettingsDiffInspector removeAllObservers](self->_externalClientSettingsDiffInspector, "removeAllObservers");
  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager dealloc](&v4, sel_dealloc);
}

- (id)existingSceneHandleForPersistenceIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager existingSceneHandleForPersistenceIdentifier:](&v4, sel_existingSceneHandleForPersistenceIdentifier_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager removeObserver:](&v3, sel_removeObserver_, a3);
}

- (BOOL)isSuspendedUnderLock
{
  BSDispatchQueueAssertMain();
  return -[SBSuspendedUnderLockManager isSuspendedUnderLock](self->_lazy_suspendedUnderLockManager, "isSuspendedUnderLock");
}

- (void)setSuspendedUnderLock:(BOOL)a3
{
  -[SBMainDisplaySceneManager setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:](self, "setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:", a3, 0, 0);
}

- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  SBSuspendedUnderLockManager *lazy_suspendedUnderLockManager;
  SBSuspendedUnderLockManager *v10;
  void *v11;
  void *v12;
  SBSuspendedUnderLockManager *v13;
  SBSuspendedUnderLockManager *v14;
  id v15;

  v6 = a3;
  v15 = a4;
  v8 = a5;
  BSDispatchQueueAssertMain();
  lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  if (!lazy_suspendedUnderLockManager)
  {
    v10 = [SBSuspendedUnderLockManager alloc];
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBSuspendedUnderLockManager initWithDelegate:eventQueue:](v10, "initWithDelegate:eventQueue:", self, v12);
    v14 = self->_lazy_suspendedUnderLockManager;
    self->_lazy_suspendedUnderLockManager = v13;

    lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  }
  -[SBSuspendedUnderLockManager setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:](lazy_suspendedUnderLockManager, "setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:", v6, v15, v8);

}

- (void)windowSceneDidConnect:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBMainDisplaySceneManager;
  v4 = a3;
  -[SBSceneManager windowSceneDidConnect:](&v5, sel_windowSceneDidConnect_, v4);
  -[SBPhysicalButtonSceneOverrideManager windowSceneDidConnect:]((id *)&self->_physicalButtonSceneOverrideManager->super.isa, v4);

}

- (id)acquireIgnoreSuspendedUnderLockAssertionForSceneIdentifier:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *sceneIdentifierToIgnoreSuspendedUnderLockAssertions;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D01868]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__SBMainDisplaySceneManager_acquireIgnoreSuspendedUnderLockAssertionForSceneIdentifier_reason___block_invoke;
  v16[3] = &unk_1E8EA4CC0;
  objc_copyWeak(&v18, &location);
  v9 = v6;
  v17 = v9;
  v10 = (void *)objc_msgSend(v8, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBMainDisplaySceneManager.IgnoreSuspendedUnderLock"), v7, v16);
  -[NSMutableDictionary objectForKey:](self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sceneIdentifierToIgnoreSuspendedUnderLockAssertions = self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions;
    if (!sceneIdentifierToIgnoreSuspendedUnderLockAssertions)
    {
      v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v14 = self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions;
      self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions = v13;

      sceneIdentifierToIgnoreSuspendedUnderLockAssertions = self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions;
    }
    -[NSMutableDictionary setObject:forKey:](sceneIdentifierToIgnoreSuspendedUnderLockAssertions, "setObject:forKey:", v11, v9);
  }
  objc_msgSend(v11, "addObject:", v10);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

void __95__SBMainDisplaySceneManager_acquireIgnoreSuspendedUnderLockAssertionForSceneIdentifier_reason___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[40], "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v7);
    if (!objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4[40], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
      if (!objc_msgSend(v4[40], "count"))
      {
        v6 = v4[40];
        v4[40] = 0;

      }
    }

  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isForeground");

    if (v10)
    {
      SBLogIdleTimer();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[SBMainDisplaySceneManager sceneManager:didDestroyScene: %{public}@] - proposing IdleTimerBehavior.", buf, 0xCu);
      }

      v12 = -[SBMainDisplaySceneManager _proposeIdleTimerBehaviorForReason:](self, "_proposeIdleTimerBehaviorForReason:", CFSTR("SBApplicationSceneDestroyed"));
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SBMainDisplaySceneManager;
  -[SBSceneManager sceneManager:didDestroyScene:](&v13, sel_sceneManager_didDestroyScene_, v6, v7);

}

- (id)suspendedUnderLockManagerDisplayConfiguration:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneManager displayIdentity](self, "displayIdentity", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)suspendedUnderLockManager:(id)a3 sceneHandleForScene:(id)a4
{
  return -[SBMainDisplaySceneManager existingSceneHandleForScene:](self, "existingSceneHandleForScene:", a4);
}

- (id)suspendedUnderLockManagerVisibleScenes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplaySceneManager _windowScene](self, "_windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutStateApplicationSceneHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v7);

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pipCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostedAppSceneHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  return v4;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventUnderLockForScene:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "clientHandle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.PosterBoard"));
  return (char)v4;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventSuspendUnderLockForScene:(id)a4 settings:(id)a5
{
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;

  v7 = a4;
  objc_msgSend(a5, "sb_displayIdentityForSceneManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isContinuityDisplay");

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[NSMutableDictionary objectForKey:](self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "count") != 0;

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void)addActionHandler:(id)a3 forScene:(id)a4
{
  id v6;
  NSMapTable *blsActionHandlersForScenes;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  if (!blsActionHandlersForScenes)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_blsActionHandlersForScenes;
    self->_blsActionHandlersForScenes = v8;

    blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  }
  -[NSMapTable objectForKey:](blsActionHandlersForScenes, "objectForKey:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3690]);
    -[NSMapTable setObject:forKey:](self->_blsActionHandlersForScenes, "setObject:forKey:", v10, v6);
  }
  objc_msgSend(v10, "addObject:", v11);

}

- (void)removeActionHandler:(id)a3 forScene:(id)a4
{
  NSMapTable *blsActionHandlersForScenes;
  id v6;
  id v7;

  blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  v6 = a3;
  -[NSMapTable objectForKey:](blsActionHandlersForScenes, "objectForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

}

id __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E8E9E1D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");

  return v4;
}

uint64_t __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  char v6;
  void *v7;
  char v8;
  _QWORD *v9;

  v3 = a2;
  v9 = v3;
  if (v3)
    v4 = (void *)v3[3];
  else
    v4 = 0;
  v5 = v4;
  v6 = objc_msgSend(v5, "proximityDetectionModes");
  v7 = v9;
  if (v9)
    v7 = (void *)v9[4];
  v8 = objc_msgSend(v7, "proximityDetectionModes") ^ v6;

  if ((v8 & 0xC) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "updateFaceContactExpectation");

}

void __65__SBMainDisplaySceneManager__internalClientSettingsDiffInspector__block_invoke_4(uint64_t a1)
{
  -[SBPhysicalButtonSceneOverrideManager _reevaluateOverrides](*(id **)(*(_QWORD *)(a1 + 32) + 304));
}

id __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E8E9E1D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");

  return v4;
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = a2;
  objc_msgSend(v2, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneStoreForIdentifier:creatingIfNecessary:", v6, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "updatedClientSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "defaultStatusBarStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("statusBarStyle"));

}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = a2;
  objc_msgSend(v2, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneStoreForIdentifier:creatingIfNecessary:", v6, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "updatedClientSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "defaultStatusBarHidden"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("statusBarHidden"));

}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "updatedClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultPNGName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v9, "app");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_dataStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneStoreForIdentifier:creatingIfNecessary:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setObject:forKey:", v3, CFSTR("defaultPNGName"));
  }

}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "updatedClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultPNGExpirationTime");
  v4 = v3;

  if (v4 - CFAbsoluteTimeGetCurrent() < 3153600000.0)
  {
    objc_msgSend(v11, "app");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_dataStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneStoreForIdentifier:creatingIfNecessary:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("expirationAbsoluteTime"));

  }
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "oldClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "proximityDetectionModes");
  objc_msgSend(v3, "updatedClientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v6, "proximityDetectionModes") ^ v5;
  if ((v3 & 0xC) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "updateFaceContactExpectation");
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2_139(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v3 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v4 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v3, "transition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factoryWithSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D01908];
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_3_141;
  v18[3] = &unk_1E8E9E868;
  v10 = v3;
  v19 = v10;
  v20 = &v21;
  objc_msgSend(v8, "animateWithFactory:actions:", v7, v18);
  if (*((_BYTE *)v22 + 24))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    objc_msgSend(*(id *)(a1 + 32), "externalForegroundApplicationSceneHandles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_4_143;
    v13[3] = &unk_1E8EBB7D8;
    v13[4] = &v14;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

    if (*((_BYTE *)v15 + 24))
    {
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activateOrientationSource:", 1);
    }
    else
    {
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deactivateOrientationSource:", 1);
    }

    _Block_object_dispose(&v14, 8);
  }

  _Block_object_dispose(&v21, 8);
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_3_141(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "oldClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "backgroundStyleForRequestedBackgroundStyle:", objc_msgSend(v4, "backgroundStyle"));

  objc_msgSend(*(id *)(a1 + 32), "app");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updatedClientSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "backgroundStyleForRequestedBackgroundStyle:", objc_msgSend(v8, "backgroundStyle"));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5 != v9;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneHandle");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_noteMainSceneBackgroundStyleChanged");

  }
}

uint64_t __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_4_143(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isTranslucent");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_7_150(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isForeground");

  if (v4)
  {
    objc_msgSend(v6, "updatedClientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brightnessLevel");

    BKSDisplayBrightnessSetWithImplicitTransaction();
  }

}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v2 = a2;
  objc_msgSend(v2, "updatedClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activationConditionsData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneStoreForIdentifier:creatingIfNecessary:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    if (v10)
    {
      v17 = 0;
      v18 = 0;
      v12 = objc_msgSend(v10, "_validateCompileTimeIssues:runTimeIssues:", &v18, &v17);
      v13 = v18;
      v14 = v17;
      if (v12)
      {
        objc_msgSend(v9, "setArchivedObject:forKey:", v10, CFSTR("activationConditions"));
      }
      else
      {
        SBLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8_cold_2((uint64_t)v13, (uint64_t)v14, v15);

      }
    }
    else
    {
      SBLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8_cold_1(v11, v13);
    }

  }
  else
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("activationConditions"));
  }
  objc_msgSend(v2, "sceneHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_noteActivationConditionsChanged");

}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_155(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "updatedClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "canvasTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "app");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneStoreForIdentifier:creatingIfNecessary:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v8, "setObject:forKey:", v3, CFSTR("canvasTitle"));
  else
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("canvasTitle"));
  objc_msgSend(v10, "sceneHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_noteSceneTitleChanged");

}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2_157(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = a2;
  objc_msgSend(v2, "updatedClientSettings");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v11, "preferredPointerLockStatus");
  objc_msgSend(v2, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowSceneForDisplayIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lockedPointerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "clientWithSceneIdentifier:prefersPointerLockStatus:", v5, v3);
}

- (BOOL)_isLockscreenHostingApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  id v10;

  v3 = a3;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockScreenEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationHoster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isLockScreenActive"))
  {
    v7 = objc_msgSend(v6, "isHostingAnApp");
    v8 = v7;
    if (v3 && v7)
    {
      objc_msgSend(v6, "hostedAppSceneHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "application");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v10 == v3;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E8E9E1D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");

  return v4;
}

void __65__SBMainDisplaySceneManager__externalClientSettingsDiffInspector__block_invoke_4(uint64_t a1, id *a2)
{
  void *v2;
  id *v3;
  id v4;
  id *v5;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = a2;
    a2 = (id *)a2[1];
    v4 = v3[4];
  }
  else
  {
    v4 = 0;
  }
  v5 = a2;
  objc_msgSend(v2, "_updateLevelAndBackgroundSettingsForScene:transitionContext:", a2, v4);

}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  return -[SBMainDisplaySceneManager _proposeIdleTimerBehaviorForReason:](self, "_proposeIdleTimerBehaviorForReason:", a5, a4);
}

- (void)displayReferenceModeStatusDidChangeForDisplayWithConfiguration:(id)a3 newStatus:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBMainDisplaySceneManager externalForegroundApplicationSceneHandles](self, "externalForegroundApplicationSceneHandles", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "sceneIfExists");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __102__SBMainDisplaySceneManager_displayReferenceModeStatusDidChangeForDisplayWithConfiguration_newStatus___block_invoke;
        v12[3] = &__block_descriptor_40_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
        v12[4] = a4;
        objc_msgSend(v11, "performUpdate:", v12);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __102__SBMainDisplaySceneManager_displayReferenceModeStatusDidChangeForDisplayWithConfiguration_newStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isUISubclass") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setScreenReferenceDisplayModeStatus:", *(_QWORD *)(a1 + 32));

}

- (id)sceneSnapshotRequestStrategyForSceneSnapshotRequestor:(id)a3
{
  __objc2_class **v3;
  void *v4;
  uint64_t v5;

  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
      goto LABEL_3;
LABEL_5:
    v3 = off_1E8E974A8;
    return objc_alloc_init(*v3);
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_5;
LABEL_3:
  v3 = off_1E8E95BC0;
  return objc_alloc_init(*v3);
}

- (void)setIdleTimerCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_idleTimerCoordinator, a3);
}

- (SBPhysicalButtonSceneOverrideManager)physicalButtonSceneOverrideManager
{
  return self->_physicalButtonSceneOverrideManager;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_blsActionHandlersForScenes, 0);
  objc_storeStrong((id *)&self->_displayReferenceModeMonitor, 0);
  objc_storeStrong((id *)&self->stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_sceneIdentifierToIgnoreSuspendedUnderLockAssertions, 0);
  objc_storeStrong((id *)&self->_lazy_suspendedUnderLockManager, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneOverrideManager, 0);
  objc_storeStrong((id *)&self->_faceContactExpectationManager, 0);
  objc_storeStrong((id *)&self->_externalClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_internalClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_policyAggregator, 0);
}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "error unarchiving activation conditions from scene settings, %{public}@", (uint8_t *)&v5);

}

void __65__SBMainDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_8_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1)
    a2 = a1;
  v4 = 138543362;
  v5 = a2;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a3, (uint64_t)a3, "activation conditions from scene settings did not validate, %{public}@", (uint8_t *)&v4);
}

void __67__SBMainDisplaySceneManager_coordinatorRequestedIdleTimerBehavior___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "sceneHandle: %@", (uint8_t *)&v2, 0xCu);
}

@end
