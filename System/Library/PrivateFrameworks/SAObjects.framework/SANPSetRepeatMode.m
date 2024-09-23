@implementation SANPSetRepeatMode

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("SetRepeatMode");
}

+ (id)setRepeatMode
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (NSString)repeatMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("repeatMode"));
}

- (void)setRepeatMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("repeatMode"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
