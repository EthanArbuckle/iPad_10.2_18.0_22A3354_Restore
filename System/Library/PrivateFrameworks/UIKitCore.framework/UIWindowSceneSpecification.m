@implementation UIWindowSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

- (id)coreSceneComponentClassDictionary
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWindowSceneSpecification;
  -[FBSSceneSpecification coreSceneComponentClassDictionary](&v5, sel_coreSceneComponentClassDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), _UIFocusSystemSceneComponentKey);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), 0x1E1735560);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), 0x1E1735540);
  return v3;
}

@end
