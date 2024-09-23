@implementation _UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v14;
  id v15;
  char *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  char v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  char v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = (char *)a5;
  v17 = a6;
  v18 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(v14, "conformsToProtocol:", &unk_1EDE7D5A8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]] || [uiScene conformsToProtocol:@protocol(_UISceneUIWindowHosting)]"));

  }
  v38 = 0;
  -[_UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction sceneSettingsApplicationLifecycleEventDiffInspector](self, "sceneSettingsApplicationLifecycleEventDiffInspector");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inspectDiff:withContext:", v16, &v38);

  if (objc_msgSend(v14, "_hasLifecycle"))
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __186___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
    v34[3] = &unk_1E16B2B40;
    v35 = v14;
    v36 = v17;
    v37 = v18;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v37, v34, 0);

  }
  v20 = v38;
  if ((v38 & 1) != 0)
  {
    objc_msgSend((id)UIApp, "_updateIdleModeStatus");
    v20 = v38;
  }
  if ((v20 & 2) != 0)
  {
    v21 = _performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType____s_category;
    if (!_performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType____s_category)
    {
      v21 = __UILogCategoryGetNode("UIAlertControllerStackManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&_performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType____s_category);
    }
    v22 = *(NSObject **)(v21 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v16;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "canShowAlerts Updated: %@", buf, 0xCu);
    }
    objc_msgSend(v15, "uiSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "canShowAlerts");
    v25 = v14;
    if (NSClassFromString(CFSTR("UIWindowScene")))
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;
    v28 = v27;
    if (!v25 || v27)
    {

      if (!v28)
      {
LABEL_26:

        goto LABEL_27;
      }
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __186___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_96;
      v31[3] = &unk_1E16B7F38;
      v32 = v28;
      v33 = v24;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v18, v31, 0);
      v25 = v32;
    }
    else
    {
      BSLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v40 = "uiScene";
        v41 = 2082;
        v42 = "UIWindowScene";
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\", buf, 0x16u);
      }

    }
    goto LABEL_26;
  }
LABEL_27:

}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsApplicationLifecycleEventDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsApplicationLifecycleEventDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsApplicationLifecycleEventDiffInspector = self->_sceneSettingsApplicationLifecycleEventDiffInspector;
  if (!sceneSettingsApplicationLifecycleEventDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsApplicationLifecycleEventDiffInspector;
    self->_sceneSettingsApplicationLifecycleEventDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeIdleModeEnabledWithBlock:](self->_sceneSettingsApplicationLifecycleEventDiffInspector, "observeIdleModeEnabledWithBlock:", &__block_literal_global_92);
    -[UIApplicationSceneSettingsDiffInspector observeCanShowAlertsWithBlock:](self->_sceneSettingsApplicationLifecycleEventDiffInspector, "observeCanShowAlertsWithBlock:", &__block_literal_global_1_6);
    sceneSettingsApplicationLifecycleEventDiffInspector = self->_sceneSettingsApplicationLifecycleEventDiffInspector;
  }
  return sceneSettingsApplicationLifecycleEventDiffInspector;
}

- (void)setSceneSettingsApplicationLifecycleEventDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsApplicationLifecycleEventDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsApplicationLifecycleEventDiffInspector, 0);
}

@end
