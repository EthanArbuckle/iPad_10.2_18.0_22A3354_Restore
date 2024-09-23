@implementation _UIWindowSceneAccessibilityContrastSettingsDiffAction

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsAccessibilityContrastDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsAccessibilityContrastDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsAccessibilityContrastDiffInspector = self->_sceneSettingsAccessibilityContrastDiffInspector;
  if (!sceneSettingsAccessibilityContrastDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsAccessibilityContrastDiffInspector;
    self->_sceneSettingsAccessibilityContrastDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeAccessibilityContrastWithBlock:](self->_sceneSettingsAccessibilityContrastDiffInspector, "observeAccessibilityContrastWithBlock:", &__block_literal_global_125);
    sceneSettingsAccessibilityContrastDiffInspector = self->_sceneSettingsAccessibilityContrastDiffInspector;
  }
  return sceneSettingsAccessibilityContrastDiffInspector;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  char v20;

  v12 = a3;
  v13 = a7;
  v14 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(v12, "conformsToProtocol:", &unk_1EDE7D5A8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneAccessibilityContrastSettingsDiffAction.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]] || [uiScene conformsToProtocol:@protocol(_UISceneUIWindowHosting)]"));

  }
  v20 = 0;
  -[_UIWindowSceneAccessibilityContrastSettingsDiffAction sceneSettingsAccessibilityContrastDiffInspector](self, "sceneSettingsAccessibilityContrastDiffInspector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inspectDiff:withContext:", v14, &v20);

  if ((v20 & 1) != 0)
  {
    objc_msgSend(v13, "animationFence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_synchronizeDrawingWithFence:", v16);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __167___UIWindowSceneAccessibilityContrastSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
    v18[3] = &unk_1E16B1B28;
    v19 = v12;
    -[_UIWindowSceneAccessibilityContrastSettingsDiffAction _animateAccessibilityContrastChangeInScene:transitionContext:applyChangesBlock:](self, "_animateAccessibilityContrastChangeInScene:transitionContext:applyChangesBlock:", v19, v13, v18);

  }
}

- (void)_animateAccessibilityContrastChangeInScene:(id)a3 transitionContext:(id)a4 applyChangesBlock:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  _UIWindowSceneAccessibilityContrastAnimationSnapshotWindow *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _UIWindowSceneAccessibilityContrastAnimationSnapshotWindow *v18;
  _QWORD v19[4];
  _UIWindowSceneAccessibilityContrastAnimationSnapshotWindow *v20;
  _QWORD v21[4];
  _UIWindowSceneAccessibilityContrastAnimationSnapshotWindow *v22;

  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(a4, "animationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    v10 = -[UIWindow initWithWindowScene:]([_UIWindowSceneAccessibilityContrastAnimationSnapshotWindow alloc], "initWithWindowScene:", v7);
    -[UIWindow setWindowLevel:](v10, "setWindowLevel:", 15000001.0);
    -[UIView bounds](v10, "bounds");
    _UISnapshotScreenAtViewRectAfterCommit(v10, 0, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v15);
    -[UIWindow setHidden:](v10, "setHidden:", 0);
    v8[2](v8);
    v16 = (void *)MEMORY[0x1E0D016B0];
    v17 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __136___UIWindowSceneAccessibilityContrastSettingsDiffAction__animateAccessibilityContrastChangeInScene_transitionContext_applyChangesBlock___block_invoke;
    v21[3] = &unk_1E16B3FD8;
    v22 = v10;
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __136___UIWindowSceneAccessibilityContrastSettingsDiffAction__animateAccessibilityContrastChangeInScene_transitionContext_applyChangesBlock___block_invoke_2;
    v19[3] = &unk_1E16B3FD8;
    v20 = v22;
    v18 = v22;
    objc_msgSend(v16, "tryAnimatingWithSettings:actions:completion:", v9, v21, v19);

  }
  else
  {
    v8[2](v8);
  }

}

- (void)setSceneSettingsAccessibilityContrastDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsAccessibilityContrastDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsAccessibilityContrastDiffInspector, 0);
}

@end
