@implementation SACurrentDisplayRouteClientState

+ (id)deliveryDeadline
{
  return CFSTR("BEFORE_FINISH_SPEECH");
}

+ (id)persistencePolicy
{
  return CFSTR("LIFE_OF_SESSION");
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CurrentDisplayRouteClientState");
}

+ (id)currentDisplayRouteClientState
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)activeDisplayRoutes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activeDisplayRoutes"));
}

- (void)setActiveDisplayRoutes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activeDisplayRoutes"), a3);
}

@end
