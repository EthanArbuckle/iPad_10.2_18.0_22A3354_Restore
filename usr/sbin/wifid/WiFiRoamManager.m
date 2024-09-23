@implementation WiFiRoamManager

+ (id)sharedWiFiRoamManager
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class(WiFiRoamManager, a2);
  objc_sync_enter(v3);
  v4 = (id)qword_10026D570;
  if (!qword_10026D570)
  {
    v4 = objc_alloc_init((Class)a1);
    qword_10026D570 = (uint64_t)v4;
  }
  objc_sync_exit(v3);
  return v4;
}

- (double)linkUpTimestamp
{
  return self->_linkUpTimestamp;
}

- (WiFiRoamManager)init
{
  char *v2;
  WiFiRoamManager *v3;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WiFiRoamManager;
  v2 = -[WiFiRoamManager init](&v10, "init");
  v3 = (WiFiRoamManager *)v2;
  if (v2)
  {
    v2[8] = 0;
    *((_QWORD *)v2 + 3) = 0;
    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 2) = 0;
    *((_QWORD *)v2 + 9) = 0;
    *((_QWORD *)v2 + 10) = 0;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)(v2 + 40) = _Q0;
    *((_QWORD *)v2 + 7) = 3;
    *((_QWORD *)v2 + 8) = 0x405E000000000000;
    *(_DWORD *)(v2 + 9) = 0;
    *((_QWORD *)v2 + 11) = 0;
    *((_QWORD *)v2 + 12) = 0;
    *((_QWORD *)v2 + 27) = objc_alloc_init((Class)NSMutableArray);
    v3->_pingPongNth = 0;
  }
  qword_10026D570 = (uint64_t)v3;
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiRoamManager;
  -[WiFiRoamManager dealloc](&v3, "dealloc");
}

- (void)setRoamStart:(id)a3 forInterface:(id)a4
{
  void *v7;
  NSDictionary *roamScanStart;
  double v9;
  id v10;
  id v11;
  void *v12;

  v7 = objc_autoreleasePoolPush();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 1) == 0)
  {
    -[WiFiRoamManager setStateFlags:](self, "setStateFlags:", -[WiFiRoamManager stateFlags](self, "stateFlags") | 1);
    roamScanStart = self->_roamScanStart;
    if (roamScanStart)

    self->_roamScanStart = (NSDictionary *)objc_msgSend(a3, "copy");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_roamScanStartTimestamp = v9;
    self->_roamScanEndTimestamp = 0.0;
    self->_isRoamLateDueToDelta = 0;
    self->_minRssiDeltaInRoamCache = 0;
    self->_maxRssiDeltaInRoamCache = 0;
    v10 = -[NSDictionary objectForKey:](self->_roamScanStart, "objectForKey:", CFSTR("ROAM_LAST_STATUS"));
    v11 = -[NSDictionary objectForKey:](self->_roamScanStart, "objectForKey:", CFSTR("ROAM_SCAN_REASON"));
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Status:%u Reason:%d (%@)", "-[WiFiRoamManager setRoamStart:forInterface:]", (unint64_t)objc_msgSend(v10, "unsignedIntValue") & 0x1FF, (unint64_t)objc_msgSend(v11, "unsignedIntValue") & 0x1FF, +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v11, "unsignedIntValue")));
    objc_autoreleasePoolPop(v12);
    -[WiFiUsageMonitor setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:](+[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance"), "setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:", 1, objc_msgSend(v11, "unsignedIntValue"), +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v11, "unsignedIntValue")), objc_msgSend(v10, "unsignedIntValue"), +[WiFiRoamManager stringRepresentationWithStatus:](WiFiRoamManager, "stringRepresentationWithStatus:", objc_msgSend(v10, "unsignedIntValue")), 0, self->_roamScanStart, 0, a4);
  }
  objc_autoreleasePoolPop(v7);
}

- (void)setRoamEndState:(id)a3 forInterface:(id)a4
{
  void *v7;
  NSDictionary *roamState;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  WiFiRoamManager *v14;
  id v15;
  id v16;
  id v17;
  _BYTE *v18;
  _BYTE *v19;
  void *v20;
  uint64_t v21;
  WiFiUsageMonitor *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  WiFiRoamManager *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v7 = objc_autoreleasePoolPush();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 2) == 0)
  {
    v32 = a4;
    -[WiFiRoamManager setStateFlags:](self, "setStateFlags:", -[WiFiRoamManager stateFlags](self, "stateFlags") | 2);
    roamState = self->_roamState;
    if (roamState)

    self->_roamState = (NSDictionary *)objc_msgSend(a3, "copy");
    v36 = +[NSMutableString string](NSMutableString, "string");
    v34 = self;
    v9 = -[NSDictionary objectForKey:](self->_roamState, "objectForKey:", CFSTR("ROAM_CACHE"));
    v31 = objc_msgSend(v9, "count");
    obj = v9;
    if (v9)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v12)
              objc_enumerationMutation(obj);
            objc_msgSend(v36, "appendFormat:", CFSTR(" {%@, %@, %@, %@} "), objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "objectForKey:", CFSTR("BSSID")), objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "objectForKey:", CFSTR("RSSI")), objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "objectForKey:", CFSTR("CHANNEL")), objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "objectForKey:", CFSTR("CHANNEL_FLAGS")));
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v11);
      }
    }
    v14 = self;
    v33 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAM_LAST_STATUS"));
    v15 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAM_SCAN_REASON"));
    v16 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_FLAGS"));
    v17 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_TIME_STARTED"));
    v30 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_TIME_ENDED"));
    v18 = objc_msgSend(v30, "unsignedLongValue");
    v29 = v17;
    v19 = objc_msgSend(v17, "unsignedLongValue");
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
    {
      v14 = v34;
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Rssi: %d Count: %d Age: %d LastStatus: %d Reason: %d Flags:%lX RoamCache: %lu - %@", "-[WiFiRoamManager setRoamEndState:forInterface:]", objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", CFSTR("RSSI")), "unsignedIntValue"), objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", CFSTR("ROAM_SCAN_COUNT")), "unsignedIntValue"), objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", CFSTR("ROAM_SCAN_AGE")), "unsignedIntValue"), objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", CFSTR("ROAM_LAST_STATUS")), "unsignedIntValue"), objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", CFSTR("ROAM_SCAN_REASON")), "unsignedIntValue"), objc_msgSend(v16, "unsignedIntegerValue"),
        v31,
        v36);
    }
    objc_autoreleasePoolPop(v20);
    -[WiFiRoamManager detectLateRoam](v14, "detectLateRoam");
    if (obj)
      -[WiFiUsageMonitor updateRoamCache:forInterface:](+[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance"), "updateRoamCache:forInterface:", obj, v32);
    if (objc_msgSend(v33, "unsignedIntValue"))
    {
      v21 = v18 - v19;
      v22 = +[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance");
      v23 = objc_msgSend(v15, "unsignedIntValue");
      v24 = +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v15, "unsignedIntValue"));
      v25 = objc_msgSend(v33, "unsignedIntValue");
      v26 = +[WiFiRoamManager stringRepresentationWithStatus:](WiFiRoamManager, "stringRepresentationWithStatus:", objc_msgSend(v33, "unsignedIntValue"));
      if (v30)
        v27 = v29 == 0;
      else
        v27 = 1;
      if (v27)
        v28 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v28 = v21;
      -[WiFiUsageMonitor setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:](v22, "setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:", 0, v23, v24, v25, v26, v28, v14->_roamState, 0, v32);
    }
  }
  objc_autoreleasePoolPop(v7);
}

- (void)setRoamPrep:(id)a3 forInterface:(id)a4
{
  void *v7;
  NSDictionary *roamPrep;
  NSDictionary *v9;
  id v10;
  void *v11;

  v7 = objc_autoreleasePoolPush();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 4) == 0)
  {
    -[WiFiRoamManager setStateFlags:](self, "setStateFlags:", -[WiFiRoamManager stateFlags](self, "stateFlags") | 4);
    roamPrep = self->_roamPrep;
    if (roamPrep)

    v9 = (NSDictionary *)objc_msgSend(a3, "copy");
    self->_roamPrep = v9;
    v10 = -[NSDictionary objectForKey:](v9, "objectForKey:", CFSTR("ROAM_SCAN_REASON"));
    -[WiFiUsageMonitor setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:](+[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance"), "setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:", 1, objc_msgSend(v10, "unsignedIntValue"), +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v10, "unsignedIntValue")), 0x7FFFFFFFFFFFFFFFLL, 0, 0, self->_roamPrep, 0, a4);
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Will roam to candidate: %@", "-[WiFiRoamManager setRoamPrep:forInterface:]", -[NSDictionary objectForKey:](self->_roamPrep, "objectForKey:", CFSTR("BSSID")));
    objc_autoreleasePoolPop(v11);
  }
  objc_autoreleasePoolPop(v7);
}

- (void)setRoamStatus:(id)a3 withBeaconCache:(id)a4 forInterface:(id)a5
{
  void *v9;
  NSDictionary *roamStatus;
  double v11;
  id v12;
  _BYTE *v13;
  _BYTE *v14;
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  WiFiUsageMonitor *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  NSDictionary *v25;
  id v26;
  void *context;
  id v28;
  id v29;
  id v30;
  int64_t v31;
  id v32;

  v9 = objc_autoreleasePoolPush();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 8) == 0)
  {
    -[WiFiRoamManager setStateFlags:](self, "setStateFlags:", -[WiFiRoamManager stateFlags](self, "stateFlags") | 8);
    roamStatus = self->_roamStatus;
    if (roamStatus)

    self->_roamStatus = (NSDictionary *)objc_msgSend(a3, "copy");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_roamScanEndTimestamp = v11;
    v12 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_TIME_STARTED"));
    v13 = objc_msgSend(-[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_TIME_ENDED")), "unsignedLongValue");
    v14 = objc_msgSend(v12, "unsignedLongValue");
    v15 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_STATUS"));
    v32 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_REASON"));
    v16 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_FLAGS"));
    v30 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_CHANNELS_SCANNED_COUNT"));
    if (((unint64_t)objc_msgSend(v15, "unsignedIntegerValue") & 0x1FF) != 0)
    {
      v29 = 0;
      v28 = 0;
      v17 = 0;
    }
    else
    {
      v17 = -[WiFiRoamManager detectPingPong](self, "detectPingPong");
      self->_pingPongNth = v17;
      v29 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAM_SCAN_SUMMARY"));
      v28 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAM_PKT_LOSS_INFO"));
    }
    v31 = v13 - v14;
    v18 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
    {
      context = v18;
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Latency:%ld Status:%u (%@) Reason:%d (%@) ScannedChannelCount:%lu Flags:%lX PingPongNth:%lu scanSummary:%@ lossSummary:%@", "-[WiFiRoamManager setRoamStatus:withBeaconCache:forInterface:]", v31, (unint64_t)objc_msgSend(v15, "unsignedIntValue") & 0x1FF, +[WiFiRoamManager stringRepresentationWithStatus:](WiFiRoamManager, "stringRepresentationWithStatus:", objc_msgSend(v15, "unsignedIntValue")), (unint64_t)objc_msgSend(v32, "unsignedIntValue") & 0x1FF, +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v32, "unsignedIntValue")), objc_msgSend(v30, "unsignedIntegerValue"), objc_msgSend(v16, "unsignedIntegerValue"), v17,
        v29,
        v28);
      v18 = context;
    }
    objc_autoreleasePoolPop(v18);
    if (v17)
    {
      v19 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: previous roams:%@", "-[WiFiRoamManager setRoamStatus:withBeaconCache:forInterface:]", self->_previousRoams);
      objc_autoreleasePoolPop(v19);
    }
    -[WiFiRoamManager detectLateRoam](self, "detectLateRoam");
    if (objc_msgSend(v15, "unsignedIntValue") == -528350205
      || -[WiFiRoamManager deviceStationary](self, "deviceStationary")
      && objc_msgSend(v15, "unsignedIntValue") == -528350133)
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      -[WiFiRoamManager setLastRoamStatusFailedNoCandidateTs:](self, "setLastRoamStatusFailedNoCandidateTs:");
    }
    if (a4)
      -[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:](+[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance"), "updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:", a4, self->_roamStatus, -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_ORIGIN_ADDR")), a5);
    v20 = +[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance");
    v21 = objc_msgSend(v32, "unsignedIntValue");
    v22 = +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v32, "unsignedIntValue"));
    v23 = objc_msgSend(v15, "unsignedIntValue");
    v24 = +[WiFiRoamManager stringRepresentationWithStatus:](WiFiRoamManager, "stringRepresentationWithStatus:", objc_msgSend(v15, "unsignedIntValue"));
    v25 = self->_roamStatus;
    if (self->_pingPongNth)
      v26 = -[NSMutableArray valueForKey:](self->_previousRoams, "valueForKey:", CFSTR("reason"));
    else
      v26 = 0;
    -[WiFiUsageMonitor setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:](v20, "setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:", 0, v21, v22, v23, v24, v31, v25, v26, a5);
  }
  objc_autoreleasePoolPop(v9);
}

- (id)copyRoamStatus
{
  void *v3;
  id v4;

  v3 = objc_autoreleasePoolPush();
  v4 = -[NSDictionary copy](self->_roamStatus, "copy");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void)setLinkUpWithBSSEnvironment:(int64_t)a3 band:(int64_t)a4 roam:(BOOL)a5 inCharging:(BOOL)a6 motionState:(int)a7
{
  uint64_t v7;
  void *v12;

  v7 = *(_QWORD *)&a7;
  v12 = objc_autoreleasePoolPush();
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[WiFiRoamManager setLinkUpTimestamp:](self, "setLinkUpTimestamp:");
  -[WiFiRoamManager setBssEnvironment:](self, "setBssEnvironment:", a3);
  -[WiFiRoamManager setCurrentBand:](self, "setCurrentBand:", a4);
  if (!a5)
  {
    -[WiFiRoamManager reset](self, "reset");
    -[WiFiRoamManager setDeviceMotionState:](self, "setDeviceMotionState:", v7);
  }
  -[WiFiRoamManager setLastRoamStatusFailedNoCandidateTs:](self, "setLastRoamStatusFailedNoCandidateTs:", 0.0);
  objc_autoreleasePoolPop(v12);
}

- (void)setLinkDown
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  -[WiFiRoamManager setDeviceMotionState:](self, "setDeviceMotionState:", 0);
  -[WiFiRoamManager setLinkUpTimestamp:](self, "setLinkUpTimestamp:", 0.0);
  -[WiFiRoamManager setBssEnvironment:](self, "setBssEnvironment:", 0);
  -[WiFiRoamManager setCurrentBand:](self, "setCurrentBand:", 0);
  -[WiFiRoamManager reset](self, "reset");
  -[WiFiRoamManager setWindowTimestamp:](self, "setWindowTimestamp:", 0.0);
  -[WiFiRoamManager setLastRoamStatusFailedNoCandidateTs:](self, "setLastRoamStatusFailedNoCandidateTs:", 0.0);
  objc_autoreleasePoolPop(v3);
}

- (void)reset
{
  void *v3;
  void *v4;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiRoamManager reset]");
  objc_autoreleasePoolPop(v4);

  self->_roamState = 0;
  self->_roamScanStartTimestamp = 0.0;
  self->_roamScanEndTimestamp = 0.0;

  self->_roamScanStart = 0;
  self->_roamState = 0;

  self->_roamPrep = 0;
  self->_roamStatus = 0;
  -[WiFiRoamManager setLastHostTriggeredRoamReason:](self, "setLastHostTriggeredRoamReason:", 0);
  -[WiFiRoamManager setStateFlags:](self, "setStateFlags:", 0);
  objc_autoreleasePoolPop(v3);
}

- (void)resetPingPong
{
  -[NSMutableArray removeAllObjects](self->_previousRoams, "removeAllObjects");
  self->_pingPongNth = 0;
}

- (void)setBTState:(int64_t)a3 type:(int64_t)a4
{
  void *v7;
  int64_t v8;
  int64_t v9;

  v7 = objc_autoreleasePoolPush();
  -[WiFiRoamManager setBtState:](self, "setBtState:", a3);
  -[WiFiRoamManager setBtType:](self, "setBtType:", a4);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[WiFiRoamManager setBtStateChangeTimestamp:](self, "setBtStateChangeTimestamp:");
  if ((id)-[WiFiRoamManager btType](self, "btType") == (id)102)
  {
    v8 = -[WiFiRoamManager btState](self, "btState");
    if ((unint64_t)(v8 - 1) <= 1)
    {
      v9 = v8;
      if ((id)-[WiFiRoamManager currentBand](self, "currentBand") == (id)1)
        -[WiFiRoamManager roamWithReason:bandPreference:](self, "roamWithReason:bandPreference:", v9, 0);
    }
  }
  objc_autoreleasePoolPop(v7);
}

- (BOOL)allowRoam
{
  void *v3;
  int64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  const char *v14;
  void *v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  double v38;
  uint64_t v39;

  v3 = objc_autoreleasePoolPush();
  v4 = -[WiFiRoamManager bssEnvironment](self, "bssEnvironment");
  if ((char *)-[WiFiRoamManager bssEnvironment](self, "bssEnvironment") - 5 >= (char *)2
    && (unint64_t)(v4 - 3) >= 2)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Not allowed for environment:%ld", "-[WiFiRoamManager allowRoam]", -[WiFiRoamManager bssEnvironment](self, "bssEnvironment"), v39);
    goto LABEL_10;
  }
  -[WiFiRoamManager linkUpTimestamp](self, "linkUpTimestamp");
  if (v5 == 0.0)
  {
    v37 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Not allowed as link not up", "-[WiFiRoamManager allowRoam]");
    goto LABEL_35;
  }
  if (-[WiFiRoamManager awdlRealTimeModeActive](self, "awdlRealTimeModeActive"))
  {
    v37 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Not allowed as awdl realtime traffic active", "-[WiFiRoamManager allowRoam]");
    goto LABEL_35;
  }
  if (!-[WiFiRoamManager ipAddrAssigned](self, "ipAddrAssigned"))
  {
    v37 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Not allowed as IP addr hasn't been assigned yet", "-[WiFiRoamManager allowRoam]");
LABEL_35:
    v15 = v37;
    goto LABEL_11;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[WiFiRoamManager linkUpTimestamp](self, "linkUpTimestamp");
  v9 = v7 - v8;
  -[WiFiRoamManager paramMinRoamWaitTimeFromLinkUpInSec](self, "paramMinRoamWaitTimeFromLinkUpInSec");
  if (v9 >= v10)
  {
    -[WiFiRoamManager windowTimestamp](self, "windowTimestamp");
    if (v17 == 0.0
      || (-[WiFiRoamManager windowTimestamp](self, "windowTimestamp"),
          v19 = v7 - v18,
          -[WiFiRoamManager paramWindowSizeInSec](self, "paramWindowSizeInSec"),
          v19 >= v20))
    {
      v27 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Resetting window", "-[WiFiRoamManager allowRoam]");
      objc_autoreleasePoolPop(v27);
      -[WiFiRoamManager setWindowTimestamp:](self, "setWindowTimestamp:", v7);
      -[WiFiRoamManager setRoamAttemptCount:](self, "setRoamAttemptCount:", 0);
      -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
      if (v28 != 0.0)
      {
        -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
        v30 = v7 - v29;
        -[WiFiRoamManager paramMinRoamRetryWaitTime](self, "paramMinRoamRetryWaitTime");
        if (v30 <= v31)
        {
          v11 = objc_autoreleasePoolPush();
          v12 = (void *)qword_10026DD20;
          if (!qword_10026DD20)
            goto LABEL_10;
          -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
          v38 = v7 - v33;
          v14 = "%s: Not allowed as last attempt was %2.2f sec ago ";
          goto LABEL_9;
        }
      }
    }
    else
    {
      v21 = -[WiFiRoamManager roamAttemptCount](self, "roamAttemptCount");
      if (v21 >= -[WiFiRoamManager paramMaxRoamRetriesInWindow](self, "paramMaxRoamRetriesInWindow"))
      {
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)qword_10026DD20;
        if (!qword_10026DD20)
          goto LABEL_10;
        -[WiFiRoamManager windowTimestamp](self, "windowTimestamp");
        v35 = v7 - v34;
        -[WiFiRoamManager paramWindowSizeInSec](self, "paramWindowSizeInSec");
        v38 = v35;
        v39 = v36;
        v14 = "%s: Not allowed as max attempts made. Only %2.2f sec into window size %2.2f";
        goto LABEL_9;
      }
      -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
      if (v22 != 0.0)
      {
        -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
        v24 = v7 - v23;
        -[WiFiRoamManager paramMinRoamRetryWaitTime](self, "paramMinRoamRetryWaitTime");
        if (v24 <= v25)
        {
          v11 = objc_autoreleasePoolPush();
          v12 = (void *)qword_10026DD20;
          if (!qword_10026DD20)
            goto LABEL_10;
          -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
          v38 = v7 - v26;
          v14 = "%s: Not allowed as last attempt was %2.2f sec ago";
          goto LABEL_9;
        }
      }
    }
    -[WiFiRoamManager setRoamAttemptCount:](self, "setRoamAttemptCount:", (char *)-[WiFiRoamManager roamAttemptCount](self, "roamAttemptCount") + 1);
    -[WiFiRoamManager setLastRoamAttemptTimestamp:](self, "setLastRoamAttemptTimestamp:", v7);
    v16 = 1;
    goto LABEL_24;
  }
  v11 = objc_autoreleasePoolPush();
  v12 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    -[WiFiRoamManager linkUpTimestamp](self, "linkUpTimestamp");
    v38 = v7 - v13;
    v14 = "%s: Not allowed as link up was %2.2f sec ago";
LABEL_9:
    objc_msgSend(v12, "WFLog:message:", 3, v14, "-[WiFiRoamManager allowRoam]", *(_QWORD *)&v38, v39);
  }
LABEL_10:
  v15 = v11;
LABEL_11:
  objc_autoreleasePoolPop(v15);
  v16 = 0;
LABEL_24:
  objc_autoreleasePoolPop(v3);
  return v16;
}

- (BOOL)roamWithReason:(unint64_t)a3 bandPreference:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  NSDictionary *v9;
  __CFNotificationCenter *LocalCenter;
  BOOL v11;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v4 = *(_QWORD *)&a4;
  v7 = objc_autoreleasePoolPush();
  if (v4 >= 3)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Invalid band preference: %d. Exiting", "-[WiFiRoamManager roamWithReason:bandPreference:]", 0);
    objc_autoreleasePoolPop(v13);
    goto LABEL_10;
  }
  if (!-[WiFiRoamManager allowRoam](self, "allowRoam"))
  {
LABEL_10:
    v11 = 0;
    goto LABEL_6;
  }
  v8 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Host triggered roam allowed for reason: %lu with bandPref: %d ", "-[WiFiRoamManager roamWithReason:bandPreference:]", a3, v4);
  objc_autoreleasePoolPop(v8);
  -[WiFiRoamManager setLastHostTriggeredRoamReason:](self, "setLastHostTriggeredRoamReason:", a3);
  v14[0] = CFSTR("com.apple.wifid.wifiroammangerroamtype");
  v14[1] = CFSTR("com.apple.wifid.wifiroammangerroamreason");
  v15[0] = +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", (char)v4);
  v15[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)a3);
  v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  v11 = 1;
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("com.apple.wifid.wifiroammanagerroamnotification"), 0, (CFDictionaryRef)v9, 1u);
LABEL_6:
  objc_autoreleasePoolPop(v7);
  return v11;
}

- (BOOL)canSubmitMetrics
{
  double Current;
  double v4;
  unsigned int v5;
  void *v6;
  const char *v7;

  Current = CFAbsoluteTimeGetCurrent();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 8) != 0
    && (-[WiFiRoamManager lastRoamSuppressionRemovalTime](self, "lastRoamSuppressionRemovalTime"), Current - v4 > 30.0))
  {
    v5 = (-[WiFiRoamManager stateFlags](self, "stateFlags") >> 1) & 1;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
  {
    v7 = "No";
    if (v5)
      v7 = "Yes";
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %s", "-[WiFiRoamManager canSubmitMetrics]", v7);
  }
  objc_autoreleasePoolPop(v6);
  return v5;
}

- (BOOL)detectLateRoam
{
  void *v3;
  NSDictionary *roamStatus;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  char v24;
  void *v25;
  void *v27;
  char v28;
  unsigned int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = objc_autoreleasePoolPush();
  if (!self->_roamState
    || (roamStatus = self->_roamStatus) == 0
    || (v5 = -[NSDictionary objectForKey:](roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_STATUS")),
        v6 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_REASON")),
        objc_msgSend(v5, "unsignedIntValue") != -528350205)
    && objc_msgSend(v5, "unsignedIntValue") != -528350133
    || objc_msgSend(v6, "unsignedIntegerValue") != (id)3766619137)
  {
    v22 = 0;
    goto LABEL_44;
  }
  v29 = objc_msgSend(-[NSDictionary objectForKey:](self->_roamState, "objectForKey:", CFSTR("RSSI")), "unsignedIntValue");
  v7 = -[NSDictionary objectForKey:](self->_roamState, "objectForKey:", CFSTR("ROAM_CACHE"));
  if (!v7)
  {
    v25 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: no roam cache", "-[WiFiRoamManager detectLateRoam]");
    objc_autoreleasePoolPop(v25);
    goto LABEL_42;
  }
  v8 = v7;
  if (!objc_msgSend(v7, "count"))
  {
LABEL_42:
    v24 = 0;
    goto LABEL_43;
  }
  v27 = v3;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v9)
  {
    v28 = 0;
    goto LABEL_36;
  }
  v10 = v9;
  v28 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v31;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v13);
      if (!v14)
      {
        v17 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: ERROR: no roam candidate at idx %d in cache with count %lu ", "-[WiFiRoamManager detectLateRoam]", (char *)v13 + v11, objc_msgSend(v8, "count"));
        goto LABEL_19;
      }
      v15 = objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v13), "objectForKey:", CFSTR("RSSI")), "unsignedIntValue");
      v16 = v15;
      if ((int)v15 <= -90)
      {
        v17 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Roam candidate %d has weak RSSI %d ", "-[WiFiRoamManager detectLateRoam]", (char *)v13 + v11, v16);
LABEL_19:
        objc_autoreleasePoolPop(v17);
        goto LABEL_20;
      }
      v18 = v15 - v29;
      v19 = objc_msgSend(v14, "objectForKey:", CFSTR("BSSID"));
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Roam candidate %@ (idx %d) has RSSI delta %d ", "-[WiFiRoamManager detectLateRoam]", v19, (char *)v13 + v11, v18);
      objc_autoreleasePoolPop(v20);
      if ((v18 - 1) <= 0xB)
      {
        -[WiFiRoamManager setIsRoamLateDueToDelta:](self, "setIsRoamLateDueToDelta:", 1);
        if (!-[WiFiRoamManager minRssiDeltaInRoamCache](self, "minRssiDeltaInRoamCache")
          || -[WiFiRoamManager minRssiDeltaInRoamCache](self, "minRssiDeltaInRoamCache") > v18)
        {
          -[WiFiRoamManager setMinRssiDeltaInRoamCache:](self, "setMinRssiDeltaInRoamCache:", v18);
        }
        if (!-[WiFiRoamManager maxRssiDeltaInRoamCache](self, "maxRssiDeltaInRoamCache")
          || -[WiFiRoamManager maxRssiDeltaInRoamCache](self, "maxRssiDeltaInRoamCache") < v18)
        {
          -[WiFiRoamManager setMaxRssiDeltaInRoamCache:](self, "setMaxRssiDeltaInRoamCache:", v18);
        }
        v28 = 1;
      }
LABEL_20:
      v13 = (char *)v13 + 1;
    }
    while (v10 != v13);
    v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v10 = v21;
    v11 = (v11 + (_DWORD)v13);
  }
  while (v21);
LABEL_36:
  v23 = objc_autoreleasePoolPush();
  v24 = v28;
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: isLateRoam: %d", "-[WiFiRoamManager detectLateRoam]", v28 & 1);
  objc_autoreleasePoolPop(v23);
  v3 = v27;
LABEL_43:
  v22 = v24 & 1;
LABEL_44:
  objc_autoreleasePoolPop(v3);
  return v22;
}

- (unint64_t)detectPingPong
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  PreviousRoam *v8;
  NSMutableSet *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  double v17;
  char *v18;
  NSMutableArray *previousRoams;
  unint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (!self->_roamStatus)
  {
    NSLog(CFSTR("%s - _roamStatus not available. bail"), a2, "-[WiFiRoamManager detectPingPong]");
    return 0;
  }
  if (!-[WiFiRoamManager previousRoams](self, "previousRoams"))
  {
    NSLog(CFSTR("%s - previousRoams not available. bail"), v3, "-[WiFiRoamManager detectPingPong]");
    return 0;
  }
  v4 = objc_autoreleasePoolPush();
  v5 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_REASON"));
  v6 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_TARGET_ADDR"));
  v7 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", CFSTR("ROAMEDEVENT_ORIGIN_ADDR"));
  if (objc_msgSend(v6, "isEqualToData:", v7))
  {
    NSLog(CFSTR("%s - roamTarget (%@) and roamOrigin (%@) are identical, bail"), "-[WiFiRoamManager detectPingPong]", v6, v7);
LABEL_29:
    objc_autoreleasePoolPop(v4);
    return 0;
  }
  v8 = +[PreviousRoam roamWithBssid:andReason:](PreviousRoam, "roamWithBssid:andReason:", v6, objc_msgSend(v5, "unsignedIntegerValue"));
  if (!v8)
  {
    NSLog(CFSTR("%s - cannot get instance of PreviousRoam class, bail"), "-[WiFiRoamManager detectPingPong]");
    goto LABEL_29;
  }
  -[NSMutableArray addObject:](self->_previousRoams, "addObject:", v8);
  v9 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 2);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(-[NSMutableArray reverseObjectEnumerator](self->_previousRoams, "reverseObjectEnumerator"), "allObjects");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    v14 = -1;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(objc_msgSend(v16, "timestamp"), "timeIntervalSinceNow");
        if (v17 < -60.0
          && v14 <= (uint64_t)-[NSMutableArray indexOfObject:](self->_previousRoams, "indexOfObject:", v16))
        {
          v14 = (uint64_t)-[NSMutableArray indexOfObject:](self->_previousRoams, "indexOfObject:", v16);
        }
        if ((-[NSMutableSet containsObject:](v9, "containsObject:", objc_msgSend(v16, "bssid")) & 1) != 0
          || -[NSMutableSet count](v9, "count") != (id)2)
        {
          -[NSMutableSet addObject:](v9, "addObject:", objc_msgSend(v16, "bssid"));
        }
        else if (v14 <= (uint64_t)-[NSMutableArray indexOfObject:](self->_previousRoams, "indexOfObject:", v16))
        {
          v14 = (uint64_t)-[NSMutableArray indexOfObject:](self->_previousRoams, "indexOfObject:", v16);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
    if ((v14 & 0x8000000000000000) == 0)
      -[NSMutableArray removeObjectsInRange:](self->_previousRoams, "removeObjectsInRange:", 0, v14 + 1);
  }
  v18 = (char *)-[NSMutableArray count](self->_previousRoams, "count");
  previousRoams = self->_previousRoams;
  v20 = (unint64_t)(v18 - 2) & ~((uint64_t)(v18 - 2) >> 63);
  NSLog(CFSTR("%s - _previousRoams:%@\npingPongNth=%ld (-->%lu)"), "-[WiFiRoamManager detectPingPong]", previousRoams, v18 - 2, v20);
  objc_autoreleasePoolPop(v4);
  return v20;
}

- (void)setDeviceMotionState:(int)a3
{
  void *v5;
  double v6;

  v5 = objc_autoreleasePoolPush();
  -[WiFiRoamManager linkUpTimestamp](self, "linkUpTimestamp");
  if (v6 != 0.0)
    -[WiFiRoamManager setDeviceStationary:](self, "setDeviceStationary:", a3 == 1);
  objc_autoreleasePoolPop(v5);
}

+ (id)stringRepresentationWithStatus:(unsigned int)a3
{
  id result;

  if ((a3 & 0x1FF) == 0)
    return CFSTR("Success");
  result = CFSTR("Operation failed");
  switch(a3)
  {
    case 0xE0820401:
      return result;
    case 0xE0820402:
      result = CFSTR("Operation timed out");
      break;
    case 0xE0820403:
      result = CFSTR("Failed due to no matching network found");
      break;
    case 0xE0820404:
      result = CFSTR("Operation was aborted");
      break;
    case 0xE0820405:
      result = CFSTR("Protocol failure: packet not ack'd");
      break;
    case 0xE0820406:
      result = CFSTR("AUTH or ASSOC packet was unsolicited");
      break;
    case 0xE0820407:
      result = CFSTR("Attempt to assoc to an auto auth configuration");
      break;
    case 0xE0820408:
      result = CFSTR("Scan results are incomplete");
      break;
    case 0xE0820409:
      result = CFSTR("Scan aborted by another scan");
      break;
    case 0xE082040A:
      result = CFSTR("Scan aborted due to assoc in progress");
      break;
    case 0xE082040B:
      result = CFSTR("802.11h quiet period started");
      break;
    case 0xE082040C:
      result = CFSTR("User disabled scanning");
      break;
    case 0xE082040D:
      result = CFSTR("No allowable channels to scan");
      break;
    case 0xE082040E:
      result = CFSTR("Scan aborted due to CCX fast roam");
      break;
    case 0xE082040F:
      result = CFSTR("Abort channel select");
      break;
    default:
      if (a3 == -528350133)
        result = CFSTR("Network found but filtered out by roam score logic");
      else
        result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown=%ld"), a3);
      break;
  }
  return result;
}

+ (id)stringRepresentationWithReason:(unsigned int)a3
{
  if (a3 + 528348160 >= 0x14)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown=%ld"), a3);
  else
    return *(&off_10022ED98 + (int)(a3 + 528348160));
}

+ (id)stringRepresentationWithHostReason:(int64_t)a3
{
  if ((unint64_t)a3 >= 7)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown=%ld"), a3);
  else
    return *(&off_10022EE38 + a3);
}

- (BOOL)isLastRoamDueToBeaconLost
{
  NSDictionary *roamScanStart;
  id v3;

  roamScanStart = self->_roamScanStart;
  if (roamScanStart)
  {
    v3 = -[NSDictionary objectForKey:](roamScanStart, "objectForKey:", CFSTR("ROAM_SCAN_REASON"));
    LOBYTE(roamScanStart) = v3 && objc_msgSend(v3, "unsignedIntValue") == -528348156;
  }
  return (char)roamScanStart;
}

- (NSDictionary)roamState
{
  return self->_roamState;
}

- (double)roamScanStartTimestamp
{
  return self->_roamScanStartTimestamp;
}

- (void)setRoamScanStartTimestamp:(double)a3
{
  self->_roamScanStartTimestamp = a3;
}

- (double)roamScanEndTimestamp
{
  return self->_roamScanEndTimestamp;
}

- (void)setRoamScanEndTimestamp:(double)a3
{
  self->_roamScanEndTimestamp = a3;
}

- (double)paramMinRoamWaitTimeFromLinkUpInSec
{
  return self->_paramMinRoamWaitTimeFromLinkUpInSec;
}

- (void)setParamMinRoamWaitTimeFromLinkUpInSec:(double)a3
{
  self->_paramMinRoamWaitTimeFromLinkUpInSec = a3;
}

- (double)paramMinRoamRetryWaitTime
{
  return self->_paramMinRoamRetryWaitTime;
}

- (void)setParamMinRoamRetryWaitTime:(double)a3
{
  self->_paramMinRoamRetryWaitTime = a3;
}

- (int64_t)paramMaxRoamRetriesInWindow
{
  return self->_paramMaxRoamRetriesInWindow;
}

- (void)setParamMaxRoamRetriesInWindow:(int64_t)a3
{
  self->_paramMaxRoamRetriesInWindow = a3;
}

- (double)paramWindowSizeInSec
{
  return self->_paramWindowSizeInSec;
}

- (void)setParamWindowSizeInSec:(double)a3
{
  self->_paramWindowSizeInSec = a3;
}

- (BOOL)isRoamLateDueToDelta
{
  return self->_isRoamLateDueToDelta;
}

- (void)setIsRoamLateDueToDelta:(BOOL)a3
{
  self->_isRoamLateDueToDelta = a3;
}

- (int64_t)minRssiDeltaInRoamCache
{
  return self->_minRssiDeltaInRoamCache;
}

- (void)setMinRssiDeltaInRoamCache:(int64_t)a3
{
  self->_minRssiDeltaInRoamCache = a3;
}

- (int64_t)maxRssiDeltaInRoamCache
{
  return self->_maxRssiDeltaInRoamCache;
}

- (void)setMaxRssiDeltaInRoamCache:(int64_t)a3
{
  self->_maxRssiDeltaInRoamCache = a3;
}

- (int64_t)lastHostTriggeredRoamReason
{
  return self->_lastHostTriggeredRoamReason;
}

- (void)setLastHostTriggeredRoamReason:(int64_t)a3
{
  self->_lastHostTriggeredRoamReason = a3;
}

- (BOOL)awdlRealTimeModeActive
{
  return self->_awdlRealTimeModeActive;
}

- (void)setAwdlRealTimeModeActive:(BOOL)a3
{
  self->_awdlRealTimeModeActive = a3;
}

- (BOOL)ipAddrAssigned
{
  return self->_ipAddrAssigned;
}

- (void)setIpAddrAssigned:(BOOL)a3
{
  self->_ipAddrAssigned = a3;
}

- (double)lastRoamStatusFailedNoCandidateTs
{
  return self->_lastRoamStatusFailedNoCandidateTs;
}

- (void)setLastRoamStatusFailedNoCandidateTs:(double)a3
{
  self->_lastRoamStatusFailedNoCandidateTs = a3;
}

- (double)lastRoamSuppressionRemovalTime
{
  return self->_lastRoamSuppressionRemovalTime;
}

- (void)setLastRoamSuppressionRemovalTime:(double)a3
{
  self->_lastRoamSuppressionRemovalTime = a3;
}

- (unint64_t)pingPongNth
{
  return self->_pingPongNth;
}

- (void)setPingPongNth:(unint64_t)a3
{
  self->_pingPongNth = a3;
}

- (NSDictionary)roamScanStart
{
  return self->_roamScanStart;
}

- (void)setRoamScanStart:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSDictionary)roamPrep
{
  return self->_roamPrep;
}

- (void)setRoamPrep:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSDictionary)roamStatus
{
  return self->_roamStatus;
}

- (void)setRoamStatus:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (int64_t)roamAttemptCount
{
  return self->_roamAttemptCount;
}

- (void)setRoamAttemptCount:(int64_t)a3
{
  self->_roamAttemptCount = a3;
}

- (int64_t)bssEnvironment
{
  return self->_bssEnvironment;
}

- (void)setBssEnvironment:(int64_t)a3
{
  self->_bssEnvironment = a3;
}

- (int64_t)currentBand
{
  return self->_currentBand;
}

- (void)setCurrentBand:(int64_t)a3
{
  self->_currentBand = a3;
}

- (int64_t)btState
{
  return self->_btState;
}

- (void)setBtState:(int64_t)a3
{
  self->_btState = a3;
}

- (int64_t)btType
{
  return self->_btType;
}

- (void)setBtType:(int64_t)a3
{
  self->_btType = a3;
}

- (double)btStateChangeTimestamp
{
  return self->_btStateChangeTimestamp;
}

- (void)setBtStateChangeTimestamp:(double)a3
{
  self->_btStateChangeTimestamp = a3;
}

- (void)setLinkUpTimestamp:(double)a3
{
  self->_linkUpTimestamp = a3;
}

- (double)windowTimestamp
{
  return self->_windowTimestamp;
}

- (void)setWindowTimestamp:(double)a3
{
  self->_windowTimestamp = a3;
}

- (double)lastRoamAttemptTimestamp
{
  return self->_lastRoamAttemptTimestamp;
}

- (void)setLastRoamAttemptTimestamp:(double)a3
{
  self->_lastRoamAttemptTimestamp = a3;
}

- (unsigned)stateFlags
{
  return self->_stateFlags;
}

- (void)setStateFlags:(unsigned __int8)a3
{
  self->_stateFlags = a3;
}

- (BOOL)deviceStationary
{
  return self->_deviceStationary;
}

- (void)setDeviceStationary:(BOOL)a3
{
  self->_deviceStationary = a3;
}

- (NSMutableArray)previousRoams
{
  return self->_previousRoams;
}

- (void)setPreviousRoams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

@end
