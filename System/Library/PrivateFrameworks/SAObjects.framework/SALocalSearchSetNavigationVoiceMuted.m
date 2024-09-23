@implementation SALocalSearchSetNavigationVoiceMuted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("SetNavigationVoiceMuted");
}

+ (id)setNavigationVoiceMuted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)voiceMuted
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("voiceMuted"));
}

- (void)setVoiceMuted:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("voiceMuted"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
