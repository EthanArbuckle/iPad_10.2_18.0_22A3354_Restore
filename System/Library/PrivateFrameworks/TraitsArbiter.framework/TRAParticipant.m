@implementation TRAParticipant

- (TRASettings)currentSettings
{
  return self->_currentSettings;
}

- (void)setOrientationResolutionPolicyInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (TRAParticipantDelegate)delegate
{
  return (TRAParticipantDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3 force:(BOOL)a4 animate:(BOOL)a5
{
  id v9;
  TRAArbiterUpdateContext *v10;
  id v11;
  id WeakRetained;
  void *v13;
  TRAArbiterUpdateContext *v14;
  _QWORD v15[4];
  id v16;
  TRAParticipant *v17;
  BOOL v18;
  BOOL v19;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v10 = [TRAArbiterUpdateContext alloc];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__TRAParticipant_setNeedsUpdatePreferencesWithReason_force_animate___block_invoke;
  v15[3] = &unk_251A06DB0;
  v18 = a4;
  v16 = v9;
  v17 = self;
  v19 = a5;
  v11 = v9;
  v14 = -[TRAArbiterUpdateContext initWithBuilder:](v10, "initWithBuilder:", v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  objc_msgSend(WeakRetained, "setNeedsUpdateArbitrationWithContext:", v14);

}

void __68__TRAParticipant_setNeedsUpdatePreferencesWithReason_force_animate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  TRASettingsActuationContext *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "setReason:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setForceOrientationResolution:", *(unsigned __int8 *)(a1 + 48));
  v6[0] = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestingParticipantsUniqueIdentifiers:", v4);

  if (!*(_BYTE *)(a1 + 49))
  {
    v5 = -[TRASettingsActuationContext initWithAnimationSettings:drawingFence:]([TRASettingsActuationContext alloc], "initWithAnimationSettings:drawingFence:", 0, 0);
    objc_msgSend(v3, "setOrientationActuationContext:", v5);

  }
}

- (double)currentZOrderLevel
{
  void *v2;
  double v3;
  double v4;

  -[TRASettings zOrderLevelSettings](self->_currentSettings, "zOrderLevelSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zOrderLevel");
  v4 = v3;

  return v4;
}

- (int64_t)currentAmbientPresentedFlag
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TRASettings ambientPresentationSettings](self->_currentSettings, "ambientPresentationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ambientPresentationInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "isAmbientPresented");
    v4 = BSSettingFlagForBool();
  }
  else
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (void)updateOrientationSettingsWithBlock:(id)a3
{
  void *v5;
  void *v6;
  TRAMutableSettingsOrientation *v7;
  TRAMutableSettingsOrientation *v8;
  void *v9;
  char v10;
  TRASettings *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TRASettings *v16;
  TRASettings *previousSettings;
  TRASettings *currentSettings;
  TRAMutableSettings *v19;
  TRAMutableSettings *v20;
  void *v21;
  TRASettings *v22;
  TRASettings *v23;
  id WeakRetained;
  void *v25;
  void (**v26)(id, TRAMutableSettingsOrientation *);

  v26 = (void (**)(id, TRAMutableSettingsOrientation *))a3;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settingsUpdateBlock"));

  }
  -[TRASettings orientationSettings](self->_currentSettings, "orientationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = (TRAMutableSettingsOrientation *)objc_msgSend(v5, "mutableCopy");
  else
    v7 = objc_alloc_init(TRAMutableSettingsOrientation);
  v8 = v7;
  v26[2](v26, v7);
  -[TRASettings orientationSettings](self->_currentSettings, "orientationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToOrientationSettings:", v8);

  if ((v10 & 1) == 0)
  {
    if (self->_currentSettings)
    {
      v11 = [TRASettings alloc];
      -[TRASettings zOrderLevelSettings](self->_previousSettings, "zOrderLevelSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings orientationSettings](self->_currentSettings, "orientationSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings ambientPresentationSettings](self->_previousSettings, "ambientPresentationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings userInterfaceStyleSettings](self->_previousSettings, "userInterfaceStyleSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[TRASettings initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:](v11, "initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:", v12, v13, v14, v15);
      previousSettings = self->_previousSettings;
      self->_previousSettings = v16;

    }
    else
    {
      v12 = self->_previousSettings;
      self->_previousSettings = 0;
    }

    currentSettings = self->_currentSettings;
    if (currentSettings)
      v19 = (TRAMutableSettings *)-[TRASettings mutableCopy](currentSettings, "mutableCopy");
    else
      v19 = objc_alloc_init(TRAMutableSettings);
    v20 = v19;
    v21 = (void *)-[TRAMutableSettingsOrientation copy](v8, "copy");
    -[TRAMutableSettings setOrientationSettings:](v20, "setOrientationSettings:", v21);

    v22 = (TRASettings *)-[TRAMutableSettings copy](v20, "copy");
    v23 = self->_currentSettings;
    self->_currentSettings = v22;

    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_participantDidUpdateSettings:", self);

  }
}

- (void)updateUserInterfaceOrientationSettingsWithBlock:(id)a3
{
  void *v5;
  void *v6;
  TRAMutableSettingsUserInterfaceStyle *v7;
  TRAMutableSettingsUserInterfaceStyle *v8;
  void *v9;
  char v10;
  TRASettings *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TRASettings *v16;
  TRASettings *previousSettings;
  TRASettings *currentSettings;
  TRAMutableSettings *v19;
  TRAMutableSettings *v20;
  void *v21;
  TRASettings *v22;
  TRASettings *v23;
  id WeakRetained;
  void *v25;
  void (**v26)(id, TRAMutableSettingsUserInterfaceStyle *);

  v26 = (void (**)(id, TRAMutableSettingsUserInterfaceStyle *))a3;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settingsUpdateBlock"));

  }
  -[TRASettings userInterfaceStyleSettings](self->_currentSettings, "userInterfaceStyleSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = (TRAMutableSettingsUserInterfaceStyle *)objc_msgSend(v5, "mutableCopy");
  else
    v7 = objc_alloc_init(TRAMutableSettingsUserInterfaceStyle);
  v8 = v7;
  v26[2](v26, v7);
  -[TRASettings userInterfaceStyleSettings](self->_currentSettings, "userInterfaceStyleSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToUserInterfaceStyleSettings:", v8);

  if ((v10 & 1) == 0)
  {
    if (self->_currentSettings)
    {
      v11 = [TRASettings alloc];
      -[TRASettings zOrderLevelSettings](self->_previousSettings, "zOrderLevelSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings orientationSettings](self->_previousSettings, "orientationSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings ambientPresentationSettings](self->_previousSettings, "ambientPresentationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings userInterfaceStyleSettings](self->_currentSettings, "userInterfaceStyleSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[TRASettings initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:](v11, "initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:", v12, v13, v14, v15);
      previousSettings = self->_previousSettings;
      self->_previousSettings = v16;

    }
    else
    {
      v12 = self->_previousSettings;
      self->_previousSettings = 0;
    }

    currentSettings = self->_currentSettings;
    if (currentSettings)
      v19 = (TRAMutableSettings *)-[TRASettings mutableCopy](currentSettings, "mutableCopy");
    else
      v19 = objc_alloc_init(TRAMutableSettings);
    v20 = v19;
    v21 = (void *)-[TRAMutableSettingsUserInterfaceStyle copy](v8, "copy");
    -[TRAMutableSettings setUserInterfaceStyleSettings:](v20, "setUserInterfaceStyleSettings:", v21);

    v22 = (TRASettings *)-[TRAMutableSettings copy](v20, "copy");
    v23 = self->_currentSettings;
    self->_currentSettings = v22;

    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_participantDidUpdateSettings:", self);

  }
}

- (NSString)role
{
  return self->_role;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)updateZOrderLevelPreferencesWithBlock:(id)a3
{
  void *v5;
  void *v6;
  TRAMutablePreferencesZOrderLevel *v7;
  TRAPreferencesZOrderLevel *v8;
  TRAPreferencesZOrderLevel *zOrderLevelPreferences;
  id WeakRetained;
  void *v11;
  void (**v12)(id, TRAMutablePreferencesZOrderLevel *);

  v12 = (void (**)(id, TRAMutablePreferencesZOrderLevel *))a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferencesUpdateBlock"));

  }
  -[TRAParticipant zOrderLevelPreferences](self, "zOrderLevelPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TRAParticipant zOrderLevelPreferences](self, "zOrderLevelPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (TRAMutablePreferencesZOrderLevel *)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v7 = objc_alloc_init(TRAMutablePreferencesZOrderLevel);
  }

  v12[2](v12, v7);
  if (!-[TRAPreferencesZOrderLevel isEqualToZOrderLevelPreferences:](self->_zOrderLevelPreferences, "isEqualToZOrderLevelPreferences:", v7))
  {
    v8 = (TRAPreferencesZOrderLevel *)-[TRAMutablePreferencesZOrderLevel copy](v7, "copy");
    zOrderLevelPreferences = self->_zOrderLevelPreferences;
    self->_zOrderLevelPreferences = v8;

    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_participantDidUpdatePreferences:", self);

  }
}

- (TRAPreferencesZOrderLevel)zOrderLevelPreferences
{
  return self->_zOrderLevelPreferences;
}

- (void)updateOrientationPreferencesWithBlock:(id)a3
{
  void *v5;
  void *v6;
  TRAMutablePreferencesOrientation *v7;
  TRAPreferencesOrientation *v8;
  TRAPreferencesOrientation *orientationPreferences;
  id WeakRetained;
  void *v11;
  void (**v12)(id, TRAMutablePreferencesOrientation *);

  v12 = (void (**)(id, TRAMutablePreferencesOrientation *))a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferencesUpdateBlock"));

  }
  -[TRAParticipant orientationPreferences](self, "orientationPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TRAParticipant orientationPreferences](self, "orientationPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (TRAMutablePreferencesOrientation *)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v7 = objc_alloc_init(TRAMutablePreferencesOrientation);
  }

  v12[2](v12, v7);
  if (!-[TRAPreferencesOrientation isEqualToOrientationPreferences:](self->_orientationPreferences, "isEqualToOrientationPreferences:", v7))
  {
    v8 = (TRAPreferencesOrientation *)-[TRAMutablePreferencesOrientation copy](v7, "copy");
    orientationPreferences = self->_orientationPreferences;
    self->_orientationPreferences = v8;

    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_participantDidUpdatePreferences:", self);

  }
}

- (TRAPreferencesOrientation)orientationPreferences
{
  return self->_orientationPreferences;
}

- (void)set_debugLastOrientationValidationFailureReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)set_debugDelegateDidValidateLastSettings:(BOOL)a3
{
  self->__debugDelegateDidValidateLastSettings = a3;
}

- (id)_setupStateDump
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC9B8];
  v4 = (void *)MEMORY[0x24BDD17C8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  objc_msgSend(v4, "stringWithFormat:", CFSTR("TraitsArbiter - %p - Participants - %@"), WeakRetained, self->_uniqueIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v9, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v7;
}

- (TRAOrientationResolutionPolicyInfo)orientationResolutionPolicyInfo
{
  return self->_orientationResolutionPolicyInfo;
}

- (TRAParticipant)initWithRole:(id)a3 uniqueIdentifier:(id)a4 delegate:(id)a5 arbiter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TRAParticipant *v15;
  TRAParticipant *v16;
  uint64_t v17;
  NSString *role;
  uint64_t v19;
  NSString *uniqueIdentifier;
  uint64_t v21;
  BSInvalidatable *stateDumpHandle;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("role"));

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

      if (v14)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifier"));

  if (!v13)
    goto LABEL_10;
LABEL_4:
  if (v14)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arbiter"));

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)TRAParticipant;
  v15 = -[TRAParticipant init](&v28, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_invalidated = 0;
    v17 = objc_msgSend(v11, "copy");
    role = v16->_role;
    v16->_role = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSString *)v19;

    objc_storeWeak((id *)&v16->_delegate, v13);
    objc_storeWeak((id *)&v16->_arbiter, v14);
    -[TRAParticipant _setupStateDump](v16, "_setupStateDump");
    v21 = objc_claimAutoreleasedReturnValue();
    stateDumpHandle = v16->_stateDumpHandle;
    v16->_stateDumpHandle = (BSInvalidatable *)v21;

    v16->__debugDelegateDidValidateLastSettings = 1;
  }

  return v16;
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3 animate:(BOOL)a4
{
  -[TRAParticipant setNeedsUpdatePreferencesWithReason:force:animate:](self, "setNeedsUpdatePreferencesWithReason:force:animate:", a3, 0, a4);
}

- (TRASettings)previousSettings
{
  return self->_previousSettings;
}

- (TRASettingsActuationContext)orientationActuationContext
{
  return -[TRAOrientationResolutionPolicyInfo actuationContext](self->_orientationResolutionPolicyInfo, "actuationContext");
}

- (TRASettingsActuationContext)userInterfaceStyleActuationContext
{
  return -[TRAUserInterfaceStyleResolutionPolicyInfo actuationContext](self->_userInterfaceStyleResolutionPolicyInfo, "actuationContext");
}

- (BOOL)hasAnyActuationContext
{
  void *v3;
  BOOL v4;
  void *v5;

  -[TRAOrientationResolutionPolicyInfo actuationContext](self->_orientationResolutionPolicyInfo, "actuationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[TRAUserInterfaceStyleResolutionPolicyInfo actuationContext](self->_userInterfaceStyleResolutionPolicyInfo, "actuationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)updatePreferencesIfNeeded
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  objc_msgSend(WeakRetained, "updateArbitrationIfNeeded");

}

- (int64_t)currentOrientation
{
  void *v2;
  int64_t v3;

  -[TRASettings orientationSettings](self->_currentSettings, "orientationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  return v3;
}

- (int64_t)currentUserInterfaceStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TRASettings userInterfaceStyleSettings](self->_currentSettings, "userInterfaceStyleSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceStyleInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  return v4;
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  -[TRAParticipant setNeedsUpdatePreferencesWithReason:force:animate:](self, "setNeedsUpdatePreferencesWithReason:force:animate:", v5, 0, 1);

}

- (void)updateZOrderLevelSettingsWithBlock:(id)a3
{
  void *v5;
  void *v6;
  TRAMutableSettingsZOrderLevel *v7;
  TRAMutableSettingsZOrderLevel *v8;
  TRASettings *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TRASettings *v14;
  TRASettings *previousSettings;
  TRASettings *currentSettings;
  TRAMutableSettings *v17;
  TRAMutableSettings *v18;
  void *v19;
  TRASettings *v20;
  TRASettings *v21;
  id WeakRetained;
  void *v23;
  void (**v24)(id, TRAMutableSettingsZOrderLevel *);

  v24 = (void (**)(id, TRAMutableSettingsZOrderLevel *))a3;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settingsUpdateBlock"));

  }
  -[TRASettings zOrderLevelSettings](self->_currentSettings, "zOrderLevelSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = (TRAMutableSettingsZOrderLevel *)objc_msgSend(v5, "mutableCopy");
  else
    v7 = objc_alloc_init(TRAMutableSettingsZOrderLevel);
  v8 = v7;
  v24[2](v24, v7);
  if ((objc_msgSend(v6, "isEqualToZOrderLevelSettings:", v8) & 1) == 0)
  {
    if (self->_currentSettings)
    {
      v9 = [TRASettings alloc];
      -[TRASettings zOrderLevelSettings](self->_currentSettings, "zOrderLevelSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings orientationSettings](self->_previousSettings, "orientationSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings ambientPresentationSettings](self->_previousSettings, "ambientPresentationSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings userInterfaceStyleSettings](self->_previousSettings, "userInterfaceStyleSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[TRASettings initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:](v9, "initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:", v10, v11, v12, v13);
      previousSettings = self->_previousSettings;
      self->_previousSettings = v14;

    }
    else
    {
      v10 = self->_previousSettings;
      self->_previousSettings = 0;
    }

    currentSettings = self->_currentSettings;
    if (currentSettings)
      v17 = (TRAMutableSettings *)-[TRASettings mutableCopy](currentSettings, "mutableCopy");
    else
      v17 = objc_alloc_init(TRAMutableSettings);
    v18 = v17;
    v19 = (void *)-[TRAMutableSettingsZOrderLevel copy](v8, "copy");
    -[TRAMutableSettings setZOrderLevelSettings:](v18, "setZOrderLevelSettings:", v19);

    v20 = (TRASettings *)-[TRAMutableSettings copy](v18, "copy");
    v21 = self->_currentSettings;
    self->_currentSettings = v20;

    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_participantDidUpdateSettings:", self);

  }
}

- (int64_t)previousAmbientDisplayStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TRASettings ambientPresentationSettings](self->_previousSettings, "ambientPresentationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ambientPresentationInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "ambientDisplayStyle");
  else
    v4 = 0;

  return v4;
}

- (int64_t)currentAmbientDisplayStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TRASettings ambientPresentationSettings](self->_currentSettings, "ambientPresentationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ambientPresentationInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "ambientDisplayStyle");
  else
    v4 = 0;

  return v4;
}

- (int64_t)previousAmbientPresentedFlag
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TRASettings ambientPresentationSettings](self->_previousSettings, "ambientPresentationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ambientPresentationInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "isAmbientPresented");
    v4 = BSSettingFlagForBool();
  }
  else
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (int64_t)previousOrientation
{
  void *v2;
  int64_t v3;

  -[TRASettings orientationSettings](self->_previousSettings, "orientationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  return v3;
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v7 = a3;
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v7 = 0;
  }
  -[TRAParticipant setNeedsUpdatePreferencesWithReason:force:animate:](self, "setNeedsUpdatePreferencesWithReason:force:animate:", v7, v4, 1);

}

- (void)invalidate
{
  id WeakRetained;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_invalidateParticipant:", self);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateDumpHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TRAParticipant;
  -[TRAParticipant dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  return (NSString *)-[TRAParticipant descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)setZOrderLevelPreferences:(id)a3
{
  id v5;
  TRAPreferencesZOrderLevel *v6;
  TRAPreferencesZOrderLevel *zOrderLevelPreferences;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zOrderLevelPreferences"));

    v5 = 0;
  }
  v6 = (TRAPreferencesZOrderLevel *)objc_msgSend(v5, "copy");
  zOrderLevelPreferences = self->_zOrderLevelPreferences;
  self->_zOrderLevelPreferences = v6;

}

- (void)setOrientationPreferences:(id)a3
{
  id v5;
  TRAPreferencesOrientation *v6;
  TRAPreferencesOrientation *orientationPreferences;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("orientationPreferences"));

    v5 = 0;
  }
  v6 = (TRAPreferencesOrientation *)objc_msgSend(v5, "copy");
  orientationPreferences = self->_orientationPreferences;
  self->_orientationPreferences = v6;

}

- (void)updateAmbientPresentationSettingsWithBlock:(id)a3
{
  void *v5;
  void *v6;
  TRAMutableSettingsAmbientPresentation *v7;
  TRAMutableSettingsAmbientPresentation *v8;
  void *v9;
  char v10;
  TRASettings *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TRASettings *v16;
  TRASettings *previousSettings;
  TRASettings *currentSettings;
  TRAMutableSettings *v19;
  TRAMutableSettings *v20;
  void *v21;
  TRASettings *v22;
  TRASettings *v23;
  id WeakRetained;
  void *v25;
  void (**v26)(id, TRAMutableSettingsAmbientPresentation *);

  v26 = (void (**)(id, TRAMutableSettingsAmbientPresentation *))a3;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAParticipant.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settingsUpdateBlock"));

  }
  -[TRASettings ambientPresentationSettings](self->_currentSettings, "ambientPresentationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = (TRAMutableSettingsAmbientPresentation *)objc_msgSend(v5, "mutableCopy");
  else
    v7 = objc_alloc_init(TRAMutableSettingsAmbientPresentation);
  v8 = v7;
  v26[2](v26, v7);
  -[TRASettings ambientPresentationSettings](self->_currentSettings, "ambientPresentationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToAmbientPresentationSettings:", v8);

  if ((v10 & 1) == 0)
  {
    if (self->_currentSettings)
    {
      v11 = [TRASettings alloc];
      -[TRASettings zOrderLevelSettings](self->_previousSettings, "zOrderLevelSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings orientationSettings](self->_previousSettings, "orientationSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings ambientPresentationSettings](self->_currentSettings, "ambientPresentationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRASettings userInterfaceStyleSettings](self->_previousSettings, "userInterfaceStyleSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[TRASettings initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:](v11, "initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:", v12, v13, v14, v15);
      previousSettings = self->_previousSettings;
      self->_previousSettings = v16;

    }
    else
    {
      v12 = self->_previousSettings;
      self->_previousSettings = 0;
    }

    currentSettings = self->_currentSettings;
    if (currentSettings)
      v19 = (TRAMutableSettings *)-[TRASettings mutableCopy](currentSettings, "mutableCopy");
    else
      v19 = objc_alloc_init(TRAMutableSettings);
    v20 = v19;
    v21 = (void *)-[TRAMutableSettingsAmbientPresentation copy](v8, "copy");
    -[TRAMutableSettings setAmbientPresentationSettings:](v20, "setAmbientPresentationSettings:", v21);

    v22 = (TRASettings *)-[TRAMutableSettings copy](v20, "copy");
    v23 = self->_currentSettings;
    self->_currentSettings = v22;

    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    objc_msgSend(WeakRetained, "_participantDidUpdateSettings:", self);

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAParticipant succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_invalidated)
  {
    objc_msgSend(CFSTR("invalidated"), "uppercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, 0, 1);

  }
  else
  {
    objc_msgSend(v3, "appendString:withName:skipIfEmpty:", &stru_251A072F0, 0, 1);
  }
  objc_msgSend(v4, "appendString:withName:", self->_role, CFSTR("role"));
  objc_msgSend(v4, "appendString:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAParticipant descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;
  _QWORD v8[4];
  id v9;
  __CFString *v10;
  TRAParticipant *v11;

  -[TRAParticipant succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_invalidated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    v6 = (id)objc_msgSend(v4, "appendPointer:withName:", WeakRetained, CFSTR("arbiter"));

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_251A06DD8;
    v9 = v4;
    v10 = CFSTR("    ");
    v11 = self;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v8);

  }
  return v4;
}

void __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id WeakRetained;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v32[3] = &unk_251A06D68;
  v5 = v2;
  v6 = a1[6];
  v33 = v5;
  v34 = v6;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Preferences"), v3, v32);
  v7 = (void *)a1[4];
  v8 = a1[5];
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v29[3] = &unk_251A06D68;
  v9 = v7;
  v10 = a1[6];
  v30 = v9;
  v31 = v10;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Resolved Settings"), v8, v29);
  if (!*(_BYTE *)(a1[6] + 72))
  {
    v11 = (void *)a1[4];
    v12 = a1[5];
    v26[0] = v4;
    v26[1] = 3221225472;
    v26[2] = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    v26[3] = &unk_251A06D68;
    v13 = v11;
    v14 = a1[6];
    v27 = v13;
    v28 = v14;
    objc_msgSend(v13, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Settings Validation"), v12, v26);

  }
  v15 = (void *)a1[4];
  v16 = a1[5];
  v20 = v4;
  v21 = 3221225472;
  v22 = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_5;
  v23 = &unk_251A06D68;
  v17 = v15;
  v18 = a1[6];
  v24 = v17;
  v25 = v18;
  objc_msgSend(v17, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Resolution Policies"), v16, &v20);
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 112));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "appendDescriptionForParticipant:withBuilder:multilinePrefix:", a1[6], a1[4], a1[5], v20, v21, v22, v23);

}

id __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("zOrder"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("orientation"));
}

id __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("current"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("previous"));
}

uint64_t __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 0, CFSTR("did validate last settings"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("last validation failure reason"), 1);
}

id __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("orientation"));
}

__CFString *__33__TRAParticipant__setupStateDump__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "debugDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_251A072F0;
  }

  return v3;
}

- (TRAUserInterfaceStyleResolutionPolicyInfo)userInterfaceStyleResolutionPolicyInfo
{
  return self->_userInterfaceStyleResolutionPolicyInfo;
}

- (void)setUserInterfaceStyleResolutionPolicyInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setCurrentSettings:(id)a3
{
  objc_storeStrong((id *)&self->_currentSettings, a3);
}

- (void)setPreviousSettings:(id)a3
{
  objc_storeStrong((id *)&self->_previousSettings, a3);
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TRAArbiter)arbiter
{
  return (TRAArbiter *)objc_loadWeakRetained((id *)&self->_arbiter);
}

- (void)setArbiter:(id)a3
{
  objc_storeWeak((id *)&self->_arbiter, a3);
}

- (BOOL)_debugDelegateDidValidateLastSettings
{
  return self->__debugDelegateDidValidateLastSettings;
}

- (NSString)_debugLastOrientationValidationFailureReason
{
  return self->__debugLastOrientationValidationFailureReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debugLastOrientationValidationFailureReason, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->userInterfaceStyleActuationContext, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleResolutionPolicyInfo, 0);
  objc_storeStrong((id *)&self->_orientationResolutionPolicyInfo, 0);
  objc_storeStrong((id *)&self->_previousSettings, 0);
  objc_storeStrong((id *)&self->_currentSettings, 0);
  objc_storeStrong((id *)&self->_zOrderLevelPreferences, 0);
  objc_storeStrong((id *)&self->_orientationPreferences, 0);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
}

- (int64_t)previousUserInterfaceStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TRASettings userInterfaceStyleSettings](self->_previousSettings, "userInterfaceStyleSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceStyleInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  return v4;
}

- (double)previousZOrderLevel
{
  void *v2;
  double v3;
  double v4;

  -[TRASettings zOrderLevelSettings](self->_previousSettings, "zOrderLevelSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zOrderLevel");
  v4 = v3;

  return v4;
}

- (int64_t)currentDeviceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TRASettings orientationSettings](self->_currentSettings, "orientationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validatedOrientationInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentDeviceOrientation");

  return v4;
}

- (int64_t)previousDeviceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TRASettings orientationSettings](self->_previousSettings, "orientationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validatedOrientationInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentDeviceOrientation");

  return v4;
}

@end
