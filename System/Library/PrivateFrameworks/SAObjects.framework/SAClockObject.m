@implementation SAClockObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clock");
}

- (id)encodedClassName
{
  return CFSTR("Object");
}

+ (id)object
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

- (NSString)cityName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("cityName"));
}

- (void)setCityName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("cityName"), a3);
}

- (NSString)countryCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("countryCode"));
}

- (void)setCountryCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("countryCode"), a3);
}

- (NSString)countryName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("countryName"));
}

- (void)setCountryName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("countryName"), a3);
}

- (NSString)timezoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timezoneId"));
}

- (void)setTimezoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timezoneId"), a3);
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

@end
