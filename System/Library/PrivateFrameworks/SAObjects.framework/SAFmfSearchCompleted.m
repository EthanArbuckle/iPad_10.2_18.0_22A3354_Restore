@implementation SAFmfSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("SearchCompleted");
}

+ (id)searchCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)atRequestedLocation
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("atRequestedLocation"));
}

- (void)setAtRequestedLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("atRequestedLocation"), a3);
}

- (NSArray)fmfLocations
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("fmfLocations"), v3);
}

- (void)setFmfLocations:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("fmfLocations"), (uint64_t)a3);
}

- (NSURL)searchContext
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("searchContext"));
}

- (void)setSearchContext:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("searchContext"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
