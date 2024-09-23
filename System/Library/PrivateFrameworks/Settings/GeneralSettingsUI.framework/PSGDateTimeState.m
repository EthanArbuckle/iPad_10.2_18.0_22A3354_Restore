@implementation PSGDateTimeState

+ (BOOL)localeForces24HourTime
{
  const __CFString *v2;
  const __CFString *v3;
  CFLocaleRef v4;
  char v5;

  v2 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("AppleLocale"), (CFStringRef)*MEMORY[0x24BDBD568]);
  if (v2)
  {
    v3 = v2;
    v4 = CFLocaleCreate(0, v2);
    CFRelease(v3);
    if (v4)
    {
LABEL_3:
      v5 = PSLocaleUses24HourClock();
      CFRelease(v4);
      return v5;
    }
  }
  else
  {
    v4 = CFLocaleCopyCurrent();
    if (v4)
      goto LABEL_3;
  }
  return 0;
}

+ (BOOL)is24HourTime
{
  int v2;
  const __CFString *v3;

  v2 = objc_msgSend(a1, "localeForces24HourTime");
  v3 = (const __CFString *)*MEMORY[0x24BDBD568];
  if (v2)
    return CFPreferencesGetAppBooleanValue(CFSTR("AppleICUForce12HourTime"), v3, 0) == 0;
  else
    return CFPreferencesGetAppBooleanValue(CFSTR("AppleICUForce24HourTime"), v3, 0) != 0;
}

+ (void)set24HourTime:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const __CFString *v10;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = a3;
  v4 = objc_msgSend(a1, "localeForces24HourTime");
  if (v3)
    v5 = (const void *)*MEMORY[0x24BDBD270];
  else
    v5 = (const void *)*MEMORY[0x24BDBD268];
  if (v3)
    v6 = 0;
  else
    v6 = (const void *)*MEMORY[0x24BDBD270];
  if (v3)
    v7 = (const void *)*MEMORY[0x24BDBD270];
  else
    v7 = 0;
  CFPreferencesSetAppValue(CFSTR("StatusBarHidesAMPM"), v5, CFSTR("com.apple.UIKit"));
  if (v4)
    v8 = v6;
  else
    v8 = 0;
  if (v4)
    v9 = 0;
  else
    v9 = v7;
  v10 = (const __CFString *)*MEMORY[0x24BDBD568];
  CFPreferencesSetAppValue(CFSTR("AppleICUForce12HourTime"), v8, (CFStringRef)*MEMORY[0x24BDBD568]);
  CFPreferencesSetAppValue(CFSTR("AppleICUForce24HourTime"), v9, v10);
  CFPreferencesAppSynchronize(v10);
  CFPreferencesAppSynchronize(CFSTR("com.apple.UIKit"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleTimePreferencesChangedNotification"), 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SignificantTimeChangeNotification"), 0, 0, 1u);
}

@end
