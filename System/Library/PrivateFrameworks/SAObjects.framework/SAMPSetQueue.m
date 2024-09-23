@implementation SAMPSetQueue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("SetQueue");
}

+ (id)setQueue
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

- (BOOL)dryRun
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("dryRun"));
}

- (void)setDryRun:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("dryRun"), a3);
}

- (NSArray)filters
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("filters"), v3);
}

- (void)setFilters:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("filters"), (uint64_t)a3);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (SAMPCollection)mediaItems
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("mediaItems"));
}

- (void)setMediaItems:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("mediaItems"), a3);
}

- (NSString)recommendationId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recommendationId"));
}

- (void)setRecommendationId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recommendationId"), a3);
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

- (BOOL)shouldOverrideManuallyCuratedUpNext
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldOverrideManuallyCuratedUpNext"));
}

- (void)setShouldOverrideManuallyCuratedUpNext:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldOverrideManuallyCuratedUpNext"), a3);
}

- (BOOL)shouldReloadQueue
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldReloadQueue"));
}

- (void)setShouldReloadQueue:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldReloadQueue"), a3);
}

- (BOOL)shouldShuffle
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldShuffle"));
}

- (void)setShouldShuffle:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldShuffle"), a3);
}

- (NSArray)sort
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("sort"), v3);
}

- (void)setSort:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("sort"), (uint64_t)a3);
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
