@implementation UVAgentSceneSpecification

- (BOOL)previewAgentDisplaysUI
{
  return 1;
}

- (BOOL)allowsConfigurationByAppDelegate
{
  return 0;
}

- (id)uiSceneSessionRole
{
  return CFSTR("_XcodePreviewsSceneSessionRole");
}

- (id)baseSceneComponentClassDictionary
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UVAgentSceneSpecification;
  -[UIApplicationSceneSpecification baseSceneComponentClassDictionary](&v5, sel_baseSceneComponentClassDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKey:", objc_opt_class(), CFSTR("UVAgentSceneEntryPoint"));
  return v3;
}

@end
