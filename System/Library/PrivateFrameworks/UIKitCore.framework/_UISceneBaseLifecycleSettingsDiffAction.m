@implementation _UISceneBaseLifecycleSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  v12 = a7;
  if (objc_msgSend(v10, "_hasLifecycle"))
  {
    objc_msgSend(v10, "_effectiveSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext(v10, v11, v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __153___UISceneBaseLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
      v15[3] = &unk_1E16B7EF0;
      v19 = v14;
      v16 = v10;
      v17 = v11;
      v18 = v12;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v18, v15, 0);

    }
  }

}

@end
