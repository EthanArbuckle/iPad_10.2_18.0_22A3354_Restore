@implementation SAWLSearchPlayableContentFromWatchList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.watchlist");
}

- (id)encodedClassName
{
  return CFSTR("SearchPlayableContentFromWatchList");
}

+ (id)searchPlayableContentFromWatchList
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

- (BOOL)onlyReturnNextItem
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("onlyReturnNextItem"));
}

- (void)setOnlyReturnNextItem:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("onlyReturnNextItem"), a3);
}

- (NSString)siriLocale
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("siriLocale"));
}

- (void)setSiriLocale:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("siriLocale"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
