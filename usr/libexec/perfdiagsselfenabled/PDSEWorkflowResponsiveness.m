@implementation PDSEWorkflowResponsiveness

+ (id)prefixForDefaults
{
  return CFSTR("PDSEWorkflowResponsiveness");
}

+ (BOOL)wantsEnablement
{
  void *v2;
  unsigned int v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = objc_msgSend(v2, "pdseWorkflowResponsivenessPeriodDays");
  v4 = sub_10000E858(CFSTR("PDSEWorkflowResponsiveness"));
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
    v9 = CFSTR("PDSEWorkflowResponsiveness");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HTWRE: Enable HTWRE: enable tailspin and set necessary settings with WorkflowResponsiveness-Enablement prefix = %@", (uint8_t *)&v8, 0xCu);
  }

  v4 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerEnableWorkflowResponsiveness"), (uint64_t)CFSTR("PDSEWorkflowResponsiveness"));
  CFPreferencesSetValue(v4, kCFBooleanTrue, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  v5 = sub_10000DFC0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000F750((uint64_t)CFSTR("HangTracerEnableWorkflowResponsiveness"), (uint64_t)CFSTR("PDSEWorkflowResponsiveness"), v6);

  return 1;
}

+ (BOOL)didDisableDiagnostics
{
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  const __CFString *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const __CFString *v29;

  v2 = sub_10000DFC0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = CFSTR("PDSEWorkflowResponsiveness");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HTWRE: Disable HTWRE: disable tailspin and delete all settings with WorkflowResponsiveness-Enablement prefix = %@", buf, 0xCu);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = sub_100004004(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)CFSTR("PDSEWorkflowResponsiveness"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(const __CFString **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        CFPreferencesSetValue(v10, 0, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
        v11 = sub_10000DFC0();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "HTWRE: Disable HTWRE: delete setting %@", buf, 0xCu);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  CFPreferencesSynchronize(CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  v13 = sub_100004004(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)CFSTR("PDSEWorkflowResponsiveness"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_msgSend(v14, "count");

  v16 = sub_10000DFC0();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      v29 = CFSTR("PDSEWorkflowResponsiveness");
      v19 = "HTWRE: Disable HTWRE: some HTWRE prefs with prefix %@ remain";
      v20 = v17;
      v21 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    }
  }
  else if (v18)
  {
    *(_WORD *)buf = 0;
    v19 = "HTWRE: Disable HTWRE: All prefix'ed settings were successfully deleted";
    v20 = v17;
    v21 = 2;
    goto LABEL_17;
  }

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
