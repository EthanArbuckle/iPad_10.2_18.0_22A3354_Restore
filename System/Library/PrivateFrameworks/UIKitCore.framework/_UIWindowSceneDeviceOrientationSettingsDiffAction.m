@implementation _UIWindowSceneDeviceOrientationSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  v12 = a3;
  v13 = a7;
  v14 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneDeviceOrientationSettingsDiffAction.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]]"));

  }
  v18 = 0;
  v15 = v12;
  -[_UIWindowSceneDeviceOrientationSettingsDiffAction sceneSettingsDeviceOrientationDiffInspector](self, "sceneSettingsDeviceOrientationDiffInspector");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "inspectDiff:withContext:", v14, &v18);

  -[_UIWindowSceneDeviceOrientationSettingsDiffAction _updateDeviceOrientationWithSettingObserverContext:windowScene:transitionContext:](self, "_updateDeviceOrientationWithSettingObserverContext:windowScene:transitionContext:", v18, v15, v13);
}

- (FBSSceneSettingsDiffInspector)sceneSettingsDeviceOrientationDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsDeviceOrientationDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsDeviceOrientationDiffInspector = self->_sceneSettingsDeviceOrientationDiffInspector;
  if (!sceneSettingsDeviceOrientationDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsDeviceOrientationDiffInspector;
    self->_sceneSettingsDeviceOrientationDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeDeviceOrientationWithBlock:](self->_sceneSettingsDeviceOrientationDiffInspector, "observeDeviceOrientationWithBlock:", &__block_literal_global_86);
    sceneSettingsDeviceOrientationDiffInspector = self->_sceneSettingsDeviceOrientationDiffInspector;
  }
  return (FBSSceneSettingsDiffInspector *)sceneSettingsDeviceOrientationDiffInspector;
}

- (void)_updateDeviceOrientationWithSettingObserverContext:(id)a3 windowScene:(id)a4 transitionContext:(id)a5
{
  char v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v6 = (char)a3;
  v7 = a4;
  if ((v6 & 1) != 0)
  {
    v8 = a5;
    objc_msgSend(v7, "_settingsScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_FBSScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "uiSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "deviceOrientation");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __134___UIWindowSceneDeviceOrientationSettingsDiffAction__updateDeviceOrientationWithSettingObserverContext_windowScene_transitionContext___block_invoke;
    v13[3] = &unk_1E16B7A60;
    v14 = v7;
    v15 = v12;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v8, v13, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsDeviceOrientationDiffInspector, 0);
}

@end
