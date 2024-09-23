@implementation SBStatusBarForcedHiddenTestRecipe

- (id)title
{
  return CFSTR("Force StatusBar Hidden");
}

- (void)handleVolumeIncrease
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBStatusBarForcedHiddenTestRecipe _toggleWithAnimationSettings:](self, "_toggleWithAnimationSettings:", v3);

}

- (void)handleVolumeDecrease
{
  -[SBStatusBarForcedHiddenTestRecipe _toggleWithAnimationSettings:](self, "_toggleWithAnimationSettings:", 0);
}

- (void)_toggleWithAnimationSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;

  _toggleWithAnimationSettings__enabled ^= 1u;
  v3 = a3;
  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutStatePrimaryElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workspaceEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationSceneEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneHandle");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = _toggleWithAnimationSettings__enabled;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStatusBarForceHidden:forReason:animationSettings:", v8, v10, v3);

}

@end
