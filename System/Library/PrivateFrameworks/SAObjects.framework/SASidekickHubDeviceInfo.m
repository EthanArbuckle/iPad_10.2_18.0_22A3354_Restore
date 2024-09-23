@implementation SASidekickHubDeviceInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SidekickHubDeviceInfo");
}

- (NSString)accessoryIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("accessoryIdentifier"));
}

- (void)setAccessoryIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("accessoryIdentifier"), a3);
}

- (NSString)hubDeviceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hubDeviceType"));
}

- (void)setHubDeviceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hubDeviceType"), a3);
}

- (NSString)hubUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hubUserId"));
}

- (void)setHubUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hubUserId"), a3);
}

- (BOOL)mediaPlaybackEnabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("mediaPlaybackEnabled"));
}

- (void)setMediaPlaybackEnabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("mediaPlaybackEnabled"), a3);
}

- (NSString)sidekickBrand
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sidekickBrand"));
}

- (void)setSidekickBrand:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sidekickBrand"), a3);
}

- (NSString)sidekickDeviceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sidekickDeviceType"));
}

- (void)setSidekickDeviceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sidekickDeviceType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
