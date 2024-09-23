@implementation SAUpdateRestrictions

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("UpdateRestrictions");
}

+ (id)updateRestrictions
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)restrictionsToAdd
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("restrictionsToAdd"));
}

- (void)setRestrictionsToAdd:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("restrictionsToAdd"), a3);
}

- (NSArray)restrictionsToRemove
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("restrictionsToRemove"));
}

- (void)setRestrictionsToRemove:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("restrictionsToRemove"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
