@implementation _UIWindowSceneOcclusionSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneOcclusionSettingsDiffAction.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]]"));

  }
  v26 = 0;
  -[_UIWindowSceneOcclusionSettingsDiffAction sceneSettingsBackgroundAndOcclusionDiffInspector](self, "sceneSettingsBackgroundAndOcclusionDiffInspector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inspectDiff:withContext:", v14, &v26);

  if ((v26 & 3) != 0)
  {
    objc_msgSend(v13, "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    v27[0] = CFSTR("scene");
    v27[1] = CFSTR("isOccluded");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "isOccluded"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v17;
    v27[2] = CFSTR("isBackgrounded");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "isForeground") ^ 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v18;
    v27[3] = CFSTR("isCarDisplay");
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "settings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithBool:", objc_msgSend(v21, "isCarDisplay"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("UIApplicationSceneOcclusionChangedNotification"), self, v23);

  }
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsBackgroundAndOcclusionDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsBackgroundAndOcclusionDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsBackgroundAndOcclusionDiffInspector = self->_sceneSettingsBackgroundAndOcclusionDiffInspector;
  if (!sceneSettingsBackgroundAndOcclusionDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsBackgroundAndOcclusionDiffInspector;
    self->_sceneSettingsBackgroundAndOcclusionDiffInspector = v4;

    -[FBSSceneSettingsDiffInspector observeOcclusionsWithBlock:](self->_sceneSettingsBackgroundAndOcclusionDiffInspector, "observeOcclusionsWithBlock:", &__block_literal_global_93);
    -[FBSSceneSettingsDiffInspector observeIsForegroundWithBlock:](self->_sceneSettingsBackgroundAndOcclusionDiffInspector, "observeIsForegroundWithBlock:", &__block_literal_global_1_7);
    sceneSettingsBackgroundAndOcclusionDiffInspector = self->_sceneSettingsBackgroundAndOcclusionDiffInspector;
  }
  return sceneSettingsBackgroundAndOcclusionDiffInspector;
}

- (void)setSceneSettingsBackgroundAndOcclusionDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsBackgroundAndOcclusionDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsBackgroundAndOcclusionDiffInspector, 0);
}

@end
