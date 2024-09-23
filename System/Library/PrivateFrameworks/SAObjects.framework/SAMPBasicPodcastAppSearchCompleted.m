@implementation SAMPBasicPodcastAppSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("BasicPodcastAppSearchCompleted");
}

+ (id)basicPodcastAppSearchCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)podcastCollections
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("podcastCollections"), v3);
}

- (void)setPodcastCollections:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("podcastCollections"), (uint64_t)a3);
}

- (NSArray)podcastStations
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("podcastStations"), v3);
}

- (void)setPodcastStations:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("podcastStations"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
