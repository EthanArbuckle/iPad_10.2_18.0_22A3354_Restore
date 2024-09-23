@implementation CMSLogger

+ (id)_LoggingQueue
{
  if (qword_1000527D8 != -1)
    dispatch_once(&qword_1000527D8, &stru_10004A770);
  return (id)qword_1000527E0;
}

- (id)initForIdentity:(id)a3
{
  id v4;
  CMSLogger *v5;
  NSString *v6;
  NSString *logIdentity;
  uint64_t v8;
  NSString *performanceLog;
  uint64_t v10;
  NSString *occuranceLog;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *performanceData;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *performanceDataCount;
  uint64_t v18;
  uint64_t v19;
  NSMutableDictionary *metadata;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *occuranceData;
  uint64_t v24;
  NSDate *lastTransitTimestamp;
  id sendEvent;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CMSLogger;
  v5 = -[CMSLogger init](&v28, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    logIdentity = v5->_logIdentity;
    v5->_logIdentity = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.Performance"), v5->_logIdentity));
    performanceLog = v5->_performanceLog;
    v5->_performanceLog = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.Occurance"), v5->_logIdentity));
    occuranceLog = v5->_occuranceLog;
    v5->_occuranceLog = (NSString *)v10;

    v13 = objc_opt_new(NSMutableDictionary, v12);
    performanceData = v5->performanceData;
    v5->performanceData = (NSMutableDictionary *)v13;

    v16 = objc_opt_new(NSMutableDictionary, v15);
    performanceDataCount = v5->performanceDataCount;
    v5->performanceDataCount = (NSMutableDictionary *)v16;

    v19 = objc_opt_new(NSMutableDictionary, v18);
    metadata = v5->metadata;
    v5->metadata = (NSMutableDictionary *)v19;

    v22 = objc_opt_new(NSMutableDictionary, v21);
    occuranceData = v5->occuranceData;
    v5->occuranceData = (NSMutableDictionary *)v22;

    v24 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    lastTransitTimestamp = v5->_lastTransitTimestamp;
    v5->_lastTransitTimestamp = (NSDate *)v24;

    -[CMSLogger _loadAnalyticsData](v5, "_loadAnalyticsData");
    sendEvent = v5->_sendEvent;
    v5->_sendEvent = &stru_10004A7B0;

  }
  return v5;
}

- (double)reportFrequency
{
  double result;

  -[NSTimer timeInterval](self->reportTimer, "timeInterval");
  return result;
}

- (void)setReportFrequency:(double)a3
{
  _QWORD block[4];
  id v5[2];
  id location;

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E314;
  block[3] = &unk_10004A800;
  objc_copyWeak(v5, &location);
  v5[1] = *(id *)&a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (id)sendEvent
{
  return objc_retainBlock(self->_sendEvent);
}

- (void)setSendEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[CMSLogger _LoggingQueue](CMSLogger, "_LoggingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E504;
  v7[3] = &unk_10004A828;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)defaultSession
{
  return -[CMSLogger createNewSessionForType:withMetadata:](self, "createNewSessionForType:withMetadata:", &stru_10004B560, &__NSDictionary0__struct);
}

- (id)createNewSessionForType:(id)a3 withMetadata:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CMSLoggingSession initForType:withMetadata:]([CMSLoggingSession alloc], "initForType:withMetadata:", v7, v6);

  objc_msgSend(v8, "setBelongedLogger:", self);
  return v8;
}

- (void)_sumbitFromSessionType:(id)a3 withMetadata:(id)a4 withEventDurations:(id)a5 withEventOccurance:(id)a6
{
  NSMutableDictionary *performanceData;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;

  performanceData = self->performanceData;
  v11 = a6;
  v12 = a5;
  v26 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](performanceData, "objectForKeyedSubscript:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->performanceDataCount, "objectForKeyedSubscript:", v13));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10002E888;
  v33[3] = &unk_10004A850;
  v34 = v14;
  v35 = v15;
  v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v15));
  v37 = v16;
  v17 = v16;
  v18 = v36;
  v19 = v15;
  v27 = v14;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v33);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Count")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v20, "unsignedIntegerValue") + 1));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("Count"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->performanceData, "setObject:forKeyedSubscript:", v17, v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->performanceDataCount, "setObject:forKeyedSubscript:", v18, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->occuranceData, "objectForKeyedSubscript:", v13));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002E9D0;
  v30[3] = &unk_10004A878;
  v31 = v22;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v22));
  v32 = v23;
  v24 = v22;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v30);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002EA7C;
  v28[3] = &unk_10004A8A0;
  v29 = v23;
  v25 = v23;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v28);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->occuranceData, "setObject:forKeyedSubscript:", v25, v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->metadata, "setObject:forKeyedSubscript:", v26, v13);

  -[CMSLogger _saveAnalyticsData](self, "_saveAnalyticsData");
}

- (void)_fileMetrics
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(+[CMSLogger _LoggingQueue](CMSLogger, "_LoggingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EB64;
  block[3] = &unk_100048AC0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)_loggerStorage
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSUserDefaults);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.Metrics"), self->_logIdentity));
  v5 = objc_msgSend(v3, "initWithSuiteName:", v4);

  return v5;
}

- (void)_saveAnalyticsData
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CMSLogger _loggerStorage](self, "_loggerStorage"));
  objc_msgSend(v3, "setObject:forKey:", self->_lastTransitTimestamp, CFSTR("lastTransitTimestamp"));
  objc_msgSend(v3, "setObject:forKey:", self->performanceData, CFSTR("performanceData"));
  objc_msgSend(v3, "setObject:forKey:", self->performanceDataCount, CFSTR("performanceDataCount"));
  objc_msgSend(v3, "setObject:forKey:", self->occuranceData, CFSTR("occuranceData"));
  objc_msgSend(v3, "setObject:forKey:", self->metadata, CFSTR("metadata"));
  -[NSTimer timeInterval](self->reportTimer, "timeInterval");
  objc_msgSend(v3, "setDouble:forKey:", CFSTR("ReportInterval"));
  objc_msgSend(v3, "synchronize");

}

- (BOOL)_checkDictionary:(id)a3 forKeyType:(Class)a4 andValueType:(Class)a5
{
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v7 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002F1D0;
  v9[3] = &unk_10004A8F0;
  v9[5] = a4;
  v9[6] = a5;
  v9[4] = &v10;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);
  LOBYTE(a5) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)a5;
}

- (void)_loadAnalyticsData
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(-[CMSLogger _loggerStorage](self, "_loggerStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("lastTransitTimestamp")));
  v4 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    objc_storeStrong((id *)&self->_lastTransitTimestamp, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("performanceData")));
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = objc_opt_class(NSString);
    if (-[CMSLogger _checkDictionary:forKeyType:andValueType:](self, "_checkDictionary:forKeyType:andValueType:", v5, v7, objc_opt_class(NSDictionary)))
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->performanceData, "addEntriesFromDictionary:", v5);
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("performanceDataCount")));
  v9 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = objc_opt_class(NSString);
    if (-[CMSLogger _checkDictionary:forKeyType:andValueType:](self, "_checkDictionary:forKeyType:andValueType:", v8, v10, objc_opt_class(NSDictionary)))
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->performanceDataCount, "addEntriesFromDictionary:", v8);
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("occuranceData")));
  v12 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    v13 = objc_opt_class(NSString);
    if (-[CMSLogger _checkDictionary:forKeyType:andValueType:](self, "_checkDictionary:forKeyType:andValueType:", v11, v13, objc_opt_class(NSDictionary)))
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->occuranceData, "addEntriesFromDictionary:", v11);
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("metadata")));
  v15 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
  {
    v16 = objc_opt_class(NSString);
    if (-[CMSLogger _checkDictionary:forKeyType:andValueType:](self, "_checkDictionary:forKeyType:andValueType:", v14, v16, objc_opt_class(NSDictionary)))
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->metadata, "addEntriesFromDictionary:", v14);
    }
  }
  objc_msgSend(v18, "doubleForKey:", CFSTR("ReportInterval"));
  if (v17 > 0.0)
    -[CMSLogger setReportFrequency:](self, "setReportFrequency:");

}

- (NSString)logIdentity
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)performanceLog
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPerformanceLog:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)occuranceLog
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOccuranceLog:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSDictionary)entryRenamingDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEntryRenamingDictionary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryRenamingDictionary, 0);
  objc_storeStrong((id *)&self->_occuranceLog, 0);
  objc_storeStrong((id *)&self->_performanceLog, 0);
  objc_storeStrong((id *)&self->_logIdentity, 0);
  objc_storeStrong(&self->_sendEvent, 0);
  objc_storeStrong((id *)&self->occuranceData, 0);
  objc_storeStrong((id *)&self->performanceDataCount, 0);
  objc_storeStrong((id *)&self->performanceData, 0);
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->reportTimer, 0);
  objc_storeStrong((id *)&self->_lastTransitTimestamp, 0);
}

@end
