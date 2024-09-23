@implementation SASettingAudioRoute

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("AudioRoute");
}

+ (id)audioRoute
{
  return objc_alloc_init((Class)a1);
}

- (NSString)audioRouteType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioRouteType"));
}

- (void)setAudioRouteType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioRouteType"), a3);
}

@end
