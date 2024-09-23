@implementation SAMPLoadQP

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("LoadQP");
}

+ (id)loadQP
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

- (NSNumber)startPlaying
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startPlaying"));
}

- (void)setStartPlaying:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startPlaying"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
