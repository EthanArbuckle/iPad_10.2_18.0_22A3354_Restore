@implementation SAUserActivity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("UserActivity");
}

+ (id)userActivity
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)eligibileFunctions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("eligibileFunctions"));
}

- (void)setEligibileFunctions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("eligibileFunctions"), a3);
}

- (NSString)internalGUID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("internalGUID"));
}

- (void)setInternalGUID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("internalGUID"), a3);
}

- (BOOL)isEligibleForAppPunchout
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isEligibleForAppPunchout"));
}

- (void)setIsEligibleForAppPunchout:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isEligibleForAppPunchout"), a3);
}

- (BOOL)isEligibleForDirections
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isEligibleForDirections"));
}

- (void)setIsEligibleForDirections:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isEligibleForDirections"), a3);
}

- (BOOL)isEligibleForHandoff
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isEligibleForHandoff"));
}

- (void)setIsEligibleForHandoff:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isEligibleForHandoff"), a3);
}

- (BOOL)isEligibleForPublicIndexing
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isEligibleForPublicIndexing"));
}

- (void)setIsEligibleForPublicIndexing:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isEligibleForPublicIndexing"), a3);
}

- (BOOL)isEligibleForReminders
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isEligibleForReminders"));
}

- (void)setIsEligibleForReminders:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isEligibleForReminders"), a3);
}

- (BOOL)isEligibleForSearch
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isEligibleForSearch"));
}

- (void)setIsEligibleForSearch:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isEligibleForSearch"), a3);
}

@end
