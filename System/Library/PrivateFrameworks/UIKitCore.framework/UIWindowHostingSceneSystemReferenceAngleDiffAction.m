@implementation UIWindowHostingSceneSystemReferenceAngleDiffAction

void __68___UIWindowHostingSceneSystemReferenceAngleDiffAction_diffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

void __68___UIWindowHostingSceneSystemReferenceAngleDiffAction_diffInspector__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  *a2 |= 2u;
}

void __165___UIWindowHostingSceneSystemReferenceAngleDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __165___UIWindowHostingSceneSystemReferenceAngleDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2;
  v2[3] = &unk_1E16B2290;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v1, v2, 0);

}

void __165___UIWindowHostingSceneSystemReferenceAngleDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2(uint64_t a1)
{
  id v2;

  +[_UISystemReferenceAngleMultiplexer sharedMultiplexer](_UISystemReferenceAngleMultiplexer, "sharedMultiplexer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemReferenceAngleDidChange:mode:forWindows:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

@end
