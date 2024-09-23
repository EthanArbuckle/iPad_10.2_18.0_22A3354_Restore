@implementation SAWeatherForecast

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("Forecast");
}

+ (id)forecast
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)chanceOfPrecipitation
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("chanceOfPrecipitation"));
}

- (void)setChanceOfPrecipitation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("chanceOfPrecipitation"), a3);
}

- (SAWeatherCondition)condition
{
  return (SAWeatherCondition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("condition"));
}

- (void)setCondition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("condition"), a3);
}

- (NSNumber)isUserRequested
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isUserRequested"));
}

- (void)setIsUserRequested:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isUserRequested"), a3);
}

- (NSNumber)timeIndex
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeIndex"));
}

- (void)setTimeIndex:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeIndex"), a3);
}

@end
