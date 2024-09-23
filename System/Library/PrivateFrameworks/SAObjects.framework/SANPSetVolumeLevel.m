@implementation SANPSetVolumeLevel

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("SetVolumeLevel");
}

+ (id)setVolumeLevel
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)acknowledgedExceedingVolumeLimit
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("acknowledgedExceedingVolumeLimit"));
}

- (void)setAcknowledgedExceedingVolumeLimit:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("acknowledgedExceedingVolumeLimit"), a3);
}

- (NSString)actionType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("actionType"));
}

- (void)setActionType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("actionType"), a3);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
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
