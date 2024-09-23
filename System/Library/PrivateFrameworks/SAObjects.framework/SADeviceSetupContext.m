@implementation SADeviceSetupContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.device");
}

- (id)encodedClassName
{
  return CFSTR("SetupContext");
}

+ (id)setupContext
{
  return objc_alloc_init((Class)a1);
}

- (NSString)setupSceneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("setupSceneId"));
}

- (void)setSetupSceneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("setupSceneId"), a3);
}

@end
