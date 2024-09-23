@implementation SAWeatherAirQualityObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("AirQualityObject");
}

+ (id)airQualityObject
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)airQualityIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("airQualityIndex"));
}

- (void)setAirQualityIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("airQualityIndex"), a3);
}

- (SAWeatherLocation)airQualityLocation
{
  return (SAWeatherLocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("airQualityLocation"));
}

- (void)setAirQualityLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("airQualityLocation"), a3);
}

- (NSString)airQualityRatingCategory
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("airQualityRatingCategory"));
}

- (void)setAirQualityRatingCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("airQualityRatingCategory"), a3);
}

- (NSString)localizedCategoryName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("localizedCategoryName"));
}

- (void)setLocalizedCategoryName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("localizedCategoryName"), a3);
}

- (NSArray)pollutants
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("pollutants"), v3);
}

- (void)setPollutants:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("pollutants"), (uint64_t)a3);
}

@end
