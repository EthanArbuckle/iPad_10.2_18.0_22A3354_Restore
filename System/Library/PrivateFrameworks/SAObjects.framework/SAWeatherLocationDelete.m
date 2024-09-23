@implementation SAWeatherLocationDelete

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("LocationDelete");
}

+ (id)locationDelete
{
  return objc_alloc_init((Class)a1);
}

- (SAWeatherLocation)weatherLocation
{
  return (SAWeatherLocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("weatherLocation"));
}

- (void)setWeatherLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("weatherLocation"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
