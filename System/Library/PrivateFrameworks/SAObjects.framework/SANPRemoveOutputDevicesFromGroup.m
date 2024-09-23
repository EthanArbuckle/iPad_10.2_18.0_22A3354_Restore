@implementation SANPRemoveOutputDevicesFromGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("RemoveOutputDevicesFromGroup");
}

+ (id)removeOutputDevicesFromGroup
{
  return objc_alloc_init((Class)a1);
}

- (NSString)groupID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupID"));
}

- (void)setGroupID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupID"), a3);
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
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
