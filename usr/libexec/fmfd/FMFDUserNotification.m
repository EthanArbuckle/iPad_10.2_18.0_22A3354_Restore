@implementation FMFDUserNotification

+ (BOOL)shouldDisplayAlerts
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisplayDebugAlerts"));

  return v3;
}

+ (void)displayUserNotificationWithTitleLocKey:(id)a3 messageLocKey:(id)a4
{
  id v5;
  id v6;
  __CFDictionary *Mutable;
  NSBundle *v8;
  void *v9;
  void *v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  CFUserNotificationRef v17;
  SInt32 error;

  v5 = a4;
  v6 = a3;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v6, &stru_10009B948, 0));

  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v5, &stru_10009B948, 0));

  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10009B948, 0));

  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v10);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v13);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v16);
  error = -1;
  v17 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, Mutable);
  CFRelease(Mutable);
  CFRelease(v17);

}

+ (void)showActiveDeviceChangedAlert
{
  if (objc_msgSend(a1, "shouldDisplayAlerts"))
    _objc_msgSend(a1, "displayUserNotificationWithTitleLocKey:messageLocKey:", CFSTR("THIS_DEVICE_ACTIVE_ALERT_TITLE"), CFSTR("THIS_DEVICE_ACTIVE_ALERT_TEXT"));
}

+ (void)showRestrictedAlert
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFDUserNotification: showRestrictedAlert", (uint8_t *)v10, 2u);
  }

  if (objc_msgSend(a1, "shouldDisplayAlerts"))
  {
    v5 = objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:", CFSTR("RESTRICTED_ALERT_TITLE"), CFSTR("RESTRICTED_ALERT_TEXT"), CFSTR("SETTINGS_BUTTON"), CFSTR("OK_BUTTON_TITLE"));
    v6 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing restrictions alert, user selected: %d", (uint8_t *)v10, 8u);
    }

    if ((v5 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=General&path=RESTRICTIONS")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      objc_msgSend(v9, "openSensitiveURL:withOptions:", v8, 0);

    }
  }
}

+ (void)showMaxFollowersLimitReachedAlert
{
  _objc_msgSend(a1, "displayUserNotificationWithTitleLocKey:messageLocKey:", CFSTR("MAX_FOLLOWERS_ALERT_TITLE"), CFSTR("MAX_FOLLOWERS_ALERT_MESSAGE"));
}

+ (void)showLocationServicesSwitchOffAlert
{
  unsigned int v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _DWORD v7[2];

  v2 = objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:", CFSTR("GLOBAL_LOCATION_SERVICES_SWITCH_OFF_TITLE"), CFSTR("GLOBAL_LOCATION_SERVICES_SWITCH_OFF_MESSAGE"), CFSTR("SETTINGS_BUTTON"), CFSTR("OK_BUTTON_TITLE"));
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing global location services off alert, user selected: %d", (uint8_t *)v7, 8u);
  }

  if ((v2 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=Privacy&path=LOCATION")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v5, 0);

  }
}

+ (void)showShareMyLocationSystemServiceOffAlert
{
  unsigned int v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _DWORD v7[2];

  v2 = objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:", CFSTR("LOCATION_SHARING_SYSTEM_SERVICE_SWITCH_OFF_TITLE"), CFSTR("LOCATION_SHARING_SYSTEM_SERVICE_SWITCH_OFF_MESSAGE"), CFSTR("SETTINGS_BUTTON"), CFSTR("OK_BUTTON_TITLE"));
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing location sharing system service switch off alert, user selected: %d", (uint8_t *)v7, 8u);
  }

  if ((v2 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v5, 0);

  }
}

+ (void)showShareMyLocationiCloudSettingsOffAlert
{
  unsigned int v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _DWORD v7[2];

  v2 = objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:", CFSTR("SHARE_MY_LOCATION_ICLOUD_SETTINGS_OFF_TITLE"), CFSTR("SHARE_MY_LOCATION_ICLOUD_SETTINGS_OFF_MESSAGE"), CFSTR("SETTINGS_BUTTON"), CFSTR("OK_BUTTON_TITLE"));
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing share my location icloud settings off alert, user selected: %d", (uint8_t *)v7, 8u);
  }

  if ((v2 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=LOCATION_SHARING")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v5, 0);

  }
}

+ (void)showForbiddenRegionAlert
{
  if (objc_msgSend(a1, "shouldDisplayAlerts"))
    _objc_msgSend(a1, "displayUserNotificationWithTitleLocKey:messageLocKey:", CFSTR("FORBIDDEN_REGION_ALERT_TITLE"), CFSTR("FORBIDDEN_REGION_ALERT_MESSAGE"));
}

+ (void)show5XXDuringStartOfferAlert
{
  _objc_msgSend(a1, "displayUserNotificationWithTitleLocKey:messageLocKey:", CFSTR("5XX_ON_START_OFFER_TITLE"), CFSTR("5XX_ON_START_OFFER_MESSAGE"));
}

+ (void)show5XXDuringStopOfferAlert
{
  _objc_msgSend(a1, "displayUserNotificationWithTitleLocKey:messageLocKey:", CFSTR("5XX_ON_STOP_OFFER_TITLE"), CFSTR("5XX_ON_STOP_OFFER_MESSAGE"));
}

+ (void)showGenericErrorAlert
{
  _objc_msgSend(a1, "displayUserNotificationWithTitleLocKey:messageLocKey:", CFSTR("GENERIC_ERROR_ALERT_TITLE"), CFSTR("GENERIC_ERROR_ALERT_TEXT"));
}

+ (void)showSwitchMeDeviceAlertUsingCurrentMeDeviceName:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t);
  id v7;
  NSObject *v8;
  __CFDictionary *Mutable;
  id v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  NSBundle *v21;
  void *v22;
  void *v23;
  CFUserNotificationRef v24;
  void *v25;
  CFOptionFlags responseFlags;
  SInt32 error;
  uint8_t buf[16];

  v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFDUserNotification: showSwitchMeDeviceAlertUsingCurrentMeDeviceName", buf, 2u);
  }

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v10 = objc_msgSend(v5, "length");
  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SWITCH_ME_DEVICE_ALERT_NO_ME_DEVICE_TITLE"), &stru_10009B948, 0));

  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SWITCH_ME_DEVICE_ALERT_MESSAGE"), &stru_10009B948, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v5));

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SWITCH_ME_DEVICE_ALERT_NO_ME_DEVICE_MESSAGE"), &stru_10009B948, 0));
  }

  v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("USE_BUTTON"), &stru_10009B948, 0));

  v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("NOT_NOW_BUTTON"), &stru_10009B948, 0));

  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v13);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v17);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v20);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v23);
  error = -1;
  v24 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, Mutable);
  CFRelease(Mutable);
  responseFlags = 0;
  if (error)
  {
    CFRelease(v24);
    v25 = v5;
    if (v6)
      v6[2](v6, 3);
  }
  else
  {
    CFUserNotificationReceiveResponse(v24, 0.0, &responseFlags);
    CFRelease(v24);
    v6[2](v6, responseFlags);
    v25 = v5;
  }

}

+ (BOOL)displayiCloudUserNotificationWithTitleLocKey:(id)a3 messageLocKey:(id)a4 switchString:(id)a5 doNotSwitch:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  __CFDictionary *Mutable;
  NSBundle *v14;
  void *v15;
  void *v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  NSBundle *v20;
  void *v21;
  void *v22;
  NSBundle *v23;
  void *v24;
  void *v25;
  NSBundle *v26;
  void *v27;
  void *v28;
  __CFUserNotification *v29;
  BOOL v30;
  CFOptionFlags responseFlags;
  SInt32 error;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v12, &stru_10009B948, 0));

  v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v11, &stru_10009B948, 0));

  v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v10, &stru_10009B948, 0));

  v23 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v9, &stru_10009B948, 0));

  v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMFSession));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10009B948, 0));

  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v16);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v19);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v28);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v22);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v25);
  error = -1;
  v29 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, Mutable);
  CFRelease(Mutable);
  responseFlags = 0;
  if (error)
  {
    v30 = 0;
  }
  else
  {
    CFUserNotificationReceiveResponse(v29, 0.0, &responseFlags);
    v30 = responseFlags == 0;
  }
  CFRelease(v29);

  return v30;
}

+ (void)notLoggedIntoiCloudAlert
{
  unsigned int v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _DWORD v7[2];

  v2 = objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:", CFSTR("NOT_LOGGED_INTO_ICLOUD_ALERT_TITLE"), CFSTR("NOT_LOGGED_INTO_ICLOUD_ALERT_MESSAGE"), CFSTR("SETTINGS_BUTTON"), CFSTR("NOT_NOW_BUTTON"));
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No iCloud Account do not go to settings: %d", (uint8_t *)v7, 8u);
  }

  if ((v2 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v5, 0);

  }
}

+ (void)upselliCloudAlert
{
  void *v2;
  id v3;

  if ((objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:", CFSTR("UPSELL_ICLOUD_ALERT_TITLE"), CFSTR("UPSELL_ICLOUD_ALERT_MESSAGE"), CFSTR("SIGN_IN"), CFSTR("NOT_NOW_BUTTON")) & 1) == 0)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE")));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  }
}

+ (void)showNetworkOfflineDuringOfferAlert
{
  void *v2;
  id v3;

  if ((objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:", CFSTR("NETWORK_OFFLINE_OFFER_TITLE"), CFSTR("NETWORK_OFFLINE_OFFER_MESSAGE"), CFSTR("SETTINGS_BUTTON"), CFSTR("OK_BUTTON_TITLE")) & 1) == 0)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=ROOT")));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  }
}

+ (void)showNetworkOfflineDuringStopOfferAlert
{
  void *v2;
  id v3;

  if ((objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:", CFSTR("NETWORK_OFFLINE_STOP_TITLE"), CFSTR("NETWORK_OFFLINE_STOP_MESSAGE"), CFSTR("SETTINGS_BUTTON"), CFSTR("OK_BUTTON_TITLE")) & 1) == 0)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=ROOT")));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  }
}

@end
