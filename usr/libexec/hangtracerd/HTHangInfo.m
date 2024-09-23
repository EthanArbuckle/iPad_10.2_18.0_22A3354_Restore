@implementation HTHangInfo

- (double)hangDurationMS
{
  return sub_1000273EC(self->_endTime - self->_startTime);
}

- (NSString)hangDescription
{
  NSString *processName;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  processName = self->_processName;
  v4 = sub_100019D58(self->_hangSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[HTHangInfo hangDurationMS](self, "hangDurationMS");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@, %.0fms"), processName, v5, v6));

  return (NSString *)v7;
}

+ (unint64_t)hangSequenceStartTime
{
  return qword_10005FC28;
}

+ (unint64_t)hangSequenceEndTime
{
  return qword_10005FC08;
}

+ (unint64_t)hangSequenceLastHangReportedTime
{
  return qword_10005FC30;
}

+ (void)addHang:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = a3;
  if (qword_10005FC10 != -1)
    dispatch_once(&qword_10005FC10, &stru_10004D1E0);
  if (!objc_msgSend((id)qword_10005FC18, "count"))
  {
    v4 = objc_alloc_init((Class)NSUUID);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
    v6 = (void *)qword_10005FC20;
    qword_10005FC20 = v5;

  }
  v7 = objc_msgSend(v3, "startTime");
  if ((unint64_t)v7 < qword_10005FC28)
    qword_10005FC28 = (uint64_t)objc_msgSend(v3, "startTime");
  v8 = objc_msgSend(v3, "endTime");
  if ((unint64_t)v8 > qword_10005FC08)
    qword_10005FC08 = (uint64_t)objc_msgSend(v3, "endTime");
  v9 = objc_msgSend(v3, "reportedTime");
  if ((unint64_t)v9 > qword_10005FC30)
    qword_10005FC30 = (uint64_t)objc_msgSend(v3, "reportedTime");
  objc_msgSend((id)qword_10005FC18, "addObject:", v3);
  v10 = sub_100024FF4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hangDescription"));
    v13 = 138543362;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ added to tailspin capture", (uint8_t *)&v13, 0xCu);

  }
}

+ (id)allHangs
{
  return objc_msgSend((id)qword_10005FC18, "copy");
}

+ (id)firstHang
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)qword_10005FC18;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      v7 = v4;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v4 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6);

        v8 = objc_msgSend(v4, "startTime", (_QWORD)v10);
        if (v8 == (id)qword_10005FC28)
        {
          v3 = v4;
          v4 = v2;
          v2 = v3;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
        v7 = v4;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
LABEL_11:

  }
  return v3;
}

+ (unint64_t)numberOfHangs
{
  return (unint64_t)objc_msgSend((id)qword_10005FC18, "count");
}

+ (void)cleanupAllHangs
{
  void *v2;
  void *v3;

  objc_msgSend((id)qword_10005FC18, "removeAllObjects");
  qword_10005FC08 = 0;
  qword_10005FC28 = -1;
  qword_10005FC30 = 0;
  if (qword_10005FC00)
  {
    dispatch_source_cancel((dispatch_source_t)qword_10005FC00);
    v2 = (void *)qword_10005FC00;
    qword_10005FC00 = 0;

  }
  v3 = (void *)qword_10005FC20;
  if (qword_10005FC20)
  {
    qword_10005FC20 = 0;

  }
}

- (NSDictionary)infoDict
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  NSString *serviceName;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  _QWORD v30[18];
  _QWORD v31[18];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enablementPrefix"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enablementPrefix"));

  }
  else
  {
    v6 = &stru_10004F0D8;
  }

  if (!self->_userActionData
    || (v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", -[NSData bytes](self->_userActionData, "bytes"), -[NSData length](self->_userActionData, "length"), 4, 0)) == 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  v30[0] = CFSTR("Reason");
  v30[1] = CFSTR("ServiceName");
  serviceName = self->_serviceName;
  v31[0] = self->_reason;
  v31[1] = serviceName;
  v31[2] = self->_processPath;
  v30[2] = CFSTR("ProcessPath");
  v30[3] = CFSTR("PID");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pid));
  v31[3] = v27;
  v30[4] = CFSTR("ThreadID");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_tid));
  v31[4] = v26;
  v30[5] = CFSTR("StartTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_startTime));
  v31[5] = v25;
  v30[6] = CFSTR("EndTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_endTime));
  v31[6] = v24;
  v30[7] = CFSTR("ReportedTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_reportedTime));
  v31[7] = v23;
  v30[8] = CFSTR("HangType");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_hangSubType));
  v31[8] = v22;
  v30[9] = CFSTR("DisplayData");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo displayStateArray](HTProcessInfo, "displayStateArray"));
  v31[9] = v9;
  v30[10] = CFSTR("NetworkState");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HTNetworkInfo networkStateForTailSpin](HTNetworkInfo, "networkStateForTailSpin"));
  v11 = v10;
  if (!v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v31[10] = v11;
  v31[11] = qword_10005FC20;
  v30[11] = CFSTR("HangUUID");
  v30[12] = CFSTR("HangNotificationUUID");
  v31[12] = self->_hangUUID;
  v30[13] = CFSTR("CreatedAt");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0f"), v13));
  v31[13] = v14;
  v31[14] = v7;
  v28 = v7;
  v29 = v6;
  v30[14] = CFSTR("UserAction");
  v30[15] = CFSTR("EnablementType");
  v31[15] = v6;
  v30[16] = CFSTR("DisplayedInHUD");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_displayedInHUD));
  v31[16] = v15;
  v30[17] = CFSTR("IsThirdPartyDevSupportModeHang");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isThirdPartyDevSupportModeHang));
  v31[17] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 18));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v17));

  if (!v10)
  if (sub_100019E54(self->_serviceName) == 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo recentAppsDict](HTProcessInfo, "recentAppsDict"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("RecentAppsDict"));

  }
  if (self->_hangSubType == 5)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_blownFenceID));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("CAFenceId"));

  }
  return (NSDictionary *)v18;
}

- (HTHangInfo)initWithPid:(int)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 reportedTime:(unint64_t)a7 blownFenceID:(unint64_t)a8 hangSubtype:(int64_t)a9 isFirstPartyApp:(BOOL)a10 isThirdPartyDevSupportModeHang:(BOOL)a11 displayedInHUD:(BOOL)a12 serviceName:(id)a13 reason:(id)a14 processName:(id)a15 processPath:(id)a16 userActionData:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  HTHangInfo *v27;
  unint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSString *hangUUID;
  NSString *v33;
  NSString *serviceName;
  NSString *v35;
  NSString *reason;
  NSString *v37;
  NSString *processName;
  NSString *v39;
  NSString *processPath;
  NSData *v41;
  NSData *userActionData;
  void *v44;
  objc_super v47;

  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v26 = a17;
  v47.receiver = self;
  v47.super_class = (Class)HTHangInfo;
  v27 = -[HTHangInfo init](&v47, "init");
  if (v27)
  {
    v44 = v22;
    v28 = a6;
    v29 = v26;
    v30 = objc_alloc_init((Class)NSUUID);
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUIDString"));
    hangUUID = v27->_hangUUID;
    v27->_hangUUID = (NSString *)v31;

    v26 = v29;
    v27->_pid = a3;
    v27->_tid = a4;
    v27->_startTime = a5;
    v27->_endTime = v28;
    v27->_reportedTime = a7;
    v27->_blownFenceID = a8;
    v27->_hangSubType = a9;
    v22 = v44;
    v27->_isFirstPartyApp = a10;
    v27->_isThirdPartyDevSupportModeHang = a11;
    v27->_displayedInHUD = a12;
    v33 = (NSString *)objc_msgSend(v44, "copy");
    serviceName = v27->_serviceName;
    v27->_serviceName = v33;

    v35 = (NSString *)objc_msgSend(v23, "copy");
    reason = v27->_reason;
    v27->_reason = v35;

    v37 = (NSString *)objc_msgSend(v24, "copy");
    processName = v27->_processName;
    v27->_processName = v37;

    v39 = (NSString *)objc_msgSend(v25, "copy");
    processPath = v27->_processPath;
    v27->_processPath = v39;

    v41 = (NSData *)objc_msgSend(v29, "copy");
    userActionData = v27->_userActionData;
    v27->_userActionData = v41;

  }
  return v27;
}

+ (double)getHangWaitTimeout
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v28;
  double v29;
  id v30;
  int v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;

  v2 = mach_absolute_time();
  v3 = +[HTProcessInfo getEarliestPendingHangStartTime:](HTProcessInfo, "getEarliestPendingHangStartTime:", v2);
  if (v3 >= qword_10005FC28)
    v4 = qword_10005FC28;
  else
    v4 = v3;
  if (v3)
    v5 = v4;
  else
    v5 = qword_10005FC28;
  if (qword_10005FC28)
    v6 = qword_10005FC30 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = sub_100024FF4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v11 = 0.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_10002DDD8(v8, v9, v10);
  }
  else
  {
    v12 = v3;
    if (v2 >= v5)
    {
      if (v2 >= qword_10005FC30)
      {
        if (v2 >= v3)
        {
          v17 = sub_1000273EC(v2 - v5);
          v18 = sub_1000273EC(v2 - qword_10005FC30);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
          v20 = (double)(unint64_t)objc_msgSend(v19, "hangWaitTimeoutDurationMSec");

          v21 = 0.0;
          v22 = 0.0;
          if (v17 < v20)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
            v22 = (double)(unint64_t)objc_msgSend(v23, "hangWaitTimeoutDurationMSec") - v17;

          }
          v24 = 0.0;
          if (v12)
          {
            v21 = sub_1000273EC(v2 - v12);
            if (v22 + v21 >= 500.0)
              v24 = v22;
            else
              v24 = 0.0;
          }
          v25 = 0.0;
          if (qword_10005FC08 > v2)
            v25 = sub_1000273EC(qword_10005FC08 - v2);
          v26 = 350.0 - v18;
          if (350.0 - v18 > v22 + -250.0)
            v26 = v22 + -250.0;
          if (v22 >= 250.0 && v18 < 350.0)
            v28 = v26;
          else
            v28 = 0.0;
          if (v24 >= v25)
            v29 = v24;
          else
            v29 = v25;
          if (v29 < v28)
            v29 = v28;
          if (v29 <= v22)
            v11 = v29;
          else
            v11 = v22;
          v30 = sub_100024FF4();
          v8 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v32 = 134219776;
            v33 = v11;
            v34 = 2048;
            v35 = v17;
            v36 = 2048;
            v37 = v21;
            v38 = 2048;
            v39 = v18;
            v40 = 2048;
            v41 = v22;
            v42 = 2048;
            v43 = v24;
            v44 = 2048;
            v45 = v25;
            v46 = 2048;
            v47 = v28;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getHangWaitTimeout: waitTimeMS=%.0fms, timeSinceEarliestHangStartMS=%.0fms, timeSinceEarliestPendingHangStartMS=%.0fms, timeSinceLastHangReportedMS=%.0fms, maxRemainingWaitTimeMS=%.0fms, timeToWaitForPendingHangsMs=%.0fms, timeToWaitForHangsThatEndsInTheFutureMS=%.0fms, timeToWaitForConsecutiveHangsMS=%.0fms", (uint8_t *)&v32, 0x52u);
          }
        }
        else
        {
          v16 = sub_100024FF4();
          v8 = objc_claimAutoreleasedReturnValue(v16);
          v11 = 0.0;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
            sub_10002DF40();
        }
      }
      else
      {
        v14 = sub_100024FF4();
        v8 = objc_claimAutoreleasedReturnValue(v14);
        v11 = 0.0;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          sub_10002DEC4(v2, v8, v15);
      }
    }
    else
    {
      v13 = sub_100024FF4();
      v8 = objc_claimAutoreleasedReturnValue(v13);
      v11 = 0.0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        sub_10002DE5C();
    }
  }

  return v11;
}

- (int)pid
{
  return self->_pid;
}

- (unint64_t)tid
{
  return self->_tid;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (unint64_t)reportedTime
{
  return self->_reportedTime;
}

- (unint64_t)blownFenceID
{
  return self->_blownFenceID;
}

- (int64_t)hangSubType
{
  return self->_hangSubType;
}

- (BOOL)displayedInHUD
{
  return self->_displayedInHUD;
}

- (BOOL)isFirstPartyApp
{
  return self->_isFirstPartyApp;
}

- (BOOL)isThirdPartyDevSupportModeHang
{
  return self->_isThirdPartyDevSupportModeHang;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)hangTimestamp
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)processPath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSData)userActionData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (int64_t)failReason
{
  return self->_failReason;
}

- (void)setFailReason:(int64_t)a3
{
  self->_failReason = a3;
}

- (NSString)hangUUID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hangUUID, 0);
  objc_storeStrong((id *)&self->_userActionData, 0);
  objc_storeStrong((id *)&self->_processPath, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_hangTimestamp, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
