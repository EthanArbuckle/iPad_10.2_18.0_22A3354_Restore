@implementation SAWeatherWindSpeed

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("WindSpeed");
}

+ (id)windSpeed
{
  return objc_alloc_init((Class)a1);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

- (NSString)windDirection
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("windDirection"));
}

- (void)setWindDirection:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("windDirection"), a3);
}

- (NSNumber)windDirectionDegree
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("windDirectionDegree"));
}

- (void)setWindDirectionDegree:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("windDirectionDegree"), a3);
}

@end
