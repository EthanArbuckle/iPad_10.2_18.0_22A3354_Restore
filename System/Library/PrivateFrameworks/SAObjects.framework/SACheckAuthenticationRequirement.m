@implementation SACheckAuthenticationRequirement

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CheckAuthenticationRequirement");
}

+ (id)checkAuthenticationRequirement
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)restrictionsOnCompanion
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("restrictionsOnCompanion"));
}

- (void)setRestrictionsOnCompanion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("restrictionsOnCompanion"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
