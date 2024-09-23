@implementation SAWeatherUnits

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("Units");
}

+ (id)units
{
  return objc_alloc_init((Class)a1);
}

- (NSString)distanceUnits
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("distanceUnits"));
}

- (void)setDistanceUnits:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("distanceUnits"), a3);
}

- (NSString)precipitationUnits
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("precipitationUnits"));
}

- (void)setPrecipitationUnits:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("precipitationUnits"), a3);
}

- (NSString)pressureUnits
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pressureUnits"));
}

- (void)setPressureUnits:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pressureUnits"), a3);
}

- (NSString)speedUnits
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speedUnits"));
}

- (void)setSpeedUnits:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speedUnits"), a3);
}

- (NSString)temperatureUnits
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("temperatureUnits"));
}

- (void)setTemperatureUnits:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("temperatureUnits"), a3);
}

@end
