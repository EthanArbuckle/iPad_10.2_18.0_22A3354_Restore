@implementation SAWeatherLocationSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("LocationSearch");
}

+ (id)locationSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("identifier"), a3);
}

- (NSString)locationId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("locationId"));
}

- (void)setLocationId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("locationId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
