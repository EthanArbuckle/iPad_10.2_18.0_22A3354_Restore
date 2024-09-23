@implementation WiFiMaintenanceTaskManager

+ (id)sharedWiFiMaintenanceTaskManager
{
  if (qword_10026D5D0 != -1)
    dispatch_once(&qword_10026D5D0, &stru_10022F1C8);
  return (id)qword_10026D5C8;
}

- (void)dealloc
{
  NSObject *serialQForNetworkPerformanceFeed;
  objc_super v4;

  serialQForNetworkPerformanceFeed = self->_serialQForNetworkPerformanceFeed;
  if (serialQForNetworkPerformanceFeed)
    dispatch_release(serialQForNetworkPerformanceFeed);
  v4.receiver = self;
  v4.super_class = (Class)WiFiMaintenanceTaskManager;
  -[WiFiMaintenanceTaskManager dealloc](&v4, "dealloc");
}

- (WiFiMaintenanceTaskManager)init
{
  WiFiMaintenanceTaskManager *v2;
  id v3;
  AnalyticsWorkspace *v4;
  NetworkPerformanceFeed *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WiFiMaintenanceTaskManager;
  v2 = -[WiFiMaintenanceTaskManager init](&v10, "init");
  if (v2)
  {
    if (!objc_opt_class(AnalyticsWorkspace))
      return 0;
    v3 = objc_alloc((Class)AnalyticsWorkspace);
    v4 = (AnalyticsWorkspace *)objc_msgSend(v3, "initWorkspaceWithService:", kSymptomAnalyticsServiceEndpoint);
    v2->_symptomsAnalyticsWorkspace = v4;
    if (v4)
    {
      if (!objc_opt_class(NetworkPerformanceFeed))
        return 0;
      v5 = (NetworkPerformanceFeed *)objc_msgSend(objc_alloc((Class)NetworkPerformanceFeed), "initWithWorkspace:", v2->_symptomsAnalyticsWorkspace);
      v2->_symptomsNetworkHistoryFeed = v5;
      if (v5)
      {
        v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v7 = dispatch_queue_create("com.apple.wifid.networkStoreController.symptomsReplyQ", v6);
        v2->_serialQForNetworkPerformanceFeed = (OS_dispatch_queue *)v7;
        if (v7)
        {
          -[NetworkPerformanceFeed setQueue:](-[WiFiMaintenanceTaskManager symptomsNetworkHistoryFeed](v2, "symptomsNetworkHistoryFeed"), "setQueue:", -[WiFiMaintenanceTaskManager serialQForNetworkPerformanceFeed](v2, "serialQForNetworkPerformanceFeed"));
          return v2;
        }
        return 0;
      }
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Failed in initWithWorkspace", "-[WiFiMaintenanceTaskManager init]");
    }
    else
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Failed in initWorkspaceWithService!", "-[WiFiMaintenanceTaskManager init]");
    }
    objc_autoreleasePoolPop(v9);
    return 0;
  }
  return v2;
}

- (void)unscheduleFromQueue:(id)a3
{
  -[WiFiMaintenanceTaskManager setQueue:](self, "setQueue:", 0);
}

- (void)unScheduleOrphanedSetsCleanUp
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager unScheduleOrphanedSetsCleanUp]");
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.OrphanedSetsCleanUpActivity");
}

- (void)scheduleOrphanedSetsCleanUp
{
  void *v3;
  xpc_object_t v4;
  _QWORD handler[5];

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager scheduleOrphanedSetsCleanUp]");
  objc_autoreleasePoolPop(v3);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_30_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004EC7C;
  handler[3] = &unk_10022F1F0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.OrphanedSetsCleanUpActivity", v4, handler);
  xpc_release(v4);
}

- (void)unScheduleOutdatedListEntriesCleanUp
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager unScheduleOutdatedListEntriesCleanUp]");
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.OutdatedListEntriesCleanUpActivity");
}

- (void)scheduleOutdatedListEntriesCleanUp
{
  void *v3;
  xpc_object_t v4;
  _QWORD handler[5];

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager scheduleOutdatedListEntriesCleanUp]");
  objc_autoreleasePoolPop(v3);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_8_HOURS);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004EFC0;
  handler[3] = &unk_10022F1F0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.OutdatedListEntriesCleanUpActivity", v4, handler);
  xpc_release(v4);
}

- (void)schedule3BarsObserver
{
  void *v3;
  xpc_object_t v4;
  _QWORD handler[5];

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager schedule3BarsObserver]");
  objc_autoreleasePoolPop(v3);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_PREVENT_DEVICE_SLEEP, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004F2E8;
  handler[3] = &unk_10022F1F0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.3BarsObserverActivity", v4, handler);
  xpc_release(v4);
}

- (void)unSchedule3BarsObserver
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager unSchedule3BarsObserver]");
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.3BarsObserverActivity");
}

- (void)unSchedulePNLMigration
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager unSchedulePNLMigration]");
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.ListMigrationActivity");
}

- (void)schedulePNLMigration
{
  void *v3;
  xpc_object_t v4;
  _QWORD handler[5];

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager schedulePNLMigration]");
  objc_autoreleasePoolPop(v3);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_30_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004F6B4;
  handler[3] = &unk_10022F1F0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.ListMigrationActivity", v4, handler);
  xpc_release(v4);
}

- (void)unScheduleHistoricNetworkPerformanceFeedSync
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager unScheduleHistoricNetworkPerformanceFeedSync]");
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.HistoricNetworkPerformanceFeedActivity");
}

- (void)scheduleHistoricNetworkPerformanceFeedSync
{
  void *v3;
  xpc_object_t v4;
  _QWORD handler[5];

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager scheduleHistoricNetworkPerformanceFeedSync]");
  objc_autoreleasePoolPop(v3);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 10080 * XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, (uint64_t)((double)XPC_ACTIVITY_INTERVAL_1_MIN * 720.0));
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004FA10;
  handler[3] = &unk_10022F1F0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.HistoricNetworkPerformanceFeedActivity", v4, handler);
  xpc_release(v4);
}

- (void)networkPerformanceFeedSync
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  id v11;
  uint64_t v12;
  NSDictionary *v13;
  void *v14;
  NetworkPerformanceFeed *v15;
  void *v16;
  void *context;
  _QWORD v19[8];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];

  context = objc_autoreleasePoolPush();
  v2 = objc_msgSend(+[WiFiAnalyticsManager sharedWiFiAnalyticsManager](WiFiAnalyticsManager, "sharedWiFiAnalyticsManager"), "copyAllStoredNetworkSsids");
  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: step 1 - syncing scores for %d networks", "-[WiFiMaintenanceTaskManager networkPerformanceFeedSync]", objc_msgSend(v2, "count"));
  objc_autoreleasePoolPop(v4);
  v5 = dispatch_semaphore_create(0);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = kSymptomAnalyticsServiceNetworkAttachmentHistorical;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        v11 = v3;
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v2);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v24 = v9;
        v25 = v12;
        v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v14 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: step 2 - getting perf feed for %@", "-[WiFiMaintenanceTaskManager networkPerformanceFeedSync]", v12);
        objc_autoreleasePoolPop(v14);
        v15 = -[WiFiMaintenanceTaskManager symptomsNetworkHistoryFeed](self, "symptomsNetworkHistoryFeed");
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10004FD44;
        v19[3] = &unk_10022F218;
        v19[4] = v13;
        v19[5] = v12;
        v3 = v11;
        v19[6] = v11;
        v19[7] = v5;
        if (-[NetworkPerformanceFeed fullScorecardFor:options:reply:](v15, "fullScorecardFor:options:reply:", 1, v13, v19))dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      }
      v7 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v3, "count"))
  {
    v16 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: step 3 - Submit syncd network performance feed for %d networks", "-[WiFiMaintenanceTaskManager networkPerformanceFeedSync]", objc_msgSend(v3, "count"));
    objc_autoreleasePoolPop(v16);
    sub_100061BA4((uint64_t)v3);
  }
  dispatch_release(v5);
  if (v2)
    CFRelease(v2);
  objc_autoreleasePoolPop(context);
}

- (void)scheduleWCADownloadObserver
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_activity_register("com.apple.wifimanager.wcaDownloadActivity", v2, &stru_10022F258);
  xpc_release(v2);
}

- (void)unScheduleWCADownloadObserver
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager unScheduleWCADownloadObserver]");
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.wcaDownloadActivity");
}

- (__WiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManager *)a3
{
  self->_wifiManager = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (AnalyticsWorkspace)symptomsAnalyticsWorkspace
{
  return self->_symptomsAnalyticsWorkspace;
}

- (void)setSymptomsAnalyticsWorkspace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NetworkPerformanceFeed)symptomsNetworkHistoryFeed
{
  return self->_symptomsNetworkHistoryFeed;
}

- (void)setSymptomsNetworkHistoryFeed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)serialQForNetworkPerformanceFeed
{
  return self->_serialQForNetworkPerformanceFeed;
}

- (void)setSerialQForNetworkPerformanceFeed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
