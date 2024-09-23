@implementation SAMPRateMediaEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("RateMediaEntity");
}

+ (id)rateMediaEntity
{
  return objc_alloc_init((Class)a1);
}

- (NSString)hashedRouteUID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUID"));
}

- (void)setHashedRouteUID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUID"), a3);
}

- (int64_t)rating
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("rating"));
}

- (void)setRating:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("rating"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
