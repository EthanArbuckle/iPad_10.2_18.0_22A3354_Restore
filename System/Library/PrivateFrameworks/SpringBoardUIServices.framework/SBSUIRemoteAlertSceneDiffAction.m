@implementation SBSUIRemoteAlertSceneDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v22 = v11;
  objc_msgSend(v22, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isInvalidatedForHostInvalidation"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:", v22);
  }
  else
  {
    objc_msgSend(v14, "remoteAlertActivationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v12, "SBSUI_remoteAlertComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "remoteAlertActivationContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setActivationContext:", v18);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v15, "remoteAlertSceneDidUpdateActivationContext:", v22);
    }
    objc_msgSend(v14, "buttonActions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "remoteAlertScene:handleButtonActions:", v22, v19);
    if (objc_msgSend(v13, "containsProperty:", sel_isAttachedToWindowedAccessory)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "settings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isAttachedToWindowedAccessory");
      objc_msgSend(v20, "windowedAccessoryCutoutFrameInScreen");
      objc_msgSend(v15, "remoteAlertScene:didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v22, v21);

    }
  }

}

@end
