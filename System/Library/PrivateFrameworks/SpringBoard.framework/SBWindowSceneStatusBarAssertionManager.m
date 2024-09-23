@implementation SBWindowSceneStatusBarAssertionManager

- (id)statusBar:(id)a3 effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a4, "mutableCopy", a3);
  -[SBStatusBarSettings backgroundActivitiesToSuppress](self->_currentStatusBarSettings, "backgroundActivitiesToSuppress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  return v5;
}

- (BOOL)statusBar:(id)a3 shouldSetAlpha:(double)a4
{
  void *v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3978];
  v7 = a3;
  if ((objc_msgSend(v6, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBWindowSceneStatusBarAssertionManager statusBar:shouldSetAlpha:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("SBWindowSceneStatusBarAssertionManager.m"), 184, CFSTR("this call must be made on the main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusBar");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v7 || self->_changingStatusBarAlpha)
    return 1;
  SBLogStatusBarish();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v15 = 134217984;
    v16 = a4;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "Status bar alpha changed outside of SBWindowSceneStatusBarSettingsAssertion. Rejecting change to set alpha to: %f", (uint8_t *)&v15, 0xCu);
  }

  return self->_changingStatusBarAlpha;
}

- (BOOL)statusBar:(id)a3 shouldRequestStyle:(int64_t)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  void *v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;

  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = a3;
  if ((objc_msgSend(v7, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBWindowSceneStatusBarAssertionManager statusBar:shouldRequestStyle:animationParameters:forced:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SBWindowSceneStatusBarAssertionManager.m"), 212, CFSTR("this call must be made on the main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statusBar");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8 && !self->_changingStatusBarStyle)
  {
    SBLogStatusBarish();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBWindowSceneStatusBarAssertionManager statusBar:shouldRequestStyleAttributes:animationParameters:forced:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  return 1;
}

- (id)currentStatusBarSettings
{
  return self->_currentStatusBarSettings;
}

- (void)_statusBarUpdatedFromSettings:(id)a3 toSettings:(id)a4 withAnimations:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  void *v27;
  void *v28;
  unsigned __int8 IsZero;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  id v35;
  NSHashTable *disableAlphaChangeAssertions;
  void *v37;
  void *v38;
  char v39;
  int v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  _QWORD v43[4];
  id v44;
  SBWindowSceneStatusBarAssertionManager *v45;
  id v46;
  void (**v47)(_QWORD, _QWORD, _QWORD);
  char v48;
  _QWORD v49[5];
  id v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBWindowSceneStatusBarAssertionManager _statusBarUpdatedFromSettings:toSettings:withAnimations:]");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("SBWindowSceneStatusBarAssertionManager.m"), 345, CFSTR("this call must be made on the main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "statusBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWindowSceneStatusBarAssertionManager _styleRequestForSettings:](self, "_styleRequestForSettings:", v9);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke;
  v49[3] = &unk_1E8EBC380;
  v49[4] = self;
  v14 = v13;
  v50 = v14;
  v42 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v49);
  if (!v10)
  {
    if (!objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
    {
      v10 = 0;
      if (v8)
        goto LABEL_7;
LABEL_12:
      objc_msgSend(v14, "alpha");
      v39 = 1;
      v40 = 1;
      goto LABEL_13;
    }
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithEmptyParameters");
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "duration");
    objc_msgSend(v10, "setDuration:");
    objc_msgSend(v15, "delay");
    objc_msgSend(v10, "setDelay:");
    objc_msgSend(v10, "setCurve:", 3);
    objc_msgSend(v10, "setStyleAnimation:", 1);

  }
  if (!v8)
    goto LABEL_12;
LABEL_7:
  objc_msgSend(v8, "alpha");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  objc_msgSend(v9, "alpha");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v40 = BSFloatEqualToFloat() ^ 1;

  v18 = objc_msgSend(v8, "style");
  v19 = objc_msgSend(v9, "style");
  objc_msgSend(v8, "backgroundActivitiesToSuppress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundActivitiesToSuppress");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = BSEqualSets();

  if (v18 == v19)
  {
    objc_msgSend(v8, "legibilitySettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "legibilitySettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    v26 = v25 & v22 ^ 1;
  }
  else
  {
    v26 = 1;
  }
  v39 = v26;
  objc_msgSend(v8, "alpha");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");

LABEL_13:
  if (BSFloatGreaterThanFloat())
  {
    objc_msgSend(v9, "alpha");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    IsZero = BSFloatIsZero();

  }
  else
  {
    IsZero = 0;
  }
  if (BSFloatIsZero())
  {
    objc_msgSend(v9, "alpha");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v31 = BSFloatGreaterThanFloat();

  }
  else
  {
    v31 = 0;
  }
  if (BSFloatGreaterThanFloat())
  {
    objc_msgSend(v9, "alpha");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    v33 = BSFloatGreaterThanFloat();

  }
  else
  {
    v33 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v31)
  {
    objc_msgSend(v14, "statusBar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "reinitializeStatusBar");

  }
  if (((v31 ^ 1) & (v39 ^ 1 | IsZero) & 1) == 0)
  {
    if (v33)
      v35 = v10;
    else
      v35 = 0;
    ((void (**)(_QWORD, id, void *))v42)[2](v42, v35, v41);
  }
  if (v40)
  {
    disableAlphaChangeAssertions = self->_disableAlphaChangeAssertions;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_3;
    v43[3] = &unk_1E8EA0DF8;
    v48 = v31;
    v44 = v14;
    v45 = self;
    v46 = v10;
    v47 = v42;
    -[SBWindowSceneStatusBarAssertionManager _setStatusBarValueForPropertyWithAssertions:setter:](self, "_setStatusBarValueForPropertyWithAssertions:setter:", disableAlphaChangeAssertions, v43);

  }
}

- (id)_styleRequestForSettings:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0DB0F20];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = _SBStatusBarStyleFromLegacyStyle(objc_msgSend(v4, "style"));
  objc_msgSend(v4, "legibilitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "primaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithResolvedStyle:foregroundColor:", v6, v8);

  return v9;
}

uint64_t __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStyleRequest:", *(_QWORD *)(a1 + 40));
}

- (id)effectiveStatusBarStyleRequestForLevel:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SBWindowSceneStatusBarAssertionManager statusBarSettingsForLevel:](self, "statusBarSettingsForLevel:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindowSceneStatusBarAssertionManager _styleRequestForSettings:](self, "_styleRequestForSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)statusBarSettingsForLevel:(unint64_t)a3
{
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  SBMutableStatusBarSettings *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__97;
  v12 = __Block_byref_object_dispose__97;
  v13 = objc_alloc_init(SBMutableStatusBarSettings);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SBWindowSceneStatusBarAssertionManager_statusBarSettingsForLevel___block_invoke;
  v7[3] = &unk_1E8EBC358;
  v7[4] = &v8;
  -[SBWindowSceneStatusBarAssertionManager _enumerateAssertionsToLevel:withBlock:](self, "_enumerateAssertionsToLevel:withBlock:", a3, v7);
  -[SBWindowSceneStatusBarAssertionManager _resolveEffectiveStatusBarStyleForSettings:](self, "_resolveEffectiveStatusBarStyleForSettings:", v9[5]);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_resolveEffectiveStatusBarStyleForSettings:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "style") == -1)
    v4 = SBDefaultStatusBarStyle();
  else
    v4 = objc_msgSend(v8, "style");
  v5 = v4;
  objc_msgSend(v8, "backgroundActivitiesToSuppress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBWindowSceneStatusBarAssertionManager effectiveStatusBarStyleForRequestedStyle:styleOverridesToSuppress:](self, "effectiveStatusBarStyleForRequestedStyle:styleOverridesToSuppress:", v5, STUIStyleOverridesForBackgroundActivityIdentifiers());

  objc_msgSend(v8, "setStyle:", v7);
}

- (int64_t)effectiveStatusBarStyleForRequestedStyle:(int64_t)a3 styleOverridesToSuppress:(unint64_t)a4
{
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "styleOverrides");

  return objc_msgSend(MEMORY[0x1E0CEA9E8], "defaultStyleForRequestedStyle:styleOverrides:", a3, v9 & ~a4);
}

- (void)_addStatusBarSettingsAssertion:(id)a3 withAnimationParameters:(id)a4
{
  id v6;
  id v7;
  Class *v8;
  id *v9;
  Class v10;
  objc_class *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = &self->super.isa + objc_msgSend(v6, "level");
  v10 = v8[4];
  v9 = (id *)(v8 + 4);
  v11 = v10;
  if (!v11)
  {
    v11 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 514);
    objc_storeStrong(v9, v11);
  }
  SBLogStatusBarish();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "adding status bar settings assertion: %{public}@", buf, 0xCu);
  }

  -[objc_class addPointer:](v11, "addPointer:", v6);
  v19 = v7;
  -[SBWindowSceneStatusBarAssertionManager _evaluateSettingsWithStyleAnimations:](self, "_evaluateSettingsWithStyleAnimations:", v7);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "statusBarAssertionManager:addStatusBarSettingsAssertion:", self, v6);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (void)_evaluateSettingsWithStyleAnimations:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  SBStatusBarSettings *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  SBMutableStatusBarSettings *v34;
  uint8_t v35[128];
  uint8_t buf[4];
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__97;
  v33 = __Block_byref_object_dispose__97;
  v34 = objc_alloc_init(SBMutableStatusBarSettings);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __79__SBWindowSceneStatusBarAssertionManager__evaluateSettingsWithStyleAnimations___block_invoke;
  v28[3] = &unk_1E8EBC358;
  v28[4] = &v29;
  -[SBWindowSceneStatusBarAssertionManager _enumerateAssertionsToLevel:withBlock:](self, "_enumerateAssertionsToLevel:withBlock:", 12, v28);
  SBLogStatusBarish();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)v30[5], "alpha");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;
    -[SBStatusBarSettings alpha](self->_currentStatusBarSettings, "alpha");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;
    objc_msgSend(v6, "statusBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "alpha");
    *(_DWORD *)buf = 134349568;
    v37 = v17;
    v38 = 2050;
    v39 = v20;
    v40 = 2050;
    v41 = v22;
    _os_log_debug_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEBUG, "Evaluate status bar settings. new: %{public}.2f, current: %{public}.2f, actual: %{public}.2f", buf, 0x20u);

  }
  v8 = self->_currentStatusBarSettings;
  if (!-[SBStatusBarSettings isEqual:](self->_currentStatusBarSettings, "isEqual:", v30[5]))
  {
    objc_storeStrong((id *)&self->_currentStatusBarSettings, (id)v30[5]);
    -[SBWindowSceneStatusBarAssertionManager _statusBarUpdatedFromSettings:toSettings:withAnimations:](self, "_statusBarUpdatedFromSettings:toSettings:withAnimations:", v8, v30[5], v4);
    v23 = v4;
    v9 = v6;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "statusBarAssertionManager:statusBarSettingsDidChange:", self, self->_currentStatusBarSettings);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      }
      while (v11);
    }

    v6 = v9;
    v4 = v23;
  }

  _Block_object_dispose(&v29, 8);
}

- (void)_enumerateAssertionsToLevel:(unint64_t)a3 withBlock:(id)a4
{
  void (**v7)(id, _QWORD);
  unint64_t v8;
  NSPointerArray **statusBarSettingsAssertionsByLevel;
  NSPointerArray *v10;
  NSPointerArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a4;
  if (a3 >= 0xD)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneStatusBarAssertionManager.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("level < SBWindowSceneStatusBarSettingsLevelNumberOfLevels"));

  }
  v8 = 0;
  statusBarSettingsAssertionsByLevel = self->_statusBarSettingsAssertionsByLevel;
  do
  {
    v10 = statusBarSettingsAssertionsByLevel[v8];
    v11 = v10;
    if (v10)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v12 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            v7[2](v7, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++));
          }
          while (v13 != v15);
          v13 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }
    }

    ++v8;
  }
  while (v8 <= a3);

}

void __79__SBWindowSceneStatusBarAssertionManager__evaluateSettingsWithStyleAnimations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "settings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applySettings:", v3);

}

- (void)_modifiedStatusBarSettingsAssertion:(id)a3 withAnimationParameters:(id)a4
{
  -[SBWindowSceneStatusBarAssertionManager _evaluateSettingsWithStyleAnimations:](self, "_evaluateSettingsWithStyleAnimations:", a4);
}

- (id)newSettingsAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4 reason:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a3;
  v8 = a5;
  v9 = -[SBWindowSceneStatusBarSettingsAssertion _initWithWindowSceneStatusBarAssertionManager:statusBarHidden:atLevel:reason:]([SBWindowSceneStatusBarSettingsAssertion alloc], "_initWithWindowSceneStatusBarAssertionManager:statusBarHidden:atLevel:reason:", self, v6, a4, v8);

  return v9;
}

void __68__SBWindowSceneStatusBarAssertionManager_statusBarSettingsForLevel___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "settings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applySettings:", v3);

}

void __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_4(uint64_t a1)
{
  void *v1;
  float v2;
  id v3;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  v1 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "alpha");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  objc_msgSend(v1, "setAlpha:", v2);

}

- (void)_setStatusBarValueForPropertyWithAssertions:(id)a3 setter:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[SBWindowSceneStatusBarAssertionManager _descriptionForPropertyWithAssertions:](self, "_descriptionForPropertyWithAssertions:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Suppressing status bar %{public}@ change due to outstanding disablement assertions: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (v7)
  {
    v7[2](v7);
  }

}

void __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  int8x16_t v10;

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "forgetEitherSideHistory");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 161) = 1;
  v2 = (void *)MEMORY[0x1E0CEAA08];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_4;
  v9[3] = &unk_1E8E9E820;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v10 = vextq_s8(v6, v6, 8uLL);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_5;
  v7[3] = &unk_1E8E9F230;
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v2, "animateWithParameters:fromCurrentState:animations:completion:", v3, 1, v9, v7);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 161) = 0;

}

void __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "alpha");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  if (BSFloatIsZero())
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);

    if (v2)
      return;
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_styleRequestForSettings:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

void __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 1;
  v7 = v5;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setStyleRequest:animationParameters:", v5, a2);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CEABB0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_2;
    v8[3] = &unk_1E8E9E820;
    v9 = *(id *)(a1 + 40);
    v10 = v7;
    objc_msgSend(v6, "performWithoutAnimation:", v8);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 0;

}

- (SBWindowSceneStatusBarAssertionManager)initWithWindowScene:(id)a3
{
  id v4;
  SBWindowSceneStatusBarAssertionManager *v5;
  uint64_t v6;
  NSHashTable *disableAlphaChangeAssertions;
  uint64_t v8;
  NSHashTable *disableUserInteractionChangeAssertions;
  uint64_t v10;
  NSHashTable *hideStatusBarAssertions;
  id v12;
  uint64_t v13;
  BSInvalidatable *stateCaptureAssertion;
  id v16;
  id location;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBWindowSceneStatusBarAssertionManager;
  v5 = -[SBWindowSceneStatusBarAssertionManager init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v6 = objc_claimAutoreleasedReturnValue();
    disableAlphaChangeAssertions = v5->_disableAlphaChangeAssertions;
    v5->_disableAlphaChangeAssertions = (NSHashTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v8 = objc_claimAutoreleasedReturnValue();
    disableUserInteractionChangeAssertions = v5->_disableUserInteractionChangeAssertions;
    v5->_disableUserInteractionChangeAssertions = (NSHashTable *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
    hideStatusBarAssertions = v5->_hideStatusBarAssertions;
    v5->_hideStatusBarAssertions = (NSHashTable *)v10;

    objc_storeWeak((id *)&v5->_windowScene, v4);
    objc_initWeak(&location, v5);
    v12 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v16, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v13 = objc_claimAutoreleasedReturnValue();
    stateCaptureAssertion = v5->_stateCaptureAssertion;
    v5->_stateCaptureAssertion = (BSInvalidatable *)v13;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v5;
}

id __62__SBWindowSceneStatusBarAssertionManager_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBWindowSceneStatusBarAssertionManager _cleanUpAllStatusBarSettingsAssertions](self, "_cleanUpAllStatusBarSettingsAssertions");
  v3.receiver = self;
  v3.super_class = (Class)SBWindowSceneStatusBarAssertionManager;
  -[SBWindowSceneStatusBarAssertionManager dealloc](&v3, sel_dealloc);
}

- (id)effectiveStatusBarStyleRequestWithSettings:(id)a3
{
  SBStatusBarSettings *currentStatusBarSettings;
  id v5;
  void *v6;
  void *v7;

  currentStatusBarSettings = self->_currentStatusBarSettings;
  v5 = a3;
  v6 = (void *)-[SBStatusBarSettings mutableCopy](currentStatusBarSettings, "mutableCopy");
  objc_msgSend(v6, "applySettings:", v5);

  -[SBWindowSceneStatusBarAssertionManager _resolveEffectiveStatusBarStyleForSettings:](self, "_resolveEffectiveStatusBarStyleForSettings:", v6);
  -[SBWindowSceneStatusBarAssertionManager _styleRequestForSettings:](self, "_styleRequestForSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)currentEffectiveStatusBarStyleRequest
{
  return -[SBWindowSceneStatusBarAssertionManager _styleRequestForSettings:](self, "_styleRequestForSettings:", self->_currentStatusBarSettings);
}

- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  void *v6;
  unint64_t v7;

  -[SBStatusBarSettings backgroundActivitiesToSuppress](self->_currentStatusBarSettings, "backgroundActivitiesToSuppress", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a5 & ~STUIStyleOverridesForBackgroundActivityIdentifiers();

  return v7;
}

- (void)addObserver:(id)a3
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

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (NSString)description
{
  return (NSString *)-[SBWindowSceneStatusBarAssertionManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)acquireDisableAlphaChangesAssertionWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[SBDisableWindowSceneStatusBarAlphaChangesAssertion _initWithWindowSceneStatusBarAssertionManager:reason:]([SBDisableWindowSceneStatusBarAlphaChangesAssertion alloc], "_initWithWindowSceneStatusBarAssertionManager:reason:", self, v4);

  return v5;
}

- (id)acquireDisableUserInteractionChangesAssertionWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[SBDisableWindowSceneStatusBarUserInteractionChangesAssertion _initWithWindowSceneStatusBarAssertionManager:reason:]([SBDisableWindowSceneStatusBarUserInteractionChangesAssertion alloc], "_initWithWindowSceneStatusBarAssertionManager:reason:", self, v4);

  return v5;
}

- (id)newSettingsAssertionWithSettings:(id)a3 atLevel:(unint64_t)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = -[SBWindowSceneStatusBarSettingsAssertion _initWithWindowSceneStatusBarAssertionManager:settings:atLevel:reason:]([SBWindowSceneStatusBarSettingsAssertion alloc], "_initWithWindowSceneStatusBarAssertionManager:settings:atLevel:reason:", self, v9, a4, v8);

  return v10;
}

- (BOOL)statusBar:(id)a3 shouldRequestStyleAttributes:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  void *v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;

  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = a3;
  if ((objc_msgSend(v7, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBWindowSceneStatusBarAssertionManager statusBar:shouldRequestStyleAttributes:animationParameters:forced:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SBWindowSceneStatusBarAssertionManager.m"), 198, CFSTR("this call must be made on the main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statusBar");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8 && !self->_changingStatusBarStyle)
  {
    SBLogStatusBarish();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBWindowSceneStatusBarAssertionManager statusBar:shouldRequestStyleAttributes:animationParameters:forced:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  return 1;
}

- (void)_addDisableWindowSceneStatusBarAlphaChangesAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    SBLogStatusBarish();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Adding status bar disable alpha change assertion: %@", (uint8_t *)&v6, 0xCu);
    }

    -[NSHashTable addObject:](self->_disableAlphaChangeAssertions, "addObject:", v4);
  }

}

- (void)_removeDisableWindowSceneStatusBarAlphaChangesAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    SBLogStatusBarish();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Removing status bar disable alpha change assertion: %@", (uint8_t *)&v6, 0xCu);
    }

    -[NSHashTable removeObject:](self->_disableAlphaChangeAssertions, "removeObject:", v4);
    if (!-[NSHashTable count](self->_disableAlphaChangeAssertions, "count"))
      -[SBWindowSceneStatusBarAssertionManager _statusBarUpdatedFromSettings:toSettings:withAnimations:](self, "_statusBarUpdatedFromSettings:toSettings:withAnimations:", 0, self->_currentStatusBarSettings, 0);
  }

}

- (void)_addDisableWindowSceneStatusBarUserInteractionChangesAssertion:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_disableUserInteractionChangeAssertions, "addObject:");
}

- (void)_removeDisableWindowSceneStatusBarUserInteractionChangesAssertion:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_disableUserInteractionChangeAssertions, "removeObject:");
}

- (void)_addStatusBarSettingsAssertion:(id)a3
{
  -[SBWindowSceneStatusBarAssertionManager _addStatusBarSettingsAssertion:withAnimationParameters:](self, "_addStatusBarSettingsAssertion:withAnimationParameters:", a3, 0);
}

- (void)_removeStatusBarSettingsAssertion:(id)a3
{
  -[SBWindowSceneStatusBarAssertionManager _removeStatusBarSettingsAssertion:withAnimationParameters:](self, "_removeStatusBarSettingsAssertion:withAnimationParameters:", a3, 0);
}

- (void)_removeStatusBarSettingsAssertion:(id)a3 withAnimationParameters:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSPointerArray **statusBarSettingsAssertionsByLevel;
  NSPointerArray *v10;
  NSPointerArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSPointerArray *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "level");
  statusBarSettingsAssertionsByLevel = self->_statusBarSettingsAssertionsByLevel;
  v10 = self->_statusBarSettingsAssertionsByLevel[v8];
  v11 = v10;
  if (v10)
  {
    v12 = -[NSPointerArray count](v10, "count");
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      while (-[NSPointerArray pointerAtIndex:](v11, "pointerAtIndex:", v14) != v6)
      {
        if (v13 == ++v14)
          goto LABEL_13;
      }
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        SBLogStatusBarish();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "timestamp");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceDate:", v17);
          *(_DWORD *)buf = 134218242;
          v33 = v18;
          v34 = 2114;
          v35 = v6;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "removing status bar settings assertion after %f seconds: %{public}@", buf, 0x16u);

        }
        -[NSPointerArray removePointerAtIndex:](v11, "removePointerAtIndex:", v14);
        if (!-[NSPointerArray count](v11, "count"))
        {
          v19 = statusBarSettingsAssertionsByLevel[v8];
          statusBarSettingsAssertionsByLevel[v8] = 0;

        }
        -[SBWindowSceneStatusBarAssertionManager _evaluateSettingsWithStyleAnimations:](self, "_evaluateSettingsWithStyleAnimations:", v7);
      }
    }
  }
LABEL_13:
  v26 = v7;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v25, "statusBarAssertionManager:removeStatusBarSettingsAssertion:", self, v6);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v22);
  }

}

- (void)_modifiedStatusBarSettingsAssertion:(id)a3
{
  -[SBWindowSceneStatusBarAssertionManager _modifiedStatusBarSettingsAssertion:withAnimationParameters:](self, "_modifiedStatusBarSettingsAssertion:withAnimationParameters:", a3, 0);
}

- (void)_cleanUpAllStatusBarSettingsAssertions
{
  uint64_t v2;
  NSPointerArray **statusBarSettingsAssertionsByLevel;
  NSPointerArray *v4;

  v2 = 0;
  statusBarSettingsAssertionsByLevel = self->_statusBarSettingsAssertionsByLevel;
  do
  {
    v4 = statusBarSettingsAssertionsByLevel[v2];
    statusBarSettingsAssertionsByLevel[v2] = 0;

    ++v2;
  }
  while (v2 != 13);
}

- (id)_descriptionForPropertyWithAssertions:(id)a3
{
  if (self->_disableAlphaChangeAssertions == a3)
    return CFSTR("alpha");
  if (self->_disableUserInteractionChangeAssertions == a3)
    return CFSTR("user interaction");
  return 0;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWindowSceneStatusBarAssertionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWindowSceneStatusBarAssertionManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  SBWindowSceneStatusBarAssertionManager *v14;

  v4 = a3;
  -[SBWindowSceneStatusBarAssertionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__SBWindowSceneStatusBarAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E8E9E270;
  v7 = v5;
  v12 = v7;
  v13 = WeakRetained;
  v14 = self;
  v8 = WeakRetained;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v11);

  v9 = v7;
  return v9;
}

void __80__SBWindowSceneStatusBarAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  id v23;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("windowScene identifier"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "statusBarManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alpha");
  v8 = (id)objc_msgSend(v5, "appendFloat:withName:", CFSTR("statusBarAlpha"));

  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 136), CFSTR("currentSettings"));
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendArraySection:withName:skipIfEmpty:", v11, CFSTR("disableAlphaChangeAssertions"), 1);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendArraySection:withName:skipIfEmpty:", v13, CFSTR("disableUserInteractionChangeAssertions"), 1);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "activeMultilinePrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __80__SBWindowSceneStatusBarAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v21 = &unk_1E8E9E820;
  v22 = *(_QWORD *)(a1 + 48);
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v14, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("statusBarSettingsByAssertionLevel"), v15, &v18);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "allObjects", v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendArraySection:withName:skipIfEmpty:", v17, CFSTR("Hiding Frontmost Status Bar Assertions"), 1);

}

void __80__SBWindowSceneStatusBarAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  unint64_t i;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  for (i = 0; i != 13; ++i)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8 * i + 32);
    if (v3)
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v5, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SBWindowSceneStatusBarSettingsLevelDescription(i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - (%@)"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "activeMultilinePrefix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v6, v11, v12, 0);

    }
  }
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_currentStatusBarSettings, 0);
  for (i = 128; i != 24; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_hideStatusBarAssertions, 0);
  objc_storeStrong((id *)&self->_disableUserInteractionChangeAssertions, 0);
  objc_storeStrong((id *)&self->_disableAlphaChangeAssertions, 0);
}

- (BOOL)isFrontmostStatusBarHidden
{
  return -[SBWindowSceneStatusBarAssertionManager isFrontmostStatusBarPartHidden:](self, "isFrontmostStatusBarPartHidden:", 0xFFFFLL);
}

- (BOOL)isFrontmostStatusBarPartHidden:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v31;
  void *v32;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isStatusBarEffectivelyHidden"))
    goto LABEL_40;
  objc_msgSend(WeakRetained, "lockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isUILocked")
    || (-[SBWindowSceneStatusBarAssertionManager currentStatusBarSettings](self, "currentStatusBarSettings"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "alpha"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqual:", &unk_1E91D1DA8),
        v9,
        v8,
        !v10))
  {
    objc_msgSend(WeakRetained, "transientOverlayPresenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasActivePresentation"))
    {
      v11 = objc_msgSend(v12, "hasVisibleStatusBar") ^ 1;

      goto LABEL_41;
    }
    objc_msgSend(WeakRetained, "switcherController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutStatePrimaryElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "workspaceEntity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applicationSceneEntity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sceneHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "layoutStateSideElement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "workspaceEntity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "applicationSceneEntity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sceneHandle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      LOBYTE(v11) = 1;
      goto LABEL_39;
    }
    objc_msgSend(v17, "application");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isClassic")
      && !objc_msgSend(v21, "includesStatusBarInClassicJailForInterfaceOrientation:", objc_msgSend(v17, "activationInterfaceOrientationForCurrentOrientation")))
    {
      LOBYTE(v11) = 0;
LABEL_38:

LABEL_39:
      if (v17)
        goto LABEL_41;
LABEL_40:
      LOBYTE(v11) = objc_msgSend(v6, "isStatusBarEffectivelyHidden");
      goto LABEL_41;
    }
    objc_msgSend(WeakRetained, "switcherController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isInAppStatusBarHidden") & 1) != 0)
    {
      LOBYTE(v11) = 1;
LABEL_37:

      goto LABEL_38;
    }
    if (a3 <= 3)
    {
      if (a3 != 1)
      {
        if (a3 != 2)
          goto LABEL_36;
        if (objc_msgSend(v22, "windowManagementStyle") == 1 && v32)
        {
          v23 = v32;
          goto LABEL_23;
        }
      }
LABEL_22:
      v23 = v17;
LABEL_23:
      objc_msgSend(v23, "sceneIfExists");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
LABEL_24:
        objc_msgSend(v24, "uiClientSettings", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "statusBarHidden") & 1) != 0)
        {
          LOBYTE(v11) = 1;
        }
        else
        {
          objc_msgSend(v25, "statusBarAlpha");
          LOBYTE(v11) = BSFloatIsZero();
        }

        goto LABEL_37;
      }
LABEL_36:
      LOBYTE(v11) = objc_msgSend(v22, "unlockedEnvironmentMode") == 2;
      goto LABEL_37;
    }
    if (a3 != 4)
    {
      if (a3 != 0xFFFF)
        goto LABEL_36;
      goto LABEL_22;
    }
    objc_msgSend(v22, "layoutState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appLayout");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(objc_msgSend(v27, "configuration"));
    if (v28 >= 2)
    {
      if (v28 == 2)
      {
        v29 = v32;
        goto LABEL_33;
      }
      if (v28 != 4)
      {
        v24 = 0;
LABEL_35:

        if (v24)
          goto LABEL_24;
        goto LABEL_36;
      }
    }
    v29 = v17;
LABEL_33:
    objc_msgSend(v29, "sceneIfExists");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }

  LOBYTE(v11) = 1;
LABEL_41:

  return v11;
}

- (id)acquireHideFrontmostStatusBarAssertionForReason:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = -[SBWindowSceneStatusBarAssertionManager newSettingsAssertionWithStatusBarHidden:atLevel:reason:](self, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 7, v4);
  objc_msgSend(v5, "acquire");
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestInAppStatusBarHiddenAssertionForReason:animated:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "transientOverlayPresenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newContentStatusBarHiddenAssertionWithReason:", CFSTR("com.springboard.SBStatusBarManager.hideStatusBarAssertion"));
  v11 = objc_alloc(MEMORY[0x1E0D01868]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __120__SBWindowSceneStatusBarAssertionManager_FrontmostStatusBarVisibility__acquireHideFrontmostStatusBarAssertionForReason___block_invoke;
  v17[3] = &unk_1E8EB3628;
  v18 = v5;
  v19 = v8;
  v20 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v5;
  v15 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("com.springboard.SBStatusBarManager.hideStatusBarAssertion"), v4, MEMORY[0x1E0C80D38], v17);

  -[NSHashTable addObject:](self->_hideStatusBarAssertions, "addObject:", v15);
  return v15;
}

uint64_t __120__SBWindowSceneStatusBarAssertionManager_FrontmostStatusBarVisibility__acquireHideFrontmostStatusBarAssertionForReason___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "invalidate");
  objc_msgSend(a1[5], "invalidate");
  return objc_msgSend(a1[6], "invalidate");
}

- (void)statusBar:(uint64_t)a3 shouldRequestStyleAttributes:(uint64_t)a4 animationParameters:(uint64_t)a5 forced:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Style change requested outside of SBWindowSceneStatusBarSettingsAssertion", a5, a6, a7, a8, 0);
}

@end
