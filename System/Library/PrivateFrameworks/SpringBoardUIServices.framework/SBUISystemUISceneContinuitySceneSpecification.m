@implementation SBUISystemUISceneContinuitySceneSpecification

- (Class)uiSceneMinimumClass
{
  return NSClassFromString(CFSTR("UIWindowScene"));
}

- (id)defaultExtensions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBUISystemUISceneContinuitySceneSpecification;
  -[UIApplicationSceneSpecification defaultExtensions](&v8, sel_defaultExtensions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v5 = v4;

  objc_msgSend(v5, "arrayByAddingObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)uiSceneSessionRole
{
  return CFSTR("SBUIWindowSceneSessionRoleSystemUISceneContinuity");
}

@end
