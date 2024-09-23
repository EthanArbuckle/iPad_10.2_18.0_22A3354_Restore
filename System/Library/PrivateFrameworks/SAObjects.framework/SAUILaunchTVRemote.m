@implementation SAUILaunchTVRemote

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("LaunchTVRemote");
}

+ (id)launchTVRemote
{
  return objc_alloc_init((Class)a1);
}

- (NSString)hashedRouteId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteId"));
}

- (void)setHashedRouteId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
