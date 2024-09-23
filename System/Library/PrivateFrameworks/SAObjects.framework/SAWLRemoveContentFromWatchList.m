@implementation SAWLRemoveContentFromWatchList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.watchlist");
}

- (id)encodedClassName
{
  return CFSTR("RemoveContentFromWatchList");
}

+ (id)removeContentFromWatchList
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
