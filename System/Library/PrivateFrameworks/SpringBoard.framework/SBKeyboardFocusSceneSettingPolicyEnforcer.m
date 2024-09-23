@implementation SBKeyboardFocusSceneSettingPolicyEnforcer

- (SBKeyboardFocusSceneSettingPolicyEnforcer)initWithSceneProvider:(id)a3
{
  id v5;
  SBKeyboardFocusSceneSettingPolicyEnforcer *v6;
  SBKeyboardFocusSceneSettingPolicyEnforcer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardFocusSceneSettingPolicyEnforcer;
  v6 = -[SBKeyboardFocusSceneSettingPolicyEnforcer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sceneProvider, a3);

  return v7;
}

- (void)enforce:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  SBKeyboardFocusSceneProviding *sceneProvider;
  void *v8;
  void *v9;
  SBKeyboardFocusSceneProviding *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  NSObject *v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetSceneForKeyboardFocusDeferring);
  v6 = objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestorForTargetScene);
  sceneProvider = self->_sceneProvider;
  objc_msgSend(v4, "keyboardFocusTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusSceneProviding sceneForFocusTarget:](sceneProvider, "sceneForFocusTarget:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self->_sceneProvider;
  objc_msgSend(v4, "sbWindowSceneAncestor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusTarget targetForSBWindowScene:](SBKeyboardFocusTarget, "targetForSBWindowScene:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusSceneProviding sceneForFocusTarget:](v10, "sceneForFocusTarget:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "identityToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identityToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = BSEqualObjects();

  objc_msgSend(v6, "identityToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identityToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = BSEqualObjects();

  if (v9)
  {
    if ((v16 & v19 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__SBKeyboardFocusSceneSettingPolicyEnforcer_enforce___block_invoke;
      block[3] = &unk_1E8EACED0;
      block[4] = self;
      v24 = WeakRetained;
      v25 = v6;
      v20 = v9;
      v26 = v20;
      v21 = v13;
      v27 = v21;
      v28 = v4;
      v29 = v19 ^ 1;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_storeWeak((id *)&self->_targetSceneForKeyboardFocusDeferring, v20);
      objc_storeWeak((id *)&self->_sbWindowSceneAncestorForTargetScene, v21);

    }
  }
  else
  {
    SBLogKeyboardFocus();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[SBKeyboardFocusSceneSettingPolicyEnforcer enforce:].cold.1(v4, WeakRetained, v22);

  }
}

void __53__SBKeyboardFocusSceneSettingPolicyEnforcer_enforce___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 72), "keyboardFocusTarget");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene:withSBAncestor:toScene:withSBAncestor:target:activeDisplayChanging:", v3, v4, v5, v6, v7, *(unsigned __int8 *)(a1 + 80));

}

- (void)stopEnforcing
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  SBKeyboardFocusSceneSettingPolicyEnforcer *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not implemented"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544642;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = CFSTR("SBKeyboardFocusSceneSettingPolicyEnforcer.m");
    v16 = 1024;
    v17 = 72;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)invalidate
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  SBKeyboardFocusSceneSettingPolicyEnforcer *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not implemented"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544642;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = CFSTR("SBKeyboardFocusSceneSettingPolicyEnforcer.m");
    v16 = 1024;
    v17 = 79;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)_moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene:(id)a3 withSBAncestor:(id)a4 toScene:(id)a5 withSBAncestor:(id)a6 target:(id)a7 activeDisplayChanging:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;

  v8 = a8;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v13)
  {
    objc_msgSend(v13, "identityToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identityToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

  }
  else
  {
    v18 = 0;
  }
  v19 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke;
    v36[3] = &unk_1E8EACEF8;
    v37 = v12;
    objc_msgSend(v37, "updateUISettingsWithBlock:", v36);

  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (((!v8 | v18) & 1) == 0)
    {
      objc_msgSend(v14, "uiSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "targetOfEventDeferringEnvironments");
      v22 = (id)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v22, "containsObject:", v20) & 1) == 0)
      {
        if (v22)
        {
          objc_msgSend(v22, "setByAddingObject:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v33[0] = v19;
        v33[1] = 3221225472;
        v33[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_8;
        v33[3] = &unk_1E8EACF20;
        v34 = v14;
        v22 = v23;
        v35 = v22;
        objc_msgSend(v34, "updateUISettingsWithBlock:", v33);

      }
      v29[0] = v19;
      v29[1] = 3221225472;
      v29[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_9;
      v29[3] = &unk_1E8EACF70;
      v30 = v14;
      v31 = v22;
      v32 = v20;
      v25 = v22;
      objc_msgSend(v30, "updateUISettingsWithBlock:", v29);

    }
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_2;
    v26[3] = &unk_1E8EACF20;
    v27 = v13;
    v28 = v20;
    v24 = v20;
    objc_msgSend(v27, "updateUISettingsWithBlock:", v26);

  }
  else
  {
    SBLogKeyboardFocus();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusSceneSettingPolicyEnforcer _moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene:withSBAncestor:toScene:withSBAncestor:target:activeDisplayChanging:].cold.1((uint64_t)v15, v24);
  }

}

void __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogKeyboardFocus();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "rules: (scene setting) REMOVED keyboardFocus environment from scene: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "setTargetOfEventDeferringEnvironments:", 0);

}

void __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogKeyboardFocus();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "rules: (scene setting) temporarily added keyboardFocus environment to SpringBoard scene: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "setTargetOfEventDeferringEnvironments:", *(_QWORD *)(a1 + 40));

}

void __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogKeyboardFocus();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "rules: (scene setting) immediately removed keyboardFocus environment from SpringBoard scene: %{public}@", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_10;
  v8[3] = &unk_1E8EACF48;
  v6 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "objectsPassingTest:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetOfEventDeferringEnvironments:", v7);

}

uint64_t __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

void __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogKeyboardFocus();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "rules: (scene setting) ADDED keyboardFocus environment to scene: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetOfEventDeferringEnvironments:", v6);

}

- (FBScene)targetSceneForKeyboardFocusDeferring
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_targetSceneForKeyboardFocusDeferring);
}

- (void)setTargetSceneForKeyboardFocusDeferring:(id)a3
{
  objc_storeWeak((id *)&self->_targetSceneForKeyboardFocusDeferring, a3);
}

- (FBScene)sbWindowSceneAncestorForTargetScene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestorForTargetScene);
}

- (void)setSbWindowSceneAncestorForTargetScene:(id)a3
{
  objc_storeWeak((id *)&self->_sbWindowSceneAncestorForTargetScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sbWindowSceneAncestorForTargetScene);
  objc_destroyWeak((id *)&self->_targetSceneForKeyboardFocusDeferring);
  objc_storeStrong((id *)&self->_sceneProvider, 0);
}

- (void)enforce:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "keyboardFocusTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "rules: (scene setting) couldn't find scene with target: %{public}@, leaving scene setting on %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)_moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene:(uint64_t)a1 withSBAncestor:(NSObject *)a2 toScene:withSBAncestor:target:activeDisplayChanging:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "rules: (scene setting) keyboardFocus environment scene not found for target: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
