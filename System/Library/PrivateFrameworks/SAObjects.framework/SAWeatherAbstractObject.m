@implementation SAWeatherAbstractObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("AbstractObject");
}

+ (id)abstractObject
{
  return objc_alloc_init((Class)a1);
}

- (SAWeatherAirQualityObject)airQuality
{
  return (SAWeatherAirQualityObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("airQuality"));
}

- (void)setAirQuality:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("airQuality"), a3);
}

- (SAWeatherCurrentConditions)currentConditions
{
  return (SAWeatherCurrentConditions *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("currentConditions"));
}

- (void)setCurrentConditions:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("currentConditions"), a3);
}

- (NSArray)dailyForecasts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("dailyForecasts"), v3);
}

- (void)setDailyForecasts:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("dailyForecasts"), (uint64_t)a3);
}

- (NSString)extendedForecastUrl
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("extendedForecastUrl"));
}

- (void)setExtendedForecastUrl:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("extendedForecastUrl"), a3);
}

- (NSArray)hourlyForecasts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("hourlyForecasts"), v3);
}

- (void)setHourlyForecasts:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("hourlyForecasts"), (uint64_t)a3);
}

- (SAWeatherUnits)units
{
  return (SAWeatherUnits *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("units"));
}

- (void)setUnits:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("units"), a3);
}

- (SAWeatherLocation)weatherLocation
{
  return (SAWeatherLocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("weatherLocation"));
}

- (void)setWeatherLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("weatherLocation"), a3);
}

- (NSString)weatherRequest
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("weatherRequest"));
}

- (void)setWeatherRequest:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("weatherRequest"), a3);
}

@end
