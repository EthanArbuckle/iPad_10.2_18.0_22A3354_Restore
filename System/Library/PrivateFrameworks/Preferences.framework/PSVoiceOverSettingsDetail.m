@implementation PSVoiceOverSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=VOICEOVER_TITLE"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.accessibility"));
}

+ (void)setEnabled:(BOOL)a3
{
  _AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage();
}

+ (BOOL)isEnabled
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

@end
