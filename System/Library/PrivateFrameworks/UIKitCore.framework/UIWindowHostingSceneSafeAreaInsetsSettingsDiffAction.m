@implementation UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction

void __97___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction_sceneSettingsSafeAreaInsetsDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

void __97___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction_sceneSettingsSafeAreaInsetsDiffInspector__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  *a2 |= 2u;
}

void __97___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction_sceneSettingsSafeAreaInsetsDiffInspector__block_invoke_3(uint64_t a1, _BYTE *a2)
{
  *a2 |= 4u;
}

void __97___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction_sceneSettingsSafeAreaInsetsDiffInspector__block_invoke_4(uint64_t a1, _BYTE *a2)
{
  *a2 |= 8u;
}

void __143___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction__updateSafeAreaInsetsWithSettingsObserverContext_windowHostingScene_transitionContext___block_invoke(uint64_t a1)
{
  id v1;
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
  v1 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "_sceneSettingsSafeAreaInsetsDidChange", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

@end
