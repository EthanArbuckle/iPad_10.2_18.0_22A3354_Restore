@implementation SHSheetSceneSettingsDiffAction

- (SHSheetSceneSettingsDiffAction)init
{
  SHSheetSceneSettingsDiffAction *v2;
  uint64_t v3;
  UIApplicationSceneSettingsDiffInspector *sceneSettingsDisplayDiffInspector;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHSheetSceneSettingsDiffAction;
  v2 = -[SHSheetSceneSettingsDiffAction init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sceneSettingsDisplayDiffInspector = v2->_sceneSettingsDisplayDiffInspector;
    v2->_sceneSettingsDisplayDiffInspector = (UIApplicationSceneSettingsDiffInspector *)v3;

    -[UIApplicationSceneSettingsDiffInspector observeInterfaceOrientationWithBlock:](v2->_sceneSettingsDisplayDiffInspector, "observeInterfaceOrientationWithBlock:", &__block_literal_global_4);
    -[UIApplicationSceneSettingsDiffInspector observeDisplayConfigurationWithBlock:](v2->_sceneSettingsDisplayDiffInspector, "observeDisplayConfigurationWithBlock:", &__block_literal_global_1);
  }
  return v2;
}

void __38__SHSheetSceneSettingsDiffAction_init__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

void __38__SHSheetSceneSettingsDiffAction_init__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  *a2 |= 2u;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v9;
  void *v10;
  void *v11;
  char v12;

  v12 = 0;
  v9 = a5;
  -[SHSheetSceneSettingsDiffAction sceneSettingsDisplayDiffInspector](self, "sceneSettingsDisplayDiffInspector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inspectDiff:withContext:", v9, &v12);

  if ((v12 & 3) != 0)
  {
    -[SHSheetSceneSettingsDiffAction delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sceneSettingsDidChange:", self);

  }
}

- (SHSheetSceneSettingsDiffActionDelegate)delegate
{
  return (SHSheetSceneSettingsDiffActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsDisplayDiffInspector
{
  return self->_sceneSettingsDisplayDiffInspector;
}

- (void)setSceneSettingsDisplayDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsDisplayDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsDisplayDiffInspector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
