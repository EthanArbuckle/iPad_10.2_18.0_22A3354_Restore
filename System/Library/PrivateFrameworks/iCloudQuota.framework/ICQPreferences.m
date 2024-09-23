@implementation ICQPreferences

+ (BOOL)shouldEnableUnifiedMessaging
{
  return CFPreferencesGetAppBooleanValue(CFSTR("ICQEnableUnifiedMessaging"), CFSTR("com.apple.cloud.quota"), 0) != 0;
}

+ (void)setShouldEnableUnifiedMessaging:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("ICQEnableUnifiedMessaging"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.cloud.quota"));
}

@end
