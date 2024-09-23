@implementation MSDAnalyticsEventHandler

+ (id)sharedInstance
{
  if (qword_100175438 != -1)
    dispatch_once(&qword_100175438, &stru_10013F0D8);
  return (id)qword_100175430;
}

- (MSDAnalyticsEventHandler)init
{
  MSDAnalyticsEventHandler *v2;
  MSDAnalyticsEventHandler *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDAnalyticsEventHandler;
  v2 = -[MSDAnalyticsEventHandler init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDAnalyticsEventHandler setRawDataKeyMapping:](v2, "setRawDataKeyMapping:", &off_10014E790);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("None"), CFSTR("Physical"), CFSTR("eSim"), 0));
    -[MSDAnalyticsEventHandler setCellularTypeStrMapping:](v3, "setCellularTypeStrMapping:", v4);

  }
  return v3;
}

- (void)sendContentUpdateFailureEvent:(id)a3 isFatal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleInProgress"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getDemoBundleInfo:](self, "getDemoBundleInfo:", v9));

  objc_msgSend(v15, "setObject:forKey:", v10, CFSTR("demoBundleInProgressInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "code")));
  objc_msgSend(v15, "setObject:forKey:", v11, CFSTR("errorCode"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
  objc_msgSend(v15, "setObject:forKey:", v12, CFSTR("errorMessage"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("isFatal"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v14, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.contentUpdateFailure"), v15);

}

- (void)sendiCloudSigninFailureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "code")));
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("errorCode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("errorMessage"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.icloudSignInFailure"), v8);

}

- (void)sendOSUpdateFailureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "code")));
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("errorCode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("errorMessage"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.osUpdateFailure"), v8);

}

- (void)sendFMHFailureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "code")));
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("errorCode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("errorMessage"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.fmhFailure"), v8);

}

- (void)sendEnrollmentFailureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "code")));
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("errorCode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("errorMessage"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.enrollmentFailure"), v8);

}

- (void)sendNetworkFailureEvent:(id)a3 forServerType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "code")));
  objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("errorCode"));

  objc_msgSend(v11, "setObject:forKey:", v6, CFSTR("serverType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));

  objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("errorMessage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v10, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.networkFailure"), v11);

}

- (void)sendContentUpdateCompletedEvent:(int64_t)a3 withTimeTaken:(double)a4 cachingHubAvailable:(BOOL)a5 isCriticalUpdate:(BOOL)a6 contentUpdateType:(id)a7 andComponentSuccess:(int64_t)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v9 = a6;
  v10 = a5;
  v14 = a7;
  v26 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleInProgress"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getDemoBundleInfo:](self, "getDemoBundleInfo:", v17));

  objc_msgSend(v26, "setObject:forKey:", v18, CFSTR("demoBundleInProgressInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  objc_msgSend(v26, "setObject:forKey:", v19, CFSTR("downloadSize"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getDownloadSizeBucket:](self, "getDownloadSizeBucket:", a3));
  objc_msgSend(v26, "setObject:forKey:", v20, CFSTR("downloadSizeBucket"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
  objc_msgSend(v26, "setObject:forKey:", v21, CFSTR("isCachingHubAvailable"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
  objc_msgSend(v26, "setObject:forKey:", v22, CFSTR("isCriticalUpdate"));

  objc_msgSend(v26, "setObject:forKey:", v14, CFSTR("contentUpdateType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  objc_msgSend(v26, "setObject:forKey:", v23, CFSTR("timeTaken"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a8));
  objc_msgSend(v26, "setObject:forKey:", v24, CFSTR("componentSuccessPercent"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v25, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.contentUpdateCompleted"), v26);

}

- (void)sendBgDownloadPausedEvent:(int64_t)a3 forReason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("pauseDuration"));

  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("pauseReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.bgDownloadPaused"), v9);

}

- (void)sendFileDownloadSourceEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("fileDownloadSource"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v5, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.fileDownloadSource"), v6);

}

- (void)sendNetworkAverageRTTEvent:(int64_t)a3 forServerType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("avgRTT"));

  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("serverType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.networkRTT"), v9);

}

- (void)sendNetworkPacketLossEvent:(int64_t)a3 forServerType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("packetLoss"));

  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("serverType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.networkPacketLoss"), v9);

}

- (void)sendNetworkAverageBandwidthEvent:(int64_t)a3 forServerType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("avgBandwidth"));

  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("serverType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.networkBandwidth"), v9);

}

- (void)sendNetworkRawDataEvent:(id)a3 forServerType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 0));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataResponseEnd")));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataResponseStart")));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataResponseEnd")));
      objc_msgSend(v12, "doubleValue");
      v14 = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataResponseStart")));
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14 - v17));
      objc_msgSend(v8, "setObject:forKey:", v18, CFSTR("responseDuration"));

    }
  }
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataRequestEnd")));
  if (v19)
  {
    v20 = (void *)v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataRequestStart")));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataRequestEnd")));
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataRequestStart")));
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24 - v27));
      objc_msgSend(v8, "setObject:forKey:", v28, CFSTR("requestDuration"));

    }
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = v6;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v40;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler rawDataKeyMapping](self, "rawDataKeyMapping", (_QWORD)v39));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", v34));

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", v34));
          objc_msgSend(v8, "setObject:forKey:", v37, v36);

        }
        v33 = (char *)v33 + 1;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v31);
  }

  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("serverType"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v38, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.networkRawData"), v8);

}

- (void)sendAppUsageDataEvent:(id)a3 withExecutable:(id)a4 sessionUUID:(id)a5 sessionStart:(id)a6 sessionEnd:(id)a7 sessionDuration:(int64_t)a8 appOrder:(int64_t)a9 appDuration:(double)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  id v27;

  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v27 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1));
  objc_msgSend(v27, "setObject:forKey:", v21, CFSTR("bundleID"));

  objc_msgSend(v27, "setObject:forKey:", v20, CFSTR("executableName"));
  objc_msgSend(v27, "setObject:forKey:", v19, CFSTR("sessionUUID"));

  objc_msgSend(v27, "setObject:forKey:", v18, CFSTR("sessionStartTime"));
  objc_msgSend(v27, "setObject:forKey:", v17, CFSTR("sessionEndTime"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a8));
  objc_msgSend(v27, "setObject:forKey:", v22, CFSTR("sessionDuration"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a9));
  objc_msgSend(v27, "setObject:forKey:", v23, CFSTR("appOrder"));

  *(float *)&v24 = a10;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24));
  objc_msgSend(v27, "setObject:forKey:", v25, CFSTR("appDuration"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v26, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.appUsage"), v27);

}

- (void)sendHeartbeatEvent
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v2, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.heartbeat"), v3);

}

- (void)sendLastShallowRefreshTime:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1));
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), (uint64_t)v6));
  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("LastShallowRefreshTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.lastShallowRefreshTime"), v9);

}

- (void)sendAutoEnrollmentResults:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentTimeStamp")));
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), (int)v7));
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("AutoEnrollmentTimeStamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentStatus")));
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("AutoEnrollmentStatus"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("ErrorCode")));
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("errorCode"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("ErrorMessage")));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("ErrorMessage")));
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("errorMessage"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKey:", CFSTR("<NOT_SET>"), CFSTR("errorMessage"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentSelectedStoreID")));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentSelectedStoreID")));
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("AutoEnrollmentSelectedStoreID"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKey:", CFSTR("<NOT_SET>"), CFSTR("errorMessage"));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentNetworkInfo")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getPhysicalSimCarrier:](self, "getPhysicalSimCarrier:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentNetworkInfo")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getEmbeddedSimCarrier:](self, "getEmbeddedSimCarrier:", v17));

  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("AutoEnrollmentPhyscialSIMCarrier"));
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("AutoEnrollmentEmbeddedSIMCarrier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentWiFiSSID")));
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("AutoEnrollmentWiFiSSID"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentHelpMenuUserTapped")));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentHelpMenuUserTapped")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", ")));

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("AutoEnrollmentHelpMenuUserTapped"));
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentLanguageCodeInfo")));
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("AutoEnrollmentLanguageCodeInfo"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("AutoEnrollmentCountryCodeInfo")));
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("AutoEnrollmentCountryCodeInfo"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v26, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.autoEnrollment"), v4);

}

- (void)sendAutoEnrollmentAbortEvent:(id)a3 languageCode:(id)a4 countryCode:(id)a5 networkInformation:(id)a6 wifiSSID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler prepareCAData:](self, "prepareCAData:", 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v23, "code")));
  objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("errorCode"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDescription"));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDescription"));
    objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("errorMessage"));

  }
  objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("AutoEnrollmentAbortLanguageCodeInfo"));
  objc_msgSend(v16, "setObject:forKey:", v15, CFSTR("AutoEnrollmentAbortCountryCodeInfo"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getPhysicalSimCarrier:](self, "getPhysicalSimCarrier:", v14));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getEmbeddedSimCarrier:](self, "getEmbeddedSimCarrier:", v14));

  objc_msgSend(v16, "setObject:forKey:", v20, CFSTR("AutoEnrollmentPhyscialSIMCarrier"));
  objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("AutoEnrollmentEmbeddedSIMCarrier"));
  objc_msgSend(v16, "setObject:forKey:", v13, CFSTR("AutoEnrollmentWiFiSSID"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
  objc_msgSend(v22, "sendEvent:withPayload:", CFSTR("com.apple.MobileStoreDemo.autoEnrollmentAbort"), v16);

}

- (id)prepareCAData:(int)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  __CFString *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v49;
  __CFString *v50;
  void *v51;

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDeviceOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("store_id")));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDeviceOptions"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("store_id")));

  }
  else
  {
    v10 = CFSTR("<unknown>");
  }
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("storeID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("deviceSerialNumber"));
  if (a3 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getDeviceOptions"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("store_type")));
    if (v14)
      v15 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("store_type")));
    else
      v15 = CFSTR("<unknown>");
    v50 = (__CFString *)v15;
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("storeType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "installedBundle"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleInfo"));
    v19 = objc_claimAutoreleasedReturnValue(-[MSDAnalyticsEventHandler getDemoBundleInfo:](self, "getDemoBundleInfo:", v18));

    v49 = (void *)v19;
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("demoBundleInfo"));
    v20 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v20, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    v21 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US"));
    objc_msgSend(v20, "setLocale:", v21);

    v22 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSGregorianCalendar);
    objc_msgSend(v20, "setCalendar:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getLastBundleUpdateDate"));
    v24 = v23;
    v51 = v13;
    if (v23 && (objc_msgSend(v23, "isEqualToString:", CFSTR("<unknown>")) & 1) == 0)
    {
      v26 = objc_alloc_init((Class)NSDateFormatter);
      objc_msgSend(v26, "setDateFormat:", CFSTR("yyyy-MM-dd"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dateFromString:", v24));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringFromDate:", v27));

      if (!v25)
      {
        v28 = sub_1000604F0();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          sub_1000C302C(v29, v30, v31, v32, v33, v34, v35, v36);

        v25 = CFSTR("<unknown>");
      }

    }
    else
    {

      v25 = CFSTR("<unknown>");
    }
    objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("lastBundleUpdateDate"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringFromDate:", v37));

    if (!v38)
    {
      v39 = sub_1000604F0();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        sub_1000C2FF8(v40, v41, v42, v43, v44, v45, v46, v47);

      v38 = CFSTR("<unknown>");
    }
    objc_msgSend(v5, "setObject:forKey:", v38, CFSTR("localDate"));

  }
  return v5;
}

- (id)getDownloadSizeBucket:(int64_t)a3
{
  void *v4;
  id v5;
  NSObject *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld-%ld GB"), a3 / 1000000000, a3 / 1000000000 + 1));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1000C3060((uint64_t)v4, a3, v6);

  return v4;
}

- (id)getDemoBundleInfo:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("BundleName")));

  if (v4)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("BundleName")));
  else
    v5 = CFSTR("<unknown>");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("PartNumber")));

  if (v6)
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("PartNumber")));
  else
    v7 = CFSTR("<unknown>");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Revision")));

  if (v8)
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Revision")));
  else
    v9 = CFSTR("<unknown>");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%@"), v5, v7, v9));

  return v10;
}

- (id)getPhysicalSimCarrier:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  __CFString *v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = &stru_100141020;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SimType"), (_QWORD)v12));
        if ((objc_msgSend(v10, "isEqualToNumber:", &off_10014D9B8) & 1) != 0)
        {
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Provider")));

          goto LABEL_12;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = &stru_100141020;
  }
LABEL_12:

  return v7;
}

- (id)getEmbeddedSimCarrier:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  __CFString *v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = &stru_100141020;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SimType"), (_QWORD)v12));
        if ((objc_msgSend(v10, "isEqualToNumber:", &off_10014D9D0) & 1) != 0)
        {
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Provider")));

          goto LABEL_12;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = &stru_100141020;
  }
LABEL_12:

  return v7;
}

- (NSDictionary)rawDataKeyMapping
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRawDataKeyMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)cellularTypeStrMapping
{
  return self->_cellularTypeStrMapping;
}

- (void)setCellularTypeStrMapping:(id)a3
{
  objc_storeStrong((id *)&self->_cellularTypeStrMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularTypeStrMapping, 0);
  objc_storeStrong((id *)&self->_rawDataKeyMapping, 0);
}

@end
