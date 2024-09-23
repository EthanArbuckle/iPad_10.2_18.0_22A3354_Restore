@implementation CSKappaTap2Radar

- (CSKappaTap2Radar)initWithSpoolerFolder:(id)a3 andConfiguration:(id)a4
{
  id v6;
  id v7;
  CSKappaTap2Radar *v8;
  CSKappaTap2Radar *v9;
  CSFolderMonitor *ttrMonitor;
  NSURL *v11;
  NSURL *folderURL;
  NSObject *v13;
  NSURL *v14;
  objc_super v16;
  uint8_t buf[4];
  NSURL *v18;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSKappaTap2Radar;
  v8 = -[CSKappaTap2Radar init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a4);
    v9->_monitoring = 0;
    ttrMonitor = v9->_ttrMonitor;
    v9->_ttrMonitor = 0;

    v11 = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v6, 1);
    folderURL = v9->_folderURL;
    v9->_folderURL = v11;

    if (qword_100387410 != -1)
      dispatch_once(&qword_100387410, &stru_100346EA0);
    v13 = qword_100387418;
    if (os_log_type_enabled((os_log_t)qword_100387418, OS_LOG_TYPE_INFO))
    {
      v14 = v9->_folderURL;
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Starting TTR with spooler at: %@", buf, 0xCu);
    }
  }

  return v9;
}

- (BOOL)startMonitoringWithError:(id *)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  CSKappaTap2Radar *v9;
  CSFolderMonitor *v10;
  void *v11;
  void *v12;
  dispatch_queue_global_t global_queue;
  void *v14;
  CSFolderMonitor *v15;
  CSFolderMonitor *ttrMonitor;
  CSFolderMonitorBackgroundScanningConfiguration *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  _QWORD v22[5];
  NSErrorUserInfoKey v23;
  __CFString *v24;

  v5 = +[SOSUtilities isKappaVisible](SOSUtilities, "isKappaVisible");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  v7 = v6;
  if (!v5 || objc_msgSend(v6, "getSystemReleaseType") != 2)
  {
    if (!a3)
      goto LABEL_12;
    v18 = CFSTR("TTR not available because feature is not visible");
    if (v5)
      v18 = CFSTR("TTR not available because this is not an internal install");
    v19 = v18;
    v23 = NSLocalizedDescriptionKey;
    v24 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, v20));

    goto LABEL_11;
  }
  if (!-[CSKappaTap2Radar monitoring](self, "monitoring"))
  {
    if (sub_10001A13C(self, a3, CFSTR("starter")))
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10001706C;
      v22[3] = &unk_100346E80;
      v22[4] = self;
      v8 = objc_retainBlock(v22);
      v9 = self;
      objc_sync_enter(v9);
      v10 = [CSFolderMonitor alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSKappaTap2Radar folderURL](v9, "folderURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      global_queue = dispatch_get_global_queue(0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v15 = -[CSFolderMonitor initWithFolder:fileExtension:queue:postfix:andAction:](v10, "initWithFolder:fileExtension:queue:postfix:andAction:", v12, CFSTR("ttr"), v14, CFSTR("Kappa"), v8);
      ttrMonitor = v9->_ttrMonitor;
      v9->_ttrMonitor = v15;

      v17 = -[CSFolderMonitorBackgroundScanningConfiguration initWithFileProtectionType:allowBattery:periodInseconds:]([CSFolderMonitorBackgroundScanningConfiguration alloc], "initWithFileProtectionType:allowBattery:periodInseconds:", NSFileProtectionCompleteUnlessOpen, -[CSKappaTap2RadarConfiguration allowOnBattery](v9->_config, "allowOnBattery"), -[CSKappaTap2RadarConfiguration checkIntervalInSeconds](v9->_config, "checkIntervalInSeconds"));
      -[CSFolderMonitor setupRecurringScanningWithConfiguration:runNow:](v9->_ttrMonitor, "setupRecurringScanningWithConfiguration:runNow:", v17, 0);
      -[CSKappaTap2Radar setMonitoring:](v9, "setMonitoring:", 1);

      objc_sync_exit(v9);
      goto LABEL_6;
    }
LABEL_11:
    LOBYTE(a3) = 0;
    goto LABEL_12;
  }
LABEL_6:
  LOBYTE(a3) = 1;
LABEL_12:

  return (char)a3;
}

- (BOOL)enqueueTTRWithTriggerUUID:(id)a3 error:(id *)a4
{
  id v6;
  double Current;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v8 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v8, "encodeInt64:forKey:", (uint64_t)Current, CFSTR("timestamp"));
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("triggerUUID"));
  objc_msgSend(v8, "finishEncoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSKappaTap2Radar folderURL](self, "folderURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("ttr")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encodedData"));
  LOBYTE(a4) = objc_msgSend(v14, "writeToURL:options:error:", v13, 805306369, a4);

  return (char)a4;
}

- (BOOL)createNotification:(id)a3 confirmation:(__CFUserNotification *)a4 error:(id *)a5
{
  const __CFDictionary *v7;
  __CFUserNotification *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  uint8_t buf[4];
  SInt32 error;
  NSErrorUserInfoKey v19;
  void *v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v7 = (const __CFDictionary *)a3;
  error = 0;
  v8 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v7);
  *a4 = v8;
  if (v8)
  {
    if (!error)
    {
      v15 = 1;
      goto LABEL_18;
    }
    if (a5)
    {
      v19 = NSLocalizedDescriptionKey;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error %d"), error));
      v20 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 256, v10));

    }
    if (qword_100387410 != -1)
      dispatch_once(&qword_100387410, &stru_100346EA0);
    v11 = qword_100387418;
    if (os_log_type_enabled((os_log_t)qword_100387418, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error showing confirmation window", buf, 2u);
    }
    CFRelease(*a4);
  }
  else
  {
    if (a5)
    {
      v21 = NSLocalizedDescriptionKey;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error %d"), error));
      v22 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 4, v13));

    }
    if (qword_100387410 != -1)
      dispatch_once(&qword_100387410, &stru_100346EA0);
    v14 = qword_100387418;
    if (os_log_type_enabled((os_log_t)qword_100387418, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to show confirmation window", buf, 2u);
    }
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (int)showConfirmationWithError:(id *)a3
{
  id v5;
  int v6;
  CFTypeRef cf;

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("-Apple Internal- Kappa Event Follow-Up"), kCFUserNotificationAlertHeaderKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("\nRecently, your iPhone or Apple Watch detected a potential Kappa event, which may have helped connect you to emergency services. You may choose to file a radar to help develop and improve this feature."), kCFUserNotificationAlertMessageKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Don't file a radar"), kCFUserNotificationAlternateButtonTitleKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Was NOT in a Kappa incident. File radar."), kCFUserNotificationOtherButtonTitleKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Was in a Kappa incident. File radar."), kCFUserNotificationDefaultButtonTitleKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCFUserNotificationAlertTopMostKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBUserNotificationDismissOnLock);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationDontDismissOnUnlock);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationIgnoresQuietMode);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationDisableIdleSleepWhileVisible);
  cf = 0;
  if (-[CSKappaTap2Radar createNotification:confirmation:error:](self, "createNotification:confirmation:error:", v5, &cf, a3))
  {
    v6 = dword_1002E57D0[-[CSKappaTap2Radar getNotificationResponse:error:](self, "getNotificationResponse:error:", cf, a3) & 3];
    CFRelease(cf);
  }
  else
  {
    v6 = 3;
  }

  return v6;
}

- (unint64_t)getNotificationResponse:(__CFUserNotification *)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t v12[16];
  CFOptionFlags responseFlags;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  responseFlags = 0;
  if (CFUserNotificationReceiveResponse(a3, 0.0, &responseFlags))
  {
    if (a4)
    {
      v14 = NSLocalizedDescriptionKey;
      v15 = CFSTR("Error receiving notification response");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3072, v5));

    }
    if (qword_100387410 != -1)
      dispatch_once(&qword_100387410, &stru_100346EA0);
    v6 = qword_100387418;
    if (os_log_type_enabled((os_log_t)qword_100387418, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      v7 = "User didn't see privacy notification";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v12, 2u);
    }
  }
  else
  {
    if (qword_100387410 != -1)
      dispatch_once(&qword_100387410, &stru_100346EA0);
    v10 = qword_100387418;
    if (os_log_type_enabled((os_log_t)qword_100387418, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      v7 = "User saw privacy notification";
      v8 = v10;
      v9 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
  }
  return responseFlags;
}

- (BOOL)showPrivacyNotificationWithError:(id *)a3
{
  id v5;
  BOOL v6;
  CFTypeRef cf;

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Collected Sensor Data"), kCFUserNotificationAlertHeaderKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("\nBy filing this radar, data submitted anonymously in the past 7 days through Improve Health & Activity will now be correlated with this data submission and associated with you. Data submitted with this radar will only be used to develop and improve this feature and include the following high fidelity sensor data: accelerometer, gyroscope, pressure, odometer, navigation and GPS information, and sound pressure data."), kCFUserNotificationAlertMessageKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("OK"), kCFUserNotificationDefaultButtonTitleKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCFUserNotificationAlertTopMostKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBUserNotificationDismissOnLock);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationDontDismissOnUnlock);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationIgnoresQuietMode);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationDisableIdleSleepWhileVisible);
  cf = 0;
  v6 = -[CSKappaTap2Radar createNotification:confirmation:error:](self, "createNotification:confirmation:error:", v5, &cf, a3);
  if (v6)
  {
    -[CSKappaTap2Radar getNotificationResponse:error:](self, "getNotificationResponse:error:", cf, a3);
    CFRelease(cf);
  }

  return v6;
}

- (CSKappaTap2Radar)radarWithResult:(int)a3 triggerUUID:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;

  v6 = a4;
  if ((a3 - 2) < 3)
  {
    if (qword_100387410 != -1)
      dispatch_once(&qword_100387410, &stru_100346EA0);
    v7 = qword_100387418;
    if (os_log_type_enabled((os_log_t)qword_100387418, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Can't generate URL for that result", buf, 2u);
    }
    v8 = 0;
    goto LABEL_18;
  }
  if (a3 == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("False Positive Detection %@"), v6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v15));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("If you want, please tell us more about what you were doing when you got the SOS alert... "), "stringByAddingPercentEncodingWithAllowedCharacters:", v12));
  }
  else
  {
    if (a3)
    {
      v16 = 0;
      v11 = 0;
      goto LABEL_13;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("True Positive Detection %@"), v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("If you want, please tell us more about your Kappa incident... "), "stringByAddingPercentEncodingWithAllowedCharacters:", v12));
  }
  v16 = (void *)v13;

LABEL_13:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=%@&Description=%@&Classification=Serious%%20Bug&Reproducibility=Not%%20Applicable&ComponentName=CoreMotion%%20Kappa&ComponentVersion=Tap-To-Radar&Attachments=&Keywords=kappa&ComponentID=1362668"), v11, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v17));

  if (qword_100387410 != -1)
    dispatch_once(&qword_100387410, &stru_100346EA0);
  v19 = qword_100387418;
  if (os_log_type_enabled((os_log_t)qword_100387418, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Launching tap to radar with URL %{public}@", buf, 0xCu);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v20, "openURL:configuration:completionHandler:", v18, 0, 0);

  v8 = 1;
LABEL_18:

  return (CSKappaTap2Radar *)v8;
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderURL, 0);
  objc_storeStrong((id *)&self->_ttrMonitor, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
