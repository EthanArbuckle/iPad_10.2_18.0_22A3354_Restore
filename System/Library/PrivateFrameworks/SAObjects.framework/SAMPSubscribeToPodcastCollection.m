@implementation SAMPSubscribeToPodcastCollection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("SubscribeToPodcastCollection");
}

+ (id)subscribeToPodcastCollection
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

- (NSString)hashedRouteUID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUID"));
}

- (void)setHashedRouteUID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUID"), a3);
}

- (SAMPPodcastCollection)podcastCollection
{
  return (SAMPPodcastCollection *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("podcastCollection"));
}

- (void)setPodcastCollection:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("podcastCollection"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
