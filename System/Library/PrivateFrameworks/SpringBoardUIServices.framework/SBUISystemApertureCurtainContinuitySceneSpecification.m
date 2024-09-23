@implementation SBUISystemApertureCurtainContinuitySceneSpecification

+ (BOOL)isSupported
{
  BOOL v2;
  uint64_t v3;

  v2 = 1;
  v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2796 && v3 != 2868)
      return 0;
  }
  else if (v3 != 2556 && v3 != 2622)
  {
    return 0;
  }
  return v2;
}

- (id)defaultExtensions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SBUISystemApertureCurtainContinuitySceneSpecification;
  -[UIApplicationSceneSpecification defaultExtensions](&v9, sel_defaultExtensions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v5 = v4;

  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)uiSceneMinimumClass
{
  return NSClassFromString(CFSTR("SBSystemApertureContinuityCurtainWindowScene"));
}

- (id)uiSceneSessionRole
{
  return CFSTR("SBUIWindowSceneSessionRoleSystemApertureContinuityCurtain");
}

@end
