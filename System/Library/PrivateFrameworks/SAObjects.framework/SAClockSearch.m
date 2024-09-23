@implementation SAClockSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clock");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)alCityId
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("alCityId"));
}

- (void)setAlCityId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("alCityId"), a3);
}

- (NSString)countryCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("countryCode"));
}

- (void)setCountryCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("countryCode"), a3);
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("identifier"), a3);
}

- (NSString)unlocalizedCityName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("unlocalizedCityName"));
}

- (void)setUnlocalizedCityName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("unlocalizedCityName"), a3);
}

- (NSString)unlocalizedCountryName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("unlocalizedCountryName"));
}

- (void)setUnlocalizedCountryName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("unlocalizedCountryName"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
