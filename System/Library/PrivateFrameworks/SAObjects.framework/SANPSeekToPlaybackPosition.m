@implementation SANPSeekToPlaybackPosition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("SeekToPlaybackPosition");
}

+ (id)seekToPlaybackPosition
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

- (NSNumber)positionInMilliseconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("positionInMilliseconds"));
}

- (void)setPositionInMilliseconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("positionInMilliseconds"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
