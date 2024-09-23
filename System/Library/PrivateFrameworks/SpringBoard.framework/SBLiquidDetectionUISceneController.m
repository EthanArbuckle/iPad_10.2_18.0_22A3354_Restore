@implementation SBLiquidDetectionUISceneController

- (SBLiquidDetectionUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8
{
  SBLiquidDetectionUISceneController *v8;
  SBLiquidDetectionUISceneController *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  SBFDeviceLockOutController *v14;
  SBFDeviceLockOutController *lockOutController;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBLiquidDetectionUISceneController;
  v8 = -[SBSystemUISceneController initWithSceneWorkspaceIdentifier:clientProcessIdentity:sceneVendingPolicy:traitsRole:jobLabel:level:](&v17, sel_initWithSceneWorkspaceIdentifier_clientProcessIdentity_sceneVendingPolicy_traitsRole_jobLabel_level_, a3, a4, a5, a6, a7, a8);
  v9 = v8;
  if (v8)
  {
    v8->_presenting = 0;
    objc_msgSend((id)SBApp, "lockOutController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = v10;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    lockOutController = v9->_lockOutController;
    v9->_lockOutController = v14;

    -[SBFDeviceLockOutController setLiquidDetectionBlockProvider:](v9->_lockOutController, "setLiquidDetectionBlockProvider:", v9);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFDeviceLockOutController setLiquidDetectionBlockProvider:](self->_lockOutController, "setLiquidDetectionBlockProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBLiquidDetectionUISceneController;
  -[SBSystemUISceneController dealloc](&v3, sel_dealloc);
}

+ (id)_setupInfo
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("class");
  v4[0] = objc_opt_class();
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[1] = CFSTR("enabled");
  v3[2] = CFSTR("traitsRole");
  v3[3] = CFSTR("presentationStyle");
  v4[2] = CFSTR("SBTraitsParticipantRoleSystemUIScene");
  v4[3] = &unk_1E91D0950;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDefaultPresenter:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBLiquidDetectionUISceneController;
  -[SBSystemUISceneController setDefaultPresenter:](&v5, sel_setDefaultPresenter_, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setPresentingDelegate:", self);

}

- (void)scenePresenter:(id)a3 didPresentScene:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *suppressSystemGestures;
  void *v14;
  BSInvalidatable *v15;
  BSInvalidatable *suppressSystemAperture;
  void *v17;
  BSInvalidatable *v18;
  BSInvalidatable *disableIdleTimer;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "definition", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiSceneSessionRole");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "uiSceneSessionRole");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    self->_presenting = 1;
    if (!self->_suppressSystemGestures)
    {
      +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "acquireSystemGestureDisableAssertionForReason:exceptSystemGestureTypes:", CFSTR("Liquid Detection Critical UI Presentation"), 0);
      v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      suppressSystemGestures = self->_suppressSystemGestures;
      self->_suppressSystemGestures = v12;

    }
    if (!self->_suppressSystemAperture)
    {
      objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility");
      v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      suppressSystemAperture = self->_suppressSystemAperture;
      self->_suppressSystemAperture = v15;

    }
    if (!self->_disableIdleTimer)
    {
      +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "acquireIdleTimerDisableAssertionForReason:", CFSTR("Liquid Detection Critical UI Presentation"));
      v18 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      disableIdleTimer = self->_disableIdleTimer;
      self->_disableIdleTimer = v18;

    }
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v21;
    v37[1] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v22;
    v37[2] = CFSTR("SBUILockOptionsForceLockKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lockUIFromSource:withOptions:", 14, v24);

    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "requestUserAttentionScreenWakeFromSource:reason:", 14, CFSTR("Liquid Detection Critical UI Presentation"));

    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBiometricAutoUnlockingDisabled:forReason:", 1, CFSTR("Liquid Detection Critical UI Presentation"));

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v27 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v33;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v33 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v31++), "liquidDetectionBlockStatusChanged:", self);
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v29);
    }

  }
}

- (void)scenePresenter:(id)a3 willDismissScene:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BSInvalidatable *suppressSystemGestures;
  BSInvalidatable *suppressSystemAperture;
  BSInvalidatable *disableIdleTimer;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "definition", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiSceneSessionRole");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "uiSceneSessionRole");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    self->_presenting = 0;
    -[BSInvalidatable invalidate](self->_suppressSystemGestures, "invalidate");
    suppressSystemGestures = self->_suppressSystemGestures;
    self->_suppressSystemGestures = 0;

    -[BSInvalidatable invalidate](self->_suppressSystemAperture, "invalidate");
    suppressSystemAperture = self->_suppressSystemAperture;
    self->_suppressSystemAperture = 0;

    -[BSInvalidatable invalidate](self->_disableIdleTimer, "invalidate");
    disableIdleTimer = self->_disableIdleTimer;
    self->_disableIdleTimer = 0;

    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBiometricAutoUnlockingDisabled:forReason:", 0, CFSTR("Liquid Detection Critical UI Presentation"));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "liquidDetectionBlockStatusChanged:", self);
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

  }
}

- (BOOL)isLiquidDetectionBlocked
{
  return self->_presenting;
}

- (void)addLiquidDetectionObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeLiquidDetectionObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_disableIdleTimer, 0);
  objc_storeStrong((id *)&self->_suppressSystemAperture, 0);
  objc_storeStrong((id *)&self->_suppressSystemGestures, 0);
}

@end
