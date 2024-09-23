@implementation SCAlert

+ (BOOL)userAcknowledgementAlertWithBundleID:(id)a3 currentTCCEnabled:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "+[SCAlert userAcknowledgementAlertWithBundleID:currentTCCEnabled:]";
    v19 = 1024;
    v20 = 30;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("SCREENCAPTUREKIT_USER_ALERT_TITLE")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedAppNameFromBundleID:](NSBundle, "_rpLocalizedAppNameFromBundleID:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("SCREENCAPTUREKIT_USER_ALERT_BODY")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedAppNameFromBundleID:](NSBundle, "_rpLocalizedAppNameFromBundleID:", v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9));

  v11 = objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](NSBundle, "_rpFrameworkBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v11, "bundleURL"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("SCREENCAPTUREKIT_USER_ALERT_OPEN_SYSTEM_PREFERENCES")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("SCREENCAPTUREKIT_USER_ALERT_ALLOW_FOR_WEEK")));
  v15 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", CFSTR("/System/Library/Frameworks/ReplayKit.framework/Resources/PrivacyScreenRecording.png"));
  LOBYTE(v11) = +[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:](SCAlert, "showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:", v7, v10, v14, v13, v12, 1, v15);

  return v11 ^ 1;
}

+ (BOOL)showPresenterOverlayPrivacyAlertWithBundleID:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v3 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "+[SCAlert showPresenterOverlayPrivacyAlertWithBundleID:]";
    v16 = 1024;
    v17 = 58;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (+[RPConnectionManager hasUnitTestEntitlement](RPConnectionManager, "hasUnitTestEntitlement"))
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("ACKNOWLEDGEMENT_PRESENTER_OVERLAY_ALERT_TITLE")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedAppNameFromBundleID:](NSBundle, "_rpLocalizedAppNameFromBundleID:", v3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("ACKNOWLEDGEMENT_PRESENTER_OVERLAY_ALERT_BODY")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](NSBundle, "_rpFrameworkBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleURL"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("ACKNOWLEDGEMENT_ALERT_DECLINE_BUTTON")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_ACTIVITIES_PREFERRED_ACCEPT_BUTTON")));
    v4 = +[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:](SCAlert, "showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:", v7, v8, v11, v12, v10, 1, 0);

  }
  return v4;
}

+ (BOOL)showLegacyAPIAlertWithBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v3 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "+[SCAlert showLegacyAPIAlertWithBundleID:]";
    v16 = 1024;
    v17 = 79;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("LEGACY_API_ALERT_TITLE")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedAppNameFromBundleID:](NSBundle, "_rpLocalizedAppNameFromBundleID:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("LEGACY_API_ALERT_BODY")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedAppNameFromBundleID:](NSBundle, "_rpLocalizedAppNameFromBundleID:", v3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](NSBundle, "_rpFrameworkBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleURL"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("LEGACY_API_ALERT_OK_BUTTON")));
  LOBYTE(v10) = +[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:](SCAlert, "showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:", v6, v9, v12, 0, v11, 0, 0);

  return (char)v10;
}

+ (BOOL)showAlertWithTitle:(id)a3 bodyText:(id)a4 defaultButtonText:(id)a5 secondaryButtonText:(id)a6 url:(id)a7 requireReponse:(BOOL)a8 imageURL:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __CFDictionary *Mutable;
  __CFUserNotification *v21;
  __CFUserNotification *v22;
  BOOL v23;
  const char *v24;
  BOOL v25;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;

  v9 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v29 = "+[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]";
    v30 = 1024;
    v31 = 92;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v14);
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v15);
  if (v17)
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v17);
  if (v16)
    CFDictionaryAddValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v16);
  if (v18)
    CFDictionaryAddValue(Mutable, kCFUserNotificationLocalizationURLKey, v18);
  if (v19)
    CFDictionaryAddValue(Mutable, kCFUserNotificationIconURLKey, v19);
  v21 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, Mutable);
  v22 = v21;
  if (v21 && v9)
  {
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v21, 0.0, &responseFlags);
    v23 = responseFlags == 1;
    if (responseFlags == 1)
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]";
        v30 = 1024;
        v31 = 126;
        v24 = " [INFO] %{public}s:%d user acknowledgement accepted";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v24, buf, 0x12u);
      }
    }
    else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "+[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]";
      v30 = 1024;
      v31 = 129;
      v24 = " [INFO] %{public}s:%d user acknowledgement refused";
      goto LABEL_25;
    }
LABEL_26:
    CFRelease(v22);
    v25 = v23;
    if (!Mutable)
      goto LABEL_21;
    goto LABEL_20;
  }
  v23 = 0;
  v25 = 0;
  if (v21)
    goto LABEL_26;
  if (Mutable)
LABEL_20:
    CFRelease(Mutable);
LABEL_21:

  return v25;
}

@end
