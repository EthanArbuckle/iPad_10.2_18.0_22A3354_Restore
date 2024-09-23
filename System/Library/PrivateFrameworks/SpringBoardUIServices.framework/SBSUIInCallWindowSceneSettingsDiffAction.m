@implementation SBSUIInCallWindowSceneSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int16 v26;
  char v27;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSUIInCallWindowSceneSettingsDiffAction.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[SBSUIInCallWindowScene class]]"));

  }
  v17 = v13;
  v27 = 0;
  v26 = 0;
  -[SBSUIInCallWindowSceneSettingsDiffAction _inCallSceneSettingsDiffInspector](self, "_inCallSceneSettingsDiffInspector");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inspectDiff:withContext:", v16, &v26);

  if ((_BYTE)v26)
  {
    v23 = v14;
    v24 = v17;
    v25 = v15;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContext();

  }
  if (HIBYTE(v26))
  {
    v22 = v17;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContext();

  }
  if (v27)
  {
    objc_msgSend(v14, "settings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isAttachedToWindowedAccessory");
    objc_msgSend(v19, "windowedAccessoryCutoutFrameInScreen");
    objc_msgSend(v17, "_setAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v20);

  }
}

void __154__SBSUIInCallWindowSceneSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "settings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  v3 = objc_msgSend(v7, "isAttachedToWindowedAccessory");
  objc_msgSend(v7, "windowedAccessoryCutoutFrameInScreen");
  objc_msgSend(v2, "_setAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v3);
  v4 = *(void **)(a1 + 40);
  v5 = objc_msgSend(v7, "inCallPresentationMode");
  objc_msgSend(*(id *)(a1 + 48), "SBSUI_inCallAnalyticsSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updatePresentationMode:analyticsSource:", v5, v6);

}

uint64_t __154__SBSUIInCallWindowSceneSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFrameChanged");
}

- (id)_inCallSceneSettingsDiffInspector
{
  SBSUIInCallSceneSettingsDiffInspector *inCallSceneSettingsDiffInspector;
  SBSUIInCallSceneSettingsDiffInspector *v4;
  SBSUIInCallSceneSettingsDiffInspector *v5;

  inCallSceneSettingsDiffInspector = self->_inCallSceneSettingsDiffInspector;
  if (!inCallSceneSettingsDiffInspector)
  {
    v4 = objc_alloc_init(SBSUIInCallSceneSettingsDiffInspector);
    v5 = self->_inCallSceneSettingsDiffInspector;
    self->_inCallSceneSettingsDiffInspector = v4;

    -[SBSUIInCallSceneSettingsDiffInspector observeInCallPresentationModeWithBlock:](self->_inCallSceneSettingsDiffInspector, "observeInCallPresentationModeWithBlock:", &__block_literal_global_27);
    -[FBSSceneSettingsDiffInspector observeFrameWithBlock:](self->_inCallSceneSettingsDiffInspector, "observeFrameWithBlock:", &__block_literal_global_9);
    -[SBSUIInCallSceneSettingsDiffInspector observeAttachedToWindowedAccessoryWithBlock:](self->_inCallSceneSettingsDiffInspector, "observeAttachedToWindowedAccessoryWithBlock:", &__block_literal_global_10);
    inCallSceneSettingsDiffInspector = self->_inCallSceneSettingsDiffInspector;
  }
  return inCallSceneSettingsDiffInspector;
}

void __77__SBSUIInCallWindowSceneSettingsDiffAction__inCallSceneSettingsDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
}

void __77__SBSUIInCallWindowSceneSettingsDiffAction__inCallSceneSettingsDiffInspector__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 1) = 1;
}

void __77__SBSUIInCallWindowSceneSettingsDiffAction__inCallSceneSettingsDiffInspector__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 2) = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inCallSceneSettingsDiffInspector, 0);
}

@end
