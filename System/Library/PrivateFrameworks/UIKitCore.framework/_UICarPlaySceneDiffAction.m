@implementation _UICarPlaySceneDiffAction

- (UIApplicationSceneSettingsDiffInspector)carPlayDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *carPlayDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  carPlayDiffInspector = self->_carPlayDiffInspector;
  if (!carPlayDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_carPlayDiffInspector;
    self->_carPlayDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeCarPlayDisableFiveRowKeyboardsWithBlock:](self->_carPlayDiffInspector, "observeCarPlayDisableFiveRowKeyboardsWithBlock:", &__block_literal_global_265);
    -[UIApplicationSceneSettingsDiffInspector observeCarPlayBlackWallpaperModeEnabledWithBlock:](self->_carPlayDiffInspector, "observeCarPlayBlackWallpaperModeEnabledWithBlock:", &__block_literal_global_1_13);
    carPlayDiffInspector = self->_carPlayDiffInspector;
  }
  return carPlayDiffInspector;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;

  v10 = a3;
  v14 = 0;
  v11 = a5;
  -[_UICarPlaySceneDiffAction carPlayDiffInspector](self, "carPlayDiffInspector");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inspectDiff:withContext:", v11, &v14);

  if ((v14 & 2) != 0)
  {
    objc_msgSend(v10, "_carPlaySceneComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_invalidateTraitOverrides");

  }
}

- (void)setCarPlayDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_carPlayDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carPlayDiffInspector, 0);
}

@end
