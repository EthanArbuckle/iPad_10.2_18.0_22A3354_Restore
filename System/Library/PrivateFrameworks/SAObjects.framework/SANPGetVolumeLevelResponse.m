@implementation SANPGetVolumeLevelResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("GetVolumeLevelResponse");
}

+ (id)getVolumeLevelResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)volumeValue
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("volumeValue"));
}

- (void)setVolumeValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("volumeValue"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
