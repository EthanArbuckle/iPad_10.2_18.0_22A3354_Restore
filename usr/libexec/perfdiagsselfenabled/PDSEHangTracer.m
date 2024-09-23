@implementation PDSEHangTracer

+ (id)prefixForDefaults
{
  return CFSTR("PDSEHangTracer");
}

+ (BOOL)wantsEnablement
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v4 = objc_msgSend(v3, "pdseHTPeriodDays");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v6 = sub_10000E858(v5);
  LOBYTE(v4) = sub_10000E5B4(v4, 2, v6);

  return v4;
}

+ (BOOL)willEnableDiagnostics
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v9;
  void *v10;

  v3 = sub_10000DFC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PDSE: Enable HangTracer: set necessary settings with HT's Self-Enablement prefix = %@", (uint8_t *)&v9, 0xCu);

  }
  v6 = sub_10000D0E0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HTSelfEnable.DisableToEnable", " enableTelemetry=YES ", (uint8_t *)&v9, 2u);
  }
  objc_msgSend(a1, "writeEnablementSettings");

  return 1;
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
  void *v15;
  unsigned int v16;
  void *v17;
  const __CFString *v18;
  id v19;
  NSObject *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v4 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerEnabled"), (uint64_t)v3);
  CFPreferencesSetValue(v4, kCFBooleanTrue, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v5 = sub_10000DFC0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000F518();

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v8 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerReportPeriod"), (uint64_t)v7);
  CFPreferencesSetValue(v8, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 3600.0), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v9 = sub_10000DFC0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10000F630();

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v12 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerDailyThirdPartyLogLimit"), (uint64_t)v11);
  CFPreferencesSetValue(v12, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v13 = sub_10000DFC0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10000F5A4();

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v16 = objc_msgSend(v15, "pdseAllowEnableTailspin");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
    v18 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerEnableTailspin"), (uint64_t)v17);
    CFPreferencesSetValue(v18, kCFBooleanTrue, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

    v19 = sub_10000DFC0();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_10000F518();

  }
  CFPreferencesSynchronize(CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
}

+ (BOOL)didDisableDiagnostics
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  const __CFString *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  __CFString *v23;
  id v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const __CFString *v33;

  v3 = sub_10000DFC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
    *(_DWORD *)buf = 138412290;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "HTSE: Disable HTSE: disable tailspin and delete all settings with Self-Enablement prefix = %@", buf, 0xCu);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v7 = sub_100004004(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(const __CFString **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        CFPreferencesSetValue(v13, 0, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
        v14 = sub_10000DFC0();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "HTSE: Disable HTSE: delete setting %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  CFPreferencesSynchronize(CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "prefixForDefaults"));
  v17 = sub_100004004(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = objc_msgSend(v18, "count");

  v20 = sub_10000DFC0();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "prefixForDefaults"));
      *(_DWORD *)buf = 138412290;
      v33 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "HTSE: Disable HTSE: some HTSE prefs with prefix %@ remain", buf, 0xCu);

    }
  }
  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "HTSE: Disable HTSE: All prefix'ed settings were successfully deleted", buf, 2u);
    }

    v24 = sub_10000D0E0();
    v21 = objc_claimAutoreleasedReturnValue(v24);
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HTSelfEnable.EnableToDisable", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v19 == 0;
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
    tailspin_buffer_size_set(v3, 37);
    tailspin_oncore_sampling_period_set(v3, 0);
    tailspin_full_sampling_period_set(v3, 50000000);
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
  return 216000.0;
}

@end
