@implementation PSCommandAndControlSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=CommandAndControlTitle"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.accessibility"));
}

+ (void)setEnabled:(BOOL)a3
{
  _AXSCommandAndControlSetEnabled();
}

+ (BOOL)isEnabled
{
  return _AXSCommandAndControlEnabled() != 0;
}

@end
