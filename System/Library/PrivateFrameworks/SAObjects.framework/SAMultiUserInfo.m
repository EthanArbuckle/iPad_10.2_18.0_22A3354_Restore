@implementation SAMultiUserInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("MultiUserInfo");
}

+ (id)multiUserInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)homeMembers
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("homeMembers"), v3);
}

- (void)setHomeMembers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("homeMembers"), (uint64_t)a3);
}

- (NSArray)multiUserPitchComposition
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("multiUserPitchComposition"));
}

- (void)setMultiUserPitchComposition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("multiUserPitchComposition"), a3);
}

- (BOOL)voiceProfilesAreInFlight
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("voiceProfilesAreInFlight"));
}

- (void)setVoiceProfilesAreInFlight:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("voiceProfilesAreInFlight"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
