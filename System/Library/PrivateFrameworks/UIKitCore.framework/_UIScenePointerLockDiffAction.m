@implementation _UIScenePointerLockDiffAction

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsPointerLockedDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsPointerLockedDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsPointerLockedDiffInspector = self->_sceneSettingsPointerLockedDiffInspector;
  if (!sceneSettingsPointerLockedDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsPointerLockedDiffInspector;
    self->_sceneSettingsPointerLockedDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observePointerLockStatusWithBlock:](self->_sceneSettingsPointerLockedDiffInspector, "observePointerLockStatusWithBlock:", &__block_literal_global_589);
    sceneSettingsPointerLockedDiffInspector = self->_sceneSettingsPointerLockedDiffInspector;
  }
  return sceneSettingsPointerLockedDiffInspector;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v11 = a3;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(v11, "conformsToProtocol:", &unk_1EDE7D5A8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScenePointerLockDiffAction.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]] || [uiScene conformsToProtocol:@protocol(_UISceneUIWindowHosting)]"));

  }
  v16 = 0;
  -[_UIScenePointerLockDiffAction sceneSettingsPointerLockedDiffInspector](self, "sceneSettingsPointerLockedDiffInspector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inspectDiff:withContext:", v12, &v16);

  if ((v16 & 1) != 0)
  {
    objc_msgSend(v11, "pointerLockState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_pointerLockStatusUpdated");

  }
}

- (void)setSceneSettingsPointerLockedDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsPointerLockedDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsPointerLockedDiffInspector, 0);
}

@end
