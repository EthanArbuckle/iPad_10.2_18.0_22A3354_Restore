@implementation CSFeedbackAssistant

+ (void)showFeedbackAssistantSurveyWithUUID:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  float v6;
  unsigned __int16 v7;
  BOOL v8;
  int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  unint64_t v30;
  double v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  _BYTE v43[10];
  __int16 v44;
  int v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  int v49;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v5 = (unint64_t)objc_msgSend(v4, "getFloatDefault:", CFSTR("FeedbackAssistantOverride"));
  if ((v5 & 0xFF00000000) != 0)
    v6 = *(float *)&v5;
  else
    v6 = 0.0;
  v7 = (unsigned __int16)objc_msgSend(v4, "getBooleanDefault:", CFSTR("FeedbackAssistantDisabled"));
  if ((_BYTE)v7)
    v8 = 0;
  else
    v8 = v7 >= 0x100u;
  v9 = !v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
  v11 = objc_msgSend(v10, "isAuthorizedToCollectData");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  v13 = objc_msgSend(v12, "isInternalInstall");

  v14 = v11 ^ 1;
  if (v6 == 0.0)
    v14 = 1;
  if ((v14 | v9) == 1)
  {
    if (qword_100387480 != -1)
      dispatch_once(&qword_100387480, &stru_100344FF8);
    v15 = qword_100387488;
    if (os_log_type_enabled((os_log_t)qword_100387488, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v43 = v11;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = v13;
      v44 = 1024;
      v45 = 0;
      v46 = 1024;
      v47 = v6 != 0.0;
      v48 = 1024;
      v49 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not showing Feedback Assistant survey, IS,%d,internal,%d,seed,%d,showSurveyOverride,%d,disableOverride,%d", buf, 0x20u);
    }
  }
  else
  {
    if (qword_100387480 != -1)
      dispatch_once(&qword_100387480, &stru_100344FF8);
    v16 = qword_100387488;
    if (os_log_type_enabled((os_log_t)qword_100387488, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v43 = v11;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = v13;
      v44 = 1024;
      v45 = 0;
      v46 = 1024;
      v47 = v6 != 0.0;
      v48 = 1024;
      v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Showing Feedback Assistant survey: IS,%d,internal,%d,seed,%d,showSurveyOverride,%d,disableOverride,%d", buf, 0x20u);
    }
    v17 = objc_alloc_init((Class)UNMutableNotificationContent);
    v18 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v18, "setDateStyle:", 1);
    objc_msgSend(v18, "setTimeStyle:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringFromDate:", v19));

    objc_msgSend(v17, "setTitle:", CFSTR("Potential vehicle crash detected"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("On %@, your device detected a potential crash event. Hope you are safe. If you are able and willing, we'd appreciate your response to a few questions to help improve our safety features."), v20));
    objc_msgSend(v17, "setBody:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
    if (!v22
      || (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "body")),
          v24 = v23 == 0,
          v23,
          v22,
          v24))
    {
      if (qword_100387480 != -1)
        dispatch_once(&qword_100387480, &stru_100344FF8);
      v39 = qword_100387488;
      if (os_log_type_enabled((os_log_t)qword_100387488, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Couldn't retrieve localized push notification strings", buf, 2u);
      }
    }
    else
    {
      v25 = objc_msgSend(SOSSettingsURLSourceKey, "UTF8String");
      v26 = objc_msgSend(CFSTR("crashdetection_feedback_request"), "UTF8String");
      v27 = objc_msgSend(CFSTR("uuid"), "UTF8String");
      v28 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(SOSSettingsURLBaseString, "stringByAppendingFormat:", CFSTR("&%s=%s&%s=%s"), v25, v26, v27, v28));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
      objc_msgSend(v17, "setDefaultActionURL:", v29);

      objc_msgSend(v17, "setCategoryIdentifier:", CFSTR("com.apple.SOSNotification"));
      v30 = (unint64_t)objc_msgSend(v4, "getFloatDefault:", CFSTR("FeedbackAssistantNotificationDelayOverride"));
      v31 = *(float *)&v30;
      if ((v30 & 0xFF00000000) == 0)
        v31 = 43200.0;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:repeats:](UNTimeIntervalNotificationTrigger, "triggerWithTimeInterval:repeats:", 0, v31));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.SOSNotificationId"), v17));
      if (qword_100387480 != -1)
        dispatch_once(&qword_100387480, &stru_100344FF8);
      v33 = qword_100387488;
      if (os_log_type_enabled((os_log_t)qword_100387488, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v43 = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Created Feedback Assistant notification request:%@", buf, 0xCu);
      }
      v34 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.SOSNotification"), v35, v36, 0x20000));

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v37));
      objc_msgSend(v34, "setNotificationCategories:", v38);

      objc_msgSend(v34, "addNotificationRequest:withCompletionHandler:", v32, &stru_100344FB8);
    }

  }
}

@end
