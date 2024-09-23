@implementation _UISceneHostingSceneSpecification

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_class();
}

- (id)uiSceneSessionRole
{
  return CFSTR("UISceneSessionRoleSceneHosting");
}

- (id)defaultExtensions
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  v8[4] = objc_opt_class();
  v8[5] = objc_opt_class();
  v8[6] = objc_opt_class();
  v8[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_UISceneHostingSceneSpecification;
  -[UIApplicationSceneSpecification defaultExtensions](&v7, sel_defaultExtensions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)finalActionHandlers
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
  v8.super_class = (Class)_UISceneHostingSceneSpecification;
  -[UIApplicationSceneSpecification finalActionHandlers](&v8, sel_finalActionHandlers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)userActivity
{
  return 0;
}

@end
