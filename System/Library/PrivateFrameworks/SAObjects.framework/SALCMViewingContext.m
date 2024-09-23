@implementation SALCMViewingContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("ViewingContext");
}

+ (id)viewingContext
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)commercialPlaying
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("commercialPlaying"));
}

- (void)setCommercialPlaying:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("commercialPlaying"), a3);
}

- (NSNumber)durationInMilliseconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("durationInMilliseconds"));
}

- (void)setDurationInMilliseconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("durationInMilliseconds"), a3);
}

- (SALCMContent)nowPlaying
{
  return (SALCMContent *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("nowPlaying"));
}

- (void)setNowPlaying:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("nowPlaying"), a3);
}

- (NSString)nowPlayingAppId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nowPlayingAppId"));
}

- (void)setNowPlayingAppId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nowPlayingAppId"), a3);
}

- (BOOL)paused
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("paused"));
}

- (void)setPaused:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("paused"), a3);
}

- (NSNumber)playbackPositionInMilliseconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("playbackPositionInMilliseconds"));
}

- (void)setPlaybackPositionInMilliseconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("playbackPositionInMilliseconds"), a3);
}

- (NSArray)viewingHistory
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("viewingHistory"), v3);
}

- (void)setViewingHistory:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("viewingHistory"), (uint64_t)a3);
}

@end
