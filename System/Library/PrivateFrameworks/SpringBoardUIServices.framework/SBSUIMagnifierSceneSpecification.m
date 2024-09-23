@implementation SBSUIMagnifierSceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_1 != -1)
    dispatch_once(&uiSceneSessionRole_onceToken_1, &__block_literal_global_15);
  return CFSTR("SBSUIWindowSceneSessionRoleMagnifier");
}

void __54__SBSUIMagnifierSceneSpecification_uiSceneSessionRole__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEAFA0], "sharedFactory");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_opt_new();
  objc_msgSend(v1, "_registerBuilder:forRole:", v0, CFSTR("SBSUIWindowSceneSessionRoleMagnifier"));

}

@end
