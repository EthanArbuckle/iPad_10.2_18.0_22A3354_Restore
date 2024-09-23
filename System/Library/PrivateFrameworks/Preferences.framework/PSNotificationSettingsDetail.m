@implementation PSNotificationSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=NOTIFICATIONS_ID"));
}

@end
