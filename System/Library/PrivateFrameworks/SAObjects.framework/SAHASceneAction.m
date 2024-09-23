@implementation SAHASceneAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("SceneAction");
}

+ (id)sceneAction
{
  return objc_alloc_init((Class)a1);
}

- (SAHAAction)action
{
  return (SAHAAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("action"));
}

- (void)setAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("action"), a3);
}

- (NSURL)entityId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("entityId"));
}

- (void)setEntityId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("entityId"), a3);
}

@end
