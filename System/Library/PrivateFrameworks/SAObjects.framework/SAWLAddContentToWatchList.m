@implementation SAWLAddContentToWatchList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.watchlist");
}

- (id)encodedClassName
{
  return CFSTR("AddContentToWatchList");
}

+ (id)addContentToWatchList
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

- (BOOL)requiresResponse
{
  return 0;
}

@end
