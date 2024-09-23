@implementation _UIWindowSceneWindowingModeDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneWindowingModeDiffAction.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]]"));

  }
  v18 = 0;
  -[_UIWindowSceneWindowingModeDiffAction sceneSettingsDisplayDiffInspector](self, "sceneSettingsDisplayDiffInspector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inspectDiff:withContext:", v14, &v18);

  if ((v18 & 1) != 0)
  {
    objc_msgSend(v13, "uiSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setEnhancedWindowingEnabled:", objc_msgSend(v16, "enhancedWindowingEnabled"));

  }
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsDisplayDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsDisplayDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsDisplayDiffInspector = self->_sceneSettingsDisplayDiffInspector;
  if (!sceneSettingsDisplayDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsDisplayDiffInspector;
    self->_sceneSettingsDisplayDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeEnhancedWindowingEnabledWithBlock:](self->_sceneSettingsDisplayDiffInspector, "observeEnhancedWindowingEnabledWithBlock:", &__block_literal_global_203);
    sceneSettingsDisplayDiffInspector = self->_sceneSettingsDisplayDiffInspector;
  }
  return sceneSettingsDisplayDiffInspector;
}

- (void)setSceneSettingsDisplayDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsDisplayDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsDisplayDiffInspector, 0);
}

@end
