@implementation SAMPBasicPodcastAppSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("BasicPodcastAppSearch");
}

+ (id)basicPodcastAppSearch
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)acceptPodcastCollections
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("acceptPodcastCollections"));
}

- (void)setAcceptPodcastCollections:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("acceptPodcastCollections"), a3);
}

- (BOOL)acceptPodcastStations
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("acceptPodcastStations"));
}

- (void)setAcceptPodcastStations:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("acceptPodcastStations"), a3);
}

- (int64_t)maxResults
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("maxResults"));
}

- (void)setMaxResults:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("maxResults"), a3);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
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
