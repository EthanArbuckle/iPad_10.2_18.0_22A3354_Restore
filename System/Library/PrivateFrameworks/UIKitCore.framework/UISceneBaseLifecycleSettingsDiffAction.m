@implementation UISceneBaseLifecycleSettingsDiffAction

void __153___UISceneBaseLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(_QWORD *a1)
{
  id v2;

  (*(void (**)(void))(a1[7] + 16))();
  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiScene:transitionedFromState:withTransitionContext:", a1[4], a1[5], a1[6]);

}

@end
