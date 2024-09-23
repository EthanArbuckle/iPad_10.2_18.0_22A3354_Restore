@implementation MODiagnosticReporter

- (void)configureWithDaemonClient:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __58__MODiagnosticReporter_MOCore__configureWithDaemonClient___block_invoke;
  v3[3] = &unk_1002AF148;
  v3[4] = self;
  objc_msgSend(a3, "_getDiagnosticReporterConfiguration:", v3);
}

id *__58__MODiagnosticReporter_MOCore__configureWithDaemonClient___block_invoke(id *result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return (id *)objc_msgSend(result[4], "_configureFromDictionary:", a2);
  return result;
}

+ (id)defaultReporter
{
  if (defaultReporter_onceToken != -1)
    dispatch_once(&defaultReporter_onceToken, &__block_literal_global_48);
  return (id)defaultReporter_reporter;
}

void __39__MODiagnosticReporter_defaultReporter__block_invoke(id a1)
{
  MODiagnosticReporter *v1;
  void *v2;

  v1 = objc_alloc_init(MODiagnosticReporter);
  v2 = (void *)defaultReporter_reporter;
  defaultReporter_reporter = (uint64_t)v1;

}

- (MODiagnosticReporter)init
{
  char *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MODiagnosticReporter;
  v2 = -[MODiagnosticReporter init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("MODiagnosticReporter", v6);
    v8 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v7;

    *((_OWORD *)v2 + 1) = 0u;
    *((_OWORD *)v2 + 2) = 0u;
    v9 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = 0;

    *(_OWORD *)(v2 + 56) = xmmword_10029F570;
    *((_QWORD *)v2 + 9) = 0x4024000000000000;
    *((_DWORD *)v2 + 20) = 0;
    *((_QWORD *)v2 + 11) = 4;

  }
  return (MODiagnosticReporter *)v2;
}

- (void)_notificationHandlerWithNotificationRef:(__CFUserNotification *)a3 andOptionFlags:(unint64_t)a4
{
  __CFUserNotification **p_notification;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void (**notificationAcceptanceCallback)(void);
  __CFRunLoop *Main;
  id v14;
  int v15;
  void *v16;

  p_notification = &self->_notification;
  if (self->_notification != a3)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[MODiagnosticReporter _notificationHandlerWithNotificationRef:andOptionFlags:].cold.1();

  }
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a4));
    v15 = 138412290;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received response flags %@", (uint8_t *)&v15, 0xCu);

  }
  if ((a4 & 3) != 0)
  {
    self->_lastResult = 2;
  }
  else
  {
    self->_lastResult = 1;
    notificationAcceptanceCallback = (void (**)(void))self->_notificationAcceptanceCallback;
    if (notificationAcceptanceCallback)
      notificationAcceptanceCallback[2]();
  }
  Main = CFRunLoopGetMain();
  CFRunLoopRemoveSource(Main, self->_notificationSource, kCFRunLoopCommonModes);
  *p_notification = 0;
  p_notification[1] = 0;
  v14 = self->_notificationAcceptanceCallback;
  self->_notificationAcceptanceCallback = 0;

}

- (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 acceptButtonTitle:(id)a6 withAcceptanceBlock:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  const __CFDictionary *v15;
  id os_log;
  NSObject *v17;
  __CFUserNotification *v18;
  __CFRunLoopSource *RunLoopSource;
  id v20;
  id notificationAcceptanceCallback;
  __CFRunLoop *Main;
  id v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  const __CFDictionary *v27;

  v12 = a7;
  if (!self->_notification)
  {
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a3, kCFUserNotificationAlertHeaderKey, a4, kCFUserNotificationAlertMessageKey, a6, kCFUserNotificationDefaultButtonTitleKey, a5, kCFUserNotificationAlternateButtonTitleKey, 0));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Prompting diagnostic report notification with alert parameters %@", buf, 0xCu);
    }

    *(_DWORD *)buf = 0;
    v18 = CFUserNotificationCreate(kCFAllocatorDefault, 60.0, 0, (SInt32 *)buf, v15);
    self->_notification = v18;
    if (v18)
    {
      RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v18, (CFUserNotificationCallBack)_MODiagnosticReporter_NotificationHandler, 0);
      self->_notificationSource = RunLoopSource;
      if (RunLoopSource)
      {
        v20 = objc_msgSend(v12, "copy");
        notificationAcceptanceCallback = self->_notificationAcceptanceCallback;
        self->_notificationAcceptanceCallback = v20;

        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->_notificationSource, kCFRunLoopCommonModes);
LABEL_15:

        goto LABEL_16;
      }
      self->_notification = 0;
      v25 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
      v24 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:].cold.2();
    }
    else
    {
      v23 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:].cold.1((int *)buf, v24);
    }

    goto LABEL_15;
  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:].cold.3();

  self->_lastResult = 2;
LABEL_16:

}

- (void)reportIncident:(id)a3 subtype:(id)a4 context:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  id os_log;
  MODiagnosticReporter *v12;
  double Current;
  unint64_t lastResult;
  BOOL v15;
  id v16;
  id v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  __CFString *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;

  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_isInternalBuild)
  {
    if (self->_onboardingStatus || self->_forceNotification)
    {
      if (self->_isOnboardedOnJournalStudy || self->_forceNotification)
      {
        if (self->_avoidNotification)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
          v12 = (MODiagnosticReporter *)objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEBUG))
            -[MODiagnosticReporter reportIncident:subtype:context:].cold.4();
        }
        else
        {
          Current = CFAbsoluteTimeGetCurrent();
          v12 = self;
          objc_sync_enter(v12);
          lastResult = v12->_lastResult;
          if (lastResult)
            v15 = 0;
          else
            v15 = v12->_timeOfLastIncident <= 0.0;
          if (v12->_forceNotification || v15)
            goto LABEL_21;
          v18 = Current - v12->_timeOfLastIncident;
          v19 = lastResult == 1;
          v20 = 64;
          if (v19)
            v20 = 56;
          if (v18 > *(double *)((char *)&v12->super.isa + v20))
          {
LABEL_21:
            v12->_timeOfLastIncident = Current;
            -[MODiagnosticReporter _saveTimeOfLastIncident](v12, "_saveTimeOfLastIncident");
            objc_sync_exit(v12);

            v21 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v43 = v9;
              v44 = 2112;
              v45 = v10;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "MODiagnosticReporter reporting incident [subtype=%@,context=%@]", buf, 0x16u);
            }

            if (v8 == CFSTR("XPCInterruption"))
              v23 = CFSTR("The connection with %@ has been interrupted. Please tap \"Accept\" to proceed to Tap-to-Radar");
            else
              v23 = CFSTR("Process %@ appears to hang. Please tap \"Accept\" to proceed to Tap-to-Radar");
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "processName"));

            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v25));
            v27 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nSubtype: %@\nContext: %@"), v26, v9, v10));

            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = __55__MODiagnosticReporter_reportIncident_subtype_context___block_invoke;
            v38[3] = &unk_1002B24E8;
            v38[4] = v12;
            v39 = v8;
            v40 = v9;
            v41 = v10;
            -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:](v12, "showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:", CFSTR("Issue Detected"), v27, CFSTR("Cancel"), CFSTR("Accept"), v38);

            v12 = (MODiagnosticReporter *)v27;
          }
          else
          {
            v28 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12->_lastResult));
              v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12->_timeOfLastIncident));
              v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12->_refractoryPeriodAfterAcceptance));
              v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12->_refractoryPeriodAfterRejection));
              v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_onboardingStatus));
              *(_DWORD *)buf = 138413570;
              v43 = v36;
              v44 = 2112;
              v45 = v37;
              v46 = 2112;
              v47 = v32;
              v48 = 2112;
              v49 = v33;
              v50 = 2112;
              v51 = v34;
              v52 = 2112;
              v53 = v35;
              _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "MODiagnosticReporter states [_lastResult=%@, _timeOfLastIncident=%@, interval=%@, _refractoryPeriodAfterAcceptance=%@, _refractoryPeriodAfterRejection=%@, _onboardingStatus=%@]", buf, 0x3Eu);

            }
            v30 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[MODiagnosticReporter reportIncident:subtype:context:].cold.3();

            objc_sync_exit(v12);
          }
        }
      }
      else
      {
        v17 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
        v12 = (MODiagnosticReporter *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEBUG))
          -[MODiagnosticReporter reportIncident:subtype:context:].cold.2();
      }
    }
    else
    {
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
      v12 = (MODiagnosticReporter *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEBUG))
        -[MODiagnosticReporter reportIncident:subtype:context:].cold.1();
    }

  }
}

id __55__MODiagnosticReporter_reportIncident_subtype_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportIncidentAfterUserConsent:subtype:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)reportIncidentAfterUserConsent:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id os_log;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "processName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] %@ Detected"), v12, v10));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeOfLastIncident));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subtype: %@\n\nContext: %@\n\nApproximate timestamp: %@"), v9, v8, v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("?Title=%@&Description=%@&Classification=%@&Reproducibility=%@&ComponentName=%@&ComponentVersion=%@&ComponentID=%@"), v13, v15, CFSTR("Crash/Hang/Data Loss"), CFSTR("I Didn't Try"), CFSTR("Journaling Suggestions"), CFSTR("All"), CFSTR("1330744")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tap-to-radar://new%@"), v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v17));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
  v20 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));
    *(_DWORD *)buf = 138412290;
    v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Triggering tap to radar with url [%@]", buf, 0xCu);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v22, "openURL:configuration:completionHandler:", v18, 0, &__block_literal_global_68);

}

void __71__MODiagnosticReporter_reportIncidentAfterUserConsent_subtype_context___block_invoke(id a1, NSDictionary *a2, NSError *a3)
{
  NSError *v3;
  id os_log;
  NSObject *v5;

  v3 = a3;
  if (v3)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__MODiagnosticReporter_reportIncidentAfterUserConsent_subtype_context___block_invoke_cold_1((uint64_t)v3, v5);

  }
}

- (double)maxTimeout
{
  return self->_maxTimeout;
}

- (void)_configureFromDictionary:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MODiagnosticReporter _configureFromDictionary:].cold.1((uint64_t)v4, v6, v7);

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterRefractoryPeriodAfterAcceptance")));
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "doubleValue");
      self->_refractoryPeriodAfterAcceptance = v10;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterRefractoryPeriodAfterRejection")));
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      self->_refractoryPeriodAfterRejection = v13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterAvoidNotification")));
    v15 = v14;
    if (v14)
      self->_avoidNotification = objc_msgSend(v14, "BOOLValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterForceNotification")));
    v17 = v16;
    if (v16)
      self->_forceNotification = objc_msgSend(v16, "BOOLValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterTimeOfLastNotification")));
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "doubleValue");
      self->_timeOfLastIncident = v20;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterIsInternalBuild")));
    v22 = v21;
    if (v21)
      self->_isInternalBuild = objc_msgSend(v21, "BOOLValue");
    v30 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterOnboardingStatus")));
    v24 = v23;
    if (v23)
      self->_onboardingStatus = (int)objc_msgSend(v23, "intValue");
    v25 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterMaxTimeout")));
    v27 = v26;
    if (v26)
      self->_maxTimeout = (double)(int)objc_msgSend(v26, "intValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DiagnosticReporterIsOnboardedOnJournalStudy")));
    v29 = v28;
    if (v28)
      self->_isOnboardedOnJournalStudy = objc_msgSend(v28, "BOOLValue");

  }
}

- (void)_saveTimeOfLastIncident
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeOfLastIncident));
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("DiagnosticReporterLastIncidentTime"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationAcceptanceCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_notificationHandlerWithNotificationRef:andOptionFlags:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_10((void *)&_mh_execute_header, v0, v1, "Unexpected notification handler call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)showUserNotificationWithTitle:(int *)a1 message:(NSObject *)a2 cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:.cold.1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create diagnostic reporter user notification (error:%i)", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2_2();
}

- (void)showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Could not create diagnostic reporter user notification runloop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_10((void *)&_mh_execute_header, v0, v1, "A notification is already being processed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)reportIncident:subtype:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Attempting to report MODiagnosticReporter incident but user is not onboarded in journaling suggestions. Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)reportIncident:subtype:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Attempting to report MODiagnosticReporter incident but user is not onboarded in journal study. Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)reportIncident:subtype:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Attempting to report MODiagnosticReporter incident but recent incident is too close in the past. Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)reportIncident:subtype:context:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Attempting to report MODiagnosticReporter incident but report feature is overriden as disabled. Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __71__MODiagnosticReporter_reportIncidentAfterUserConsent_subtype_context___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Launching TTR failed %@", (uint8_t *)&v2, 0xCu);
}

- (void)_configureFromDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, a3, "Received configuration %@", (uint8_t *)&v3);
}

@end
