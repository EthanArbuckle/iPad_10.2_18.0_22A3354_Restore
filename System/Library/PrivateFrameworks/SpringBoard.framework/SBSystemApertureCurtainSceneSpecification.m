@implementation SBSystemApertureCurtainSceneSpecification

- (id)defaultExtensions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SBSystemApertureCurtainSceneSpecification;
  -[UIApplicationSceneSpecification defaultExtensions](&v9, sel_defaultExtensions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v5 = v4;

  v10[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

- (id)uiSceneSessionRole
{
  return CFSTR("SBWindowSceneSessionRoleSystemApertureCurtain");
}

@end
