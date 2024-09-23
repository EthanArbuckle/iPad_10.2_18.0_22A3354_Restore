@implementation PDSEHangTracerRateOnly

+ (id)prefixForDefaults
{
  return CFSTR("PDSEHTRateOnly");
}

+ (BOOL)wantsEnablement
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v4 = objc_msgSend(v3, "pdseHTRateOnlyPeriodDays");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v6 = sub_10000E858(v5);
  LOBYTE(v4) = sub_10000E5B4(v4, 2, v6);

  return v4;
}

+ (void)writeEnablementSettings
{
  void *v3;
  const __CFString *v4;
  id v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  NSObject *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v4 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerEnabled"), (uint64_t)v3);
  CFPreferencesSetValue(v4, kCFBooleanTrue, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v5 = sub_10000DFC0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000F0C4(a1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v8 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerReportPeriod"), (uint64_t)v7);
  CFPreferencesSetValue(v8, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 3600.0), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v9 = sub_10000DFC0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10000F030(a1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v12 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerEnableTailspin"), (uint64_t)v11);
  CFPreferencesSetValue(v12, kCFBooleanFalse, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v13 = sub_10000DFC0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10000EF9C(a1);

  CFPreferencesSynchronize(CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
}

+ (tailspin_config)desiredTailspinConfig
{
  return 0;
}

@end
