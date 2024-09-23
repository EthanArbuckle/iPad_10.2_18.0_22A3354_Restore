@implementation UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction

void __186___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  objc_msgSend(*(id *)(a1 + 32), "_setIsRespondingToLifecycleEvent:", 1);
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v2, "_effectiveSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext(v2, v3, v4, *(void **)(a1 + 48));
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  if (v6)
    v6[2]();
  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uiScene:transitionedFromState:withTransitionContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "_setIsRespondingToLifecycleEvent:", 0);
}

void __127___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction_sceneSettingsApplicationLifecycleEventDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

void __127___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction_sceneSettingsApplicationLifecycleEventDiffInspector__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  *a2 |= 2u;
}

void __186___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_96(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_alertControllerStackManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v2, "_showHiddenStackedAlertControllers");
  else
    objc_msgSend(v2, "_hideStackedAlertControllers");
  if (*(_BYTE *)(a1 + 40) && (*(_BYTE *)(UIApp + 177) & 0x20) != 0)
    objc_msgSend((id)UIApp, "_stopDeactivatingForReason:", 13);

}

@end
