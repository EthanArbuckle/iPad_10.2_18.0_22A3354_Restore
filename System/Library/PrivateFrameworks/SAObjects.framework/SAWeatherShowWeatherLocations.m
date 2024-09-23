@implementation SAWeatherShowWeatherLocations

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("ShowWeatherLocations");
}

+ (id)showWeatherLocations
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
