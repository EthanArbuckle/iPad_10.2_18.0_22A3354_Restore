@implementation UIWindowSceneStatusBarSettingsDiffAction

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  *a2 |= 2u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_3(uint64_t a1, _BYTE *a2)
{
  *a2 |= 4u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_4(uint64_t a1, _BYTE *a2)
{
  *a2 |= 8u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_5(uint64_t a1, _BYTE *a2)
{
  *a2 |= 0x10u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_6(uint64_t a1, _BYTE *a2)
{
  *a2 |= 0x20u;
}

void __155___UIWindowSceneStatusBarSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "level", (_QWORD)v8);
        if (v7 < 1000.0)
          objc_msgSend(v6, "_sceneSettingsSafeAreaInsetsDidChange");
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

uint64_t __124___UIWindowSceneStatusBarSettingsDiffAction__updateForcedStatusBarForegroundTransparentWithSceneSettings_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatusBarForegroundTransparent:", *(unsigned __int8 *)(a1 + 32));
}

@end
