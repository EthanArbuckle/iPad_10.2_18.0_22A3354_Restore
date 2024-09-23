@implementation SANPMoveOutputGroupToDevicesResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("MoveOutputGroupToDevicesResponse");
}

+ (id)moveOutputGroupToDevicesResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSString)routeResponse
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("routeResponse"));
}

- (void)setRouteResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("routeResponse"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
