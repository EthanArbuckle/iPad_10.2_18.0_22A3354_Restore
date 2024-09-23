@implementation SANPSkipTimeInterval

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("SkipTimeInterval");
}

+ (id)skipTimeInterval
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)adjustmentInMilliseconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("adjustmentInMilliseconds"));
}

- (void)setAdjustmentInMilliseconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("adjustmentInMilliseconds"), a3);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
