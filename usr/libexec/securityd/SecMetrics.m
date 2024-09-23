@implementation SecMetrics

- (SecMetrics)init
{
  SecMetrics *v2;
  void *v3;
  void *v4;
  void *v5;
  SecMetrics *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SecMetrics;
  v2 = -[SecMetrics init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v3, v2, 0));
    -[SecMetrics setURLSession:](v2, "setURLSession:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[SecMetrics setTaskMap:](v2, "setTaskMap:", v5);

    v6 = v2;
  }

  return v2;
}

- (void)submitEvent:(id)a3
{
  -[SecMetrics sendEvent:pushTopic:](self, "sendEvent:pushTopic:", a3, CFSTR("com.apple.private.alloy.keychain.metrics"));
}

- (void)sendEvent:(id)a3 pushTopic:(id)a4
{
  id v6;
  id v7;
  SecMetrics *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SecMetrics *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v8, "taskMap"));
  v10 = objc_msgSend(v9, "count");

  if ((unint64_t)v10 < 6)
  {
    objc_sync_exit(v8);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "genericEvent"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics requestForGenericEvent:](v8, "requestForGenericEvent:", v12));
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics URLSession](v8, "URLSession"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataTaskWithRequest:", v13));

        if (v7)
          objc_msgSend(v15, "set_APSRelayTopic:", v7);
        v16 = v8;
        objc_sync_enter(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v16, "taskMap"));
        v18 = objc_msgSend(v17, "count");

        if (!v18)
        {
          v19 = (void *)os_transaction_create("com.apple.security.c2metric.upload");
          -[SecMetrics setTransaction:](v16, "setTransaction:", v19);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v16, "taskMap"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "taskIdentifier")));
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v6, v21);

        objc_sync_exit(v16);
        objc_msgSend(v15, "resume");

      }
    }

  }
  else
  {
    -[SecMetrics setLostEvents:](v8, "setLostEvents:", (char *)-[SecMetrics lostEvents](v8, "lostEvents") + 1);
    objc_sync_exit(v8);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventName"));
      v22 = 138412290;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "metrics %@ dropped on floor since too many are pending", (uint8_t *)&v22, 0xCu);

    }
  }

}

- (id)getEvent:(id)a3
{
  id v4;
  SecMetrics *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v5, "taskMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "taskIdentifier")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  objc_sync_exit(v5);
  return v8;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  SecMetrics *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  __CFString *v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics getEvent:](self, "getEvent:", v9));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
    if (v10)
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    else
      v15 = CFSTR("success");
    v26 = 138412802;
    v27 = v12;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "metrics %@ transfer %@ completed with: %@", (uint8_t *)&v26, 0x20u);
    if (v10)

  }
  v16 = self;
  objc_sync_enter(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v16, "taskMap"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier")));
  objc_msgSend(v17, "removeObjectForKey:", v18);

  v19 = -[SecMetrics lostEvents](v16, "lostEvents");
  if (v10 || v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if (-[SecMetrics lostEvents](v16, "lostEvents"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", -[SecMetrics lostEvents](v16, "lostEvents")));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("counter"));

    }
    if (v10)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "code")));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("error_code"));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("error_domain"));

    }
    +[SecCoreAnalytics sendEvent:event:](SecCoreAnalytics, "sendEvent:event:", CFSTR("com.apple.security.push.channel.dropped"), v20);
    -[SecMetrics setLostEvents:](v16, "setLostEvents:", 0);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v16, "taskMap"));
  v25 = objc_msgSend(v24, "count") == 0;

  if (v25)
    -[SecMetrics setTransaction:](v16, "setTransaction:", 0);
  objc_sync_exit(v16);

}

- (id)requestForGenericEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  SECC2MPMetric *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "c2MetricsEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:", v6);
    if (v7)
    {
      v8 = objc_alloc_init(SECC2MPMetric);
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics generateDeviceInfo](self, "generateDeviceInfo"));
        -[SECC2MPMetric setDeviceInfo:](v8, "setDeviceInfo:", v9);

        -[SECC2MPMetric setReportFrequency:](v8, "setReportFrequency:", 0);
        -[SECC2MPMetric setReportFrequencyBase:](v8, "setReportFrequencyBase:", 0);
        -[SECC2MPMetric setMetricType:](v8, "setMetricType:", 201);
        -[SECC2MPMetric setGenericEvent:](v8, "setGenericEvent:", v4);
        v10 = objc_alloc_init((Class)PBDataWriter);
        if (v10)
        {
          -[SECC2MPMetric writeTo:](v8, "writeTo:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "immutableData"));
          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics gzipEncode:](self, "gzipEncode:", v11));
            if (v12)
            {
              objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
              objc_msgSend(v7, "setHTTPBody:", v12);
              objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/protobuf"), CFSTR("Content-Type"));
              objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Content-Encoding"));
              v13 = v7;
            }
            else
            {
              v13 = 0;
            }

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)gzipEncode:(id)a3
{
  id v3;
  void *v4;
  __int128 v5;
  id v6;
  id v7;
  z_stream v9;
  _BYTE v10[1024];

  v3 = a3;
  bzero(v10, 0x400uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v9.data_type = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v9.adler = v5;
  *(_OWORD *)&v9.avail_out = v5;
  *(_OWORD *)&v9.msg = v5;
  *(_OWORD *)&v9.next_in = v5;
  *(_OWORD *)&v9.total_in = v5;
  memset(&v9.zalloc, 0, 24);
  v6 = 0;
  if (!deflateInit2_(&v9, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    v7 = v3;
    v9.avail_in = objc_msgSend(v7, "length", objc_msgSend(v7, "bytes"));
    do
    {
      v9.avail_out = 1024;
      v9.next_out = v10;
      if (deflate(&v9, 4) == -2)
        sub_10003429C(CFSTR("Execution has encountered an unexpected state"), 0x53C0000Eu);
      objc_msgSend(v4, "appendBytes:length:", v10, 1024 - v9.avail_out);
    }
    while (!v9.avail_out);
    if (v9.avail_in)
      sub_10003429C(CFSTR("Execution has encountered an unexpected state"), 0x53C0000Eu);
    deflateEnd(&v9);
    v6 = v4;

  }
  return v6;
}

- (id)generateDeviceInfo
{
  SECC2MPDeviceInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(SECC2MPDeviceInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo productName](SecC2DeviceInfo, "productName"));
  -[SECC2MPDeviceInfo setProductName:](v2, "setProductName:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo productType](SecC2DeviceInfo, "productType"));
  -[SECC2MPDeviceInfo setProductType:](v2, "setProductType:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo productVersion](SecC2DeviceInfo, "productVersion"));
  -[SECC2MPDeviceInfo setProductVersion:](v2, "setProductVersion:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo buildVersion](SecC2DeviceInfo, "buildVersion"));
  -[SECC2MPDeviceInfo setProductBuild:](v2, "setProductBuild:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo processName](SecC2DeviceInfo, "processName"));
  -[SECC2MPDeviceInfo setProcessName:](v2, "setProcessName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo processVersion](SecC2DeviceInfo, "processVersion"));
  -[SECC2MPDeviceInfo setProcessVersion:](v2, "setProcessVersion:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo processUUID](SecC2DeviceInfo, "processUUID"));
  -[SECC2MPDeviceInfo setProcessUuid:](v2, "setProcessUuid:", v9);

  return v2;
}

- (NSMutableDictionary)taskMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTaskMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSURLSession)URLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setURLSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)lostEvents
{
  return self->_lostEvents;
}

- (void)setLostEvents:(int64_t)a3
{
  self->_lostEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_taskMap, 0);
}

+ (id)c2MetricsEndpoint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "propertiesForDataclass:", ACAccountDataclassCKMetricsService));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url")));

    if (v6)
    {
      v7 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("c2")));

      if (v8)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001423B0;
        block[3] = &unk_1002EC350;
        v9 = v8;
        v8 = v9;
        v13 = v9;
        if (qword_100341348 == -1)
        {
          v10 = v9;
        }
        else
        {
          dispatch_once(&qword_100341348, block);
          v10 = v13;
        }

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)managerObject
{
  if (qword_100341358 != -1)
    dispatch_once(&qword_100341358, &stru_1002E8C08);
  return (id)qword_100341350;
}

@end
