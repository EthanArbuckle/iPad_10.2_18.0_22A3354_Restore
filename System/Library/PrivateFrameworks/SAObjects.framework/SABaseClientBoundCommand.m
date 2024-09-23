@implementation SABaseClientBoundCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("BaseClientBoundCommand");
}

+ (id)baseClientBoundCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appId"));
}

- (void)setAppId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appId"), a3);
}

- (NSArray)callbacks
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("callbacks"), v3);
}

- (void)setCallbacks:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("callbacks"), (uint64_t)a3);
}

- (NSString)metricsContext
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("metricsContext"));
}

- (void)setMetricsContext:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("metricsContext"), a3);
}

- (NSNumber)usefulnessScore
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("usefulnessScore"));
}

- (void)setUsefulnessScore:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("usefulnessScore"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
