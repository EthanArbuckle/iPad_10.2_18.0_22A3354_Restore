@implementation SAWeatherCurrentConditions

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("CurrentConditions");
}

+ (id)currentConditions
{
  return objc_alloc_init((Class)a1);
}

- (SAWeatherBarometricPressure)barometricPressure
{
  return (SAWeatherBarometricPressure *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("barometricPressure"));
}

- (void)setBarometricPressure:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("barometricPressure"), a3);
}

- (SAWeatherCondition)condition
{
  return (SAWeatherCondition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("condition"));
}

- (void)setCondition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("condition"), a3);
}

- (NSNumber)dayOfWeek
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dayOfWeek"));
}

- (void)setDayOfWeek:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dayOfWeek"), a3);
}

- (NSString)dewPoint
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dewPoint"));
}

- (void)setDewPoint:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dewPoint"), a3);
}

- (NSString)heatIndex
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("heatIndex"));
}

- (void)setHeatIndex:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("heatIndex"), a3);
}

- (NSString)moonPhase
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("moonPhase"));
}

- (void)setMoonPhase:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("moonPhase"), a3);
}

- (NSString)percentHumidity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("percentHumidity"));
}

- (void)setPercentHumidity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("percentHumidity"), a3);
}

- (NSNumber)percentOfMoonFaceVisible
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("percentOfMoonFaceVisible"));
}

- (void)setPercentOfMoonFaceVisible:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("percentOfMoonFaceVisible"), a3);
}

- (NSString)sunrise
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sunrise"));
}

- (void)setSunrise:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sunrise"), a3);
}

- (NSString)sunset
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sunset"));
}

- (void)setSunset:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sunset"), a3);
}

- (NSString)temperature
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("temperature"));
}

- (void)setTemperature:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("temperature"), a3);
}

- (NSString)timeOfObservation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeOfObservation"));
}

- (void)setTimeOfObservation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeOfObservation"), a3);
}

- (NSString)timeZone
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeZone"));
}

- (void)setTimeZone:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeZone"), a3);
}

- (NSString)totalDailyPrecipitation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("totalDailyPrecipitation"));
}

- (void)setTotalDailyPrecipitation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("totalDailyPrecipitation"), a3);
}

- (NSNumber)uvIndex
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("uvIndex"));
}

- (void)setUvIndex:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("uvIndex"), a3);
}

- (NSString)visibility
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("visibility"));
}

- (void)setVisibility:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("visibility"), a3);
}

- (NSString)windChill
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("windChill"));
}

- (void)setWindChill:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("windChill"), a3);
}

- (SAWeatherWindSpeed)windSpeed
{
  return (SAWeatherWindSpeed *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("windSpeed"));
}

- (void)setWindSpeed:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("windSpeed"), a3);
}

@end
