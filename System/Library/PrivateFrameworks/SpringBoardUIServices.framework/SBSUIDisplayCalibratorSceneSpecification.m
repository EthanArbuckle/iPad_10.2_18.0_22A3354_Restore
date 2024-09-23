@implementation SBSUIDisplayCalibratorSceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_3 != -1)
    dispatch_once(&uiSceneSessionRole_onceToken_3, &__block_literal_global_26);
  return CFSTR("SBSUIWindowSceneSessionRoleDisplayCalibrator");
}

void __62__SBSUIDisplayCalibratorSceneSpecification_uiSceneSessionRole__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEAFA0], "sharedFactory");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_opt_new();
  objc_msgSend(v1, "_registerBuilder:forRole:", v0, CFSTR("SBSUIWindowSceneSessionRoleDisplayCalibrator"));

}

@end
