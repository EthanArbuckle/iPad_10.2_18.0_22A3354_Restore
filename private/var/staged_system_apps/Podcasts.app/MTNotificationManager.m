@implementation MTNotificationManager

- (BOOL)autoSimulateNotificationOnAppActivate
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("MTDebugNotificationUI-SimulateOnAppActivate"));

  return +[IMRuntimeUtil associatedBoolValueForKey:onObject:withDefault:](IMRuntimeUtil, "associatedBoolValueForKey:onObject:withDefault:", CFSTR("MTAutoSimulateNotificationOnAppActivate"), self, v4);
}

- (void)setUpNotificationStatusIsAuthorizedUpdates
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = MTApplicationDidBecomeActiveNotification;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v4 = objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v2, 0, v3, &stru_1004A6720);

}

- (MTNotificationManager)init
{
  MTNotificationManager *v2;
  MTNotificationManager *v3;
  objc_class *v4;
  NSString *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTNotificationManager;
  v2 = -[MTNotificationManager init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v5));
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

    -[MTNotificationManager setUpNotificationStatusIsAuthorizedUpdates](v3, "setUpNotificationStatusIsAuthorizedUpdates");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    objc_msgSend(v9, "setDelegate:", v3);

  }
  return v3;
}

- (void)requestNotificationPermissionsIfNeeded
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory mt_allSupportedNotificationCategories](UNNotificationCategory, "mt_allSupportedNotificationCategories"));
  objc_msgSend(v2, "setNotificationCategories:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v4, "requestAuthorizationWithOptions:completionHandler:", 38, &stru_1004A67A0);

}

- (BOOL)canPromptForNotificationPermissionsWithPreWarmSheet
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", kMTDidPromptForNotificationsPermissionsKey);

  if (v3)
  {
    v5 = _MTLogCategoryNotifications(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User was already prompted for notification permissions. Not showing pre-warming sheet.", buf, 2u);
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", kMTNotificationsPreWarmSheetShownDateKey));

  if (v6)
  {
    v8 = objc_alloc_init((Class)NSDate);
    v9 = objc_msgSend(v8, "timeIntervalSinceDate:", v6);
    if (fabs(v10) < 432000.0)
    {
      v12 = _MTLogCategoryNotifications(v9);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "User was shown the pre-warming sheet within the last five days. Not showing pre-warming sheet.", v15, 2u);
      }

      goto LABEL_11;
    }

  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (void)requestNotificationPermissionsWithPreWarmSheetIfNeeded
{
  void *v3;
  _QWORD v4[5];

  if (-[MTNotificationManager canPromptForNotificationPermissionsWithPreWarmSheet](self, "canPromptForNotificationPermissionsWithPreWarmSheet"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSUserNotificationAuthorizationTask engagementRequestForFullSheet](AMSUserNotificationAuthorizationTask, "engagementRequestForFullSheet"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100052224;
    v4[3] = &unk_1004A6850;
    v4[4] = self;
    objc_msgSend(v3, "addFinishBlock:", v4);

  }
}

- (id)preWarmSheetMetricsOverlayDictionary
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v2 = objc_alloc_init((Class)_TtC8ShelfKit26UniversalMetricsDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionary"));
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pageContext"));
  v7 = (void *)v6;
  v8 = &stru_1004C6D40;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("pageContext"));
  objc_msgSend(v4, "setValue:forKey:", CFSTR("xp_amp_podcasts_main"), CFSTR("topic"));
  v10 = objc_alloc_init((Class)AMSMutablePromise);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AnalyticsIdentifierManager sharedInstance](_TtC18PodcastsFoundation26AnalyticsIdentifierManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifierPromise"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100052720;
  v18[3] = &unk_1004A6878;
  v19 = v4;
  v13 = v10;
  v20 = v13;
  v14 = v4;
  objc_msgSend(v12, "addFinishBlock:", v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

- (void)determineCanSendNewEpisodeAlertsWithSchedulingOptions:(unint64_t)a3 completion:(id)a4
{
  char v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = a4;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](PodcastsApplicationStateMonitor, "shared"));
    v7 = objc_msgSend(v6, "currentState");

    if ((v4 & 1) != 0 || v7 == (id)2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100052A08;
      v13[3] = &unk_1004A68A0;
      v14 = v5;
      objc_msgSend(v12, "getNotificationSettingsWithCompletionHandler:", v13);

    }
    else
    {
      v9 = _MTLogCategoryNotifications(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor descriptionForState:](PodcastsApplicationStateMonitor, "descriptionForState:", v7));
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "canSendNotifications is NO (reason: appState = %@)", buf, 0xCu);

      }
      (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    }
  }

}

- (BOOL)canSendNewEpisodeAlerts
{
  return +[PFNotificationSettings canSendNotification](PFNotificationSettings, "canSendNotification");
}

- (void)processNotificationsWithReason:(id)a3
{
  -[MTNotificationManager processNotificationsWithSchedulingOptions:reason:completion:](self, "processNotificationsWithSchedulingOptions:reason:completion:", 0, a3, 0);
}

- (void)processNotificationsForDebuggingWithCompletion:(id)a3
{
  -[MTNotificationManager processNotificationsWithSchedulingOptions:reason:completion:](self, "processNotificationsWithSchedulingOptions:reason:completion:", 3, CFSTR("Debug"), a3);
}

- (void)processNotificationsWithSchedulingOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  id v28[2];
  id location;
  _QWORD v30[4];
  id v31;
  id v32;
  _BYTE *v33;
  os_signpost_id_t v34;
  _QWORD v35[5];
  _BYTE buf[24];
  UIBackgroundTaskIdentifier v37;

  v8 = a4;
  v9 = a5;
  v10 = _MTLogCategoryNotifications(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_signpost_id_generate(v11);

  v14 = _MTLogCategoryNotifications(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ProcessNotifications", "SchedulingOptions=%{name=schedulingOptions}lu Reason=%{name=reason}@", buf, 0x16u);
  }

  v18 = _MTLogCategoryNotifications(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[BEGIN] processing notifications for '%@' (scheduling options = %d)", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v37 = UIBackgroundTaskInvalid;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100052E00;
  v35[3] = &unk_1004A6530;
  v35[4] = buf;
  v21 = objc_msgSend(v20, "beginBackgroundTaskWithExpirationHandler:", v35);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v21;

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100052E5C;
  v30[3] = &unk_1004A68C8;
  v22 = v8;
  v31 = v22;
  v23 = v9;
  v32 = v23;
  v33 = buf;
  v34 = v12;
  v24 = objc_retainBlock(v30);
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100052FB0;
  v26[3] = &unk_1004A6940;
  objc_copyWeak(v28, &location);
  v25 = v24;
  v27 = v25;
  v28[1] = (id)a3;
  -[MTNotificationManager determineCanSendNewEpisodeAlertsWithSchedulingOptions:completion:](self, "determineCanSendNewEpisodeAlertsWithSchedulingOptions:completion:", a3, v26);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
}

- (void)markEpisodesAsNotified:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;

  v3 = a3;
  v4 = _MTLogCategoryNotifications(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "descriptionForNotificationLogging"));
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Marking as notified: %@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005329C;
  v11[3] = &unk_1004A6640;
  v12 = v3;
  v13 = v8;
  v9 = v8;
  v10 = v3;
  objc_msgSend(v9, "performBlockAndWait:", v11);

}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
  v7 = +[AMSUserNotification notificationCenter:didChangeSettings:bag:](AMSUserNotification, "notificationCenter:didChangeSettings:bag:", v8, v5, v6);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint32_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  MTNotificationManager *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD v59[3];
  _QWORD v60[3];
  uint8_t buf[4];
  uint64_t v62;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = _MTLogCategoryNotifications(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse", buf, 2u);
  }

  v13 = +[AMSUserNotification shouldHandleNotificationResponse:](AMSUserNotification, "shouldHandleNotificationResponse:", v9);
  if ((_DWORD)v13)
  {
    v14 = _MTLogCategoryNotifications(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handing notification response over to AMS for further processing", buf, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
    v17 = +[AMSUserNotification handleNotificationResponse:bag:](AMSUserNotification, "handleNotificationResponse:bag:", v9, v16);
    v10[2](v10);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionIdentifier"));
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("debugAction-showSettings"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notification"));
    v16 = v20;
    if (v19)
    {
      -[MTNotificationManager userNotificationCenter:openSettingsForNotification:](self, "userNotificationCenter:openSettingsForNotification:", v8, v20);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "request"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "content"));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mt_notificationEpisodes"));
      v24 = _MTLogCategoryNotifications(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 134217984;
        v62 = (uint64_t)v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse for %lu episodes", buf, 0xCu);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mt_compactMap:", &stru_1004A6980));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v27));
      v29 = objc_msgSend(v28, "count");

      if (v29)
      {
        v53 = self;
        v31 = (uint64_t)objc_msgSend(v9, "mt_actionType");
        v57 = v22;
        v58 = v8;
        if (!v31 && v29 == (id)1)
        {
          if (objc_msgSend(v23, "count") == (id)1)
            v31 = 3;
          else
            v31 = 4;
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsAction notificationTapped](MTFeedUpdateMetricsAction, "notificationTapped"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey actionType](MTFeedUpdateMetricsDataKey, "actionType"));
        v59[0] = v55;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v31));
        v60[0] = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey uniquePodcastUuidCount](MTFeedUpdateMetricsDataKey, "uniquePodcastUuidCount"));
        v59[1] = v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29));
        v60[1] = v34;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey notificationEpisodesCount](MTFeedUpdateMetricsDataKey, "notificationEpisodesCount"));
        v59[2] = v35;
        v56 = v23;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "count")));
        v60[2] = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 3));
        +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", v54, 0, v37);

        v39 = _MTLogCategoryNotifications(v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v62 = v31;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse for actionType %lu", buf, 0xCu);
        }

        v22 = v57;
        v8 = v58;
        v23 = v56;
        switch(v31)
        {
          case 0:
            v42 = _MTLogCategoryDefault(v41);
            v43 = objc_claimAutoreleasedReturnValue(v42);
            if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              goto LABEL_27;
            *(_DWORD *)buf = 138412290;
            v62 = (uint64_t)v9;
            v44 = "Unexpected notification action type encountered in %@";
            v45 = v43;
            v46 = OS_LOG_TYPE_ERROR;
            v47 = 12;
            goto LABEL_26;
          case 1:
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "firstObject"));
            -[MTNotificationManager playPodcastDefaultBehaviorForNotificationEpisode:](v53, "playPodcastDefaultBehaviorForNotificationEpisode:", v52);
            goto LABEL_31;
          case 2:
            -[MTNotificationManager playPodcastNotificationEpisodes:](v53, "playPodcastNotificationEpisodes:", v56);
            break;
          case 3:
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "firstObject"));
            -[MTNotificationManager showPodcastDetailForOneShowWithOneNotificationEpisode:](v53, "showPodcastDetailForOneShowWithOneNotificationEpisode:", v52);
LABEL_31:

            break;
          case 4:
            -[MTNotificationManager showPodcastDetailForOneShowWithMultipleNotificationEpisodes:](v53, "showPodcastDetailForOneShowWithMultipleNotificationEpisodes:", v56);
            break;
          default:
            break;
        }
      }
      else
      {
        v48 = _MTLogCategoryDefault(v30);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v62 = (uint64_t)v9;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Unexpected notification content [no podcasts] in response %@", buf, 0xCu);
        }

        v51 = _MTLogCategoryNotifications(v50);
        v43 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v44 = "didReceiveNotificationResponse failed to find unique podcast UUID";
          v45 = v43;
          v46 = OS_LOG_TYPE_DEFAULT;
          v47 = 2;
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v45, v46, v44, buf, v47);
        }
LABEL_27:

      }
      v10[2](v10);

      v16 = v22;
    }
  }

}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  dispatch_time_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  uint64_t *v29;
  _QWORD v30[3];
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mt_podcastUuid"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v11, "beginIgnoringInteractionEvents");

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_1000465A4;
  v36 = sub_100046954;
  v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100053DAC;
  v25[3] = &unk_1004A69A8;
  v28 = v30;
  v29 = &v32;
  v12 = v10;
  v26 = v12;
  v13 = v9;
  v27 = v13;
  v14 = objc_retainBlock(v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v16 = objc_msgSend(v15, "applicationState");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v18 = MTApplicationDidBecomeActiveNotification;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100053E60;
    v23[3] = &unk_1004A69D0;
    v19 = v14;
    v24 = v19;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v18, 0, v17, v23));
    v21 = (void *)v33[5];
    v33[5] = v20;

    v22 = dispatch_time(0, 1000000000);
    dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, v19);

  }
  else
  {
    ((void (*)(_QWORD *))v14[2])(v14);
  }

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "request"));
  v7 = (uint64_t)((_QWORD)objc_msgSend(v6, "mt_schedulingOptions") << 63) >> 63;

  v8[2](v8, v7);
}

- (void)showPodcastDetailForOneShowWithOneNotificationEpisode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  void *v17;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainQueueContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodeForUuid:", v7));

    if (v8)
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayURL"));
    else
      v9 = objc_claimAutoreleasedReturnValue(+[MTPodcast productURLForStoreCollectionId:storeTrackId:](MTPodcast, "productURLForStoreCollectionId:storeTrackId:", objc_msgSend(v4, "podcastStoreCollectionId"), objc_msgSend(v4, "storeTrackId")));
    v11 = v9;
    v12 = _MTLogCategoryNotifications(v9);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v11, "absoluteString"));
        v16 = 138412290;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Showing Podcast Details with one episode with URL %@", (uint8_t *)&v16, 0xCu);

      }
    }
    else if (v14)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Showing Podcast Details with one episode with null URL", (uint8_t *)&v16, 2u);
    }

    -[MTNotificationManager _showDetailUsingURL:](self, "_showDetailUsingURL:", v11);
  }
  else
  {
    v10 = _MTLogCategoryDefault(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid parameter", (uint8_t *)&v16, 2u);
    }
  }

}

- (void)showPodcastDetailForOneShowWithMultipleNotificationEpisodes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  void *v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if ((unint64_t)v5 <= 1)
  {
    v6 = _MTLogCategoryDefault(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid parameter", (uint8_t *)&v19, 2u);
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainOrPrivateContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "podcastUuid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "podcastForUuid:", v11));

    if (v12)
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayURL"));
    else
      v13 = objc_claimAutoreleasedReturnValue(+[MTPodcast productURLForStoreCollectionId:storeTrackId:](MTPodcast, "productURLForStoreCollectionId:storeTrackId:", objc_msgSend(v8, "podcastStoreCollectionId"), 0));
    v14 = (void *)v13;
    v15 = _MTLogCategoryNotifications(v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
        v19 = 138412290;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Showing Podcast Details with multiple episodes with URL %@", (uint8_t *)&v19, 0xCu);

      }
    }
    else if (v17)
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Showing Podcast Details with multiple episodes with URL", (uint8_t *)&v19, 2u);
    }

    -[MTNotificationManager _showDetailUsingURL:](self, "_showDetailUsingURL:", v14);
  }

}

- (void)_showDetailUsingURL:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (v3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005436C;
    block[3] = &unk_1004A6200;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

- (void)playPodcastDefaultBehaviorForNotificationEpisode:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  MTNetworkMediaManifest *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _BYTE buf[24];
  uint64_t v29;

  v3 = a3;
  v4 = _MTLogCategoryNotifications(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse playPodcastDefaultBehaviorForNotificationEpisode", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainOrPrivateContext"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "episodeForUuid:", v9));
    v11 = v10 == 0;

    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
      v13 = objc_claimAutoreleasedReturnValue(+[MTPlaybackQueueFactory playEpisodeUuid:](MTPlaybackQueueFactory, "playEpisodeUuid:", v12));

      if (v13)
        goto LABEL_10;
    }
  }
  v14 = objc_msgSend(v3, "storeTrackId");
  v15 = _MTLogCategoryNotifications(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "didReceiveNotificationResponse playPodcastDefaultBehaviorForNotificationEpisode failed manifest from episode uuid %@. Will attempt to create from adam ID %lld", buf, 0x16u);

  }
  v18 = +[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v14);
  if ((_DWORD)v18
    && (v19 = [MTNetworkMediaManifest alloc],
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v14)),
        v13 = -[MTNetworkMediaManifest initWithEpisodeAdamId:assetInfo:](v19, "initWithEpisodeAdamId:assetInfo:", v20, 0), v20, v13))
  {
LABEL_10:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v29 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100054774;
    v27[3] = &unk_1004A6530;
    v27[4] = buf;
    v22 = objc_msgSend(v21, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.podcasts.NotifcationStartPlayback"), v27);

    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v22;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000547C0;
    v26[3] = &unk_1004A69F8;
    v26[4] = buf;
    v23 = objc_retainBlock(v26);
    if (os_feature_enabled_bluemoon(v23))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedPlaybackController](UIApplication, "sharedPlaybackController"));
      objc_msgSend(v24, "playManifest:waitingForEngine:completion:", v13, 1, v23);
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
      objc_msgSend(v24, "playManifest:reason:interactive:completion:", v13, 13, 0, v23);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v25 = _MTLogCategoryNotifications(v18);
    v13 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "didReceiveNotificationResponse playPodcastDefaultBehaviorForNotificationEpisode failed to create manifest", buf, 2u);
    }
  }

}

- (void)playPodcastNotificationEpisodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  MTNetworkMediaManifest *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  __int128 buf;
  uint64_t v26;
  void *v27;
  id v28;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v26 = (uint64_t)sub_1000575D8;
  v27 = &unk_1004A6BC0;
  v28 = v5;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_compactMap:", &buf));

  v9 = _MTLogCategoryNotifications(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v7, "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse playPodcastNotificationEpisodes for %lu episodes", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v7, "count"))
  {
    v12 = -[MTItemListManifest initWithItems:]([MTItemListManifest alloc], "initWithItems:", v7);
    if (v12)
      goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_compactMap:", &stru_1004A6C00));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mt_compactMap:", &stru_1004A6A38));
  v15 = _MTLogCategoryNotifications(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "didReceiveNotificationResponse playPodcastNotificationEpisodes failed manifest from episode uuids. Will attempt to create from adam IDs %@", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v13, "count"))
  {
    v12 = -[MTNetworkMediaManifest initWithEpisodeAdamIds:assetInfo:]([MTNetworkMediaManifest alloc], "initWithEpisodeAdamIds:assetInfo:", v14, 0);

    if (v12)
    {
LABEL_9:
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v26 = 0x2020000000;
      v27 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100054BF0;
      v24[3] = &unk_1004A6530;
      v24[4] = &buf;
      v19 = objc_msgSend(v18, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.podcasts.NotifcationStartPlayback"), v24);

      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v19;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100054C3C;
      v23[3] = &unk_1004A69F8;
      v23[4] = &buf;
      v20 = objc_retainBlock(v23);
      if (os_feature_enabled_bluemoon(v20))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedPlaybackController](UIApplication, "sharedPlaybackController"));
        objc_msgSend(v21, "playManifest:waitingForEngine:completion:", v12, 1, v20);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
        objc_msgSend(v21, "playManifest:reason:interactive:completion:", v12, 13, 0, v20);
      }

      _Block_object_dispose(&buf, 8);
      goto LABEL_16;
    }
  }
  else
  {

  }
  v22 = _MTLogCategoryNotifications(v17);
  v12 = (MTNetworkMediaManifest *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "didReceiveNotificationResponse playPodcastNotificationEpisodes failed to create manifest", (uint8_t *)&buf, 2u);
  }
LABEL_16:

}

- (id)computeNotificationsWithSchedulingOptions:(unint64_t)a3
{
  void *v3;
  void *v4;
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
  NSString *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  MTNotificationEpisode *v48;
  double v49;
  double v50;
  id v51;
  MTNotificationEpisode *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  MTNotificationInfo *v60;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  MTNotificationInfo *v70;
  uint64_t v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  uint64_t v84;
  char v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint8_t buf[4];
  id v111;
  _BYTE v112[128];
  _QWORD v113[12];

  v85 = a3;
  v70 = objc_alloc_init(MTNotificationInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesPublishedThisWeek](MTEpisode, "predicateForEpisodesPublishedThisWeek"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesPriceTypeChangedThisWeek](MTEpisode, "predicateForEpisodesPriceTypeChangedThisWeek"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "OR:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForIsNew:](MTEpisode, "predicateForIsNew:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSentNotification:](MTEpisode, "predicateForSentNotification:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "AND:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPodcastIsNotHiddenNotImplicitlyFollowed](MTEpisode, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEntitledEpisodes](MTEpisode, "predicateForEntitledEpisodes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "AND:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "AND:", v68));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateQueueContext"));

  v15 = NSStringFromSelector("bestTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = NSStringFromSelector("bestSummary");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast allPossibleEpisodeListSortOrderProperties](MTPodcast, "allPossibleEpisodeListSortOrderProperties"));
  v80 = kEpisodeStoreTrackId;
  v81 = kEpisodeUuid;
  v113[0] = kEpisodeUuid;
  v113[1] = kEpisodeStoreTrackId;
  v78 = kEpisodeDuration;
  v79 = kEpisodePubDate;
  v113[2] = kEpisodePubDate;
  v113[3] = kEpisodeDuration;
  v76 = kEpisodeVideo;
  v77 = kEpisodeByteSize;
  v113[4] = kEpisodeByteSize;
  v113[5] = kEpisodeVideo;
  v113[6] = kEpisodeSentNotification;
  v113[7] = kEpisodePodcastUuid;
  v75 = kEpisodePodcastUuid;
  v73 = kPodcastStoreCollectionId;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:"));
  v113[8] = v19;
  v74 = kPodcastTitle;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:"));
  v113[9] = v20;
  v71 = kPodcastNotifications;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:"));
  v113[10] = v21;
  v69 = kPodcastSubscribed;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:"));
  v113[11] = v22;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 12));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v66));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "setByAddingObjectsFromArray:", v67));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allObjects"));

  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = sub_1000465A4;
  v108 = sub_100046954;
  v109 = 0;
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_1000555F8;
  v97[3] = &unk_1004A6A88;
  v98 = v14;
  v63 = v12;
  v99 = v63;
  v65 = v25;
  v100 = v65;
  v83 = v16;
  v101 = v83;
  v82 = v18;
  v102 = v82;
  v103 = &v104;
  v64 = v98;
  objc_msgSend(v98, "performBlockAndWait:", v97);
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = (id)v105[5];
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v112, 16);
  if (v26)
  {
    v84 = *(_QWORD *)v94;
    do
    {
      v86 = v26;
      for (i = 0; i != v86; i = (char *)i + 1)
      {
        if (*(_QWORD *)v94 != v84)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)i);
        if ((v85 & 2) != 0)
          goto LABEL_9;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", v71));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v29));
        v31 = objc_msgSend(v30, "BOOLValue");

        if ((v31 & 1) != 0)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", v69));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v32));
          v34 = objc_msgSend(v33, "BOOLValue");

          if (v34)
          {
LABEL_9:
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v81));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v80));
            v87 = objc_msgSend(v36, "longLongValue");

            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v83));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v82));
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v79));
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v78));
            v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v77));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v76));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v75));
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", v74));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v39));

            v41 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", v73));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v41));
            v43 = objc_msgSend(v42, "longLongValue");

            v44 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast allPossibleEpisodeListSortOrderProperties](MTPodcast, "allPossibleEpisodeListSortOrderProperties"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mt_subdictionaryWithKeys:", v44));

            if (v35 && v92 && v38 && v40)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationInfo podcastForUuid:](v70, "podcastForUuid:", v38));
              if (!v46)
                v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationInfo addPodcastWithTitle:uuid:](v70, "addPodcastWithTitle:uuid:", v40, v38));
              v47 = v35;
              v48 = [MTNotificationEpisode alloc];
              objc_msgSend(v91, "doubleValue");
              v50 = v49;
              v51 = objc_msgSend(v90, "longLongValue");
              LOBYTE(v62) = objc_msgSend(v37, "BOOLValue");
              v52 = -[MTNotificationEpisode initWithUuid:storeTrackId:bestTitle:bestSummary:pubDate:duration:byteSize:isVideo:sortPropertyValues:podcastUuid:podcastTitle:podcastStoreCollectionId:](v48, "initWithUuid:storeTrackId:bestTitle:bestSummary:pubDate:duration:byteSize:isVideo:sortPropertyValues:podcastUuid:podcastTitle:podcastStoreCollectionId:", v47, v87, v92, v88, v89, v51, v50, v62, v45, v38, v40, v43);
              v53 = _MTLogCategoryNotifications(objc_msgSend(v46, "addEpisode:", v52));
              v54 = objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v111 = v87;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Adding episode for user notification item - episode %lld", buf, 0xCu);
              }

              v35 = v47;
            }

          }
        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v112, 16);
    }
    while (v26);
  }

  v56 = _MTLogCategoryNotifications(v55);
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationInfo descriptionForNotificationLogging](v70, "descriptionForNotificationLogging"));
    *(_DWORD *)buf = 138412290;
    v111 = v58;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Computed notification items: %@", buf, 0xCu);

  }
  v59 = v102;
  v60 = v70;

  _Block_object_dispose(&v104, 8);
  return v60;
}

- (void)scheduleLocalNotifications:(id)a3 schedulingOptions:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  _BOOL4 v12;
  id inited;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  id v20[2];
  id location;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;

  v8 = a3;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000559B0;
  v22[3] = &unk_1004A6378;
  v9 = a5;
  v23 = v9;
  v10 = objc_retainBlock(v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "podcasts"));
  v12 = objc_msgSend(v11, "count") == 0;

  if (v12)
  {
    ((void (*)(_QWORD *))v10[2])(v10);
  }
  else
  {
    inited = objc_initWeak(&location, self);
    v14 = _MTLogCategoryNotifications(inited);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "descriptionForNotificationLogging"));
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting to post notifications for: %@", buf, 0xCu);

    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000559C4;
    v17[3] = &unk_1004A6AB0;
    objc_copyWeak(v20, &location);
    v18 = v8;
    v20[1] = (id)a4;
    v19 = v10;
    -[MTNotificationManager determineCanSendNewEpisodeAlertsWithSchedulingOptions:completion:](self, "determineCanSendNewEpisodeAlertsWithSchedulingOptions:completion:", a4, v17);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

}

- (void)postLocalNotificationForPlayerItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcastUuid"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "artworkUrl"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](PUIObjCArtworkProvider, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcastUuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "artworkUrl"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100055D84;
  v16[3] = &unk_1004A6B00;
  v17 = v6;
  v18 = v8;
  v19 = v3;
  v13 = v3;
  v14 = v8;
  v15 = v6;
  objc_msgSend(v9, "artworkPathForShow:size:source:completionHandler:", v10, v12, v16, (double)0x50uLL, (double)0x50uLL);

}

- (void)scheduleLocalNotificationForPodcast:(id)a3 schedulingOptions:(unint64_t)a4 completion:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  os_signpost_id_t v56;
  id v57;
  unint64_t v58;
  uint8_t buf[4];
  void *v60;

  v6 = a3;
  v43 = a5;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodes"));
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory mt_localNotificationForNewEpisodesAvailable](UNNotificationCategory, "mt_localNotificationForNewEpisodesAvailable"));
  v42 = v8;
  if (v8 != (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MULTIPLE_EPISODES_AVAILABLE_MESSAGE_BODY_FORMAT"), &stru_1004C6D40, 0));
    v17 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v8));
LABEL_6:
    v15 = (void *)v17;

    goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bestTitle"));
  v14 = objc_msgSend(v13, "length");

  if (!v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SINGLE_EPISODE_NO_TITLE_FOR_PODCAST_AVAILABLE_MESSAGE_BODY"), &stru_1004C6D40, 0));
    goto LABEL_6;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bestTitle"));
LABEL_7:

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v20 = _MTLogCategoryNotifications(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_signpost_id_generate(v21);

  v24 = _MTLogCategoryNotifications(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = v25;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v22, "LOAD_NOTIFICATION_ARTWORK", ", buf, 2u);
  }

  v28 = _MTLogCategoryNotifications(v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptionForNotificationLogging"));
    *(_DWORD *)buf = 138412290;
    v60 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Loading image to attach to notification for: %@", buf, 0xCu);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](PUIObjCArtworkProvider, "shared"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100056778;
  v47[3] = &unk_1004A6B50;
  v48 = v19;
  v49 = v18;
  v50 = v9;
  v51 = v12;
  v33 = v18;
  v34 = v9;
  v52 = v15;
  v53 = v44;
  v56 = v22;
  v57 = v42;
  v58 = a4;
  v54 = v6;
  v55 = v43;
  v46 = v43;
  v35 = v6;
  v36 = v44;
  v37 = v15;
  v38 = v12;
  v39 = v34;
  v40 = v33;
  v41 = v19;
  objc_msgSend(v31, "artworkPathForShow:size:completionHandler:", v32, v47, (double)0x50uLL, (double)0x50uLL);

}

- (void)clearAllNotifications
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "privateQueueContext"));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100056FE0;
  v5[3] = &unk_1004A6200;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlock:", v5);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setAutoSimulateNotificationOnAppActivate:(BOOL)a3
{
  +[IMRuntimeUtil associateBoolValue:forKey:onObject:](IMRuntimeUtil, "associateBoolValue:forKey:onObject:", a3, CFSTR("MTAutoSimulateNotificationOnAppActivate"), self);
}

- (void)simulateAnyTestNotification
{
  +[MTNotificationTestActionFactory runDefaultAction](_TtC8Podcasts31MTNotificationTestActionFactory, "runDefaultAction");
}

- (void)sendMostRecentNotification
{
  +[MTNotificationTestActionFactory runMostRecentNotificationAction](_TtC8Podcasts31MTNotificationTestActionFactory, "runMostRecentNotificationAction");
}

- (void)sendOldestNotification
{
  +[MTNotificationTestActionFactory runOldestNotificationAction](_TtC8Podcasts31MTNotificationTestActionFactory, "runOldestNotificationAction");
}

- (void)sendRandomNotification
{
  +[MTNotificationTestActionFactory runRandomNotificationAction](_TtC8Podcasts31MTNotificationTestActionFactory, "runRandomNotificationAction");
}

- (void)clearAllLocalNotifications
{
  -[MTNotificationManager _handleClearHistoryAction](self, "_handleClearHistoryAction");
}

- (id)debugTestCases
{
  _TtC8Podcasts25MTDebugActionTestCategory *v2;
  _TtC8Podcasts21MTDebugActionTestCase *v3;
  _TtC8Podcasts21MTDebugActionTestCase *v4;
  void *v5;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  _TtC8Podcasts21MTDebugActionTestCase *v13;

  objc_initWeak(&location, self);
  v2 = -[MTDebugActionTestCategory initWithName:title:]([_TtC8Podcasts25MTDebugActionTestCategory alloc], "initWithName:title:", CFSTR("NotificationsUI"), CFSTR("User Notifications"));
  v3 = [_TtC8Podcasts21MTDebugActionTestCase alloc];
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000F5B70;
  v10 = &unk_1004AAEB0;
  objc_copyWeak(&v11, &location);
  v4 = -[MTDebugActionTestCase initWithCategory:name:title:handler:](v3, "initWithCategory:name:title:handler:", v2, CFSTR("MTNotificationTestAction.DebugMenu"), CFSTR("Testing Menu…"), &v7);
  v13 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1, v7, v8, v9, v10));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

- (void)_handleShowNotificationsDebugMenuAction
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MTNotificationTestActionFactory notificationTestActionsViewController](_TtC8Podcasts31MTNotificationTestActionFactory, "notificationTestActionsViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](UIWindow, "keyWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

- (void)_handleClearHistoryAction
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v2, "removeAllDeliveredNotifications");

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v3, "removeAllPendingNotificationRequests");

}

@end
