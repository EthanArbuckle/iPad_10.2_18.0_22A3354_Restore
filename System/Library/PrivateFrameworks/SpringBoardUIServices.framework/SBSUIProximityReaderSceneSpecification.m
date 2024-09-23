@implementation SBSUIProximityReaderSceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_2 != -1)
    dispatch_once(&uiSceneSessionRole_onceToken_2, &__block_literal_global_19);
  return CFSTR("SBSUIWindowSceneSessionRoleProximityReader");
}

void __60__SBSUIProximityReaderSceneSpecification_uiSceneSessionRole__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEAFA0], "sharedFactory");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_opt_new();
  objc_msgSend(v1, "_registerBuilder:forRole:", v0, CFSTR("SBSUIWindowSceneSessionRoleProximityReader"));

}

- (id)defaultExtensions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
