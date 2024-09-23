@implementation SBSystemKeyCommandScenePolicyEnforcer

- (SBSystemKeyCommandScenePolicyEnforcer)initWithSceneProvider:(id)a3 debugName:(id)a4 deliveryManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBSystemKeyCommandScenePolicyEnforcer *v12;
  SBSystemKeyCommandScenePolicyEnforcer *v13;
  uint64_t v14;
  NSString *debugName;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSystemKeyCommandScenePolicyEnforcer;
  v12 = -[SBSystemKeyCommandScenePolicyEnforcer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deliveryManager, a5);
    v14 = objc_msgSend(v10, "copy");
    debugName = v13->_debugName;
    v13->_debugName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_sceneProvider, a3);
  }

  return v13;
}

- (void)enforce:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  int v10;
  void *spotlightSystemShortcutFocusRule;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BSInvalidatable *v30;
  BSInvalidatable *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SBKeyboardFocusSceneProviding spotlightScene](self->_sceneProvider, "spotlightScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _os_feature_enabled_impl();
  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8
    || (objc_msgSend(v4, "keyboardFocusTarget"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v6, "isEqual:", v9),
        v9,
        !v10))
  {
    if (self->_spotlightSystemShortcutFocusRule)
    {
      SBLogKeyboardFocus();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v22;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "rules: (systemKeyCommandOverlay) Spotlight is no longer focused, dropping (%{public}@) -> spotlight", buf, 0xCu);

      }
      -[BSInvalidatable invalidate](self->_spotlightSystemShortcutFocusRule, "invalidate");
      spotlightSystemShortcutFocusRule = self->_spotlightSystemShortcutFocusRule;
      self->_spotlightSystemShortcutFocusRule = 0;
      goto LABEL_13;
    }
  }
  else if (!self->_spotlightSystemShortcutFocusRule)
  {
    objc_msgSend(v4, "sbWindowSceneAncestor");
    spotlightSystemShortcutFocusRule = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(MEMORY[0x1E0D00D80], "new");
    objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    objc_msgSend(v12, "setEnvironment:", v13);

    objc_msgSend(spotlightSystemShortcutFocusRule, "_FBSScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sb_displayConfigurationForSceneManagers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isExternal");
    v18 = (void *)MEMORY[0x1E0D00CF8];
    if ((v17 & 1) != 0)
    {
      objc_msgSend(v16, "hardwareIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "displayWithHardwareIdentifier:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v34, "setDisplay:", v20);
    objc_msgSend(spotlightSystemShortcutFocusRule, "_FBSScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identityToken");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0D00CB8];
    objc_msgSend(v24, "stringRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "tokenForString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setToken:", v27);

    objc_msgSend(v4, "keyboardFocusTarget");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusTarget deferringTarget]((uint64_t)v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[BKSHIDEventDeliveryManager deferEventsMatchingPredicate:toTarget:withReason:](self->_deliveryManager, "deferEventsMatchingPredicate:toTarget:withReason:", v34, v29, CFSTR("SpringBoard: systemKeyCommandOverlayEnvironment outbound to Spotlight"));
    v30 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v31 = self->_spotlightSystemShortcutFocusRule;
    self->_spotlightSystemShortcutFocusRule = v30;

    SBLogKeyboardFocus();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v33;
      v37 = 2114;
      v38 = v29;
      _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "rules: (systemKeyCommandOverlay) Spotlight is focused, deferring (%{public}@) -> %{public}@", buf, 0x16u);

    }
LABEL_13:

  }
}

- (void)stopEnforcing
{
  BSInvalidatable *spotlightSystemShortcutFocusRule;

  -[BSInvalidatable invalidate](self->_spotlightSystemShortcutFocusRule, "invalidate");
  spotlightSystemShortcutFocusRule = self->_spotlightSystemShortcutFocusRule;
  self->_spotlightSystemShortcutFocusRule = 0;

}

- (BSInvalidatable)spotlightSystemShortcutFocusRule
{
  return self->_spotlightSystemShortcutFocusRule;
}

- (void)setSpotlightSystemShortcutFocusRule:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightSystemShortcutFocusRule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightSystemShortcutFocusRule, 0);
  objc_storeStrong((id *)&self->_sceneProvider, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

@end
