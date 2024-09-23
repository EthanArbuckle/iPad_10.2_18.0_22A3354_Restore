@implementation SAMPCreateRadioStation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("CreateRadioStation");
}

+ (id)createRadioStation
{
  return objc_alloc_init((Class)a1);
}

- (NSString)assetInfo
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("assetInfo"));
}

- (void)setAssetInfo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("assetInfo"), a3);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (NSNumber)startPlaying
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startPlaying"));
}

- (void)setStartPlaying:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startPlaying"), a3);
}

- (NSURL)stationUrl
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("stationUrl"));
}

- (void)setStationUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("stationUrl"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
