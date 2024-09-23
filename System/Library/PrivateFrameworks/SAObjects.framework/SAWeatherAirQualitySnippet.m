@implementation SAWeatherAirQualitySnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("AirQualitySnippet");
}

+ (id)airQualitySnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)aceAirQualities
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("aceAirQualities"), v3);
}

- (void)setAceAirQualities:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("aceAirQualities"), (uint64_t)a3);
}

- (SAUIAppPunchOut)appPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appPunchOut"));
}

- (void)setAppPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appPunchOut"), a3);
}

- (SAUIImageResource)attributionImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("attributionImage"));
}

- (void)setAttributionImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("attributionImage"), a3);
}

@end
