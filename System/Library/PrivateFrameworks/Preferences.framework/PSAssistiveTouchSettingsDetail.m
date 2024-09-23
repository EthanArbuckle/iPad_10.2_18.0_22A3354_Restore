@implementation PSAssistiveTouchSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=TOUCH_REACHABILITY_TITLE/AIR_TOUCH_TITLE"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.accessibility"));
}

+ (void)setEnabled:(BOOL)a3
{
  _AXSAssistiveTouchSetEnabled();
}

+ (BOOL)isEnabled
{
  return _AXSAssistiveTouchEnabled() != 0;
}

@end
