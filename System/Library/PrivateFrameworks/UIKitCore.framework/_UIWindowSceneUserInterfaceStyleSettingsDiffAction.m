@implementation _UIWindowSceneUserInterfaceStyleSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  objc_class *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  char v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(v13, "conformsToProtocol:", &unk_1EDE7D5A8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneUserInterfaceStyleSettingsDiffAction.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]] || [uiScene conformsToProtocol:@protocol(_UISceneUIWindowHosting)]"));

  }
  v33 = 0;
  -[_UIWindowSceneUserInterfaceStyleSettingsDiffAction sceneSettingsUserInterfaceStyleDiffInspector](self, "sceneSettingsUserInterfaceStyleDiffInspector");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "inspectDiff:withContext:", v16, &v33);

  if ((v33 & 1) != 0)
  {
    objc_msgSend(v15, "animationFence");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_synchronizeDrawingWithFence:", v18);

    objc_msgSend(v14, "uiSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceStyle");
    v21 = _performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType____s_category_0;
    if (!_performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType____s_category_0)
    {
      v21 = __UILogCategoryGetNode("InterfaceStyle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&_performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType____s_category_0);
    }
    v22 = *(id *)(v21 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v13;
      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p>"), v26, v23);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = CFSTR("(nil)");
      }

      v28 = v27;
      objc_msgSend(v23, "_persistenceIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v35 = v20;
      v36 = 2114;
      v37 = v27;
      v38 = 2114;
      v39 = v29;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "Scene did update interface style to %{public}ld, %{public}@ (%{public}@)", buf, 0x20u);

    }
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __164___UIWindowSceneUserInterfaceStyleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
    v31[3] = &unk_1E16B1B28;
    v32 = v13;
    -[_UIWindowSceneUserInterfaceStyleSettingsDiffAction _animateUserInterfaceStyleChangeInScene:transitionContext:applyChangesBlock:](self, "_animateUserInterfaceStyleChangeInScene:transitionContext:applyChangesBlock:", v32, v15, v31);

  }
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsUserInterfaceStyleDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsUserInterfaceStyleDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsUserInterfaceStyleDiffInspector = self->_sceneSettingsUserInterfaceStyleDiffInspector;
  if (!sceneSettingsUserInterfaceStyleDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsUserInterfaceStyleDiffInspector;
    self->_sceneSettingsUserInterfaceStyleDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeUserInterfaceStyleWithBlock:](self->_sceneSettingsUserInterfaceStyleDiffInspector, "observeUserInterfaceStyleWithBlock:", &__block_literal_global_439);
    sceneSettingsUserInterfaceStyleDiffInspector = self->_sceneSettingsUserInterfaceStyleDiffInspector;
  }
  return sceneSettingsUserInterfaceStyleDiffInspector;
}

- (void)_animateUserInterfaceStyleChangeInScene:(id)a3 transitionContext:(id)a4 applyChangesBlock:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  _UIWindowSceneUserInterfaceStyleAnimationSnapshotWindow *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _UIWindowSceneUserInterfaceStyleAnimationSnapshotWindow *v18;
  _QWORD v19[4];
  _UIWindowSceneUserInterfaceStyleAnimationSnapshotWindow *v20;
  _QWORD v21[4];
  _UIWindowSceneUserInterfaceStyleAnimationSnapshotWindow *v22;

  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(a4, "animationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    v10 = -[UIWindow initWithWindowScene:]([_UIWindowSceneUserInterfaceStyleAnimationSnapshotWindow alloc], "initWithWindowScene:", v7);
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
    v21[2] = __130___UIWindowSceneUserInterfaceStyleSettingsDiffAction__animateUserInterfaceStyleChangeInScene_transitionContext_applyChangesBlock___block_invoke;
    v21[3] = &unk_1E16B3FD8;
    v22 = v10;
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __130___UIWindowSceneUserInterfaceStyleSettingsDiffAction__animateUserInterfaceStyleChangeInScene_transitionContext_applyChangesBlock___block_invoke_2;
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

- (void)setSceneSettingsUserInterfaceStyleDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsUserInterfaceStyleDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsUserInterfaceStyleDiffInspector, 0);
}

@end
