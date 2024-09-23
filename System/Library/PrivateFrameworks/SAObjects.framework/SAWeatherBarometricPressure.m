@implementation SAWeatherBarometricPressure

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("BarometricPressure");
}

+ (id)barometricPressure
{
  return objc_alloc_init((Class)a1);
}

- (NSString)trend
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("trend"));
}

- (void)setTrend:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("trend"), a3);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

@end
