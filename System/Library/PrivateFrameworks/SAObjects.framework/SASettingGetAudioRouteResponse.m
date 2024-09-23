@implementation SASettingGetAudioRouteResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("GetAudioRouteResponse");
}

+ (id)getAudioRouteResponse
{
  return objc_alloc_init((Class)a1);
}

- (SASettingAudioRoute)audioRoute
{
  return (SASettingAudioRoute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("audioRoute"));
}

- (void)setAudioRoute:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("audioRoute"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
