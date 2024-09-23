@implementation SBSUIAXUIServerActiveWindowSceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken != -1)
    dispatch_once(&uiSceneSessionRole_onceToken, &__block_literal_global_1);
  return CFSTR("SBSUIWindowSceneSessionRoleAXUIServerActiveWindowScene");
}

void __67__SBSUIAXUIServerActiveWindowSceneSpecification_uiSceneSessionRole__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEAFA0], "sharedFactory");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_opt_new();
  objc_msgSend(v1, "_registerBuilder:forRole:", v0, CFSTR("SBSUIWindowSceneSessionRoleAXUIServerActiveWindowScene"));

}

@end
