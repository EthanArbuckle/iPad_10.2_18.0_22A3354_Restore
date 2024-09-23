@implementation _UIScreenBasedSceneSpecification

- (Class)sceneSubstrateClass
{
  return (Class)objc_opt_self();
}

- (Class)lifecycleMonitorClass
{
  return 0;
}

- (BOOL)isUIKitManaged
{
  return 1;
}

- (BOOL)isInternal
{
  return 1;
}

- (id)coreSceneComponentClassDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIScreenBasedSceneSpecification;
    -[UIApplicationSceneSpecification coreSceneComponentClassDictionary](&v7, sel_coreSceneComponentClassDictionary);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("_UIHomeAffordanceSceneNotifierComponentKey"));
    v5 = (void *)objc_msgSend(v4, "copy");

    return v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIScreenBasedSceneSpecification;
    -[UIApplicationSceneSpecification coreSceneComponentClassDictionary](&v8, sel_coreSceneComponentClassDictionary);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)uiSceneSessionRole
{
  return CFSTR("_UIScreenBasedSceneSession");
}

- (id)connectionHandlers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)disconnectionHandlers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

@end
