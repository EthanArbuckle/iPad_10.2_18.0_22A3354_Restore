@implementation CSMartyTap2Radar

- (void)deletePendingMSLFile:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSAnomalyEventService generateMslUrl:andSessionType:ttrManagedMsl:](CSAnomalyEventService, "generateMslUrl:andSessionType:ttrManagedMsl:", v3, 2, 1));
  if (qword_100387420 != -1)
    dispatch_once(&qword_100387420, &stru_100347E30);
  v5 = qword_100387428;
  if (os_log_type_enabled((os_log_t)qword_100387428, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "TTR Deleting MSL file %{private}@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v13 = 0;
  v8 = objc_msgSend(v6, "removeItemAtPath:error:", v7, &v13);
  v9 = v13;

  if ((v8 & 1) == 0)
  {
    if (qword_100387420 != -1)
      dispatch_once(&qword_100387420, &stru_100347E30);
    v10 = (id)qword_100387428;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to delete file: %@, error: %@", buf, 0x16u);

    }
  }

}

- (void)deletePendingMetadatafile:(id)a3 ttrManagedMsl:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSAnomalyEventService generateMslUrl:andSessionType:ttrManagedMsl:](CSAnomalyEventService, "generateMslUrl:andSessionType:ttrManagedMsl:", v5, 2, v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("metadata")));
  if (qword_100387420 != -1)
    dispatch_once(&qword_100387420, &stru_100347E30);
  v9 = qword_100387428;
  if (os_log_type_enabled((os_log_t)qword_100387428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleting metadata file %{private}@", buf, 0xCu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v16 = 0;
  v11 = objc_msgSend(v7, "removeItemAtPath:error:", v10, &v16);
  v12 = v16;

  if ((v11 & 1) == 0)
  {
    if (qword_100387420 != -1)
      dispatch_once(&qword_100387420, &stru_100347E30);
    v13 = (id)qword_100387428;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
      *(_DWORD *)buf = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to delete file: %@, error: %@", buf, 0x16u);

    }
  }

}

- (void)deletePendingFiles:(id)a3 ttrManagedMsl:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4)
    -[CSMartyTap2Radar deletePendingMSLFile:](self, "deletePendingMSLFile:", v6);
  -[CSMartyTap2Radar deletePendingMetadatafile:ttrManagedMsl:](self, "deletePendingMetadatafile:ttrManagedMsl:", v6, 1);

}

- (CSMartyTap2Radar)initWithSpoolerFolder:(id)a3 andConfiguration:(id)a4 withQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSMartyTap2Radar *v11;
  CSMartyTap2Radar *v12;
  CSFolderMonitor *ttrMonitor;
  CSFolderMonitor *ttrCleanupMonitor;
  NSURL *v15;
  NSURL *folderURL;
  NSObject *v17;
  NSURL *v18;
  objc_super v20;
  uint8_t buf[4];
  NSURL *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CSMartyTap2Radar;
  v11 = -[CSMartyTap2Radar init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    v12->_monitoring = 0;
    ttrMonitor = v12->_ttrMonitor;
    v12->_ttrMonitor = 0;

    ttrCleanupMonitor = v12->_ttrCleanupMonitor;
    v12->_ttrCleanupMonitor = 0;

    v15 = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v8, 1);
    folderURL = v12->_folderURL;
    v12->_folderURL = v15;

    if (qword_100387420 != -1)
      dispatch_once(&qword_100387420, &stru_100347E30);
    v17 = qword_100387428;
    if (os_log_type_enabled((os_log_t)qword_100387428, OS_LOG_TYPE_INFO))
    {
      v18 = v12->_folderURL;
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Starting TTR with spooler at: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&v12->_dispatchQueue, a5);
  }

  return v12;
}

- (BOOL)startMonitoringWithError:(id *)a3
{
  void *v5;
  _QWORD *v6;
  CSMartyTap2Radar *v7;
  CSFolderMonitor *v8;
  void *v9;
  void *v10;
  CSFolderMonitor *v11;
  CSFolderMonitor *ttrMonitor;
  CSFolderMonitorBackgroundScanningConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  CSFolderMonitor *v17;
  CSFolderMonitor *ttrCleanupMonitor;
  BOOL v19;
  void *v20;
  _QWORD v22[5];
  NSErrorUserInfoKey v23;
  const __CFString *v24;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  if (objc_msgSend(v5, "getSystemReleaseType") != 2)
  {
    v23 = NSLocalizedDescriptionKey;
    v24 = CFSTR("TTR not available because this is not an internal install");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, v20));

    goto LABEL_7;
  }
  if (!-[CSMartyTap2Radar monitoring](self, "monitoring"))
  {
    if (sub_10001A13C(self, a3, CFSTR("starter")))
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000228EC;
      v22[3] = &unk_100346E80;
      v22[4] = self;
      v6 = objc_retainBlock(v22);
      v7 = self;
      objc_sync_enter(v7);
      v8 = [CSFolderMonitor alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSMartyTap2Radar folderURL](v7, "folderURL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
      v11 = -[CSFolderMonitor initWithFolder:fileExtension:queue:postfix:andAction:](v8, "initWithFolder:fileExtension:queue:postfix:andAction:", v10, CFSTR("ttr"), v7->_dispatchQueue, CFSTR("Marty"), v6);
      ttrMonitor = v7->_ttrMonitor;
      v7->_ttrMonitor = v11;

      v13 = -[CSFolderMonitorBackgroundScanningConfiguration initWithFileProtectionType:allowBattery:periodInseconds:]([CSFolderMonitorBackgroundScanningConfiguration alloc], "initWithFileProtectionType:allowBattery:periodInseconds:", NSFileProtectionCompleteUnlessOpen, -[CSMartyTap2RadarConfiguration allowOnBattery](v7->_config, "allowOnBattery"), -[CSMartyTap2RadarConfiguration checkIntervalInSeconds](v7->_config, "checkIntervalInSeconds"));
      -[CSFolderMonitor setupRecurringScanningWithConfiguration:runNow:](v7->_ttrMonitor, "setupRecurringScanningWithConfiguration:runNow:", v13, 0);
      -[CSMartyTap2Radar setMonitoring:](v7, "setMonitoring:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSAnomalyEventService generateMslUrl:andSessionType:ttrManagedMsl:](CSAnomalyEventService, "generateMslUrl:andSessionType:ttrManagedMsl:", &stru_100366D80, 2, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLByDeletingPathExtension"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));

      v17 = -[CSFolderMonitor initWithFolder:fileExtension:queue:postfix:andAction:]([CSFolderMonitor alloc], "initWithFolder:fileExtension:queue:postfix:andAction:", v16, &stru_100366D80, v7->_dispatchQueue, CFSTR("MartyCleanup"), &stru_100347DC0);
      ttrCleanupMonitor = v7->_ttrCleanupMonitor;
      v7->_ttrCleanupMonitor = v17;

      -[CSFolderMonitor setupRecurringScanningWithConfiguration:runNow:](v7->_ttrCleanupMonitor, "setupRecurringScanningWithConfiguration:runNow:", v13, 1);
      objc_sync_exit(v7);

      goto LABEL_5;
    }
LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
LABEL_5:
  v19 = 1;
LABEL_8:

  return v19;
}

- (void)showTTRWithTriggerUUID:(id)a3 ttrManagedFiles:(BOOL)a4 withEventType:(int64_t)a5
{
  id v8;
  NSObject *dispatchQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a3;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100023268;
  v11[3] = &unk_100347DE8;
  v12 = v8;
  v13 = a5;
  v14 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(dispatchQueue, v11);

}

- (BOOL)enqueueTTRWithTriggerUUID:(id)a3 ttrManagedFiles:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  double Current;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  int v21;
  void *v22;

  v6 = a4;
  v8 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v10, "encodeInt64:forKey:", (uint64_t)Current, CFSTR("timestamp"));
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("triggerUUID"));
  objc_msgSend(v10, "encodeBool:forKey:", v6, CFSTR("ttrManagedFiles"));
  objc_msgSend(v10, "finishEncoding");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSMartyTap2Radar folderURL](self, "folderURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLByAppendingPathExtension:", CFSTR("ttr")));

  if (qword_100387420 != -1)
    dispatch_once(&qword_100387420, &stru_100347E30);
  v16 = (id)qword_100387428;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
    v21 = 138412290;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "writing enqueue file to: %@", (uint8_t *)&v21, 0xCu);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "encodedData"));
  v19 = objc_msgSend(v18, "writeToURL:options:error:", v15, 805306369, a5);

  return v19;
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
    if (qword_100387420 != -1)
      dispatch_once(&qword_100387420, &stru_100347E30);
    v11 = qword_100387428;
    if (os_log_type_enabled((os_log_t)qword_100387428, OS_LOG_TYPE_ERROR))
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
    if (qword_100387420 != -1)
      dispatch_once(&qword_100387420, &stru_100347E30);
    v14 = qword_100387428;
    if (os_log_type_enabled((os_log_t)qword_100387428, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to show confirmation window", buf, 2u);
    }
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (int)showConfirmationWithError:(id *)a3 withEventType:(int64_t)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  char *v13;
  CFTypeRef cf;

  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = v7;
  if ((unint64_t)(a4 - 1) >= 3)
  {
    if (a4 == 4)
    {
      v12 = CFSTR("\nRecently, your device sensed a potential crash event.");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Was NOT in an accident. File radar."), kCFUserNotificationDefaultButtonTitleKey);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Was in an accident. File radar."), kCFUserNotificationOtherButtonTitleKey);
    }
    else
    {
      v12 = CFSTR("Your device sensed an event helpful for improving crash detection.");
    }
  }
  else
  {
    v9 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v9, "setDateFormat:", CFSTR("EEE h:mm a"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v10));

    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nOn %@, your device sensed an event helpful for improving crash detection."), v11));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("File radar"), kCFUserNotificationDefaultButtonTitleKey);

  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Improve Crash Detection"), kCFUserNotificationAlertHeaderKey);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, kCFUserNotificationAlertMessageKey);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Ignore"), kCFUserNotificationAlternateButtonTitleKey);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCFUserNotificationAlertTopMostKey);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBUserNotificationDismissOnLock);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationDontDismissOnUnlock);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationIgnoresQuietMode);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBUserNotificationDisableIdleSleepWhileVisible);
  cf = 0;
  if (-[CSMartyTap2Radar createNotification:confirmation:error:](self, "createNotification:confirmation:error:", v8, &cf, a3))
  {
    v13 = (char *)&loc_100023E40
        + 4
        * byte_1002E5968[-[CSMartyTap2Radar getNotificationResponse:error:](self, "getNotificationResponse:error:", cf, a3) & 3];
    __asm { BR              X10 }
  }

  return 4;
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
    if (qword_100387420 != -1)
      dispatch_once(&qword_100387420, &stru_100347E30);
    v6 = qword_100387428;
    if (os_log_type_enabled((os_log_t)qword_100387428, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      v7 = "User didn't see notification";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v12, 2u);
    }
  }
  else
  {
    if (qword_100387420 != -1)
      dispatch_once(&qword_100387420, &stru_100347E30);
    v10 = qword_100387428;
    if (os_log_type_enabled((os_log_t)qword_100387428, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      v7 = "User saw notification";
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
  unint64_t v6;
  BOOL v7;
  CFTypeRef cf;

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Collected Sensor Data"), kCFUserNotificationAlertHeaderKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("By filing this radar, you consent to sending information collected by the Marty feature from your iOS device and Apple Watch to Apple in order to develop, improve, and understand the effectiveness of the feature. By submitting this radar, you agree to submit personal and non-personal information and you understand that information submitted may be tied to your name and email address and may be used to contact you about this radar.\n\nData submitted may include raw sensor data, derived information from safety-related sensors, information about your use of this feature, as well as information about your location, alerts, and your interactions with this feature, including data used to detect whether a severe car crash occurred such as motion (such as accelerometer, gyroscope, barometric pressure, and magnetometer sensor data), driving information and activity (such as general direction you were traveling, time spent driving, and speed-related data), and other information about, leading up to, and derived from the detected crash (such as approximate location and time of event, angle of the sun, and environmental sound exposure levels).\n\nApple may also collect certain data you have entered, including demographic information (such as gender and approximate age) and data about your device state at the time of an event, including Wi-Fi or cellular signal, version, software version, and whether your device was paired to another Apple device such as your Watch. \n\nApple may also receive information about your environment, interaction between devices, how long a feature was engaged, your engagement with safety-related notifications, apps, settings, and features, including third-party enablement, and if an emergency call was placed as a result of your use of a specific safety feature and how it was placed. All of the above data may be aggregated and analyzed on your iOS device and Apple Watch before being sent to Apple.\n\nYour data will not be used for any other purpose. \n\nAt all times, information collected by Apple will be treated in accordance with Apple’s Privacy Policy, which can be found at www.apple.com/privacy. "), kCFUserNotificationAlertMessageKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Agree"), kCFUserNotificationDefaultButtonTitleKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Do not agree"), kCFUserNotificationOtherButtonTitleKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCFUserNotificationAlertTopMostKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBUserNotificationDismissOnLock);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationDontDismissOnUnlock);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationIgnoresQuietMode);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, SBUserNotificationDisableIdleSleepWhileVisible);
  cf = 0;
  if (-[CSMartyTap2Radar createNotification:confirmation:error:](self, "createNotification:confirmation:error:", v5, &cf, a3))
  {
    v6 = -[CSMartyTap2Radar getNotificationResponse:error:](self, "getNotificationResponse:error:", cf, a3);
    CFRelease(cf);
    v7 = v6 == 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CSMartyTap2Radar)radarWithResult:(int)a3 triggerUUID:(id)a4 ttrManagedMsl:(BOOL)a5 eventType:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CSMartyTap2Radar *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  dispatch_time_t v36;
  NSObject *dispatchQueue;
  CSMartyTap2Radar *result;
  void *v39;
  void *v40;
  _QWORD block[5];
  id v42;
  _BYTE buf[24];

  v8 = a5;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
  v13 = objc_msgSend(v12, "isAuthorizedToCollectData");

  switch(a6)
  {
    case 0:
      sub_1002D342C((NSObject **)buf);

      result = (CSMartyTap2Radar *)abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/DataCollection/CSMartyTap2Radar.mm", 533, "-[CSMartyTap2Radar radarWithResult:triggerUUID:ttrManagedMsl:eventType:error:]");
      __break(1u);
      return result;
    case 1:
      v14 = CFSTR("T");
      goto LABEL_7;
    case 2:
      v14 = CFSTR("AC");
      goto LABEL_7;
    case 3:
      v14 = CFSTR("EC");
      goto LABEL_7;
    case 4:
      v14 = CFSTR("SC");
      goto LABEL_7;
    default:
      v14 = 0;
LABEL_7:
      switch(a3)
      {
        case 0:
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Marty] Improve Crash Detection %@ IS=%d Event=%@"), v11, v13, v14));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAddingPercentEncodingWithAllowedCharacters:", v21));

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Please tell us more about what you were doing around the time of the pop-up ... \n\nNote: Two files containing sensor data have been automatically attached to the radar. You can go to the Attachments and delete each file, as well as the original sysdiagnose, if you do not wish for the information to be sent to the team."), "stringByAddingPercentEncodingWithAllowedCharacters:", v19));
          goto LABEL_17;
        case 1:
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Marty] Improve Crash Detection True Positive Detection %@ IS=%d Event=%@"), v11, v13, v14));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAddingPercentEncodingWithAllowedCharacters:", v23));

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Please tell us more about your incident (optional)\n\nNote: Two files containing sensor data have been automatically attached to the radar. You can go to the Attachments and delete each file, as well as the original sysdiagnose, if you do not wish for the information to be sent to the team."), "stringByAddingPercentEncodingWithAllowedCharacters:", v19));
          goto LABEL_17;
        case 2:
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Marty] Improve Crash Detection False Positive Detection %@ IS=%d Event=%@"), v11, v13, v14));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAddingPercentEncodingWithAllowedCharacters:", v18));

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Please tell us more about what you were doing around the time of the pop-up ... \n\nNote: Two files containing sensor data have been automatically attached to the radar. You can go to the Attachments and delete each file, as well as the original sysdiagnose, if you do not wish for the information to be sent to the team."), "stringByAddingPercentEncodingWithAllowedCharacters:", v19));
LABEL_17:

          goto LABEL_18;
        case 3:
        case 4:
        case 5:
          if (qword_100387420 != -1)
            dispatch_once(&qword_100387420, &stru_100347E30);
          v15 = qword_100387428;
          if (os_log_type_enabled((os_log_t)qword_100387428, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't generate URL for that result", buf, 2u);
          }
          v16 = 0;
          goto LABEL_27;
        default:
          v39 = 0;
          v40 = 0;
LABEL_18:
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[CSAnomalyEventService generateMslUrl:andSessionType:ttrManagedMsl:](CSAnomalyEventService, "generateMslUrl:andSessionType:ttrManagedMsl:", v11, 2, v8));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[CSAnomalyEventService generateMslUrl:andSessionType:ttrManagedMsl:](CSAnomalyEventService, "generateMslUrl:andSessionType:ttrManagedMsl:", v11, 2, 1));
          v26 = self;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URLByAppendingPathExtension:", CFSTR("metadata")));

          v28 = &stru_100366D80;
          if (v8)
            v28 = CFSTR("DeleteOnAttach=1");
          v29 = v28;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "absoluteString"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "absoluteString"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=%@&Description=%@&Classification=Serious%%20Bug&Reproducibility=Not%%20Applicable&ComponentName=CoreMotion%%20Kappa&ComponentVersion=Tap-To-Radar&Attachments=%@,%@&Keywords=marty&ComponentID=1362668&%@"), v40, v39, v30, v31, v29));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v32));

          if (qword_100387420 != -1)
            dispatch_once(&qword_100387420, &stru_100347E30);
          v34 = qword_100387428;
          if (os_log_type_enabled((os_log_t)qword_100387428, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            *(_QWORD *)&buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Launching tap to radar with URL %{private}@", buf, 0xCu);
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
          objc_msgSend(v35, "openURL:configuration:completionHandler:", v33, 0, 0);

          if (!v8)
          {
            v36 = dispatch_time(0, 5000000000);
            dispatchQueue = v26->_dispatchQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100024910;
            block[3] = &unk_100347E10;
            block[4] = v26;
            v42 = v11;
            dispatch_after(v36, dispatchQueue, block);

          }
          v16 = 1;
LABEL_27:

          result = (CSMartyTap2Radar *)v16;
          break;
      }
      return result;
  }
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
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_ttrCleanupMonitor, 0);
  objc_storeStrong((id *)&self->_ttrMonitor, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
