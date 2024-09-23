@implementation NIServerRangingAuthSession

- (NIServerRangingAuthSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NIServerRangingAuthSession *v14;
  uint64_t v15;
  OS_dispatch_queue *clientQueue;
  NIRangingAuthConfiguration *v17;
  NIRangingAuthConfiguration *configuration;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  NIServerRangingAuthSession *v26;
  void *v28;
  __int128 v29;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(NIRangingAuthConfiguration, v13))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerRangingAuthSession.mm"), 49, CFSTR("NIServerRangingAuthSession given invalid configuration."));

  }
  v30.receiver = self;
  v30.super_class = (Class)NIServerRangingAuthSession;
  v14 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v30, "initWithResourcesManager:configuration:error:", v9, v10, a5);
  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
    clientQueue = v14->_clientQueue;
    v14->_clientQueue = (OS_dispatch_queue *)v15;

    v17 = (NIRangingAuthConfiguration *)objc_msgSend(v10, "copy");
    configuration = v14->_configuration;
    v14->_configuration = v17;

    if (v9)
      objc_msgSend(v9, "protobufLogger");
    else
      v29 = 0uLL;
    sub_1000145E8((uint64_t)&v14->_pbLogger, &v29);
    v19 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = operator new(0x88uLL);
    v22[1] = 0;
    v22[2] = 0;
    *v22 = off_100809EB8;
    *(_QWORD *)&v29 = sub_1002AD140((_BYTE *)v22 + 24);
    *((_QWORD *)&v29 + 1) = v22;
    sub_1000145E8((uint64_t)&v14->_caManager, &v29);
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    v26 = v14;
  }

  return v14;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000;
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;

  if (self->_wifiRangingSession.__ptr_)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerRangingAuthSession disableAllServices](self, "disableAllServices"));
    v4 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,Invalidate. Error: %@", buf, 0xCu);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)NIServerRangingAuthSession;
  -[NIServerBaseSession invalidate](&v5, "invalidate");
}

- (id)disableAllServices
{
  shared_ptr<WiFiRanging::Session> *p_wifiRangingSession;
  Session *ptr;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v8;

  p_wifiRangingSession = &self->_wifiRangingSession;
  ptr = self->_wifiRangingSession.__ptr_;
  if (ptr)
  {
    sub_10002DE08((const std::string *)ptr);
    sub_100180AF4(p_wifiRangingSession);
    v8 = 0uLL;
    sub_1000145E8((uint64_t)p_wifiRangingSession, &v8);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
    if (*((_QWORD *)&v8 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  return 0;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (id)configure
{
  NIServerSessionResourceManager *v3;
  void *v4;
  NIServerRangingAuthSession *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *__p;
  objc_super v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  if (!self->_configuration)
    sub_1003D29C4();
  v15.receiver = self;
  v15.super_class = (Class)NIServerRangingAuthSession;
  v3 = -[NIServerBaseSession resourcesManager](&v15, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if ((objc_msgSend(v4, "entitlementGranted:", 8) & 1) != 0)
  {
    v5 = self;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serverSessionIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

    sub_10000BF04(&__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    operator new();
  }
  v8 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D29EC(v8, v9, v10);
  v16 = NSLocalizedDescriptionKey;
  v17 = CFSTR("Missing entitlement");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v11));

  return v12;
}

- (id)run
{
  NIServerSessionResourceManager *v3;
  void *v4;
  void *v5;
  NSData *v6;
  NSData *secureRangingKey;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NIDiscoveryToken *v17;
  NIDiscoveryToken *peerToken;
  int v19;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  _BYTE v44[16];
  objc_super v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;

  v45.receiver = self;
  v45.super_class = (Class)NIServerRangingAuthSession;
  v3 = -[NIServerBaseSession resourcesManager](&v45, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lifecycleSupervisor"));
  objc_msgSend(v5, "runWithConfigurationCalled");

  v6 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  secureRangingKey = self->_secureRangingKey;
  self->_secureRangingKey = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration peerToken](self->_configuration, "peerToken"));
  v9 = sub_10028F154(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", &off_10082BED8));
    if (v12 && (v13 = objc_opt_class(NSData, v11), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", &off_10082BEF0));
      if (v15 && (v16 = objc_opt_class(NSData, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0))
      {
        v17 = (NIDiscoveryToken *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration peerToken](self->_configuration, "peerToken"));
        peerToken = self->_peerToken;
        self->_peerToken = v17;

        objc_storeStrong((id *)&self->_peerMacAddress, v12);
        objc_storeStrong((id *)&self->_secureRangingKey, v15);
        if (self->_wifiRangingSession.__ptr_)
        {
          if (-[NIRangingAuthConfiguration isResponder](self->_configuration, "isResponder"))
            v19 = 2;
          else
            v19 = 1;
          sub_10002D86C((uint64_t)v44, self->_peerMacAddress, v19, self->_secureRangingKey);
          sub_10002E2FC((uint64_t)self->_wifiRangingSession.__ptr_, (uint64_t)v44);
        }
        v37 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003D2AC8(v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remote"));
        v46 = NSLocalizedDescriptionKey;
        v47 = CFSTR("Failed to start WiFi service. session is nil");
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v41));
        objc_msgSend(v40, "uwbSessionDidFailWithError:", v42);

        v28 = 0;
      }
      else
      {
        v29 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003D2A94(v29, v30, v31, v32, v33, v34, v35, v36);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10012, 0));
      }

    }
    else
    {
      v20 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D2A60(v20, v21, v22, v23, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10012, 0));
    }

  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10012, 0));
  }

  return v28;
}

- (id)pause
{
  void *v3;
  NIServerSessionResourceManager *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerRangingAuthSession disableAllServices](self, "disableAllServices"));
  v8.receiver = self;
  v8.super_class = (Class)NIServerRangingAuthSession;
  v4 = -[NIServerBaseSession resourcesManager](&v8, "resourcesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lifecycleSupervisor"));
  objc_msgSend(v6, "pauseCalled");

  return v3;
}

- (void)wifiRangingRangeResults:(const void *)a3
{
  NINearbyObject *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  float v15;
  NSObject *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  NSObject *v39;
  id v40;
  void (**v41)(_QWORD, _QWORD);
  void *v42;
  __int128 v43;
  NINearbyObject *v44;
  objc_super v45;
  void *__p;
  char *v47;
  char *v48;
  _BYTE buf[12];
  __int16 v50;
  int v51;

  v5 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", self->_peerToken);
  __p = 0;
  v47 = 0;
  v48 = 0;
  v7 = *(_QWORD *)a3;
  v44 = v5;
  if (*(_QWORD *)a3 != *((_QWORD *)a3 + 1))
  {
    *(_QWORD *)&v6 = 136315138;
    v43 = v6;
    v8 = *(_QWORD *)(v7 + 24);
    if (*(_QWORD *)(v7 + 32) != v8)
    {
      v9 = 0;
      do
      {
        v10 = v8 + 24 * v9;
        v11 = *(_DWORD *)v10;
        v12 = *(unsigned __int8 *)(v10 + 8);
        v13 = *(unsigned __int8 *)(v10 + 9);
        v14 = sub_100008778(*(_QWORD *)(v10 + 16));
        v15 = (double)v11 * 0.0149896229;
        v16 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(double *)&buf[4] = v15;
          v50 = 1024;
          v51 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,Wifi RTT measurement: %f, CoreID: %i", buf, 0x12u);
        }
        *(_QWORD *)buf = 0;
        -[NSData getBytes:length:](self->_peerMacAddress, "getBytes:length:", buf, 8, v43);
        v17 = *(_QWORD *)buf;
        v18 = v12 | (unint64_t)&_mh_execute_header;
        v19 = v13 | (unint64_t)&_mh_execute_header;
        v20 = v47;
        if (v47 >= v48)
        {
          v22 = 0xD37A6F4DE9BD37A7 * ((v47 - (_BYTE *)__p) >> 3);
          v23 = v22 + 1;
          if (v22 + 1 > 0x1642C8590B21642)
            sub_100026E7C();
          if (0xA6F4DE9BD37A6F4ELL * ((v48 - (_BYTE *)__p) >> 3) > v23)
            v23 = 0xA6F4DE9BD37A6F4ELL * ((v48 - (_BYTE *)__p) >> 3);
          if (0xD37A6F4DE9BD37A7 * ((v48 - (_BYTE *)__p) >> 3) >= 0xB21642C8590B21)
            v24 = 0x1642C8590B21642;
          else
            v24 = v23;
          if (v24)
            v25 = (char *)sub_100182D3C((uint64_t)&v48, v24);
          else
            v25 = 0;
          v26 = &v25[8 * ((v47 - (_BYTE *)__p) >> 3)];
          *(_QWORD *)v26 = v17;
          *((double *)v26 + 1) = v14;
          *((float *)v26 + 4) = v15;
          *((_DWORD *)v26 + 5) = 2;
          v26[24] = 0;
          v26[36] = 0;
          *((_QWORD *)v26 + 6) = v18;
          *((_QWORD *)v26 + 7) = v19;
          v26[64] = 0;
          v26[72] = 0;
          *((_WORD *)v26 + 40) = 0;
          v26[88] = 0;
          v26[96] = 0;
          v26[104] = 0;
          v26[112] = 0;
          *((_DWORD *)v26 + 30) = 0;
          v26[128] = 0;
          v26[152] = 0;
          v26[160] = 0;
          v26[168] = 0;
          v26[176] = 0;
          v26[178] = 0;
          *((_DWORD *)v26 + 45) = 0;
          v28 = (char *)__p;
          v27 = v47;
          v29 = &v25[184 * v22];
          if (v47 != __p)
          {
            do
            {
              v30 = *(_OWORD *)(v27 - 184);
              v31 = *(_OWORD *)(v27 - 168);
              v32 = *(_OWORD *)(v27 - 152);
              *(_OWORD *)(v29 - 136) = *(_OWORD *)(v27 - 136);
              *(_OWORD *)(v29 - 152) = v32;
              *(_OWORD *)(v29 - 168) = v31;
              *(_OWORD *)(v29 - 184) = v30;
              v33 = *(_OWORD *)(v27 - 120);
              v34 = *(_OWORD *)(v27 - 104);
              v35 = *(_OWORD *)(v27 - 88);
              *(_OWORD *)(v29 - 72) = *(_OWORD *)(v27 - 72);
              *(_OWORD *)(v29 - 88) = v35;
              *(_OWORD *)(v29 - 104) = v34;
              *(_OWORD *)(v29 - 120) = v33;
              v36 = *(_OWORD *)(v27 - 56);
              v37 = *(_OWORD *)(v27 - 40);
              v38 = *(_OWORD *)(v27 - 24);
              *((_QWORD *)v29 - 1) = *((_QWORD *)v27 - 1);
              *(_OWORD *)(v29 - 24) = v38;
              *(_OWORD *)(v29 - 40) = v37;
              *(_OWORD *)(v29 - 56) = v36;
              v29 -= 184;
              v27 -= 184;
            }
            while (v27 != v28);
            v27 = v28;
          }
          v21 = v26 + 184;
          __p = v29;
          v47 = v26 + 184;
          v48 = &v25[184 * v24];
          if (v27)
            operator delete(v27);
        }
        else
        {
          *(_QWORD *)v47 = *(_QWORD *)buf;
          *((double *)v20 + 1) = v14;
          *((float *)v20 + 4) = v15;
          *((_DWORD *)v20 + 5) = 2;
          v20[24] = 0;
          v20[36] = 0;
          *((_QWORD *)v20 + 6) = v18;
          *((_QWORD *)v20 + 7) = v19;
          v20[64] = 0;
          v20[72] = 0;
          *((_WORD *)v20 + 40) = 0;
          v20[88] = 0;
          v20[96] = 0;
          v20[104] = 0;
          v20[112] = 0;
          *((_DWORD *)v20 + 30) = 0;
          v20[128] = 0;
          v20[152] = 0;
          v20[160] = 0;
          v20[168] = 0;
          v20[176] = 0;
          v20[178] = 0;
          v21 = v20 + 184;
          *((_DWORD *)v20 + 45) = 0;
        }
        v47 = v21;
        ++v9;
        v8 = *(_QWORD *)(v7 + 24);
      }
      while (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(v7 + 32) - v8) >> 3) > v9);
    }
    sub_100032270();
    sub_1000325AC();
    operator new();
  }
  v39 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,One-shot ranging session complete, invalidating session...", buf, 2u);
  }
  -[NIServerRangingAuthSession invalidate](self, "invalidate");
  v45.receiver = self;
  v45.super_class = (Class)NIServerRangingAuthSession;
  v40 = -[NIServerBaseSession invalidationHandler](&v45, "invalidationHandler");
  v41 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10008, 0));
  ((void (**)(_QWORD, void *))v41)[2](v41, v42);

  if (__p)
  {
    v47 = (char *)__p;
    operator delete(__p);
  }

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
  NSObject *v11;
  uint8_t v12[16];
  _QWORD block[5];
  id v14;
  void *__p[2];
  char v16;
  NSErrorUserInfoKey v17;
  void *v18;

  sub_10002ED0C(*a3, __p);
  if (v16 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003D2B3C(&v16, __p, v6);
  v17 = NSLocalizedDescriptionKey;
  v18 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v7));

  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100181F54;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v10 = v8;
  v14 = v10;
  dispatch_async((dispatch_queue_t)clientQueue, block);
  v11 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,One-shot ranging session error, invalidating session...", v12, 2u);
  }

  if (v16 < 0)
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,Readiness update: %s", buf, 0xCu);
    if (v7 < 0)
      operator delete(__p[0]);
  }

}

- (id)generateRandomSecureKey
{
  int v2;
  void *v3;
  id v4;
  char bytes;

  v2 = 64;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 64));
  while (1)
  {
    bytes = 0;
    if (SecRandomCopyBytes(kSecRandomDefault, 1uLL, &bytes))
      break;
    objc_msgSend(v3, "appendBytes:length:", &bytes, 1);
    if (!--v2)
    {
      v4 = v3;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:

  return v4;
}

- (BOOL)supportsBackgroundedClients
{
  return 1;
}

- (NIRangingAuthConfiguration)configuration
{
  return (NIRangingAuthConfiguration *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_secureRangingKey, 0);
  objc_storeStrong((id *)&self->_peerMacAddress, 0);
  objc_storeStrong((id *)&self->_peerToken, 0);
  objc_storeStrong((id *)&self->_localToken, 0);
  sub_10001AE68((uint64_t)&self->_caManager);
  sub_10001AE68((uint64_t)&self->_pbLogger);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  sub_10001AE68((uint64_t)&self->_wifiRangingSession);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
