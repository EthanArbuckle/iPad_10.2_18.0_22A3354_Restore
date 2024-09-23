@implementation SBAmbientPresentationTestRecipe

- (id)title
{
  return CFSTR("Domino Presentation");
}

- (void)windowSceneDidUpdate:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void)handleVolumeIncrease
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "ambientPresentationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_updateAmbientTriggerState:analogousTriggerEvents:withReason:", objc_msgSend(v3, "isPresented") ^ 1, 0, CFSTR("SBAmbientPresentationReasonTestRecipe"));
}

- (void)handleVolumeDecrease
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "ambientPresentationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_setAmbientDisplayStyle:forReason:", objc_msgSend(v3, "ambientDisplayStyle") == 0, CFSTR("Test Recipe"));
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
