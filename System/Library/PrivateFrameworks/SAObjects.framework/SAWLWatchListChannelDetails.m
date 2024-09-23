@implementation SAWLWatchListChannelDetails

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.watchlist");
}

- (id)encodedClassName
{
  return CFSTR("WatchListChannelDetails");
}

+ (id)watchListChannelDetails
{
  return objc_alloc_init((Class)a1);
}

- (NSData)appIconDynamicImage
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appIconDynamicImage"));
}

- (void)setAppIconDynamicImage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appIconDynamicImage"), a3);
}

- (NSString)appName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appName"));
}

- (void)setAppName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appName"), a3);
}

- (NSURL)appStoreURL
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("appStoreURL"));
}

- (void)setAppStoreURL:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("appStoreURL"), a3);
}

@end
