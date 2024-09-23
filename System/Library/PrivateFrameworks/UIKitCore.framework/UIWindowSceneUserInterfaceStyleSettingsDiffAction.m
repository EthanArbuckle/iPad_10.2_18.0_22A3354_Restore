@implementation UIWindowSceneUserInterfaceStyleSettingsDiffAction

void __164___UIWindowSceneUserInterfaceStyleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "_updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:", 1, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UIWindowSceneDidUpdateSystemUserInterfaceStyle"), *(_QWORD *)(a1 + 32));

}

void __98___UIWindowSceneUserInterfaceStyleSettingsDiffAction_sceneSettingsUserInterfaceStyleDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

uint64_t __130___UIWindowSceneUserInterfaceStyleSettingsDiffAction__animateUserInterfaceStyleChangeInScene_transitionContext_applyChangesBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __130___UIWindowSceneUserInterfaceStyleSettingsDiffAction__animateUserInterfaceStyleChangeInScene_transitionContext_applyChangesBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setWindowScene:", 0);
}

@end
