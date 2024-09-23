@implementation SAWeatherLocationAddCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("LocationAddCompleted");
}

+ (id)locationAddCompleted
{
  return objc_alloc_init((Class)a1);
}

+ (id)locationAddCompletedWithError:(id)a3
{
  id v3;
  SAWeatherLocationAddCompleted *v4;

  v3 = a3;
  v4 = -[SAWeatherLocationAddCompleted initWithError:]([SAWeatherLocationAddCompleted alloc], "initWithError:", v3);

  return v4;
}

+ (id)locationAddCompletedWithWeatherLocationId:(id)a3
{
  id v3;
  SAWeatherLocationAddCompleted *v4;

  v3 = a3;
  v4 = -[SAWeatherLocationAddCompleted initWithWeatherLocationId:]([SAWeatherLocationAddCompleted alloc], "initWithWeatherLocationId:", v3);

  return v4;
}

- (SAWeatherLocationAddCompleted)initWithError:(id)a3
{
  id v4;
  SAWeatherLocationAddCompleted *v5;
  SAWeatherLocationAddCompleted *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAWeatherLocationAddCompleted setError:](v5, "setError:", v4);

  return v6;
}

- (SAWeatherLocationAddCompleted)initWithWeatherLocationId:(id)a3
{
  id v4;
  SAWeatherLocationAddCompleted *v5;
  SAWeatherLocationAddCompleted *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAWeatherLocationAddCompleted setWeatherLocationId:](v5, "setWeatherLocationId:", v4);

  return v6;
}

- (NSString)error
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("error"));
}

- (void)setError:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("error"), a3);
}

- (NSURL)weatherLocationId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("weatherLocationId"));
}

- (void)setWeatherLocationId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("weatherLocationId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
