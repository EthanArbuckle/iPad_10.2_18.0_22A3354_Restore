@implementation UIScene(SBDisplaySceneControllerComponentAccess)

- (uint64_t)sb_displaySceneControllerComponent
{
  return objc_msgSend(a1, "_sceneComponentForKey:", CFSTR("SBDisplaySceneControllerComponentKey"));
}

@end
