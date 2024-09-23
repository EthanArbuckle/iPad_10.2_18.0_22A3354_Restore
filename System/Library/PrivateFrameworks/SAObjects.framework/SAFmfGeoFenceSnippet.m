@implementation SAFmfGeoFenceSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("GeoFenceSnippet");
}

+ (id)geoFenceSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAFmfGeoFence)aceFmfGeoFence
{
  return (SAFmfGeoFence *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("aceFmfGeoFence"));
}

- (void)setAceFmfGeoFence:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("aceFmfGeoFence"), a3);
}

- (NSNumber)enable
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enable"));
}

- (void)setEnable:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enable"), a3);
}

- (NSString)fenceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fenceType"));
}

- (void)setFenceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fenceType"), a3);
}

- (NSNumber)oneTimeOnly
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("oneTimeOnly"));
}

- (void)setOneTimeOnly:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("oneTimeOnly"), a3);
}

- (NSURL)searchContext
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("searchContext"));
}

- (void)setSearchContext:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("searchContext"), a3);
}

@end
