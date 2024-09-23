@implementation AccessibilitySettingsChangedOnCompanion

void __AccessibilitySettingsChangedOnCompanion_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  v2 = a2;
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_notificationForPreferenceKey:", v2);
  name = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (name)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
  }

}

@end
