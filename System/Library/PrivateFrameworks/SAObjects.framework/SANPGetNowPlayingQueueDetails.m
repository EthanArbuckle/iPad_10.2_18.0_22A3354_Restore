@implementation SANPGetNowPlayingQueueDetails

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("GetNowPlayingQueueDetails");
}

+ (id)getNowPlayingQueueDetails
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

- (int64_t)nextItemCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("nextItemCount"));
}

- (void)setNextItemCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("nextItemCount"), a3);
}

- (NSNumber)preemptiveNowPlayingQueueDetailsTimeOut
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("preemptiveNowPlayingQueueDetailsTimeOut"));
}

- (void)setPreemptiveNowPlayingQueueDetailsTimeOut:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("preemptiveNowPlayingQueueDetailsTimeOut"), a3);
}

- (int64_t)previousItemCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("previousItemCount"));
}

- (void)setPreviousItemCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("previousItemCount"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
