@implementation SAMPGetRoutes

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("GetRoutes");
}

+ (id)getRoutes
{
  return objc_alloc_init((Class)a1);
}

- (double)routeTimeout
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("routeTimeout"));
}

- (void)setRouteTimeout:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("routeTimeout"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
