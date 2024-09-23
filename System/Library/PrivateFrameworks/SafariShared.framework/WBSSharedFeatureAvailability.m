@implementation WBSSharedFeatureAvailability

+ (BOOL)areSiriSearchSuggestionsEnabled
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D89FD8]))
    v4 = objc_msgSend(a1, "areLocalSiriSuggestionsEnabled");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)areLocalSiriSuggestionsEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "safariApplicationPlatformBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v4 = objc_msgSend(v3, "containsObject:", v2) ^ 1;

  return v4;
}

+ (NSString)safariApplicationPlatformBundleIdentifier
{
  return (NSString *)CFSTR("com.apple.mobilesafari");
}

+ (void)setLocalSiriSuggestionsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v9;

  v3 = a3;
  objc_msgSend(a1, "safariApplicationPlatformBundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v5 = v4;
  if (v4)
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
  else
    v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v6, "removeObject:", v9);
  }
  else if ((objc_msgSend(v6, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(v7, "addObject:", v9);
  }
  CFPreferencesSetAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), v7, CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);

}

@end
