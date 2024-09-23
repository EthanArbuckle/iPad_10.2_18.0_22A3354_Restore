@implementation MBAnalyticsEvent

- (MBAnalyticsEvent)initWithEventName:(id)a3
{
  id v4;
  MBAnalyticsEvent *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *metrics;
  uint64_t v8;
  NSString *eventName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBAnalyticsEvent;
  v5 = -[MBAnalyticsEvent init](&v11, "init");
  if (v5)
  {
    v6 = objc_opt_new(NSMutableDictionary);
    metrics = v5->_metrics;
    v5->_metrics = v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v8;

  }
  return v5;
}

- (void)setError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  MBAnalyticsEvent *v8;
  NSMutableDictionary *metrics;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  uint8_t buf[4];
  id v20;

  v4 = a3;
  v6 = MBGetDefaultLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Analytics - Setting error: %@", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), "Analytics - Setting error: %@", v4);
  }

  v8 = self;
  objc_sync_enter(v8);
  metrics = v8->_metrics;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")));
  -[NSMutableDictionary setValue:forKey:](metrics, "setValue:forKey:", v10, CFSTR("errorCode"));

  v11 = v8->_metrics;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  -[NSMutableDictionary setValue:forKey:](v11, "setValue:forKey:", v12, CFSTR("errorDomain"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "underlyingErrors"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

  if (v14)
  {
    v15 = v8->_metrics;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "code")));
    -[NSMutableDictionary setValue:forKey:](v15, "setValue:forKey:", v16, CFSTR("underlyingErrorCode"));

    v17 = v8->_metrics;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
    -[NSMutableDictionary setValue:forKey:](v17, "setValue:forKey:", v18, CFSTR("underlyingErrorDomain"));

  }
  objc_sync_exit(v8);

}

- (void)setKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  MBAnalyticsEvent *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Analytics - Setting %@ to %@", buf, 0x16u);
    _MBLog(CFSTR("DEBUG"), "Analytics - Setting %@ to %@", v6, v7);
  }

  v11 = self;
  objc_sync_enter(v11);
  -[NSMutableDictionary setValue:forKey:](v11->_metrics, "setValue:forKey:", v7, v6);
  objc_sync_exit(v11);

}

- (void)setMetric:(id)a3 value:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[MBAnalyticsEvent setKey:value:](self, "setKey:value:", v6, v7);

}

+ (BOOL)submitEventName:(id)a3 metrics:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v22[4];
  NSObject *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;

  v5 = a3;
  v6 = a4;
  if (!v5 || (v7 = v6) == 0)
    sub_100087590();
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("successes")));
    if (v8
      && (v10 = (void *)v8,
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("failed"))),
          v11,
          v10,
          v11))
    {
      v12 = MBGetDefaultLog(v8, v9);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "CA metrics have both success and failure recordings", buf, 2u);
        _MBLog(CFSTR("FAULT"), "CA metrics have both success and failure recordings");
      }
      LOBYTE(v14) = 0;
    }
    else
    {
      v15 = MBGetDefaultLog(v8, v9);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v25 = v5;
        v26 = 2112;
        v27 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Analytics - Submitting \"%{public}@\": %@", buf, 0x16u);
        _MBLog(CFSTR("INFO"), "Analytics - Submitting \"%{public}@\": %@", v5, v7);
      }

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000096B4;
      v22[3] = &unk_1000D9370;
      v23 = v7;
      v14 = AnalyticsSendEventLazy(v5, v22);
      v18 = MBGetDefaultLog(v14, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if ((_DWORD)v14)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v25 = v5;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Analytics - Successfully submitted \"%{public}@\", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Analytics - Successfully submitted \"%{public}@\", v5);
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Analytics - Failed to submit \"%@\", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Analytics - Failed to submit \"%@\", v5);
      }

      v13 = v23;
    }

  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (BOOL)submit
{
  MBAnalyticsEvent *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary copy](v2->_metrics, "copy");
  objc_sync_exit(v2);

  LOBYTE(v2) = +[MBAnalyticsEvent submitEventName:metrics:](MBAnalyticsEvent, "submitEventName:metrics:", v2->_eventName, v3);
  return (char)v2;
}

- (NSDictionary)dictionaryRepresentation
{
  MBAnalyticsEvent *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary copy](v2->_metrics, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
