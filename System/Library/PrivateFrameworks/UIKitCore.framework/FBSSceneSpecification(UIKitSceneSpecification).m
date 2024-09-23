@implementation FBSSceneSpecification(UIKitSceneSpecification)

- (uint64_t)initialActionHandlers
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)initialSettingsDiffActions
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)finalSettingsDiffActions
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)allowsConfigurationByAppDelegate
{
  return 1;
}

- (uint64_t)finalActionHandlers
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)_transitionContextHandlers
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)coreSceneComponentClassDictionary
{
  return MEMORY[0x1E0C9AA70];
}

- (uint64_t)baseSceneComponentClassDictionary
{
  return MEMORY[0x1E0C9AA70];
}

- (__CFString)uiSceneSessionRole
{
  return CFSTR("UIWindowSceneSessionRoleApplication");
}

- (uint64_t)connectionHandlers
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)disconnectionHandlers
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)isUIKitManaged
{
  return 0;
}

- (uint64_t)lifecycleMonitorClass
{
  return 0;
}

- (uint64_t)sceneSubstrateClass
{
  return objc_opt_class();
}

- (uint64_t)uiSceneMinimumClass
{
  return objc_opt_self();
}

- (uint64_t)isInternal
{
  return 1;
}

- (uint64_t)affectsAppLifecycleIfInternal
{
  return 0;
}

- (uint64_t)affectsScreenOrientation
{
  return 1;
}

@end
