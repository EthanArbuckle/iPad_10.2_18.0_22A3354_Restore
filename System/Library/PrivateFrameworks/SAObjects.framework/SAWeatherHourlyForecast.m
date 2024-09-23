@implementation SAWeatherHourlyForecast

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("HourlyForecast");
}

+ (id)hourlyForecast
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)temperature
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("temperature"));
}

- (void)setTemperature:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("temperature"), a3);
}

@end
