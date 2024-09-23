@implementation SABaseAceObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("BaseAceObject");
}

+ (id)baseAceObject
{
  return objc_alloc_init((Class)a1);
}

- (NSString)metricsContext
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("metricsContext"));
}

- (void)setMetricsContext:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("metricsContext"), a3);
}

@end
