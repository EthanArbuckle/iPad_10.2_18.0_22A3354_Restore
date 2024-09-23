@implementation WiFiPerfPerAssoc

+ (id)sharedInstance
{
  if (+[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance"))
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "![WiFiUsageMonitor sharedInstance]", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 79, 0);
  }
  else if (+[WiFiPerfPerAssoc _isCollectionEnabled](WiFiPerfPerAssoc, "_isCollectionEnabled"))
  {
    if (objc_msgSend(+[WiFiLocationManager sharedWiFiLocationManager](WiFiLocationManager, "sharedWiFiLocationManager"), "isAuthorized"))
    {
      if (qword_10026DC28 != -1)
        dispatch_once(&qword_10026DC28, &stru_100233378);
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "[[WiFiLocationManager sharedWiFiLocationManager] isAuthorized]", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 84, 0);
    }
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "[WiFiPerfPerAssoc _isCollectionEnabled]", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 82, 0);
  }
  return (id)qword_10026DC30;
}

- (WiFiPerfPerAssoc)init
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("Use +[WiFiPerfPerAssoc sharedInstance], don't init externally"), 0));
}

- (id)_initPrivate
{
  WiFiPerfPerAssoc *v2;
  WiFiPerfPerAssoc *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  id v10;
  AnalyticsWorkspace *v11;
  NetworkPerformanceFeed *v12;
  NSObject *wifiPPASerialQ;
  void *v15;
  _QWORD handler[5];
  objc_super v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_10002FB28;
  v22 = sub_10002F9FC;
  v23 = 0;
  v17.receiver = self;
  v17.super_class = (Class)WiFiPerfPerAssoc;
  v2 = -[WiFiPerfPerAssoc init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    v19[5] = (uint64_t)v2;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_create("com.apple.wifid.symptomsPerfPoint.interactionQ", v4);
    v3->_wifiPPASerialQ = (OS_dispatch_queue *)v5;
    if (v5)
    {
      v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = dispatch_queue_create("com.apple.wifid.symptomsPerfPoint.symptomsReplyQ", v6);
      v3->_symptomsReplyQueue = (OS_dispatch_queue *)v7;
      if (v7)
      {
        v8 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v9 = dispatch_queue_create("com.apple.wifid.symptomsPerfPoint.utilityConcurrentQueue", v8);
        v3->_utilityConcurrent = (OS_dispatch_queue *)v9;
        if (v9)
        {
          v10 = objc_alloc((Class)AnalyticsWorkspace);
          v11 = (AnalyticsWorkspace *)objc_msgSend(v10, "initWorkspaceWithService:", kSymptomAnalyticsServiceEndpoint);
          v3->_analyticsWorkspace = v11;
          if (v11)
          {
            v12 = (NetworkPerformanceFeed *)objc_msgSend(objc_alloc((Class)NetworkPerformanceFeed), "initWithWorkspace:", v3->_analyticsWorkspace);
            v3->_perfFeed = v12;
            if (v12)
            {
              -[NetworkPerformanceFeed setQueue:](v12, "setQueue:", v3->_symptomsReplyQueue);
              v3->_sessionsWaitingForFinalization = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
              -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v3, "_locationUpdateNotificationHandler:", CFSTR("com.apple.wifid.locationUpdateNotification"), 0);
              wifiPPASerialQ = v3->_wifiPPASerialQ;
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_10016991C;
              handler[3] = &unk_1002333A0;
              handler[4] = &v18;
              notify_register_dispatch("com.apple.iokit.hid.displayStatus", &v3->_displayStateToken, wifiPPASerialQ, handler);
              if (notify_is_valid_token(v3->_displayStateToken))
              {
                *(_WORD *)&v3->_deviceUnderActiveUse = 0;
                v3->_initialized = 1;
                goto LABEL_9;
              }
              fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "notify_is_valid_token(_displayStateToken)", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 136, 0);
              v15 = objc_autoreleasePoolPush();
              if (qword_10026DD20)
                objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Failed to notify_register_dispatch display state");
            }
            else
            {
              fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_perfFeed", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 125, 0);
              v15 = objc_autoreleasePoolPush();
              if (qword_10026DD20)
                objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Couldn't [NetworkPerformanceFeed initWithWorkspace:]");
            }
          }
          else
          {
            fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_analyticsWorkspace", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 122, 0);
            v15 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Couldn't [AnalyticsWorkspace initWorkspaceWithService:]");
          }
          objc_autoreleasePoolPop(v15);
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_utilityConcurrent", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 119, 0);
        }
      }
      else
      {
        fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_symptomsReplyQueue", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 116, 0);
      }
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_wifiPPASerialQ", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 113, 0);
    }
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "self", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 108, 0);
  }
LABEL_9:
  if (!v3->_initialized)
  {

    v3 = 0;
  }
  _Block_object_dispose(&v18, 8);
  return v3;
}

+ (void)initWithWiFiManager:(void *)a3 queue:(id)a4
{
  qword_10026DC40 = (uint64_t)a3;
  qword_10026DC48 = (uint64_t)a4;
}

- (void)associatedStateDidChange:(BOOL)a3 withAssociatedNetworkRecord:(void *)a4 withChangeReason:(unsigned int)a5
{
  -[WiFiPerfPerAssoc _associatedStateDidChange:withAssociatedNetworkRecord:withChangeReason:](self, "_associatedStateDidChange:withAssociatedNetworkRecord:withChangeReason:", a3, a4, *(_QWORD *)&a5);
}

- (void)_associatedStateDidChange:(BOOL)a3 withAssociatedNetworkRecord:(void *)a4 withChangeReason:(unsigned int)a5
{
  _BOOL4 v6;
  uint64_t *v8;
  _WORD *v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  _QWORD block[6];
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;

  if (self->_initialized)
  {
    v6 = a3;
    v8 = &v16;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0xAAAAAAAAAAAAAAAALL;
    if (a4)
    {
      v9 = sub_10002B2DC((uint64_t)kCFAllocatorDefault, (uint64_t)a4);
      v8 = v17;
    }
    else
    {
      v9 = 0;
    }
    v19 = (unint64_t)v9;
    v10 = v8[3];
    if (v6)
    {
      if (!v10)
      {
        fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "!isAssociated || networkCopy", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 172, 0);
LABEL_15:
        _Block_object_dispose(&v16, 8);
        return;
      }
    }
    else if (!v10)
    {
LABEL_10:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100169AEC;
      block[3] = &unk_1002333C8;
      v15 = v6;
      block[4] = self;
      block[5] = &v16;
      v14 = a5;
      dispatch_async((dispatch_queue_t)-[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ"), block);
      goto LABEL_15;
    }
    if (!-[WiFiPerfPerAssoc _networkSuitableForCollection:](self, "_networkSuitableForCollection:"))
    {
      v11 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: network not suitable for collection", "-[WiFiPerfPerAssoc _associatedStateDidChange:withAssociatedNetworkRecord:withChangeReason:]");
      objc_autoreleasePoolPop(v11);
      v12 = (const void *)v17[3];
      if (v12)
      {
        CFRelease(v12);
        v17[3] = 0;
      }
      goto LABEL_15;
    }
    goto LABEL_10;
  }
}

- (id)getBSSIDForCurrentSession
{
  if (-[WiFiPerfPerAssoc currentSession](self, "currentSession")
    && -[WiFiPerfPerAssocSession connectedBSSID](-[WiFiPerfPerAssoc currentSession](self, "currentSession"), "connectedBSSID"))
  {
    return -[WiFiPerfPerAssocSession connectedBSSID](-[WiFiPerfPerAssoc currentSession](self, "currentSession"), "connectedBSSID");
  }
  fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "self.currentSession && self.currentSession.connectedBSSID", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 227, 0);
  return 0;
}

- (void)finalizeFirstSessionThatRequiresItWhenAppropriate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100169F58;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ"), block);
}

- (void)finalizeSession:(id)a3
{
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (objc_msgSend(a3, "hasBeenFinalized"))
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "!session.hasBeenFinalized", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 260, 0);
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s Told to finalize a session that's already finalized: %@", "-[WiFiPerfPerAssoc finalizeSession:]", objc_msgSend(a3, "connectedBSSID"));
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3052000000;
    v10 = sub_10002FB28;
    v11 = sub_10002F9FC;
    v12 = (id)0xAAAAAAAAAAAAAAAALL;
    v12 = a3;
    objc_msgSend((id)v8[5], "setHasBeenFinalized:", 1);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10016A258;
    v6[3] = &unk_1002333F0;
    v6[4] = a3;
    v6[5] = &v7;
    -[WiFiPerfPerAssoc _getHistoricalScorecardSession:andReply:](self, "_getHistoricalScorecardSession:andReply:", a3, v6);
    _Block_object_dispose(&v7, 8);
  }
}

- (void)_beginActiveUsageForSession:(id)a3
{
  _QWORD block[7];
  _QWORD v5[5];
  id v6;
  _QWORD v7[6];

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = sub_10002FB28;
  v7[4] = sub_10002F9FC;
  v7[5] = self;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = sub_10002FB28;
  v5[4] = sub_10002F9FC;
  v6 = (id)0xAAAAAAAAAAAAAAAALL;
  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016A44C;
  block[3] = &unk_100233330;
  block[4] = self;
  block[5] = v7;
  block[6] = v5;
  dispatch_async((dispatch_queue_t)-[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ"), block);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
}

- (void)_endActiveUsageForSession:(id)a3
{
  _QWORD block[7];
  _QWORD v5[5];
  id v6;
  _QWORD v7[6];

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = sub_10002FB28;
  v7[4] = sub_10002F9FC;
  v7[5] = self;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = sub_10002FB28;
  v5[4] = sub_10002F9FC;
  v6 = (id)0xAAAAAAAAAAAAAAAALL;
  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016A7B8;
  block[3] = &unk_100233330;
  block[4] = self;
  block[5] = v7;
  block[6] = v5;
  dispatch_async((dispatch_queue_t)-[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ"), block);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
}

- (void)_handleDisplayStateChange
{
  _QWORD v2[6];
  _QWORD v3[6];

  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3052000000;
  v3[3] = sub_10002FB28;
  v3[4] = sub_10002F9FC;
  v3[5] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10016AAA8;
  v2[3] = &unk_10022EC00;
  v2[4] = self;
  v2[5] = v3;
  dispatch_async((dispatch_queue_t)-[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ"), v2);
  _Block_object_dispose(v3, 8);
}

- (void)ingestLQMUpdate:(id)a3
{
  _QWORD v4[6];
  _QWORD v5[5];
  id v6;
  _QWORD v7[6];

  if (self->_initialized)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3052000000;
    v7[3] = sub_10002FB28;
    v7[4] = sub_10002F9FC;
    v7[5] = self;
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3052000000;
    v5[3] = sub_10002FB28;
    v5[4] = sub_10002F9FC;
    v6 = (id)0xAAAAAAAAAAAAAAAALL;
    v6 = objc_msgSend(a3, "copy");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10016AC94;
    v4[3] = &unk_100231620;
    v4[4] = v7;
    v4[5] = v5;
    dispatch_async((dispatch_queue_t)-[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ"), v4);
    _Block_object_dispose(v5, 8);
    _Block_object_dispose(v7, 8);
  }
}

- (void)_locationUpdateNotificationHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[6];

  if (objc_msgSend(a3, "object")
    && (v5 = objc_msgSend(a3, "object"),
        v6 = objc_opt_class(CLLocation),
        (objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    && -[WiFiPerfPerAssoc currentSession](self, "currentSession"))
  {
    v7 = objc_msgSend(a3, "object");
    if (-[WiFiPerfPerAssoc deviceIsAssociated](self, "deviceIsAssociated"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10016AE1C;
      block[3] = &unk_10022EB70;
      block[4] = self;
      block[5] = v7;
      dispatch_async((dispatch_queue_t)-[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ"), block);
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "self.deviceIsAssociated", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 380, 0);
    }
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "note.object && [note.object isKindOfClass:[CLLocation class]] && self.currentSession", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 378, 0);
  }
}

- (void)ingestScanResults:(id)a3 currentSSID:(id)a4 andReply:(id)a5
{
  _QWORD v5[8];
  _QWORD v6[6];

  if (self->_initialized)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3052000000;
    v6[3] = sub_10002FB28;
    v6[4] = sub_10002F9FC;
    v6[5] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10016AF48;
    v5[3] = &unk_100233418;
    v5[4] = a3;
    v5[5] = a4;
    v5[6] = a5;
    v5[7] = v6;
    dispatch_async((dispatch_queue_t)-[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ"), v5);
    _Block_object_dispose(v6, 8);
  }
}

- (void)_beginPollingForInstantaenousScorecards
{
  dispatch_time_t v3;
  OS_dispatch_queue *v4;
  _QWORD block[5];

  -[WiFiPerfPerAssoc _stopPollingForInstantaneousScorecards](self, "_stopPollingForInstantaneousScorecards");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016B0B8;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  qword_10026DD68 = (uint64_t)dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v3 = dispatch_time(0, 300000000000);
  v4 = -[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ");
  dispatch_after(v3, (dispatch_queue_t)v4, (dispatch_block_t)qword_10026DD68);
}

- (void)_stopPollingForInstantaneousScorecards
{
  void *v2;

  v2 = (void *)qword_10026DD68;
  if (qword_10026DD68)
  {
    if (!dispatch_block_testcancel((dispatch_block_t)qword_10026DD68))
    {
      dispatch_block_cancel(v2);

      qword_10026DD68 = 0;
    }
  }
}

- (void)_pollInstantaenousAndUpdateValues
{
  NetworkPerformanceFeed *perfFeed;
  _QWORD v3[5];
  _QWORD v4[6];
  uint64_t v5;
  uint64_t v6;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = sub_10002FB28;
  v4[4] = sub_10002F9FC;
  v4[5] = self;
  perfFeed = self->_perfFeed;
  v5 = kSymptomAnalyticsServiceNetworkAttachmentInstant;
  v6 = kSymptomAnalyticsServiceNetworkAttachmentCurrent;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10016B240;
  v3[3] = &unk_100232690;
  v3[4] = v4;
  -[NetworkPerformanceFeed fullScorecardFor:options:reply:](perfFeed, "fullScorecardFor:options:reply:", 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1), v3);
  _Block_object_dispose(v4, 8);
}

- (void)_getHistoricalScorecardSession:(id)a3 andReply:(id)a4
{
  NetworkPerformanceFeed *perfFeed;
  id v8;
  void *v9;
  _QWORD v10[6];

  if (a3 && objc_msgSend(a3, "scorecardIdentifier"))
  {
    perfFeed = self->_perfFeed;
    v8 = objc_msgSend(a3, "scorecardIdentifier");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10016B3C4;
    v10[3] = &unk_100233440;
    v10[4] = a3;
    v10[5] = a4;
    -[NetworkPerformanceFeed fullScorecardFor:options:reply:](perfFeed, "fullScorecardFor:options:reply:", 1, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, kSymptomAnalyticsServiceNetworkAttachmentHistorical, 0), v10);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "session && session.scorecardIdentifier", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 449, 0);
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s without WiFiPerfPerAssocSession, or a WiFiPerfPerAssocSession lacking scorecard identifier, replying nil", "-[WiFiPerfPerAssoc _getHistoricalScorecardSession:andReply:]");
    objc_autoreleasePoolPop(v9);
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

- (BOOL)_networkSuitableForCollection:(__WiFiNetwork *)a3
{
  void *v5;

  if (sub_10001F440(a3))
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "!WiFiNetworkIsHidden(network)", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 466, 0);
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ignoring hidden network", "-[WiFiPerfPerAssoc _networkSuitableForCollection:]");
  }
  else if (sub_1000C3F88((uint64_t)a3) == 1)
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "WiFiNetworkGetNetworkOfInterestHomeType(network) != kWiFiNetworkOfInterestHome", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 467, 0);
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ignoring home network", "-[WiFiPerfPerAssoc _networkSuitableForCollection:]");
  }
  else
  {
    if (sub_1000CBE60((uint64_t)a3) != 1)
      return 1;
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "WiFiNetworkGetNetworkOfInterestWorkType(network) != kWiFiNetworkOfInterestWork", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 468, 0);
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ignoring work network", "-[WiFiPerfPerAssoc _networkSuitableForCollection:]");
  }
  objc_autoreleasePoolPop(v5);
  return 0;
}

+ (BOOL)_isCollectionEnabled
{
  int v2;

  if (qword_10026DC58 != -1)
    dispatch_once(&qword_10026DC58, &stru_100233480);
  v2 = byte_10026DC60;
  if (!byte_10026DC60)
  {
    fprintf(__stderrp, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_DiagnosticLogSubmissionEnabled()", ", "/Library/Caches/com.apple.xbs/Sources/WiFiManager/WiFiPerfPerAssoc.m", 480, 0);
    if (qword_10026DC50 != -1)
      dispatch_once(&qword_10026DC50, &stru_100233460);
  }
  return v2 != 0;
}

- (void)dealloc
{
  NSObject *displayStateToken;
  WiFiPerfPerAssocSession *currentSession;
  NSMutableArray *sessionsWaitingForFinalization;
  NSObject *wifiPPASerialQ;
  NSObject *symptomsReplyQueue;
  NSObject *utilityConcurrent;
  objc_super v9;

  self->_perfFeed = 0;
  self->_analyticsWorkspace = 0;
  if (notify_is_valid_token(self->_displayStateToken))
  {
    notify_cancel(self->_displayStateToken);
    self->_displayStateToken = -1;
  }

  displayStateToken = self->_displayStateToken;
  if ((_DWORD)displayStateToken)
    dispatch_release(displayStateToken);
  currentSession = self->_currentSession;
  if (currentSession)
  {

    self->_currentSession = 0;
  }
  sessionsWaitingForFinalization = self->_sessionsWaitingForFinalization;
  if (sessionsWaitingForFinalization)
  {
    -[NSMutableArray removeAllObjects](sessionsWaitingForFinalization, "removeAllObjects");

    self->_sessionsWaitingForFinalization = 0;
  }
  wifiPPASerialQ = self->_wifiPPASerialQ;
  if (wifiPPASerialQ)
  {
    dispatch_release(wifiPPASerialQ);
    self->_wifiPPASerialQ = 0;
  }
  symptomsReplyQueue = self->_symptomsReplyQueue;
  if (symptomsReplyQueue)
  {
    dispatch_release(symptomsReplyQueue);
    self->_symptomsReplyQueue = 0;
  }
  utilityConcurrent = self->_utilityConcurrent;
  if (utilityConcurrent)
  {
    dispatch_release(utilityConcurrent);
    self->_utilityConcurrent = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)WiFiPerfPerAssoc;
  -[WiFiPerfPerAssoc dealloc](&v9, "dealloc");
}

- (WiFiPerfPerAssocSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)sessionsWaitingForFinalization
{
  return self->_sessionsWaitingForFinalization;
}

- (void)setSessionsWaitingForFinalization:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)wifiPPASerialQ
{
  return self->_wifiPPASerialQ;
}

- (void)setWifiPPASerialQ:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)symptomsReplyQueue
{
  return self->_symptomsReplyQueue;
}

- (void)setSymptomsReplyQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)utilityConcurrent
{
  return self->_utilityConcurrent;
}

- (void)setUtilityConcurrent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)deviceUnderActiveUse
{
  return self->_deviceUnderActiveUse;
}

- (void)setDeviceUnderActiveUse:(BOOL)a3
{
  self->_deviceUnderActiveUse = a3;
}

- (BOOL)activeUseBeingTracked
{
  return self->_activeUseBeingTracked;
}

- (void)setActiveUseBeingTracked:(BOOL)a3
{
  self->_activeUseBeingTracked = a3;
}

- (BOOL)deviceIsAssociated
{
  return self->_deviceIsAssociated;
}

- (void)setDeviceIsAssociated:(BOOL)a3
{
  self->_deviceIsAssociated = a3;
}

- (NetworkPerformanceFeed)perfFeed
{
  return self->_perfFeed;
}

- (void)setPerfFeed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (AnalyticsWorkspace)analyticsWorkspace
{
  return self->_analyticsWorkspace;
}

- (void)setAnalyticsWorkspace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (int)displayStateToken
{
  return self->_displayStateToken;
}

- (void)setDisplayStateToken:(int)a3
{
  self->_displayStateToken = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

@end
