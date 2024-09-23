@implementation NSURL(UserNotificationsUIKit)

+ (id)nc_notificationSettingsURLForSectionIdentifier:()UserNotificationsUIKit isAppClip:
{
  void *v4;
  void *v5;
  uint64_t v7;

  if (a4)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("prefs:root=NOTIFICATIONS_ID&path="), CFSTR("APP_CLIPS_ID/"), a3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("prefs:root=NOTIFICATIONS_ID&path="), a3, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
