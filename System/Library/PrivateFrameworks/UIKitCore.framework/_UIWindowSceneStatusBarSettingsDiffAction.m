@implementation _UIWindowSceneStatusBarSettingsDiffAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsStatusBarDiffInspector, 0);
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  char v28;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneStatusBarSettingsDiffAction.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]]"));

  }
  v15 = v12;
  v28 = 0;
  if (v13)
  {
    -[_UIWindowSceneStatusBarSettingsDiffAction sceneSettingsStatusBarDiffInspector](self, "sceneSettingsStatusBarDiffInspector");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inspectDiff:withContext:", v13, &v28);

  }
  else
  {
    v28 = 56;
  }
  objc_msgSend(v15, "_effectiveUISettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if ((v28 & 4) != 0)
  {
    objc_msgSend(v15, "statusBarManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateStatusBarAppearance");

    v18 = v28;
  }
  if ((v18 & 0x20) != 0)
  {
    objc_msgSend(v17, "safeAreaInsetsPortrait");
    v21 = v20;
    objc_msgSend(v17, "defaultStatusBarHeightForOrientation:", 1);
    if (v21 < v22)
    {
      objc_msgSend(v15, "_allWindows");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __155___UIWindowSceneStatusBarSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
      v26[3] = &unk_1E16B3FD8;
      v27 = v23;
      v24 = v23;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v14, v26, 0);

    }
  }

}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsStatusBarDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsStatusBarDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsStatusBarDiffInspector = self->_sceneSettingsStatusBarDiffInspector;
  if (!sceneSettingsStatusBarDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsStatusBarDiffInspector;
    self->_sceneSettingsStatusBarDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeStatusBarStyleOverridesToSuppressWithBlock:](self->_sceneSettingsStatusBarDiffInspector, "observeStatusBarStyleOverridesToSuppressWithBlock:", &__block_literal_global_94);
    -[UIApplicationSceneSettingsDiffInspector observeForcedStatusBarForegroundTransparentWithBlock:](self->_sceneSettingsStatusBarDiffInspector, "observeForcedStatusBarForegroundTransparentWithBlock:", &__block_literal_global_1_8);
    -[UIApplicationSceneSettingsDiffInspector observeForcedStatusBarStyleWithBlock:](self->_sceneSettingsStatusBarDiffInspector, "observeForcedStatusBarStyleWithBlock:", &__block_literal_global_2_3);
    -[UIApplicationSceneSettingsDiffInspector observeStatusBarPartsWithBlock:](self->_sceneSettingsStatusBarDiffInspector, "observeStatusBarPartsWithBlock:", &__block_literal_global_3_2);
    -[UIApplicationSceneSettingsDiffInspector observeStatusBarAvoidanceFrameWithBlock:](self->_sceneSettingsStatusBarDiffInspector, "observeStatusBarAvoidanceFrameWithBlock:", &__block_literal_global_4_1);
    -[UIApplicationSceneSettingsDiffInspector observeStatusBarHeightWithBlock:](self->_sceneSettingsStatusBarDiffInspector, "observeStatusBarHeightWithBlock:", &__block_literal_global_5_2);
    sceneSettingsStatusBarDiffInspector = self->_sceneSettingsStatusBarDiffInspector;
  }
  return sceneSettingsStatusBarDiffInspector;
}

- (void)_updateForcedStatusBarForegroundTransparentWithSceneSettings:(id)a3 transitionContext:(id)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  UIStatusBarStyleAnimationParameters *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  _QWORD v18[4];
  char v19;

  v5 = a4;
  v6 = objc_msgSend(a3, "forcedStatusBarForegroundTransparent");
  objc_msgSend((id)UIApp, "statusBarWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uiClientSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isStatusBarForegroundTransparent");

  if (v6 != v10)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __124___UIWindowSceneStatusBarSettingsDiffAction__updateForcedStatusBarForegroundTransparentWithSceneSettings_transitionContext___block_invoke;
    v18[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v19 = v6;
    objc_msgSend(v8, "updateUIClientSettingsWithBlock:", v18);
    v11 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
    objc_msgSend(v5, "animationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "duration");
    -[UIStatusBarAnimationParameters setDuration:](v11, "setDuration:");

    objc_msgSend(v5, "animationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delay");
    -[UIStatusBarAnimationParameters setDelay:](v11, "setDelay:");

    objc_msgSend(v5, "animationFence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWindow _synchronizeDrawingWithFence:](UIWindow, "_synchronizeDrawingWithFence:", v14);

    objc_msgSend((id)UIApp, "statusBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1.0;
    if (v6)
      v17 = 0.0;
    objc_msgSend(v15, "setForegroundAlpha:animationParameters:", v11, v17);

  }
}

- (void)setSceneSettingsStatusBarDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsStatusBarDiffInspector, a3);
}

@end
