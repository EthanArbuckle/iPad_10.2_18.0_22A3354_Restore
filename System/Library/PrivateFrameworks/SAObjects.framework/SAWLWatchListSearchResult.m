@implementation SAWLWatchListSearchResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.watchlist");
}

- (id)encodedClassName
{
  return CFSTR("WatchListSearchResult");
}

+ (id)watchListSearchResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)canonicalId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("canonicalId"));
}

- (void)setCanonicalId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("canonicalId"), a3);
}

- (NSString)contentType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentType"));
}

- (void)setContentType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentType"), a3);
}

- (SAUIImageResource)evodFeaturingImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("evodFeaturingImage"));
}

- (void)setEvodFeaturingImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("evodFeaturingImage"), a3);
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("image"));
}

- (void)setImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("image"), a3);
}

- (BOOL)isEvod
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isEvod"));
}

- (void)setIsEvod:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isEvod"), a3);
}

- (NSString)network
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("network"));
}

- (void)setNetwork:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("network"), a3);
}

- (NSDate)releaseDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("releaseDate"));
}

- (void)setReleaseDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("releaseDate"), a3);
}

- (NSString)shelfType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("shelfType"));
}

- (void)setShelfType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("shelfType"), a3);
}

- (NSString)studio
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("studio"));
}

- (void)setStudio:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("studio"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
