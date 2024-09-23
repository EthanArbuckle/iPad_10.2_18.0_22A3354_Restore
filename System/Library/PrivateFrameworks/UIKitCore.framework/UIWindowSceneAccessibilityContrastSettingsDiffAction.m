@implementation UIWindowSceneAccessibilityContrastSettingsDiffAction

void __104___UIWindowSceneAccessibilityContrastSettingsDiffAction_sceneSettingsAccessibilityContrastDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

void __167___UIWindowSceneAccessibilityContrastSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_windows", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "_updateWindowTraits");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __136___UIWindowSceneAccessibilityContrastSettingsDiffAction__animateAccessibilityContrastChangeInScene_transitionContext_applyChangesBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __136___UIWindowSceneAccessibilityContrastSettingsDiffAction__animateAccessibilityContrastChangeInScene_transitionContext_applyChangesBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setWindowScene:", 0);
}

@end
