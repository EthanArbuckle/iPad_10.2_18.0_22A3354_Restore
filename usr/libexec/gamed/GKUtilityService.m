@implementation GKUtilityService

- (BOOL)requiresAuthentication
{
  return 0;
}

+ (unint64_t)requiredEntitlements
{
  return 1;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKUtilityServiceInterface, a2);
}

- (GKOverlayServiceUtils)overlayServiceUtils
{
  GKOverlayServiceUtils *overlayServiceUtils;
  GKOverlayServiceUtils *v4;
  GKOverlayServiceUtils *v5;

  overlayServiceUtils = self->_overlayServiceUtils;
  if (!overlayServiceUtils)
  {
    v4 = objc_alloc_init(GKOverlayServiceUtils);
    v5 = self->_overlayServiceUtils;
    self->_overlayServiceUtils = v4;

    overlayServiceUtils = self->_overlayServiceUtils;
  }
  return overlayServiceUtils;
}

- (void)getStoreBagValuesForKeys:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKUtilityService: getStoreBagValuesForKeys:", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKUtilityService _bagValuesForKeys:](self, "_bagValuesForKeys:", v6));
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100010600;
    v14[3] = &unk_1002BB450;
    v16 = v8;
    v15 = v11;
    objc_msgSend(v15, "notifyOnQueue:block:", v13, v14);

  }
}

- (id)_bagValuesForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUtilityService.m", 131, "-[GKUtilityService _bagValuesForKeys:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010764;
  v12[3] = &unk_1002BB4A0;
  v12[4] = self;
  v13 = v4;
  v7 = v6;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v7, "perform:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)requestImageDataForURL:(id)a3 subdirectory:(id)a4 fileName:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  GKUtilityService *v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100010A6C;
  v27[3] = &unk_1002BB4C8;
  v14 = v10;
  v28 = v14;
  v15 = v11;
  v29 = v15;
  v16 = v12;
  v30 = v16;
  v31 = self;
  v17 = v13;
  v32 = v17;
  v18 = objc_retainBlock(v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v20 = objc_msgSend(v19, "isInternalBuild");

  if ((v20 & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "storeBag"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100010AEC;
    v23[3] = &unk_1002BB4F0;
    v24 = v14;
    v25 = v17;
    v26 = v18;
    objc_msgSend(v24, "hasTrustedImageDomainWithStoreBag:completionHandler:", v22, v23);

  }
  else
  {
    ((void (*)(_QWORD *))v18[2])(v18);
  }

}

- (void)cacheImageData:(id)a3 inSubdirectory:(id)a4 withFileName:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUtilityService.m", 175, "-[GKUtilityService cacheImageData:inSubdirectory:withFileName:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v14));

  if (v11 && v12)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100010D48;
    v20[3] = &unk_1002BB4A0;
    v21 = v11;
    v22 = v12;
    v23 = v10;
    objc_msgSend(v15, "perform:", v20);

  }
  if (v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100010ED4;
    v18[3] = &unk_1002BB540;
    v19 = v13;
    objc_msgSend(v15, "notifyOnQueue:block:", v17, v18);

  }
}

- (void)loadCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUtilityService.m", 200, "-[GKUtilityService loadCachedImageDataFromSubdirectory:withFileName:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

  if (v8 && v9)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100011084;
    v18[3] = &unk_1002BB4A0;
    v19 = v8;
    v20 = v9;
    v21 = v12;
    objc_msgSend(v21, "perform:", v18);

  }
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000111D0;
    v15[3] = &unk_1002BB450;
    v17 = v10;
    v16 = v12;
    objc_msgSend(v16, "notifyOnQueue:block:", v14, v15);

  }
}

- (void)deleteCachedImageDataFromSubdirectory:(id)a3 withFileName:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUtilityService.m", 224, "-[GKUtilityService deleteCachedImageDataFromSubdirectory:withFileName:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

  if (v8 && v9)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000113A0;
    v17[3] = &unk_1002BB590;
    v18 = v8;
    v19 = v9;
    objc_msgSend(v12, "perform:", v17);

  }
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100011564;
    v15[3] = &unk_1002BB540;
    v16 = v10;
    objc_msgSend(v12, "notifyOnQueue:block:", v14, v15);

  }
}

- (void)openICloudSettings
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openICloudSettings");

}

- (void)openSoftwareUpdateSettings
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openSoftwareUpdateSettings");

}

- (id)ampController
{
  return +[GKAMPController controller](GKAMPController, "controller");
}

- (void)viewableThresholdWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "replyQueue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUtilityService.m", 268, "-[GKUtilityService viewableThresholdWithCompletion:]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100011758;
  v17[3] = &unk_1002BB590;
  v17[4] = self;
  v9 = v8;
  v18 = v9;
  objc_msgSend(v9, "perform:", v17);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100011830;
  v13[3] = &unk_1002BB608;
  v15 = v6;
  v16 = v4;
  v14 = v9;
  v10 = v6;
  v11 = v4;
  v12 = v9;
  objc_msgSend(v12, "notifyOnQueue:block:", v10, v13);

}

- (void)reportMetricsEventWithTopic:(id)a3 shouldFlush:(id)a4 metricsFields:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](GKAMPController, "controller"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "originalBundleIdentifier"));
  objc_msgSend(v13, "reportMetricsEventWithTopic:hostAppBundleId:shouldFlush:metricsFields:", v10, v12, v9, v8);

}

- (void)reportPerformanceMetricsEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](GKAMPController, "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originalBundleIdentifier"));
  objc_msgSend(v7, "reportPerformanceEventWithHostAppBundleId:metricsFields:", v6, v4);

}

- (void)reportMultiplayerActivityMetricsEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](GKAMPController, "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originalBundleIdentifier"));
  objc_msgSend(v7, "reportMultiplayerActivityEventWithHostAppBundleId:metricsFields:", v6, v4);

}

- (void)reportLoadUrlMetricsEvent:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](GKAMPController, "controller"));
  objc_msgSend(v4, "reportLoadUrlMetricsEventWithMetricsFields:", v3);

}

- (void)recordMatchStart:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v9);
  v12 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "match making recording started", v14, 2u);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](GKMatchReporter, "shared"));
  objc_msgSend(v13, "recordMatchStartWithType:minPlayers:maxPlayers:", v7, v8, v10);

}

- (void)recordMatchServer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](GKMatchReporter, "shared"));
  objc_msgSend(v4, "recordMatchServerWithType:", v3);

}

- (void)recordActiveDevices:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](GKMatchReporter, "shared"));
  objc_msgSend(v4, "recordActiveDevicesWithCount:", v3);

}

- (void)recordSharePlayDevices:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](GKMatchReporter, "shared"));
  objc_msgSend(v4, "recordSharePlayDevicesWithCount:", v3);

}

- (void)completeMatchRecording:(id)a3 matchType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "recording completed result: %@ type: %@", buf, 0x16u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](GKMatchReporter, "shared"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011F64;
  v12[3] = &unk_1002BB630;
  v12[4] = self;
  objc_msgSend(v11, "recordMatchCompleteWithMatchType:result:completion:", v8, v6, v12);

}

- (void)recordGameStart
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](GKMatchReporter, "shared"));
  objc_msgSend(v2, "recordGameStart");

}

- (void)completeGameRecording
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKMatchReporter shared](GKMatchReporter, "shared"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001209C;
  v4[3] = &unk_1002BB630;
  v4[4] = self;
  objc_msgSend(v3, "recordGameCompleteWithCompletion:", v4);

}

- (void)emitMultiplayerMessage:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000121A8;
  v4[3] = &unk_1002BB658;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)openDashboardAsRemoteAlertForGame:(id)a3 hostPID:(int)a4 deeplink:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v6 = *(_QWORD *)&a4;
  v20 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleIdentifier"));
  v10 = objc_msgSend(v9, "isEqualToString:", GKGameControllerDaemonIdentifier);

  if ((v10 & 1) != 0)
  {
    v11 = (id *)&GKDashboardLaunchContextGameController;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleIdentifier"));
    v13 = +[NSBundle _gkBundleIdentifierIsRelatedToContactsUI:](NSBundle, "_gkBundleIdentifierIsRelatedToContactsUI:", v12);

    if ((v13 & 1) != 0)
    {
      v11 = (id *)&GKDashboardLaunchContextContacts;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleIdentifier"));
      v15 = objc_msgSend(v14, "isEqualToString:", GKAppStoreIdentifier);

      if ((v15 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleIdentifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown bundleId attempting to open the dashboard. Use openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext: instead: %@"), v17));
        v19 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v18, 0));

        objc_exception_throw(v19);
      }
      v11 = (id *)&GKDashboardLaunchContextAppStore;
    }
  }
  v16 = *v11;
  -[GKUtilityService openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext:](self, "openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext:", v20, v6, v8, v16);

}

- (void)openDashboardAsRemoteAlertForGame:(id)a3 hostPID:(int)a4 deeplink:(id)a5 launchContext:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _BOOL8 v18;
  id v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(v12);
  v15 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    v29 = 138413058;
    v30 = v17;
    v31 = 1024;
    v32 = v8;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "RemoteAlert: openDashboardAsRemoteAlertForGame:%@\n hostPID:%d\n deeplink:%@\n launchContext:%@", (uint8_t *)&v29, 0x26u);

  }
  v18 = -[GKUtilityService shouldUseGameControllerSPI:](self, "shouldUseGameControllerSPI:", v10);
  if (v18)
  {
    if (!os_log_GKGeneral)
      v19 = (id)GKOSLoggers(v18);
    v20 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "RemoteAlert: redirecting to handleGameControllerHomeButtonPressed", (uint8_t *)&v29, 2u);
    }
    -[GKUtilityService handleGameControllerHomeButtonPressed](self, "handleGameControllerHomeButtonPressed");
  }
  else if (_os_feature_enabled_impl("GameCenter", "gameoverlayui_with_oldui"))
  {
    +[GKOverlayServiceUtils showDashboardWithGame:deepLink:launchContext:](GKOverlayServiceUtils, "showDashboardWithGame:deepLink:launchContext:", v10, v11, v13);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKRemoteAlertLauncher shared](GKRemoteAlertLauncher, "shared"));
    v22 = objc_msgSend(v21, "isLaunching");

    if (v22)
    {
      if (!os_log_GKGeneral)
        v24 = (id)GKOSLoggers(v23);
      v25 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        LOWORD(v29) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "RemoteAlert: Not going to open the dashboard because it is launching", (uint8_t *)&v29, 2u);
      }
    }
    else
    {
      if (!os_log_GKGeneral)
        v26 = (id)GKOSLoggers(v23);
      v27 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        LOWORD(v29) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "RemoteAlert: Launching the remote alert dashboard!", (uint8_t *)&v29, 2u);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[GKRemoteAlertLauncher shared](GKRemoteAlertLauncher, "shared"));
      objc_msgSend(v28, "launchBypassingPreAuthentication:forGame:hostPID:deeplink:launchContext:observer:", 1, v10, v8, v11, v13, 0);

    }
  }

}

- (BOOL)shouldUseGameControllerSPI:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  if ((objc_msgSend(v4, "isEqualToString:", GKGameControllerDaemonIdentifier) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    v5 = objc_msgSend(v6, "isEqualToString:", GKGameCenterIdentifier);

  }
  return v5;
}

- (void)handleGameControllerHomeButtonPressed
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _BOOL8 v10;
  id v11;
  NSObject *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "RemoteAlert: handleGameControllerHomeButtonPressed", buf, 2u);
  }
  if (_os_feature_enabled_impl("GameCenter", "gameoverlayui_with_oldui"))
  {
    +[GKOverlayServiceUtils showDashboardWithGame:deepLink:launchContext:](GKOverlayServiceUtils, "showDashboardWithGame:deepLink:launchContext:", 0, &__NSDictionary0__struct, GKDashboardLaunchContextGameController);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKRemoteAlertLauncher shared](GKRemoteAlertLauncher, "shared"));
    v6 = objc_msgSend(v5, "isLaunching");

    if (v6)
    {
      if (!os_log_GKGeneral)
        v8 = (id)GKOSLoggers(v7);
      v9 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "RemoteAlert: The Game Center overlay is being launched. Skipping this call.", v23, 2u);
      }
    }
    else
    {
      v10 = +[GKClientProxy isGameCenterDashboardForegroundRunning](GKClientProxy, "isGameCenterDashboardForegroundRunning");
      if (v10)
      {
        if (!os_log_GKGeneral)
          v11 = (id)GKOSLoggers(v10);
        v12 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "RemoteAlert: The Game Center overlay is running in the foreground. Notifying it to dismiss itself.", v22, 2u);
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, GKDashboardNeedsToDismiss, 0, 0, 1u);
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameInternal createGameControllerDaemonGameInternal](GKGameInternal, "createGameControllerDaemonGameInternal"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        v16 = objc_msgSend(v15, "pid");

        if (!os_log_GKGeneral)
          v18 = (id)GKOSLoggers(v17);
        v19 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "RemoteAlert: Launching the Game Center overlay.", v21, 2u);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKRemoteAlertLauncher shared](GKRemoteAlertLauncher, "shared"));
        objc_msgSend(v20, "launchBypassingPreAuthentication:forGame:hostPID:deeplink:launchContext:observer:", 1, v14, v16, &__NSDictionary0__struct, GKDashboardLaunchContextGameController, 0);

      }
    }
  }
}

- (void)getBSServiceConnectionEndpointForMachName:(id)a3 service:(id)a4 instance:(id)a5 handler:(id)a6
{
  void (**v9)(id, id);
  id v10;

  v9 = (void (**)(id, id))a6;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[BSServiceConnectionEndpoint endpointForSystemMachName:service:instance:](BSServiceConnectionEndpoint, "endpointForSystemMachName:service:instance:", a3, a4, a5));
  v9[2](v9, v10);

}

- (void)setOverlayServiceUtils:(id)a3
{
  objc_storeStrong((id *)&self->_overlayServiceUtils, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayServiceUtils, 0);
}

@end
