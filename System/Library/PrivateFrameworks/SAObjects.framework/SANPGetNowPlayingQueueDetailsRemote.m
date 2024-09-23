@implementation SANPGetNowPlayingQueueDetailsRemote

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("GetNowPlayingQueueDetailsRemote");
}

+ (id)getNowPlayingQueueDetailsRemote
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

- (SANPGetNowPlayingQueueDetails)queueDetails
{
  return (SANPGetNowPlayingQueueDetails *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("queueDetails"));
}

- (void)setQueueDetails:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("queueDetails"), a3);
}

- (double)routeTimeout
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("routeTimeout"));
}

- (void)setRouteTimeout:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("routeTimeout"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
