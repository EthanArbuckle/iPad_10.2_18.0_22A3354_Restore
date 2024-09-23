@implementation SFDefaults

+ (unint64_t)siriNotificationsPrompted
{
  return CFPrefs_GetInt64();
}

+ (void)setSiriNotificationsPrompted:(unint64_t)a3
{
  CFPrefs_SetInt64();
  CFPreferencesAppSynchronize(CFSTR("com.apple.Sharing"));
}

+ (BOOL)hasSeenAnnounceNotifications
{
  return CFPrefs_GetInt64() != 0;
}

+ (void)setHasSeenAnnounceNotifications:(BOOL)a3
{
  CFPrefs_SetValue();
  CFPreferencesAppSynchronize(CFSTR("com.apple.Sharing"));
}

@end
