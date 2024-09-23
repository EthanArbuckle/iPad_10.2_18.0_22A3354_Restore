@implementation SBSUISystemNotesSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)objc_opt_self();
}

- (Class)settingsClass
{
  return (Class)objc_opt_self();
}

- (id)uiSceneSessionRole
{
  return CFSTR("SBSUIWindowSceneSessionRoleSystemNotes");
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

- (id)initialActionHandlers
{
  void *v2;
  SBSUISystemNotesWindowSceneBSActionsHandler *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSUISystemNotesSceneSpecification;
  -[UIApplicationSceneSpecification initialActionHandlers](&v6, sel_initialActionHandlers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(SBSUISystemNotesWindowSceneBSActionsHandler);
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
