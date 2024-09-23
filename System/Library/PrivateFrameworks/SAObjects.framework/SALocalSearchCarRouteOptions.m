@implementation SALocalSearchCarRouteOptions

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("CarRouteOptions");
}

+ (id)carRouteOptions
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)avoidHighways
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("avoidHighways"));
}

- (void)setAvoidHighways:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("avoidHighways"), a3);
}

- (BOOL)avoidTolls
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("avoidTolls"));
}

- (void)setAvoidTolls:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("avoidTolls"), a3);
}

@end
