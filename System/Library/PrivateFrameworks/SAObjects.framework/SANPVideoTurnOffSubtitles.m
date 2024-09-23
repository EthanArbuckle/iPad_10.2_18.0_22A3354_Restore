@implementation SANPVideoTurnOffSubtitles

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying.video");
}

- (id)encodedClassName
{
  return CFSTR("TurnOffSubtitles");
}

+ (id)turnOffSubtitles
{
  return objc_alloc_init((Class)a1);
}

- (NSString)languageOptionChangeUserSetting
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageOptionChangeUserSetting"));
}

- (void)setLanguageOptionChangeUserSetting:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageOptionChangeUserSetting"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
