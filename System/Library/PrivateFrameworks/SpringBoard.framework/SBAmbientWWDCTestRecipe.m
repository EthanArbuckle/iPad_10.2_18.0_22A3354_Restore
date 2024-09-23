@implementation SBAmbientWWDCTestRecipe

- (id)title
{
  return CFSTR("Domino WWDC");
}

- (void)windowSceneDidUpdate:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void)handleVolumeIncrease
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("com.apple.ambient.autoscroll-widgets"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotification:", v2);

}

- (void)handleVolumeDecrease
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "ambientPresentationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isPresented") & 1) != 0)
  {
    if (!objc_msgSend(v5, "ambientDisplayStyle"))
    {
      objc_msgSend(v5, "_setAmbientDisplayStyle:", 1);
      goto LABEL_7;
    }
    objc_msgSend(v5, "_setAmbientDisplayStyle:", 0);
    v3 = v5;
    v4 = 0;
  }
  else
  {
    v3 = v5;
    v4 = 1;
  }
  objc_msgSend(v3, "_updateAmbientTriggerState:analogousTriggerEvents:withReason:", v4, 0, CFSTR("SBAmbientPresentationReasonTestRecipe"));
LABEL_7:

}

+ (BOOL)shouldRegisterTestRecipe
{
  BOOL v2;
  void *v3;

  if (!_os_feature_enabled_impl())
    return 0;
  if (__sb__runningInSpringBoard())
    return SBFEffectiveDeviceClass() != 2;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "userInterfaceIdiom") != 1;

  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
}

@end
