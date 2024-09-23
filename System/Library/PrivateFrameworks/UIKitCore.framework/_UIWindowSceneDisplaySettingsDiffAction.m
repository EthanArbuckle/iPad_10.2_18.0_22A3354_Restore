@implementation _UIWindowSceneDisplaySettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneDisplaySettingsDiffAction.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]]"));

  }
  v16 = v13;
  v28 = 0;
  -[_UIWindowSceneDisplaySettingsDiffAction sceneSettingsDisplayDiffInspector](self, "sceneSettingsDisplayDiffInspector");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "inspectDiff:withContext:", v15, &v28);

  if (a6)
  {
    v18 = v28;
  }
  else
  {
    objc_msgSend(v14, "uiSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "_containsSetting:", 39);

    v18 = v28;
    if (v20)
    {
      v18 = v28 | 2;
      v28 |= 2u;
    }
  }
  if ((v18 & 3) != 0)
  {
    objc_msgSend(v14, "settings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "displayConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "identity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      if ((v28 & 1) != 0 && (objc_msgSend((id)UIApp, "isFrontBoard") & 1) == 0)
        objc_msgSend(v24, "_updateDisplayConfiguration:", v22);
      objc_msgSend(v14, "uiSettings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_setReferenceDisplayModeStatus:", objc_msgSend(v25, "screenReferenceDisplayModeStatus"));

    }
    v18 = v28;
  }
  if ((v18 & 1) != 0)
  {
    -[UIScene _renderingEnvironmentSceneComponentRegisteringIfNecessary:](v16, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRenderingEnvironmentSceneComponent _invalidateTraitOverrides]((uint64_t)v26);

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

    -[FBSSceneSettingsDiffInspector observeDisplayConfigurationWithBlock:](self->_sceneSettingsDisplayDiffInspector, "observeDisplayConfigurationWithBlock:", &__block_literal_global_90);
    -[UIApplicationSceneSettingsDiffInspector observeScreenReferenceDisplayModeStatus:](self->_sceneSettingsDisplayDiffInspector, "observeScreenReferenceDisplayModeStatus:", &__block_literal_global_1_5);
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
