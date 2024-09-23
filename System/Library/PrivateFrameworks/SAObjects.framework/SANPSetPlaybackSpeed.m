@implementation SANPSetPlaybackSpeed

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("SetPlaybackSpeed");
}

+ (id)setPlaybackSpeed
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (double)scalingFactor
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("scalingFactor"));
}

- (void)setScalingFactor:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("scalingFactor"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
