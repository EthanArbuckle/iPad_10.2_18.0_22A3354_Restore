@implementation SAWeatherLocationSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("LocationSearchCompleted");
}

+ (id)locationSearchCompleted
{
  return objc_alloc_init((Class)a1);
}

+ (id)locationSearchCompletedWithWeatherLocations:(id)a3
{
  id v3;
  SAWeatherLocationSearchCompleted *v4;

  v3 = a3;
  v4 = -[SAWeatherLocationSearchCompleted initWithWeatherLocations:]([SAWeatherLocationSearchCompleted alloc], "initWithWeatherLocations:", v3);

  return v4;
}

- (SAWeatherLocationSearchCompleted)initWithWeatherLocations:(id)a3
{
  id v4;
  SAWeatherLocationSearchCompleted *v5;
  SAWeatherLocationSearchCompleted *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAWeatherLocationSearchCompleted setWeatherLocations:](v5, "setWeatherLocations:", v4);

  return v6;
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

- (BOOL)requiresResponse
{
  return 0;
}

@end
