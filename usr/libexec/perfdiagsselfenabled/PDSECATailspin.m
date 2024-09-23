@implementation PDSECATailspin

+ (id)prefixForDefaults
{
  return CFSTR("PDSECATailspin");
}

+ (BOOL)wantsEnablement
{
  void *v2;
  unsigned int v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = objc_msgSend(v2, "pdseCATailspinPeriodDays");
  v4 = sub_10000E858(CFSTR("PDSECATailspin"));
  LOBYTE(v3) = sub_10000E5B4(v3, 1, v4);

  return v3;
}

+ (BOOL)willEnableDiagnostics
{
  id v2;
  NSObject *v3;
  const __CFString *v4;
  id v5;
  NSObject *v6;
  int v8;
  const __CFString *v9;

  v2 = sub_10000DFC0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = CFSTR("PDSECATailspin");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDSE: Enable HangTracer: set necessary settings with CA's Self-Enablement prefix = %@", (uint8_t *)&v8, 0xCu);
  }

  v4 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("CATailspinEnable"), (uint64_t)CFSTR("PDSECATailspin"));
  CFPreferencesSetValue(v4, kCFBooleanTrue, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  v5 = sub_10000DFC0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000E9E4((uint64_t)CFSTR("CATailspinEnable"), (uint64_t)CFSTR("PDSECATailspin"));

  return 1;
}

+ (BOOL)didDisableDiagnostics
{
  const __CFString *v2;
  id v3;
  NSObject *v4;

  v2 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("CATailspinEnable"), (uint64_t)CFSTR("PDSECATailspin"));
  CFPreferencesSetValue(v2, 0, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  v3 = sub_10000DFC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10000EA60((uint64_t)CFSTR("CATailspinEnable"), (uint64_t)CFSTR("PDSECATailspin"));

  return 1;
}

+ (tailspin_config)desiredTailspinConfig
{
  uint64_t v2;
  tailspin_config *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = tailspin_config_create_with_default_config(a1, a2);
  v3 = (tailspin_config *)v2;
  if (v2)
  {
    tailspin_enabled_set(v2, 1);
    tailspin_buffer_size_set(v3, 25);
  }
  else
  {
    v4 = sub_10000DFC0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to create tailspin config object", v7, 2u);
    }

  }
  return v3;
}

+ (double)timeoutDurationSec
{
  return 129600.0;
}

@end
