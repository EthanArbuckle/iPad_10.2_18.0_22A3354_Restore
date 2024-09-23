@implementation PGPIPRemoteObjectSceneSpecification

- (BOOL)isInternal
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 0;
}

- (id)uiSceneSessionRole
{
  return CFSTR("PGPictureInPictureSceneSessionRole");
}

- (id)baseSceneComponentClassDictionary
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGPIPRemoteObjectSceneSpecification;
  -[UIApplicationSceneSpecification baseSceneComponentClassDictionary](&v9, sel_baseSceneComponentClassDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PGPIPProxySceneComponent"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (BOOL)affectsScreenOrientation
{
  return 0;
}

@end
