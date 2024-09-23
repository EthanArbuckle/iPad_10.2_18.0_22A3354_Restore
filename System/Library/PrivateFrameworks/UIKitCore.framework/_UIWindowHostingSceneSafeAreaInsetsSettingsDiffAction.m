@implementation _UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;

  v12 = a3;
  v13 = a7;
  v14 = a5;
  if ((objc_msgSend(v12, "_hostsWindows") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene _hostsWindows]"));

  }
  v18 = 0;
  v15 = v12;
  -[_UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction sceneSettingsSafeAreaInsetsDiffInspector](self, "sceneSettingsSafeAreaInsetsDiffInspector");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "inspectDiff:withContext:", v14, &v18);

  -[_UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction _updateSafeAreaInsetsWithSettingsObserverContext:windowHostingScene:transitionContext:](self, "_updateSafeAreaInsetsWithSettingsObserverContext:windowHostingScene:transitionContext:", v18, v15, v13);
}

- (id)sceneSettingsSafeAreaInsetsDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsSafeAreaInsetsDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsSafeAreaInsetsDiffInspector = self->_sceneSettingsSafeAreaInsetsDiffInspector;
  if (!sceneSettingsSafeAreaInsetsDiffInspector)
  {
    v4 = objc_alloc_init(UIApplicationSceneSettingsDiffInspector);
    v5 = self->_sceneSettingsSafeAreaInsetsDiffInspector;
    self->_sceneSettingsSafeAreaInsetsDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeSafeAreaInsetsPortraitWithBlock:](self->_sceneSettingsSafeAreaInsetsDiffInspector, "observeSafeAreaInsetsPortraitWithBlock:", &__block_literal_global_88);
    -[UIApplicationSceneSettingsDiffInspector observeSafeAreaInsetsLandscapeLeftWithBlock:](self->_sceneSettingsSafeAreaInsetsDiffInspector, "observeSafeAreaInsetsLandscapeLeftWithBlock:", &__block_literal_global_1_4);
    -[UIApplicationSceneSettingsDiffInspector observeSafeAreaInsetsPortraitUpsideDownWithBlock:](self->_sceneSettingsSafeAreaInsetsDiffInspector, "observeSafeAreaInsetsPortraitUpsideDownWithBlock:", &__block_literal_global_2_2);
    -[UIApplicationSceneSettingsDiffInspector observeSafeAreaInsetsLandscapeRightWithBlock:](self->_sceneSettingsSafeAreaInsetsDiffInspector, "observeSafeAreaInsetsLandscapeRightWithBlock:", &__block_literal_global_3_1);
    sceneSettingsSafeAreaInsetsDiffInspector = self->_sceneSettingsSafeAreaInsetsDiffInspector;
  }
  return sceneSettingsSafeAreaInsetsDiffInspector;
}

- (void)_updateSafeAreaInsetsWithSettingsObserverContext:(id)a3 windowHostingScene:(id)a4 transitionContext:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (a3.var0)
  {
    v13 = v5;
    v14 = v6;
    v8 = a5;
    objc_msgSend(a4, "_allWindows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __143___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction__updateSafeAreaInsetsWithSettingsObserverContext_windowHostingScene_transitionContext___block_invoke;
    v11[3] = &unk_1E16B3FD8;
    v12 = v9;
    v10 = v9;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v8, v11, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsSafeAreaInsetsDiffInspector, 0);
}

@end
