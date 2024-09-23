@implementation SAWeatherTVObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("TVObject");
}

+ (id)tVObject
{
  return objc_alloc_init((Class)a1);
}

- (NSString)view
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("view"));
}

- (void)setView:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("view"), a3);
}

@end
