@implementation FMDEventLoggerFacilityFMIPServer

+ (id)facilityName
{
  return CFSTR("FMDEventLoggerFacilityFMIPServer");
}

- (id)loggedEvents
{
  return &__NSArray0__struct;
}

- (void)logEvent:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
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
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  const __CFString *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "osVersion"));
  -[__CFString fm_safelyMapKey:toObject:](v6, "fm_safelyMapKey:toObject:", CFSTR("osVersion"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
  -[__CFString fm_safelyMapKey:toObject:](v6, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceUDID"));
  -[__CFString fm_safelyMapKey:toObject:](v6, "fm_safelyMapKey:toObject:", CFSTR("UDID"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "osBuildVersion"));
  -[__CFString fm_safelyMapKey:toObject:](v6, "fm_safelyMapKey:toObject:", CFSTR("buildVersion"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productType"));
  -[__CFString fm_safelyMapKey:toObject:](v6, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v12, "fm_epoch")));
  -[__CFString fm_safelyMapKey:toObject:](v6, "fm_safelyMapKey:toObject:", CFSTR("timestamp"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventName"));
  -[__CFString fm_safelyMapKey:toObject:](v6, "fm_safelyMapKey:toObject:", CFSTR("eventName"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventName"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityFMIPServer splunkifyObject:eventName:](self, "splunkifyObject:eventName:", v15, v16));
  -[__CFString fm_safelyMapKey:toObject:](v6, "fm_safelyMapKey:toObject:", CFSTR("info"), v17);

  v18 = sub_1000031B8();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Logging event %@", buf, 0xCu);
  }

  if (-[FMDEventLoggerFacilityFMIPServer shouldLog](self, "shouldLog"))
  {
    v27 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v6, 0, &v27));
    if (!v27)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://fmip.icloud.com/fmipservice/stats/infoRequest")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v21));

      objc_msgSend(v22, "setHTTPBody:", v20);
      v23 = sub_1000031B8();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = CFSTR("https://fmip.icloud.com/fmipservice/stats/infoRequest");
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Sending logs %@", buf, 0xCu);
      }

      objc_msgSend(v22, "setAllHTTPHeaderFields:", &off_1002D9408);
      objc_msgSend(v22, "setHTTPMethod:", CFSTR("POST"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityFMIPServer defaultSession](self, "defaultSession"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dataTaskWithRequest:", v22));

      objc_msgSend(v26, "resume");
    }

  }
}

- (FMDURLSession)defaultSession
{
  FMDURLSession *defaultSession;
  void *v4;
  FMDURLSession *v5;
  FMDURLSession *v6;

  defaultSession = self->_defaultSession;
  if (!defaultSession)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    objc_msgSend(v4, "setURLCache:", 0);
    objc_msgSend(v4, "setRequestCachePolicy:", 1);
    objc_msgSend(v4, "setHTTPCookieStorage:", 0);
    v5 = (FMDURLSession *)objc_claimAutoreleasedReturnValue(+[FMDURLSessionFactory sessionWithConfiguration:delegate:delegateQueue:](FMDURLSessionFactory, "sessionWithConfiguration:delegate:delegateQueue:", v4, self, 0));
    v6 = self->_defaultSession;
    self->_defaultSession = v5;

    defaultSession = self->_defaultSession;
  }
  return defaultSession;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  FMDURLSession *defaultSession;

  v5 = a4;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_10022C888((uint64_t)v5, v7);

  defaultSession = self->_defaultSession;
  self->_defaultSession = 0;

}

- (BOOL)shouldLog
{
  return 1;
}

- (id)splunkifyDictionary:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000A430C;
  v12 = sub_1000A431C;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A4324;
  v7[3] = &unk_1002C4B00;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)splunkifyObject:(id)a3 eventName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  __CFString *v27;

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(NSNumber, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
LABEL_7:
    v16 = v11;
    goto LABEL_8;
  }
  v12 = objc_opt_class(NSString, v10);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v11 = v6;
    goto LABEL_7;
  }
  v14 = objc_opt_class(NSDictionary, v13);
  if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityFMIPServer splunkifyDictionary:](self, "splunkifyDictionary:", v6));
    goto LABEL_7;
  }
  v20 = objc_opt_class(NSArray, v15);
  if ((objc_opt_isKindOfClass(v6, v20) & 1) != 0)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = sub_1000A430C;
    v26 = sub_1000A431C;
    v27 = &stru_1002CD590;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000A45F4;
    v21[3] = &unk_1002C4B28;
    v21[4] = self;
    v21[5] = &v22;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v21);
    v16 = (id)v23[5];
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    v16 = 0;
  }
LABEL_8:
  v17 = v7;
  if ((objc_msgSend(v7, "isEqualToString:", &stru_1002CD590) & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR(",")));

  }
  if (v16)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", v16));

    v17 = (void *)v18;
  }

  return v17;
}

- (void)setDefaultSession:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSession, 0);
}

@end
