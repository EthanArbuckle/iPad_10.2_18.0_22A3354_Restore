@implementation SAWeatherPollutant

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("Pollutant");
}

+ (id)pollutant
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)amount
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("amount"));
}

- (void)setAmount:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("amount"), a3);
}

- (NSString)localizedDescription
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("localizedDescription"));
}

- (void)setLocalizedDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("localizedDescription"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

@end
