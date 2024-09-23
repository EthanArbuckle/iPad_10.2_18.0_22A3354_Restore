@implementation PDSEHangTracerThirdParty

+ (id)prefixForDefaults
{
  return CFSTR("PDSEHTThirdParty");
}

+ (BOOL)wantsEnablement
{
  unsigned int v3;
  int v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  unsigned int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  BOOL v16;
  int v18;
  unsigned int v19;
  __int16 v20;
  int v21;

  v3 = +[MXSourceUtilities anyClientsAvailable](MXSourceUtilities, "anyClientsAvailable");
  if (DiagnosticLogSubmissionEnabled())
    v4 = AppAnalyticsEnabled();
  else
    v4 = 0;
  v5 = sub_10000DFC0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000EC64(v3, v4, v6);

  v7 = sub_10000DFC0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v18 = 67109120;
      v19 = objc_msgSend(v10, "pdseHTThirdPartyPeriodDays");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDSE: PDSEHTThirdParty: log upload enabled on device, will use pdseHTThirdPartyPeriod=%i to determine wantsEnablement", (uint8_t *)&v18, 8u);

    }
    v8 = objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v11 = -[NSObject pdseHTThirdPartyPeriodDays](v8, "pdseHTThirdPartyPeriodDays");
LABEL_14:
    v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
    v15 = sub_10000E858(v14);
    v16 = sub_10000E5B4(v13, 2, v15);

    goto LABEL_18;
  }
  if (v3)
  {
    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v18 = 67109120;
      v19 = objc_msgSend(v12, "pdseHTThirdPartyNoLogUploadPeriodDays");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDSE: PDSEHTThirdParty: log upload disabled on device and MetricKit clients enabled, will use pdseHTThirdPartyNoLogUploadPeriodDays=%i to determine wantsEnablement", (uint8_t *)&v18, 8u);

    }
    v8 = objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v11 = -[NSObject pdseHTThirdPartyNoLogUploadPeriodDays](v8, "pdseHTThirdPartyNoLogUploadPeriodDays");
    goto LABEL_14;
  }
  if (v9)
  {
    v18 = 67109376;
    v19 = 0;
    v20 = 1024;
    v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDSE: PDSEHTThirdParty: not enabling HT 3rd Party mode due to (enableForMetricKit=%{BOOL}d enableForLogUpload=%{BOOL}d", (uint8_t *)&v18, 0xEu);
  }
  v16 = 0;
LABEL_18:

  return v16;
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
  const __CFString *v16;
  id v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  NSObject *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  NSObject *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  NSObject *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v4 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerEnabled"), (uint64_t)v3);
  CFPreferencesSetValue(v4, kCFBooleanTrue, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v5 = sub_10000DFC0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000EE08();

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v8 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerReportPeriod"), (uint64_t)v7);
  CFPreferencesSetValue(v8, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 3600.0), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v9 = sub_10000DFC0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10000EE94();

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v12 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerEnableTailspin"), (uint64_t)v11);
  CFPreferencesSetValue(v12, kCFBooleanTrue, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v13 = sub_10000DFC0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10000EE08();

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v16 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerFenceTrackingEnabled"), (uint64_t)v15);
  CFPreferencesSetValue(v16, kCFBooleanFalse, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v17 = sub_10000DFC0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_10000ED7C();

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v20 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerPercentFullSpinReports"), (uint64_t)v19);
  CFPreferencesSetValue(v20, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v21 = sub_10000DFC0();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    sub_10000ECF0();

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v24 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerDailyLogLimit"), (uint64_t)v23);
  CFPreferencesSetValue(v24, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v25 = sub_10000DFC0();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    sub_10000ECF0();

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v28 = (const __CFString *)sub_100003FD0((uint64_t)CFSTR("HangTracerDailyLongLogLimit"), (uint64_t)v27);
  CFPreferencesSetValue(v28, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);

  v29 = sub_10000DFC0();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    sub_10000ECF0();

  CFPreferencesSynchronize(CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
}

@end
