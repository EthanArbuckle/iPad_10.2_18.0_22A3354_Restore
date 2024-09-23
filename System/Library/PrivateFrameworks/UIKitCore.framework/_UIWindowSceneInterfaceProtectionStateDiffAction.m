@implementation _UIWindowSceneInterfaceProtectionStateDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v13 || objc_msgSend(v13, "containsProperty:", sel_underAppProtection))
  {
    objc_msgSend(v12, "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_interfaceProtectionSceneComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInterfaceProtectionSceneComponent setUnderAppProtection:]((uint64_t)v17, objc_msgSend(v16, "underAppProtection"));

    objc_msgSend(v19, "_interfaceProtectionSceneComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInterfaceProtectionSceneComponent _invalidateTraitOverrides]((uint64_t)v18);

  }
}

@end
