@implementation _UISceneTargetOfEventDeferringEnvironmentsDiffAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector, 0);
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  _UISceneTargetOfEventDeferringEnvironmentsDiffAction *v10;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector;
  uint64_t v12;
  UIApplicationSceneSettingsDiffInspector *v13;
  void *v14;
  char v15;

  v10 = self;
  v15 = 0;
  if (self)
  {
    sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector = self->_sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector;
    if (!sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector)
    {
      v12 = objc_opt_new();
      v13 = v10->_sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector;
      v10->_sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector = (UIApplicationSceneSettingsDiffInspector *)v12;

      -[UIApplicationSceneSettingsDiffInspector observeTargetOfEventDeferringEnvironmentsWithBlock:](v10->_sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector, "observeTargetOfEventDeferringEnvironmentsWithBlock:", &__block_literal_global_85);
      sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector = v10->_sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector;
    }
    v10 = sceneSettingsTargetOfEventDeferringEnvironmentsDiffInspector;
  }
  -[_UISceneTargetOfEventDeferringEnvironmentsDiffAction inspectDiff:withContext:](v10, "inspectDiff:withContext:", a5, &v15, a5, a6, a7, *(_QWORD *)&a8);

  if ((v15 & 1) != 0)
  {
    objc_msgSend(a3, "_keyWindowSceneObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowSceneObserver evaluateTargetOfEventDeferringEnvironments]((uint64_t)v14);

  }
}

@end
