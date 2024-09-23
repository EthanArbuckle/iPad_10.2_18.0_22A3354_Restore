@implementation SAMPLoadPredefinedQueue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("LoadPredefinedQueue");
}

+ (id)loadPredefinedQueue
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)dryRun
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("dryRun"));
}

- (void)setDryRun:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("dryRun"), a3);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (int)mediaItemType
{
  void *v2;
  int v3;

  -[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mediaItemType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAMPTypeForString(v2);

  return v3;
}

- (void)setMediaItemType:(int)a3
{
  id v4;

  stringForSAMPType(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mediaItemType"), v4);

}

- (NSString)requesterSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requesterSharedUserId"));
}

- (void)setRequesterSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requesterSharedUserId"), a3);
}

- (NSString)sharedUserIdFromPlayableMusicAccount
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sharedUserIdFromPlayableMusicAccount"));
}

- (void)setSharedUserIdFromPlayableMusicAccount:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sharedUserIdFromPlayableMusicAccount"), a3);
}

- (BOOL)shouldShuffle
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldShuffle"));
}

- (void)setShouldShuffle:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldShuffle"), a3);
}

- (NSNumber)startPlaying
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startPlaying"));
}

- (void)setStartPlaying:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startPlaying"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
