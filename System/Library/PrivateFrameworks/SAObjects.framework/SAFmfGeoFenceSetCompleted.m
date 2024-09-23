@implementation SAFmfGeoFenceSetCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("GeoFenceSetCompleted");
}

+ (id)geoFenceSetCompleted
{
  return objc_alloc_init((Class)a1);
}

- (SAFmfGeoFence)geoFence
{
  return (SAFmfGeoFence *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("geoFence"));
}

- (void)setGeoFence:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("geoFence"), a3);
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
