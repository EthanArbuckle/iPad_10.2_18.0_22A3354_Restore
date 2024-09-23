@implementation NIServerSpatialBrowsingSession

- (NIServerSpatialBrowsingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NIServerSpatialBrowsingSession *v15;
  NIServerSpatialBrowsingSession *v16;
  NISpatialBrowsingConfiguration *v17;
  NISpatialBrowsingConfiguration *configuration;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  OS_dispatch_queue *clientQueue;
  void *v24;
  uint64_t v25;
  NSString *containerUniqueIdentifier;
  NIServerSpatialBrowsingSession *v27;
  void *v29;
  void *v30;
  __int128 v31;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(NISpatialBrowsingConfiguration, v13))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSpatialBrowsingSession.mm"), 33, CFSTR("NIServerSpatialBrowsingSession given invalid configuration."));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));

  if (!v14)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSpatialBrowsingSession.mm"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager.serverSessionIdentifier"));

  }
  v32.receiver = self;
  v32.super_class = (Class)NIServerSpatialBrowsingSession;
  v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v32, "initWithResourcesManager:configuration:error:", v9, v10, a5);
  v16 = v15;
  if (v15)
  {
    v17 = (NISpatialBrowsingConfiguration *)objc_msgSend(v10, "copy");
    configuration = v15->_configuration;
    v15->_configuration = v17;

    if (v9)
      objc_msgSend(v9, "protobufLogger");
    else
      v31 = 0uLL;
    sub_1000145E8((uint64_t)&v15->_pbLogger, &v31);
    v19 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
    if (*((_QWORD *)&v31 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
    clientQueue = v16->_clientQueue;
    v16->_clientQueue = (OS_dispatch_queue *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
    containerUniqueIdentifier = v16->_containerUniqueIdentifier;
    v16->_containerUniqueIdentifier = (NSString *)v25;

    v27 = v16;
  }

  return v16;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (unint64_t)requiresUWBToRun
{
  return 2;
}

- (id)configure
{
  NSObject *v3;
  NISpatialBrowsingConfiguration *configuration;
  int v6;
  NISpatialBrowsingConfiguration *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_configuration)
    sub_1003E7224();
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    v6 = 138412290;
    v7 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-sptbrows,Configure. Configuration given: %@", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (id)run
{
  NIServerSessionResourceManager *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  OS_dispatch_queue *clientQueue;
  id v18;
  void *v19;
  NSObject *v20;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v26.receiver = self;
  v26.super_class = (Class)NIServerSpatialBrowsingSession;
  v3 = -[NIServerBaseSession resourcesManager](&v26, "resourcesManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "recentlyObservedObjectsCache"));
  if (v4)
  {
    -[NISpatialBrowsingConfiguration maxNearbyObjectAge](self->_configuration, "maxNearbyObjectAge");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getMostRecentObjectsWithMaxAge:"));
    for (i = 0; (unint64_t)objc_msgSend(v7, "count") > i; ++i)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (i + 1)));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", i));
      objc_msgSend(v10, "overrideSpatialScore:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", i));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothAdvertisingAddress"));
      v13 = sub_1001FDE9C(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", i));
        objc_msgSend(v15, "setDeviceIdentifier:", v14);

      }
    }
    v16 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-sptbrows,Returning most recent objects (max age: %0.2f sec): %@", buf, 0x16u);
    }
    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002B8330;
    block[3] = &unk_1007FA518;
    v24 = v22;
    v25 = v7;
    v18 = v7;
    dispatch_async((dispatch_queue_t)clientQueue, block);

    v19 = 0;
  }
  else
  {
    v20 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E724C(v20);
    v31 = NSLocalizedFailureReasonErrorKey;
    v32 = CFSTR("Internal observation not enabled.");
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v18));
  }

  return v19;
}

- (id)pauseWithSource:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  return 0;
}

- (void)invalidate
{
  objc_super v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3.receiver = self;
  v3.super_class = (Class)NIServerSpatialBrowsingSession;
  -[NIServerBaseSession invalidate](&v3, "invalidate");
}

- (NISpatialBrowsingConfiguration)configuration
{
  return (NISpatialBrowsingConfiguration *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  sub_10001AE68((uint64_t)&self->_pbLogger);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
