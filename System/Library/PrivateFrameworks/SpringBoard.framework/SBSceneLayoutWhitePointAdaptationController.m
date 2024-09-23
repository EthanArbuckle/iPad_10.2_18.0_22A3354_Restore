@implementation SBSceneLayoutWhitePointAdaptationController

+ (id)_harmonySettings
{
  void *v2;
  void *v3;

  +[SBHarmonyController sharedInstance](SBHarmonyController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "harmonySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateWhitePointAdaptationStrengthWithFromApplicationScenes:(id)a3 toApplicationScenes:(id)a4 fromPercentage:(double)a5 toPercentage:(double)a6 animationSettings:(id)a7 interactive:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __CFString *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  NSObject *v46;
  __CFString *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  __CFString *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  __CFString *v57;
  double v58;
  double v59;
  NSObject *v60;
  void *v61;

  v8 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (!v8
    || +[SBSceneLayoutWhitePointAdaptationController _isInteractiveUpdateEnabled](SBSceneLayoutWhitePointAdaptationController, "_isInteractiveUpdateEnabled"))
  {
    SBLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17)
    {
      SBLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[SBSceneLayoutWhitePointAdaptationController updateWhitePointAdaptationStrength].cold.2();

      SBLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:].cold.3();

      __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke(v20, v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (__CFString *)v22;
      else
        v24 = CFSTR("NONE");
      SBKeyValueLog(CFSTR("FROM APPLICATIONS"), v24, 0);

      __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_2(v25, v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
        v29 = (__CFString *)v27;
      else
        v29 = CFSTR("NONE");
      SBKeyValueLog(CFSTR("WHITE POINT ADAPTIVITY STYLE"), v29, 1);

      __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke(v30, v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR(", "));
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v32;
      if (v32)
        v34 = (__CFString *)v32;
      else
        v34 = CFSTR("NONE");
      SBKeyValueLog(CFSTR("TO APPLICATIONS"), v34, 0);

      __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_2(v35, v14);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR(", "));
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      if (v37)
        v39 = (__CFString *)v37;
      else
        v39 = CFSTR("NONE");
      SBKeyValueLog(CFSTR("WHITE POINT ADAPTIVITY STYLE"), v39, 1);

    }
    v40 = objc_msgSend(v13, "count");
    if (v40)
    {
      __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_3(v40, v13);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = &unk_1E91CE728;
    }
    v42 = objc_msgSend(v14, "count");
    if (v42)
    {
      __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_3(v42, v14);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = &unk_1E91CE740;
    }
    SBLogCommon();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG);

    if (v45)
    {
      SBLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:].cold.2();

      if (v8)
        v47 = CFSTR("INTERACTIVE");
      else
        v47 = CFSTR("STANDARD");
      SBKeyValueLog(CFSTR("TYPE"), v47, 1);
      __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_4(v48, v41);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR(", "));
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v50;
      if (v50)
        v52 = (__CFString *)v50;
      else
        v52 = CFSTR("NONE");
      SBKeyValueLog(CFSTR("FROM"), v52, 1);

      SBKeyDoubleValueLog(CFSTR("PERCENTAGE"), 2, a5);
      __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_4(v53, v43);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR(", "));
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v55;
      if (v55)
        v57 = (__CFString *)v55;
      else
        v57 = CFSTR("NONE");
      SBKeyValueLog(CFSTR("TO"), v57, 1);

      SBKeyDoubleValueLog(CFSTR("PERCENTAGE"), 2, a6);
      objc_msgSend(v15, "duration");
      SBKeyDoubleValueLog(CFSTR("ANIMATION DURATION"), 1, v58);
      objc_msgSend(v15, "delay");
      SBKeyDoubleValueLog(CFSTR("ANIMATION DELAY"), 1, v59);
      SBLogCommon();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithAnimationSettings:].cold.1();

    }
    +[SBHarmonyController sharedInstance](SBHarmonyController, "sharedInstance");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "transitionFromWhitePointAdaptivityStyleWithStyles:toWhitePointAdaptivityStyleWithStyles:fromPercentage:toPercentage:animationSettings:", v41, v43, v15, a5, a6);

  }
}

id __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "whitePointAdaptivityStyle", (_QWORD)v12));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1)
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_131);
  return (id)sharedInstance___sharedInstance_10;
}

- (void)updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:(id)a3 animationTransitionContext:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v6 = a3;
  v7 = objc_msgSend(v15, "isInteractive");
  v8 = objc_msgSend(v15, "isCancelled");
  v9 = v8;
  if ((_DWORD)v7)
  {
    objc_msgSend(v15, "percentComplete");
    v11 = v10;
    v12 = v10;
  }
  else
  {
    if ((_DWORD)v8)
      v11 = 1.0;
    else
      v11 = 0.0;
    if ((_DWORD)v8)
      v12 = 0.0;
    else
      v12 = 1.0;
  }
  objc_msgSend(v15, "transitionAnimationFactory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:fromPercentage:toPercentage:animationSettings:cancelled:interactive:](self, "_updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:fromPercentage:toPercentage:animationSettings:cancelled:interactive:", v6, v14, v9, v7, v11, v12);

}

- (void)_updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:(id)a3 fromPercentage:(double)a4 toPercentage:(double)a5 animationSettings:(id)a6 cancelled:(BOOL)a7 interactive:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  SBSceneLayoutWhitePointAdaptationController *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  _BOOL8 v31;
  id v32;

  v8 = a8;
  v9 = a7;
  v14 = a6;
  if (a3)
  {
    v32 = v14;
    objc_msgSend(a3, "applicationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "previousLayoutState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = objc_msgSend(v17, "unlockedEnvironmentMode");
      else
        v18 = 0;
      objc_msgSend(v16, "layoutState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = objc_msgSend(v21, "unlockedEnvironmentMode");
      else
        v22 = 0;
      if (v18 == 2)
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(v16, "previousApplicationSceneEntities");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSceneLayoutWhitePointAdaptationController _deviceSceneHandlesFromEntities:](self, "_deviceSceneHandlesFromEntities:", v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v22 == 2)
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v16, "applicationSceneEntities");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSceneLayoutWhitePointAdaptationController _deviceSceneHandlesFromEntities:](self, "_deviceSceneHandlesFromEntities:", v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!v9)
        goto LABEL_20;
    }
    else
    {
      v19 = 0;
      v20 = 0;
      if (!v9)
        goto LABEL_20;
    }
    if (!v8)
    {
      v25 = self;
      v26 = v19;
      v27 = v20;
      v28 = a4;
      v29 = a5;
      v30 = v32;
      v31 = 0;
LABEL_21:
      -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:](v25, "_updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:", v26, v27, v30, v31, v28, v29);

      v14 = v32;
      goto LABEL_22;
    }
LABEL_20:
    v25 = self;
    v26 = v20;
    v27 = v19;
    v28 = a4;
    v29 = a5;
    v30 = v32;
    v31 = v8;
    goto LABEL_21;
  }
LABEL_22:

}

- (id)_deviceSceneHandlesFromEntities:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v16 = v4;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
          v12 = objc_opt_class();
          objc_msgSend(v11, "sceneHandle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          SBSafeCast(v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v5, "addObject:", v14);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)updateWhitePointAdaptationStrength
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "SBWPA =BEGIN============================================", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (id)_defaultAnimationSettings
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(a1, "_defaultAnimationDuration");
  return (id)objc_msgSend(v2, "settingsWithDuration:");
}

- (void)_updateWhitePointAdaptationStrengthWithAnimationSettings:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "transientOverlayPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredWhitePointAdaptivityStyleValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
    if (v8 > 4)
    {
      v10 = &unk_1E91CE710;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    _UIStringFromWhitePointAdaptivityStyle();
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v12;
    if (v12)
      v13 = (__CFString *)v12;
    else
      v13 = CFSTR("NONE");
    SBKeyValueLog(CFSTR("TRANSIENT OVERLAY WHITE POINT ADAPTIVITY STYLE"), v13, 1);
  }
  else
  {
    -[SBSceneLayoutWhitePointAdaptationController _whitePointAdaptivityStylesForLayoutState](self, "_whitePointAdaptivityStylesForLayoutState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
      v10 = v11;
    else
      v10 = &unk_1E91CE710;
  }

  SBLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "integerValue", (_QWORD)v30);
          _UIStringFromWhitePointAdaptivityStyle();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v22)
            v24 = (const __CFString *)v22;
          else
            v24 = CFSTR("NONE");
          objc_msgSend(v16, "addObject:", v24);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v19);
    }

    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SBKeyValueLog(CFSTR("SET WHITE POINT ADAPTIVITY STYLE"), v25, 0);

    objc_msgSend(v4, "duration");
    SBKeyDoubleValueLog(CFSTR("ANIMATION DURATION"), 1, v26);
    objc_msgSend(v4, "delay");
    SBKeyDoubleValueLog(CFSTR("ANIMATION DELAY"), 1, v27);
    SBLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithAnimationSettings:].cold.1();

  }
  +[SBHarmonyController sharedInstance](SBHarmonyController, "sharedInstance", (_QWORD)v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWhitePointAdaptivityStyleWithStyles:animationSettings:", v10, v4);

}

- (id)_whitePointAdaptivityStylesForLayoutState
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v29;
  uint64_t v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "unlockedEnvironmentMode") == 2)
  {
    v5 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v4, "layoutStatePrimaryElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutStateSideElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBSceneLayoutWhitePointAdaptationController _whitePointAdaptivityStyleForLayoutElement:](self, "_whitePointAdaptivityStyleForLayoutElement:", v6);
  v9 = -[SBSceneLayoutWhitePointAdaptationController _whitePointAdaptivityStyleForLayoutElement:](self, "_whitePointAdaptivityStyleForLayoutElement:", v7);
  v10 = v9;
  if (v8 > 4)
  {
    if (v9 > 4)
    {
      v5 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    v14 = (void *)MEMORY[0x1E0C99D20];
    v15 = (uint64_t *)&v29;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 > 4)
  {
    v30 = v11;
    v14 = (void *)MEMORY[0x1E0C99D20];
    v15 = &v30;
LABEL_9:
    objc_msgSend(v14, "arrayWithObjects:count:", v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v31[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_12:
  objc_msgSend(v6, "uniqueIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (__CFString *)v16;
  else
    v18 = CFSTR("NONE");
  SBKeyValueLog(CFSTR("PRIMARY LAYOUT ELEMENT"), v18, 0);

  _UIStringFromWhitePointAdaptivityStyle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (__CFString *)v19;
  else
    v21 = CFSTR("NONE");
  SBKeyValueLog(CFSTR("WHITE POINT ADAPTIVITY STYLE"), v21, 1);

  objc_msgSend(v7, "uniqueIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (__CFString *)v22;
  else
    v24 = CFSTR("NONE");
  SBKeyValueLog(CFSTR("SIDE LAYOUT ELEMENT"), v24, 0);

  _UIStringFromWhitePointAdaptivityStyle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (__CFString *)v25;
  else
    v27 = CFSTR("NONE");
  SBKeyValueLog(CFSTR("WHITE POINT ADAPTIVITY STYLE"), v27, 1);

LABEL_25:
  return v5;
}

- (int64_t)_whitePointAdaptivityStyleForLayoutElement:(id)a3
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -1;
  if (a3)
  {
    -[SBSceneLayoutWhitePointAdaptationController _applicationSceneHandleForLayoutElement:](self, "_applicationSceneHandleForLayoutElement:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v3 = objc_msgSend(v4, "whitePointAdaptivityStyle");

  }
  return v3;
}

+ (double)_defaultAnimationDuration
{
  void *v2;
  float v3;
  double v4;

  objc_msgSend(a1, "_harmonySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "whitePointAdaptationUpdateDefaultDuration");
  v4 = v3;

  return v4;
}

- (id)_applicationSceneHandleForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "workspaceEntity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceApplicationSceneEntity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __61__SBSceneLayoutWhitePointAdaptationController_sharedInstance__block_invoke()
{
  SBSceneLayoutWhitePointAdaptationController *v0;
  void *v1;

  v0 = objc_alloc_init(SBSceneLayoutWhitePointAdaptationController);
  v1 = (void *)sharedInstance___sharedInstance_10;
  sharedInstance___sharedInstance_10 = (uint64_t)v0;

}

- (SBSceneLayoutWhitePointAdaptationController)init
{
  void *v3;
  int v4;
  SBSceneLayoutWhitePointAdaptationController *v5;
  objc_super v7;

  +[SBHarmonyController sharedInstance](SBHarmonyController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsWhitePointAdaptation");

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSceneLayoutWhitePointAdaptationController;
    self = -[SBSceneLayoutWhitePointAdaptationController init](&v7, sel_init);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateWhitePointAdaptationStrengthWithAnimationSettings:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SBSceneLayoutWhitePointAdaptationController updateWhitePointAdaptationStrength].cold.2();

    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBSceneLayoutWhitePointAdaptationController updateWhitePointAdaptationStrengthWithAnimationSettings:].cold.1();

  }
  if (v4)
  {
    -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithAnimationSettings:](self, "_updateWhitePointAdaptationStrengthWithAnimationSettings:", v4);
  }
  else
  {
    +[SBSceneLayoutWhitePointAdaptationController _defaultAnimationSettings](SBSceneLayoutWhitePointAdaptationController, "_defaultAnimationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithAnimationSettings:](self, "_updateWhitePointAdaptationStrengthWithAnimationSettings:", v9);

  }
}

- (void)updateWhitePointAdaptationStrengthWithFromApplicationSceneEntities:(id)a3 toApplicationSceneEntities:(id)a4 fromPercentage:(double)a5 toPercentage:(double)a6 animationSettings:(id)a7 interactive:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  void *v16;
  id v17;

  v8 = a8;
  v14 = a7;
  v15 = a4;
  -[SBSceneLayoutWhitePointAdaptationController _deviceSceneHandlesFromEntities:](self, "_deviceSceneHandlesFromEntities:", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSceneLayoutWhitePointAdaptationController _deviceSceneHandlesFromEntities:](self, "_deviceSceneHandlesFromEntities:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:](self, "_updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:", v17, v16, v14, v8, a5, a6);
}

id __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "sceneIdentifier", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "whitePointAdaptivityStyle", (_QWORD)v12);
          _UIStringFromWhitePointAdaptivityStyle();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "integerValue", (_QWORD)v14);
          _UIStringFromWhitePointAdaptivityStyle();
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (void *)v9;
          if (v9)
            v11 = (const __CFString *)v9;
          else
            v11 = CFSTR("NONE");
          objc_msgSend(v3, "addObject:", v11);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)_isInteractiveUpdateEnabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_harmonySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "whitePointAdaptationInteractiveUpdateEnabled");

  return v3;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
}

- (void)updateWhitePointAdaptationStrengthWithAnimationSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "SBWPA UPDATE WHITE POINT ADAPTATION STRENGTH WITH ANIMATION SETTINGS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateWhitePointAdaptationStrengthWithAnimationSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "SBWPA =END==============================================", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "SBWPA TRANSITION WHITE POINT ADAPTIVITY STYLE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "SBWPA UPDATE WHITE POINT ADAPTATION STRENGTH FOR APPLICATION TRANSITION", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
