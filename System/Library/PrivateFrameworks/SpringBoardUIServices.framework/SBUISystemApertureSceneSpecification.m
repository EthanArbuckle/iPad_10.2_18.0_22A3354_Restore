@implementation SBUISystemApertureSceneSpecification

- (BOOL)isInternal
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 1;
}

- (BOOL)allowsConfigurationByAppDelegate
{
  return 0;
}

- (id)baseSceneComponentClassDictionary
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUISystemApertureSceneSpecification;
  -[UIApplicationSceneSpecification baseSceneComponentClassDictionary](&v7, sel_baseSceneComponentClassDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (id)objc_msgSend(v2, "mutableCopy");
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  objc_msgSend(v4, "setObject:forKey:", objc_opt_class(), CFSTR("SBUISystemApertureElementSourceKey"));

  return v5;
}

- (id)uiSceneSessionRole
{
  return CFSTR("SBUISystemApertureSceneSessionRole");
}

@end
