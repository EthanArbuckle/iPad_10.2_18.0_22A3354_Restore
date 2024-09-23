@implementation MONotificationsManager

- (MONotificationsManager)initWithUniverse:(id)a3
{
  id v4;
  MONotificationsManager *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  MODefaultsManager *defaultsManager;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  MOConfigurationManager *configManager;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  MOEngagementHistoryManager *engagementHistoryManager;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  MOEventBundleManager *eventBundleManager;
  uint64_t v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  uint64_t v38;
  MOOnboardingAndSettingsPersistence *onboardingAndSettingsPersistence;
  UNUserNotificationCenter *v40;
  UNUserNotificationCenter *userNotificationCenterSystemBranded;
  void *v42;
  UNUserNotificationCenter *v43;
  void *v44;
  UNUserNotificationCenter *v45;
  UNUserNotificationCenter *userNotificationCenterAppBranded;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)MONotificationsManager;
  v5 = -[MONotificationsManager init](&v48, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("MONotificationsManager", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v11 = (objc_class *)objc_opt_class(MODefaultsManager, v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v13));
    defaultsManager = v5->_defaultsManager;
    v5->_defaultsManager = (MODefaultsManager *)v14;

    v17 = (objc_class *)objc_opt_class(MOConfigurationManager, v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v19));
    configManager = v5->_configManager;
    v5->_configManager = (MOConfigurationManager *)v20;

    v23 = (objc_class *)objc_opt_class(MOEngagementHistoryManager, v22);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v25));
    engagementHistoryManager = v5->_engagementHistoryManager;
    v5->_engagementHistoryManager = (MOEngagementHistoryManager *)v26;

    v29 = (objc_class *)objc_opt_class(MOEventBundleManager, v28);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v31));
    eventBundleManager = v5->_eventBundleManager;
    v5->_eventBundleManager = (MOEventBundleManager *)v32;

    v35 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, v34);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v37));
    onboardingAndSettingsPersistence = v5->_onboardingAndSettingsPersistence;
    v5->_onboardingAndSettingsPersistence = (MOOnboardingAndSettingsPersistence *)v38;

    v40 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:queue:", CFSTR("com.apple.momentsd.MOUserNotifications"), v5->_queue);
    userNotificationCenterSystemBranded = v5->_userNotificationCenterSystemBranded;
    v5->_userNotificationCenterSystemBranded = v40;

    -[UNUserNotificationCenter setDelegate:](v5->_userNotificationCenterSystemBranded, "setDelegate:", v5);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v5->_userNotificationCenterSystemBranded, "setWantsNotificationResponsesDelivered");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.momentsd.MOUserNotifications"), &__NSArray0__struct, &__NSArray0__struct, 1));
    v43 = v5->_userNotificationCenterSystemBranded;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v42));
    -[UNUserNotificationCenter setNotificationCategories:](v43, "setNotificationCategories:", v44);

    v45 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:queue:", CFSTR("com.apple.journal"), v5->_queue);
    userNotificationCenterAppBranded = v5->_userNotificationCenterAppBranded;
    v5->_userNotificationCenterAppBranded = v45;

  }
  return v5;
}

- (BOOL)_userConsentCompleted
{
  void *v2;
  unsigned int v3;
  unsigned int v4;
  id os_log;
  NSObject *v6;
  _DWORD v8[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  v3 = objc_msgSend(v2, "getIntegerSettingForKey:withFallback:", CFSTR("OnboardingStatus"), 0);

  v4 = v3 & 0xFFFFFFFE;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v4 == 2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "TTW notifications allowed=%u", (uint8_t *)v8, 8u);
  }

  return v4 == 2;
}

- (id)_getAuthorizationNotificationsError
{
  void *v2;
  void *v3;
  NSErrorUserInfoKey v5;
  const __CFString *v6;

  v5 = NSLocalizedDescriptionKey;
  v6 = CFSTR("Journal App notifications not authorized");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 35, v2));

  return v3;
}

- (id)_getMomentsFrameworkNotAvailableNotificationsError
{
  void *v2;
  void *v3;
  NSErrorUserInfoKey v5;
  const __CFString *v6;

  v5 = NSLocalizedDescriptionKey;
  v6 = CFSTR("Moments Framework not available");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 6, v2));

  return v3;
}

- (id)_getOnboardingNotCompleteNotificationsError
{
  void *v2;
  void *v3;
  NSErrorUserInfoKey v5;
  const __CFString *v6;

  v5 = NSLocalizedDescriptionKey;
  v6 = CFSTR("Onboarding not completed");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, v2));

  return v3;
}

- (id)_getGenericNotificationErrorWithReason:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSErrorUserInfoKey v7;
  id v8;

  v7 = NSLocalizedDescriptionKey;
  v8 = a3;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 13, v4));

  return v5;
}

- (id)_getCurrentSystemDefaultActionURL
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getStringSettingForKey:withFallback:", CFSTR("UserNotificationSystemURL"), CFSTR("moments://timetowrite")));

  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)_getCurrentAppDefaultActionURL
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getStringSettingForKey:withFallback:", CFSTR("UserNotificationAppURL"), CFSTR("moments://canvas")));

  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_usingAppSchedule
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("UserNotificationScheduleInMinutesArray")));

  v4 = v3 && objc_msgSend(v3, "count");
  return v4;
}

- (void)checkAuthorizationStatusForNotificationCenter:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __83__MONotificationsManager_checkAuthorizationStatusForNotificationCenter_completion___block_invoke;
  v6[3] = &unk_1002B27D8;
  v7 = a4;
  v5 = v7;
  objc_msgSend(a3, "getNotificationSettingsWithCompletionHandler:", v6);

}

uint64_t __83__MONotificationsManager_checkAuthorizationStatusForNotificationCenter_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id os_log;
  NSObject *v5;

  v3 = (uint64_t)objc_msgSend(a2, "authorizationStatus");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __83__MONotificationsManager_checkAuthorizationStatusForNotificationCenter_completion___block_invoke_cold_1();

  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 > 1, v3);
}

- (void)_serviceSuggestionsNotificationsInternalUsingTrigger:(id)a3 useAppSchedule:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager userNotificationCenterSystemBranded](self, "userNotificationCenterSystemBranded"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke;
  v13[3] = &unk_1002B2850;
  v16 = a4;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  -[MONotificationsManager checkAuthorizationStatusForNotificationCenter:completion:](self, "checkAuthorizationStatusForNotificationCenter:completion:", v10, v13);

}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id os_log;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD *v17;
  char v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  if ((a2 & 1) != 0)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__21;
    v19[4] = __Block_byref_object_dispose__21;
    v20 = (id)os_transaction_create("com.apple.momentsd.prompt-manager-fetch", a2);
    v3 = *(void **)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 56);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_394;
    v14[3] = &unk_1002B2828;
    v16 = *(id *)(a1 + 48);
    v17 = v19;
    v5 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v18 = *(_BYTE *)(a1 + 56);
    v15 = v5;
    objc_msgSend(v3, "_getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:", v4, v14);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_clearAllNotifications");
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_cold_1();

    if (*(_BYTE *)(a1 + 56))
    {
      v8 = *(void **)(a1 + 32);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_getNextNotificationDateComponentsWithOptions:afterDate:numWeeks:setComponents:", 1, v9, 2, 0));

      v11 = *(void **)(a1 + 32);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_389;
      v21[3] = &unk_1002B1800;
      v22 = *(id *)(a1 + 48);
      objc_msgSend(v11, "setupFallbackAppBrandedNotificationsWithDateComponents:handler:", v10, v21);

    }
    else
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_getGenericNotificationErrorWithReason:", CFSTR("System notifications not authorized")));
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    }
  }
}

uint64_t __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_389(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_394(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  id v32;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_394_cold_1(v6, v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v32 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Notification eligible bundle count: %lu", buf, 0xCu);
    }

    v12 = objc_msgSend(v5, "count");
    v13 = *(void **)(a1 + 32);
    if (v12)
    {
      v14 = *(unsigned __int8 *)(a1 + 64);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_396;
      v26[3] = &unk_1002B2800;
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(id *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 56);
      v27 = v16;
      v28 = v17;
      objc_msgSend(v13, "_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:", v5, v15, v14, v26);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_clearAllNotifications");
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = 0;

      if (*(_BYTE *)(a1 + 64))
      {
        v20 = *(void **)(a1 + 32);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_getNextNotificationDateComponentsWithOptions:afterDate:numWeeks:setComponents:", 1, v21, 2, 0));

        v23 = *(void **)(a1 + 32);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_395;
        v29[3] = &unk_1002B1800;
        v30 = *(id *)(a1 + 48);
        objc_msgSend(v23, "setupFallbackAppBrandedNotificationsWithDateComponents:handler:", v22, v29);

      }
      else
      {
        v24 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "No bundles available for unscheduled notification", buf, 2u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
  }

}

uint64_t __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_395(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_396(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)_serviceSuggestionsNotificationsTestForBundle:(id)a3 usingTrigger:(id)a4 useAppSchedule:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  MONotificationsManager *v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager userNotificationCenterSystemBranded](self, "userNotificationCenterSystemBranded"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __118__MONotificationsManager__serviceSuggestionsNotificationsTestForBundle_usingTrigger_useAppSchedule_completionHandler___block_invoke;
  v17[3] = &unk_1002B2878;
  v18 = v10;
  v19 = self;
  v20 = v11;
  v21 = v12;
  v22 = a5;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  -[MONotificationsManager checkAuthorizationStatusForNotificationCenter:completion:](self, "checkAuthorizationStatusForNotificationCenter:completion:", v13, v17);

}

void __118__MONotificationsManager__serviceSuggestionsNotificationsTestForBundle_usingTrigger_useAppSchedule_completionHandler___block_invoke(uint64_t a1, int a2)
{
  id os_log;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  id v9;

  if (a2 && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134217984;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got target bundle for notification (%lu new)", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_getGenericNotificationErrorWithReason:", CFSTR("Not eligible for unscheduled notification")));
    (*(void (**)(uint64_t))(v6 + 16))(v6);

  }
}

- (void)testMomentsNotificationsWithOptions:(id)a3 handler:(id)a4
{
  -[MONotificationsManager _serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:](self, "_serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:", 1, a3, a4);
}

- (void)_serviceSuggestionsNotificationsEnablingTest:(BOOL)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id os_log;
  NSObject *v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  NSObject *v31;
  MOEventBundleFetchOptions *v32;
  id v33;
  NSObject *v34;
  id v35;
  _QWORD *v36;
  unsigned int v37;
  _BOOL4 v38;
  id v39;
  id v40;
  id v41;
  _QWORD v43[5];
  id v44;
  _QWORD *v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  _QWORD *v53;
  _QWORD v54[5];
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;

  v38 = a3;
  v39 = a4;
  v40 = a5;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__21;
  v54[4] = __Block_byref_object_dispose__21;
  v55 = (id)os_transaction_create("com.apple.momentsd.prompt-manager-fetch-test", v6);
  v41 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.journal"), 0, 0);
  if (v41)
  {
    v37 = -[MONotificationsManager _usingAppSchedule](self, "_usingAppSchedule");
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v37));
      *(_DWORD *)buf = 138412290;
      v58 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notification schedule set: %@", buf, 0xCu);

    }
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke;
    v51[3] = &unk_1002B2800;
    v35 = v40;
    v52 = v35;
    v53 = v54;
    v36 = objc_retainBlock(v51);
    v10 = objc_opt_new(NSMutableArray);
    if (v38)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("targetIdentifiers")));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v48;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v48 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v14);
            v16 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v15);
            if (v16)
            {
              -[NSMutableArray addObject:](v10, "addObject:", v16);
            }
            else
            {
              v17 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              v18 = objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v58 = v15;
                _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Invalid targetIdentifiers item: %@", buf, 0xCu);
              }

            }
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        }
        while (v12);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("ignoreAppSchedule")));
      v20 = objc_msgSend(v19, "BOOLValue");

      v21 = 0;
      v22 = v37 & ~v20;
      goto LABEL_24;
    }
    if (v37)
    {
      v21 = (id)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getNextScheduledCalendarNotificationTrigger](self, "_getNextScheduledCalendarNotificationTrigger"));
      if (v21)
      {
        v22 = 1;
LABEL_24:
        v23 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[MONotificationsManager _serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:].cold.2();

        if (!v38 || !-[NSMutableArray count](v10, "count"))
        {
          -[MONotificationsManager _serviceSuggestionsNotificationsInternalUsingTrigger:useAppSchedule:completionHandler:](self, "_serviceSuggestionsNotificationsInternalUsingTrigger:useAppSchedule:completionHandler:", v21, v22, v35);
LABEL_41:

          goto LABEL_42;
        }
        if (MomentsLibraryCore(0)
          && (v25 = objc_alloc(getMOPromptManagerClass()),
              v27 = objc_opt_class(MOEvent, v26),
              (v29 = objc_msgSend(v25, "initForSoftLinkwithMOEventClass:moEventBundleClass:", v27, objc_opt_class(MOEventBundle, v28))) != 0))
        {
          v30 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[MONotificationsManager _serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:].cold.1();

          v32 = -[MOEventBundleFetchOptions initWithIdentifiers:ascending:filterBundle:]([MOEventBundleFetchOptions alloc], "initWithIdentifiers:ascending:filterBundle:", v10, 0, 0);
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_419;
          v43[3] = &unk_1002B28A0;
          v45 = v36;
          v43[4] = self;
          v21 = v21;
          v44 = v21;
          v46 = v22;
          objc_msgSend(v29, "fetchEventBundlesWithOptions:handler:", v32, v43);

        }
        else
        {
          v33 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Soft link Moments framework skipped", buf, 2u);
          }

          v29 = (id)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getMomentsFrameworkNotAvailableNotificationsError](self, "_getMomentsFrameworkNotAvailableNotificationsError"));
          (*((void (**)(id, id))v35 + 2))(v35, v29);
        }
LABEL_40:

        goto LABEL_41;
      }
      v29 = (id)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getGenericNotificationErrorWithReason:](self, "_getGenericNotificationErrorWithReason:", CFSTR("Failure getting next notification service time")));
      (*((void (**)(id, id))v35 + 2))(v35, v29);
    }
    else
    {
      if (-[MONotificationsManager _isEligibleForUnscheduledNotification](self, "_isEligibleForUnscheduledNotification"))
      {
        v21 = (id)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getUnscheduledNotificationTrigger](self, "_getUnscheduledNotificationTrigger"));
        v22 = 0;
        goto LABEL_24;
      }
      v29 = (id)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getGenericNotificationErrorWithReason:](self, "_getGenericNotificationErrorWithReason:", CFSTR("Ineligible for unscheduled notification now")));
      (*((void (**)(id, id))v35 + 2))(v35, v29);
    }
    v21 = 0;
    goto LABEL_40;
  }
  -[MONotificationsManager _clearAllNotifications](self, "_clearAllNotifications");
  v21 = (id)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getGenericNotificationErrorWithReason:](self, "_getGenericNotificationErrorWithReason:", CFSTR("Journal App not installed on device")));
  (*((void (**)(id, id))v40 + 2))(v40, v21);
LABEL_42:

  _Block_object_dispose(v54, 8);
}

void __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_419(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_419_cold_1(v5, v7);

    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(unsigned __int8 *)(a1 + 56);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_420;
    v11[3] = &unk_1002B1800;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "_serviceSuggestionsNotificationsTestForBundle:usingTrigger:useAppSchedule:completionHandler:", v5, v9, v10, v11);

  }
}

uint64_t __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_420(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)serviceSuggestionsNotificationsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MONotificationsManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke;
  v7[3] = &unk_1002B0C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userNotificationCenterSystemBranded"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke_2;
  v4[3] = &unk_1002B28C8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "getDeliveredNotificationsWithCompletionHandler:", v4);

}

void __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count")));
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Number of delivered notifications in NotificationCenter currently: %@", buf, 0xCu);

  }
  if (objc_msgSend(v3, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("suggestionID")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "date"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("UserNotificationLastDeliveredID")));

    if (v11)
    {
      if (!v15 || (objc_msgSend(v11, "isEqualToString:", v15) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "submitNotificationEngagementEventAnalyticsForBundles:userInfo:fromTrigger:withPostingDate:", 0, v10, 2, v13);
        objc_msgSend(*(id *)(a1 + 32), "submitEngagementHistoryUpdateWithEvent:userInfo:", CFSTR("suggestionNotificationPosted"), v10);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
      objc_msgSend(v16, "setObject:forKey:", v11, CFSTR("UserNotificationLastDeliveredID"));

    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke_423;
  v18[3] = &unk_1002B1800;
  v17 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v17, "_serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:", 0, 0, v18);

}

void __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke_423(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "notification service complete, error: %@", (uint8_t *)&v8, 0xCu);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:(id)a3 options:(id)a4 handler:(id)a5
{
  id v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  signed int v14;
  void *v15;
  signed int v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *i;
  void *v25;
  NSDateComponents *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id os_log;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  MONotificationsManager *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSMutableArray *v44;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  NSErrorUserInfoKey v55;
  const __CFString *v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v7 = a3;
  v43 = a5;
  v44 = objc_opt_new(NSMutableArray);
  v8 = objc_opt_new(NSMutableArray);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v9 = v7;
  v40 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v40)
  {
    v10 = *(_QWORD *)v52;
    v42 = v9;
    v38 = *(_QWORD *)v52;
    v39 = self;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(v9);
        v41 = v11;
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hour", v38, v39));
        v14 = objc_msgSend(v13, "intValue");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "minute"));
        v16 = objc_msgSend(v15, "intValue");

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "weekdays"));
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v48;
          v21 = v14;
          v22 = v16;
          v23 = v16 + 60 * v14 - 1440;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v48 != v20)
                objc_enumerationMutation(v17);
              v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
              v26 = objc_opt_new(NSDateComponents);
              -[NSDateComponents setWeekday:](v26, "setWeekday:", (int)objc_msgSend(v25, "intValue"));
              -[NSDateComponents setHour:](v26, "setHour:", v21);
              -[NSDateComponents setMinute:](v26, "setMinute:", v22);
              -[NSMutableArray addObject:](v8, "addObject:", v26);
              v27 = v23 + 1440 * objc_msgSend(v25, "intValue");
              if (v27 >> 5 >= 0x13B)
              {
                os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                v35 = objc_claimAutoreleasedReturnValue(os_log);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                  -[MONotificationsManager setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:options:handler:].cold.1(v27, v35);

                v55 = NSLocalizedDescriptionKey;
                v56 = CFSTR("Scheduled notification time out of week range.");
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v36));

                v33 = v43;
                (*((void (**)(id, void *))v43 + 2))(v43, v37);

                v9 = v42;
                v29 = v42;
                goto LABEL_21;
              }
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27));
              -[NSMutableArray addObject:](v44, "addObject:", v28);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            if (v19)
              continue;
            break;
          }
        }

        v11 = v41 + 1;
        v9 = v42;
        v10 = v38;
        self = v39;
      }
      while ((id)(v41 + 1) != v40);
      v40 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v40);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v44, "sortedArrayUsingSelector:", "compare:"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  objc_msgSend(v30, "setObject:forKey:", v29, CFSTR("UserNotificationScheduleInMinutesArray"));

  -[MONotificationsManager _clearAllNotifications](self, "_clearAllNotifications");
  if (-[NSMutableArray count](v8, "count"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getNextNotificationDateComponentsWithOptions:afterDate:numWeeks:setComponents:](self, "_getNextNotificationDateComponentsWithOptions:afterDate:numWeeks:setComponents:", 1, v31, 2, v8));

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = __99__MONotificationsManager_setupPeriodicTimeToWriteMomentsNotificationsWithSchedule_options_handler___block_invoke;
    v45[3] = &unk_1002B1800;
    v33 = v43;
    v46 = v43;
    -[MONotificationsManager setupFallbackAppBrandedNotificationsWithDateComponents:handler:](self, "setupFallbackAppBrandedNotificationsWithDateComponents:handler:", v32, v45);

  }
  else
  {
    v33 = v43;
    if (v43)
      (*((void (**)(id, _QWORD))v43 + 2))(v43, 0);
  }
LABEL_21:

}

uint64_t __99__MONotificationsManager_setupPeriodicTimeToWriteMomentsNotificationsWithSchedule_options_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setupFallbackAppBrandedNotificationsWithDateComponents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager userNotificationCenterAppBranded](self, "userNotificationCenterAppBranded"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke;
  v11[3] = &unk_1002B2918;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[MONotificationsManager checkAuthorizationStatusForNotificationCenter:completion:](self, "checkAuthorizationStatusForNotificationCenter:completion:", v8, v11);

}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke(id *a1, char a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id os_log;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void (**v28)(id, UNMutableNotificationContent *);
  id v29;
  NSObject *v30;
  void (**v31)(id, void *);
  id v32;
  NSObject *v33;
  void (**v34)(id, UNMutableNotificationContent *);
  void *v35;
  id obj;
  uint64_t v37;
  unsigned int v38;
  UNMutableNotificationContent *v39;
  _QWORD v40[4];
  id v41;
  _QWORD *v42;
  uint8_t *v43;
  unsigned int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[8];
  uint8_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _QWORD v55[3];
  int v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];

  if ((a2 & 1) != 0)
  {
    if (a1[5])
    {
      v39 = objc_opt_new(UNMutableNotificationContent);
      if (MomentsLibraryCore(0)
        && (v3 = objc_alloc(getMOPromptManagerClass()),
            v5 = objc_opt_class(MOEvent, v4),
            (v7 = objc_msgSend(v3, "initForSoftLinkwithMOEventClass:moEventBundleClass:", v5, objc_opt_class(MOEventBundle, v6))) != 0))
      {
        v35 = v7;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:", CFSTR("Time to Write")));
        -[UNMutableNotificationContent setTitle:](v39, "setTitle:", v8);

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:", CFSTR("Take a moment to reflect in your journal.")));
        -[UNMutableNotificationContent setBody:](v39, "setBody:", v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "_getCurrentAppDefaultActionURL"));
        -[UNMutableNotificationContent setDefaultActionURL:](v39, "setDefaultActionURL:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
        -[UNMutableNotificationContent setSound:](v39, "setSound:", v11);

        v38 = objc_msgSend(a1[5], "count");
        v55[0] = 0;
        v55[1] = v55;
        v55[2] = 0x2020000000;
        v56 = 0;
        *(_QWORD *)v49 = 0;
        v50 = v49;
        v51 = 0x3032000000;
        v52 = __Block_byref_object_copy__21;
        v53 = __Block_byref_object_dispose__21;
        v54 = 0;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        obj = a1[5];
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
        if (v12)
        {
          v37 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v46 != v37)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[UNCalendarNotificationTrigger triggerWithDateMatchingComponents:repeats:](UNCalendarNotificationTrigger, "triggerWithDateMatchingComponents:repeats:", v14, 0));
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "month")));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringValue"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "day")));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", v19));

              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("appTimeToWrite"), "stringByAppendingString:", v20));
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v21, v39, v15));
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              v24 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v58 = v21;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "App sourced notification posted for time to write, identifer: %@", buf, 0xCu);
              }

              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "userNotificationCenterAppBranded"));
              v40[0] = _NSConcreteStackBlock;
              v40[1] = 3221225472;
              v40[2] = __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_442;
              v40[3] = &unk_1002B28F0;
              v42 = v55;
              v43 = v49;
              v44 = v38;
              v41 = a1[6];
              objc_msgSend(v25, "addNotificationRequest:withCompletionHandler:", v22, v40);

            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
          }
          while (v12);
        }

        _Block_object_dispose(v49, 8);
        _Block_object_dispose(v55, 8);
      }
      else
      {
        v29 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v49 = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Soft link Moments framework skipped", v49, 2u);
        }

        v31 = (void (**)(id, void *))a1[6];
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "_getMomentsFrameworkNotAvailableNotificationsError"));
        v31[2](v31, v35);
      }

    }
    else
    {
      v32 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_cold_1();

      v34 = (void (**)(id, UNMutableNotificationContent *))a1[6];
      v39 = (UNMutableNotificationContent *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "_getGenericNotificationErrorWithReason:", CFSTR("No date components set for fallback notifications")));
      v34[2](v34, v39);
    }
  }
  else
  {
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_cold_2();

    v28 = (void (**)(id, UNMutableNotificationContent *))a1[6];
    v39 = (UNMutableNotificationContent *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "_getAuthorizationNotificationsError"));
    v28[2](v28, v39);
  }

}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_442(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_442_cold_1(v3, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  v8 = v9;
  if (v9)
    v10 = v8;
  else
    v10 = v3;
  objc_storeStrong(v7, v10);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == *(_DWORD *)(a1 + 56))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_getArrayScheduledDateComponents
{
  void *v2;
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  signed int v9;
  NSDateComponents *v10;
  unsigned int v11;
  id os_log;
  void *v14;
  NSObject *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("UserNotificationScheduleInMinutesArray")));

  if (v3)
  {
    v4 = objc_opt_new(NSMutableArray);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = v3;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v14 = v3;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(obj);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "intValue", v14);
          v10 = objc_opt_new(NSDateComponents);
          -[NSDateComponents setWeekday:](v10, "setWeekday:", v9 / 1440 + 1);
          v11 = v9 % 1440 + ((-30583 * (v9 % 1440)) >> 16);
          -[NSDateComponents setHour:](v10, "setHour:", ((__int16)v11 >> 5) + ((unsigned __int16)(v11 & 0x8000) >> 15));
          -[NSDateComponents setMinute:](v10, "setMinute:", v9 % 60);
          -[NSMutableArray addObject:](v4, "addObject:", v10);

        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
      v3 = v14;
    }
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    obj = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      -[MONotificationsManager _getArrayScheduledDateComponents].cold.1();
    v4 = 0;
  }

  return v4;
}

- (id)_getSortedArrayScheduledDatesWithOptions:(unint64_t)a3 afterDate:(id)a4 numWeeks:(int64_t)a5 setComponents:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id os_log;
  NSObject *v22;
  void *v23;
  void *v25;
  id v26;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];

  v28 = a4;
  v9 = a6;
  v10 = v9;
  if (v9)
  {
    v26 = v9;
  }
  else
  {
    v26 = (id)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getArrayScheduledDateComponents](self, "_getArrayScheduledDateComponents"));
    if (!v26)
    {
      v23 = 0;
      goto LABEL_21;
    }
  }
  v25 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v12 = objc_opt_new(NSMutableArray);
  if (a5 >= 1)
  {
    v13 = 0;
    do
    {
      v29 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 0x2000, v13, v28, a3));
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v15 = v26;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v18)
              objc_enumerationMutation(v15);
            if (v14)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nextDateAfterDate:matchingComponents:options:", v14, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), a3));
              if (v20)
              {
                -[NSMutableArray addObject:](v12, "addObject:", v20);
                os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                v22 = objc_claimAutoreleasedReturnValue(os_log);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v35 = v20;
                  _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "scheduledDate, %@", buf, 0xCu);
                }

              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v17);
      }

      v13 = v29 + 1;
    }
    while (v29 + 1 != a5);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v12, "sortedArrayUsingSelector:", "compare:"));

  v10 = v25;
LABEL_21:

  return v23;
}

- (id)_getNextUnscheduledNotificationDate
{
  void *v3;
  NSDateComponents *v4;
  void *v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = objc_opt_new(NSDateComponents);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  -[NSDateComponents setHour:](v4, "setHour:", (int)objc_msgSend(v5, "getIntegerSettingForKey:withFallback:", CFSTR("UserNotificationUnscheduledHour"), 19));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextDateAfterDate:matchingComponents:options:", v6, v4, 1));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Next possible unscheduled notification time, %@", (uint8_t *)&v11, 0xCu);
  }

  return v7;
}

- (id)_getNextScheduledOpportunisticNotificationDate
{
  void *v3;
  NSDateComponents *v4;
  void *v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = objc_opt_new(NSDateComponents);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  -[NSDateComponents setHour:](v4, "setHour:", (int)objc_msgSend(v5, "getIntegerSettingForKey:withFallback:", CFSTR("UserNotificationScheduledOpportunisticHour"), 19));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextDateAfterDate:matchingComponents:options:", v6, v4, 1));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Next possible opportunistic notification time, %@", (uint8_t *)&v11, 0xCu);
  }

  return v7;
}

- (id)_getUnscheduledNotificationTrigger
{
  NSDateComponents *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(NSDateComponents);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  -[NSDateComponents setHour:](v3, "setHour:", (int)objc_msgSend(v4, "getIntegerSettingForKey:withFallback:", CFSTR("UserNotificationUnscheduledHour"), 19));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNCalendarNotificationTrigger triggerWithDateMatchingComponents:repeats:](UNCalendarNotificationTrigger, "triggerWithDateMatchingComponents:repeats:", v3, 0));
  return v5;
}

- (id)_getOpportunisticNotificationTrigger
{
  NSDateComponents *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(NSDateComponents);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  -[NSDateComponents setHour:](v3, "setHour:", (int)objc_msgSend(v4, "getIntegerSettingForKey:withFallback:", CFSTR("UserNotificationScheduledOpportunisticHour"), 19));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNCalendarNotificationTrigger triggerWithDateMatchingComponents:repeats:](UNCalendarNotificationTrigger, "triggerWithDateMatchingComponents:repeats:", v3, 0));
  return v5;
}

- (id)_getNextNotificationDateComponentsWithOptions:(unint64_t)a3 afterDate:(id)a4 numWeeks:(int64_t)a5 setComponents:(id)a6
{
  void *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  id os_log;
  NSObject *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getSortedArrayScheduledDatesWithOptions:afterDate:numWeeks:setComponents:](self, "_getSortedArrayScheduledDatesWithOptions:afterDate:numWeeks:setComponents:", a3, a4, a5, a6));
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = objc_opt_new(NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          v17 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Next notification date: %@", buf, 0xCu);
          }

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "components:fromDate:", 636, v15));
          -[NSMutableArray addObject:](v8, "addObject:", v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v12);
    }

    v7 = v20;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)getMomentsNotificationsSchedule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  void *v23;
  _QWORD v24[4];
  NSMutableArray *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("UserNotificationScheduleInMinutesArray")));

  if (v6)
  {
    v22 = objc_opt_new(NSMutableArray);
    v7 = objc_opt_new(NSMutableDictionary);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "intValue", v22);
          if (v13 >> 5 <= 0x13A)
          {
            v14 = (unsigned __int16)v13 / 0x5A0u + 1;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (unsigned __int16)v13 % 0x5A0u));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v15));
            v17 = v16;
            if (v16)
            {
              v18 = objc_msgSend(v16, "mutableCopy");
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
              objc_msgSend(v18, "addObject:", v19);

              -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v18, v15);
            }
            else
            {
              v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
              v30 = v18;
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
              -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v20, v15);

            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __58__MONotificationsManager_getMomentsNotificationsSchedule___block_invoke;
    v24[3] = &unk_1002B2940;
    v25 = v22;
    v21 = v22;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v24);
    (*((void (**)(id, NSMutableArray *, _QWORD, _QWORD))v4 + 2))(v4, v21, 0, 0);

    v6 = v23;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
  }

}

void __58__MONotificationsManager_getMomentsNotificationsSchedule___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  signed int v6;
  uint64_t v7;
  uint64_t v8;
  MONotificationScheduleItem *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = objc_msgSend(a2, "intValue");
  v7 = (v6 / 60);
  v8 = (v6 % 60);
  v9 = [MONotificationScheduleItem alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v12 = -[MONotificationScheduleItem initScheduleWithHour:minute:weekdays:](v9, "initScheduleWithHour:minute:weekdays:", v10, v11, v5);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
}

- (BOOL)_isBundleUserInteractive:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
  if (!v4)
    goto LABEL_4;
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));

  if (!v7)
    goto LABEL_4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
  v10 = objc_msgSend(v9, "unsignedIntValue");

  if (v10 - 1 > 1)
    v11 = 0;
  else
LABEL_4:
    v11 = 1;

  return v11;
}

- (BOOL)_isUserInOnboardingPeriod:(BOOL)a3
{
  BOOL v3;
  void *v5;
  double v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  if (a3)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  LODWORD(v6) = 14.0;
  objc_msgSend(v5, "getFloatSettingForKey:withFallback:", CFSTR("UserNotificationMaximumDaysForOnboarding"), v6);
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("OnboardingDate")));

  if (v11)
  {
    objc_msgSend(v9, "timeIntervalSinceDate:", v11);
    v3 = v12 < (float)(v8 * 86400.0);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)allowedSourceTypes
{
  NSMutableSet *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_opt_new(NSMutableSet);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleSourceTypes all](MOEventBundleSourceTypes, "all", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "associatedEventPermission");
        if (v10)
        {
          v11 = v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
          LODWORD(v11) = objc_msgSend(v12, "isAllowedToPromptEventCategory:", v11);

          if ((_DWORD)v11)
            -[NSMutableSet addObject:](v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_getNewTargetTimeToWriteEventBundlesUsingAppSchedule:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned int v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  float v28;
  double v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  void *v39;
  double v40;
  int v41;
  int v42;
  id v43;
  NSObject *v44;
  id v45;
  void *v46;
  double v47;
  void *v48;
  const __CFString *v49;
  id v50;
  NSObject *v51;
  MOEventBundleFetchOptions *v52;
  void *v53;
  id v54;
  int v55;
  uint64_t v56;
  id os_log;
  NSObject *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  id v65;
  NSObject *v66;
  NSMutableSet *v67;
  uint64_t i;
  void *v69;
  unsigned int v70;
  void *v71;
  NSMutableSet *v72;
  uint64_t j;
  void *v74;
  unsigned int v75;
  void *v76;
  NSMutableSet *v77;
  NSMutableSet *v78;
  id v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  BOOL v87;
  void *v88;
  void *v89;
  _QWORD v90[5];
  id v91;
  id v92;
  NSMutableSet *v93;
  NSMutableSet *v94;
  id v95;
  int v96;
  char v97;
  BOOL v98;
  uint8_t buf[4];
  id v100;

  v4 = a3;
  v6 = a4;
  v7 = -[MONotificationsManager _isUserInOnboardingPeriod:](self, "_isUserInOnboardingPeriod:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  v10 = objc_msgSend(v9, "getIntegerSettingForKey:withFallback:", CFSTR("UserNotificationLookbackWindow"), 2);

  v11 = (double)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("UserNotificationRecentUnscheduledNotificationDate")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("UserNotificationOlderUnscheduledNotificationDate")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  if (v13 && (v17 = objc_msgSend(v13, "isBeforeDate:", v8), v18 = v13, (v17 & 1) != 0)
    || v15 && (v19 = objc_msgSend(v15, "isBeforeDate:", v8), v18 = v15, v19))
  {
    v20 = v18;

    v16 = v20;
  }
  v21 = v11 * 86400.0;
  if (!v7)
  {
    if (v4)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", -v21));
      if (objc_msgSend(v16, "isAfterDate:", v33))
      {
        v45 = v16;

        v33 = v45;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
      v48 = v46;
      v49 = CFSTR("UserNotificationScheduledGoodnessScoreThreshold");
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getNextUnscheduledNotificationDate](self, "_getNextUnscheduledNotificationDate"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "dateByAddingTimeInterval:", -v21));

      if (objc_msgSend(v16, "isAfterDate:", v33))
      {
        v54 = v16;

        v33 = v54;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
      v48 = v46;
      v49 = CFSTR("UserNotificationUnscheduledGoodnessScoreThreshold");
    }
    LODWORD(v47) = 1036831949;
    objc_msgSend(v46, "getFloatSettingForKey:withFallback:", v49, v47);
    v42 = v55;

    if (objc_msgSend(v33, "isAfterDate:", v8))
    {
      v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", -86400.0));

      v33 = (void *)v56;
    }
    v86 = 0;
    v87 = v4;
    v88 = v15;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v58 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v100 = v33;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Lookback window for notification start date, %@", buf, 0xCu);
    }

    v38 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v33, v8);
    goto LABEL_34;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("OnboardingDate")));

  objc_msgSend(v8, "timeIntervalSinceDate:", v23);
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  LODWORD(v27) = 3.0;
  objc_msgSend(v26, "getFloatSettingForKey:withFallback:", CFSTR("UserNotificationMinimumDaysForOnboarding"), v27);
  v29 = v28 * 86400.0;

  if (v25 >= v29)
  {
    v86 = v7;
    v87 = v4;
    v88 = v15;
    v30 = v23;
    v31 = v30;
    if (objc_msgSend(v16, "isAfterDate:", v30))
    {
      v31 = v16;

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getNextUnscheduledNotificationDate](self, "_getNextUnscheduledNotificationDate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dateByAddingTimeInterval:", -v21));

    if (objc_msgSend(v16, "isAfterDate:", v33))
    {
      v34 = v16;

      v33 = v34;
    }
    if (objc_msgSend(v31, "isAfterDate:", v8))
    {
      v35 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[MONotificationsManager _getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:].cold.2();

      v37 = v33;
      v31 = v37;
    }
    v38 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v31, v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
    LODWORD(v40) = 1032805417;
    objc_msgSend(v39, "getFloatSettingForKey:withFallback:", CFSTR("UserNotificationOnboardingBundleGoodnessThreshold"), v40);
    v42 = v41;

    v43 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v100 = v31;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Lookback window for notification post onboarding start date, %@", buf, 0xCu);
    }

LABEL_34:
    v89 = v38;
    v52 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:filterBundle:]([MOEventBundleFetchOptions alloc], "initWithDateInterval:ascending:limit:filterBundle:", v38, 1, 0, 0);
    if (MomentsLibraryCore(0)
      && (v59 = objc_alloc(getMOPromptManagerClass()),
          v61 = objc_opt_class(MOEvent, v60),
          (v63 = objc_msgSend(v59, "initForSoftLinkwithMOEventClass:moEventBundleClass:", v61, objc_opt_class(MOEventBundle, v62))) != 0))
    {
      v64 = v63;
      v83 = v16;
      v84 = v8;
      v65 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        -[MONotificationsManager _getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:].cold.1();
      v85 = v6;

      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1002D9158, &off_1002D9170, &off_1002D9188, &off_1002D91A0, 0));
      v67 = objc_opt_new(NSMutableSet);
      for (i = 0; i != 17; ++i)
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
        v70 = objc_msgSend(v69, "isAllowedToPromptResourceType:", i);

        if (v70)
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", i));
          -[NSMutableSet addObject:](v67, "addObject:", v71);

        }
      }
      v72 = objc_opt_new(NSMutableSet);
      for (j = 0; j != 25; ++j)
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
        v75 = objc_msgSend(v74, "isAllowedToPromptEventCategory:", j);

        if (v75)
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", j));
          -[NSMutableSet addObject:](v72, "addObject:", v76);

        }
      }
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke;
      v90[3] = &unk_1002B2988;
      v6 = v85;
      v95 = v85;
      v90[4] = self;
      v97 = v86;
      v91 = v33;
      v92 = v82;
      v96 = v42;
      v93 = v67;
      v94 = v72;
      v98 = v87;
      v77 = v72;
      v78 = v67;
      v79 = v82;
      objc_msgSend(v64, "fetchEventBundlesWithOptions:handler:", v52, v90);

      v8 = v84;
      v16 = v83;
    }
    else
    {
      v80 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "Soft link Moments framework skipped", buf, 2u);
      }

      v64 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getMomentsFrameworkNotAvailableNotificationsError](self, "_getMomentsFrameworkNotAvailableNotificationsError"));
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v64);
    }

    v15 = v88;
    goto LABEL_51;
  }
  v89 = v23;
  v50 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "User onboarded too recently to get notifications.", buf, 2u);
  }

  v52 = (MOEventBundleFetchOptions *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getGenericNotificationErrorWithReason:](self, "_getGenericNotificationErrorWithReason:", CFSTR("User onboarded too recently to get notifications.")));
  (*((void (**)(id, _QWORD, MOEventBundleFetchOptions *))v6 + 2))(v6, 0, v52);
  v33 = 0;
LABEL_51:

}

void __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  unsigned int v22;
  BOOL v23;
  void *v24;
  double v25;
  float v26;
  float v27;
  id os_log;
  NSObject *v29;
  uint64_t v30;
  NSMutableArray *v31;
  void *v32;
  id v33;
  id v34;
  _UNKNOWN **v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  float v49;
  float v50;
  float v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *i;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  void *j;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  void *v84;
  void *v85;
  unsigned __int8 v86;
  void *v87;
  void *v88;
  unsigned int v89;
  id v90;
  NSObject *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  NSObject *v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  NSMutableArray *v104;
  id v105;
  id v106;
  unsigned __int8 v107;
  uint64_t v108;
  void *v109;
  id v110;
  uint64_t v111;
  int v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  void *v129;
  _BYTE v130[128];
  uint8_t v131[128];
  uint8_t buf[4];
  id v133;
  __int16 v134;
  void *v135;
  __int16 v136;
  void *v137;
  _BYTE v138[128];
  _BYTE v139[128];

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_89;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allowedSourceTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleProcessor trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:](MOEventBundleProcessor, "trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:", v5, v6, 1, 0));

  v103 = v5;
  if (*(_BYTE *)(a1 + 84))
  {
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
    if (!v9)
    {
      v11 = 0;
      goto LABEL_19;
    }
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v126;
    v13 = CFSTR("visibilityCategoryForUI");
    v108 = *(_QWORD *)v126;
    while (1)
    {
      v14 = 0;
      v110 = v10;
      do
      {
        if (*(_QWORD *)v126 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rankingDictionary"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v13));
        if (objc_msgSend(v17, "intValue") == 1)
        {

        }
        else
        {
          v112 = v11;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rankingDictionary"));
          v19 = v13;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v13));
          v21 = v8;
          v22 = objc_msgSend(v20, "intValue");

          v13 = v19;
          v11 = v112;
          v12 = v108;

          v23 = v22 == 2;
          v8 = v21;
          v10 = v110;
          if (!v23)
            goto LABEL_15;
        }
        if (objc_msgSend(v15, "interfaceType") != (id)11)
          ++v11;
LABEL_15:
        v14 = (char *)v14 + 1;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
      if (!v10)
      {
LABEL_19:

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configManager"));
        LODWORD(v25) = 5.0;
        objc_msgSend(v24, "getFloatSettingForKey:withFallback:", CFSTR("UserNotificationMinimumBundlesOnboarding"), v25);
        v27 = v26;

        if (v27 > (float)v11)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          v29 = objc_claimAutoreleasedReturnValue(os_log);
          v5 = v103;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke_cold_1();

          v30 = *(_QWORD *)(a1 + 72);
          v31 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_getGenericNotificationErrorWithReason:", CFSTR("Not enough non-evergreen bundles to notify user during onboarding period.")));
          (*(void (**)(uint64_t, _QWORD, NSMutableArray *))(v30 + 16))(v30, 0, v31);
          goto LABEL_88;
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate >= %@"), *(_QWORD *)(a1 + 40)));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v32));

        break;
      }
    }
  }
  v104 = objc_opt_new(NSMutableArray);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v8 = v7;
  v33 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
  if (!v33)
    goto LABEL_82;
  v34 = v33;
  v35 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v111 = *(_QWORD *)v122;
  v105 = v8;
  do
  {
    v36 = 0;
    v106 = v34;
    do
    {
      if (*(_QWORD *)v122 != v111)
        objc_enumerationMutation(v8);
      v37 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)v36);
      v38 = *(void **)(a1 + 48);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35[317], "numberWithUnsignedInteger:", objc_msgSend(v37, "interfaceType")));
      LOBYTE(v38) = objc_msgSend(v38, "containsObject:", v39);

      if ((v38 & 1) == 0)
      {
        v44 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        v41 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35[317], "numberWithUnsignedInteger:", objc_msgSend(v37, "interfaceType")));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "suggestionID"));
          v45 = v36;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleIdentifier"));
          *(_DWORD *)buf = 138412802;
          v133 = v42;
          v134 = 2112;
          v135 = v43;
          v136 = 2112;
          v137 = v46;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Ignoring bundle with interfaceType: %@.  SuggestionID: %@, bundleID:  %@", buf, 0x20u);
          goto LABEL_35;
        }
        goto LABEL_38;
      }
      if (objc_msgSend(v37, "bundleSubType") == (id)202)
      {
        v40 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "suggestionID"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleIdentifier"));
          *(_DWORD *)buf = 138412546;
          v133 = v42;
          v134 = 2112;
          v135 = v43;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Ignoring weekly workout summary bundle. SuggestionID: %@, bundleID:  %@", buf, 0x16u);
          goto LABEL_36;
        }
        goto LABEL_38;
      }
      if (!*(_BYTE *)(a1 + 84))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "rankingDictionary"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
        objc_msgSend(v48, "floatValue");
        v50 = v49;
        v51 = *(float *)(a1 + 80);

        if (v50 < v51)
        {
          v52 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          v41 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "suggestionID"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleIdentifier"));
            v45 = v36;
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "rankingDictionary"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
            *(_DWORD *)buf = 138412802;
            v133 = v42;
            v134 = 2112;
            v135 = v43;
            v136 = 2112;
            v137 = v53;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Ignoring bundle with low goodness score. SuggestionID: %@, bundleID: %@, goodnessScore: %@", buf, 0x20u);

LABEL_35:
            v36 = v45;
LABEL_36:

LABEL_37:
          }
          goto LABEL_38;
        }
      }
      v109 = v36;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "resources"));
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v118;
        do
        {
          for (i = 0; i != v56; i = (char *)i + 1)
          {
            if (*(_QWORD *)v118 != v57)
              objc_enumerationMutation(v54);
            v59 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)i);
            v60 = *(void **)(a1 + 56);
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35[317], "numberWithUnsignedInteger:", objc_msgSend(v59, "type")));
            LOBYTE(v60) = objc_msgSend(v60, "containsObject:", v61);

            if ((v60 & 1) == 0)
            {
              v62 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              v63 = objc_claimAutoreleasedReturnValue(v62);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35[317], "numberWithUnsignedInteger:", objc_msgSend(v59, "type")));
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "suggestionID"));
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleIdentifier"));
                *(_DWORD *)buf = 138412802;
                v133 = v64;
                v134 = 2112;
                v135 = v65;
                v136 = 2112;
                v137 = v66;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "Ignoring bundle with resource type: %@.  SuggestionID: %@, bundleID:  %@", buf, 0x20u);

                v35 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
              }

            }
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
        }
        while (v56);
      }

      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "events"));
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
      if (v68)
      {
        v69 = v68;
        v70 = *(_QWORD *)v114;
        do
        {
          for (j = 0; j != v69; j = (char *)j + 1)
          {
            if (*(_QWORD *)v114 != v70)
              objc_enumerationMutation(v67);
            v72 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)j);
            v73 = *(void **)(a1 + 64);
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35[317], "numberWithUnsignedInteger:", objc_msgSend(v72, "category")));
            LOBYTE(v73) = objc_msgSend(v73, "containsObject:", v74);

            if ((v73 & 1) == 0)
            {
              v75 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              v76 = objc_claimAutoreleasedReturnValue(v75);
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35[317], "numberWithUnsignedInteger:", objc_msgSend(v72, "category")));
                v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "suggestionID"));
                v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleIdentifier"));
                *(_DWORD *)buf = 138412802;
                v133 = v77;
                v134 = 2112;
                v135 = v78;
                v136 = 2112;
                v137 = v79;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "Ignoring bundle with event category: %@.  SuggestionID: %@, bundleID:  %@", buf, 0x20u);

                v35 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
              }

            }
          }
          v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
        }
        while (v69);
      }

      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "labels"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "firstObject"));

      v8 = v105;
      v34 = v106;
      v36 = v109;
      if (v81)
      {
        v107 = objc_msgSend(v37, "hasSuggestionEngagementEvent:", CFSTR("suggestionsSelected"));
        v82 = objc_msgSend(v37, "hasSuggestionEngagementEvent:", CFSTR("suggestionsQuickAddEntry"));
        v83 = objc_msgSend(v37, "hasSuggestionEngagementEvent:", CFSTR("suggestionsDeleted"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "rankingDictionary"));
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("isBundleOrSubBundleDeleted")));
        v86 = objc_msgSend(v85, "BOOLValue");

        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "rankingDictionary"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("isBundleOrSubBundlesSelectedOrQuickAdded")));
        v89 = objc_msgSend(v88, "BOOLValue");

        if ((v107 & 1) != 0 || (v82 & 1) != 0 || (v83 & 1) != 0 || (v86 & 1) != 0 || v89)
        {
          v90 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          v91 = objc_claimAutoreleasedReturnValue(v90);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "suggestionID"));
            v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleIdentifier"));
            *(_DWORD *)buf = 138412546;
            v133 = v92;
            v134 = 2112;
            v135 = v93;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "Ignoring 'used' bundle. SuggestionID: %@, bundleID:  %@", buf, 0x16u);

          }
        }
        else
        {
          if ((objc_msgSend(*(id *)(a1 + 32), "_isBundleUserInteractive:", v37) & 1) == 0)
          {
            v94 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
            v41 = objc_claimAutoreleasedReturnValue(v94);
            v35 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
            v36 = v109;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "suggestionID"));
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleIdentifier"));
              *(_DWORD *)buf = 138412546;
              v133 = v42;
              v134 = 2112;
              v135 = v95;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Ignoring ranking ineligible bundle. SuggestionID: %@, bundleID:  %@", buf, 0x16u);

              goto LABEL_37;
            }
LABEL_38:

            goto LABEL_39;
          }
          -[NSMutableArray addObject:](v104, "addObject:", v37);
        }
        v35 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
        v36 = v109;
      }
LABEL_39:
      v36 = (char *)v36 + 1;
    }
    while (v36 != v34);
    v96 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
    v34 = v96;
  }
  while (v96);
LABEL_82:

  v97 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v98 = objc_claimAutoreleasedReturnValue(v97);
  v31 = v104;
  if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
  {
    v99 = -[NSMutableArray count](v104, "count");
    *(_DWORD *)buf = 134217984;
    v133 = v99;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "%lu new bundles found", buf, 0xCu);
  }

  -[NSMutableArray sortUsingComparator:](v104, "sortUsingComparator:", &__block_literal_global_24);
  v5 = v103;
  if (*(_BYTE *)(a1 + 85) && (unint64_t)-[NSMutableArray count](v104, "count") >= 2)
  {
    v100 = *(_QWORD *)(a1 + 72);
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v104, "objectAtIndexedSubscript:", 0));
    v129 = v101;
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v129, 1));
    (*(void (**)(uint64_t, void *, _QWORD))(v100 + 16))(v100, v102, 0);

  }
  else
  {
    (*(void (**)(_QWORD, NSMutableArray *, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v104, 0);
  }
LABEL_88:

LABEL_89:
}

int64_t __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke_487(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  int64_t v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](a2, "rankingDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v4, "rankingDictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  v13 = -1;
  if (v8 < v12)
    v13 = 1;
  if (v8 == v12)
    return 0;
  else
    return v13;
}

- (BOOL)_checkIfEligibleToPostInOnboardingPeriodUsingEventBundles:(id)a3 usingAppSchedule:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  double v23;
  float v24;
  float v25;
  char v26;
  id v28;
  char v29;
  id obj;
  MONotificationsManager *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v4 = a4;
  v6 = a3;
  v31 = self;
  v7 = -[MONotificationsManager _isUserInOnboardingPeriod:](self, "_isUserInOnboardingPeriod:", v4);
  if (!v7)
  {
    v26 = 0;
    goto LABEL_19;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v8)
  {
    v26 = 0;
    goto LABEL_18;
  }
  v9 = v8;
  v28 = v6;
  v29 = v7;
  v10 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v33 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rankingDictionary", v28));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
      if (objc_msgSend(v14, "intValue") == 1)
      {

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rankingDictionary"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
        v17 = objc_msgSend(v16, "intValue");

        if (v17 != 2)
          continue;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rankingDictionary"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
      objc_msgSend(v19, "floatValue");
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](v31, "configManager"));
      LODWORD(v23) = 1032805417;
      objc_msgSend(v22, "getFloatSettingForKey:withFallback:", CFSTR("UserNotificationOnboardingBundleGoodnessThreshold"), v23);
      v25 = v24;

      if (v21 >= v25)
      {
        v26 = 1;
        goto LABEL_16;
      }
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v9)
      continue;
    break;
  }
  v26 = 0;
LABEL_16:
  LOBYTE(v7) = v29;
  v6 = v28;
LABEL_18:

LABEL_19:
  return v26 | v7 ^ 1;
}

- (BOOL)_checkIfEligibleForOpportunisticScheduledNotificationUsingEventBundles:(id)a3 withTrigger:(id)a4 usingAppSchedule:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  id v18;
  void *v19;
  double v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  void *v40;
  double v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  uint8_t buf[4];
  NSObject *v51;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5 && objc_msgSend(v8, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionID"));
      *(_DWORD *)buf = 138412290;
      v51 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Check if eligible for opportunistic notification for suggID: %@", buf, 0xCu);

    }
    v14 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    if (+[JournalAppSettingsUtilities BOOLForKey:](JournalAppSettingsUtilities, "BOOLForKey:", CFSTR("streakReminderEnabled")))
    {
      v15 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. Streak notifications are turned on.", buf, 2u);
      }
      v17 = 0;
      goto LABEL_51;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
    LODWORD(v20) = 1041865114;
    objc_msgSend(v19, "getFloatSettingForKey:withFallback:", CFSTR("UserNotificationScheduledOpportunisticGoodnessScoreThreshold"), v20);
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "rankingDictionary"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));

    -[NSObject floatValue](v16, "floatValue");
    if (v25 < v22)
    {
      v26 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v16;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. Goodness score too low: %@", buf, 0xCu);
      }
      v17 = 0;
      goto LABEL_50;
    }
    v27 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextTriggerDate"));
    if (v28)
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextTriggerDate"));
    else
      v29 = v14;
    v30 = v29;

    if (-[NSObject isDateInToday:](v27, "isDateInToday:", v30))
    {
      v31 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. There is already been another notification scheduled today.", buf, 2u);
      }
      v17 = 0;
      goto LABEL_49;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("UserNotificationRecentUnscheduledNotificationDate")));

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("UserNotificationOlderUnscheduledNotificationDate")));

    v35 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    if (v32 && (v36 = v32, (-[NSObject isBeforeDate:](v32, "isBeforeDate:", v14) & 1) != 0)
      || (v36 = v49) != 0 && -[NSObject isBeforeDate:](v49, "isBeforeDate:", v14))
    {
      v37 = v36;

      v35 = v37;
    }
    if ((-[NSObject isDateInToday:](v27, "isDateInToday:", v35) & 1) != 0
      || -[NSObject isDateInYesterday:](v27, "isDateInYesterday:", v35))
    {
      v38 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. There has already been another system notification recently.", buf, 2u);
      }
      v17 = 0;
      goto LABEL_48;
    }
    v48 = v30;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("UserNotificationLastScheduledOpportunisticPostingDate")));

    if (v39
      && -[NSObject isBeforeDate:](v39, "isBeforeDate:", v14)
      && (-[NSObject timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", v39), v41 < 604800.0))
    {
      v42 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      v47 = v43;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. There has already been another opportunistic notification this week.", buf, 2u);
      }
      v17 = 0;
    }
    else
    {
      v47 = objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getNextScheduledOpportunisticNotificationDate](self, "_getNextScheduledOpportunisticNotificationDate"));
      if (-[NSObject isDateInTomorrow:](v27, "isDateInTomorrow:"))
      {
        v30 = v48;
        if (-[NSObject isDateInTomorrow:](v27, "isDateInTomorrow:", v48))
        {
          v44 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. Next available opportunistic time is tomorrow, and there is a scheduled notification for tomorrow.", buf, 2u);
          }

          v17 = 0;
        }
        else
        {
          v17 = 1;
        }
        goto LABEL_47;
      }
      v17 = 1;
    }
    v30 = v48;
LABEL_47:

LABEL_48:
LABEL_49:

LABEL_50:
LABEL_51:

    goto LABEL_52;
  }
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v14 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. App schedule not set or no bundles available", buf, 2u);
  }
  v17 = 0;
LABEL_52:

  return v17;
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:(id)a3 withTrigger:(id)a4 usingAppSchedule:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id os_log;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  NSObject *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  uint64_t v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  NSMutableDictionary *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSMutableDictionary *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  unsigned int v112;
  MONotificationsManager *v113;
  void *v114;
  id v115;
  void (**v116)(_QWORD);
  unsigned int v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  id obj;
  _QWORD v132[5];
  id v133;
  id v134;
  id v135;
  NSMutableDictionary *v136;
  void (**v137)(_QWORD);
  char v138;
  char v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t buf[4];
  id v145;
  __int16 v146;
  void *v147;
  __int16 v148;
  uint64_t v149;
  _BYTE v150[128];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  v13 = v11;
  v14 = objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getCurrentSystemDefaultActionURL](self, "_getCurrentSystemDefaultActionURL"));
  if (v14)
  {
    v15 = (void *)v14;
    if (MomentsLibraryCore(0)
      && (v16 = objc_alloc(getMOPromptManagerClass()),
          v18 = objc_opt_class(MOEvent, v17),
          (v20 = objc_msgSend(v16, "initForSoftLinkwithMOEventClass:moEventBundleClass:", v18, objc_opt_class(MOEventBundle, v19))) != 0))
    {
      v21 = v20;
      if (-[MONotificationsManager _checkIfEligibleToPostInOnboardingPeriodUsingEventBundles:usingAppSchedule:](self, "_checkIfEligibleToPostInOnboardingPeriodUsingEventBundles:usingAppSchedule:", v10, v7))
      {
        v143 = 0u;
        v141 = 0u;
        v142 = 0u;
        v140 = 0u;
        v111 = v10;
        obj = v10;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
        v115 = v13;
        v116 = v12;
        v113 = self;
        v114 = v21;
        v112 = v7;
        if (!v22)
        {
          v49 = 0;
          v29 = 0;
          v35 = 0;
          goto LABEL_46;
        }
        v23 = v22;
        v122 = 0;
        v127 = 0;
        v24 = *(_QWORD *)v141;
LABEL_7:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v141 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "labels"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));

          if (v29)
          {
            if ((objc_msgSend(v29, "containsString:", CFSTR("{time}")) & 1) != 0
              || (objc_msgSend(v29, "containsString:", CFSTR("{place")) & 1) != 0
              || (objc_msgSend(v29, "containsString:", CFSTR("{action")) & 1) != 0
              || (objc_msgSend(v29, "containsString:", CFSTR("{unique_")) & 1) != 0
              || (objc_msgSend(v29, "containsString:", CFSTR("{city")) & 1) != 0
              || objc_msgSend(v29, "containsString:", CFSTR("{date_")))
            {
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              v31 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v145 = v127;
                _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Label potentially contains eng text: %@", buf, 0xCu);
              }
            }
            else
            {
              v35 = v127;
              if (v127)
              {
                v13 = v115;
                self = v113;
                v21 = v114;
LABEL_45:
                v7 = v112;
                v49 = v122;
LABEL_46:

                v50 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                v51 = objc_claimAutoreleasedReturnValue(v50);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                  -[MONotificationsManager _postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:].cold.4();

                if (v35)
                {
                  v52 = v13;
                  v128 = v35;
                  v117 = -[MONotificationsManager _checkIfEligibleForOpportunisticScheduledNotificationUsingEventBundles:withTrigger:usingAppSchedule:](self, "_checkIfEligibleForOpportunisticScheduledNotificationUsingEventBundles:withTrigger:usingAppSchedule:", obj, v13, v7);
                  if (v117)
                  {
                    v125 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getOpportunisticNotificationTrigger](self, "_getOpportunisticNotificationTrigger"));

                    v53 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                    v54 = objc_claimAutoreleasedReturnValue(v53);
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                    {
                      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "nextTriggerDate"));
                      *(_DWORD *)buf = 138412290;
                      v145 = v55;
                      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Eligible for opportunistic posting; updating the trigger posting time to: %@",
                        buf,
                        0xCu);

                    }
                    v52 = v125;
                  }
                  v124 = v49;
                  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
                  v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "nextTriggerDate"));
                  v59 = v52;
                  v60 = (void *)v58;
                  v126 = v59;
                  v108 = v57;
                  if (v58)
                    v61 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "nextTriggerDate"));
                  else
                    v61 = v57;
                  v64 = v61;

                  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "dateByAddingUnit:value:toDate:options:", 16, -1, v64, 0));
                  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("“%@”")));
                  v66 = objc_msgSend(v124, "interfaceType");
                  v67 = 0;
                  v109 = v56;
                  v119 = v64;
                  v121 = v65;
                  if (v66 == (id)13)
                    goto LABEL_70;
                  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "startDate"));
                  if (objc_msgSend(v56, "isDate:inSameDayAsDate:", v68, v64))
                  {

                    goto LABEL_64;
                  }
                  v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "startDate"));
                  v70 = v56;
                  v71 = (void *)v69;
                  v72 = objc_msgSend(v70, "isDate:inSameDayAsDate:", v69, v110);

                  if ((v72 & 1) != 0)
                  {
LABEL_64:
                    v67 = 0;
                    v65 = v121;
                  }
                  else
                  {
                    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "startDate"));
                    v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "getBundleRelativeDate"));

                    v65 = v121;
                    objc_msgSend(v121, "appendString:", CFSTR(" on "));
                    objc_msgSend(v121, "appendString:", v74);
                    v67 = (void *)v74;
                  }
                  if (!v29)
                  {
LABEL_70:
                    v107 = v67;
                    objc_msgSend(v65, "appendString:", CFSTR(". Take some time to write."));
                  }
                  else
                  {
                    v107 = v67;
                    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedString:withTable:", CFSTR("NUM_MOMENTS_NOTIFICATION_FORMAT"), CFSTR("Localizable")));
                    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v75, (char *)objc_msgSend(obj, "count") - 1));
                    objc_msgSend(v121, "appendString:", CFSTR(" and %@. Take some time to write."));

                    if (v76)
                    {
                      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:", v121));
                      v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v77, v128, v76));

                      goto LABEL_72;
                    }
                    v65 = v121;
                  }
                  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:", v65));
                  v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v76, v128));
LABEL_72:

                  if (objc_msgSend(obj, "count") == (id)1)
                    v78 = CFSTR("New Journaling Suggestion");
                  else
                    v78 = CFSTR("New Journaling Suggestions");
                  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:", v78));
                  v79 = 1;
                  if ((_DWORD)v7)
                    v79 = 2;
                  if (v117)
                    v79 = 3;
                  v101 = v79;
                  v80 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v15, 0);
                  v81 = objc_alloc((Class)NSMutableArray);
                  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "queryItems"));
                  v83 = objc_msgSend(v81, "initWithArray:", v82);

                  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndexedSubscript:", 0));
                  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "suggestionID"));
                  v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "UUIDString"));

                  v103 = (void *)v86;
                  v104 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("suggestionID"), v86);
                  v105 = v83;
                  objc_msgSend(v83, "addObject:", v104);
                  objc_msgSend(v80, "setQueryItems:", v83);
                  v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "URL"));

                  v87 = objc_opt_new(NSMutableDictionary);
                  -[NSMutableDictionary setObject:forKey:](v87, "setObject:forKey:", v86, CFSTR("suggestionID"));
                  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndexedSubscript:", 0));
                  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "bundleIdentifier"));
                  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "UUIDString"));
                  -[NSMutableDictionary setObject:forKey:](v87, "setObject:forKey:", v90, CFSTR("bundleID"));

                  -[NSMutableDictionary setObject:forKey:](v87, "setObject:forKey:", v64, CFSTR("postingDate"));
                  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count")));
                  -[NSMutableDictionary setObject:forKey:](v87, "setObject:forKey:", v91, CFSTR("numSuggestionInNotification"));

                  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndexedSubscript:", 0));
                  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "endDate"));
                  -[NSMutableDictionary setObject:forKey:](v87, "setObject:forKey:", v93, CFSTR("bundleEndDate"));

                  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v101));
                  -[NSMutableDictionary setObject:forKey:](v87, "setObject:forKey:", v94, CFSTR("postingScheduleType"));

                  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndexedSubscript:", 0));
                  v96 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager createBundleInformationForAnalyticsWithBundle:](v113, "createBundleInformationForAnalyticsWithBundle:", v95));

                  -[NSMutableDictionary setObject:forKey:](v87, "setObject:forKey:", v96, CFSTR("analyticsDict"));
                  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getCurrentApplicationIcon](v113, "_getCurrentApplicationIcon"));
                  v132[0] = _NSConcreteStackBlock;
                  v132[1] = 3221225472;
                  v132[2] = __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke;
                  v132[3] = &unk_1002B29B0;
                  v132[4] = v113;
                  v45 = v126;
                  v133 = v45;
                  v134 = v108;
                  v138 = v117;
                  v135 = obj;
                  v136 = v87;
                  v139 = v112;
                  v12 = v116;
                  v137 = v116;
                  v98 = v87;
                  v99 = v108;
                  LOBYTE(v100) = 1;
                  v15 = (void *)v102;
                  -[MONotificationsManager _postNotificationWithTitle:message:defaultActionURL:notificationIdentifier:withIcon:usingTrigger:useSubordinateIcon:userInfo:handler:](v113, "_postNotificationWithTitle:message:defaultActionURL:notificationIdentifier:withIcon:usingTrigger:useSubordinateIcon:userInfo:handler:", v106, v130, v102, CFSTR("moments-time-to-write"), v97, v45, v100, v98, v132);

                  v21 = v114;
                  v13 = v115;
                  v35 = v128;
                  v49 = v124;

                }
                else
                {
                  v62 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                  v63 = objc_claimAutoreleasedReturnValue(v62);
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                    -[MONotificationsManager _postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:].cold.3();

                  if (v12)
                  {
                    v129 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getGenericNotificationErrorWithReason:](self, "_getGenericNotificationErrorWithReason:", CFSTR("Expecting valid bundle for notification")));
                    v12[2](v12);
                    v45 = v13;

                  }
                  else
                  {
                    v45 = v13;
                  }
                }

                v10 = v111;
LABEL_40:

LABEL_41:
                goto LABEL_42;
              }
              v127 = v29;
              v36 = v26;

              v37 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              v31 = objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "suggestionID"));
                v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bundleIdentifier"));
                v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "rankingDictionary"));
                v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
                *(_DWORD *)buf = 138412802;
                v145 = v123;
                v146 = 2112;
                v147 = v118;
                v148 = 2112;
                v149 = v38;
                v39 = (void *)v38;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Top bundle in notification. SuggestionID: %@, bundleID:  %@, goodnessScore: %@", buf, 0x20u);

              }
              v122 = v36;
            }
          }
          else
          {
            v32 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
            v31 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "suggestionID"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundleIdentifier"));
              *(_DWORD *)buf = 138412546;
              v145 = v33;
              v146 = 2112;
              v147 = v34;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Ignoring top bundle. SuggestionID: %@, bundleID:  %@", buf, 0x16u);

            }
          }

          if (v23 == (id)++v25)
          {
            v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
            v23 = v40;
            if (!v40)
            {
              v29 = 0;
              v13 = v115;
              self = v113;
              v21 = v114;
              v35 = v127;
              goto LABEL_45;
            }
            goto LABEL_7;
          }
        }
      }
      v46 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Didn't find a good enough bundle to notify during onboarding.", buf, 2u);
      }

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getGenericNotificationErrorWithReason:](self, "_getGenericNotificationErrorWithReason:", CFSTR("Didn't find a good enough bundle to notify during onboarding.")));
      ((void (*)(void (**)(_QWORD), void *))v12[2])(v12, v48);

    }
    else
    {
      v41 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[MONotificationsManager _postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:].cold.2();

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getMomentsFrameworkNotAvailableNotificationsError](self, "_getMomentsFrameworkNotAvailableNotificationsError"));
      ((void (*)(void (**)(_QWORD), void *))v12[2])(v12, v21);
    }
    v45 = v13;
    goto LABEL_40;
  }
  v43 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    -[MONotificationsManager _postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:].cold.1();

  v45 = v13;
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getGenericNotificationErrorWithReason:](self, "_getGenericNotificationErrorWithReason:", CFSTR("Empty action URL")));
    ((void (*)(void (**)(_QWORD), void *))v12[2])(v12, v15);
    v45 = v13;
    goto LABEL_41;
  }
LABEL_42:

}

void __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "System notification posted, error: %@", buf, 0xCu);

  }
  if (!v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("UserNotificationRecentUnscheduledNotificationDate")));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
      objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("UserNotificationOlderUnscheduledNotificationDate"));

    }
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke_cold_1(a1, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nextTriggerDate"));
    if (v12)
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nextTriggerDate"));
    else
      v13 = *(id *)(a1 + 48);
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("UserNotificationRecentUnscheduledNotificationDate"));

    if (*(_BYTE *)(a1 + 80))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
      objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("UserNotificationLastScheduledOpportunisticPostingDate"));

    }
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 64);
    v19 = *(void **)(a1 + 32);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nextTriggerDate"));
    objc_msgSend(v19, "submitNotificationEngagementEventAnalyticsForBundles:userInfo:fromTrigger:withPostingDate:", v17, v18, 0, v20);

    objc_msgSend(*(id *)(a1 + 32), "submitEngagementHistoryUpdateWithEvent:userInfo:", CFSTR("suggestionNotificationQueued"), *(_QWORD *)(a1 + 64));
  }
  if (*(_BYTE *)(a1 + 81))
  {
    v21 = *(void **)(a1 + 32);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nextTriggerDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_getNextNotificationDateComponentsWithOptions:afterDate:numWeeks:setComponents:", 1, v22, 2, 0));

    v24 = *(void **)(a1 + 32);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke_535;
    v26[3] = &unk_1002B1800;
    v27 = *(id *)(a1 + 72);
    objc_msgSend(v24, "setupFallbackAppBrandedNotificationsWithDateComponents:handler:", v23, v26);

  }
  else
  {
    v25 = *(_QWORD *)(a1 + 72);
    if (v25)
      (*(void (**)(uint64_t, id))(v25 + 16))(v25, v3);
  }

}

uint64_t __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke_535(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_isEligibleForUnscheduledNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  id os_log;
  NSObject *v12;
  BOOL v13;
  id v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("UserNotificationRecentUnscheduledNotificationDate")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("UserNotificationOlderUnscheduledNotificationDate")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getNextUnscheduledNotificationDate](self, "_getNextUnscheduledNotificationDate"));
    v9 = v8;
    if (v7
      && (objc_msgSend(v8, "timeIntervalSinceDate:", v7), v10 < 604800.0)
      && objc_msgSend(v5, "isBeforeDate:", v3))
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      v12 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Already 2 notifications in the last week. Ineligible for new notification", v16, 2u);
      }

      v13 = 0;
    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v7 = objc_claimAutoreleasedReturnValue(v14);
    v13 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No set default for last notification date. Eligible for new notification", buf, 2u);
    }
  }

  return v13;
}

- (id)_getNextScheduledCalendarNotificationTrigger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getNextNotificationDateComponentsWithOptions:afterDate:numWeeks:setComponents:](self, "_getNextNotificationDateComponentsWithOptions:afterDate:numWeeks:setComponents:", 1, v3, 1, 0));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNCalendarNotificationTrigger triggerWithDateMatchingComponents:repeats:](UNCalendarNotificationTrigger, "triggerWithDateMatchingComponents:repeats:", v5, 0));
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }

  return v6;
}

- (id)_getCurrentApplicationIcon
{
  return +[UNNotificationIcon iconForApplicationIdentifier:](UNNotificationIcon, "iconForApplicationIdentifier:", CFSTR("com.apple.journal"));
}

- (void)_postNotificationWithTitle:(id)a3 message:(id)a4 defaultActionURL:(id)a5 notificationIdentifier:(id)a6 withIcon:(id)a7 usingTrigger:(id)a8 useSubordinateIcon:(BOOL)a9 userInfo:(id)a10 handler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  UNMutableNotificationContent *v25;
  id v26;
  UNMutableNotificationContent *v27;
  id v28;
  void *v29;
  void *v30;
  id os_log;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  v36 = v18;
  if (-[MONotificationsManager _userConsentCompleted](self, "_userConsentCompleted"))
  {
    -[MONotificationsManager _clearAllNotifications](self, "_clearAllNotifications");
    v25 = objc_opt_new(UNMutableNotificationContent);
    v26 = v17;
    v27 = v25;
    v35 = v26;
    -[UNMutableNotificationContent setTitle:](v25, "setTitle:");
    -[UNMutableNotificationContent setBody:](v27, "setBody:", v18);
    v28 = v21;
    -[UNMutableNotificationContent setIcon:](v27, "setIcon:", v21);
    -[UNMutableNotificationContent setDefaultActionURL:](v27, "setDefaultActionURL:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
    -[UNMutableNotificationContent setSound:](v27, "setSound:", v29);

    -[UNMutableNotificationContent setShouldShowSubordinateIcon:](v27, "setShouldShowSubordinateIcon:", a9);
    -[UNMutableNotificationContent setCategoryIdentifier:](v27, "setCategoryIdentifier:", CFSTR("com.apple.momentsd.MOUserNotifications"));
    -[UNMutableNotificationContent setUserInfo:](v27, "setUserInfo:", v23);
    -[UNMutableNotificationContent setShouldBackgroundDefaultAction:](v27, "setShouldBackgroundDefaultAction:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v20, v27, v22));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v32 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v22;
      v39 = 2112;
      v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "MOUserNotification requested, trigger, %@, actionUrl, %@", buf, 0x16u);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager userNotificationCenterSystemBranded](self, "userNotificationCenterSystemBranded"));
    objc_msgSend(v33, "addNotificationRequest:withCompletionHandler:", v30, v24);

    v17 = v35;
    v21 = v28;
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager _getOnboardingNotCompleteNotificationsError](self, "_getOnboardingNotCompleteNotificationsError"));
    (*((void (**)(id, void *))v24 + 2))(v24, v34);

  }
}

- (void)_clearAllNotifications
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "UserNotification getPendingNotificationRequest timed-out for analytics", v1, 2u);
  OUTLINED_FUNCTION_2_2();
}

void __48__MONotificationsManager__clearAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("postingDate")));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Clearing Moments notifications", v11, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userNotificationCenterSystemBranded"));
    objc_msgSend(v10, "removeAllPendingNotificationRequests");

    objc_msgSend(*(id *)(a1 + 32), "submitNotificationEngagementEventAnalyticsForBundles:userInfo:fromTrigger:withPostingDate:", 0, v6, 1, v7);
    objc_msgSend(*(id *)(a1 + 32), "submitEngagementHistoryUpdateWithEvent:userInfo:", CFSTR("suggestionNotificationDequeued"), v6);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id os_log;
  NSObject *v15;
  void *v16;
  unsigned __int8 v17;
  __CFString **v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  int v22;
  void *v23;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "request"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "content"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("postingDate")));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v22 = 138412290;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "didReceiveNotificationResponse triggred with info %@", (uint8_t *)&v22, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionIdentifier"));
  v17 = objc_msgSend(v16, "isEqualToString:", UNNotificationDismissActionIdentifier);

  if ((v17 & 1) != 0)
  {
    v18 = MOSuggestionEngagementEventNotificationDismissed;
    v19 = 3;
LABEL_7:
    -[MONotificationsManager submitNotificationEngagementEventAnalyticsForBundles:userInfo:fromTrigger:withPostingDate:](self, "submitNotificationEngagementEventAnalyticsForBundles:userInfo:fromTrigger:withPostingDate:", 0, v12, v19, v13);
    -[MONotificationsManager submitEngagementHistoryUpdateWithEvent:userInfo:](self, "submitEngagementHistoryUpdateWithEvent:userInfo:", *v18, v12);
    goto LABEL_8;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionIdentifier"));
  v21 = objc_msgSend(v20, "isEqualToString:", UNNotificationDefaultActionIdentifier);

  if (v21)
  {
    v18 = MOSuggestionEngagementEventNotificationTapped;
    v19 = 4;
    goto LABEL_7;
  }
LABEL_8:
  v8[2](v8);

}

- (unint64_t)_MOStatusFromUNStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
    return 0;
  else
    return a3;
}

- (unint64_t)getAppNotificationAuthorizationStatus
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  unint64_t v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager userNotificationCenterAppBranded](self, "userNotificationCenterAppBranded"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __63__MONotificationsManager_getAppNotificationAuthorizationStatus__block_invoke;
  v9[3] = &unk_1002B2A00;
  v11 = &v12;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[MONotificationsManager checkAuthorizationStatusForNotificationCenter:completion:](self, "checkAuthorizationStatusForNotificationCenter:completion:", v4, v9);

  v6 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v5, v6);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__MONotificationsManager_getAppNotificationAuthorizationStatus__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_MOStatusFromUNStatus:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (unint64_t)getSystemNotificationAuthorizationStatus
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  unint64_t v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager userNotificationCenterSystemBranded](self, "userNotificationCenterSystemBranded"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __66__MONotificationsManager_getSystemNotificationAuthorizationStatus__block_invoke;
  v9[3] = &unk_1002B2A00;
  v11 = &v12;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[MONotificationsManager checkAuthorizationStatusForNotificationCenter:completion:](self, "checkAuthorizationStatusForNotificationCenter:completion:", v4, v9);

  v6 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v5, v6);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __66__MONotificationsManager_getSystemNotificationAuthorizationStatus__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_MOStatusFromUNStatus:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (int64_t)getNotificationScheduledDeliverySetting
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  int64_t v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager userNotificationCenterSystemBranded](self, "userNotificationCenterSystemBranded"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __65__MONotificationsManager_getNotificationScheduledDeliverySetting__block_invoke;
  v9[3] = &unk_1002B2A28;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "getNotificationSettingsWithCompletionHandler:", v9);

  v6 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v5, v6);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __65__MONotificationsManager_getNotificationScheduledDeliverySetting__block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "scheduledDeliverySetting");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)createBundleInformationForAnalyticsWithBundle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("bundleID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, CFSTR("suggestionID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "interfaceType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("interfaceType"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "bundleSubType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, CFSTR("subType"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "bundleSuperType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("superType"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
  objc_msgSend(v14, "floatValue");
  *(float *)&v16 = v15 * 10000.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, CFSTR("goodnessScore"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 60, v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v19, "year")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v20, CFSTR("suggestionEndDateYear"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v19, "month")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v21, CFSTR("suggestionEndDateMonth"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v19, "day")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v22, CFSTR("suggestionEndDateDay"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v19, "hour")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v23, CFSTR("suggestionEndDateHour"));

  return v4;
}

- (void)submitNotificationEngagementEventAnalyticsForBundles:(id)a3 userInfo:(id)a4 fromTrigger:(unint64_t)a5 withPostingDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  id os_log;
  NSObject *v24;
  void *v25;
  unint64_t v26;
  id v27;
  NSMutableDictionary *v28;
  void *v29;
  id v30;
  double v31;
  __CFString **v32;
  id v33;
  NSObject *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  BOOL v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  float v55;
  float v56;
  double v57;
  _BOOL8 v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint8_t buf[4];
  NSMutableDictionary *v76;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_opt_new(NSMutableDictionary);
  v14 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v73 = (void *)v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "components:fromDate:", 124, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "year")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, CFSTR("submissionTimeYear"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "month")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v17, CFSTR("submissionTimeMonth"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "day")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v18, CFSTR("submissionTimeDay"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "hour")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v19, CFSTR("submissionTimeHour"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "minute")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v20, CFSTR("submissionTimeMinute"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v21, CFSTR("notificationEventTrigger"));

  v72 = v12;
  if (v10 && objc_msgSend(v10, "count"))
  {
    v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary endDate](v22, "endDate"));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary suggestionID](v22, "suggestionID"));
      v70 = v15;
      v26 = a5;
      v27 = v10;
      v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
      *(_DWORD *)buf = 138412290;
      v76 = v28;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "submit Notification engagement for suggID: %@", buf, 0xCu);

      v10 = v27;
      a5 = v26;
      v15 = v70;

      v12 = v72;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager createBundleInformationForAnalyticsWithBundle:](self, "createBundleInformationForAnalyticsWithBundle:", v22));
    -[NSMutableDictionary addEntriesFromDictionary:](v13, "addEntriesFromDictionary:", v29);
    if (!a5 && v12)
    {
      v30 = v10;
      objc_msgSend(v12, "timeIntervalSinceDate:", v73);
      v32 = kMONotifications_queuePostingLatency;
LABEL_15:
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", vcvtmd_s64_f64(v31 / 60.0)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v35, *v32);

      v10 = v30;
      v12 = v72;
    }
  }
  else
  {
    v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("suggestionID")));
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v22;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "submit Notification engagement using userInfo for suggID: %@", buf, 0xCu);
    }

    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("bundleEndDate")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("analyticsDict")));
    if (v29)
      -[NSMutableDictionary addEntriesFromDictionary:](v13, "addEntriesFromDictionary:", v29);
    if (v12 && a5 - 3 <= 1)
    {
      v30 = v10;
      objc_msgSend(v73, "timeIntervalSinceDate:", v12);
      v32 = kMONotifications_engagementNotificationLatency;
      goto LABEL_15;
    }
  }

  if (v12 && v74)
  {
    objc_msgSend(v12, "timeIntervalSinceDate:", v74);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", vcvtmd_s64_f64(v36 / 60.0)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v37, CFSTR("suggestionNotificationLatency"));

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("UserNotificationScheduleInMinutesArray")));

  v40 = objc_msgSend(v39, "count");
  v41 = v40;
  if (v39)
    v42 = v40 == 0;
  else
    v42 = 1;
  v43 = !v42;
  v44 = objc_msgSend(v39, "isEqualToArray:", &off_1002DC740);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v43));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v45, CFSTR("hasJournalSchedule"));

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v44));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v46, CFSTR("isOnDefaultNotificationSchedule"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v41));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v47, CFSTR("numScheduledDays"));

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MONotificationsManager getNotificationScheduledDeliverySetting](self, "getNotificationScheduledDeliverySetting")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v48, CFSTR("scheduledDeliverySetting"));

  if (v11)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("postingScheduleType")));

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("postingScheduleType")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v50, CFSTR("postingScheduleType"));

    }
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager defaultsManager](self, "defaultsManager"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKey:", CFSTR("OnboardingDate")));

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  LODWORD(v54) = 14.0;
  objc_msgSend(v53, "getFloatSettingForKey:withFallback:", CFSTR("UserNotificationMaximumDaysForOnboarding"), v54);
  v56 = v55;

  v58 = 0;
  if (v52)
  {
    objc_msgSend(v73, "timeIntervalSinceDate:", v52);
    if (v57 < (float)(v56 * 86400.0))
      v58 = 1;
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v58));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v59, CFSTR("recentOnboarding"));

  if (v11)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("numSuggestionInNotification")));

    if (v60)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("numSuggestionInNotification")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v61, CFSTR("numSuggestionInNotification"));

    }
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager configManager](self, "configManager"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "getTrialExperimentIdentifiers"));

  if (v63)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "experimentId"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v64, CFSTR("trialExperimentId"));

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v63, "deploymentId")));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "stringValue"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v66, CFSTR("trialDeploymentId"));

    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "treatmentId"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v67, CFSTR("trialTreatmentId"));

  }
  AnalyticsSendEvent(CFSTR("com.apple.Moments.Notifications"), v13);
  v68 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v69 = objc_claimAutoreleasedReturnValue(v68);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v76 = v13;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "Notification analytics submitted: %{private}@", buf, 0xCu);
  }

}

- (id)getBiomeContextDictionaryWithUserInfo:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", CFSTR("com.apple.momentsd.MOUserNotifications"), CFSTR("clientIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("numSuggestionInNotification")));
  if (v5)
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, CFSTR("numSuggestionInNotification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("postingDate")));
  if (v6)
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, CFSTR("postingDate"));

  return v4;
}

- (void)submitEngagementHistoryUpdateWithEvent:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  MOEventBundleFetchOptions *v12;
  void *v13;
  MOEventBundleFetchOptions *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("bundleID")));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager onboardingAndSettingsPersistence](self, "onboardingAndSettingsPersistence"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getSnapshotDictionaryForAnalytics"));

    v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v8);
    v12 = [MOEventBundleFetchOptions alloc];
    v21 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v14 = -[MOEventBundleFetchOptions initWithIdentifiers:ascending:filterBundle:](v12, "initWithIdentifiers:ascending:filterBundle:", v13, 0, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MONotificationsManager eventBundleManager](self, "eventBundleManager"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __74__MONotificationsManager_submitEngagementHistoryUpdateWithEvent_userInfo___block_invoke;
    v17[3] = &unk_1002B2A50;
    v17[4] = self;
    v18 = v7;
    v19 = v6;
    v20 = v10;
    v16 = v10;
    objc_msgSend(v15, "fetchEventBundlesWithOptions:CompletionHandler:", v14, v17);

  }
}

void __74__MONotificationsManager_submitEngagementHistoryUpdateWithEvent_userInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getBiomeContextDictionaryWithUserInfo:", *(_QWORD *)(a1 + 40)));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("eventBundles"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getTrialExperimentIdentifiers"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "engagementHistoryManager"));
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v6, "didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:", v7, v9, v8, v3, v5, *(_QWORD *)(a1 + 56));

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (UNUserNotificationCenter)userNotificationCenterSystemBranded
{
  return self->_userNotificationCenterSystemBranded;
}

- (void)setUserNotificationCenterSystemBranded:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenterSystemBranded, a3);
}

- (UNUserNotificationCenter)userNotificationCenterAppBranded
{
  return self->_userNotificationCenterAppBranded;
}

- (void)setUserNotificationCenterAppBranded:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenterAppBranded, a3);
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (MOConfigurationManager)configManager
{
  return self->_configManager;
}

- (MOEngagementHistoryManager)engagementHistoryManager
{
  return self->_engagementHistoryManager;
}

- (MOEventBundleManager)eventBundleManager
{
  return self->_eventBundleManager;
}

- (void)setEventBundleManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventBundleManager, a3);
}

- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence
{
  return self->_onboardingAndSettingsPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingAndSettingsPersistence, 0);
  objc_storeStrong((id *)&self->_eventBundleManager, 0);
  objc_storeStrong((id *)&self->_engagementHistoryManager, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_userNotificationCenterAppBranded, 0);
  objc_storeStrong((id *)&self->_userNotificationCenterSystemBranded, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __83__MONotificationsManager_checkAuthorizationStatusForNotificationCenter_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Notifications authorization status: %lu", v2);
  OUTLINED_FUNCTION_1();
}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "System notifications not authorized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_394_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "Bundle fetch error: %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Requesting test notification bundles", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "targetIdentifiers: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_419_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[14];
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count")));
  OUTLINED_FUNCTION_10();
  v7 = a1;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, a2, v5, "using %@ test identifiers: %@", v6);

}

- (void)setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:(uint64_t)a1 options:(NSObject *)a2 handler:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a1));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "Scheduled notification time out of week range. dateInMinutes: %@", v5);

  OUTLINED_FUNCTION_5();
}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "No date components set for fallback notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "App branded notification unauthorized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_442_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v4, "Fallback app repeating trigger scheduled, error: %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_getArrayScheduledDateComponents
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "No set scheduled stored", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Requesting event bundles from Prompt Manager (to self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Lookback window onboarding start date is after NOW, use default start date to define lookback window instead, %@", v2);
  OUTLINED_FUNCTION_1();
}

void __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Not enough non-evergreen bundles to notify user during onboarding period.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Can't get action URL for system moments notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "Soft link Moments framework skipped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Won't post time to write notification for 'empty label' bundles", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:.cold.4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;

  OUTLINED_FUNCTION_10();
  v3 = v0;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, v1, (uint64_t)v1, "1st label: %@, 2nd: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nextTriggerDate"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v4, "trigger.nextTriggerDate: %@", v5);

  OUTLINED_FUNCTION_5();
}

@end
