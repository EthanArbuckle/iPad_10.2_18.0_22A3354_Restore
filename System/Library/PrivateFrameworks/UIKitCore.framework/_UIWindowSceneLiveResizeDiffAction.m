@implementation _UIWindowSceneLiveResizeDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;

  v11 = a3;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneLiveResizeDiffAction.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]]"));

  }
  v13 = v11;
  v16 = 0;
  -[_UIWindowSceneLiveResizeDiffAction sceneSettingsLiveResizeDiffInspector](self, "sceneSettingsLiveResizeDiffInspector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inspectDiff:withContext:", v12, &v16);

  if ((v16 & 1) != 0)
    -[UIWindowScene _inLiveResizeDidChange](v13);

}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsLiveResizeDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsLiveResizeDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsLiveResizeDiffInspector = self->_sceneSettingsLiveResizeDiffInspector;
  if (!sceneSettingsLiveResizeDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsLiveResizeDiffInspector;
    self->_sceneSettingsLiveResizeDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeInLiveResizeWithBlock:](self->_sceneSettingsLiveResizeDiffInspector, "observeInLiveResizeWithBlock:", &__block_literal_global_570);
    sceneSettingsLiveResizeDiffInspector = self->_sceneSettingsLiveResizeDiffInspector;
  }
  return sceneSettingsLiveResizeDiffInspector;
}

- (void)setSceneSettingsLiveResizeDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsLiveResizeDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsLiveResizeDiffInspector, 0);
}

@end
