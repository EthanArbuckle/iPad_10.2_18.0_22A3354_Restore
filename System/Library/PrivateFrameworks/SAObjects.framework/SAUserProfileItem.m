@implementation SAUserProfileItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("UserProfileItem");
}

- (BOOL)activeProfile
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("activeProfile"));
}

- (void)setActiveProfile:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("activeProfile"), a3);
}

- (NSString)fullName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fullName"));
}

- (void)setFullName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fullName"), a3);
}

- (NSString)profileIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("profileIdentifier"));
}

- (void)setProfileIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("profileIdentifier"), a3);
}

- (NSData)profileImage
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("profileImage"));
}

- (void)setProfileImage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("profileImage"), a3);
}

@end
