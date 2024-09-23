@implementation UIQuickLookInternalSceneSpecification

- (id)uiSceneSessionRole
{
  return CFSTR("UISceneSessionRoleQuickLook");
}

- (id)initialActionHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)UIQuickLookInternalSceneSpecification;
  -[UIApplicationSceneSpecification initialActionHandlers](&v8, sel_initialActionHandlers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isInternal
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 1;
}

@end
