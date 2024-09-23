@implementation SAMPPlayPodcasts

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("PlayPodcasts");
}

+ (id)playPodcasts
{
  return objc_alloc_init((Class)a1);
}

- (NSString)episodePlaybackOrder
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("episodePlaybackOrder"));
}

- (void)setEpisodePlaybackOrder:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("episodePlaybackOrder"), a3);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (NSString)requesterSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requesterSharedUserId"));
}

- (void)setRequesterSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requesterSharedUserId"), a3);
}

- (NSString)sharedUserIdFromPlayableITunesAccount
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sharedUserIdFromPlayableITunesAccount"));
}

- (void)setSharedUserIdFromPlayableITunesAccount:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sharedUserIdFromPlayableITunesAccount"), a3);
}

- (BOOL)startPlaying
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("startPlaying"));
}

- (void)setStartPlaying:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("startPlaying"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
