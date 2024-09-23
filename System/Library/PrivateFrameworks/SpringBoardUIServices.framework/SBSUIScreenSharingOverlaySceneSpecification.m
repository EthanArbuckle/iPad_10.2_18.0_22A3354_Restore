@implementation SBSUIScreenSharingOverlaySceneSpecification

- (id)uiSceneSessionRole
{
  if (uiSceneSessionRole_onceToken_0 != -1)
    dispatch_once(&uiSceneSessionRole_onceToken_0, &__block_literal_global_2);
  return CFSTR("SBSUIWindowSceneSessionRoleScreenSharingOverlay");
}

void __65__SBSUIScreenSharingOverlaySceneSpecification_uiSceneSessionRole__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEAFA0], "sharedFactory");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_opt_new();
  objc_msgSend(v1, "_registerBuilder:forRole:", v0, CFSTR("SBSUIWindowSceneSessionRoleScreenSharingOverlay"));

}

- (id)defaultExtensions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBSUIScreenSharingOverlaySceneSpecification;
  -[UIApplicationSceneSpecification defaultExtensions](&v7, sel_defaultExtensions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v4 = objc_opt_class();
  if (v3)
  {
    objc_msgSend(v2, "arrayByAddingObject:", v4);
  }
  else
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
