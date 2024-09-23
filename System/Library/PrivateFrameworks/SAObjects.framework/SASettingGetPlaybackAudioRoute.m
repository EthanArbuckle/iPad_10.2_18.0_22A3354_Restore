@implementation SASettingGetPlaybackAudioRoute

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("GetPlaybackAudioRoute");
}

+ (id)getPlaybackAudioRoute
{
  return objc_alloc_init((Class)a1);
}

- (NSString)audioCategory
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioCategory"));
}

- (void)setAudioCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioCategory"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
