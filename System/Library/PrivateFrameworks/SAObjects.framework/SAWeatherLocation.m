@implementation SAWeatherLocation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("Location");
}

+ (id)location
{
  return objc_alloc_init((Class)a1);
}

- (NSString)locationId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("locationId"));
}

- (void)setLocationId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("locationId"), a3);
}

@end
