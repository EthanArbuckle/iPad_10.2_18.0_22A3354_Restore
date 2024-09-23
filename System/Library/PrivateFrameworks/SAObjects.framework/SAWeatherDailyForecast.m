@implementation SAWeatherDailyForecast

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("DailyForecast");
}

+ (id)dailyForecast
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)highTemperature
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("highTemperature"));
}

- (void)setHighTemperature:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("highTemperature"), a3);
}

- (NSNumber)lowTemperature
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lowTemperature"));
}

- (void)setLowTemperature:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lowTemperature"), a3);
}

@end
