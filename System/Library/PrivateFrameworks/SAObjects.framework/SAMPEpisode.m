@implementation SAMPEpisode

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("Episode");
}

+ (id)episode
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)episodeNumber
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("episodeNumber"));
}

- (void)setEpisodeNumber:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("episodeNumber"), a3);
}

- (int64_t)seasonNumber
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("seasonNumber"));
}

- (void)setSeasonNumber:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("seasonNumber"), a3);
}

- (int64_t)showEpisodesCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("showEpisodesCount"));
}

- (void)setShowEpisodesCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("showEpisodesCount"), a3);
}

- (NSString)showName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("showName"));
}

- (void)setShowName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("showName"), a3);
}

@end
