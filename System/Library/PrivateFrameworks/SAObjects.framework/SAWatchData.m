@implementation SAWatchData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("WatchData");
}

+ (id)watchData
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)configuredForLeftWrist
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("configuredForLeftWrist"));
}

- (void)setConfiguredForLeftWrist:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("configuredForLeftWrist"), a3);
}

- (NSString)interfaceOrientation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interfaceOrientation"));
}

- (void)setInterfaceOrientation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interfaceOrientation"), a3);
}

- (BOOL)victoryDevice
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("victoryDevice"));
}

- (void)setVictoryDevice:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("victoryDevice"), a3);
}

@end
