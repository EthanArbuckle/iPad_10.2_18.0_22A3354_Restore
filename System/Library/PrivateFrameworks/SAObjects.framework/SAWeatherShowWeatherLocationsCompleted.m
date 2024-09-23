@implementation SAWeatherShowWeatherLocationsCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("ShowWeatherLocationsCompleted");
}

+ (id)showWeatherLocationsCompleted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
