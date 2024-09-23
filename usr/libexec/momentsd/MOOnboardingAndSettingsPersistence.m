@implementation MOOnboardingAndSettingsPersistence

- (MOOnboardingAndSettingsPersistence)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  dispatch_queue_attr_t v27;
  NSObject *v28;
  dispatch_queue_t v29;
  void *v30;
  dispatch_queue_attr_t v31;
  NSObject *v32;
  dispatch_queue_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MOConfigurationManager, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  v12 = (objc_class *)objc_opt_class(MODataAccessManager, v11);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v14));

  v17 = (objc_class *)objc_opt_class(MODefaultsManager, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v19));

  v22 = (objc_class *)objc_opt_class(MORoutineServiceManager, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v24));

  v46.receiver = self;
  v46.super_class = (Class)MOOnboardingAndSettingsPersistence;
  v26 = -[MOOnboardingAndSettingsPersistence init](&v46, "init");
  if (v26)
  {
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = dispatch_queue_create("MOOnboardingAndSettingsPersistence.background", v28);
    v30 = (void *)*((_QWORD *)v26 + 1);
    *((_QWORD *)v26 + 1) = v29;

    objc_storeStrong((id *)v26 + 10, a3);
    objc_storeStrong((id *)v26 + 11, v10);
    objc_storeStrong((id *)v26 + 12, v15);
    objc_storeStrong((id *)v26 + 13, v20);
    objc_storeStrong((id *)v26 + 14, v25);
    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = dispatch_queue_create("MOOnboardingAndSettingsPersistence", v32);
    v34 = (void *)*((_QWORD *)v26 + 1);
    *((_QWORD *)v26 + 1) = v33;

    *((_BYTE *)v26 + 24) = 0;
    *((_QWORD *)v26 + 2) = 0;
    v35 = (void *)*((_QWORD *)v26 + 4);
    *((_QWORD *)v26 + 4) = 0;

    *((_QWORD *)v26 + 5) = 0;
    *((CFAbsoluteTime *)v26 + 6) = CFAbsoluteTimeGetCurrent();
    *((_QWORD *)v26 + 7) = 0;
    v36 = objc_msgSend(objc_alloc((Class)RTPeopleDiscoveryServiceConfiguration), "initWithAdvertisingCapability:serviceLevel:observationInterval:storageDuration:densityCallbackConfiguration:", 1, 2, 2, 3, 0);
    v37 = (void *)*((_QWORD *)v26 + 8);
    *((_QWORD *)v26 + 8) = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "defaultsManager"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "defaultsManager"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("OnboardingStatus")));
    objc_msgSend(v38, "setObject:forKey:", v40, CFSTR("OnboardingRefreshStatus"));

    objc_initWeak(&location, v26);
    v41 = *((_QWORD *)v26 + 1);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = __55__MOOnboardingAndSettingsPersistence_initWithUniverse___block_invoke;
    v43[3] = &unk_1002AF120;
    objc_copyWeak(&v44, &location);
    dispatch_async(v41, v43);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  return (MOOnboardingAndSettingsPersistence *)v26;
}

void __55__MOOnboardingAndSettingsPersistence_initWithUniverse___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_peopleAwarenessSubscribe:", objc_msgSend(WeakRetained, "getStateForSetting:", 6));

}

- (void)_peopleAwarenessSubscribe:(BOOL)a3
{
  _BOOL4 v3;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_peopleAwarenessSubscribe", v10, 2u);
  }

  self->_peopleAwarenessRegistrationTrigger = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence routineServiceManager](self, "routineServiceManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routineManager"));
  v9 = v8;
  if (v3)
    objc_msgSend(v8, "startMonitoringForPeopleDiscovery:handler:", self->_peopleAwarenessConfiguration, &__block_literal_global_46);
  else
    objc_msgSend(v8, "stopMonitoringForPeopleDiscoveryWithHandler:", &__block_literal_global_122);

}

void __64__MOOnboardingAndSettingsPersistence__peopleAwarenessSubscribe___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("OK");
    if (v2)
      v5 = (const __CFString *)v2;
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "startMonitoringForPeopleDiscovery done, %@", (uint8_t *)&v6, 0xCu);
  }

}

void __64__MOOnboardingAndSettingsPersistence__peopleAwarenessSubscribe___block_invoke_121(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPeopleDiscovery);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("OK");
    if (v2)
      v5 = (const __CFString *)v2;
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "stopMonitoringForPeopleDiscovery done, %@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)_getSettingName:(unint64_t)a3
{
  if (a3 > 0xA)
    return 0;
  else
    return *(&off_1002B5FC8 + a3);
}

- (id)_getSettingKey:(unint64_t)a3
{
  void *v3;
  NSString *v4;
  void *v5;

  if (a3 > 0xA)
  {
    v5 = 0;
  }
  else
  {
    if (a3 == 7)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence _getSettingName:](self, "_getSettingName:"));
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MOSetting%@"), v3);
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence _getSettingName:](self, "_getSettingName:"));
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MOSensedEventCombinedSwitch%@"), v3);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  }
  return v5;
}

- (unint64_t)getOnboardingFlowCompletionStatus
{
  id os_log;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  uint8_t v8[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "getOnboardingFlowCompletionStatus", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
  v6 = (int)objc_msgSend(v5, "getIntegerSettingForKey:withFallback:", CFSTR("OnboardingStatus"), 0);

  return v6;
}

- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3
{
  id os_log;
  NSObject *v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  double v20;
  float v21;
  id v22;
  NSObject *v23;
  double maxAllowedDaysForVisitLookback;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  float v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  float v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  float v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  float v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  float v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  float v65;
  void *v66;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v68;
  int v69;
  _BYTE v70[18];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v69) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "setOnboardingFlowCompletionStatus", (uint8_t *)&v69, 2u);
  }

  v7 = -[MOOnboardingAndSettingsPersistence getOnboardingFlowCompletionStatus](self, "getOnboardingFlowCompletionStatus");
  if (v7 != a3)
  {
    v11 = v7;
    switch(v7)
    {
      case 0uLL:
        if (a3 - 1 < 2)
          goto LABEL_13;
        goto LABEL_10;
      case 1uLL:
        if (a3 != 2)
          goto LABEL_10;
        goto LABEL_13;
      case 2uLL:
        if (a3 != 3)
          goto LABEL_10;
LABEL_13:
        v13 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
          v69 = 138412546;
          *(_QWORD *)v70 = v15;
          *(_WORD *)&v70[8] = 2112;
          *(_QWORD *)&v70[10] = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Onboarding transtion requested from %@ -> %@", (uint8_t *)&v69, 0x16u);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
        objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("OnboardingStatus"));

        v19 = -[MOOnboardingAndSettingsPersistence fetchSignificantLocationEnablementStatus](self, "fetchSignificantLocationEnablementStatus");
        LODWORD(v20) = 14.0;
        -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configManager, "getFloatSettingForKey:withFallback:", CFSTR("Visit_PreOnboardingLookBackWindow"), v20);
        self->_maxAllowedDaysForVisitLookback = v21;
        v22 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          maxAllowedDaysForVisitLookback = self->_maxAllowedDaysForVisitLookback;
          v69 = 67109376;
          *(_DWORD *)v70 = v19;
          *(_WORD *)&v70[4] = 2048;
          *(double *)&v70[6] = maxAllowedDaysForVisitLookback;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "setOnboardingFlowCompletionStatus,Onboarding, isVisitPreOnboardingEnabled,%d,maxAllowedDaysForVisitLookback,%f", (uint8_t *)&v69, 0x12u);
        }

        if (a3 - 1 <= 1)
        {
          v25 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
            v69 = 138412290;
            *(_QWORD *)v70 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Posting onboarding refresh request after transition to %@", (uint8_t *)&v69, 0xCu);

          }
          if (a3 == 2)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v28, 0.0));
            objc_msgSend(v29, "setObject:forKey:", v30, CFSTR("OnboardingDate"));

            v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v33) = 1234413568;
            objc_msgSend(v32, "getFloatSettingForKey:withFallback:", CFSTR("OnboardingOverrideLookBackWindowActivity"), v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v28, (float)-v34));
            objc_msgSend(v31, "setObject:forKey:", v35, CFSTR("OnboardingEarliestCollectDateActivity"));

            v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v38) = 1234413568;
            objc_msgSend(v37, "getFloatSettingForKey:withFallback:", CFSTR("OnboardingOverrideLookBackWindowMedia"), v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v28, (float)-v39));
            objc_msgSend(v36, "setObject:forKey:", v40, CFSTR("OnboardingEarliestCollectDateMedia"));

            v41 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v43) = 1234413568;
            objc_msgSend(v42, "getFloatSettingForKey:withFallback:", CFSTR("OnboardingOverrideLookBackWindowCommunication"), v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v28, (float)-v44));
            objc_msgSend(v41, "setObject:forKey:", v45, CFSTR("OnboardingEarliestCollectDateCommunication"));

            v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v48) = 1234413568;
            objc_msgSend(v47, "getFloatSettingForKey:withFallback:", CFSTR("OnboardingOverrideLookBackWindowPhoto"), v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v28, (float)-v49));
            objc_msgSend(v46, "setObject:forKey:", v50, CFSTR("OnboardingEarliestCollectDatePhoto"));

            v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            v53 = v52;
            LODWORD(v54) = 0;
            if (v19)
              *(float *)&v54 = self->_maxAllowedDaysForVisitLookback * 86400.0;
            objc_msgSend(v52, "getFloatSettingForKey:withFallback:", CFSTR("OnboardingOverrideLookBackWindowLocation"), v54);
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v28, (float)-v55));
            objc_msgSend(v51, "setObject:forKey:", v56, CFSTR("OnboardingEarliestCollectDateLocation"));

            v57 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v59) = 0;
            objc_msgSend(v58, "getFloatSettingForKey:withFallback:", CFSTR("OnboardingOverrideLookBackWindowPeople"), v59);
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v28, (float)-v60));
            objc_msgSend(v57, "setObject:forKey:", v61, CFSTR("OnboardingEarliestCollectDatePeople"));

            v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v64) = 1234413568;
            objc_msgSend(v63, "getFloatSettingForKey:withFallback:", CFSTR("OnboardingOverrideLookBackWindowStateOfMind"), v64);
            v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v28, (float)-v65));
            objc_msgSend(v62, "setObject:forKey:", v66, CFSTR("OnboardingEarliestCollectDateStateOfMind"));

          }
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.momentsd.onboarding-status-updated"), 0, 0, 1u);
          -[MOOnboardingAndSettingsPersistence postRefreshTriggerAfterOnboarding](self, "postRefreshTriggerAfterOnboarding");
        }
        return;
      case 4uLL:
        v68 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        v9 = objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[MOOnboardingAndSettingsPersistence setOnboardingFlowCompletionStatus:].cold.2();
        goto LABEL_27;
      default:
LABEL_10:
        v12 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        v9 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[MOOnboardingAndSettingsPersistence setOnboardingFlowCompletionStatus:].cold.1(v11, a3, v9);
        goto LABEL_27;
    }
  }
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v69 = 138412290;
    *(_QWORD *)v70 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No-op onboarding transtion requested with state %@", (uint8_t *)&v69, 0xCu);

  }
LABEL_27:

}

- (unint64_t)getOnboardingFlowRefreshCompletionStatus
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
  v3 = (int)objc_msgSend(v2, "getIntegerSettingForKey:withFallback:", CFSTR("OnboardingRefreshStatus"), 0);

  return v3;
}

- (void)postRefreshTriggerAfterOnboarding
{
  id os_log;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  MOOnboardingAndSettingsPersistence *v12;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "postRefreshTriggerAfterOnboarding", buf, 2u);
  }

  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence universe](self, "universe"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", CFSTR("DaemonClient")));

  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke;
  v10[3] = &unk_1002AD508;
  v11 = v7;
  v12 = self;
  v9 = v7;
  dispatch_async(queue, v10);

  objc_autoreleasePoolPop(v5);
}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_2;
  v5[3] = &unk_1002AD508;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v3, "scheduleClientTask:withName:", v5, CFSTR("onboardingRefresh"));

}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_2(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  void *v4;
  MOXPCContext *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting onboarding refresh", buf, 2u);
  }

  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_new(MOXPCContext);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_185;
  v8[3] = &unk_1002B5EE8;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "_clearEventsWithContext:andRefreshVariant:andHandler:", v5, 256, v8);

}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_185(uint64_t a1)
{
  void *v2;
  MOXPCContext *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_new(MOXPCContext);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_2_186;
  v6[3] = &unk_1002B5EE8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "_refreshEventsWithContext:andRefreshVariant:andSoftKindFlag:andHandler:", v3, 256, 0, v6);

}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_2_186(uint64_t a1)
{
  void *v2;
  MOXPCContext *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_new(MOXPCContext);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_3;
  v6[3] = &unk_1002B5EE8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "_purgeEventsWithContext:andRefreshVariant:andHandler:", v3, 256, v6);

}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v17[16];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_3_cold_1((uint64_t)v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Onboarding refresh completed", v17, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("onboardingRefresh"));
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
  v9 = (objc_class *)objc_opt_class(MOEventRefreshScheduler, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getService:", v11));

  objc_msgSend(v12, "registerDefaultRefreshActivity");
  objc_msgSend(v12, "registerFirstRefreshActivity");
  objc_msgSend(v12, "registerLightRefreshActivity");
  v13 = objc_msgSend(*(id *)(a1 + 40), "getOnboardingFlowCompletionStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "defaultsManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("OnboardingRefreshStatus"));

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.momentsd.onboarding-status-updated"), 0, 0, 1u);

}

- (BOOL)fetchSignificantLocationEnablementStatus
{
  return (id)-[MOOnboardingAndSettingsPersistence _fetchSignificantLocationEnablementStatus](self, "_fetchSignificantLocationEnablementStatus") == (id)2;
}

- (int64_t)_fetchSignificantLocationEnablementStatus
{
  double Current;
  int64_t result;
  double v5;
  BOOL v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  double v15;
  float v16;
  float v17;
  id v18;
  NSObject *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_time_t v23;
  dispatch_time_t v24;
  _BOOL4 v25;
  double cachedRoutineStateTimestamp;
  _QWORD v27[5];
  NSObject *v28;
  double v29;
  uint8_t buf[4];
  _BYTE v31[10];
  __int16 v32;
  _BOOL4 v33;

  Current = CFAbsoluteTimeGetCurrent();
  result = self->_cachedRoutineState;
  if (!result
    || ((v5 = self->_cachedRoutineStateTimestamp, Current >= v5) ? (v6 = Current <= v5 + 10.0) : (v6 = 0), !v6))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Checking RT state...", buf, 2u);
    }

    v9 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v25 = self->_cachedRoutineState == 0;
      cachedRoutineStateTimestamp = self->_cachedRoutineStateTimestamp;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v31 = v25;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = Current < cachedRoutineStateTimestamp;
      v32 = 1024;
      v33 = Current > cachedRoutineStateTimestamp + 10.0;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Conditions for checking RT state: %i,%i,%i", buf, 0x14u);
    }

    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __79__MOOnboardingAndSettingsPersistence__fetchSignificantLocationEnablementStatus__block_invoke;
    v27[3] = &unk_1002B5F38;
    v27[4] = self;
    v29 = Current;
    v12 = v11;
    v28 = v12;
    v13 = objc_retainBlock(v27);
    if (+[MOPlatformInfo isInternalBuild](MOPlatformInfo, "isInternalBuild")
      && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager")),
          LODWORD(v15) = 0,
          objc_msgSend(v14, "getFloatSettingForKey:withFallback:", CFSTR("SettingsOverrideSignificantLocationMasterSwitchRetrievalDelay"), v15), v17 = v16, v14, v17 > 0.0))
    {
      v18 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v31 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Delaying RT state retrieval by %f seconds...", buf, 0xCu);
      }

      v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = dispatch_queue_create("routineStateRetrievalQueue", v21);

      v23 = dispatch_time(0, (uint64_t)(float)(v17 * 1000000000.0));
      dispatch_after(v23, v22, v13);

    }
    else
    {
      ((void (*)(_QWORD *))v13[2])(v13);
    }
    v24 = dispatch_time(0, 3000000000);
    if (dispatch_group_wait(v12, v24))
      -[MOOnboardingAndSettingsPersistence _onRoutineStateUpdate:error:currentTime:hasTimedout:](self, "_onRoutineStateUpdate:error:currentTime:hasTimedout:", 0, 0, 1, Current);

    return self->_cachedRoutineState;
  }
  return result;
}

void __79__MOOnboardingAndSettingsPersistence__fetchSignificantLocationEnablementStatus__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "routineServiceManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routineManager"));
  v5[0] = _NSConcreteStackBlock;
  v5[2] = __79__MOOnboardingAndSettingsPersistence__fetchSignificantLocationEnablementStatus__block_invoke_2;
  v5[3] = &unk_1002B5F10;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[1] = 3221225472;
  v7 = *(_QWORD *)(a1 + 48);
  v6 = v4;
  objc_msgSend(v3, "fetchRoutineStateWithHandler:", v5);

}

void __79__MOOnboardingAndSettingsPersistence__fetchSignificantLocationEnablementStatus__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_onRoutineStateUpdate:error:currentTime:hasTimedout:", a2, a3, 0, *(double *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_onRoutineStateUpdate:(int64_t)a3 error:(id)a4 currentTime:(double)a5 hasTimedout:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  MOOnboardingAndSettingsPersistence *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;

  v6 = a6;
  v10 = a4;
  v11 = self;
  objc_sync_enter(v11);
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      -[MOOnboardingAndSettingsPersistence _onRoutineStateUpdate:error:currentTime:hasTimedout:].cold.1(v14, (uint64_t)buf, v13);
    }
    goto LABEL_7;
  }
  if (v10)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      -[MOOnboardingAndSettingsPersistence _onRoutineStateUpdate:error:currentTime:hasTimedout:].cold.3(v16, (uint64_t)v10, (uint64_t)buf, v13);
    }
    goto LABEL_7;
  }
  if (!a3)
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    v13 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
      -[MOOnboardingAndSettingsPersistence _onRoutineStateUpdate:error:currentTime:hasTimedout:].cold.2(v25, (uint64_t)buf, v13);
    }
LABEL_7:

    if (!v11->_cachedRoutineState)
    {
      v17 = -[MOOnboardingAndSettingsPersistence _updateCachedRoutineStateWithCurrentTime:](v11, "_updateCachedRoutineStateWithCurrentTime:", a5);
      if (v6)
        v11->_cachedRoutineStateTimestamp = CFAbsoluteTimeGetCurrent();
      if ((v17 & 1) != 0)
      {
LABEL_25:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.momentsd.event-streams-updated"), 0, 0, 1u);
        goto LABEL_26;
      }
    }
    goto LABEL_17;
  }
  v18 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    *(_DWORD *)buf = 138412546;
    v35 = v20;
    v36 = 2112;
    v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received RT state response with state: %@ and error: %@", buf, 0x16u);

  }
  if (v11->_cachedRoutineState != a3)
  {
    v11->_cachedRoutineState = a3;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](v11, "defaultsManager"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("SettingsSignificantLocationMasterSwitchCache"));

    v28 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      *(_DWORD *)buf = 138412290;
      v35 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Updated and persisted RT state: %@", buf, 0xCu);

    }
    v11->_cachedRoutineStateTimestamp = a5;
    goto LABEL_25;
  }
  v11->_cachedRoutineStateTimestamp = a5;
LABEL_17:
  v21 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11->_cachedRoutineState));
    v32 = 138412290;
    v33 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Keeping cached RT state: %@", (uint8_t *)&v32, 0xCu);

  }
LABEL_26:
  objc_sync_exit(v11);

}

- (BOOL)_updateCachedRoutineStateWithCurrentTime:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  signed int v9;
  uint64_t v10;
  id os_log;
  NSObject *v12;
  void *v13;
  BOOL v14;
  int v16;
  void *v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("SettingsSignificantLocationMasterSwitchCache")));

  v8 = objc_opt_class(NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
    && (v9 = objc_msgSend(v6, "intValue"), v10 = v9, (unint64_t)(v9 - 1) <= 1))
  {
    self->_cachedRoutineState = v9;
    self->_cachedRoutineStateTimestamp = a3;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
      v16 = 138412290;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Retrieved RT state from storage: %@", (uint8_t *)&v16, 0xCu);

    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_getFallbackStateForSetting_postlaunch:(unint64_t)a3
{
  unint64_t v4;
  unsigned int v5;

  v4 = -[MOOnboardingAndSettingsPersistence getOnboardingFlowCompletionStatus](self, "getOnboardingFlowCompletionStatus");
  v5 = (v4 < 4) & (0xCu >> (v4 & 0xF));
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      return v5;
    case 0xAuLL:
      v5 = (v4 < 4) & (0xEu >> (v4 & 0xF));
      break;
    default:
      LOBYTE(v5) = 0;
      break;
  }
  return v5;
}

- (BOOL)_getStateForSetting_postlaunch:(unint64_t)a3
{
  unint64_t v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint8_t v11[16];

  if (a3 == 11)
    return -[MOOnboardingAndSettingsPersistence fetchSignificantLocationEnablementStatus](self, "fetchSignificantLocationEnablementStatus");
  v4 = a3;
  if (a3 == 8)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPermissions);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MOSettingDiscoverableByNearbyContacts is a disabled setting, will read from MOSettingNearbyPeople instead", v11, 2u);
    }

    v4 = 6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence _getSettingKey:](self, "_getSettingKey:", v4));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
    v9 = objc_msgSend(v8, "getBoolSettingForKey:withFallback:", v7, -[MOOnboardingAndSettingsPersistence _getFallbackStateForSetting_postlaunch:](self, "_getFallbackStateForSetting_postlaunch:", v4));

    if (v4 == 5)
      v9 &= -[MOOnboardingAndSettingsPersistence fetchSignificantLocationEnablementStatus](self, "fetchSignificantLocationEnablementStatus");
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)getStateForSettingFast:(unint64_t)a3
{
  char v5;
  id os_log;
  NSObject *v8;
  void *v9;
  NSObject *queue;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;

  if (a3 != 11 && a3 != 5)
    return -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", a3);
  if (-[MOOnboardingAndSettingsPersistence _updateCachedRoutineStateWithCurrentTime:](self, "_updateCachedRoutineStateWithCurrentTime:", CFAbsoluteTimeGetCurrent()))
  {
    v5 = self->_cachedRoutineState == 2;
  }
  else
  {
    v5 = 0;
  }
  if (a3 == 11)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_cachedRoutineState));
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(getStateForSettingFast) returning cached routine state, isRoutineEnabled=%@, triggering background cache refresh", buf, 0xCu);

    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __61__MOOnboardingAndSettingsPersistence_getStateForSettingFast___block_invoke;
    block[3] = &unk_1002AD8A8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence _getSettingKey:](self, "_getSettingKey:", a3));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
      v13 = objc_msgSend(v12, "getBoolSettingForKey:withFallback:", v11, -[MOOnboardingAndSettingsPersistence _getFallbackStateForSetting_postlaunch:](self, "_getFallbackStateForSetting_postlaunch:", a3));

      v14 = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_cachedRoutineState));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
        *(_DWORD *)buf = 138412546;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "(getStateForSettingFast) returning cached location state, isRoutineEnabled=%@, locationSwitch=%@, triggering background cache refresh", buf, 0x16u);

      }
      v18 = self->_queue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = __61__MOOnboardingAndSettingsPersistence_getStateForSettingFast___block_invoke_197;
      v19[3] = &unk_1002AD8A8;
      v19[4] = self;
      dispatch_async(v18, v19);
      v5 &= v13;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

id __61__MOOnboardingAndSettingsPersistence_getStateForSettingFast___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getStateForSetting:", 11);
}

id __61__MOOnboardingAndSettingsPersistence_getStateForSettingFast___block_invoke_197(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getStateForSetting:", 11);
}

- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4
{
  _BOOL8 v5;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  int64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  float v21;
  void *v22;
  const __CFString *v23;
  id v24;
  NSObject *v25;
  const __CFString *v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  float v32;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  float v38;
  void *v39;
  void *v40;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v42[16];

  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setState", v42, 2u);
  }

  if (a4 == 11)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityPermissions);
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOOnboardingAndSettingsPersistence setState:forSetting:].cold.3();
  }
  else if (a4 == 8)
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityPermissions);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOOnboardingAndSettingsPersistence setState:forSetting:].cold.2();
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence _getSettingKey:](self, "_getSettingKey:", a4));
    if (v10)
    {
      v12 = -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", a4);
      v13 = -[MOOnboardingAndSettingsPersistence getOnboardingFlowCompletionStatus](self, "getOnboardingFlowCompletionStatus");
      v14 = v12 ^ v5;
      if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if (v12 && !v5)
          self->_wasAnySetingDisabledAfterOnboarding = 1;
        v15 = v12 ^ v5;
      }
      else
      {
        v15 = 0;
      }
      if (a4 != 6)
        v14 = 0;
      if (v14)
      {
        v16 = 1;
        if (!v5)
          v16 = -1;
        self->_peopleAwarenessRegistrationTrigger = v16;
      }
      if (v15 && v5)
      {
        v17 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        switch(a4)
        {
          case 1uLL:
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v20) = 0;
            objc_msgSend(v19, "getFloatSettingForKey:withFallback:", CFSTR("PrivacySettingsOverrideLookBackWindowActivity"), v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v17, (float)-v21));
            v23 = CFSTR("OnboardingEarliestCollectDateActivity");
            goto LABEL_36;
          case 2uLL:
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v27) = 0;
            objc_msgSend(v19, "getFloatSettingForKey:withFallback:", CFSTR("PrivacySettingsOverrideLookBackWindowMedia"), v27);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v17, (float)-v28));
            v23 = CFSTR("OnboardingEarliestCollectDateMedia");
            goto LABEL_36;
          case 3uLL:
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v29) = 0;
            objc_msgSend(v19, "getFloatSettingForKey:withFallback:", CFSTR("PrivacySettingsOverrideLookBackWindowCommunication"), v29);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v17, (float)-v30));
            v23 = CFSTR("OnboardingEarliestCollectDateCommunication");
            goto LABEL_36;
          case 4uLL:
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v31) = 0;
            objc_msgSend(v19, "getFloatSettingForKey:withFallback:", CFSTR("PrivacySettingsOverrideLookBackWindowPhoto"), v31);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v17, (float)-v32));
            v23 = CFSTR("OnboardingEarliestCollectDatePhoto");
            goto LABEL_36;
          case 5uLL:
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v33) = 0;
            objc_msgSend(v19, "getFloatSettingForKey:withFallback:", CFSTR("PrivacySettingsOverrideLookBackWindowLocation"), v33);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v17, (float)-v34));
            v23 = CFSTR("OnboardingEarliestCollectDateLocation");
            goto LABEL_36;
          case 6uLL:
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v35) = 0;
            objc_msgSend(v19, "getFloatSettingForKey:withFallback:", CFSTR("PrivacySettingsOverrideLookBackWindowPeople"), v35);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v17, (float)-v36));
            v23 = CFSTR("OnboardingEarliestCollectDatePeople");
            goto LABEL_36;
          case 9uLL:
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
            LODWORD(v37) = 0;
            objc_msgSend(v19, "getFloatSettingForKey:withFallback:", CFSTR("PrivacySettingsOverrideLookBackWindowStateOfMind"), v37);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v17, (float)-v38));
            v23 = CFSTR("OnboardingEarliestCollectDateStateOfMind");
LABEL_36:
            objc_msgSend(v18, "setObject:forKey:", v22, v23);

            break;
          default:
            break;
        }
      }
      else
      {
        if (!v5)
        {
          switch(a4)
          {
            case 1uLL:
              v25 = objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
              v17 = v25;
              v26 = CFSTR("OnboardingEarliestCollectDateActivity");
              goto LABEL_43;
            case 2uLL:
              v25 = objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
              v17 = v25;
              v26 = CFSTR("OnboardingEarliestCollectDateMedia");
              goto LABEL_43;
            case 3uLL:
              v25 = objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
              v17 = v25;
              v26 = CFSTR("OnboardingEarliestCollectDateCommunication");
              goto LABEL_43;
            case 4uLL:
              v25 = objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
              v17 = v25;
              v26 = CFSTR("OnboardingEarliestCollectDatePhoto");
              goto LABEL_43;
            case 5uLL:
              v25 = objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
              v17 = v25;
              v26 = CFSTR("OnboardingEarliestCollectDateLocation");
              goto LABEL_43;
            case 6uLL:
              v25 = objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
              v17 = v25;
              v26 = CFSTR("OnboardingEarliestCollectDatePeople");
              goto LABEL_43;
            case 9uLL:
              v25 = objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
              v17 = v25;
              v26 = CFSTR("OnboardingEarliestCollectDateStateOfMind");
LABEL_43:
              -[NSObject deleteObjectForKey:](v25, "deleteObjectForKey:", v26);
              goto LABEL_44;
            default:
              goto LABEL_45;
          }
        }
        v24 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
        v17 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[MOOnboardingAndSettingsPersistence setState:forSetting:].cold.1(a4, v13, v17);
      }
LABEL_44:

LABEL_45:
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
      objc_msgSend(v39, "setObject:forKey:", v40, v10);

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.momentsd.event-streams-updated"), 0, 0, 1u);
      -[MOOnboardingAndSettingsPersistence postRefreshTriggerAfterSettingChange](self, "postRefreshTriggerAfterSettingChange");
    }
  }

}

- (void)postRefreshTriggerAfterSettingChange
{
  id os_log;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  _QWORD *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[5];
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "postRefreshTriggerAfterSettingChange", buf, 2u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke;
  v15[3] = &unk_1002AD8A8;
  v15[4] = self;
  v5 = objc_retainBlock(v15);
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence universe](self, "universe"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getService:", CFSTR("DaemonClient")));

  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_212;
  v12[3] = &unk_1002AEBA8;
  v12[4] = self;
  v13 = v8;
  v10 = v5;
  v14 = v10;
  v11 = v8;
  dispatch_async(queue, v12);

  objc_autoreleasePoolPop(v6);
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke(uint64_t a1)
{
  int v2;
  id os_log;
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v12[2];

  v2 = --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 20);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20);
      v12[0] = 67109120;
      v12[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Settings change transaction release deferred (n=%i transaction holds)", (uint8_t *)v12, 8u);
    }

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Settings change transaction release complete", (uint8_t *)v12, 2u);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0;

    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[7];
    if (v10 == -1)
    {
      v11 = 0;
    }
    else
    {
      if (v10 != 1)
        return;
      v11 = 1;
    }
    objc_msgSend(v9, "_peopleAwarenessSubscribe:", v11);
  }
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_212(uint64_t a1)
{
  uint64_t v2;
  id os_log;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  dispatch_time_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 32))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Settings change detected (first one), taking a transaction", buf, 2u);
    }

    v6 = os_transaction_create("com.apple.momentsd.settings-change", v5);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v6;

    v2 = *(_QWORD *)(a1 + 32);
  }
  ++*(_DWORD *)(v2 + 16);
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 20);
  v9 = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_DWORD *)(v11 + 16);
    LODWORD(v11) = *(_DWORD *)(v11 + 20);
    *(_DWORD *)buf = 67109632;
    v21 = v12;
    v22 = 1024;
    v23 = v11;
    v24 = 2048;
    v25 = 0x4024000000000000;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Settings change detected (n=%i changes, n=%i transaction holds), scheduling refresh in %lf seconds", buf, 0x18u);
  }

  v13 = dispatch_time(0, 10000000000);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v16 = *(NSObject **)(v14 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_214;
  block[3] = &unk_1002AEBA8;
  block[4] = v14;
  v18 = v15;
  v19 = *(id *)(a1 + 48);
  dispatch_after(v13, v16, block);

}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_214(uint64_t a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 16))
  {
    v3 = dispatch_time(0, 5000000000);
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v8 = objc_msgSend(*(id *)(a1 + 48), "copy");
    dispatch_after(v3, v4, v8);

  }
  else
  {
    if (*(_BYTE *)(v2 + 24))
    {
      objc_msgSend(*(id *)(a1 + 40), "triggerFeedbackAssistantFlow:handler:", CFSTR(":framework-journalingsuggestions-settings"), &__block_literal_global_217);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    }
    v5 = *(void **)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_3;
    v9[3] = &unk_1002AEBA8;
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v11 = v7;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v6, "scheduleClientTask:withName:", v9, CFSTR("settingsChangePurge"));

  }
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_3(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  void *v4;
  MOXPCContext *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting settings change refresh", buf, 2u);
  }

  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_new(MOXPCContext);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_218;
  v9[3] = &unk_1002B5F80;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v10 = v6;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v4, "_purgeEventsWithContext:andRefreshVariant:andHandler:", v5, 336, v9);

}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_218(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  dispatch_time_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  uint64_t v13;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettingsChange);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_218_cold_1((uint64_t)v3, v6, v7);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = 0x4014000000000000;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Settings change refresh completed, scheduling transaction release attempt in %lf seconds", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "finalizeClientTaskWithName:", CFSTR("settingsChangePurge"));
  v8 = dispatch_time(0, 5000000000);
  v9 = *(void **)(a1 + 48);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
  v11 = objc_msgSend(v9, "copy");
  dispatch_after(v8, v10, v11);

}

- (unint64_t)getCollectAndComputeAuthorization
{
  void *v3;
  double v4;
  float v5;
  double v6;
  void *v7;
  double v8;
  float v9;
  double v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  id os_log;
  NSObject *v16;
  id v17;
  NSObject *v18;
  unint64_t v19;
  id v20;
  NSObject *v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
  LODWORD(v4) = 1256029184;
  objc_msgSend(v3, "getFloatSettingForKey:withFallback:", CFSTR("ProcessingDurationForApplicationsWithDataAccess"), v4);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
  LODWORD(v8) = 1242802176;
  objc_msgSend(v7, "getFloatSettingForKey:withFallback:", CFSTR("ProcessingDurationForClientsWithDataAccess"), v8);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence dataAccessManager](self, "dataAccessManager"));
  v12 = objc_msgSend(v11, "hasAnyApplicationsWithDataAccessWithinTimeInterval:", v6);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence dataAccessManager](self, "dataAccessManager"));
  v14 = objc_msgSend(v13, "hasAnyClientsWithDataAccessWithinTimeInterval:", v10);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v16 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[MOOnboardingAndSettingsPersistence getCollectAndComputeAuthorization].cold.3();

  if (v14)
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[MOOnboardingAndSettingsPersistence getCollectAndComputeAuthorization].cold.1();

    v19 = 2;
  }
  else
  {
    if (!v12)
      goto LABEL_12;
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[MOOnboardingAndSettingsPersistence getCollectAndComputeAuthorization].cold.2();

    v22 = -[MOOnboardingAndSettingsPersistence getOnboardingFlowCompletionStatus](self, "getOnboardingFlowCompletionStatus")- 1;
    if (v22 <= 2)
      v19 = qword_10029F4B8[v22];
    else
LABEL_12:
      v19 = 0;
  }
  v23 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19));
    v27 = 138412290;
    v28 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Retrieved collect and compute authorization %@", (uint8_t *)&v27, 0xCu);

  }
  return v19;
}

- (BOOL)isAllowedToCollectAndCompute
{
  return -[MOOnboardingAndSettingsPersistence getCollectAndComputeAuthorization](self, "getCollectAndComputeAuthorization") != 0;
}

- (unint64_t)determineOnboardingDurationBinRange
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  id v11;
  id os_log;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence defaultsManager](self, "defaultsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("OnboardingDate")));

  if (v3 && (v5 = objc_opt_class(NSDate, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    v6 = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    v9 = v8;

    if (v9 < 0.0 || v9 > 604800.0)
    {
      if (v9 <= 604800.0 || v9 > 1209600.0)
      {
        if (v9 <= 1209600.0 || v9 > 1814400.0)
        {
          if (v9 <= 1814400.0 || v9 > 2419200.0)
          {
            if (v9 <= 2419200.0 || v9 > 4838400.0)
            {
              if (v9 <= 4838400.0 || v9 > 7257600.0)
              {
                if (v9 <= 7257600.0 || v9 > 9676800.0)
                {
                  if (v9 <= 9676800.0 || v9 > 12096000.0)
                  {
                    if (v9 <= 12096000.0 || v9 > 14515200.0)
                    {
                      if (v9 <= 14515200.0)
                        v10 = 0;
                      else
                        v10 = 10;
                    }
                    else
                    {
                      v10 = 9;
                    }
                  }
                  else
                  {
                    v10 = 8;
                  }
                }
                else
                {
                  v10 = 7;
                }
              }
              else
              {
                v10 = 6;
              }
            }
            else
            {
              v10 = 5;
            }
          }
          else
          {
            v10 = 4;
          }
        }
        else
        {
          v10 = 3;
        }
      }
      else
      {
        v10 = 2;
      }
    }
    else
    {
      v10 = 1;
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Onboarding bin %@, for onboarding time since now: %@", (uint8_t *)&v17, 0x16u);

    }
  }
  else
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    v6 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOOnboardingAndSettingsPersistence determineOnboardingDurationBinRange].cold.1();
    v10 = 0;
  }

  return v10;
}

- (id)getSnapshotDictionaryForAnalytics
{
  void *v3;
  double v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[7];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _QWORD v44[18];
  _QWORD v45[18];

  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence configManager](self, "configManager"));
  LODWORD(v4) = 1242802176;
  objc_msgSend(v3, "getFloatSettingForKey:withFallback:", CFSTR("AnalyticsOverrideAppUsageLookbackWindow"), v4);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence dataAccessManager](self, "dataAccessManager"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __71__MOOnboardingAndSettingsPersistence_getSnapshotDictionaryForAnalytics__block_invoke;
  v35[3] = &unk_1002B5FA8;
  *(double *)&v35[6] = v6;
  v35[4] = &v40;
  v35[5] = &v36;
  objc_msgSend(v7, "getApplicationsWithDataAccess:", v35);

  v25 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.journal"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence universe](self, "universe"));
  v10 = (objc_class *)objc_opt_class(MONotificationsManager, v9);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getService:", v12));

  v44[0] = CFSTR("onboardingStatus");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOOnboardingAndSettingsPersistence getOnboardingFlowCompletionStatus](self, "getOnboardingFlowCompletionStatus")));
  v45[0] = v33;
  v44[1] = CFSTR("settingSwitchActivity");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", 1)));
  v45[1] = v32;
  v44[2] = CFSTR("settingSwitchCommunication");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", 3)));
  v45[2] = v31;
  v44[3] = CFSTR("settingSwitchLocation");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", 5)));
  v45[3] = v30;
  v44[4] = CFSTR("settingSwitchMedia");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", 2)));
  v45[4] = v29;
  v44[5] = CFSTR("settingSwitchPeople");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", 6)));
  v45[5] = v28;
  v44[6] = CFSTR("settingSwitchPhoto");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", 4)));
  v45[6] = v27;
  v44[7] = CFSTR("settingSwitchStateOfMind");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", 9)));
  v45[7] = v26;
  v44[8] = CFSTR("settingSwitchReflection");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOOnboardingAndSettingsPersistence getStateForSetting:](self, "getStateForSetting:", 10)));
  v45[8] = v24;
  v44[9] = CFSTR("settingBroaderSwitchLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOOnboardingAndSettingsPersistence fetchSignificantLocationEnablementStatus](self, "fetchSignificantLocationEnablementStatus")));
  v45[9] = v13;
  v44[10] = CFSTR("appNotificationsEnabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v34, "getAppNotificationAuthorizationStatus")));
  v45[10] = v14;
  v44[11] = CFSTR("systemNotificationsEnabled");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v34, "getSystemNotificationAuthorizationStatus")));
  v45[11] = v15;
  v44[12] = CFSTR("appIsJournalAppUsed");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v41 + 24)));
  v45[12] = v16;
  v44[13] = CFSTR("appOtherJournalAppUsed");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v37[3]));
  v45[13] = v17;
  v44[14] = CFSTR("journalConfigSkipSuggestions");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[JournalAppSettingsUtilities BOOLForKey:](JournalAppSettingsUtilities, "BOOLForKey:", CFSTR("SKIP_JOURNALING_SUGGESTIONS"))));
  v45[14] = v18;
  v44[15] = CFSTR("journalConfigLockJournal");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[JournalAppSettingsUtilities BOOLForKey:](JournalAppSettingsUtilities, "BOOLForKey:", CFSTR("LOCK_JOURNAL"))));
  v45[15] = v19;
  v44[16] = CFSTR("journalIsInstalled");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v25 != 0));
  v45[16] = v20;
  v44[17] = CFSTR("onboardingDurationBin");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOOnboardingAndSettingsPersistence determineOnboardingDurationBinRange](self, "determineOnboardingDurationBinRange")));
  v45[17] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 18));

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  return v22;
}

void __71__MOOnboardingAndSettingsPersistence_getSnapshotDictionaryForAnalytics__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
          Current = CFAbsoluteTimeGetCurrent();
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v11));
          objc_msgSend(v13, "doubleValue");
          v15 = Current - v14;
          v16 = *(double *)(a1 + 48);

          if (v15 < v16)
          {
            if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.journal")))
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
            }
            else if ((objc_msgSend(v11, "isEqualToString:", &stru_1002B68D0) & 1) == 0)
            {
              ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            }
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }
  }

}

- (void)publishOnboardingStatusAnalytics
{
  void *v2;
  id os_log;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOOnboardingAndSettingsPersistence getSnapshotDictionaryForAnalytics](self, "getSnapshotDictionaryForAnalytics"));
  if (v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412546;
      v6 = CFSTR("com.apple.Moments.MOOnboardingStatus");
      v7 = 2112;
      v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Retrieved and publishing onboarding status for analytics %@ : %@", (uint8_t *)&v5, 0x16u);
    }

    AnalyticsSendEvent(CFSTR("com.apple.Moments.MOOnboardingStatus"), v2);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODaemonUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  objc_storeStrong((id *)&self->_universe, a3);
}

- (MOConfigurationManager)configManager
{
  return self->_configManager;
}

- (void)setConfigManager:(id)a3
{
  objc_storeStrong((id *)&self->_configManager, a3);
}

- (MODataAccessManager)dataAccessManager
{
  return self->_dataAccessManager;
}

- (void)setDataAccessManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataAccessManager, a3);
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (MORoutineServiceManager)routineServiceManager
{
  return self->_routineServiceManager;
}

- (void)setRoutineServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineServiceManager, a3);
}

- (float)maxAllowedDaysForVisitLookback
{
  return self->_maxAllowedDaysForVisitLookback;
}

- (void)setMaxAllowedDaysForVisitLookback:(float)a3
{
  self->_maxAllowedDaysForVisitLookback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dataAccessManager, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);
  objc_storeStrong((id *)&self->_peopleAwarenessConfiguration, 0);
  objc_storeStrong((id *)&self->_settingsChangeTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setOnboardingFlowCompletionStatus:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
  OUTLINED_FUNCTION_5_9();
  v9 = v7;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Invalid onboarding transtion requested from %@ -> %@", v8, 0x16u);

}

- (void)setOnboardingFlowCompletionStatus:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Onboarding state unknown, skipping defaults write", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __71__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterOnboarding__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Onboarding refresh failed with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)_onRoutineStateUpdate:(NSObject *)a3 error:currentTime:hasTimedout:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_9((void *)&_mh_execute_header, a2, a3, "Timedout RT state response with state: %@ and no error", (uint8_t *)a2);

  OUTLINED_FUNCTION_5_5();
}

- (void)_onRoutineStateUpdate:(NSObject *)a3 error:currentTime:hasTimedout:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_9((void *)&_mh_execute_header, a2, a3, "Unexpected RT state response with state: %@ and no error", (uint8_t *)a2);

  OUTLINED_FUNCTION_5_5();
}

- (void)_onRoutineStateUpdate:(void *)a1 error:(uint64_t)a2 currentTime:(uint64_t)a3 hasTimedout:(NSObject *)a4 .cold.3(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_10((void *)&_mh_execute_header, a4, a3, "Received RT state response with state: %@ and error: %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_5_5();
}

- (void)setState:(NSObject *)a3 forSetting:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint8_t v10[14];
  void *v11;
  __int16 v12;
  uint64_t v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
  OUTLINED_FUNCTION_5_9();
  v11 = v6;
  v12 = v8;
  v13 = v9;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Trying to set setting %@ to state %@ while onboarding status is %@ - will skip setting earliest start dates until onboarding is completed", v10, 0x20u);

}

- (void)setState:forSetting:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "MOSettingDiscoverableByNearbyContacts is a disabled setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)setState:forSetting:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "MOSettingSystemSignificantLocationReadOnly is read only setting, you cannot set it with this SPI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __74__MOOnboardingAndSettingsPersistence_postRefreshTriggerAfterSettingChange__block_invoke_218_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = 0x4014000000000000;
  OUTLINED_FUNCTION_0_10((void *)&_mh_execute_header, a2, a3, "Settings change refresh failed with error %@, scheduling transaction release attempt in %lf seconds", (uint8_t *)&v3);
}

- (void)getCollectAndComputeAuthorization
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "getCollectAndComputeAuthorization", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)determineOnboardingDurationBinRange
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "User onboarding date is nil, keeping duration bin as Unknown", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end
