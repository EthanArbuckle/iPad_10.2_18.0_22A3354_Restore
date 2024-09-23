@implementation SANPSetShuffleMode

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("SetShuffleMode");
}

+ (id)setShuffleMode
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

- (NSString)shuffleMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("shuffleMode"));
}

- (void)setShuffleMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("shuffleMode"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
