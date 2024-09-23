@implementation _DASBatteryTemperatureRecorder

- (void)handleBatteryNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  int64_t recentBatteryTemperature;
  int64_t *p_recentBatteryTemperature;
  NSObject *log;
  uint64_t v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;

  v3 = (void *)os_transaction_create("com.apple.dasd.batterytemperature.datacollection");
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBatteryTemperatureRecorder getBatteryStatus](self, "getBatteryStatus"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("batteryTemperature")));
    v8 = objc_msgSend(v7, "integerValue");

    if (v8)
    {
      self->_currentBatteryTemperature = (int64_t)v8;
      v9 = -[_DASBatteryTemperatureRecorder roundedTemperature:](self, "roundedTemperature:", v8);
      p_recentBatteryTemperature = &self->_recentBatteryTemperature;
      recentBatteryTemperature = self->_recentBatteryTemperature;
      log = self->_log;
      v13 = v9 - recentBatteryTemperature;
      if (v9 == recentBatteryTemperature)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
          sub_1000E6BB8(&self->_recentBatteryTemperature, v9, log);
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_INFO))
      {
        v14 = *p_recentBatteryTemperature;
        *(_DWORD *)buf = 134218496;
        v28 = v9;
        v29 = 2048;
        v30 = v14;
        v31 = 2048;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Current temp %ld, recent temp %ld, change %ld", buf, 0x20u);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pluggedIn")));

      if (v15)
      {
        if (self->_lowTemperatureCeiling <= (double)v9)
        {
          v16 = 104;
          if (self->_mediumTemperatureCeiling > (double)v9)
            v16 = 96;
        }
        else
        {
          v16 = 88;
        }
      }
      else
      {
        v16 = 112;
      }
      v17 = (uint64_t)*(double *)((char *)&self->super.isa + v16);
      if (v13 >= 0)
        v18 = v13;
      else
        v18 = -v13;
      if (v18 > v17)
      {
        v19 = self->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v28 = v13;
          v29 = 2048;
          v30 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Writing event since delta %ld is greater than %ld", buf, 0x16u);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pluggedIn")));
        v21 = objc_msgSend(v20, "BOOLValue");

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21, CFSTR("pluggedIn")));
        v26 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
        v24 = -[_DASBatteryTemperatureRecorder storeBatteryTemperatureEvent:metaData:](self, "storeBatteryTemperatureEvent:metaData:", v9, v23);

        if (v24)
          *p_recentBatteryTemperature = v9;
      }
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (id)getBatteryStatus
{
  io_registry_entry_t powerService;
  kern_return_t v4;
  int v5;
  NSObject *log;
  CFMutableDictionaryRef v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFMutableDictionaryRef properties;

  powerService = self->_powerService;
  if (!powerService)
    return 0;
  properties = 0;
  v4 = IORegistryEntryCreateCFProperties(powerService, &properties, kCFAllocatorDefault, 0);
  if (v4)
  {
    v5 = v4;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      sub_1000E6CB0(v5, log);
    return 0;
  }
  v8 = properties;
  v9 = -[__CFDictionary copy](properties, "copy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Temperature")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Temperature")));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("batteryTemperature"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ExternalConnected")));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("pluggedIn"));

  }
  else
  {
    v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000E6C48((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
    v11 = 0;
  }

  return v11;
}

- (int64_t)roundedTemperature:(int64_t)a3
{
  return (uint64_t)(round((double)a3 / 100.0) * 100.0);
}

- (_DASBatteryTemperatureRecorder)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  IONotificationPortRef v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _DASBatteryTemperatureRecorder *v15;
  NSObject *v16;
  uint8_t v18[16];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_DASBatteryTemperatureRecorder;
  v2 = -[_DASBatteryTemperatureRecorder init](&v19, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("batteryTemperatureRecorder")));
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    if ((MGGetBoolAnswer(CFSTR("pX2TxZTxWKS7QSXZDC/Z6A")) & 1) != 0)
    {
      v5 = IOServiceMatching("IOPMPowerSource");
      MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
      *((_DWORD *)v2 + 2) = MatchingService;
      if (MatchingService)
      {
        v7 = IONotificationPortCreate(kIOMainPortDefault);
        *((_QWORD *)v2 + 3) = v7;
        if (v7)
        {
          *(_OWORD *)(v2 + 72) = xmmword_10011D510;
          *(_OWORD *)(v2 + 88) = xmmword_10011D520;
          *(_OWORD *)(v2 + 104) = xmmword_10011D530;
          v8 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
          objc_msgSend(v8, "doubleForKey:", CFSTR("lowTemperatureCeiling"));
          if (v9 != 0.0)
            *((double *)v2 + 9) = v9;
          objc_msgSend(v8, "doubleForKey:", CFSTR("mediumTemperatureCeiling"));
          if (v10 != 0.0)
            *((double *)v2 + 10) = v10;
          objc_msgSend(v8, "doubleForKey:", CFSTR("nonPluggedInDelta"));
          if (v11 != 0.0)
            *((double *)v2 + 14) = v11;
          objc_msgSend(v8, "doubleForKey:", CFSTR("lowTemperatureDelta"));
          if (v12 != 0.0)
            *((double *)v2 + 11) = v12;
          objc_msgSend(v8, "doubleForKey:", CFSTR("mediumTemperatureDelta"));
          if (v13 != 0.0)
            *((double *)v2 + 12) = v13;
          objc_msgSend(v8, "doubleForKey:", CFSTR("highTemperatureDelta"));
          if (v14 != 0.0)
            *((double *)v2 + 13) = v14;

          goto LABEL_18;
        }
        if (os_log_type_enabled(*((os_log_t *)v2 + 4), OS_LOG_TYPE_ERROR))
          sub_1000E6B60();
      }
      else if (os_log_type_enabled(*((os_log_t *)v2 + 4), OS_LOG_TYPE_ERROR))
      {
        sub_1000E6B34();
      }
    }
    else
    {
      v16 = *((_QWORD *)v2 + 4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device does not have an internal battery", v18, 2u);
      }
    }
    v15 = 0;
    goto LABEL_26;
  }
LABEL_18:
  v15 = v2;
LABEL_26:

  return v15;
}

+ (_DASBatteryTemperatureRecorder)sharedInstance
{
  if (qword_1001ABBF8 != -1)
    dispatch_once(&qword_1001ABBF8, &stru_10015F3A0);
  return (_DASBatteryTemperatureRecorder *)(id)qword_1001ABC00;
}

- (void)startRecording
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  _DKEventStream *v7;
  _DKEventStream *targetStream;
  _DKKnowledgeSaving *v9;
  _DKKnowledgeSaving *knowledgeStore;

  self->_currentBatteryTemperature = -1000;
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.dasd.batteryTemperature.datacollection", v4);
  queue = self->_queue;
  self->_queue = v5;

  IONotificationPortSetDispatchQueue(self->_notifyPort, (dispatch_queue_t)self->_queue);
  if (IOServiceAddInterestNotification(self->_notifyPort, self->_powerService, "IOGeneralInterest", (IOServiceInterestCallback)sub_100003364, self, &self->_batteryNotification))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_1000E6B8C();
  }
  else
  {
    v7 = (_DKEventStream *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/dasd/batterytemperature")));
    targetStream = self->_targetStream;
    self->_targetStream = v7;

    v9 = (_DKKnowledgeSaving *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
    knowledgeStore = self->_knowledgeStore;
    self->_knowledgeStore = v9;

    self->_recentBatteryTemperature = -1000;
  }
}

- (BOOL)storeBatteryTemperatureEvent:(int64_t)a3 metaData:(id)a4
{
  _DKEventStream *targetStream;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _DKKnowledgeSaving *knowledgeStore;
  void *v12;
  id v13;
  BOOL v14;
  NSObject *log;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  void *v24;

  targetStream = self->_targetStream;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:", targetStream, v8, v9, a3, v7));

  if (v10)
  {
    knowledgeStore = self->_knowledgeStore;
    v24 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v23 = 0;
    -[_DKKnowledgeSaving saveObjects:error:](knowledgeStore, "saveObjects:error:", v12, &v23);
    v13 = v23;

    v14 = v13 == 0;
    if (v13)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        sub_1000E6D4C((uint64_t)v13, log, v16, v17, v18, v19, v20, v21);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      sub_1000E6D20();
    v14 = 0;
  }

  return v14;
}

- (int64_t)currentBatteryTemperature
{
  return self->_currentBatteryTemperature;
}

- (void)setCurrentBatteryTemperature:(int64_t)a3
{
  self->_currentBatteryTemperature = a3;
}

- (unsigned)powerService
{
  return self->_powerService;
}

- (void)setPowerService:(unsigned int)a3
{
  self->_powerService = a3;
}

- (unsigned)batteryNotification
{
  return self->_batteryNotification;
}

- (void)setBatteryNotification:(unsigned int)a3
{
  self->_batteryNotification = a3;
}

- (IONotificationPort)notifyPort
{
  return self->_notifyPort;
}

- (void)setNotifyPort:(IONotificationPort *)a3
{
  self->_notifyPort = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_DKEventStream)targetStream
{
  return self->_targetStream;
}

- (void)setTargetStream:(id)a3
{
  objc_storeStrong((id *)&self->_targetStream, a3);
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)recentBatteryTemperature
{
  return self->_recentBatteryTemperature;
}

- (void)setRecentBatteryTemperature:(int64_t)a3
{
  self->_recentBatteryTemperature = a3;
}

- (double)lowTemperatureCeiling
{
  return self->_lowTemperatureCeiling;
}

- (void)setLowTemperatureCeiling:(double)a3
{
  self->_lowTemperatureCeiling = a3;
}

- (double)mediumTemperatureCeiling
{
  return self->_mediumTemperatureCeiling;
}

- (void)setMediumTemperatureCeiling:(double)a3
{
  self->_mediumTemperatureCeiling = a3;
}

- (double)lowTemperatureDelta
{
  return self->_lowTemperatureDelta;
}

- (void)setLowTemperatureDelta:(double)a3
{
  self->_lowTemperatureDelta = a3;
}

- (double)mediumTemperatureDelta
{
  return self->_mediumTemperatureDelta;
}

- (void)setMediumTemperatureDelta:(double)a3
{
  self->_mediumTemperatureDelta = a3;
}

- (double)highTemperatureDelta
{
  return self->_highTemperatureDelta;
}

- (void)setHighTemperatureDelta:(double)a3
{
  self->_highTemperatureDelta = a3;
}

- (double)nonPluggedInDelta
{
  return self->_nonPluggedInDelta;
}

- (void)setNonPluggedInDelta:(double)a3
{
  self->_nonPluggedInDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_targetStream, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
