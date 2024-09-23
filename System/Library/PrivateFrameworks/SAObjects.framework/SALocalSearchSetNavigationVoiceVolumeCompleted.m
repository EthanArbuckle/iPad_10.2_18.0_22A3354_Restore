@implementation SALocalSearchSetNavigationVoiceVolumeCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("SetNavigationVoiceVolumeCompleted");
}

+ (id)setNavigationVoiceVolumeCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSString)volume
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("volume"));
}

- (void)setVolume:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("volume"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
