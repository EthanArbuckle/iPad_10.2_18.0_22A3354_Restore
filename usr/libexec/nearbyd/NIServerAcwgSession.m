@implementation NIServerAcwgSession

- (NIServerAcwgSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  id v38;

  v9 = a3;
  v10 = a4;
  v11 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D61DC(v11, v12, v13, v14, v15, v16, v17, v18);
  v19 = objc_opt_class(v10, v12);
  if (v19 != objc_opt_class(NIAcwgConfiguration, v20))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerAcwgSession.mm"), 331, CFSTR("NIServerAcwgSession given invalid configuration."));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));
  v22 = v21 == 0;

  if (v22)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerAcwgSession.mm"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager.serverSessionIdentifier"));

  }
  v23 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#ses-acwg,initWithResourcesManager. Configuration: %@", buf, 0xCu);
  }
  v36.receiver = self;
  v36.super_class = (Class)NIServerAcwgSession;
  v24 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v36, "initWithResourcesManager:configuration:error:", v9, v10, a5);
  if (v24)
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
    v26 = (void *)*((_QWORD *)v24 + 6);
    *((_QWORD *)v24 + 6) = v25;

    v27 = objc_msgSend(v10, "copy");
    v28 = (void *)*((_QWORD *)v24 + 42);
    *((_QWORD *)v24 + 42) = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "UUIDString"));
    v31 = (void *)*((_QWORD *)v24 + 7);
    *((_QWORD *)v24 + 7) = v30;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v24 + 6), "com.apple.nearbyd.acwg-session.queue-context-key", *((void **)v24 + 7), 0);
    v32 = v24;
  }

  return (NIServerAcwgSession *)v24;
}

- (id)lastConfiguration
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D624C(v3, v4, v5, v6, v7, v8, v9, v10);
  return self->_configuration;
}

- (void)invalidate
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  objc_super v13;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D62BC(v3, v4, v5, v6, v7, v8, v9, v10);
  *(_QWORD *)buf = 105;
  sub_1001B0728(&self->_suspendReasonStack.c.__map_.__first_, buf);
  v11 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-acwg,invalidate.", buf, 2u);
  }
  v12 = -[NIServerAcwgSession disableAllServices](self, "disableAllServices");
  v13.receiver = self;
  v13.super_class = (Class)NIServerAcwgSession;
  -[NIServerBaseSession invalidate](&v13, "invalidate");
}

- (id)disableAllServices
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  AcwgManager *ptr;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *v18;
  __shared_weak_count *cntrl;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  PRRangingManagerClient *v27;
  __shared_weak_count *v28;
  __int128 buf;
  objc_super v30;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D632C(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-acwg,disableAllServices.", (uint8_t *)&buf, 2u);
  }
  v30.receiver = self;
  v30.super_class = (Class)NIServerAcwgSession;
  v12 = -[NIServerBaseSession disableAllServices](&v30, "disableAllServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  ptr = self->_acwgManager.__ptr_;
  if (ptr)
  {
    sub_100304CAC(ptr);
    buf = 0uLL;
    sub_1000145E8((uint64_t)&self->_acwgManager, &buf);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
    if (*((_QWORD *)&buf + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  if (self->_uwbSystemListener.__ptr_)
  {
    v18 = sub_1002CA108();
    cntrl = self->_uwbSystemListener.__cntrl_;
    v27 = self->_uwbSystemListener.__ptr_;
    v28 = cntrl;
    if (cntrl)
    {
      v20 = (unint64_t *)((char *)cntrl + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    sub_1002CE3E0((uint64_t)v18, (unint64_t *)&v27);
    v22 = (std::__shared_weak_count *)v28;
    if (v28)
    {
      v23 = (unint64_t *)((char *)v28 + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    sub_100180AF4(&self->_uwbSystemListener.__ptr_);
  }
  v25 = sub_1002CA108();
  sub_1002CA350((uint64_t)v25, 2, self->_lockBtConnHandle);
  return v13;
}

- (void)dealloc
{
  shared_ptr<PRRangingManagerClient> *p_uwbSystemListener;
  void *v4;
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  objc_super v11;
  PRRangingManagerClient *ptr;
  std::__shared_weak_count *v13;

  p_uwbSystemListener = &self->_uwbSystemListener;
  if (self->_uwbSystemListener.__ptr_)
  {
    v4 = sub_1002CA108();
    cntrl = p_uwbSystemListener->__cntrl_;
    ptr = p_uwbSystemListener->__ptr_;
    v13 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      v6 = (unint64_t *)((char *)cntrl + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    sub_1002CE3E0((uint64_t)v4, (unint64_t *)&ptr);
    v8 = v13;
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    sub_100180AF4(p_uwbSystemListener);
  }
  v11.receiver = self;
  v11.super_class = (Class)NIServerAcwgSession;
  -[NIServerAcwgSession dealloc](&v11, "dealloc");
}

- (duration<long)nominalCycleRate
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D639C(v2, v3, v4, v5, v6, v7, v8, v9);
  return (duration<long long, std::ratio<1, 1000>>)3000;
}

- (unint64_t)requiresUWBToRun
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D640C(v2, v3, v4, v5, v6, v7, v8, v9);
  return 2;
}

- (BOOL)_validateLockAttributes
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  id v15;
  BOOL v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  int lockBtConnHandle;
  uint8_t v25[16];
  uint8_t buf[4];
  int v27;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D64D4(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration lockIdentifier](self->_configuration, "lockIdentifier"));
  v12 = v11 == 0;

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D647C();
    return 0;
  }
  else
  {
    v13 = objc_alloc((Class)NSUUID);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration lockIdentifier](self->_configuration, "lockIdentifier"));
    v15 = objc_msgSend(v13, "initWithUUIDString:", v14);

    v16 = v15 != 0;
    if (v15)
    {
      v17 = -[NIAcwgConfiguration lockBtConnHandle](self->_configuration, "lockBtConnHandle");
      self->_lockBtConnHandle = v17;
      if (v17 == 0xFFFF)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration lockIdentifier](self->_configuration, "lockIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "substringToIndex:", 2));

        *(_DWORD *)buf = 0;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v19));
        objc_msgSend(v20, "scanHexInt:", buf);

        self->_lockBtConnHandle = *(_WORD *)buf;
        v21 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-acwg,lockBtConnHandle not valid... extracting it from lockIdentifier", v25, 2u);
        }

      }
      v22 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        lockBtConnHandle = self->_lockBtConnHandle;
        *(_DWORD *)buf = 67109120;
        v27 = lockBtConnHandle;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ses-acwg,lockBtConnHandle = 0x%04x", buf, 8u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003D64A8();
    }

  }
  return v16;
}

- (id)configure
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NIServerAcwgSession *v11;
  shared_ptr<rose::objects::AlishaSubsystem> *p_alishaSystem;
  _QWORD *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  __shared_weak_count *cntrl;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  void *v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_weak_owners;
  unint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  void *p_p;
  const char *v53;
  int v54;
  void *__p;
  char v56;
  uint8_t buf[72];
  char v58;
  PRRangingManagerClient *v59;
  std::__shared_weak_count *v60;
  PRRangingManagerClient *ptr;
  std::__shared_weak_count *v62;
  NIServerAcwgSession *v63;
  NSErrorUserInfoKey v64;
  const __CFString *v65;
  uint8_t v66[4];
  void *v67;
  NSErrorUserInfoKey v68;
  const __CFString *v69;

  v63 = self;
  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D664C(v2, v3, v4, v5, v6, v7, v8, v9);
  dispatch_assert_queue_V2((dispatch_queue_t)v63->_clientQueue);
  if (!v63->_configuration)
    sub_1003D6544();
  v10 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-acwg,configure", buf, 2u);
  }
  if (-[NIServerAcwgSession _validateLockAttributes](v63, "_validateLockAttributes"))
  {
    v11 = v63;
    p_alishaSystem = &v63->_alishaSystem;
    if (!v63->_alishaSystem.__ptr_)
    {
      v13 = operator new(0x20uLL);
      v13[1] = 0;
      v13[2] = 0;
      *v13 = off_10080B7A8;
      v13[3] = off_100812B30;
      *(_QWORD *)buf = v13 + 3;
      *(_QWORD *)&buf[8] = v13;
      sub_1000145E8((uint64_t)p_alishaSystem, (__int128 *)buf);
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
      v11 = v63;
    }
    if (!v11->_uwbSystemListener.__ptr_)
    {
      sub_1001B0B10(&v63, buf);
      sub_1000145E8((uint64_t)&v63->_uwbSystemListener, (__int128 *)buf);
      v17 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v18 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      v20 = sub_1002CA108();
      ptr = v63->_uwbSystemListener.__ptr_;
      cntrl = v63->_uwbSystemListener.__cntrl_;
      v62 = (std::__shared_weak_count *)cntrl;
      if (cntrl)
      {
        v22 = (unint64_t *)((char *)cntrl + 8);
        do
          v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }
      sub_1002CE308((uint64_t)v20, (unint64_t *)&ptr);
      v24 = v62;
      if (v62)
      {
        p_shared_owners = (unint64_t *)&v62->__shared_owners_;
        do
          v26 = __ldaxr(p_shared_owners);
        while (__stlxr(v26 - 1, p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      v27 = sub_1002CA108();
      v59 = v63->_uwbSystemListener.__ptr_;
      v28 = (std::__shared_weak_count *)v63->_uwbSystemListener.__cntrl_;
      v60 = v28;
      if (v28)
      {
        p_shared_weak_owners = (unint64_t *)&v28->__shared_weak_owners_;
        do
          v30 = __ldxr(p_shared_weak_owners);
        while (__stxr(v30 + 1, p_shared_weak_owners));
      }
      sub_1002CA79C((uint64_t)v27, (uint64_t *)&v59);
      if (v60)
        std::__shared_weak_count::__release_weak(v60);
    }
    sub_1002B24C0((uint64_t)buf);
    if (*(_DWORD *)buf)
    {
      v31 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D656C(v31, v32, v33, v34, v35, v36, v37, v38);
      v64 = NSLocalizedDescriptionKey;
      v65 = CFSTR("Failed to query device capabilities.");
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v39));

      goto LABEL_50;
    }
    if (v58)
    {
      v50 = (id)qword_10085F520;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        if (!v58)
          sub_10000BA44();
        sub_1002FED5C((uint64_t *)&buf[8]);
        if (v56 >= 0)
          p_p = &__p;
        else
          p_p = __p;
        *(_DWORD *)v66 = 136315138;
        v67 = p_p;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Acwg Capabilities: %s", v66, 0xCu);
        if (v56 < 0)
          operator delete(__p);
      }

      sub_1001B03FC((uint64_t)&v63->_cachedCapabilities, (uint64_t)&buf[8]);
      if ((id)-[NIAcwgConfiguration configurationType](v63->_configuration, "configurationType") == (id)1)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerAcwgSession _configureForOwnerDevice](v63, "_configureForOwnerDevice"));
LABEL_50:
        sub_1001B06E0((uint64_t)&buf[8]);
        return v40;
      }
      v53 = "_configuration.configurationType == _NIAcwgConfigurationTypeOwner";
      v54 = 497;
    }
    else
    {
      v53 = "response.payload.has_value()";
      v54 = 485;
    }
    __assert_rtn("-[NIServerAcwgSession configure]", "NIServerAcwgSession.mm", v54, v53);
  }
  v41 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D65DC(v41, v42, v43, v44, v45, v46, v47, v48);
  v68 = NSLocalizedDescriptionKey;
  v69 = CFSTR("Lock identifier nil or invalid.");
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v49));

  return v40;
}

- (id)run
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  AcwgManager *ptr;
  int v13;
  _BYTE *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  NSErrorUserInfoKey v21;
  void *v22;
  _BYTE buf[12];
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6748(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-acwg,run owner session", buf, 2u);
  }
  ptr = self->_acwgManager.__ptr_;
  if (!ptr)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D66BC();
    v20 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      v24 = 1024;
      v25 = 506;
      v26 = 2080;
      v27 = "-[NIServerAcwgSession run]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  v13 = sub_100304EB4((uint64_t)ptr);
  if (v13)
  {
    sub_100301BCC(v13, buf);
    if (SBYTE3(v27) >= 0)
      v14 = buf;
    else
      v14 = *(_BYTE **)buf;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to run NI Acwg owner session (%s)"), v14));
    if (SBYTE3(v27) < 0)
      operator delete(*(void **)buf);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D66E8();
    v21 = NSLocalizedDescriptionKey;
    v22 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v16));

  }
  else
  {
    v18 = sub_1002CA108();
    sub_1002CA350((uint64_t)v18, 1, self->_lockBtConnHandle);
    v17 = 0;
  }
  return v17;
}

- (id)pauseWithSource:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  int v19;
  _BYTE *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  NSErrorUserInfoKey v28;
  void *v29;
  _BYTE buf[12];
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6810(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (id)qword_10085F520;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = sub_10028F3DC(a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,pause owner session: %@", buf, 0xCu);

  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D67B8();
    return 0;
  }
  v27 = 0;
  switch(a3)
  {
    case 1:
      v17 = 107;
      goto LABEL_18;
    case 2:
      v17 = 104;
LABEL_18:
      v27 = v17;
      break;
    case 0:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D67E4();
      v16 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        v31 = 1024;
        v32 = 541;
        v33 = 2080;
        v34 = "-[NIServerAcwgSession pauseWithSource:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
  }
  sub_1001B0728(&self->_suspendReasonStack.c.__map_.__first_, &v27);
  v18 = sub_1003054BC((uint64_t)self->_acwgManager.__ptr_);
  v19 = v18;
  if (!v18)
    return 0;
  sub_100305C4C(v18, buf);
  if (SBYTE3(v34) >= 0)
    v20 = buf;
  else
    v20 = *(_BYTE **)buf;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to stop ranging when pausing NI ACWG session (%s)"), v20, v27));
  if (SBYTE3(v34) < 0)
    operator delete(*(void **)buf);
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D66E8();
  v28 = NSLocalizedDescriptionKey;
  v29 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  v23 = (v19 + 103);
  if (v23 >= 4)
    v24 = -5887;
  else
    v24 = v23 - 19703;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v24, v22));

  return v25;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  stack<NIAcwgSessionTriggerReason, std::deque<NIAcwgSessionTriggerReason>> *p_sessionReasonStack;
  AcwgManager *ptr;
  NIServerSessionResourceManager *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t value;
  NSObject *v33;
  NSObject *v34;
  objc_super v35;
  int v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  uint64_t v40;
  NSErrorUserInfoKey v41;
  void *v42;
  uint8_t buf[32];
  __int128 v44;
  uint64_t v45;

  v6 = a3;
  v40 = a4;
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D68D8(v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = (id)qword_10085F520;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NIAcwgSessionTriggerReasonToString(v40);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processAcwgM1Msg:%@ triggerReason:%@", buf, 0x16u);

  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D6880();
    v33 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 571;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[NIServerAcwgSession processAcwgM1Msg:withSessionTriggerReason:]";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  p_sessionReasonStack = &self->_sessionReasonStack;
  sub_1001B0BBC(&self->_sessionReasonStack.c.__map_.__first_, &v40);
  ptr = self->_acwgManager.__ptr_;
  if (v6)
  {
    objc_msgSend(v6, "toStruct");
  }
  else
  {
    v45 = 0;
    v44 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  sub_100305650((uint64_t)ptr, (uint64_t)buf, (uint64_t)&v36);
  if (*(_QWORD *)&buf[24])
  {
    *(_QWORD *)&v44 = *(_QWORD *)&buf[24];
    operator delete(*(void **)&buf[24]);
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  v35.receiver = self;
  v35.super_class = (Class)NIServerAcwgSession;
  v20 = -[NIServerBaseSession resourcesManager](&v35, "resourcesManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = v36;
  if (v36 || !v39)
  {
    sub_100305C4C(v36, buf);
    if ((buf[23] & 0x80u) == 0)
      v26 = buf;
    else
      v26 = *(uint8_t **)buf;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("process M1 msg failed (%s)"), v26));
    if ((char)buf[23] < 0)
      operator delete(*(void **)buf);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D66E8();
    v41 = NSLocalizedDescriptionKey;
    v42 = v23;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    v28 = (v22 + 103);
    if (v28 >= 4)
      v29 = -5887;
    else
      v29 = v28 - 19703;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v29, v27));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "remote"));
    objc_msgSend(v31, "didProcessAcwgM1MsgWithResponse:error:", 0, v30);

    value = p_sessionReasonStack->c.__size_.__value_;
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D68AC();
      v34 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 598;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "-[NIServerAcwgSession processAcwgM1Msg:withSessionTriggerReason:]";
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    p_sessionReasonStack->c.__size_.__value_ = value - 1;
    sub_1001B0F54(p_sessionReasonStack, 1);

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NIAcwgM2Msg fromStruct:](NIAcwgM2Msg, "fromStruct:", v37, v38));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "remote"));
    objc_msgSend(v24, "didProcessAcwgM1MsgWithResponse:error:", v23, 0);

    v25 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG M1 processing succeeded and generated M2: %@", buf, 0xCu);
    }
  }

}

- (void)processAcwgM3Msg:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NIServerSessionResourceManager *v14;
  void *v15;
  AcwgManager *ptr;
  int v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BYTE *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t value;
  NSObject *v29;
  __int128 v30;
  uint64_t v31;
  objc_super v32;
  NSErrorUserInfoKey v33;
  void *v34;
  _BYTE v35[12];
  char v36;
  uint8_t buf[4];
  _BYTE v38[28];
  char v39;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6974(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processAcwgM3Msg:%@", buf, 0xCu);
  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D6948();
    v29 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v38 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = 609;
      *(_WORD *)&v38[14] = 2080;
      *(_QWORD *)&v38[16] = "-[NIServerAcwgSession processAcwgM3Msg:]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  v32.receiver = self;
  v32.super_class = (Class)NIServerAcwgSession;
  v14 = -[NIServerBaseSession resourcesManager](&v32, "resourcesManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  ptr = self->_acwgManager.__ptr_;
  *(_QWORD *)v35 = objc_msgSend(v4, "toStruct");
  *(_DWORD *)&v35[8] = v17;
  sub_100305834((uint64_t)ptr, (uint64_t)v35, (uint64_t)buf);
  v18 = *(_DWORD *)buf;
  if (*(_DWORD *)buf || !v39)
  {
    sub_100305C4C(*(int *)buf, v35);
    if (v36 >= 0)
      v22 = v35;
    else
      v22 = *(_BYTE **)v35;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("process M3 failed (%s)"), v22));
    if (v36 < 0)
      operator delete(*(void **)v35);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D66E8();
    v33 = NSLocalizedDescriptionKey;
    v34 = v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v24 = (v18 + 103);
    if (v24 >= 4)
      v25 = -5887;
    else
      v25 = v24 - 19703;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v25, v23));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remote"));
    objc_msgSend(v27, "didProcessAcwgM3MsgWithResponse:error:", 0, v26);

    value = self->_sessionReasonStack.c.__size_.__value_;
    if (value)
    {
      self->_sessionReasonStack.c.__size_.__value_ = value - 1;
      sub_1001B0F54(&self->_sessionReasonStack.c.__map_.__first_, 1);
    }

  }
  else
  {
    v30 = *(_OWORD *)&v38[4];
    v31 = *(_QWORD *)&v38[20];
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NIAcwgM4Msg fromStruct:](NIAcwgM4Msg, "fromStruct:", &v30));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remote"));
    objc_msgSend(v20, "didProcessAcwgM3MsgWithResponse:error:", v19, 0);

    v21 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v35 = 138412290;
      *(_QWORD *)&v35[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG M3 processing succeeded and generated M4: %@", v35, 0xCu);
    }
  }

}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  int v18;
  NIServerSessionResourceManager *v19;
  void *v20;
  _BYTE *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  objc_super v30;
  uint64_t v31;
  NSErrorUserInfoKey v32;
  void *v33;
  _BYTE buf[18];
  __int16 v35;
  const char *v36;

  v31 = a4;
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6A3C(v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = (id)qword_10085F520;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NIAcwgSuspendTriggerReasonToString(v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a3;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-acwg,suspendAcwgRanging:%u triggerReason:%@", buf, 0x12u);

  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D69E4();
    v29 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 648;
      v35 = 2080;
      v36 = "-[NIServerAcwgSession suspendAcwgRanging:withSuspendTriggerReason:]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  sub_1001B0728(&self->_suspendReasonStack.c.__map_.__first_, &v31);
  if ((unint64_t)(v31 - 100) <= 7)
  {
    if (((1 << (v31 - 100)) & 0x8F) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D6A10();
      v17 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 657;
        v35 = 2080;
        v36 = "-[NIServerAcwgSession suspendAcwgRanging:withSuspendTriggerReason:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    goto LABEL_14;
  }
  if ((unint64_t)(v31 - 200) < 2)
  {
LABEL_14:
    v18 = sub_1003054BC((uint64_t)self->_acwgManager.__ptr_);
    goto LABEL_15;
  }
  v18 = -100;
LABEL_15:
  v30.receiver = self;
  v30.super_class = (Class)NIServerAcwgSession;
  v19 = -[NIServerBaseSession resourcesManager](&v30, "resourcesManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (v18)
  {
    sub_100305C4C(v18, buf);
    if (SBYTE3(v36) >= 0)
      v21 = buf;
    else
      v21 = *(_BYTE **)buf;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Supending ACWG Ranging failed (%s)"), v21));
    if (SBYTE3(v36) < 0)
      operator delete(*(void **)buf);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D66E8();
    v32 = NSLocalizedDescriptionKey;
    v33 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v24 = (v18 + 103);
    if (v24 >= 4)
      v25 = -5887;
    else
      v25 = v24 - 19703;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v25, v23));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "remote"));
    objc_msgSend(v27, "uwbSessionDidFailWithError:", v26);

  }
  else
  {
    v28 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG suspend processing succeeded", buf, 2u);
    }
  }

}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  stack<NIAcwgSessionTriggerReason, std::deque<NIAcwgSessionTriggerReason>> *p_sessionReasonStack;
  int v19;
  NIServerSessionResourceManager *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BYTE *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t value;
  NSObject *v32;
  NSObject *v33;
  objc_super v34;
  _BYTE v35[12];
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  NSErrorUserInfoKey v40;
  void *v41;
  _BYTE buf[28];

  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6B04(v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = (id)qword_10085F520;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NIAcwgSessionTriggerReasonToString(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a3;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processAcwgRangingSessionResumeRequestMsg:%u triggerReason:%@", buf, 0x12u);

  }
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D6AAC();
    v32 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 706;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[NIServerAcwgSession processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:]";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  p_sessionReasonStack = &self->_sessionReasonStack;
  *(_QWORD *)buf = a4;
  sub_1001B0BBC(&self->_sessionReasonStack.c.__map_.__first_, buf);
  sub_100305910((uint64_t)self->_acwgManager.__ptr_, a3, (uint64_t)buf);
  v19 = *(_DWORD *)buf;
  v34.receiver = self;
  v34.super_class = (Class)NIServerAcwgSession;
  v20 = -[NIServerBaseSession resourcesManager](&v34, "resourcesManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (v19 || !buf[24])
  {
    sub_100305C4C(v19, v35);
    if (SBYTE3(v39) >= 0)
      v25 = v35;
    else
      v25 = *(_BYTE **)v35;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ACWG Resume failed (%s)"), v25));
    if (SBYTE3(v39) < 0)
      operator delete(*(void **)v35);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D66E8();
    v40 = NSLocalizedDescriptionKey;
    v41 = v22;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v27 = (v19 + 103);
    if (v27 >= 4)
      v28 = -5887;
    else
      v28 = v27 - 19703;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v28, v26));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "remote"));
    objc_msgSend(v30, "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:", 0, v29);

    value = p_sessionReasonStack->c.__size_.__value_;
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D6AD8();
      v33 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v35 = 136315650;
        *(_QWORD *)&v35[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/N"
                             "IServerAcwgSession.mm";
        v36 = 1024;
        v37 = 734;
        v38 = 2080;
        v39 = "-[NIServerAcwgSession processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:]";
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", v35, 0x1Cu);
      }
      abort();
    }
    p_sessionReasonStack->c.__size_.__value_ = value - 1;
    sub_1001B0F54(p_sessionReasonStack, 1);

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NIAcwgRangingSessionResumeResponseMsg fromStruct:](NIAcwgRangingSessionResumeResponseMsg, "fromStruct:", *(_QWORD *)&buf[8], *(_QWORD *)&buf[16]));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "remote"));
    objc_msgSend(v23, "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:", v22, 0);

    v24 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG resume processing succeeded", v35, 2u);
    }
  }

}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  AcwgManager *ptr;
  int v15;
  NIServerSessionResourceManager *v16;
  void *v17;
  void *v18;
  _BYTE *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  objc_super v29;
  int v30;
  NSErrorUserInfoKey v31;
  void *v32;
  _BYTE buf[12];
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;

  v3 = *(_QWORD *)&a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6BA0(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,prefetchAcwgUrsk:%u", buf, 8u);
  }
  ptr = self->_acwgManager.__ptr_;
  if (!ptr)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D6B74();
    v28 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      v34 = 1024;
      v35 = 745;
      v36 = 2080;
      v37 = "-[NIServerAcwgSession prefetchAcwgUrsk:]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  v30 = 0;
  v15 = sub_100305AA4((uint64_t)ptr, v3, &v30);
  v29.receiver = self;
  v29.super_class = (Class)NIServerAcwgSession;
  v16 = -[NIServerBaseSession resourcesManager](&v29, "resourcesManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v15)
  {
    sub_100301BCC(v30, buf);
    if (SBYTE3(v37) >= 0)
      v19 = buf;
    else
      v19 = *(_BYTE **)buf;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("prefetchAcwgUrsk failed (%s)"), v19));
    if (SBYTE3(v37) < 0)
      operator delete(*(void **)buf);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D66E8();
    v31 = NSLocalizedDescriptionKey;
    v32 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v22 = (v15 + 103);
    if (v22 >= 4)
      v23 = -5887;
    else
      v23 = v22 - 19703;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v23, v21));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remote"));
    objc_msgSend(v25, "didPrefetchAcwgUrsk:error:", v3, v24);

  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remote"));
    objc_msgSend(v26, "didPrefetchAcwgUrsk:error:", v3, 0);

    v27 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ACWG URSK Prefetch succeeded", buf, 2u);
    }
  }

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
  _BYTE *v21;
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
  NIBluetoothHostTimeSyncResponse *v34;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int16 v44;
  unsigned __int8 v45;
  __int16 v46;
  char v47;
  _BYTE __p[12];
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;
  NSErrorUserInfoKey v53;
  void *v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  _BYTE v58[18];
  __int16 v59;
  _WORD v60[11];
  NSErrorUserInfoKey v61;
  const __CFString *v62;

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
    v56 = (const char *)v15;
    v57 = 2048;
    *(_QWORD *)v58 = a4;
    *(_WORD *)&v58[8] = 2048;
    *(_QWORD *)&v58[10] = a5;
    v59 = 2048;
    *(double *)v60 = a6;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-acwg,processBluetoothHostTimeSyncWithType got event: %@, btc clock ticks: %llu, event counter: %llu, monotonic time: %f [s]", buf, 0x2Au);

  }
  *a7 = 0;
  if (!self->_acwgManager.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D6C10();
    v36 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
      v57 = 1024;
      *(_DWORD *)v58 = 795;
      *(_WORD *)&v58[4] = 2080;
      *(_QWORD *)&v58[6] = "-[NIServerAcwgSession processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monoton"
                           "icTimeSec:response:]";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
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
    LODWORD(v56) = 1;
    BYTE4(v56) = 0;
    v58[2] = 0;
    *(_QWORD *)&v58[10] = v20;
    LOBYTE(v59) = 1;
    *(_QWORD *)&v60[3] = a5;
    *(double *)&v60[7] = a6;
    sub_1003059C8((uint64_t)self->_acwgManager.__ptr_, (unsigned int *)buf, (uint64_t)&v39);
    if (v39)
    {
      sub_100301BCC(v39, __p);
      if (SBYTE3(v52) >= 0)
        v21 = __p;
      else
        v21 = *(_BYTE **)__p;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to process Bluetooth host time sync. %s"), v21));
      if (SBYTE3(v52) < 0)
        operator delete(*(void **)__p);
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D66E8();
      v53 = NSLocalizedDescriptionKey;
      v54 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19887, v23));

    }
    else
    {
      if (!v47)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003D6CAC();
        v37 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__p = 136315650;
          *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session"
                               "/NIServerAcwgSession.mm";
          v49 = 1024;
          v50 = 829;
          v51 = 2080;
          v52 = "-[NIServerAcwgSession processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:]";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", __p, 0x1Cu);
        }
        abort();
      }
      v34 = [NIBluetoothHostTimeSyncResponse alloc];
      LOWORD(v38) = v46;
      v24 = 0;
      *a7 = -[NIBluetoothHostTimeSyncResponse initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:deviceMaxPpm:success:retryDelay:](v34, "initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:deviceMaxPpm:success:retryDelay:", v40, v41, v42, v43, v44, v45, v38);
    }
  }
  else
  {
    v25 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D6C3C(v25, v26, v27, v28, v29, v30, v31, v32);
    v61 = NSLocalizedDescriptionKey;
    v62 = CFSTR("Invalid Bluetooth Host Time Sync Event type. See the NIBluetoothHostTimeSyncType enum for valid options.");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19887, v33));

  }
  return v24;
}

- (NIServerNumberResponse)isRangingLimitExceeded
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  NIServerNumberResponse result;

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6CD8(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = sub_1002A798C();
  v11 = sub_1002A92D4((NSObject **)v10, 8);
  v12 = &__kCFBooleanFalse;
  if (v11)
    v12 = &__kCFBooleanTrue;
  v13 = v12;
  v14 = 0;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (id)deleteURSKs
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AcwgManager *ptr;
  int v12;
  _BYTE *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  NSErrorUserInfoKey v19;
  void *v20;
  _BYTE __p[12];
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6D74(v3, v4, v5, v6, v7, v8, v9, v10);
  ptr = self->_acwgManager.__ptr_;
  if (!ptr)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D6D48();
    v18 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__p = 136315650;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIS"
                           "erverAcwgSession.mm";
      v22 = 1024;
      v23 = 859;
      v24 = 2080;
      v25 = "-[NIServerAcwgSession deleteURSKs]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", __p, 0x1Cu);
    }
    abort();
  }
  v12 = sub_100305A44((uint64_t)ptr);
  if (v12)
  {
    sub_100301BCC(v12, __p);
    if (SBYTE3(v25) >= 0)
      v13 = __p;
    else
      v13 = *(_BYTE **)__p;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to delete keys (%s)"), v13));
    if (SBYTE3(v25) < 0)
      operator delete(*(void **)__p);
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D66E8();
    v19 = NSLocalizedDescriptionKey;
    v20 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19883, v15));

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void **v16;
  void *v17;
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
  void *__p[2];
  char v31;
  NSErrorUserInfoKey v32;
  void *v33;
  unsigned int v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[2];
  NSErrorUserInfoKey v38;
  const __CFString *v39;

  v6 = a3;
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6E54(v7, v8, v9, v10, v11, v12, v13, v14);
  if ((os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.nearbyd"), "UTF8String")) & 1) != 0)
  {
    if (v6 && objc_msgSend(v6, "length") == (id)32)
    {
      objc_msgSend(v6, "getBytes:length:", v37, 32);
      v34 = a4;
      v35 = v37[0];
      v36 = v37[1];
      v15 = sub_1002B2AEC((uint64_t)self->_alishaSystem.__ptr_, (uint64_t)&v34);
      if (v15)
      {
        sub_100301BCC(v15, __p);
        if (v31 >= 0)
          v16 = __p;
        else
          v16 = (void **)__p[0];
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to set debug key (%s)"), v16));
        if (v31 < 0)
          operator delete(__p[0]);
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003D66E8();
        v32 = NSLocalizedDescriptionKey;
        v33 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19886, v18));

      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v20 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D6DE4(v20, v21, v22, v23, v24, v25, v26, v27);
      v38 = NSLocalizedDescriptionKey;
      v39 = CFSTR("Nil or invalid length URSK.");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19886, v28));

    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
  }

  return v19;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  void *__p[2];
  char v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6EC4(v5, v6, v7, v8, v9, v10, v11, v12);
  if ((os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.nearbyd"), "UTF8String")) & 1) == 0)
    return (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
  v13 = sub_1002B2C90((uint64_t)self->_alishaSystem.__ptr_, a3);
  if (!v13)
    return 0;
  sub_100301BCC(v13, __p);
  if (v20 >= 0)
    v14 = __p;
  else
    v14 = (void **)__p[0];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to set URSK TTL (%s)"), v14));
  if (v20 < 0)
    operator delete(__p[0]);
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D66E8();
  v21 = NSLocalizedDescriptionKey;
  v22 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -18889, v16));

  return v17;
}

- (shared_ptr<rose::objects::AlishaSession>)_buildAlishaSession:(const void *)a3
{
  _QWORD *v3;
  _QWORD *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NIServerAcwgSession *v15;
  _QWORD *v16;
  NIServerAcwgSession *v17;
  NIServerAcwgSession *v18;
  NIServerAcwgSession *v19;
  NIServerAcwgSession *v20;
  NIServerAcwgSession *v21;
  NIServerAcwgSession *v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  AlishaSession *v46;
  __shared_weak_count *v47;
  __int128 v48;
  void *__p[2];
  char v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  _QWORD v53[3];
  _QWORD *v54;
  _QWORD v55[3];
  _QWORD *v56;
  _QWORD v57[3];
  _QWORD *v58;
  _BYTE v59[24];
  _BYTE *v60;
  _QWORD v61[3];
  _QWORD *v62;
  _QWORD v63[3];
  _QWORD *v64;
  uint8_t buf[8];
  NIServerAcwgSession *v66;
  uint8_t *v67;
  shared_ptr<rose::objects::AlishaSession> result;

  v6 = v3;
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D6FC4(v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = self;
  sub_10000BF04(__p, (char *)-[NSString UTF8String](v15->_containerUniqueIdentifier, "UTF8String"));
  v16 = operator new(0x5D8uLL);
  v16[1] = 0;
  v16[2] = 0;
  *v16 = off_10080B7F8;
  v17 = v15;
  *(_QWORD *)buf = off_10080B848;
  v66 = v17;
  v67 = buf;
  v18 = v17;
  v63[0] = off_10080B900;
  v63[1] = v18;
  v64 = v63;
  v19 = v18;
  v61[0] = off_10080B9B8;
  v61[1] = v19;
  v62 = v61;
  v60 = 0;
  v20 = v19;
  v57[0] = off_10080BA80;
  v57[1] = v20;
  v58 = v57;
  v21 = v20;
  v55[0] = off_10080BB48;
  v55[1] = v21;
  v56 = v55;
  v22 = v21;
  v53[0] = off_10080BBD8;
  v53[1] = v22;
  v54 = v53;
  v51 = 0;
  v52 = 0;
  sub_1002B34A8(v16 + 3, (__int128 *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v63, (uint64_t)v61, (uint64_t)v59, (uint64_t)v57, (uint64_t)v55, (uint64_t)v53, &v51);
  v23 = v52;
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = v54;
  if (v54 == v53)
  {
    v27 = 4;
    v26 = v53;
  }
  else
  {
    if (!v54)
      goto LABEL_13;
    v27 = 5;
  }
  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_13:
  v28 = v56;
  if (v56 == v55)
  {
    v29 = 4;
    v28 = v55;
  }
  else
  {
    if (!v56)
      goto LABEL_18;
    v29 = 5;
  }
  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_18:
  v30 = v58;
  if (v58 == v57)
  {
    v31 = 4;
    v30 = v57;
  }
  else
  {
    if (!v58)
      goto LABEL_23;
    v31 = 5;
  }
  (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_23:
  v32 = v60;
  if (v60 == v59)
  {
    v33 = 4;
    v32 = v59;
  }
  else
  {
    if (!v60)
      goto LABEL_28;
    v33 = 5;
  }
  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_28:
  v34 = v62;
  if (v62 == v61)
  {
    v35 = 4;
    v34 = v61;
  }
  else
  {
    if (!v62)
      goto LABEL_33;
    v35 = 5;
  }
  (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_33:
  v36 = v64;
  if (v64 == v63)
  {
    v37 = 4;
    v36 = v63;
  }
  else
  {
    if (!v64)
      goto LABEL_38;
    v37 = 5;
  }
  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_38:
  v38 = v67;
  if (v67 == buf)
  {
    v39 = 4;
    v38 = buf;
  }
  else
  {
    if (!v67)
      goto LABEL_43;
    v39 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v38 + 8 * v39))();
LABEL_43:
  *(_QWORD *)&v48 = v16 + 3;
  *((_QWORD *)&v48 + 1) = v16;
  sub_10001B020((uint64_t)&v48, v16 + 5, (uint64_t)(v16 + 3));
  v40 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Registering for Acwg service.", buf, 2u);
  }
  v41 = sub_1002AEA48(v48);
  if (v41)
  {
    v42 = (id)qword_10085F520;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v41, buf);
      sub_1003D6F34((uint64_t)buf);
    }

    *v6 = 0;
    v6[1] = 0;
    v43 = (std::__shared_weak_count *)*((_QWORD *)&v48 + 1);
    if (*((_QWORD *)&v48 + 1))
    {
      v44 = (unint64_t *)(*((_QWORD *)&v48 + 1) + 8);
      do
        v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
  }
  else
  {
    *(_OWORD *)v6 = v48;
  }
  if (v50 < 0)
    operator delete(__p[0]);

  result.__cntrl_ = v47;
  result.__ptr_ = v46;
  return result;
}

- (void)_alishaSessionInvalidatedWithReason:(int)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  objc_super v17;
  _QWORD v18[3];

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D7090(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (id)qword_10085F520;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_1002B48E0(a3, v18);
    sub_1003D7034((uint64_t)v18);
  }

  -[NIServerAcwgSession invalidate](self, "invalidate");
  v17.receiver = self;
  v17.super_class = (Class)NIServerAcwgSession;
  v14 = -[NIServerBaseSession invalidationHandler](&v17, "invalidationHandler");
  v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  ((void (**)(_QWORD, void *))v15)[2](v15, v16);

}

- (id)_configureForOwnerDevice
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  optional<rose::alisha::hsi::Capabilities> *p_cachedCapabilities;
  NIServerAcwgSession *v14;
  NIServerAcwgSession *v15;
  shared_ptr<AcwgConfigProvider> *p_configProvider;
  NIServerAcwgSession *v17;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  unint64_t *cntrl;
  unint64_t *v29;
  unint64_t v30;
  __shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  _QWORD *v36;
  NIServerAcwgSession *v37;
  std::__shared_weak_count *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  __shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  uint64_t (***v56)();
  uint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *p_shared_owners;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  uint8_t *v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  AcwgConfigProvider *v80;
  std::__shared_weak_count *v81;
  uint64_t (**ptr)();
  std::__shared_weak_count *v83;
  uint64_t (***p_ptr)();
  uint8_t buf[24];
  uint8_t *v86;

  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D7194(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-acwg,_configureForOwnerDevice", buf, 2u);
  }
  p_cachedCapabilities = &self->_cachedCapabilities;
  if (!self->_cachedCapabilities.__engaged_)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerAcwgSession.mm"), 1033, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_cachedCapabilities.has_value()"));

  }
  v14 = self;
  v15 = v14;
  p_configProvider = &v14->_configProvider;
  if (!v14->_configProvider.__ptr_)
  {
    LOBYTE(v80) = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration debugOptions](v14->_configuration, "debugOptions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("BypassBluetoothTimesync")));
    v21 = objc_msgSend(v20, "BOOLValue");

    LOBYTE(v80) = v21;
    sub_1001B21CC((char *)&v80, buf);
    sub_1000145E8((uint64_t)p_configProvider, (__int128 *)buf);
    v22 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v23 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  if (!v15->_paramNegotiator.__ptr_)
  {
    if (!p_cachedCapabilities->__engaged_)
      sub_10000BA44();
    v25 = operator new(0xE8uLL);
    v26 = v25;
    v25[1] = 0;
    v25[2] = 0;
    *v25 = off_10080BDB8;
    v27 = v25 + 3;
    ptr = (uint64_t (**)())v15->_alishaSystem.__ptr_;
    cntrl = (unint64_t *)v15->_alishaSystem.__cntrl_;
    v83 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      v29 = cntrl + 1;
      do
        v30 = __ldxr(v29);
      while (__stxr(v30 + 1, v29));
    }
    v80 = p_configProvider->__ptr_;
    v31 = p_configProvider->__cntrl_;
    v81 = (std::__shared_weak_count *)v31;
    if (v31)
    {
      v32 = (unint64_t *)((char *)v31 + 8);
      do
        v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
    }
    *(_QWORD *)buf = off_10080BE08;
    v86 = buf;
    sub_1002F9FC8(v25 + 3, p_cachedCapabilities, &ptr, &v80, buf);
    v34 = v86;
    if (v86 == buf)
    {
      v35 = 4;
      v34 = buf;
    }
    else
    {
      if (!v86)
        goto LABEL_55;
      v35 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v34 + 8 * v35))();
LABEL_55:
    v58 = v81;
    if (v81)
    {
      p_shared_owners = (unint64_t *)&v81->__shared_owners_;
      do
        v60 = __ldaxr(p_shared_owners);
      while (__stlxr(v60 - 1, p_shared_owners));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }
    v61 = v83;
    if (v83)
    {
      v62 = (unint64_t *)&v83->__shared_owners_;
      do
        v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }
    *(_QWORD *)&v79 = v27;
    *((_QWORD *)&v79 + 1) = v26;
    sub_1000145E8((uint64_t)&v15->_paramNegotiator, &v79);
    v64 = (std::__shared_weak_count *)*((_QWORD *)&v79 + 1);
    if (*((_QWORD *)&v79 + 1))
    {
      v65 = (unint64_t *)(*((_QWORD *)&v79 + 1) + 8);
      do
        v66 = __ldaxr(v65);
      while (__stlxr(v66 - 1, v65));
      if (!v66)
      {
        ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
        std::__shared_weak_count::__release_weak(v64);
      }
    }
  }
  v17 = v15;
  if (v17->_acwgManager.__ptr_)
    goto LABEL_10;
  sub_1002A798C();
  sub_1002A923C(8, v17->_containerUniqueIdentifier, v17->_clientQueue, &v77);
  v36 = operator new(0xD0uLL);
  v36[1] = 0;
  v36[2] = 0;
  *v36 = off_10080BE98;
  v37 = v17;
  *(_QWORD *)buf = off_10080BEE8;
  *(_QWORD *)&buf[8] = v37;
  v86 = buf;
  v38 = v37;
  ptr = off_10080BF78;
  v83 = v38;
  p_ptr = &ptr;
  v80 = (AcwgConfigProvider *)v17->_alishaSystem.__ptr_;
  v39 = (std::__shared_weak_count *)v17->_alishaSystem.__cntrl_;
  v81 = v39;
  if (v39)
  {
    v40 = (unint64_t *)&v39->__shared_owners_;
    do
      v41 = __ldxr(v40);
    while (__stxr(v41 + 1, v40));
  }
  *(_QWORD *)&v79 = v15->_paramNegotiator.__ptr_;
  v42 = v15->_paramNegotiator.__cntrl_;
  *((_QWORD *)&v79 + 1) = v42;
  if (v42)
  {
    v43 = (unint64_t *)((char *)v42 + 8);
    do
      v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
  }
  v78 = v77;
  if (*((_QWORD *)&v77 + 1))
  {
    v45 = (unint64_t *)(*((_QWORD *)&v77 + 1) + 8);
    do
      v46 = __ldxr(v45);
    while (__stxr(v46 + 1, v45));
  }
  sub_100304BA0(v36 + 3, buf, &ptr, &v80, &v79, &v78);
  v47 = (std::__shared_weak_count *)*((_QWORD *)&v78 + 1);
  if (*((_QWORD *)&v78 + 1))
  {
    v48 = (unint64_t *)(*((_QWORD *)&v78 + 1) + 8);
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  v50 = (std::__shared_weak_count *)*((_QWORD *)&v79 + 1);
  if (*((_QWORD *)&v79 + 1))
  {
    v51 = (unint64_t *)(*((_QWORD *)&v79 + 1) + 8);
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  v53 = v81;
  if (v81)
  {
    v54 = (unint64_t *)&v81->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  v56 = p_ptr;
  if (p_ptr == &ptr)
  {
    v57 = 4;
    v56 = &ptr;
  }
  else
  {
    if (!p_ptr)
      goto LABEL_72;
    v57 = 5;
  }
  (*v56)[v57]();
LABEL_72:
  v67 = v86;
  if (v86 == buf)
  {
    v68 = 4;
    v67 = buf;
  }
  else
  {
    if (!v86)
      goto LABEL_77;
    v68 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v67 + 8 * v68))();
LABEL_77:
  *(_QWORD *)&v76 = v36 + 3;
  *((_QWORD *)&v76 + 1) = v36;
  sub_1000145E8((uint64_t)&v17->_acwgManager, &v76);
  v69 = (std::__shared_weak_count *)*((_QWORD *)&v76 + 1);
  if (*((_QWORD *)&v76 + 1))
  {
    v70 = (unint64_t *)(*((_QWORD *)&v76 + 1) + 8);
    do
      v71 = __ldaxr(v70);
    while (__stlxr(v71 - 1, v70));
    if (!v71)
    {
      ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
      std::__shared_weak_count::__release_weak(v69);
    }
  }
  v72 = (std::__shared_weak_count *)*((_QWORD *)&v77 + 1);
  if (*((_QWORD *)&v77 + 1))
  {
    v73 = (unint64_t *)(*((_QWORD *)&v77 + 1) + 8);
    do
      v74 = __ldaxr(v73);
    while (__stlxr(v74 - 1, v73));
    if (!v74)
    {
      ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
      std::__shared_weak_count::__release_weak(v72);
    }
  }
LABEL_10:

  return 0;
}

- (JobConfig)_aopJobConfigWithTimeouts
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  JobConfig *result;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D7204(v5, v6, v7, v8, v9, v10, v11, v12);
  *(_QWORD *)&retstr->peerDiscoveryTimeoutSeconds = -1;
  retstr->timeoutRefirePeriodSeconds = -1;
  retstr->maxTimeoutRefires = 0;
  *(_QWORD *)(&retstr->maxTimeoutRefires + 1) = 0xFFFFFFFFLL;
  *(_WORD *)((char *)&retstr->subratingConfigs[0].var0.var0 + 3) = 0;
  retstr->optionsBitmap = 1;
  v13 = (unsigned __int16)sub_1002F7114(CFSTR("AcwgTimeoutAOverrideSeconds"), (id)0xF);
  v14 = (unsigned __int16)sub_1002F7114(CFSTR("AcwgTimeoutBOverrideSeconds"), (id)0xF);
  v15 = (unsigned __int16)sub_1002F7114(CFSTR("AcwgTimeoutRefirePeriodOverrideSeconds"), (id)0xF);
  result = (JobConfig *)sub_1002F7114(CFSTR("AcwgMaxTimeoutRefiresOverride"), (id)2);
  retstr->peerDiscoveryTimeoutSeconds = v13;
  retstr->peerReacquisitionTimeoutSeconds = v13;
  retstr->trackingTimeoutSeconds = -1;
  retstr->jobTimeoutSeconds = v14;
  retstr->timeoutRefirePeriodSeconds = v15;
  retstr->maxTimeoutRefires = result;
  *(_WORD *)(&retstr->maxTimeoutRefires + 1) = -1;
  *(unsigned __int16 *)((char *)&retstr->eventWatchdogTimeoutMilliseconds + 1) = self->_lockBtConnHandle;
  return result;
}

- (RequestConstructionDebugParams)_ownerDeviceServiceRequestDebugParams:(SEL)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unsigned __int8 v25;
  RequestConstructionDebugParams *result;
  int v27;
  id v28;

  v5 = a4;
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D7274(v6, v7, v8, v9, v10, v11, v12, v13);
  retstr->var3.__engaged_ = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var4.__engaged_ = 0;
  retstr->var11 = 0;
  *(_DWORD *)&retstr->var0 = 0;
  retstr->var3.var0.__null_state_ = 0;
  *(_QWORD *)&retstr->var5 = 0;
  retstr->var10 = 0;
  v14 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Debug params for owner device service request. Debug options: %@", (uint8_t *)&v27, 0xCu);
  }
  retstr->var0 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DebugSTSIndex0")));
  if (!v15
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AnchorHopKey"))),
        v17 = v16 == 0,
        v16,
        v15,
        v17))
  {
    retstr->var2 = 0;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DebugSTSIndex0")));
    v19 = objc_msgSend(v18, "unsignedIntegerValue");

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AnchorHopKey")));
    v21 = objc_msgSend(v20, "unsignedIntegerValue");

    retstr->var2 = 1;
    retstr->var3.__engaged_ = 1;
    retstr->var3.var0.__val_ = v19;
    retstr->var4.__engaged_ = 1;
    retstr->var4.var0.__val_ = v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DisableUWBEncryption")));
  v23 = objc_msgSend(v22, "BOOLValue");

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DisableSecureToF")));
  v25 = objc_msgSend(v24, "BOOLValue");

  retstr->var9 = v23;
  retstr->var10 = v25;
  retstr->var11 = 8;

  return result;
}

- (void)_sendAnalyticsOnRangingComplete:(int64_t)a3 suspendReason:(int64_t)a4
{
  NSDate *sessionSuspendTimestamp;
  const char *v8;
  const char *v9;
  NSObject *v10;
  int lockBtConnHandle;
  NSString *containerUniqueIdentifier;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  NSDate *sessionStartTimestamp;
  NSDate *v18;
  NSObject *v19;
  _QWORD v20[7];
  uint8_t buf[4];
  _BYTE v22[14];
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  sessionSuspendTimestamp = self->_sessionSuspendTimestamp;
  if (!sessionSuspendTimestamp)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D72E4();
    v19 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v22 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = 1201;
      v23 = 2080;
      v24 = "-[NIServerAcwgSession _sendAnalyticsOnRangingComplete:suspendReason:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  if (self->_sessionStartTimestamp)
  {
    -[NSDate timeIntervalSinceDate:](sessionSuspendTimestamp, "timeIntervalSinceDate:");
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    lockBtConnHandle = self->_lockBtConnHandle;
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    v13 = NIAcwgSessionTriggerReasonToString(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = NIAcwgSuspendTriggerReasonToString(a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v22 = lockBtConnHandle;
    *(_WORD *)&v22[4] = 2112;
    *(_QWORD *)&v22[6] = containerUniqueIdentifier;
    v23 = 2048;
    v24 = v9;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-acwg,ranging complete [0x%04x, %@] = %.1f secs [%@, %@]", buf, 0x30u);

  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001AEFE0;
  v20[3] = &unk_1007FA7B8;
  v20[4] = v9;
  v20[5] = a3;
  v20[6] = a4;
  AnalyticsSendEventLazy(CFSTR("com.apple.lyon.RangingComplete"), v20);
  sessionStartTimestamp = self->_sessionStartTimestamp;
  self->_sessionStartTimestamp = 0;

  v18 = self->_sessionSuspendTimestamp;
  self->_sessionSuspendTimestamp = 0;

}

- (void)_alishaStateChangedFromState:(unsigned __int8)a3 toNewState:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  void **v17;
  void **v18;
  void **v19;
  NSString *containerUniqueIdentifier;
  int v21;
  unint64_t value;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  NSDate *v28;
  NSDate *sessionSuspendTimestamp;
  NIServerSessionResourceManager *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  objc_super v34;
  void *__p[2];
  char v36;
  void *v37[2];
  char v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  _BYTE v42[18];

  v4 = a4;
  v5 = a3;
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D733C(v7, v8, v9, v10, v11, v12, v13, v14);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v15 = (id)qword_10085F520;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    sub_100302388(v5, v37);
    v16 = v38;
    v17 = (void **)v37[0];
    sub_100302388(v4, __p);
    v18 = v37;
    if (v16 < 0)
      v18 = v17;
    if (v36 >= 0)
      v19 = __p;
    else
      v19 = (void **)__p[0];
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    v40 = (const char *)v18;
    v41 = 2080;
    *(_QWORD *)v42 = v19;
    *(_WORD *)&v42[8] = 2112;
    *(_QWORD *)&v42[10] = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-acwg,State changed from %s to %s, session container ID: %@", buf, 0x20u);
    if (v36 < 0)
      operator delete(__p[0]);
    if (v38 < 0)
      operator delete(v37[0]);
  }

  v21 = sub_100304754(v5);
  if (((v21 ^ 1 | sub_100304754(v4)) & 1) == 0)
  {
    value = self->_suspendReasonStack.c.__size_.__value_;
    if (value)
    {
      v23 = value - 1;
      v24 = (*(int64_t **)((char *)self->_suspendReasonStack.c.__map_.__begin_
                                + (((self->_suspendReasonStack.c.__start_ + v23) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_suspendReasonStack.c.__start_ + v23) & 0x1FF];
      self->_suspendReasonStack.c.__size_.__value_ = v23;
      sub_1001B0F54(&self->_suspendReasonStack.c.__map_.__first_, 1);
    }
    else
    {
      v24 = 106;
    }
    v25 = self->_sessionReasonStack.c.__size_.__value_;
    if (!v25)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D7310();
      v33 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
        v41 = 1024;
        *(_DWORD *)v42 = 1254;
        *(_WORD *)&v42[4] = 2080;
        *(_QWORD *)&v42[6] = "-[NIServerAcwgSession _alishaStateChangedFromState:toNewState:]";
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    v26 = v25 - 1;
    v27 = (*(int64_t **)((char *)self->_sessionReasonStack.c.__map_.__begin_
                              + (((self->_sessionReasonStack.c.__start_ + v26) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_sessionReasonStack.c.__start_ + v26) & 0x1FF];
    self->_sessionReasonStack.c.__size_.__value_ = v26;
    sub_1001B0F54(&self->_sessionReasonStack.c.__map_.__first_, 1);
    v28 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    sessionSuspendTimestamp = self->_sessionSuspendTimestamp;
    self->_sessionSuspendTimestamp = v28;

    -[NIServerAcwgSession _sendAnalyticsOnRangingComplete:suspendReason:](self, "_sendAnalyticsOnRangingComplete:suspendReason:", v27, v24);
    v34.receiver = self;
    v34.super_class = (Class)NIServerAcwgSession;
    v30 = -[NIServerBaseSession resourcesManager](&v34, "resourcesManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "remote"));
    objc_msgSend(v32, "didSuspendAcwgRanging:", v24);

  }
}

- (void)_handleInitiatorRangingBlockUpdate:(InitiatorRangingBlockSummary *)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t value;
  int64_t v14;
  NSDate *v15;
  NSDate *sessionStartTimestamp;
  NIServerSessionResourceManager *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D73AC(v5, v6, v7, v8, v9, v10, v11, v12);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!a3->var5 && a3->var8 == 1)
  {
    value = self->_sessionReasonStack.c.__size_.__value_;
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D7310();
      v20 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerAcwgSession.mm";
        v24 = 1024;
        v25 = 1275;
        v26 = 2080;
        v27 = "-[NIServerAcwgSession _handleInitiatorRangingBlockUpdate:]";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    v14 = (*(int64_t **)((char *)self->_sessionReasonStack.c.__map_.__begin_
                              + (((value + self->_sessionReasonStack.c.__start_ - 1) >> 6) & 0x3FFFFFFFFFFFFF8)))[(value + self->_sessionReasonStack.c.__start_ - 1) & 0x1FF];
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    sessionStartTimestamp = self->_sessionStartTimestamp;
    self->_sessionStartTimestamp = v15;

    v21.receiver = self;
    v21.super_class = (Class)NIServerAcwgSession;
    v17 = -[NIServerBaseSession resourcesManager](&v21, "resourcesManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remote"));
    objc_msgSend(v19, "didStartAcwgRanging:", v14);

  }
}

- (void)_handleSessionStats:(SessionStats *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D741C(v4, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
}

- (void)_handleHealthChanged:(int)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void **v14;
  NSString *containerUniqueIdentifier;
  void *__p[2];
  char v17;
  uint8_t buf[4];
  void **v19;
  __int16 v20;
  NSString *v21;

  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D748C(v5, v6, v7, v8, v9, v10, v11, v12);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v13 = (id)qword_10085F520;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000BF04(__p, off_10080C0D8[a3]);
    if (v17 >= 0)
      v14 = __p;
    else
      v14 = (void **)__p[0];
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315394;
    v19 = v14;
    v20 = 2112;
    v21 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Health changed to %s, session container ID: %@", buf, 0x16u);
    if (v17 < 0)
      operator delete(__p[0]);
  }

}

- (void)_handleTimeoutEvent:(int)a3 time:(double)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void **v16;
  NSString *containerUniqueIdentifier;
  NIServerSessionResourceManager *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  int v24;
  _BYTE *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  objc_super v33;
  void *__p[2];
  char v35;
  NSErrorUserInfoKey v36;
  void *v37;
  _BYTE buf[12];
  __int16 v39;
  _BYTE v40[18];

  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D7574(v7, v8, v9, v10, v11, v12, v13, v14);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  sub_10000BF04(__p, off_10080C0F0[a3]);
  v15 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v16 = __p;
    if (v35 < 0)
      v16 = (void **)__p[0];
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v16;
    v39 = 2048;
    *(double *)v40 = a4;
    *(_WORD *)&v40[8] = 2112;
    *(_QWORD *)&v40[10] = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-acwg,Received timeout event %s at %f sec, session container ID: %@", buf, 0x20u);
  }
  if (self->_acwgManager.__ptr_)
  {
    v33.receiver = self;
    v33.super_class = (Class)NIServerAcwgSession;
    v18 = -[NIServerBaseSession resourcesManager](&v33, "resourcesManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    v32 = 103;
    if ((a3 - 2) >= 2)
    {
      if (a3 != 4)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003D74FC();
        v31 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session"
                               "/NIServerAcwgSession.mm";
          v39 = 1024;
          *(_DWORD *)v40 = 1347;
          *(_WORD *)&v40[4] = 2080;
          *(_QWORD *)&v40[6] = "-[NIServerAcwgSession _handleTimeoutEvent:time:]";
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "#ses-acwg,%s:%d: assertion failure in %s", buf, 0x1Cu);
        }
        abort();
      }
      sub_1001B0728(&self->_suspendReasonStack.c.__map_.__first_, &v32);
      v23 = sub_1003054BC((uint64_t)self->_acwgManager.__ptr_);
      v24 = v23;
      if (!v23)
        goto LABEL_26;
      sub_100305C4C(v23, buf);
      if (v40[9] >= 0)
        v25 = buf;
      else
        v25 = *(_BYTE **)buf;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Supending ACWG Ranging on timeout failed (%s)"), v25));
      if ((v40[9] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D66E8();
      v36 = NSLocalizedDescriptionKey;
      v37 = v21;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
      v27 = (v24 + 103);
      if (v27 >= 4)
        v28 = -5887;
      else
        v28 = v27 - 19703;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v28, v26));

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "remote"));
      objc_msgSend(v30, "uwbSessionDidFailWithError:", v29);

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "remote"));
      objc_msgSend(v21, "requestAcwgRangingSessionSuspend:withSuspendTriggerReason:", sub_100305A2C((uint64_t)self->_acwgManager.__ptr_), 103);
    }

LABEL_26:
    goto LABEL_27;
  }
  v22 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ses-acwg,No Acwg manager. Ignoring timeout event", buf, 2u);
  }
LABEL_27:
  if (v35 < 0)
    operator delete(__p[0]);
}

- (void)didReceiveAopSensorFusionUpdate:(int)a3 withBtConnHandle:(unsigned __int16)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  OS_dispatch_queue *clientQueue;
  _QWORD v16[5];
  id v17;
  int v18;
  unsigned __int16 v19;
  id location;

  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D75E4(v7, v8, v9, v10, v11, v12, v13, v14);
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001AFD68;
  v16[3] = &unk_10080B778;
  objc_copyWeak(&v17, &location);
  v19 = a4;
  v18 = a3;
  v16[4] = self;
  dispatch_async((dispatch_queue_t)clientQueue, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *specific;
  NSString *containerUniqueIdentifier;
  NSObject *v17;
  _BOOL4 v18;
  int v19;
  void **v20;
  void **v21;
  void **v22;
  int v23;
  void **v24;
  void **v25;
  void **v26;
  AcwgManager *ptr;
  void *__p[2];
  char v29;
  void *v30[2];
  char v31;
  uint8_t buf[4];
  void **v33;
  __int16 v34;
  void **v35;

  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D7680(v7, v8, v9, v10, v11, v12, v13, v14);
  specific = (NSString *)dispatch_get_specific("com.apple.nearbyd.acwg-session.queue-context-key");
  containerUniqueIdentifier = self->_containerUniqueIdentifier;
  v17 = (id)qword_10085F520;
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (specific == containerUniqueIdentifier)
  {
    if (v18)
    {
      sub_10000BF04(v30, off_10080C120[a3]);
      v23 = v31;
      v24 = (void **)v30[0];
      sub_10000BF04(__p, off_10080C148[a4]);
      v25 = v30;
      if (v23 < 0)
        v25 = v24;
      if (v29 >= 0)
        v26 = __p;
      else
        v26 = (void **)__p[0];
      *(_DWORD *)buf = 136315394;
      v33 = v25;
      v34 = 2080;
      v35 = v26;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-acwg,rangingServiceDidUpdateState:%s cause:%s -> ACCEPTING Container message", buf, 0x16u);
      if (v29 < 0)
        operator delete(__p[0]);
      if (v31 < 0)
        operator delete(v30[0]);
    }

    if (a3 == 4)
    {
      ptr = self->_acwgManager.__ptr_;
      if (ptr)
        sub_100305B44((uint64_t)ptr);
    }
  }
  else
  {
    if (v18)
    {
      sub_10000BF04(v30, off_10080C120[a3]);
      v19 = v31;
      v20 = (void **)v30[0];
      sub_10000BF04(__p, off_10080C148[a4]);
      v21 = v30;
      if (v19 < 0)
        v21 = v20;
      if (v29 >= 0)
        v22 = __p;
      else
        v22 = (void **)__p[0];
      *(_DWORD *)buf = 136315394;
      v33 = v21;
      v34 = 2080;
      v35 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-acwg,rangingServiceDidUpdateState:%s cause:%s -> REJECTING RangingManager message", buf, 0x16u);
      if (v29 < 0)
        operator delete(__p[0]);
      if (v31 < 0)
        operator delete(v30[0]);
    }

  }
}

- (NIAcwgConfiguration)configuration
{
  return (NIAcwgConfiguration *)objc_getProperty(self, a2, 336, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sessionSuspendTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionStartTimestamp, 0);
  sub_100152A44(&self->_suspendReasonStack.c.__map_.__first_);
  sub_100152A44(&self->_sessionReasonStack.c.__map_.__first_);
  sub_1001B06E0((uint64_t)&self->_cachedCapabilities);
  sub_10001AE68((uint64_t)&self->_uwbSystemListener);
  sub_10001AE68((uint64_t)&self->_paramNegotiator);
  sub_10001AE68((uint64_t)&self->_configProvider);
  sub_10001AE68((uint64_t)&self->_alishaSystem);
  sub_10001AE68((uint64_t)&self->_acwgManager);
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_BYTE *)self + 152) = 0;
  *((_BYTE *)self + 216) = 0;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 17) = 0u;
  return self;
}

@end
