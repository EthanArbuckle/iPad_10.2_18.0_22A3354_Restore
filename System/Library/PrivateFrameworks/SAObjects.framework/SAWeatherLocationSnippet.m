@implementation SAWeatherLocationSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("LocationSnippet");
}

+ (id)locationSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)weatherLocations
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("weatherLocations"), v3);
}

- (void)setWeatherLocations:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("weatherLocations"), (uint64_t)a3);
}

@end
