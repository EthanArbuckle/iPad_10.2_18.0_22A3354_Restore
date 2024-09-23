@implementation _NIServerTestWiFiOnlySession

- (_NIServerTestWiFiOnlySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _NIServerTestWiFiOnlySession *v14;
  uint64_t v15;
  OS_dispatch_queue *clientQueue;
  _NIWiFiRangingTestConfiguration *v17;
  _NIWiFiRangingTestConfiguration *configuration;
  NINearbyUpdatesEngine *v19;
  _NIWiFiRangingTestConfiguration *v20;
  OS_dispatch_queue *v21;
  void *v22;
  NINearbyUpdatesEngine *v23;
  NINearbyUpdatesEngine *updatesEngine;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  _NIServerTestWiFiOnlySession *v35;
  void *v37;
  void *v38;
  __int128 v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  objc_super v42;

  v9 = a3;
  v10 = a4;
  v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(_NIWiFiRangingTestConfiguration, v13))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_NIServerTestWiFiOnlySession.mm"), 43, CFSTR("_NIWiFiRangingTestConfiguration given invalid configuration."));

    if (a5)
      goto LABEL_3;
LABEL_30:
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_NIServerTestWiFiOnlySession.mm"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

    goto LABEL_3;
  }
  if (!a5)
    goto LABEL_30;
LABEL_3:
  v42.receiver = self;
  v42.super_class = (Class)_NIServerTestWiFiOnlySession;
  v14 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v42, "initWithResourcesManager:configuration:error:", v9, v10, a5);
  if (!v14)
    goto LABEL_27;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
  clientQueue = v14->_clientQueue;
  v14->_clientQueue = (OS_dispatch_queue *)v15;

  v17 = (_NIWiFiRangingTestConfiguration *)objc_msgSend(v10, "copy");
  configuration = v14->_configuration;
  v14->_configuration = v17;

  v19 = [NINearbyUpdatesEngine alloc];
  v20 = v14->_configuration;
  v21 = v14->_clientQueue;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "analytics"));
  if (v9)
  {
    objc_msgSend(v9, "protobufLogger");
  }
  else
  {
    v40 = 0;
    v41 = 0;
  }
  v23 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:](v19, "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:", v20, v21, v14, v14, v22, &v40, a5);
  updatesEngine = v14->_updatesEngine;
  v14->_updatesEngine = v23;

  v25 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

  if (v9)
    objc_msgSend(v9, "protobufLogger");
  else
    v39 = 0uLL;
  sub_1000145E8((uint64_t)&v14->_pbLogger, &v39);
  v28 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
  if (*((_QWORD *)&v39 + 1))
  {
    v29 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = operator new(0x88uLL);
  v31[1] = 0;
  v31[2] = 0;
  *v31 = off_100809EB8;
  *(_QWORD *)&v39 = sub_1002AD140((_BYTE *)v31 + 24);
  *((_QWORD *)&v39 + 1) = v31;
  sub_1000145E8((uint64_t)&v14->_caManager, &v39);
  v32 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
  if (*((_QWORD *)&v39 + 1))
  {
    v33 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  if (v14->_updatesEngine)
    v35 = v14;
  else
LABEL_27:
    v35 = 0;

  return v35;
}

- (void)invalidate
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;

  if (self->_wifiRangingSession.__ptr_.__value_)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[_NIServerTestWiFiOnlySession _disableWiFiAndReturnError](self, "_disableWiFiAndReturnError"));
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,Invalidate. Error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (id)disableAllServices
{
  uint64_t *p_wifiRangingSession;
  Session *value;

  p_wifiRangingSession = (uint64_t *)&self->_wifiRangingSession;
  value = self->_wifiRangingSession.__ptr_.__value_;
  if (value)
  {
    sub_10002DE08((const std::string *)value);
    sub_100182C64(p_wifiRangingSession, 0);
    sub_100182C64(p_wifiRangingSession, 0);
  }
  return 0;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (id)configure
{
  _NIWiFiRangingTestConfiguration *configuration;
  void *v4;
  void *v5;
  NIServerSessionResourceManager *v6;
  void *v7;
  _NIServerTestWiFiOnlySession *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *__p;
  objc_super v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  id v27;

  configuration = self->_configuration;
  if (!configuration)
    sub_1003E8428();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration peerDiscoveryToken](configuration, "peerDiscoveryToken"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration parameters](self->_configuration, "parameters"));

    if (v5)
    {
      v22.receiver = self;
      v22.super_class = (Class)_NIServerTestWiFiOnlySession;
      v6 = -[NIServerBaseSession resourcesManager](&v22, "resourcesManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = self;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "btResource"));
      objc_msgSend(v9, "startAdvertising");

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "btResource"));
      objc_msgSend(v10, "startScanning");

      v11 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "btResource")), "nonConnectableAdvertisingAddress");
      if (v12)
      {
        v27 = v11;
        v13 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v27, 6);
        v14 = sub_10001D534();
        sub_10001D5C8((uint64_t)v14, v13);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverSessionIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));

      sub_10000BF04(&__p, (char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
      operator new();
    }
    v23 = NSLocalizedFailureReasonErrorKey;
    v24 = CFSTR("Missing WiFi ranging parameters.");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v17));
  }
  else
  {
    v25 = NSLocalizedFailureReasonErrorKey;
    v26 = CFSTR("Peer discovery token nil or invalid.");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v17));
  }
  v19 = (void *)v18;

  return v19;
}

- (id)run
{
  NIServerSessionResourceManager *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  void *v12;

  self->_shouldDeliverUpdates = 1;
  v11.receiver = self;
  v11.super_class = (Class)_NIServerTestWiFiOnlySession;
  v3 = -[NIServerBaseSession resourcesManager](&v11, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lifecycleSupervisor"));
  objc_msgSend(v5, "runWithConfigurationCalled");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NIServerTestWiFiOnlySession _addPeers:](self, "_addPeers:", v7));
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E8450();
    -[_NIServerTestWiFiOnlySession _handleFailedToAddPeer](self, "_handleFailedToAddPeer");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lifecycleSupervisor"));
    objc_msgSend(v9, "startedDiscoveringPeersWithTokens:", v7);

  }
  return v8;
}

- (id)pauseWithSource:(int64_t)a3
{
  void *v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  void *v7;
  objc_super v9;

  self->_shouldDeliverUpdates = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NIServerTestWiFiOnlySession disableAllServices](self, "disableAllServices", a3));
  v9.receiver = self;
  v9.super_class = (Class)_NIServerTestWiFiOnlySession;
  v5 = -[NIServerBaseSession resourcesManager](&v9, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
  objc_msgSend(v7, "pauseCalled");

  return v4;
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 2;
}

- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v5 = a3;
  v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v5, 6);
  v4 = sub_10001D534();
  sub_10001D5C8((uint64_t)v4, v3);

}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  void *v5;
  double v6;
  Logger *ptr;
  id v8;
  NSObject *v9;
  void *__p[20];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NINearbyObject objectFromBluetoothDevice:](NINearbyObject, "objectFromBluetoothDevice:", v4));
  if (v5)
  {
    if (self->_pbLogger.__ptr_)
    {
      v6 = sub_10000883C();
      ptr = self->_pbLogger.__ptr_;
      v8 = objc_msgSend(v4, "u64Identifier");
      sub_100268FEC(v5, (uint64_t)__p);
      sub_100274790((uint64_t)ptr, (uint64_t)v8, (uint64_t)__p, v6);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    -[_NIServerTestWiFiOnlySession _triggerWiFiRanging:](self, "_triggerWiFiRanging:", v4);
  }
  else
  {
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003E84B0(v9);
  }

}

- (void)device:(id)a3 rediscovered:(id)a4
{
  -[_NIServerTestWiFiOnlySession _triggerWiFiRanging:](self, "_triggerWiFiRanging:", a4);
}

- (void)deviceLost:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  Session *value;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v6 = objc_msgSend(v4, "u64Identifier");
    else
      v6 = 0;
    v9 = 134217984;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,device 0x%llx lost. stopping wifi ranging", (uint8_t *)&v9, 0xCu);
  }

  value = self->_wifiRangingSession.__ptr_.__value_;
  if (value)
  {
    sub_10002DF44((uint64_t)value);
  }
  else
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,no wifi ranging session to stop", (uint8_t *)&v9, 2u);
    }
  }

}

- (id)addObject:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;

  v3 = a3;
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,addObject noop: %@", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)removeObject:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;

  v3 = a3;
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,remove noop: %@", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (void)_triggerWiFiRanging:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _NIWiFiRangingTestConfiguration *configuration;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NIServerSessionResourceManager *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  _NIWiFiRangingTestConfiguration *v46;
  NSErrorUserInfoKey v47;
  const __CFString *v48;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "u64Identifier");
    v7 = qword_10085F520;
    if (self->_wifiRangingSession.__ptr_.__value_)
    {
      v8 = (uint64_t)v6;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        configuration = self->_configuration;
        *(_DWORD *)buf = 134218242;
        v44 = v8;
        v45 = 2112;
        v46 = configuration;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,_triggerWiFiRanging. Identifier: 0x%llx, WiFi ranging config: %@", buf, 0x16u);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration parameters](self->_configuration, "parameters"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RangingRole")));

      if (v11 && (v13 = objc_opt_class(NSString, v12), (objc_opt_isKindOfClass(v11, v13) & 1) != 0))
      {
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Initiator")) & 1) == 0)
        {
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Responder")) & 1) != 0)
          {
            v14 = 2;
            goto LABEL_15;
          }
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
            sub_1003E85F4();
        }
      }
      else
      {
        v23 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003E858C((uint64_t)&self->_configuration, v23, v24, v25, v26, v27, v28, v29);
      }
      v14 = 1;
LABEL_15:
      sub_10002D868((uint64_t)buf, v8, v14);
      sub_10002E2FC((uint64_t)self->_wifiRangingSession.__ptr_.__value_, (uint64_t)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E851C(v7, v30, v31, v32, v33, v34, v35, v36);
    v42.receiver = self;
    v42.super_class = (Class)_NIServerTestWiFiOnlySession;
    v37 = -[NIServerBaseSession resourcesManager](&v42, "resourcesManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "remote"));
    v47 = NSLocalizedDescriptionKey;
    v48 = CFSTR("Failed to start WiFi service. session is nil");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v40));
    objc_msgSend(v39, "uwbSessionDidFailWithError:", v41);

  }
  else
  {
    v15 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E84EC(v15, v16, v17, v18, v19, v20, v21, v22);
  }

}

- (void)_stopWiFiRanging:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _NIWiFiRangingTestConfiguration *configuration;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NIServerSessionResourceManager *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  _NIWiFiRangingTestConfiguration *v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "u64Identifier");
    v7 = qword_10085F520;
    if (self->_wifiRangingSession.__ptr_.__value_)
    {
      v8 = v6;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        configuration = self->_configuration;
        *(_DWORD *)buf = 134218242;
        v32 = v8;
        v33 = 2112;
        v34 = configuration;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,_stopWiFiRanging. Identifier: 0x%llx, WiFi ranging config: %@", buf, 0x16u);
      }
      sub_10002DF44((uint64_t)self->_wifiRangingSession.__ptr_.__value_);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E8684(v7, v18, v19, v20, v21, v22, v23, v24);
      v30.receiver = self;
      v30.super_class = (Class)_NIServerTestWiFiOnlySession;
      v25 = -[NIServerBaseSession resourcesManager](&v30, "resourcesManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "remote"));
      v35 = NSLocalizedDescriptionKey;
      v36 = CFSTR("Failed to stop WiFi service. session is nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v28));
      objc_msgSend(v27, "uwbSessionDidFailWithError:", v29);

    }
  }
  else
  {
    v10 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E8654(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (id)_addPeers:(id)a3
{
  id v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_NIServerTestWiFiOnlySession;
  v5 = -[NIServerBaseSession resourcesManager](&v20, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btResource", (_QWORD)v16));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rawToken"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addPeerDiscoveryToken:", v13));

      if (v14)
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v14 = 0;
  }

  return v14;
}

- (id)_removePeers:(id)a3
{
  NIServerSessionResourceManager *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];

  v22.receiver = self;
  v22.super_class = (Class)_NIServerTestWiFiOnlySession;
  v17 = a3;
  v3 = -[NIServerBaseSession resourcesManager](&v22, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v17;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btResource"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rawToken"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "removePeerDiscoveryToken:", v12));

        if (v13)
        {
          v14 = v13;

          v15 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#ses-wifi-test,#warning, failed to remove peer with error: %@", buf, 0xCu);
          }
          v6 = v14;
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v7);
  }

  return v6;
}

- (void)_handleFailedToAddPeer
{
  NIServerSessionResourceManager *v3;
  void *v4;
  void *v5;
  objc_super v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v6.receiver = self;
  v6.super_class = (Class)_NIServerTestWiFiOnlySession;
  v3 = -[NIServerBaseSession resourcesManager](&v6, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lifecycleSupervisor"));
  objc_msgSend(v5, "failedToAddPeer");

  -[_NIServerTestWiFiOnlySession invalidate](self, "invalidate");
}

- (void)_handleFailedToRemovePeer
{
  NIServerSessionResourceManager *v3;
  void *v4;
  void *v5;
  objc_super v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v6.receiver = self;
  v6.super_class = (Class)_NIServerTestWiFiOnlySession;
  v3 = -[NIServerBaseSession resourcesManager](&v6, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lifecycleSupervisor"));
  objc_msgSend(v5, "failedToRemovePeer");

  -[_NIServerTestWiFiOnlySession invalidate](self, "invalidate");
}

- (id)_disableWiFiAndReturnError
{
  uint64_t *p_wifiRangingSession;
  Session *value;

  p_wifiRangingSession = (uint64_t *)&self->_wifiRangingSession;
  value = self->_wifiRangingSession.__ptr_.__value_;
  if (value)
    sub_10002DE08((const std::string *)value);
  sub_100182C64(p_wifiRangingSession, 0);
  sub_100182C64(p_wifiRangingSession, 0);
  return 0;
}

- (void)wifiRangingRangeResults:(const void *)a3
{
  -[NINearbyUpdatesEngine acceptWiFiRangeResults:](self->_updatesEngine, "acceptWiFiRangeResults:", a3);
}

- (void)wifiRangingRangeError:(const int *)a3
{
  void **v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  OS_dispatch_queue *clientQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  void *__p[2];
  char v14;
  NSErrorUserInfoKey v15;
  void *v16;

  sub_10002ED0C(*a3, __p);
  if (v14 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E86F4(&v14, __p, v6);
  v15 = NSLocalizedDescriptionKey;
  v16 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v7));

  clientQueue = self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D3CA0;
  v11[3] = &unk_1007FA518;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async((dispatch_queue_t)clientQueue, v11);

  if (v14 < 0)
    operator delete(__p[0]);
}

- (void)wifiRangingReadiness:(const int *)a3
{
  NSObject *v4;
  void **v5;
  void *__p[2];
  char v7;
  uint8_t buf[4];
  void **v9;

  v4 = (id)qword_10085F520;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_10002ED3C(*a3, __p);
    if (v7 >= 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,Readiness update: %s", buf, 0xCu);
    if (v7 < 0)
      operator delete(__p[0]);
  }

}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v12.receiver = self;
  v12.super_class = (Class)_NIServerTestWiFiOnlySession;
  v5 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btResource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawToken"));
  v10 = objc_msgSend(v8, "uncacheDeviceByTokenData:", v9);

  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E87D8();
  if (self->_wifiRangingSession.__ptr_.__value_)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NIServerTestWiFiOnlySession pauseWithSource:](self, "pauseWithSource:", 2));
    if (v11 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E8778();

  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v5;
  NSObject *v6;
  OS_dispatch_queue *clientQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v5 = a4;
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,didUpdateNearbyObjects enter", buf, 2u);
  }
  clientQueue = self->_clientQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D4080;
  v9[3] = &unk_1007FA518;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async((dispatch_queue_t)clientQueue, v9);

}

- (_NIWiFiRangingTestConfiguration)configuration
{
  return (_NIWiFiRangingTestConfiguration *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  sub_10001AE68((uint64_t)&self->_caManager);
  sub_10001AE68((uint64_t)&self->_pbLogger);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  sub_100182C64((uint64_t *)&self->_wifiRangingSession, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
