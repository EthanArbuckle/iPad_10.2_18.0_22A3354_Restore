@implementation SAMPPodcastCollection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("PodcastCollection");
}

+ (id)podcastCollection
{
  return objc_alloc_init((Class)a1);
}

- (NSString)artist
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("artist"));
}

- (void)setArtist:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("artist"), a3);
}

- (NSArray)preferredPlayOrder
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("preferredPlayOrder"), v3);
}

- (void)setPreferredPlayOrder:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("preferredPlayOrder"), (uint64_t)a3);
}

- (NSString)sortArtist
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sortArtist"));
}

- (void)setSortArtist:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sortArtist"), a3);
}

- (NSNumber)subscribed
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subscribed"));
}

- (void)setSubscribed:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subscribed"), a3);
}

@end
