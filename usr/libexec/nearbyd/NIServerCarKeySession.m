@implementation NIServerCarKeySession

- (NIServerCarKeySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NIServerCarKeySession *v16;
  NIServerCarKeySession *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  OS_dispatch_queue *clientQueue;
  NICarKeyConfiguration *v23;
  NICarKeyConfiguration *configuration;
  void *v25;
  uint64_t v26;
  NSString *containerUniqueIdentifier;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  NSObject *v31;
  int v32;
  const __CFString *v33;
  NIServerCarKeySession *v34;
  void *v36;
  void *v37;
  objc_super v38;
  uint8_t buf[24];

  v9 = a3;
  v10 = a4;
  v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(NICarKeyConfiguration, v13))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 332, CFSTR("NIServerCarKeySession given invalid configuration."));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));

  if (!v14)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager.serverSessionIdentifier"));

  }
  v15 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-carkey,initWithResourcesManager. Configuration: %@", buf, 0xCu);
  }
  v38.receiver = self;
  v38.super_class = (Class)NIServerCarKeySession;
  v16 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v38, "initWithResourcesManager:configuration:error:", v9, v10, a5);
  v17 = v16;
  if (v16)
  {
    if (v9)
    {
      objc_msgSend(v9, "protobufLogger");
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
    }
    sub_1000145E8((uint64_t)&v16->_pbLogger, (__int128 *)buf);
    v18 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v19 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
    clientQueue = v16->_clientQueue;
    v16->_clientQueue = (OS_dispatch_queue *)v21;

    v23 = (NICarKeyConfiguration *)objc_msgSend(v10, "copy");
    configuration = v16->_configuration;
    v16->_configuration = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
    containerUniqueIdentifier = v16->_containerUniqueIdentifier;
    v16->_containerUniqueIdentifier = (NSString *)v26;

    if (v9)
    {
      objc_msgSend(v9, "powerBudgetProvider");
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
    }
    sub_1000145E8((uint64_t)&v16->_powerBudgetProvider, (__int128 *)buf);
    v28 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v29 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    v31 = (id)qword_10085F520;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = sub_10016E628();
      v33 = CFSTR("No");
      if (v32)
        v33 = CFSTR("Yes");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Power budget reporting to CPMS is supported: %@", buf, 0xCu);
    }

    v34 = v17;
  }

  return v17;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (void)invalidate
{
  NSObject *v3;
  id v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,invalidate.", buf, 2u);
  }
  v4 = -[NIServerCarKeySession disableAllServices](self, "disableAllServices");
  v5.receiver = self;
  v5.super_class = (Class)NIServerCarKeySession;
  -[NIServerBaseSession invalidate](&v5, "invalidate");
}

- (id)disableAllServices
{
  NSObject *v3;
  id v4;
  void *v5;
  AlishaManager *ptr;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  AlishaSession *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  CarKeyTimeoutManager *v14;
  NICarKeyConfiguration *configuration;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[24];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,disableAllServices.", buf, 2u);
  }
  v22.receiver = self;
  v22.super_class = (Class)NIServerCarKeySession;
  v4 = -[NIServerBaseSession disableAllServices](&v22, "disableAllServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    sub_100306A5C(ptr);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    sub_1000145E8((uint64_t)&self->_alishaManager, (__int128 *)buf);
    v7 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  v10 = self->_standaloneAlishaSession.__ptr_;
  if (v10)
  {
    sub_1002AE5BC((uint64_t)v10);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    sub_1000145E8((uint64_t)&self->_standaloneAlishaSession, (__int128 *)buf);
    v11 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v12 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  v14 = self->_timeoutManager.__ptr_;
  if (v14)
  {
    sub_1001DB63C((uint64_t)v14);
    sub_100180AF4(&self->_timeoutManager.__ptr_);
  }
  sub_100180AF4(&self->_certLogger.__ptr_);
  configuration = self->_configuration;
  if (configuration && (id)-[NICarKeyConfiguration configurationType](configuration, "configurationType") == (id)3)
  {
    v16 = sub_1002CA108();
    sub_1002CA330((uint64_t)v16, 0);
    v17 = sub_1002CA108();
    v18 = sub_1002CA338((uint64_t)v17);
    if ((_DWORD)v18)
    {
      v19 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test Test mode after invalidation: unknown", buf, 2u);
      }
    }
    else
    {
      if ((v18 & 0xFF0000000000) == 0)
        __assert_rtn("-[NIServerCarKeySession disableAllServices]", "NIServerCarKeySession.mm", 390, "alishaTestModeResult.payload.has_value()");
      v20 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = BYTE4(v18);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test Test mode after invalidation: %d", buf, 8u);
      }
      if ((v18 & 0xFF00000000) != 0 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E1640();
    }
  }
  return v5;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)3000;
}

- (unint64_t)requiresUWBToRun
{
  return 2;
}

- (id)configure
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *p_p;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned int v34;
  int64_t v35;
  int v36;
  void *__p;
  char v39;
  uint8_t buf[72];
  char v41;
  NSErrorUserInfoKey v42;
  const __CFString *v43;
  uint8_t v44[4];
  void *v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_configuration)
    sub_1003E166C();
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,configure", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
  v5 = v4 == 0;

  if (v5)
  {
    v20 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E1694(v20, v21, v22, v23, v24, v25, v26, v27);
    v46 = NSLocalizedDescriptionKey;
    v47 = CFSTR("Vehicle identifier nil or invalid.");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v28));

  }
  else
  {
    if (!self->_alishaSystem.__ptr_)
    {
      v6 = operator new(0x20uLL);
      v6[1] = 0;
      v6[2] = 0;
      *v6 = off_10080B7A8;
      v6[3] = off_100812B30;
      *(_QWORD *)buf = v6 + 3;
      *(_QWORD *)&buf[8] = v6;
      sub_1000145E8((uint64_t)&self->_alishaSystem, (__int128 *)buf);
      v7 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v9 = __ldaxr(v8);
        while (__stlxr(v9 - 1, v8));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
    }
    sub_1002B24C0((uint64_t)buf);
    if (*(_DWORD *)buf)
    {
      v10 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E1704(v10, v11, v12, v13, v14, v15, v16, v17);
      v42 = NSLocalizedDescriptionKey;
      v43 = CFSTR("Failed to query device capabilities.");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v18));

    }
    else
    {
      if (!v41)
        __assert_rtn("-[NIServerCarKeySession configure]", "NIServerCarKeySession.mm", 431, "response.payload.has_value()");
      v29 = (id)qword_10085F520;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if (!v41)
          sub_10000BA44();
        sub_1002FED5C((uint64_t *)&buf[8]);
        if (v39 >= 0)
          p_p = &__p;
        else
          p_p = __p;
        *(_DWORD *)v44 = 136315138;
        v45 = p_p;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Alisha Capabilities: %s", v44, 0xCu);
        if (v39 < 0)
          operator delete(__p);
      }

      sub_1001B03FC((uint64_t)&self->_cachedCapabilities, (uint64_t)&buf[8]);
      if ((id)-[NICarKeyConfiguration configurationType](self->_configuration, "configurationType") == (id)3)
      {
        v31 = objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _configureForLabTestModeSession](self, "_configureForLabTestModeSession"));
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("PassthroughSession")));
        v34 = objc_msgSend(v33, "BOOLValue");

        v35 = -[NICarKeyConfiguration configurationType](self->_configuration, "configurationType");
        if (v35 == 2)
          v36 = 1;
        else
          v36 = v34;
        if (v36 == 1)
        {
          self->_passthroughParams.isPassthroughSession = 1;
          self->_passthroughParams.anchorSimulation = v35 == 2;
          v31 = objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _configureForPassthroughSession](self, "_configureForPassthroughSession"));
        }
        else
        {
          if ((id)-[NICarKeyConfiguration configurationType](self->_configuration, "configurationType") != (id)1)
            __assert_rtn("-[NIServerCarKeySession configure]", "NIServerCarKeySession.mm", 457, "_configuration.configurationType == _NICarKeyConfigurationTypeOwner");
          v31 = objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _configureForOwnerDevice](self, "_configureForOwnerDevice"));
        }
      }
      v19 = (void *)v31;
    }
    sub_1001B06E0((uint64_t)&buf[8]);
  }
  return v19;
}

- (id)run
{
  void *v3;

  if ((id)-[NICarKeyConfiguration configurationType](self->_configuration, "configurationType") == (id)3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _runLabTestModeSession](self, "_runLabTestModeSession"));
  }
  else if (self->_passthroughParams.isPassthroughSession)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _runPassthroughSession](self, "_runPassthroughSession"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _runOwnerSession](self, "_runOwnerSession"));
  }
  return v3;
}

- (id)pauseWithSource:(int64_t)a3
{
  void *v4;

  if (self->_passthroughParams.isPassthroughSession
    || (id)-[NICarKeyConfiguration configurationType](self->_configuration, "configurationType", a3) == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _pausePassthroughOrLabTestModeSession](self, "_pausePassthroughOrLabTestModeSession", a3));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCarKeySession _pauseOwnerSession](self, "_pauseOwnerSession"));
  }
  return v4;
}

- (NIServerDataResponse)processDCKMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37[3];
  NSErrorUserInfoKey v38;
  void *v39;
  _BYTE v40[12];
  char v41;
  uint8_t buf[4];
  _BYTE __p[12];
  uint64_t v44;
  char v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;
  NSErrorUserInfoKey v48;
  const __CFString *v49;
  NIServerDataResponse result;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)__p = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-carkey,processDCKMessage got dckMessage: %@", buf, 0xCu);
  }
  if (!self->_alishaManager.__ptr_)
  {
    v11 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E1774(v11, v12, v13, v14, v15, v16, v17, v18);
    v48 = NSLocalizedDescriptionKey;
    v49 = CFSTR("State error: No alisha manager when processing DCK message.");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    v10 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v19));

    goto LABEL_16;
  }
  v6 = objc_msgSend(v4, "length");
  if (!v4 || (v7 = v6) == 0)
  {
    v20 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E17E4(v20, v21, v22, v23, v24, v25, v26, v27);
    v46 = NSLocalizedDescriptionKey;
    v47 = CFSTR("Received nil or empty DCK message.");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v10 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19889, v28));

LABEL_16:
    v8 = 0;
    goto LABEL_38;
  }
  sub_10002D73C(v37, (size_t)v6);
  objc_msgSend(v4, "getBytes:length:", v37[0], v7);
  sub_1003073F8((uint64_t *)self->_alishaManager.__ptr_, (uint64_t *)v37, (uint64_t)buf);
  if (v45)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", *(_QWORD *)&__p[4], v44 - *(_QWORD *)&__p[4]));
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v40 = 138412290;
      *(_QWORD *)&v40[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-carkey,DCK processing succeeded and requires sending a response: %@", v40, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    if (*(_DWORD *)buf)
    {
      sub_100301BCC(*(int *)buf, v40);
      if (v41 >= 0)
        v29 = v40;
      else
        v29 = *(_BYTE **)v40;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DCK processing failed. %s"), v29));
      if (v41 < 0)
        operator delete(*(void **)v40);
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E1854();
      v31 = *(_DWORD *)buf;
      v38 = NSLocalizedDescriptionKey;
      v39 = v30;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      if ((v31 + 1016) < 3)
        v33 = -5888;
      else
        v33 = -5887;
      v10 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v33, v32));

    }
    else
    {
      v34 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#ses-carkey,DCK processing succeeded and does not require sending a response.", v40, 2u);
      }
      v10 = 0;
    }
    v8 = 0;
  }
  if (v45 && *(_QWORD *)&__p[4])
  {
    v44 = *(_QWORD *)&__p[4];
    operator delete(*(void **)&__p[4]);
  }
  if (v37[0])
  {
    v37[1] = v37[0];
    operator delete(v37[0]);
  }
LABEL_38:

  v35 = (void *)v8;
  v36 = (void *)v10;
  result.var1 = v36;
  result.var0 = v35;
  return result;
}

- (id)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 monotonicTimeSec:(double)a6 response:(id *)a7
{
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  void *v18;
  _BOOL4 v19;
  unint64_t v20;
  void **v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NIBluetoothHostTimeSyncResponse *v43;
  uint64_t v45;
  void *__p[2];
  char v47;
  int v48;
  void *v49[3];
  char v50;
  _QWORD v51[2];
  unsigned __int8 v52;
  unsigned __int8 v53;
  unsigned __int16 v54;
  unsigned __int8 v55;
  __int16 v56;
  char v57;
  NSErrorUserInfoKey v58;
  void *v59;
  uint8_t buf[4];
  __CFString *v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  unint64_t v65;
  __int16 v66;
  _WORD v67[11];
  NSErrorUserInfoKey v68;
  const __CFString *v69;
  NSErrorUserInfoKey v70;
  const __CFString *v71;

  v13 = (void *)qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("Unknown");
    if (a3 == 138)
      v14 = CFSTR("ConnCompltEventCount0");
    if (a3 == 12)
      v14 = CFSTR("LESetPHY");
    v15 = v14;
    *(_DWORD *)buf = 138413058;
    v61 = v15;
    v62 = 2048;
    v63 = a4;
    v64 = 2048;
    v65 = a5;
    v66 = 2048;
    *(double *)v67 = a6;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-carkey,processBluetoothHostTimeSyncWithType got event: %@, btc clock ticks: %llu, event counter: %llu, monotonic time: %f [s]", buf, 0x2Au);

  }
  *a7 = 0;
  if (self->_alishaManager.__ptr_)
  {
    if (a3 == 12 || a3 == 138)
    {
      if (a3 == 12)
        v17 = 12;
      else
        v17 = 138;
      v18 = sub_100004784();
      v19 = sub_100395744((uint64_t)v18);
      v20 = 7500 * a4;
      if (v19)
        v20 = a4;
      *(_DWORD *)buf = v17;
      LODWORD(v61) = 1;
      BYTE4(v61) = 0;
      BYTE2(v63) = 0;
      v65 = v20;
      LOBYTE(v66) = 1;
      *(_QWORD *)&v67[3] = a5;
      *(double *)&v67[7] = a6;
      LOBYTE(v51[0]) = 0;
      v57 = 0;
      sub_100307A1C((uint64_t)self->_alishaManager.__ptr_, (unsigned int *)buf, (uint64_t)v51, &v48);
      if (v48)
      {
        sub_100301BCC(v48, __p);
        if (v47 >= 0)
          v21 = __p;
        else
          v21 = (void **)__p[0];
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to process Bluetooth host time sync. %s"), v21));
        if (v47 < 0)
          operator delete(__p[0]);
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003E1854();
        v58 = NSLocalizedDescriptionKey;
        v59 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19887, v23));

      }
      else
      {
        if (v57)
        {
          v43 = [NIBluetoothHostTimeSyncResponse alloc];
          LOWORD(v45) = v56;
          *a7 = -[NIBluetoothHostTimeSyncResponse initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:deviceMaxPpm:success:retryDelay:](v43, "initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:deviceMaxPpm:success:retryDelay:", v51[0], v51[1], v52, v53, v54, v55, v45);
        }
        if (v50)
          -[NIServerCarKeySession _relayDCKMessageInternal:](self, "_relayDCKMessageInternal:", v49);
        v24 = 0;
      }
      if (v50 && v49[0])
      {
        v49[1] = v49[0];
        operator delete(v49[0]);
      }
    }
    else
    {
      v34 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E1924(v34, v35, v36, v37, v38, v39, v40, v41);
      v68 = NSLocalizedDescriptionKey;
      v69 = CFSTR("Invalid Bluetooth Host Time Sync Event type. See the NIBluetoothHostTimeSyncType enum for valid options.");
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19887, v42));

    }
  }
  else
  {
    v25 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E18B4(v25, v26, v27, v28, v29, v30, v31, v32);
    v70 = NSLocalizedDescriptionKey;
    v71 = CFSTR("State error: No alisha manager when processing Bluetooth Host Time Sync Event.");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v33));

  }
  return v24;
}

- (NIServerNumberResponse)isRangingLimitExceeded
{
  uint64_t *v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  NIServerNumberResponse result;

  v2 = sub_1002A798C();
  v3 = sub_1002A92D4((NSObject **)v2, 5);
  v4 = &__kCFBooleanFalse;
  if (v3)
    v4 = &__kCFBooleanTrue;
  v5 = v4;
  v6 = 0;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)deleteURSKs
{
  AlishaManager *ptr;
  int v3;
  void **v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;
  NSErrorUserInfoKey v19;
  void *v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    v3 = sub_100307E68((uint64_t)ptr);
    if (!v3)
    {
      v7 = 0;
      return v7;
    }
    sub_100301BCC(v3, __p);
    if (v18 >= 0)
      v4 = __p;
    else
      v4 = (void **)__p[0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to delete keys. %s"), v4));
    if (v18 < 0)
      operator delete(__p[0]);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E1854();
    v19 = NSLocalizedDescriptionKey;
    v20 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19883, v6));

  }
  else
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E1994(v8, v9, v10, v11, v12, v13, v14, v15);
    v21 = NSLocalizedDescriptionKey;
    v22 = CFSTR("State error: No alisha manager when deleting URSKs.");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v5));
  }

  return v7;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6;
  int v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *__p[2];
  char v23;
  NSErrorUserInfoKey v24;
  void *v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[2];
  NSErrorUserInfoKey v30;
  const __CFString *v31;

  v6 = a3;
  if ((os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.nearbyd"), "UTF8String")) & 1) != 0)
  {
    if (v6 && objc_msgSend(v6, "length") == (id)32)
    {
      objc_msgSend(v6, "getBytes:length:", v29, 32);
      v26 = a4;
      v27 = v29[0];
      v28 = v29[1];
      v7 = sub_1002B2AEC((uint64_t)self->_alishaSystem.__ptr_, (uint64_t)&v26);
      if (v7)
      {
        sub_100301BCC(v7, __p);
        if (v23 >= 0)
          v8 = __p;
        else
          v8 = (void **)__p[0];
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to set debug key. %s"), v8));
        if (v23 < 0)
          operator delete(__p[0]);
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003E1854();
        v24 = NSLocalizedDescriptionKey;
        v25 = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19886, v10));

      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v12 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E1A04(v12, v13, v14, v15, v16, v17, v18, v19);
      v30 = NSLocalizedDescriptionKey;
      v31 = CFSTR("Nil or invalid length URSK.");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19886, v20));

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
  }

  return v11;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  int v5;
  void **v6;
  void *v7;
  void *v8;
  void *v9;
  void *__p[2];
  char v12;
  NSErrorUserInfoKey v13;
  void *v14;

  if ((os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.nearbyd"), "UTF8String")) & 1) == 0)
    return (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
  v5 = sub_1002B2C90((uint64_t)self->_alishaSystem.__ptr_, a3);
  if (!v5)
    return 0;
  sub_100301BCC(v5, __p);
  if (v12 >= 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to set URSK TTL. %s"), v6));
  if (v12 < 0)
    operator delete(__p[0]);
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E1854();
  v13 = NSLocalizedDescriptionKey;
  v14 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -18889, v8));

  return v9;
}

- (id)_processCarKeyEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  AnalyticsManager *ptr;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  AnalyticsManager *v21;
  NSObject *v22;
  void *v23;
  AnalyticsManager *v24;
  NSObject *v25;
  void *v26;
  AnalyticsManager *v27;
  AlishaManager *v28;
  NSObject *v29;
  void *v30;
  void **v31;
  AlishaManager *v32;
  void *v33;
  void **v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *__p[2];
  char v40;
  uint8_t v41[4];
  void *v42;
  __int16 v43;
  void **v44;
  uint8_t buf[4];
  int v46;
  __int128 v47;
  char v48;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CarKeyEventType")));
    if (v7 && (v8 = objc_opt_class(NSNumber, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    {
      v9 = objc_msgSend(v7, "integerValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("CarKeyEventReason")));
      v11 = objc_msgSend(v10, "integerValue");

      switch((unint64_t)v9)
      {
        case 1uLL:
          v12 = (id)qword_10085F520;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            *(_DWORD *)buf = 67109378;
            v46 = (int)v11;
            LOWORD(v47) = 2112;
            *(_QWORD *)((char *)&v47 + 2) = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle unlocked (reason %d) for vehicle identifier: %@", buf, 0x12u);

          }
          ptr = self->_analyticsManager.__ptr_;
          if (ptr)
            sub_1001A1A78((uint64_t)ptr);
          goto LABEL_62;
        case 2uLL:
          v19 = (id)qword_10085F520;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            *(_DWORD *)buf = 67109378;
            v46 = (int)v11;
            LOWORD(v47) = 2112;
            *(_QWORD *)((char *)&v47 + 2) = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle locked (reason %d) for vehicle identifier: %@", buf, 0x12u);

          }
          v21 = self->_analyticsManager.__ptr_;
          if (v21)
            sub_1001A18AC((uint64_t)v21);
          goto LABEL_62;
        case 3uLL:
          v22 = (id)qword_10085F520;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            *(_DWORD *)buf = 67109378;
            v46 = (int)v11;
            LOWORD(v47) = 2112;
            *(_QWORD *)((char *)&v47 + 2) = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle ready to drive (reason %d) for vehicle identifier: %@", buf, 0x12u);

          }
          v24 = self->_analyticsManager.__ptr_;
          if (v24)
            sub_1001A1C68((uint64_t)v24);
          goto LABEL_62;
        case 4uLL:
          v25 = (id)qword_10085F520;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            *(_DWORD *)buf = 67109378;
            v46 = (int)v11;
            LOWORD(v47) = 2112;
            *(_QWORD *)((char *)&v47 + 2) = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: ranging intent sent to vehicle (reason %d) for vehicle identifier: %@", buf, 0x12u);

          }
          v27 = self->_analyticsManager.__ptr_;
          if (v27)
          {
            if (v11 == (id)2)
            {
              sub_1001A16FC((uint64_t)v27);
            }
            else if (v11 == (id)1)
            {
              sub_1001A1550((uint64_t)v27);
            }
            else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            {
              sub_1003E1B2C();
            }
          }
          goto LABEL_62;
        case 5uLL:
          v28 = self->_alishaManager.__ptr_;
          if (v28)
          {
            sub_100307288((uint64_t)v28, buf);
            v29 = (id)qword_10085F520;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
              sub_100301BCC(*(int *)buf, __p);
              if (v40 >= 0)
                v31 = __p;
              else
                v31 = (void **)__p[0];
              *(_DWORD *)v41 = 138412546;
              v42 = v30;
              v43 = 2080;
              v44 = v31;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle sent ranging terminated sub-event. Vehicle identifier: %@. Stop ranging status: %s", v41, 0x16u);
              if (v40 < 0)
                operator delete(__p[0]);

            }
            goto LABEL_50;
          }
          v35 = (id)qword_10085F520;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            sub_1003E1B58(v36, (uint64_t)buf, v35);
          }
          goto LABEL_55;
        case 6uLL:
          v32 = self->_alishaManager.__ptr_;
          if (v32)
          {
            sub_100307288((uint64_t)v32, buf);
            v29 = (id)qword_10085F520;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
              sub_100301BCC(*(int *)buf, __p);
              if (v40 >= 0)
                v34 = __p;
              else
                v34 = (void **)__p[0];
              *(_DWORD *)v41 = 138412546;
              v42 = v33;
              v43 = 2080;
              v44 = v34;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_processCarKeyEvent: vehicle sent ranging suspension sub-event. Vehicle identifier: %@. Stop ranging status: %s", v41, 0x16u);
              if (v40 < 0)
                operator delete(__p[0]);

            }
LABEL_50:

            if (v48 && (_QWORD)v47)
            {
              *((_QWORD *)&v47 + 1) = v47;
              operator delete((void *)v47);
            }
          }
          else
          {
            v35 = (id)qword_10085F520;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
              sub_1003E1B9C(v37, (uint64_t)buf, v35);
            }
LABEL_55:

          }
LABEL_62:
          v16 = 0;
          break;
        default:
          v17 = (id)qword_10085F520;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            sub_1003E1ACC((int)v9, v18, buf, v17);
          }

          v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19881, 0));
          goto LABEL_12;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E1AA0();
      v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19881, 0));
LABEL_12:
      v16 = (void *)v15;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E1A74();
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19881, 0));
  }

  return v16;
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  AlishaManager *ptr;

  if (a3 == 4)
  {
    ptr = self->_alishaManager.__ptr_;
    if (ptr)
      sub_100307E94((uint64_t)ptr);
  }
}

- (shared_ptr<rose::objects::AlishaSession>)_buildAlishaSession:(const void *)a3
{
  _QWORD *v3;
  _QWORD *v5;
  NIServerCarKeySession *v6;
  _QWORD *v7;
  _QWORD *v8;
  NIServerCarKeySession *v9;
  NIServerCarKeySession *v10;
  NIServerCarKeySession *v11;
  NIServerCarKeySession *v12;
  NIServerCarKeySession *v13;
  NIServerCarKeySession *v14;
  __shared_weak_count *cntrl;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  NSObject *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  AlishaSession *v41;
  __shared_weak_count *v42;
  __int128 v43;
  void *__p[2];
  char v45;
  Logger *ptr;
  std::__shared_weak_count *v47;
  _QWORD v48[3];
  _QWORD *v49;
  _QWORD v50[3];
  _QWORD *v51;
  _QWORD v52[3];
  _QWORD *v53;
  _BYTE v54[24];
  _BYTE *v55;
  _QWORD v56[3];
  _QWORD *v57;
  _QWORD v58[3];
  _QWORD *v59;
  uint8_t buf[8];
  NIServerCarKeySession *v61;
  uint8_t *v62;
  shared_ptr<rose::objects::AlishaSession> result;

  v5 = v3;
  v6 = self;
  sub_10000BF04(__p, (char *)-[NSString UTF8String](v6->_containerUniqueIdentifier, "UTF8String"));
  v7 = operator new(0x5D8uLL);
  v7[1] = 0;
  v7[2] = 0;
  *v7 = off_10080B7F8;
  v8 = v7 + 3;
  v9 = v6;
  *(_QWORD *)buf = off_10080FF98;
  v61 = v9;
  v62 = buf;
  v10 = v9;
  v58[0] = off_100810018;
  v58[1] = v10;
  v59 = v58;
  v11 = v10;
  v56[0] = off_100810098;
  v56[1] = v11;
  v57 = v56;
  v55 = 0;
  v12 = v11;
  v52[0] = off_100810118;
  v52[1] = v12;
  v53 = v52;
  v13 = v12;
  v50[0] = off_100810198;
  v50[1] = v13;
  v51 = v50;
  v14 = v13;
  v48[0] = off_100810218;
  v48[1] = v14;
  v49 = v48;
  ptr = v6->_pbLogger.__ptr_;
  cntrl = v6->_pbLogger.__cntrl_;
  v47 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    v16 = (unint64_t *)((char *)cntrl + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  sub_1002B34A8(v8, (__int128 *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v58, (uint64_t)v56, (uint64_t)v54, (uint64_t)v52, (uint64_t)v50, (uint64_t)v48, &ptr);
  v18 = v47;
  if (v47)
  {
    p_shared_owners = (unint64_t *)&v47->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v49;
  if (v49 == v48)
  {
    v22 = 4;
    v21 = v48;
  }
  else
  {
    if (!v49)
      goto LABEL_14;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_14:
  v23 = v51;
  if (v51 == v50)
  {
    v24 = 4;
    v23 = v50;
  }
  else
  {
    if (!v51)
      goto LABEL_19;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_19:
  v25 = v53;
  if (v53 == v52)
  {
    v26 = 4;
    v25 = v52;
  }
  else
  {
    if (!v53)
      goto LABEL_24;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_24:
  v27 = v55;
  if (v55 == v54)
  {
    v28 = 4;
    v27 = v54;
  }
  else
  {
    if (!v55)
      goto LABEL_29;
    v28 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_29:
  v29 = v57;
  if (v57 == v56)
  {
    v30 = 4;
    v29 = v56;
  }
  else
  {
    if (!v57)
      goto LABEL_34;
    v30 = 5;
  }
  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_34:
  v31 = v59;
  if (v59 == v58)
  {
    v32 = 4;
    v31 = v58;
  }
  else
  {
    if (!v59)
      goto LABEL_39;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_39:
  v33 = v62;
  if (v62 == buf)
  {
    v34 = 4;
    v33 = buf;
  }
  else
  {
    if (!v62)
      goto LABEL_44;
    v34 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v33 + 8 * v34))();
LABEL_44:
  *(_QWORD *)&v43 = v7 + 3;
  *((_QWORD *)&v43 + 1) = v7;
  sub_10001B020((uint64_t)&v43, v7 + 5, (uint64_t)v8);
  v35 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Registering for Alisha service.", buf, 2u);
  }
  v36 = sub_1002AEA48(v43);
  if (v36)
  {
    v37 = (id)qword_10085F520;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v36, buf);
      sub_1003E1BE0();
    }

    *v5 = 0;
    v5[1] = 0;
    v38 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
    if (*((_QWORD *)&v43 + 1))
    {
      v39 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
  }
  else
  {
    *(_OWORD *)v5 = v43;
  }
  if (v45 < 0)
    operator delete(__p[0]);

  result.__cntrl_ = v42;
  result.__ptr_ = v41;
  return result;
}

- (void)_alishaSessionInvalidatedWithReason:(int)a3
{
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  objc_super v9;
  _QWORD v10[3];

  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1002B48E0(a3, v10);
    sub_1003E1C34();
  }

  -[NIServerCarKeySession invalidate](self, "invalidate");
  v9.receiver = self;
  v9.super_class = (Class)NIServerCarKeySession;
  v6 = -[NIServerBaseSession invalidationHandler](&v9, "invalidationHandler");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  ((void (**)(_QWORD, void *))v7)[2](v7, v8);

}

- (id)_configureForOwnerDevice
{
  optional<rose::alisha::hsi::Capabilities> *p_cachedCapabilities;
  NSObject *v4;
  NIServerCarKeySession *v5;
  shared_ptr<rose::alisha::dck::Coder> *p_dckCoder;
  NIServerCarKeySession *v7;
  shared_ptr<rose::alisha::analytics::AnalyticsManager> *p_analyticsManager;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  NIServerCarKeySession *v12;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  __shared_weak_count *cntrl;
  unint64_t *v27;
  unint64_t v28;
  __shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  _QWORD *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  _QWORD *v38;
  NIServerCarKeySession *v39;
  NIServerCarKeySession *v40;
  __shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  __shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  __shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  __shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  __shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  __int128 *v76;
  uint64_t v77;
  _QWORD *v78;
  NIServerCarKeySession *v79;
  uint8_t *v80;
  uint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *p_shared_owners;
  unint64_t v84;
  std::__shared_weak_count *v85;
  unint64_t *v86;
  unint64_t v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  std::__shared_weak_count *v91;
  unint64_t *v92;
  unint64_t v93;
  uint8_t *v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  unint64_t *v97;
  unint64_t v98;
  std::__shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  void *v103;
  __int128 v104;
  __int128 v105;
  id v106;
  AnalyticsManager *v107;
  std::__shared_weak_count *v108;
  Logger *v109;
  std::__shared_weak_count *v110;
  __int128 v111;
  ParameterNegotiator *v112;
  std::__shared_weak_count *v113;
  __int128 v114;
  AlishaConfigProvider *ptr;
  std::__shared_weak_count *v116;
  __int128 v117;
  __int128 *v118;
  uint8_t buf[24];
  uint8_t *v120;

  p_cachedCapabilities = &self->_cachedCapabilities;
  if (!self->_cachedCapabilities.__engaged_)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v103, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 876, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_cachedCapabilities.has_value()"));

  }
  v4 = (id)qword_10085F520;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_configureForOwnerDevice", buf, 2u);
  }

  if (self->_passthroughParams.isPassthroughSession)
    sub_1003E1CB0();
  if (self->_passthroughParams.anchorSimulation)
    sub_1003E1C88();
  v5 = self;
  p_dckCoder = &v5->_dckCoder;
  if (!v5->_dckCoder.__ptr_)
  {
    sub_10025C780(word_100473550, buf);
    sub_1000145E8((uint64_t)p_dckCoder, (__int128 *)buf);
    v14 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  if (!v5->_configProvider.__ptr_)
  {
    LOBYTE(ptr) = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](v5->_configuration, "debugOptions"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("BypassBluetoothTimesync")));
    v19 = objc_msgSend(v18, "BOOLValue");

    LOBYTE(ptr) = v19;
    sub_10025C86C((char *)&ptr, buf);
    sub_1000145E8((uint64_t)&v5->_configProvider, (__int128 *)buf);
    v20 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v21 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  if (!v5->_paramNegotiator.__ptr_)
  {
    if (!p_cachedCapabilities->__engaged_)
      sub_10000BA44();
    v23 = operator new(0xE8uLL);
    v24 = v23;
    v23[1] = 0;
    v23[2] = 0;
    *v23 = off_10080BDB8;
    v25 = v23 + 3;
    *(_QWORD *)&v117 = v5->_alishaSystem.__ptr_;
    cntrl = v5->_alishaSystem.__cntrl_;
    *((_QWORD *)&v117 + 1) = cntrl;
    if (cntrl)
    {
      v27 = (unint64_t *)((char *)cntrl + 8);
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
    ptr = v5->_configProvider.__ptr_;
    v29 = v5->_configProvider.__cntrl_;
    v116 = (std::__shared_weak_count *)v29;
    if (v29)
    {
      v30 = (unint64_t *)((char *)v29 + 8);
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
    }
    *(_QWORD *)buf = off_100810418;
    v120 = buf;
    sub_1002F9FC8(v23 + 3, p_cachedCapabilities, &v117, &ptr, buf);
    v32 = v120;
    if (v120 == buf)
    {
      v33 = 4;
      v32 = buf;
    }
    else
    {
      if (!v120)
        goto LABEL_102;
      v33 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v32 + 8 * v33))();
LABEL_102:
    v82 = v116;
    if (v116)
    {
      p_shared_owners = (unint64_t *)&v116->__shared_owners_;
      do
        v84 = __ldaxr(p_shared_owners);
      while (__stlxr(v84 - 1, p_shared_owners));
      if (!v84)
      {
        ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
        std::__shared_weak_count::__release_weak(v82);
      }
    }
    v85 = (std::__shared_weak_count *)*((_QWORD *)&v117 + 1);
    if (*((_QWORD *)&v117 + 1))
    {
      v86 = (unint64_t *)(*((_QWORD *)&v117 + 1) + 8);
      do
        v87 = __ldaxr(v86);
      while (__stlxr(v87 - 1, v86));
      if (!v87)
      {
        ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
        std::__shared_weak_count::__release_weak(v85);
      }
    }
    *(_QWORD *)&v114 = v25;
    *((_QWORD *)&v114 + 1) = v24;
    sub_1000145E8((uint64_t)&v5->_paramNegotiator, &v114);
    v88 = (std::__shared_weak_count *)*((_QWORD *)&v114 + 1);
    if (*((_QWORD *)&v114 + 1))
    {
      v89 = (unint64_t *)(*((_QWORD *)&v114 + 1) + 8);
      do
        v90 = __ldaxr(v89);
      while (__stlxr(v90 - 1, v89));
      if (!v90)
      {
        ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
        std::__shared_weak_count::__release_weak(v88);
      }
    }
  }
  v7 = v5;
  p_analyticsManager = &v7->_analyticsManager;
  if (!v7->_analyticsManager.__ptr_)
  {
    v34 = operator new(0xE0uLL);
    v34[1] = 0;
    v34[2] = 0;
    *v34 = off_100810498;
    *(_QWORD *)buf = sub_10019F818((uint64_t)(v34 + 3), v7->_clientQueue);
    *(_QWORD *)&buf[8] = v34;
    sub_1000145E8((uint64_t)p_analyticsManager, (__int128 *)buf);
    v35 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v36 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
  }
  if (!v7->_certLogger.__ptr_)
  {
    v106 = (id)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](v7->_configuration, "vehicleIdentifier"));
    sub_10025D68C(&v106, buf);
    sub_1000145E8((uint64_t)&v7->_certLogger, (__int128 *)buf);
    v9 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v10 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }

  }
  if (!v7->_alishaManager.__ptr_)
  {
    sub_1002A798C();
    sub_1002A923C(5, v7->_containerUniqueIdentifier, v7->_clientQueue, &v105);
    v38 = operator new(0x100uLL);
    v38[1] = 0;
    v38[2] = 0;
    *v38 = off_100810538;
    v39 = v7;
    *(_QWORD *)buf = off_100810588;
    *(_QWORD *)&buf[8] = v39;
    v120 = buf;
    v40 = v39;
    *(_QWORD *)&v117 = off_100810608;
    *((_QWORD *)&v117 + 1) = v40;
    v118 = &v117;
    ptr = (AlishaConfigProvider *)v7->_alishaSystem.__ptr_;
    v41 = v7->_alishaSystem.__cntrl_;
    v116 = (std::__shared_weak_count *)v41;
    if (v41)
    {
      v42 = (unint64_t *)((char *)v41 + 8);
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
    }
    *(_QWORD *)&v114 = p_dckCoder->__ptr_;
    v44 = v5->_dckCoder.__cntrl_;
    *((_QWORD *)&v114 + 1) = v44;
    if (v44)
    {
      v45 = (unint64_t *)((char *)v44 + 8);
      do
        v46 = __ldxr(v45);
      while (__stxr(v46 + 1, v45));
    }
    v112 = v5->_paramNegotiator.__ptr_;
    v47 = v5->_paramNegotiator.__cntrl_;
    v113 = (std::__shared_weak_count *)v47;
    if (v47)
    {
      v48 = (unint64_t *)((char *)v47 + 8);
      do
        v49 = __ldxr(v48);
      while (__stxr(v49 + 1, v48));
    }
    v111 = v105;
    if (*((_QWORD *)&v105 + 1))
    {
      v50 = (unint64_t *)(*((_QWORD *)&v105 + 1) + 8);
      do
        v51 = __ldxr(v50);
      while (__stxr(v51 + 1, v50));
    }
    v109 = v7->_pbLogger.__ptr_;
    v52 = v7->_pbLogger.__cntrl_;
    v110 = (std::__shared_weak_count *)v52;
    if (v52)
    {
      v53 = (unint64_t *)((char *)v52 + 8);
      do
        v54 = __ldxr(v53);
      while (__stxr(v54 + 1, v53));
    }
    v107 = p_analyticsManager->__ptr_;
    v55 = v7->_analyticsManager.__cntrl_;
    v108 = (std::__shared_weak_count *)v55;
    if (v55)
    {
      v56 = (unint64_t *)((char *)v55 + 8);
      do
        v57 = __ldxr(v56);
      while (__stxr(v57 + 1, v56));
    }
    sub_10030695C((uint64_t)(v38 + 3), (uint64_t)buf, (uint64_t)&v117, &ptr, &v114, &v112, &v111, &v109, &v107);
    v58 = v108;
    if (v108)
    {
      v59 = (unint64_t *)&v108->__shared_owners_;
      do
        v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }
    v61 = v110;
    if (v110)
    {
      v62 = (unint64_t *)&v110->__shared_owners_;
      do
        v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }
    v64 = (std::__shared_weak_count *)*((_QWORD *)&v111 + 1);
    if (*((_QWORD *)&v111 + 1))
    {
      v65 = (unint64_t *)(*((_QWORD *)&v111 + 1) + 8);
      do
        v66 = __ldaxr(v65);
      while (__stlxr(v66 - 1, v65));
      if (!v66)
      {
        ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
        std::__shared_weak_count::__release_weak(v64);
      }
    }
    v67 = v113;
    if (v113)
    {
      v68 = (unint64_t *)&v113->__shared_owners_;
      do
        v69 = __ldaxr(v68);
      while (__stlxr(v69 - 1, v68));
      if (!v69)
      {
        ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
        std::__shared_weak_count::__release_weak(v67);
      }
    }
    v70 = (std::__shared_weak_count *)*((_QWORD *)&v114 + 1);
    if (*((_QWORD *)&v114 + 1))
    {
      v71 = (unint64_t *)(*((_QWORD *)&v114 + 1) + 8);
      do
        v72 = __ldaxr(v71);
      while (__stlxr(v72 - 1, v71));
      if (!v72)
      {
        ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
        std::__shared_weak_count::__release_weak(v70);
      }
    }
    v73 = v116;
    if (v116)
    {
      v74 = (unint64_t *)&v116->__shared_owners_;
      do
        v75 = __ldaxr(v74);
      while (__stlxr(v75 - 1, v74));
      if (!v75)
      {
        ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
        std::__shared_weak_count::__release_weak(v73);
      }
    }
    v76 = v118;
    if (v118 == &v117)
    {
      v77 = 4;
      v76 = &v117;
    }
    else
    {
      if (!v118)
        goto LABEL_126;
      v77 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v76 + 8 * v77))();
LABEL_126:
    v94 = v120;
    if (v120 == buf)
    {
      v95 = 4;
      v94 = buf;
    }
    else
    {
      if (!v120)
        goto LABEL_131;
      v95 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v94 + 8 * v95))();
LABEL_131:
    *(_QWORD *)&v104 = v38 + 3;
    *((_QWORD *)&v104 + 1) = v38;
    sub_1000145E8((uint64_t)&v7->_alishaManager, &v104);
    v96 = (std::__shared_weak_count *)*((_QWORD *)&v104 + 1);
    if (*((_QWORD *)&v104 + 1))
    {
      v97 = (unint64_t *)(*((_QWORD *)&v104 + 1) + 8);
      do
        v98 = __ldaxr(v97);
      while (__stlxr(v98 - 1, v97));
      if (!v98)
      {
        ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
        std::__shared_weak_count::__release_weak(v96);
      }
    }
    v99 = (std::__shared_weak_count *)*((_QWORD *)&v105 + 1);
    if (*((_QWORD *)&v105 + 1))
    {
      v100 = (unint64_t *)(*((_QWORD *)&v105 + 1) + 8);
      do
        v101 = __ldaxr(v100);
      while (__stlxr(v101 - 1, v100));
      if (!v101)
      {
        ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
        std::__shared_weak_count::__release_weak(v99);
      }
    }
  }
  v12 = v7;
  if (v12->_timeoutManager.__ptr_)
    goto LABEL_20;
  v78 = operator new(0x78uLL);
  v78[1] = 0;
  v78[2] = 0;
  *v78 = off_100810688;
  v79 = v12;
  *(_QWORD *)buf = off_1008106D8;
  *(_QWORD *)&buf[8] = v79;
  v120 = buf;
  sub_1001DB4D4((uint64_t)(v78 + 3), (uint64_t)buf, v12->_clientQueue, v12->_containerUniqueIdentifier);
  v80 = v120;
  if (v120 == buf)
  {
    v81 = 4;
    v80 = buf;
    goto LABEL_118;
  }
  if (v120)
  {
    v81 = 5;
LABEL_118:
    (*(void (**)(void))(*(_QWORD *)v80 + 8 * v81))();
  }
  *(_QWORD *)&v117 = v78 + 3;
  *((_QWORD *)&v117 + 1) = v78;
  sub_10001B020((uint64_t)&v117, v78 + 3, (uint64_t)(v78 + 3));
  sub_1000145E8((uint64_t)&v12->_timeoutManager, &v117);
  v91 = (std::__shared_weak_count *)*((_QWORD *)&v117 + 1);
  if (*((_QWORD *)&v117 + 1))
  {
    v92 = (unint64_t *)(*((_QWORD *)&v117 + 1) + 8);
    do
      v93 = __ldaxr(v92);
    while (__stlxr(v93 - 1, v92));
    if (!v93)
    {
      ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
      std::__shared_weak_count::__release_weak(v91);
    }
  }
LABEL_20:

  return 0;
}

- (id)_configureForPassthroughSession
{
  NSObject *v4;
  _BOOL4 anchorSimulation;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 engaged;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  void **v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  AlishaSession *ptr;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *__p[2];
  char v86;
  NSErrorUserInfoKey v87;
  const __CFString *v88;
  NSErrorUserInfoKey v89;
  void *v90;
  uint8_t buf[4];
  _BOOL4 v92;
  uint64_t v93;
  unsigned __int8 v94;
  NSErrorUserInfoKey v95;
  const __CFString *v96;
  NSErrorUserInfoKey v97;
  const __CFString *v98;
  NSErrorUserInfoKey v99;
  const __CFString *v100;
  NSErrorUserInfoKey v101;
  const __CFString *v102;

  if ((os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.nearbyd"), "UTF8String")) & 1) == 0)
    return (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    anchorSimulation = self->_passthroughParams.anchorSimulation;
    *(_DWORD *)buf = 67109120;
    v92 = anchorSimulation;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_configureForPassthroughSession. Anchor: %d", buf, 8u);
  }
  if (!self->_configuration)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 968, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_configuration"));

  }
  if (!self->_cachedCapabilities.__engaged_)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 969, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_cachedCapabilities.has_value()"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
  v7 = v6 == 0;

  if (v7)
  {
    v101 = NSLocalizedDescriptionKey;
    v102 = CFSTR("Passthrough configuration must have debugOptions.");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v24));

    return v25;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BypassBluetoothTimesync")));
  self->_passthroughParams.bypassBluetoothTimesync = objc_msgSend(v9, "BOOLValue");

  if (self->_passthroughParams.anchorSimulation)
  {
    if (self->_passthroughParams.bypassBluetoothTimesync)
      goto LABEL_23;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DckTimeSyncBtEventLocalClock")));

    if (v11 && (v13 = objc_opt_class(NSNumber, v12), (objc_opt_isKindOfClass(v11, v13) & 1) != 0))
    {
      v14 = (unint64_t)objc_msgSend(v11, "unsignedLongLongValue");
      v15 = sub_100004784();
      v16 = sub_100395744((uint64_t)v15);
      engaged = self->_passthroughParams.dckTimeSyncBtEvent.__engaged_;
      v18 = 7500 * v14;
      if (v16)
        v18 = v14;
      *(_QWORD *)&self->_passthroughParams.dckTimeSyncBtEvent.var0.__null_state_ = 0x10000008ALL;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.bluetoothTicks.var0.__null_state_ = 0;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.bluetoothTicks.__engaged_ = 0;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.gtbTicks.var0.__val_.__rep_ = v18;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.gtbTicks.__engaged_ = 1;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.eventCounter = 0;
      self->_passthroughParams.dckTimeSyncBtEvent.var0.__val_.monotonicTimeSec = 0.0;
      if (!engaged)
        self->_passthroughParams.dckTimeSyncBtEvent.__engaged_ = 1;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions", COERCE_DOUBLE(0x10000008ALL)));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("DckTimeSyncUwbDeviceTime")));

      if (v20)
      {
        v22 = objc_opt_class(NSNumber, v21);
        if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
        {
          self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.var0.__val_ = (unint64_t)objc_msgSend(v20, "unsignedLongLongValue");
          self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.__engaged_ = 1;

          goto LABEL_23;
        }
      }
      v72 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E1E28(v72, v73, v74, v75, v76, v77, v78, v79);
      v95 = NSLocalizedDescriptionKey;
      v96 = CFSTR("Anchor simulation must provide DckTimeSyncUwbDeviceTime in debug options.");
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v80));

      return v81;
    }
    else
    {
      v42 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E1DB8(v42, v43, v44, v45, v46, v47, v48, v49);
      v97 = NSLocalizedDescriptionKey;
      v98 = CFSTR("Anchor simulation must provide DckTimeSyncBtEventLocalClock in debug options.");
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1));
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v50));

      return v51;
    }
  }
  else
  {
    if (self->_passthroughParams.bypassBluetoothTimesync)
    {
LABEL_23:
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
      -[NIServerCarKeySession _passthroughSessionServiceRequest:](self, "_passthroughSessionServiceRequest:", v26);

      v27 = v94;
      if (v94)
        v28 = 0;
      else
        v28 = -1004;
      if (*(_DWORD *)buf)
        v29 = *(_DWORD *)buf;
      else
        v29 = v28;
      if (v29)
      {
        sub_100301BCC(v29, __p);
        if (v86 >= 0)
          v30 = __p;
        else
          v30 = (void **)__p[0];
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create alisha service request. %s"), v30));
        if (v86 < 0)
          operator delete(__p[0]);
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003E1854();
        v89 = NSLocalizedDescriptionKey;
        v90 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
        if ((v29 + 1016) < 3)
          v33 = -5888;
        else
          v33 = -5887;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v33, v32));

        return v34;
      }
      else
      {
        ptr = self->_standaloneAlishaSession.__ptr_;
        if (ptr)
        {
          sub_1002AE5BC((uint64_t)ptr);
          sub_100180AF4(&self->_standaloneAlishaSession.__ptr_);
          v27 = v94;
        }
        if (!v27)
          sub_10000BA44();
        -[NIServerCarKeySession _buildAlishaSession:](self, "_buildAlishaSession:", &v93);
        sub_1000145E8((uint64_t)&self->_standaloneAlishaSession, (__int128 *)__p);
        v36 = (std::__shared_weak_count *)__p[1];
        if (__p[1])
        {
          v37 = (unint64_t *)((char *)__p[1] + 8);
          do
            v38 = __ldaxr(v37);
          while (__stlxr(v38 - 1, v37));
          if (!v38)
          {
            ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
            std::__shared_weak_count::__release_weak(v36);
          }
        }
        if (self->_standaloneAlishaSession.__ptr_)
        {
          if (!self->_certLogger.__ptr_)
          {
            v84 = (id)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
            sub_10025D68C(&v84, __p);
            sub_1000145E8((uint64_t)&self->_certLogger, (__int128 *)__p);
            v39 = (std::__shared_weak_count *)__p[1];
            if (__p[1])
            {
              v40 = (unint64_t *)((char *)__p[1] + 8);
              do
                v41 = __ldaxr(v40);
              while (__stlxr(v41 - 1, v40));
              if (!v41)
              {
                ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
                std::__shared_weak_count::__release_weak(v39);
              }
            }

          }
          return 0;
        }
        else
        {
          v62 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003E1D48(v62, v63, v64, v65, v66, v67, v68, v69);
          v87 = NSLocalizedDescriptionKey;
          v88 = CFSTR("Failed to create alisha standalone session.");
          v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1));
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v70));

          return v71;
        }
      }
    }
    v52 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E1CD8(v52, v53, v54, v55, v56, v57, v58, v59);
    v99 = NSLocalizedDescriptionKey;
    v100 = CFSTR("Passthrough session in mobile role must bypass BT timesync.");
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v60));

    return v61;
  }
}

- (id)_configureForLabTestModeSession
{
  NSObject *v4;
  NICarKeyConfiguration *configuration;
  NIServerSessionResourceManager *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  unsigned __int8 v51;
  void *v52;
  unsigned __int8 v53;
  __int16 v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  double v76;
  AlishaSession *ptr;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  unint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  BOOL v104;
  BOOL v105;
  unsigned __int8 v106;
  unsigned __int8 v107;
  unsigned __int8 v108;
  unsigned __int8 v109;
  unsigned __int8 v110;
  unsigned int v111;
  unsigned __int8 v112;
  unsigned __int8 v113;
  unsigned __int16 v114;
  unsigned __int16 v115;
  id v116;
  __int128 v117[2];
  int v118;
  unsigned __int8 v119;
  char v120;
  unsigned __int16 v121;
  unsigned __int16 v122;
  unsigned __int8 v123;
  unsigned __int8 v124;
  unsigned __int8 v125;
  unsigned __int8 v126;
  unsigned __int8 v127;
  unsigned __int8 v128;
  __int16 v129;
  char v130;
  _DWORD v131[2];
  char v132;
  unsigned int v133;
  char v134;
  BOOL v135;
  __int16 v136;
  __int16 v137;
  __int16 v138;
  BOOL v139;
  BOOL v140;
  int v141;
  objc_super v142;
  NSErrorUserInfoKey v143;
  const __CFString *v144;
  uint8_t buf[4];
  int v146;
  NSErrorUserInfoKey v147;
  void *v148;
  NSErrorUserInfoKey v149;
  const __CFString *v150;
  NSErrorUserInfoKey v151;
  const __CFString *v152;
  NSErrorUserInfoKey v153;
  const __CFString *v154;
  NSErrorUserInfoKey v155;
  const __CFString *v156;
  NSErrorUserInfoKey v157;
  const __CFString *v158;

  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test _configure", buf, 2u);
  }
  configuration = self->_configuration;
  if (!configuration)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v101, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 1055, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_configuration"));

    configuration = self->_configuration;
  }
  if ((id)-[NICarKeyConfiguration configurationType](configuration, "configurationType") != (id)3)
  {
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v102, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 1056, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_configuration.configurationType == _NICarKeyConfigurationTypeLabTestMode"));

  }
  if (!self->_alishaSystem.__ptr_)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v103, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 1057, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_alishaSystem"));

  }
  v142.receiver = self;
  v142.super_class = (Class)NIServerCarKeySession;
  v6 = -[NIServerBaseSession resourcesManager](&v142, "resourcesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if ((objc_msgSend(v7, "entitlementGranted:", 7) & 1) != 0)
  {
    v8 = sub_1002CA108();
    v9 = sub_1002CA338((uint64_t)v8);
    if ((_DWORD)v9)
    {
      v10 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E20B8(v10, v11, v12, v13, v14, v15, v16, v17);
      v155 = NSLocalizedDescriptionKey;
      v156 = CFSTR("Current test mode undetermined.");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v18));

      goto LABEL_17;
    }
    if ((v9 & 0xFF0000000000) == 0)
      __assert_rtn("-[NIServerCarKeySession _configureForLabTestModeSession]", "NIServerCarKeySession.mm", 1077, "alishaTestModeResult.payload.has_value()");
    v30 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v146 = BYTE4(v9);
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test current test mode: %d", buf, 8u);
    }
    if ((v9 & 0xFF00000000) != 0)
      goto LABEL_22;
    if (sub_1002B2760())
    {
      v55 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E2048(v55, v56, v57, v58, v59, v60, v61, v62);
      v153 = NSLocalizedDescriptionKey;
      v154 = CFSTR("Failed to delete keys.");
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v63));

    }
    else
    {
      v66 = sub_1002CA108();
      if (sub_1002CA330((uint64_t)v66, 1))
      {
        v67 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003E1FD8(v67, v68, v69, v70, v71, v72, v73, v74);
        v151 = NSLocalizedDescriptionKey;
        v152 = CFSTR("Failed to set test mode.");
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v75));

      }
      else
      {
        v90 = sub_1002CA108();
        v91 = sub_1002CA338((uint64_t)v90);
        if (!(_DWORD)v91 && (v91 & 0xFF0000000000) != 0 && (v91 & 0xFF00000000) != 0)
        {
LABEL_22:
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v115 = (unsigned __int16)sub_100258AD4(v31, CFSTR("AlishaProtocolVersion"), (id)0x100);

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v114 = (unsigned __int16)sub_100258AD4(v32, CFSTR("UWBConfigId"), (id)1);

          v33 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v113 = sub_100258AD4(v33, CFSTR("PulseShapeCombo"), 0);

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v112 = sub_100258AD4(v34, CFSTR("HopConfigBitmask"), (id)0x80);

          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v111 = sub_100258AD4(v35, CFSTR("AnchorHopKey"), 0);

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v110 = sub_100258AD4(v36, CFSTR("RFChannel"), (id)1);

          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v38 = sub_100258AD4(v37, CFSTR("SyncCodeIndex"), (id)9);

          v39 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v109 = sub_100258AD4(v39, CFSTR("SessionRANMultiplier"), (id)1);

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v108 = sub_100258AD4(v40, CFSTR("ChapsPerSlot"), (id)6);

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v107 = sub_100258AD4(v41, CFSTR("SlotsPerRound"), (id)0xC);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
          v106 = sub_100258AD4(v42, CFSTR("NumResponderNodes"), (id)6);

          v43 = (_BYTE)v38 - 9;
          if (((_BYTE)v38 - 9) >= 4u)
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid sync code index %d"), v38));
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
              sub_1003E1F78();
            v147 = NSLocalizedDescriptionKey;
            v148 = v64;
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1));
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v65));

          }
          else
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
            v105 = sub_100258AD4(v44, CFSTR("DisableUWBEncryption"), 0) != 0;

            v45 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
            v104 = sub_100258AD4(v45, CFSTR("DisableSecureToF"), 0) != 0;

            v46 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
            v47 = sub_100258AD4(v46, CFSTR("ForceAntennaSelection"), 0) != 0;

            if (v47)
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
              v49 = sub_100258AD4(v48, CFSTR("TxAntennaMask"), 0);

              v50 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
              v51 = sub_100258AD4(v50, CFSTR("RxAntennaMask"), 0);

              v52 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](self->_configuration, "debugOptions"));
              v53 = sub_100258AD4(v52, CFSTR("RxSyncSearchAntennaMask"), 0);

              v54 = 1;
            }
            else
            {
              v53 = 0;
              v54 = 0;
              v51 = 0;
              v49 = 0;
            }
            v131[0] = 0x1000000;
            v131[1] = 305419896;
            v132 = 1;
            v133 = v111;
            v134 = 1;
            v135 = v47;
            v136 = v49 | ((v54 & 1) << 8);
            v137 = v51 | ((v54 & 1) << 8);
            v138 = v53 | (unsigned __int16)(v54 << 8);
            v139 = v105;
            v140 = v104;
            v141 = 5;
            v118 = -2023406815;
            v119 = v110;
            v120 = v43;
            v121 = v115;
            v122 = v114;
            v123 = v109;
            v124 = v108;
            v125 = v107;
            v126 = v106;
            v127 = v112;
            v128 = v113;
            v130 = 0;
            v129 = 0;
            +[NIServerCarKeySession _aopJobConfigWithTimeouts](NIServerCarKeySession, "_aopJobConfigWithTimeouts");
            *(_QWORD *)&v76 = sub_100164520(&v118, 102, (uint64_t)v117, (unsigned __int8 *)v131, (uint64_t)buf).n128_u64[0];
            ptr = self->_standaloneAlishaSession.__ptr_;
            if (ptr)
            {
              sub_1002AE5BC((uint64_t)ptr);
              sub_100180AF4(&self->_standaloneAlishaSession.__ptr_);
            }
            -[NIServerCarKeySession _buildAlishaSession:](self, "_buildAlishaSession:", buf, v76);
            sub_1000145E8((uint64_t)&self->_standaloneAlishaSession, v117);
            v78 = (std::__shared_weak_count *)*((_QWORD *)&v117[0] + 1);
            if (*((_QWORD *)&v117[0] + 1))
            {
              v79 = (unint64_t *)(*((_QWORD *)&v117[0] + 1) + 8);
              do
                v80 = __ldaxr(v79);
              while (__stlxr(v80 - 1, v79));
              if (!v80)
              {
                ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
                std::__shared_weak_count::__release_weak(v78);
              }
            }
            if (self->_standaloneAlishaSession.__ptr_)
            {
              if (!self->_certLogger.__ptr_)
              {
                v116 = (id)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](self->_configuration, "vehicleIdentifier"));
                sub_10025D68C(&v116, v117);
                sub_1000145E8((uint64_t)&self->_certLogger, v117);
                sub_10001AE68((uint64_t)v117);

              }
              v19 = 0;
            }
            else
            {
              v81 = qword_10085F520;
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                sub_1003E1F08(v81, v82, v83, v84, v85, v86, v87, v88);
              v143 = NSLocalizedDescriptionKey;
              v144 = CFSTR("Failed to create standalone session.");
              v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1));
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v89));

            }
          }
          goto LABEL_17;
        }
        v92 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003E1E98(v92, v93, v94, v95, v96, v97, v98, v99);
        v149 = NSLocalizedDescriptionKey;
        v150 = CFSTR("Failed to enable test mode.");
        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v100));

      }
    }
  }
  else
  {
    v20 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E2128(v20, v21, v22, v23, v24, v25, v26, v27);
    v157 = NSLocalizedDescriptionKey;
    v158 = CFSTR("Not authorized.");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v28));

  }
LABEL_17:

  return v19;
}

- (id)_runLabTestModeSession
{
  NSObject *v4;
  NICarKeyConfiguration *configuration;
  AlishaSession *ptr;
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *__p[2];
  char v16;
  uint8_t buf[4];
  NSErrorUserInfoKey v18;
  void *v19;

  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-carkey,#lab-test _run", buf, 2u);
  }
  configuration = self->_configuration;
  if (!configuration)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 1197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_configuration"));

    configuration = self->_configuration;
  }
  if ((id)-[NICarKeyConfiguration configurationType](configuration, "configurationType") != (id)3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 1198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_configuration.configurationType == _NICarKeyConfigurationTypeLabTestMode"));

  }
  ptr = self->_standaloneAlishaSession.__ptr_;
  if (!ptr)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerCarKeySession.mm"), 1199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_standaloneAlishaSession"));

    ptr = self->_standaloneAlishaSession.__ptr_;
  }
  sub_1002B34FC((uint64_t)ptr, llround(3000000.0), (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    sub_100301BCC(*(int *)buf, __p);
    if (v16 >= 0)
      v7 = __p;
    else
      v7 = (void **)__p[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to run standalone session. Error: %s"), v7));
    if (v16 < 0)
      operator delete(__p[0]);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E1F78();
    v18 = NSLocalizedDescriptionKey;
    v19 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v9));

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_runOwnerSession
{
  NSObject *v3;
  AlishaManager *ptr;
  int v5;
  uint8_t *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[8];
  char v12;
  NSErrorUserInfoKey v13;
  void *v14;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,run owner session", buf, 2u);
  }
  ptr = self->_alishaManager.__ptr_;
  if (!ptr)
    sub_1003E2198();
  v5 = sub_100306C24((uint64_t)ptr);
  if (v5)
  {
    sub_100301BCC(v5, buf);
    if (v12 >= 0)
      v6 = buf;
    else
      v6 = *(uint8_t **)buf;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to run NI CarKey owner session. Error: %s"), v6));
    if (v12 < 0)
      operator delete(*(void **)buf);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E21C0();
    v13 = NSLocalizedDescriptionKey;
    v14 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v8));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_runPassthroughSession
{
  NSObject *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  NSObject *v10;
  int v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t val;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  int v34[5];
  NSErrorUserInfoKey v35;
  void *v36;
  _BYTE buf[12];
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  NSErrorUserInfoKey v42;
  const __CFString *v43;
  NSErrorUserInfoKey v44;
  void *v45;

  if ((os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.nearbyd"), "UTF8String")) & 1) == 0)
    return (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_runPassthroughSession", buf, 2u);
  }
  if (!self->_standaloneAlishaSession.__ptr_)
    sub_1003E2220();
  if (!self->_passthroughParams.passthroughUwbSessionId.__engaged_)
    sub_1003E2248();
  sub_1002B2008(self->_passthroughParams.passthroughUwbSessionId.var0.__val_, (uint64_t)v34);
  if (v34[0])
  {
    sub_100301BCC(v34[0], buf);
    if (v40 >= 0)
      v4 = buf;
    else
      v4 = *(_BYTE **)buf;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get key for passthrough session. Error: %s"), v4));
    if (SHIBYTE(v40) < 0)
      operator delete(*(void **)buf);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E1854();
    v44 = NSLocalizedDescriptionKey;
    v45 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v6));

    return v7;
  }
  v9 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-carkey,GetKey operation succeeded. Proceeding.", buf, 2u);
  }
  if (self->_passthroughParams.bypassBluetoothTimesync)
  {
    v10 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-carkey,DCK time sync bypass", buf, 2u);
    }
    sub_1002B34FC((uint64_t)self->_standaloneAlishaSession.__ptr_, llround(dbl_100474210[!self->_passthroughParams.anchorSimulation]), (uint64_t)buf);
    v11 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
LABEL_22:
      sub_100301BCC(v11, buf);
      if (v40 >= 0)
        v12 = buf;
      else
        v12 = *(_BYTE **)buf;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to start Alisha standalone ranging session. Error: %s"), v12));
      if (SHIBYTE(v40) < 0)
        operator delete(*(void **)buf);
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E2358();
      v35 = NSLocalizedDescriptionKey;
      v36 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v14));

      return v15;
    }
    goto LABEL_46;
  }
  if (!self->_passthroughParams.dckTimeSyncBtEvent.__engaged_)
    sub_1003E2270();
  if (!self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.__engaged_)
    sub_1003E2298();
  if (!self->_passthroughParams.passthroughUwbTime0.__engaged_)
    sub_1003E22C0();
  v16 = sub_1002596C8((uint64_t)&self->_passthroughParams.dckTimeSyncBtEvent, self->_passthroughParams.passthroughUwbTime0.__engaged_);
  if (!self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.__engaged_)
    sub_10000BA44();
  if (!self->_passthroughParams.passthroughUwbTime0.__engaged_)
    sub_10000BA44();
  val = self->_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.var0.__val_;
  v18 = self->_passthroughParams.passthroughUwbTime0.var0.__val_;
  if (v18 >= val)
  {
    v29 = v16;
    v30 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v29;
      v38 = 2048;
      v39 = val;
      v40 = 2048;
      v41 = v18;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ses-carkey,DCK time sync BT event = %lluus, DCK time sync UWB device time = %lluus, UWB Time 0 = %lluus", buf, 0x20u);
    }
    v31 = v18 - val + v29;
    if (self->_passthroughParams.anchorSimulation)
    {
      v32 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = 20000;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Anchor simulation start time leeway of %lluus", buf, 0xCu);
      }
      v31 -= 20000;
    }
    v11 = sub_1002B410C((uint64_t)self->_standaloneAlishaSession.__ptr_, v31);
    if (v11)
      goto LABEL_22;
LABEL_46:
    v33 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Range enable succeeded.", buf, 2u);
    }
    return 0;
  }
  v19 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E22E8(v19, v20, v21, v22, v23, v24, v25, v26);
  v42 = NSLocalizedDescriptionKey;
  v43 = CFSTR("UWB Time 0 must be greater than UWB Device Time from the DCK time sync event.");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v27));

  return v28;
}

- (id)_pausePassthroughOrLabTestModeSession
{
  NSObject *v3;
  AlishaSession *ptr;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  void *__p[2];
  char v11;
  uint8_t buf[4];
  void *v13;
  void *v14;
  char v15;
  NSErrorUserInfoKey v16;
  void *v17;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,_pausePassthroughOrLabTestModeSession", buf, 2u);
  }
  ptr = self->_standaloneAlishaSession.__ptr_;
  if (!ptr)
    sub_1003E2408();
  sub_1002B3CBC((uint64_t)ptr, (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    sub_100301BCC(*(int *)buf, __p);
    if (v11 >= 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to stop Alisha standalone ranging session. Error: %s"), v5));
    if (v11 < 0)
      operator delete(__p[0]);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E1854();
    v16 = NSLocalizedDescriptionKey;
    v17 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v7));

  }
  else
  {
    v8 = 0;
  }
  if (v15 && v13)
  {
    v14 = v13;
    operator delete(v13);
  }
  return v8;
}

- (id)_pauseOwnerSession
{
  NSObject *v3;
  AlishaManager *ptr;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *__p[2];
  char v12;
  uint8_t buf[4];
  void *v14[3];
  char v15;
  NSErrorUserInfoKey v16;
  void *v17;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-carkey,pause owner session", buf, 2u);
  }
  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    sub_100307288((uint64_t)ptr, buf);
    if (*(_DWORD *)buf)
    {
      sub_100301BCC(*(int *)buf, __p);
      if (v12 >= 0)
        v5 = __p;
      else
        v5 = (void **)__p[0];
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to stop ranging when pausing NI CarKey owner session. Error: %s"), v5));
      if (v12 < 0)
        operator delete(__p[0]);
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E21C0();
      v16 = NSLocalizedDescriptionKey;
      v17 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v7));

    }
    else
    {
      if (v15)
        -[NIServerCarKeySession _relayDCKMessageInternal:](self, "_relayDCKMessageInternal:", v14);
      v8 = 0;
    }
    if (v15)
    {
      if (v14[0])
      {
        v14[1] = v14[0];
        operator delete(v14[0]);
      }
    }
    return v8;
  }
  else
  {
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Pause but no Alisha manager. Returning.", buf, 2u);
    }
    return 0;
  }
}

+ (JobConfig)_aopJobConfigWithTimeouts
{
  unsigned __int16 v4;
  unsigned __int16 v5;
  unsigned __int16 v6;
  JobConfig *result;

  *(_QWORD *)&retstr->peerDiscoveryTimeoutSeconds = -1;
  retstr->timeoutRefirePeriodSeconds = -1;
  retstr->maxTimeoutRefires = 0;
  *(_QWORD *)(&retstr->maxTimeoutRefires + 1) = 0xFFFFFFFFLL;
  *(_WORD *)((char *)&retstr->subratingConfigs[0].var0.var0 + 3) = 0;
  retstr->optionsBitmap = 1;
  v4 = (unsigned __int16)sub_100259C6C(CFSTR("AlishaTimeoutAOverrideSeconds"), (id)0x3C);
  v5 = (unsigned __int16)sub_100259C6C(CFSTR("AlishaTimeoutBOverrideSeconds"), (id)0x96);
  v6 = (unsigned __int16)sub_100259C6C(CFSTR("AlishaTimeoutRefirePeriodOverrideSeconds"), (id)0x96);
  result = (JobConfig *)sub_100259C6C(CFSTR("AlishaMaxTimeoutRefiresOverride"), (id)2);
  retstr->peerDiscoveryTimeoutSeconds = v4;
  retstr->peerReacquisitionTimeoutSeconds = v4;
  retstr->trackingTimeoutSeconds = -1;
  retstr->jobTimeoutSeconds = v5;
  retstr->timeoutRefirePeriodSeconds = v6;
  retstr->maxTimeoutRefires = result;
  *(_WORD *)(&retstr->maxTimeoutRefires + 1) = -1;
  return result;
}

- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  unsigned __int8 v18;
  RequestConstructionDebugParams *result;
  const char *v20;
  int v21;
  int v22;
  id v23;

  v6 = a4;
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Debug params for owner device service request. Debug options: %@", (uint8_t *)&v22, 0xCu);
  }
  if (self->_passthroughParams.isPassthroughSession)
  {
    v20 = "!_passthroughParams.isPassthroughSession";
    v21 = 1392;
    goto LABEL_12;
  }
  if (self->_passthroughParams.anchorSimulation)
  {
    v20 = "!_passthroughParams.anchorSimulation";
    v21 = 1393;
LABEL_12:
    __assert_rtn("-[NIServerCarKeySession _ownerDeviceServiceRequestDebugParams:]", "NIServerCarKeySession.mm", v21, v20);
  }
  retstr->var3.__engaged_ = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var4.__engaged_ = 0;
  retstr->var11 = 0;
  *(_QWORD *)&retstr->var5 = 0;
  retstr->var10 = 0;
  *(_DWORD *)&retstr->var0 = 0;
  retstr->var3.var0.__null_state_ = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DebugSTSIndex0")));
  if (!v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AnchorHopKey"))),
        v10 = v9 == 0,
        v9,
        v8,
        v10))
  {
    retstr->var2 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DebugSTSIndex0")));
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AnchorHopKey")));
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    retstr->var2 = 1;
    retstr->var3.__engaged_ = 1;
    retstr->var3.var0.__val_ = v12;
    retstr->var4.__engaged_ = 1;
    retstr->var4.var0.__val_ = v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DisableUWBEncryption")));
  v16 = objc_msgSend(v15, "BOOLValue");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DisableSecureToF")));
  v18 = objc_msgSend(v17, "BOOLValue");

  retstr->var9 = v16;
  retstr->var10 = v18;
  retstr->var11 = 5;

  return result;
}

- (void)_relayDCKMessageInternal:(const void *)a3
{
  void *v4;
  NSObject *v5;
  NIServerSessionResourceManager *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", *(_QWORD *)a3, *((_QWORD *)a3 + 1) - *(_QWORD *)a3));
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Relaying DCK message: %@", buf, 0xCu);
  }
  v9.receiver = self;
  v9.super_class = (Class)NIServerCarKeySession;
  v6 = -[NIServerBaseSession resourcesManager](&v9, "resourcesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remote"));
  objc_msgSend(v8, "relayDCKMessage:", v4);

}

- (Result<rose::RoseServiceRequest>)_passthroughSessionServiceRequest:(SEL)a3
{
  id v6;
  NSObject *v7;
  _BOOL4 anchorSimulation;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *j;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  unsigned __int8 v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int16 v47;
  void *v48;
  Result<rose::RoseServiceRequest> *result;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  id v54;
  uint64_t v55;
  void *k;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  unsigned __int8 v62;
  void *v63;
  unsigned __int8 v64;
  void *v65;
  unsigned __int8 v66;
  __int16 v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  int v72;
  int v73;
  _BOOL4 v74;
  char v75;
  __int16 v76;
  unsigned __int8 v77;
  unsigned __int8 v78;
  unsigned __int8 v79;
  unsigned int v80;
  unsigned int v81;
  _BOOL4 v82;
  unsigned __int8 v83;
  unsigned __int8 v84;
  unsigned __int8 v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  unsigned __int8 v88;
  unsigned __int16 v89;
  unsigned __int16 v90;
  unsigned __int8 v91;
  unsigned int v92;
  AlishaPassthroughParameters *p_passthroughParams;
  _BYTE v94[25];
  unsigned int v95;
  unsigned __int8 v96;
  char v97;
  unsigned __int16 v98;
  unsigned __int16 v99;
  unsigned __int8 v100;
  unsigned __int8 v101;
  unsigned __int8 v102;
  unsigned __int8 v103;
  unsigned __int8 v104;
  unsigned __int8 v105;
  __int16 v106;
  char v107;
  BOOL v108;
  __int16 v109;
  char v110;
  unsigned int v111;
  char v112;
  unsigned int v113;
  char v114;
  char v115;
  __int16 v116;
  __int16 v117;
  __int16 v118;
  unsigned __int8 v119;
  unsigned __int8 v120;
  int v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint8_t buf[504];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];

  v6 = a4;
  if ((os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.nearbyd"), "UTF8String")) & 1) != 0)
  {
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      anchorSimulation = self->_passthroughParams.anchorSimulation;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = anchorSimulation;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Passthrough session service request. Anchor: %d. Debug options: %@", buf, 0x12u);
    }
    p_passthroughParams = &self->_passthroughParams;
    if (!self->_passthroughParams.isPassthroughSession)
      __assert_rtn("-[NIServerCarKeySession _passthroughSessionServiceRequest:]", "NIServerCarKeySession.mm", 1438, "_passthroughParams.isPassthroughSession");
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v9 = objc_msgSend(&off_10082BDA0, "countByEnumeratingWithState:objects:count:", &v130, v137, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v131;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v131 != v10)
            objc_enumerationMutation(&off_10082BDA0);
          v12 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12));
          if (!v14 || (v15 = objc_opt_class(NSNumber, v13), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing mandatory passthrough session key or not an NSNumber: {%@: %@}"), v12, v14));
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
              sub_1003E1854();
            retstr->var0 = -1014;
            retstr->var1.var0.__null_state_ = 0;
            retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

            goto LABEL_37;
          }

        }
        v9 = objc_msgSend(&off_10082BDA0, "countByEnumeratingWithState:objects:count:", &v130, v137, 16);
        if (v9)
          continue;
        break;
      }
    }
    if (p_passthroughParams->anchorSimulation)
    {
      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      v16 = objc_msgSend(&off_10082BDB8, "countByEnumeratingWithState:objects:count:", &v126, v136, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v127;
        while (2)
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(_QWORD *)v127 != v17)
              objc_enumerationMutation(&off_10082BDB8);
            v19 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * (_QWORD)j);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v19));
            if (!v21
              || (v22 = objc_opt_class(NSNumber, v20), (objc_opt_isKindOfClass(v21, v22) & 1) == 0))
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing mandatory anchor simulation key or not an NSNumber: {%@: %@}"), v19, v21));
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                sub_1003E1854();
              retstr->var0 = -1015;
              retstr->var1.var0.__null_state_ = 0;
              retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

              goto LABEL_37;
            }

          }
          v16 = objc_msgSend(&off_10082BDB8, "countByEnumeratingWithState:objects:count:", &v126, v136, 16);
          if (v16)
            continue;
          break;
        }
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UWBSessionId")));
    v92 = objc_msgSend(v23, "unsignedIntegerValue");

    p_passthroughParams->passthroughUwbSessionId.var0.__val_ = v92;
    p_passthroughParams->passthroughUwbSessionId.__engaged_ = 1;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RFChannel")));
    v91 = objc_msgSend(v24, "unsignedIntegerValue");

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SyncCodeIndex")));
    v26 = objc_msgSend(v25, "unsignedIntegerValue");

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AlishaProtocolVersion")));
    v90 = (unsigned __int16)objc_msgSend(v27, "unsignedIntegerValue");

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UWBConfigId")));
    v89 = (unsigned __int16)objc_msgSend(v28, "unsignedIntegerValue");

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SessionRANMultiplier")));
    v88 = objc_msgSend(v29, "unsignedIntegerValue");

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ChapsPerSlot")));
    v87 = objc_msgSend(v30, "unsignedIntegerValue");

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SlotsPerRound")));
    v86 = objc_msgSend(v31, "unsignedIntegerValue");

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NumResponderNodes")));
    v85 = objc_msgSend(v32, "unsignedIntegerValue");

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HopConfigBitmask")));
    v84 = objc_msgSend(v33, "unsignedIntegerValue");

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PulseShapeCombo")));
    v83 = objc_msgSend(v34, "unsignedIntegerValue");

    if (((_BYTE)v26 - 9) >= 4u)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid Sync Code Index: %lu"), v26));
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E1854();
      retstr->var0 = -1016;
      retstr->var1.var0.__null_state_ = 0;
      retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

    }
    else
    {
      v75 = (_BYTE)v26 - 9;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ACWGMacMode")));

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ACWGMacMode")));
      v37 = objc_msgSend(v36, "unsignedIntValue");

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ACWGMacMode")));
      v39 = objc_msgSend(v38, "unsignedIntValue");
      v74 = (v37 & 0xFFFFFFC0) == 64;
      v82 = v35 != 0;

      if (v35)
        v40 = (v39 & 0x3F) << 8;
      else
        v40 = 0;
      if (v35)
        v41 = 0x10000;
      else
        v41 = 0;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DebugSTSIndex0")));
      v72 = v41;
      v73 = v40;
      v81 = objc_msgSend(v42, "unsignedIntegerValue");

      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AnchorHopKey")));
      v80 = objc_msgSend(v43, "unsignedIntegerValue");

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DisableUWBEncryption")));
      v79 = objc_msgSend(v44, "BOOLValue");

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DisableSecureToF")));
      v78 = objc_msgSend(v45, "BOOLValue");

      if (p_passthroughParams->anchorSimulation)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AnchorResponderIndex")));
        v77 = objc_msgSend(v46, "unsignedIntegerValue");

        v47 = 1;
      }
      else
      {
        v77 = 0;
        v47 = 0;
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ForceAntennaSelection")));
      v76 = v47;
      v53 = objc_msgSend(v52, "BOOLValue");

      if (v53)
      {
        v125 = 0u;
        v123 = 0u;
        v124 = 0u;
        v122 = 0u;
        v54 = objc_msgSend(&off_10082BDD0, "countByEnumeratingWithState:objects:count:", &v122, v135, 16);
        if (v54)
        {
          v55 = *(_QWORD *)v123;
          while (2)
          {
            for (k = 0; k != v54; k = (char *)k + 1)
            {
              if (*(_QWORD *)v123 != v55)
                objc_enumerationMutation(&off_10082BDD0);
              v57 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)k);
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v57));
              if (!v59
                || (v60 = objc_opt_class(NSNumber, v58), (objc_opt_isKindOfClass(v59, v60) & 1) == 0))
              {
                v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing mandatory antenna mask key or not an NSNumber: {%@: %@}"), v57, v59));
                if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                  sub_1003E1854();
                retstr->var0 = -1015;
                retstr->var1.var0.__null_state_ = 0;
                retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

                goto LABEL_37;
              }

            }
            v54 = objc_msgSend(&off_10082BDD0, "countByEnumeratingWithState:objects:count:", &v122, v135, 16);
            if (v54)
              continue;
            break;
          }
        }
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TxAntennaMask")));
        v62 = objc_msgSend(v61, "unsignedIntValue");

        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RxAntennaMask")));
        v64 = objc_msgSend(v63, "unsignedIntValue");

        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RxSyncSearchAntennaMask")));
        v66 = objc_msgSend(v65, "unsignedIntValue");

        v67 = 1;
      }
      else
      {
        v67 = 0;
        v62 = 0;
        v64 = 0;
        v66 = 0;
      }
      v108 = p_passthroughParams->anchorSimulation;
      v109 = v77 | (unsigned __int16)(v76 << 8);
      v110 = 1;
      v111 = v81;
      v112 = 1;
      v113 = v80;
      v114 = 1;
      v115 = v53;
      v116 = v62 | ((v67 & 1) << 8);
      v117 = v64 | ((v67 & 1) << 8);
      v118 = v66 | (unsigned __int16)(v67 << 8);
      v119 = v79;
      v120 = v78;
      v121 = 5;
      if (!p_passthroughParams->bypassBluetoothTimesync)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UWBTime0")));
        if (!v68)
          __assert_rtn("-[NIServerCarKeySession _passthroughSessionServiceRequest:]", "NIServerCarKeySession.mm", 1573, "debugOptions[@\"UWBTime0\"] != nil");

        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UWBTime0")));
        v70 = objc_msgSend(v69, "unsignedLongLongValue");

        p_passthroughParams->passthroughUwbTime0.var0.__val_ = (unint64_t)v70;
        p_passthroughParams->passthroughUwbTime0.__engaged_ = 1;
      }
      v95 = v92;
      v96 = v91;
      v97 = v75;
      v98 = v90;
      v99 = v89;
      v100 = v88;
      v101 = v87;
      v102 = v86;
      v103 = v85;
      v104 = v84;
      v105 = v83;
      v106 = v72 | v73 | (v82 && v74);
      v107 = (v72 | v73 | v82 & v74) >> 16;
      +[NIServerCarKeySession _aopJobConfigWithTimeouts](NIServerCarKeySession, "_aopJobConfigWithTimeouts");
      sub_100164520((int *)&v95, 102, (uint64_t)v94, (unsigned __int8 *)&v108, (uint64_t)buf);
      memcpy(&retstr->var1, buf, 0x1F8uLL);
      retstr->var0 = 0;
      retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
    }
  }
  else
  {
    retstr->var0 = -1000;
    retstr->var1.var0.__null_state_ = 0;
    retstr->var1.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }
LABEL_37:

  return result;
}

- (void)_alishaStateChangedFromState:(unsigned __int8)a3 toNewState:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;
  NSObject *v7;
  int v8;
  void **v9;
  void **v10;
  void **v11;
  NSString *containerUniqueIdentifier;
  CarKeyTimeoutManager *ptr;
  int v14;
  NIServerSessionResourceManager *v15;
  void *v16;
  void *v17;
  objc_super v18;
  void *__p[2];
  char v20;
  void *v21[2];
  char v22;
  uint8_t buf[4];
  void **v24;
  __int16 v25;
  void **v26;
  __int16 v27;
  NSString *v28;

  v4 = a4;
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_100302388(v5, v21);
    v8 = v22;
    v9 = (void **)v21[0];
    sub_100302388(v4, __p);
    v10 = v21;
    if (v8 < 0)
      v10 = v9;
    if (v20 >= 0)
      v11 = __p;
    else
      v11 = (void **)__p[0];
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    v24 = v10;
    v25 = 2080;
    v26 = v11;
    v27 = 2112;
    v28 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-carkey,State changed from %s to %s, session container ID: %@", buf, 0x20u);
    if (v20 < 0)
      operator delete(__p[0]);
    if (v22 < 0)
      operator delete(v21[0]);
  }

  ptr = self->_timeoutManager.__ptr_;
  if (ptr)
    sub_1001DB770((uint64_t)ptr, v5, v4);
  v14 = sub_100304754(v5);
  if (((v14 ^ 1 | sub_100304754(v4)) & 1) == 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)NIServerCarKeySession;
    v15 = -[NIServerBaseSession resourcesManager](&v18, "resourcesManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remote"));
    objc_msgSend(v17, "didUpdateHealthStatus:", 4);

  }
}

- (void)_handleInitiatorRangingBlockUpdate:(InitiatorRangingBlockSummary *)a3
{
  NIServerCarKeyCertificationLogger *ptr;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  ptr = self->_certLogger.__ptr_;
  if (ptr)
    sub_100251410((uint64_t)ptr, &a3->var0);
}

- (void)_handleSessionStats:(SessionStats *)a3
{
  AnalyticsManager *ptr;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (a3->var1)
  {
    ptr = self->_analyticsManager.__ptr_;
    if (ptr)
      sub_1001A2210((uint64_t)ptr, (uint64_t)a3);
  }
}

- (void)_handleHealthChanged:(int)a3
{
  NSObject *v5;
  void **v6;
  NSString *containerUniqueIdentifier;
  NIServerSessionResourceManager *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  void *__p[2];
  char v14;
  uint8_t buf[4];
  void **v16;
  __int16 v17;
  NSString *v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000BF04(__p, (&off_100810828)[a3]);
    if (v14 >= 0)
      v6 = __p;
    else
      v6 = (void **)__p[0];
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315394;
    v16 = v6;
    v17 = 2112;
    v18 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Health changed to %s, session container ID: %@", buf, 0x16u);
    if (v14 < 0)
      operator delete(__p[0]);
  }

  v12.receiver = self;
  v12.super_class = (Class)NIServerCarKeySession;
  v8 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  switch(a3)
  {
    case 2:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remote"));
      objc_msgSend(v11, "didUpdateHealthStatus:", 3);
      goto LABEL_13;
    case 1:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remote"));
      objc_msgSend(v11, "didUpdateHealthStatus:", 2);
      goto LABEL_13;
    case 0:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remote"));
      objc_msgSend(v11, "didUpdateHealthStatus:", 1);
LABEL_13:

      break;
  }

}

- (void)_handleTimeoutEvent:(int)a3 time:(double)a4
{
  NSObject *v7;
  void **v8;
  NSString *containerUniqueIdentifier;
  AlishaManager *ptr;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NIServerSessionResourceManager *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_super v19;
  void *__p[2];
  char v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;
  uint8_t buf[4];
  _BYTE v25[20];
  NSString *v26;
  char v27;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000BF04(__p, (&off_100810840)[a3]);
    v8 = v21 >= 0 ? __p : (void **)__p[0];
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v25 = v8;
    *(_WORD *)&v25[8] = 2048;
    *(double *)&v25[10] = a4;
    *(_WORD *)&v25[18] = 2112;
    v26 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-carkey,Received timeout event %s at %f sec, session container ID: %@", buf, 0x20u);
    if (v21 < 0)
      operator delete(__p[0]);
  }

  ptr = self->_alishaManager.__ptr_;
  if (ptr)
  {
    sub_100307B38((uint64_t)ptr, a3, buf);
    v11 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
      v22 = NSLocalizedDescriptionKey;
      v23 = CFSTR("processing timeout events failed");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      if ((v11 + 1016) < 3)
        v13 = -5888;
      else
        v13 = -5887;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v13, v12));

      v19.receiver = self;
      v19.super_class = (Class)NIServerCarKeySession;
      v15 = -[NIServerBaseSession resourcesManager](&v19, "resourcesManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remote"));
      objc_msgSend(v17, "uwbSessionDidInvalidateWithError:", v14);

    }
    else if (v27)
    {
      -[NIServerCarKeySession _relayDCKMessageInternal:](self, "_relayDCKMessageInternal:", &v25[4]);
    }
    if (v27)
    {
      if (*(_QWORD *)&v25[4])
      {
        *(_QWORD *)&v25[12] = *(_QWORD *)&v25[4];
        operator delete(*(void **)&v25[4]);
      }
    }
  }
  else
  {
    v18 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#ses-carkey,No Alisha manager. Ignoring timeout event", buf, 2u);
    }
  }
}

- (NICarKeyConfiguration)configuration
{
  return (NICarKeyConfiguration *)objc_getProperty(self, a2, 424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  sub_10001AE68((uint64_t)&self->_powerBudgetProvider);
  sub_10001AE68((uint64_t)&self->_timeoutManager);
  sub_10001AE68((uint64_t)&self->_standaloneAlishaSession);
  sub_1001B06E0((uint64_t)&self->_cachedCapabilities);
  sub_10001AE68((uint64_t)&self->_certLogger);
  sub_10001AE68((uint64_t)&self->_analyticsManager);
  sub_10001AE68((uint64_t)&self->_paramNegotiator);
  sub_10001AE68((uint64_t)&self->_configProvider);
  sub_10001AE68((uint64_t)&self->_dckCoder);
  sub_10001AE68((uint64_t)&self->_alishaSystem);
  sub_10001AE68((uint64_t)&self->_alishaManager);
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  sub_10001AE68((uint64_t)&self->_pbLogger);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_BYTE *)self + 192) = 0;
  *((_BYTE *)self + 256) = 0;
  *((_QWORD *)self + 33) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_WORD *)self + 140) = 0;
  *((_BYTE *)self + 282) = 0;
  *((_BYTE *)self + 288) = 0;
  *((_BYTE *)self + 344) = 0;
  *((_BYTE *)self + 352) = 0;
  *((_BYTE *)self + 360) = 0;
  *((_BYTE *)self + 368) = 0;
  *((_BYTE *)self + 372) = 0;
  *((_BYTE *)self + 376) = 0;
  *((_BYTE *)self + 384) = 0;
  *((_QWORD *)self + 49) = 0;
  *((_QWORD *)self + 50) = 0;
  *((_QWORD *)self + 51) = 0;
  *((_QWORD *)self + 52) = 0;
  return self;
}

@end
