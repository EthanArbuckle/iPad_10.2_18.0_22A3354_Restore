@implementation NIServerFindingRangingProvider

- (NIServerFindingRangingProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 consumer:(id)a5 queue:(id)a6 pbLogger:(shared_ptr<rose::protobuf::Logger>)a7
{
  uint64_t *ptr;
  _BOOL4 v9;
  id v12;
  id v13;
  NSObject *v14;
  char *v15;
  id *v16;
  NIServerFindingRangingProvider *v17;
  NSMutableDictionary *v18;
  PRRangingManagerClient *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  _BOOL4 v23;
  char v24;
  void *v25;
  uint64_t v26;
  PRRangingManagerClient *v27;
  NSDictionary *v28;
  NSDictionary *debugParameters;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;

  ptr = (uint64_t *)a7.__ptr_;
  v9 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
    __assert_rtn("-[NIServerFindingRangingProvider initWithIdentifier:isFinder:consumer:queue:pbLogger:]", "NIServerFindingRanging.mm", 3368, "consumer");
  v14 = (id)qword_10085F520;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = sub_1002B69E0(v9);
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] init", buf, 0xCu);
  }

  v31.receiver = self;
  v31.super_class = (Class)NIServerFindingRangingProvider;
  v15 = -[NIServerFindingRangingProvider init](&v31, "init");
  v16 = (id *)v15;
  v17 = (NIServerFindingRangingProvider *)v15;
  if (v15)
  {
    std::string::operator=((std::string *)(v15 + 8), (const std::string *)a3);
    LOBYTE(v17->_identifier.__r_.var0) = v9;
    BYTE1(v17->_identifier.__r_.var0) = 0;
    objc_storeWeak(v16 + 5, v12);
    objc_storeStrong(v16 + 6, a6);
    sub_100021C24(v16 + 7, ptr);
    LOBYTE(v17->_pbLogger.__ptr_) = 0;
    v18 = objc_opt_new(NSMutableDictionary);
    v19 = v17->_uwbSystemListener.__ptr_;
    v17->_uwbSystemListener.__ptr_ = (PRRangingManagerClient *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("UseTestNbammsMode"));

    v22 = qword_10085F520;
    v23 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#find-range,Using Test Nbamms MAC mode", buf, 2u);
      }
      v24 = 1;
    }
    else
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#find-range,Using POR Nbamms MAC mode", buf, 2u);
      }
      v24 = 0;
    }
    LOBYTE(v17->_uwbSystemListener.__cntrl_) = v24;
    -[NIServerFindingRangingProvider _setInitiator](v17, "_setInitiator");
    v25 = sub_100004784();
    if (sub_100395734((uint64_t)v25))
    {
      v26 = objc_claimAutoreleasedReturnValue(-[NIServerFindingRangingProvider _getDefaultNbammsRangingConfigParameters](v17, "_getDefaultNbammsRangingConfigParameters"));
      v27 = v17->_uwbSystemListener.__ptr_;
      v17->_uwbSystemListener.__ptr_ = (PRRangingManagerClient *)v26;

    }
    v28 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    debugParameters = v17->_debugParameters;
    v17->_debugParameters = v28;

  }
  return v17;
}

- (void)activate
{
  NSObject *v3;
  const char *v4;
  id WeakRetained;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_weak_owners;
  unint64_t v20;
  NSObject *v21;
  __shared_weak_count *v22;
  std::__shared_weak_count *v23;
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v25;
  NIServerFindingRangingProvider *v26;
  uint8_t buf[24];

  v26 = self;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!LOBYTE(self->_pbLogger.__ptr_))
  {
    v3 = (id)qword_10085F520;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] activate", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    if ((objc_opt_respondsToSelector(WeakRetained, "rangingBecameAvailable") & 1) != 0
      && (objc_opt_respondsToSelector(WeakRetained, "rangingBecameUnavailable") & 1) != 0)
    {
      v6 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-range,Consumer is listening for ranging availability", buf, 2u);
      }
      sub_10022E178(&v26, buf);
      sub_1000145E8((uint64_t)&v26->_pbLogger.__cntrl_, (__int128 *)buf);
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
      v10 = sub_1002CA108();
      v11 = *(std::__shared_weak_count **)&v26->_activated;
      cntrl = v26->_pbLogger.__cntrl_;
      v25 = v11;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
      }
      sub_1002CE308((uint64_t)v10, (unint64_t *)&cntrl);
      v14 = v25;
      if (v25)
      {
        v15 = (unint64_t *)&v25->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      v17 = sub_1002CA108();
      v18 = *(std::__shared_weak_count **)&v26->_activated;
      v22 = v26->_pbLogger.__cntrl_;
      v23 = v18;
      if (v18)
      {
        p_shared_weak_owners = (unint64_t *)&v18->__shared_weak_owners_;
        do
          v20 = __ldxr(p_shared_weak_owners);
        while (__stxr(v20 + 1, p_shared_weak_owners));
      }
      sub_1002CA79C((uint64_t)v17, (uint64_t *)&v22);
      if (v23)
        std::__shared_weak_count::__release_weak(v23);
    }
    else if ((objc_opt_respondsToSelector(WeakRetained, "rangingBecameAvailable") & 1) != 0
           || (objc_opt_respondsToSelector(WeakRetained, "rangingBecameUnavailable") & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003E05E0();
    }
    else
    {
      v21 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-range,Consumer is NOT listening for ranging availability", buf, 2u);
      }
    }
    LOBYTE(v26->_pbLogger.__ptr_) = 1;

  }
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-range,invalidate", buf, 2u);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_debugParameters, "allKeys"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v8);
        -[NIServerFindingRangingProvider _sendHangup:finderGone:findeeGone:token:](self, "_sendHangup:finderGone:findeeGone:token:", 1);
        -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  if (self->_pbLogger.__cntrl_)
  {
    v10 = sub_1002CA108();
    v11 = *(std::__shared_weak_count **)&self->_activated;
    cntrl = self->_pbLogger.__cntrl_;
    v18 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    sub_1002CE3E0((uint64_t)v10, (unint64_t *)&cntrl);
    v14 = v18;
    if (v18)
    {
      v15 = (unint64_t *)&v18->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    sub_100180AF4(&self->_pbLogger.__cntrl_);
  }
  LOBYTE(self->_pbLogger.__ptr_) = 0;

}

- (void)dealloc
{
  __shared_weak_count **p_cntrl;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  objc_super v11;
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v13;

  p_cntrl = &self->_pbLogger.__cntrl_;
  if (self->_pbLogger.__cntrl_)
  {
    v4 = sub_1002CA108();
    v5 = *(std::__shared_weak_count **)&self->_activated;
    cntrl = self->_pbLogger.__cntrl_;
    v13 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    sub_1002CE3E0((uint64_t)v4, (unint64_t *)&cntrl);
    v8 = v13;
    if (v13)
    {
      v9 = (unint64_t *)&v13->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    sub_100180AF4(p_cntrl);
  }
  v11.receiver = self;
  v11.super_class = (Class)NIServerFindingRangingProvider;
  -[NIServerFindingRangingProvider dealloc](&v11, "dealloc");
}

- (BOOL)canRangeWithPeer:(id)a3 technology:(int)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  _QWORD **v9;
  uint64_t v10;
  BOOL v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;

  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v6)
    __assert_rtn("-[NIServerFindingRangingProvider canRangeWithPeer:technology:]", "NIServerFindingRanging.mm", 3468, "token");
  if (!LOBYTE(self->_pbLogger.__ptr_))
    goto LABEL_16;
  if (a4 != 1)
  {
    v13 = (id)qword_10085F520;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      v21 = 136315138;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] Do not support UWB only based finding", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_16;
  }
  v7 = sub_100004784();
  v8 = sub_100395734((uint64_t)v7);
  v9 = (_QWORD **)sub_1002CA108();
  v10 = (*(unsigned int (**)(_QWORD *))(*v9[807] + 72))(v9[807]);
  if (v10 != 1 || !v8)
  {
    v15 = (id)qword_10085F520;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
      v21 = 136315650;
      v22 = v16;
      v23 = 1024;
      v24 = v8;
      v25 = 1024;
      v26 = v10 == 1;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] Can't range yet, UWB system not ready. Supports NMI: %d, state: %d", (uint8_t *)&v21, 0x18u);
    }

LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  if (-[NSDictionary count](self->_debugParameters, "count") >= 2)
  {
    if (!LOBYTE(self->_identifier.__r_.var0))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));

      if (!v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingNBAMMSSessionManager sharedInstance](NIServerFindingNBAMMSSessionManager, "sharedInstance"));
        objc_msgSend(v19, "logUnservableRangingRequestWithToken:isFinder:", v6, LOBYTE(self->_identifier.__r_.var0));

      }
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));
    v12 = v20 != 0;

  }
  else
  {
    v12 = 1;
  }
LABEL_17:

  return v12;
}

- (id)startRangingWithPeer:(id)a3 technology:(int)a4 peerAdvertisement:(id)a5 OOBRangingParameters:(const OOBRangingParameters *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  int v25;
  NIServerFindingRangingProviderPeerInfo *v26;
  uint64_t v27;
  void *v28;
  uint64_t var1;
  int var0;
  void *v32;
  uint8_t v33;
  unsigned int v34;
  NSObject *v35;
  int var0_low;
  unsigned int v37;
  id v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  unsigned int v42;
  _BYTE __dst[504];
  NSErrorUserInfoKey v44;
  const __CFString *v45;
  uint8_t buf[520];
  NSErrorUserInfoKey v47;
  const __CFString *v48;
  NSErrorUserInfoKey v49;
  const __CFString *v50;

  v10 = a3;
  v11 = a5;
  v12 = (id)qword_10085F520;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    *(_DWORD *)buf = 136315651;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = sub_1002B73E4(a4);
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] startRangingWithPeer: %{private}@. Technology: %s", buf, 0x20u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v10)
    __assert_rtn("-[NIServerFindingRangingProvider startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:]", "NIServerFindingRanging.mm", 3507, "token");
  if (!LOBYTE(self->_pbLogger.__ptr_))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E0618();
    v49 = NSLocalizedFailureReasonErrorKey;
    v50 = CFSTR("Ranging not activated");
    v26 = (NIServerFindingRangingProviderPeerInfo *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
    v27 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v26));
    goto LABEL_14;
  }
  if (a4 != 1)
  {
    v47 = NSLocalizedFailureReasonErrorKey;
    v48 = CFSTR("Specified technology not supported");
    v26 = (NIServerFindingRangingProviderPeerInfo *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
    v27 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v26));
LABEL_14:
    v28 = (void *)v27;
    goto LABEL_15;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
  v15 = v14 == 0;

  if (v15)
  {
    v26 = -[NIServerFindingRangingProviderPeerInfo initWithAdvertisement:]([NIServerFindingRangingProviderPeerInfo alloc], "initWithAdvertisement:", v11);
    -[NSDictionary setObject:forKey:](self->_debugParameters, "setObject:forKey:", v26, v10);
    if (LOBYTE(self->_uwbSystemListener.__cntrl_))
    {
      var1 = 0;
      var0 = 5;
    }
    else if ((sub_1002B7524() & 1) != 0)
    {
      var1 = 1;
      var0 = 2;
    }
    else
    {
      var0 = a6->var0;
      var1 = a6->var1;
    }
    if (LOBYTE(self->_uwbSystemListener.__cntrl_))
      v33 = 1;
    else
      v33 = 6;
    buf[0] = v33;
    *(_WORD *)&buf[1] = 0;
    *(_WORD *)&buf[4] = var0;
    buf[6] = 1;
    v42 = sub_10036C5B8(buf);
    v34 = objc_msgSend(v11, "protocolVersion");
    v35 = (id)qword_10085F520;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v41 = var1;
      var0_low = LOBYTE(self->_identifier.__r_.var0);
      v37 = objc_msgSend(v11, "protocolVersion");
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)&buf[4] = var0_low;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = var0;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v42;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = 1;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v37;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v34 != 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#find-range,startRangingWithPeer: isFinder = %d, NapChIdx = %d, NapBch = %d, selfProtoVer: %d, peerProtoVer: %d, sharedProtoVer: %d", buf, 0x26u);
      var1 = v41;
    }

    v38 = objc_msgSend(v11, "useCase");
    if (v34)
      v39 = 30;
    else
      v39 = 49;
    -[NIServerFindingRangingProvider _prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:](self, "_prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:", v10, 1, v38, var1, v42, v39);
    if (!buf[504])
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E0644();
      v44 = NSLocalizedFailureReasonErrorKey;
      v45 = CFSTR("Could not build ranging service request");
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v40));

      goto LABEL_15;
    }
    memcpy(__dst, buf, sizeof(__dst));
    v27 = objc_claimAutoreleasedReturnValue(-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:](self, "_triggerRanging:peerDiscoveryToken:technology:sharedProtocol:", __dst, v10, 1, v34 != 0));
    goto LABEL_14;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "advertisement"));
  v18 = objc_msgSend(v17, "isEqual:", v11);

  if ((v18 & 1) != 0)
    goto LABEL_24;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "advertisement"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
    v24 = objc_msgSend(v20, "isEqualToData:", v23);

    v25 = v24 ^ 1;
  }
  else
  {
    v25 = 0;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
  objc_msgSend(v32, "setAdvertisement:", v11);

  if (!v25)
  {
LABEL_24:
    v28 = 0;
    goto LABEL_16;
  }
  v26 = (NIServerFindingRangingProviderPeerInfo *)objc_claimAutoreleasedReturnValue(+[NIServerFindingNBAMMSSessionManager sharedInstance](NIServerFindingNBAMMSSessionManager, "sharedInstance"));
  -[NIServerFindingRangingProviderPeerInfo refreshRangingForToken:](v26, "refreshRangingForToken:", v10);
  v28 = 0;
LABEL_15:

LABEL_16:
  return v28;
}

- (id)stopRangingWithPeer:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    *(_DWORD *)buf = 136315395;
    v17 = v6;
    v18 = 2113;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] stopRangingWithPeer: %{private}@.", buf, 0x16u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v4)
    __assert_rtn("-[NIServerFindingRangingProvider stopRangingWithPeer:]", "NIServerFindingRanging.mm", 3604, "token");
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v4));
    v8 = v7 == 0;

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v4));
      v10 = v9 == 0;

      if (!v10)
      {
        -[NIServerFindingRangingProvider _sendHangup:finderGone:findeeGone:token:](self, "_sendHangup:finderGone:findeeGone:token:", 1);
        -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v4);
      }
    }
    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E0670();
    v14 = NSLocalizedFailureReasonErrorKey;
    v15 = CFSTR("Ranging not activated");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v12));

  }
  return v11;
}

- (void)setAlgorithmAidingData:(const void *)a3 forPeer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));
      objc_msgSend(v8, "setAlgorithmAidingData:", a3);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingNBAMMSSessionManager sharedInstance](NIServerFindingNBAMMSSessionManager, "sharedInstance"));
      objc_msgSend(v9, "updateAlgorithmAidingData:token:", a3, v6);

    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003E06C8();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E069C();
  }

}

- (void)setSignallingData:(const void *)a3 forPeer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));
      objc_msgSend(v8, "setSignallingData:", a3);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingNBAMMSSessionManager sharedInstance](NIServerFindingNBAMMSSessionManager, "sharedInstance"));
      objc_msgSend(v9, "updateSignallingData:token:", a3, v6);

    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003E0720();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E06F4();
  }

}

- (void)_resetRangingStateForToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptionInternal"));
      v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,Reset ranging state for token %@", (uint8_t *)&v8, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingNBAMMSSessionManager sharedInstance](NIServerFindingNBAMMSSessionManager, "sharedInstance"));
    objc_msgSend(v7, "unregisterNBAMMSSessionForToken:", v4);

    -[NSDictionary removeObjectForKey:](self->_debugParameters, "removeObjectForKey:", v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E074C();
  }

}

- (void)_sendHangup:(BOOL)a3 finderGone:(BOOL)a4 findeeGone:(BOOL)a5 token:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int16 v16;
  char v17;
  _DWORD *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t v23[16];
  uint8_t buf[8];
  __int16 v25;
  char v26;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("FindingDisableHangup"));

  if (!v12)
  {
    if (!v8 && !v7 && !v6)
      goto LABEL_25;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));

    if (!v14)
    {
LABEL_24:
      *(_QWORD *)buf = 250000000;
      std::this_thread::sleep_for ((const std::chrono::nanoseconds *)buf);
      goto LABEL_25;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
    *(_QWORD *)buf = objc_msgSend(v15, "getSignallingData");
    v25 = v16;
    v26 = v17;
    if ((v16 & 0xFF00) == 0)
    {
      v18 = sub_100004784();
      v19 = sub_1000069CC(v18[144]);
      *(_QWORD *)buf = 0;
      LOBYTE(v25) = v19;
      HIBYTE(v25) = 1;
    }
    if (v8)
    {
      v20 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-range,Setting hangup bit", v23, 2u);
      }
      *(_WORD *)buf = 257;
      if (!v7)
      {
LABEL_12:
        if (!v6)
        {
LABEL_23:
          -[NIServerFindingRangingProvider setSignallingData:forPeer:](self, "setSignallingData:forPeer:", buf, v10);

          goto LABEL_24;
        }
LABEL_20:
        v22 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#find-range,Setting findee_gone bit", v23, 2u);
        }
        *(_WORD *)&buf[4] = 257;
        goto LABEL_23;
      }
    }
    else if (!v7)
    {
      goto LABEL_12;
    }
    v21 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-range,Setting finder_gone bit", v23, 2u);
    }
    *(_WORD *)&buf[2] = 257;
    if (!v6)
      goto LABEL_23;
    goto LABEL_20;
  }
  v13 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Would set hangup bit, but it's disabled in defaults writes", buf, 2u);
  }
LABEL_25:

}

- (vector<rose::finding::Technology,)supportedTechnologies
{
  vector<rose::finding::Technology, std::allocator<rose::finding::Technology>> *result;
  void *v6;
  int *v7;
  int *end;
  uint64_t v9;
  int *v10;
  int *v11;
  int v12;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    v6 = sub_100004784();
    result = (vector<rose::finding::Technology, std::allocator<rose::finding::Technology>> *)sub_100395734((uint64_t)v6);
    if ((_DWORD)result)
    {
      v7 = (int *)sub_10003B05C((uint64_t)&retstr->__end_cap_, 1uLL);
      result = (vector<rose::finding::Technology, std::allocator<rose::finding::Technology>> *)retstr->__begin_;
      end = retstr->__end_;
      v10 = &v7[v9];
      *v7 = 1;
      v11 = v7 + 1;
      while (end != (int *)result)
      {
        v12 = *--end;
        *--v7 = v12;
      }
      retstr->__begin_ = v7;
      retstr->__end_ = v11;
      retstr->__end_cap_.__value_ = v10;
      if (result)
        operator delete(result);
      retstr->__end_ = v11;
    }
  }
  return result;
}

- (NSArray)rangingPeers
{
  void *v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_debugParameters, "allKeys"));
  else
    v3 = 0;
  return (NSArray *)v3;
}

- (void)setDebugParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  int v11;
  const char *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("useTestNbammsMode")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("useTestNbammsMode")));
      LOBYTE(self->_uwbSystemListener.__cntrl_) = objc_msgSend(v7, "BOOLValue");

      v8 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        if (LOBYTE(self->_uwbSystemListener.__cntrl_))
          v9 = "Y";
        else
          v9 = "N";
        v11 = 136315138;
        v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-range,Overriding value in _useTestNbammsMode with value provided by client = %s", (uint8_t *)&v11, 0xCu);
      }
      -[NIServerFindingRangingProvider _setInitiator](self, "_setInitiator");
    }
    -[NIServerFindingRangingProvider _assignDebugParametersIfAvailable:](self, "_assignDebugParametersIfAvailable:", v5);
    v10 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-range,Set debug config params", (uint8_t *)&v11, 2u);
    }
  }

}

- (int)rangingTriggerType
{
  return sub_1002B7524() ^ 1;
}

- (int)rangingAcquisitionType
{
  if ((sub_1002B7524() & 1) != 0)
    return 0;
  else
    return !-[NIServerFindingRangingProvider _doesWantTriggeredDutyCycledAcquisition](self, "_doesWantTriggeredDutyCycledAcquisition");
}

- (id)printableState
{
  void *v2;
  const char *v3;
  uint64_t ptr_low;
  uint64_t v5;
  uint64_t cntrl_low;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  float v14;
  float v15;
  uint64_t v16;
  unsigned __int16 v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  _QWORD **v24;
  int v25;
  void **v26;
  _QWORD **v27;
  uint64_t v28;
  std::string *p_p;
  void *v30;
  void *i;
  id v32;
  void *v33;
  void *v34;
  __int16 v35;
  char v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  int v42;
  std::string *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  PRRangingManagerClient *ptr;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  NSDictionary *obj;
  uint64_t v56;
  id v58;
  _QWORD v59[5];
  id v60;
  __int16 v61;
  char v62;
  void *v63[2];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  std::string __p;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  NSMutableArray *v85;
  _BYTE v86[128];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = sub_10022467C;
  v84 = sub_10022468C;
  v85 = objc_opt_new(NSMutableArray);
  v2 = (void *)v81[5];
  v3 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
  ptr_low = LOBYTE(self->_pbLogger.__ptr_);
  v5 = BYTE1(self->_identifier.__r_.var0);
  cntrl_low = LOBYTE(self->_uwbSystemListener.__cntrl_);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ranging provider (%s). Activated: %d. Initiator: %d. Test-NBAMMS: %d. FC3: %d"), v3, ptr_low, v5, cntrl_low, objc_msgSend(v7, "BOOLForKey:", CFSTR("FindingUseFC3"))));
  objc_msgSend(v2, "addObject:", v8);

  v9 = (void *)v81[5];
  v10 = -[NIServerFindingRangingProvider rangingTriggerType](self, "rangingTriggerType");
  v11 = -[NIServerFindingRangingProvider rangingAcquisitionType](self, "rangingAcquisitionType");
  v12 = -[NIServerFindingRangingProvider _doesWantTriggeredDutyCycledAcquisition](self, "_doesWantTriggeredDutyCycledAcquisition");
  v13 = -[NIServerFindingRangingProvider _getSchedulingIntervalForTriggeredDutyCycledAcquisition](self, "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
  -[NIServerFindingRangingProvider _getDutyCycleForTriggeredDutyCycledAcquisition](self, "_getDutyCycleForTriggeredDutyCycledAcquisition");
  v15 = v14;
  if ((unsigned __int16)-[NIServerFindingRangingProvider _getDitherConst](self, "_getDitherConst") >= 0x100u)
  {
    v17 = (unsigned __int16)-[NIServerFindingRangingProvider _getDitherConst](self, "_getDitherConst");
    if (v17 <= 0xFFu)
      sub_10000BA44();
    v16 = v17;
  }
  else
  {
    v16 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Trigger type: %d. Acquisition type: %d. Duty cycle: wants %d, interval %d us, listening %0.1f%%, ditherConst: %d"), v10, v11, v12, v13, v15, v16));
  objc_msgSend(v9, "addObject:", v18);

  v19 = (void *)v81[5];
  LODWORD(v18) = sub_1002B68D0(CFSTR("FindingUWBTotalTimeoutSecondsOverride"), 0x708u);
  v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Ranging watchdogs: total %d s, event %d ms"), v18, sub_1002B68D0(CFSTR("FindingUWBEventWatchdogTimeoutMillisecondsOverride"), 0x7D0u));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v19, "addObject:", v21);

  v22 = (void *)v81[5];
  v23 = self->_pbLogger.__cntrl_ != 0;
  v24 = (_QWORD **)sub_1002CA108();
  v25 = (*(uint64_t (**)(_QWORD *))(*v24[807] + 72))(v24[807]);
  v26 = v63;
  sub_10000BF04(v63, off_10080FC78[v25]);
  if (SBYTE7(v64) < 0)
    v26 = (void **)v63[0];
  v27 = (_QWORD **)sub_1002CA108();
  v28 = (*(uint64_t (**)(_QWORD *))(*v27[807] + 72))(v27[807]);
  sub_10000BF04(&__p, off_10080FCA0[v28 >> 32]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    System listener: %d. State: %s. Cause: %s"), v23, v26, p_p));
  objc_msgSend(v22, "addObject:", v30);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SBYTE7(v64) < 0)
    operator delete(v63[0]);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = self->_debugParameters;
  v58 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
  if (v58)
  {
    v56 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v58; i = (char *)i + 1)
      {
        if (*(_QWORD *)v76 != v56)
          objc_enumerationMutation(obj);
        v32 = *(id *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_debugParameters, "objectForKeyedSubscript:", v32));
        v34 = v33;
        if (v33)
        {
          objc_msgSend(v33, "getAlgorithmAidingData");
        }
        else
        {
          v74 = 0;
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          *(_OWORD *)v63 = 0u;
        }
        v60 = objc_msgSend(v34, "getSignallingData");
        v61 = v35;
        v62 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "advertisement"));
        v38 = objc_msgSend(v34, "getRangingActive");
        v39 = (void *)v81[5];
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "descriptionInternal"));
        v41 = v74;
        v42 = HIBYTE(v61);
        if (HIBYTE(v61))
        {
          sub_10021E7B0(&v60, &__p);
          v43 = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v43 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        else
        {
          v43 = (std::string *)"0";
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Peer: %@. NBAMMS active: %d. Aiding: %d. Signalling: %s"), v40, v38, v41, v43));
        objc_msgSend(v39, "addObject:", v44);

        if (v42 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);

        v45 = (void *)v81[5];
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Adv: %@"), v37));
        objc_msgSend(v45, "addObject:", v46);

      }
      v58 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    }
    while (v58);
  }

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v47 = (void *)v81[5];
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Debug params (%d)"), -[PRRangingManagerClient count](self->_uwbSystemListener.__ptr_, "count")));
    objc_msgSend(v47, "addObject:", v48);

    ptr = self->_uwbSystemListener.__ptr_;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100228BC8;
    v59[3] = &unk_10080F5C0;
    v59[4] = &v80;
    -[PRRangingManagerClient enumerateKeysAndObjectsUsingBlock:](ptr, "enumerateKeysAndObjectsUsingBlock:", v59);
  }
  v50 = (void *)v81[5];
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingNBAMMSSessionManager sharedInstance](NIServerFindingNBAMMSSessionManager, "sharedInstance"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "printableState"));
  objc_msgSend(v50, "addObjectsFromArray:", v52);

  v53 = (id)v81[5];
  _Block_object_dispose(&v80, 8);

  return v53;
}

- (id)clientQueue
{
  return *(id *)&self->_isFinder;
}

- (void)didReceiveNewNbammsSolution:(const void *)a3 token:(id)a4
{
  id v6;
  id WeakRetained;

  v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    objc_msgSend(WeakRetained, "didRangeWithPeer:newSolution:", v6, a3);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E0778();
  }

}

- (void)didReceiveUnsuccessfulNbammsSolution:(const void *)a3 token:(id)a4
{
  id v6;
  id WeakRetained;

  v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    objc_msgSend(WeakRetained, "didAttemptRangingWithPeer:unsuccessfulSolution:", v6, a3);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E07A4();
  }

}

- (void)didReceiveNbammsSessionStatusUpdate:(const ServiceRequestStatusUpdate *)a3 token:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  int v9;
  void **v10;
  void **v11;
  void **v12;
  id WeakRetained;
  void *__p[2];
  char v15;
  void *v16[2];
  char v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void **v21;
  __int16 v22;
  void **v23;

  v6 = a4;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    sub_10000BF04(v16, off_10080FB60[a3->var1]);
    v9 = v17;
    v10 = (void **)v16[0];
    sub_10000BF04(__p, off_10080FBD8[a3->var2]);
    v11 = v16;
    if (v9 < 0)
      v11 = v10;
    if (v15 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    *(_DWORD *)buf = 136315650;
    v19 = v8;
    v20 = 2080;
    v21 = v11;
    v22 = 2080;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] serviceRequestDidUpdateStatus. Type: %s. Reason: %s", buf, 0x20u);
    if (v15 < 0)
      operator delete(__p[0]);
    if (v17 < 0)
      operator delete(v16[0]);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    if (a3->var2 == 8)
    {
      -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v6);
      WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
      objc_msgSend(WeakRetained, "didStopRangingWithPeer:", v6);

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E07D0();
  }

}

- (void)didReceiveNbammsPeerAlgorithmAidingData:(const void *)a3 signallingData:(const void *)a4 token:(id)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;

  v8 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (LOBYTE(self->_pbLogger.__ptr_))
    {
      objc_msgSend(WeakRetained, "didReceiveRangingDataForPeer:algorithmAidingData:signallingData:", v8, a3, a4);
      if (!LOBYTE(self->_identifier.__r_.var0))
        goto LABEL_21;
      if (*((_BYTE *)a4 + 5) && *((_BYTE *)a4 + 4))
      {
        v11 = (id)qword_10085F520;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "descriptionInternal"));
          v15 = 138412290;
          v16 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-range,Received findee_gone signal for token %@", (uint8_t *)&v15, 0xCu);

        }
        -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v8);
        objc_msgSend(v10, "didStopRangingWithPeer:", v8);
        if (!LOBYTE(self->_identifier.__r_.var0))
        {
LABEL_21:
          if (*((_BYTE *)a4 + 3) && *((_BYTE *)a4 + 2))
          {
            v13 = (id)qword_10085F520;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "descriptionInternal"));
              v15 = 138412290;
              v16 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Received finder_gone signal for token %@", (uint8_t *)&v15, 0xCu);

            }
            -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v8);
            objc_msgSend(v10, "didStopRangingWithPeer:", v8);
          }
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003E0828();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E07FC();
  }

}

- (void)didInvalidateNbammsSessionWithReason:(int)a3 token:(id)a4
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  _QWORD v9[3];

  v6 = a4;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    sub_1002B48E0(a3, v9);
    sub_1003E0880();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    objc_msgSend(WeakRetained, "didStopRangingWithPeer:", v6);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E0854();
  }

}

- (void)didFailCryptoWithToken:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  id WeakRetained;
  uint64_t v8;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    sub_1003E08F0((uint64_t)v6, (uint64_t)&v8, v5);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    objc_msgSend(WeakRetained, "didRangingAuthorizationFailForPeer:", v4);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E08C4();
  }

}

- (void)didFailMutualAuthWithToken:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  id WeakRetained;
  uint64_t v8;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    sub_1003E0958((uint64_t)v6, (uint64_t)&v8, v5);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    objc_msgSend(WeakRetained, "didRangingAuthorizationFailForPeer:", v4);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E092C();
  }

}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  NSObject *v7;
  const char *v8;
  int v9;
  void **v10;
  void **v11;
  void **v12;
  id WeakRetained;
  void *v14;
  NSObject *v15;
  const char *v16;
  int v17;
  _QWORD block[5];
  id v19;
  int v20;
  void *__p[2];
  char v22;
  void *v23[2];
  char v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void **v28;
  __int16 v29;
  void **v30;

  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_1002B69E0(LOBYTE(self->_identifier.__r_.var0));
    sub_10000BF04(v23, off_10080FC78[a3]);
    v9 = v24;
    v10 = (void **)v23[0];
    sub_10000BF04(__p, off_10080FCA0[a4]);
    v11 = v23;
    if (v9 < 0)
      v11 = v10;
    if (v22 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    *(_DWORD *)buf = 136315650;
    v26 = v8;
    v27 = 2080;
    v28 = v11;
    v29 = 2080;
    v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] Ranging service updated state: %s. Cause: %s", buf, 0x20u);
    if (v22 < 0)
      operator delete(__p[0]);
    if (v24 < 0)
      operator delete(v23[0]);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
  v14 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector(WeakRetained, "rangingBecameAvailable") & 1) != 0)
    {
      if ((objc_opt_respondsToSelector(v14, "rangingBecameUnavailable") & 1) != 0)
      {
        v15 = *(NSObject **)&self->_isFinder;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100229818;
        block[3] = &unk_10080F4A8;
        block[4] = self;
        v20 = a3;
        v19 = v14;
        dispatch_async(v15, block);

        goto LABEL_17;
      }
      v16 = "[sConsumer respondsToSelector:@selector(rangingBecameUnavailable)]";
      v17 = 4015;
    }
    else
    {
      v16 = "[sConsumer respondsToSelector:@selector(rangingBecameAvailable)]";
      v17 = 4014;
    }
    __assert_rtn("-[NIServerFindingRangingProvider rangingServiceDidUpdateState:cause:]", "NIServerFindingRanging.mm", v17, v16);
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E07FC();
LABEL_17:

}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v16;
  _BOOL4 v17;
  optional<rose::RoseServiceRequest> *result;
  id v19;

  v9 = *(_QWORD *)&a9;
  v10 = a8;
  v11 = a7;
  v12 = *(_QWORD *)&a6;
  v19 = a4;
  if (!v19)
    __assert_rtn("-[NIServerFindingRangingProvider _prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:]", "NIServerFindingRanging.mm", 4061, "token");
  v16 = sub_100004784();
  v17 = !sub_100395734((uint64_t)v16);
  if (a5 != 1)
    LOBYTE(v17) = 1;
  if (v17)
  {
    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }
  else
  {
    -[NIServerFindingRangingProvider _prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:](self, "_prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:", v19, 1, v12, v11, v10, v9);
  }

  return result;
}

- (optional<rose::RoseServiceRequest>)_prepareNbammsServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8
{
  char v9;
  __int16 v11;
  PRRangingManagerClient *ptr;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unsigned int v67;
  void *v68;
  void *v69;
  id v70;
  int cntrl_low;
  NSObject *v72;
  _BOOL4 v73;
  NSObject *v74;
  unsigned int v75;
  NSObject *v76;
  char *v77;
  uint8_t *v78;
  int v79;
  __int16 v80;
  NSObject *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  optional<rose::RoseServiceRequest> *result;
  optional<rose::RoseServiceRequest> *__dst;
  _BYTE *__dsta;
  id v90;
  uint8_t buf[8];
  char v92;
  uint8_t v93[4];
  uint8_t *v94;
  int v95;
  unsigned __int16 v96;
  char v97;
  unsigned __int16 v98;
  char v99;
  uint64_t v100;
  char v101;
  unsigned __int16 v102;
  char v103;
  uint64_t v104;
  char v105;
  _BYTE v106[7];
  unsigned __int8 v107;
  int v108;
  char v109;
  unsigned __int16 v110;
  char v111;
  int v112;
  __int16 v113;
  unsigned __int8 v114;
  unsigned int v115;
  char v116;
  __int16 v117;
  char v118;
  unint64_t v119;
  char v120;
  __int128 v121;
  int v122;

  v9 = a9;
  v11 = a7;
  __dst = retstr;
  v90 = a4;
  if (!v90)
    __assert_rtn("-[NIServerFindingRangingProvider _prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:]", "NIServerFindingRanging.mm", 4084, "token");
  v97 = 0;
  LOBYTE(v102) = 0;
  v103 = 0;
  v105 = 0;
  v95 = 0;
  LOBYTE(v96) = 0;
  LODWORD(v100) = 0;
  *(_DWORD *)((char *)&v100 + 3) = 0;
  LODWORD(v104) = 0;
  *(_DWORD *)((char *)&v104 + 3) = 0x10000;
  memset(v106, 0, sizeof(v106));
  v107 = 1;
  LOBYTE(v110) = 0;
  v111 = 0;
  v108 = 0;
  v109 = 0;
  v112 = 0;
  v114 = 1;
  LOBYTE(v115) = 0;
  v116 = 0;
  LOBYTE(v117) = 0;
  v118 = 0;
  LOBYTE(v119) = 0;
  v120 = 0;
  v121 = 0uLL;
  v113 = v11 | 0x100;
  HIWORD(v100) = 1796;
  v101 = 1;
  v98 = a8;
  v99 = 1;
  BYTE4(v104) = 4 * v9;
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", CFSTR("nbTxAntenna")));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbTxAntenna")));
      LOWORD(v95) = objc_msgSend(v16, "intValue") | 0x100;

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbRxAntenna"), __dst));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbRxAntenna")));
      HIWORD(v95) = objc_msgSend(v18, "intValue") | 0x100;

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbPacketType")));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbPacketType")));
      v96 = (unsigned __int16)objc_msgSend(v20, "intValue");
      v97 = 1;

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbBandChannel")));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbBandChannel")));
      v98 = (unsigned __int16)objc_msgSend(v22, "intValue");
      v99 = 1;

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsTxAntenna")));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsTxAntenna")));
      LOWORD(v100) = objc_msgSend(v24, "intValue") | 0x100;

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsRxAntenna")));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsRxAntenna")));
      WORD1(v100) = objc_msgSend(v26, "intValue") | 0x100;

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsRxSyncAntenna")));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsRxSyncAntenna")));
      WORD2(v100) = objc_msgSend(v28, "intValue") | 0x100;

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsPacketType")));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsPacketType")));
      HIWORD(v100) = (unsigned __int16)objc_msgSend(v30, "intValue");
      v101 = 1;

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsBandChannel")));

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsBandChannel")));
      v102 = (unsigned __int16)objc_msgSend(v32, "intValue");
      v103 = 1;

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbSlotSize")));

    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbSlotSize")));
      WORD1(v104) = objc_msgSend(v34, "intValue") | 0x100;

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsSlotSize")));

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsSlotSize")));
      WORD2(v104) = objc_msgSend(v36, "intValue") | 0x100;

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsNumFragments")));

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsNumFragments")));
      LOWORD(v104) = objc_msgSend(v38, "intValue") | 0x100;

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("interval")));

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("interval")));
      HIWORD(v104) = (unsigned __int16)objc_msgSend(v40, "intValue");
      v105 = 1;

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("enableNonInterlacedMMS")));

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("enableNonInterlacedMMS")));
      v106[6] = objc_msgSend(v42, "BOOLValue");

    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("enableAntennaDiversity")));

    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("enableAntennaDiversity")));
      v107 = objc_msgSend(v44, "BOOLValue");

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("useDedicatedAntennas")));

    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("useDedicatedAntennas")));
      BYTE1(v108) = objc_msgSend(v46, "BOOLValue");

    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("overrideDefaultAntenna")));

    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("overrideDefaultAntenna")));
      BYTE2(v108) = objc_msgSend(v48, "BOOLValue");

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbChannelSelectionMask")));

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("nbChannelSelectionMask")));
      v111 = 1;
      v110 = (unsigned __int16)objc_msgSend(v50, "intValue");

    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("napSlotSize")));

    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("napSlotSize")));
      BYTE1(v112) = 1;
      LOBYTE(v112) = objc_msgSend(v52, "intValue");

    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("dataSlotSize")));

    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("dataSlotSize")));
      HIBYTE(v112) = 1;
      BYTE2(v112) = objc_msgSend(v54, "intValue");

    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("useType2Addr")));

    if (v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("useType2Addr")));
      v114 = objc_msgSend(v56, "BOOLValue");

    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("antennaDiversityMask")));

    if (v57)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("antennaDiversityMask")));
      HIBYTE(v108) = objc_msgSend(v58, "intValue");

    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsPSR")));

    if (v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsPSR")));
      *(_WORD *)v106 = objc_msgSend(v60, "intValue") | 0x100;

    }
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsGap")));

    if (v61)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsGap")));
      *(_WORD *)&v106[2] = objc_msgSend(v62, "intValue") | 0x100;

    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsSeqIdx")));

    if (v63)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](self->_uwbSystemListener.__ptr_, "objectForKey:", CFSTR("mmsSeqIdx")));
      *(_WORD *)&v106[4] = objc_msgSend(v64, "intValue") | 0x100;

    }
  }
  v65 = sub_100004784();
  LOBYTE(v108) = sub_100395798((uint64_t)v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v67 = objc_msgSend(v66, "BOOLForKey:", CFSTR("DisableDualRxChain"));

  if (v67)
    LOBYTE(v108) = 0;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "getIRK", __dst));
  v69 = v68;
  if (v68)
  {
    if (objc_msgSend(v68, "length") != (id)16)
      __assert_rtn("-[NIServerFindingRangingProvider _prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:]", "NIServerFindingRanging.mm", 4215, "[IRK length] == kNbammsIRKLengthBytes");
    v70 = objc_retainAutorelease(v69);
    v121 = *(_OWORD *)objc_msgSend(v70, "bytes");
    v119 = -[NIServerFindingRangingProvider _macAddressForIRK:](self, "_macAddressForIRK:", v70);
    v120 = 1;
    cntrl_low = LOBYTE(self->_uwbSystemListener.__cntrl_);
    v72 = (id)qword_10085F520;
    v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
    if (cntrl_low)
    {
      if (v73)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "#find-range,UseTestNbammsMode enabled", buf, 2u);
      }

      v109 = 1;
      if (!v118)
        v118 = 1;
      v117 = 4864;
      goto LABEL_89;
    }
    if (v73)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "#find-range,UseTestNbammsMode NOT enabled", buf, 2u);
    }

    v109 = 0;
    v75 = -[NIServerFindingRangingProvider rangingAcquisitionType](self, "rangingAcquisitionType");
    v76 = (id)qword_10085F520;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = v75 ? "BTAidedAcquisition" : "DirectAcquisition";
      sub_10000BF04(buf, v77);
      v78 = v92 >= 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)v93 = 136315138;
      v94 = v78;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "#find-range,ranging acquisition type = %s", v93, 0xCu);
      if (v92 < 0)
        operator delete(*(void **)buf);
    }

    if (v75 == 1)
    {
      v79 = sub_1002B66E4(0);
      if (v79 == 19)
      {
        v80 = 4865;
        if (v118)
          goto LABEL_84;
        goto LABEL_83;
      }
      if (v79 != 26)
      {
LABEL_85:
        v81 = (id)qword_10085F520;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          if (!v118)
            sub_10000BA44();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v117;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "#find-range,Host config usesBLEAdvToTriggerRanging %d", buf, 8u);
        }

LABEL_89:
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKey:", CFSTR("FindingMMSPacketTypeConfigIndex")));

        if (v83)
        {
          v85 = objc_opt_class(NSNumber, v84);
          if ((objc_opt_isKindOfClass(v83, v85) & 1) != 0)
          {
            v115 = objc_msgSend(v83, "intValue");
            v116 = 1;
          }
        }
        if (a6)
          v86 = 10;
        else
          v86 = 9;
        v122 = v86;
        sub_1001650A4((char *)&v95, BYTE1(self->_identifier.__r_.var0) ^ 1, (uint64_t)buf);
        operator new();
      }
    }
    else if (v75)
    {
      goto LABEL_85;
    }
    v80 = 4864;
    if (v118)
    {
LABEL_84:
      v117 = v80;
      goto LABEL_85;
    }
LABEL_83:
    v118 = 1;
    goto LABEL_84;
  }
  v74 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "#find-range,Discovery token doesn't contain valid IRK", buf, 2u);
  }
  *__dsta = 0;
  __dsta[504] = 0;

  return result;
}

- (id)_triggerRanging:(RoseServiceRequest *)a3 peerDiscoveryToken:(id)a4 technology:(int)a5 sharedProtocol:(int)a6
{
  id v10;
  void *v11;
  PRRangingManagerClient *ptr;
  void *v13;
  void *v14;
  uint64_t v15;
  float v16;
  float v17;
  double v18;
  float v19;
  float v20;
  unsigned __int8 v21;
  int v22;
  float v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int16 v28;
  int v29;
  NSObject *v30;
  unsigned __int8 v31;
  NSObject *v32;
  __int16 v33;
  int v34;
  unsigned int v35;
  NSObject *v36;
  char *v37;
  void **v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _BOOL8 v45;
  id WeakRetained;
  uint8_t *v47;
  NSDictionary *debugParameters;
  id v49;
  void *v50;
  void *v51;
  void *v53;
  int v54;
  id v55;
  unsigned int v56;
  float v57;
  unsigned int v58;
  void *__p[2];
  char v60;
  NSErrorUserInfoKey v61;
  const __CFString *v62;
  uint8_t v63[4];
  void **v64;
  int v65;
  char v66;
  __int16 v67;
  char v68;
  int v69;
  __int16 v70;
  char v71;
  char v72;
  uint64_t v73;
  char v74;
  unsigned int v75;
  int v76;
  float v77;
  uint64_t v78;
  __int16 v79;
  int v80;
  _WORD v81[12];
  __int16 v82;
  uint8_t buf[4];
  int v84;
  __int16 v85;
  _BYTE v86[14];
  char v87;
  uint64_t v88;
  char v89;
  unsigned int v90;
  int v91;
  float v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  uint64_t v96;
  _WORD v97[7];
  NSErrorUserInfoKey v98;
  const __CFString *v99;
  NSErrorUserInfoKey v100;
  const __CFString *v101;

  v10 = a4;
  if (!v10)
    __assert_rtn("-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]", "NIServerFindingRanging.mm", 4310, "token");
  if (a5 == 1)
  {
    v11 = sub_100004784();
    if (sub_100395734((uint64_t)v11))
    {
      v58 = 10000000;
      ptr = self->_uwbSystemListener.__ptr_;
      if (ptr)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", CFSTR("startTimeUncertainty")));
        v14 = v13;
        if (v13)
          v58 = objc_msgSend(v13, "intValue");

      }
      v15 = -[NIServerFindingRangingProvider _getSchedulingIntervalForTriggeredDutyCycledAcquisition](self, "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
      -[NIServerFindingRangingProvider _getDutyCycleForTriggeredDutyCycledAcquisition](self, "_getDutyCycleForTriggeredDutyCycledAcquisition");
      v17 = v16;
      v55 = -[NIServerFindingRangingProvider _getFindingSecondarySchedulingParameters](self, "_getFindingSecondarySchedulingParameters");
      v57 = v19;
      v20 = v19;
      v22 = v21;
      if ((_DWORD)v15)
      {
        if (v17 <= 1.0)
        {
          *(float *)&v18 = v17;
          -[NIServerFindingRangingProvider _adjustDutyCycleForInterfaceDelays:schedulingInterval:](self, "_adjustDutyCycleForInterfaceDelays:schedulingInterval:", v15, v18);
          v17 = v23;
          if (v22)
          {
            v24 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#find-range,Requested backoff acquisition policy, processing secondary scheduling parameters", buf, 2u);
            }
            if (v17 >= v20)
            {
              v22 = 1;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                sub_1003E09E8();
              v22 = 0;
            }
          }
        }
      }
      if (BYTE1(self->_identifier.__r_.var0))
      {
        v28 = (unsigned __int16)-[NIServerFindingRangingProvider _getDitherConst](self, "_getDitherConst");
        v29 = HIBYTE(v28);
      }
      else
      {
        LOBYTE(v28) = 0;
        v29 = 0;
      }
      v30 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        if (v29)
          v31 = v28;
        else
          v31 = 0;
        v84 = v15;
        v85 = 2048;
        *(double *)v86 = v17;
        *(_WORD *)&v86[8] = 1024;
        *(_DWORD *)&v86[10] = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#find-range,Primary scheduling params: Interval(us)=%d, Duty Cycle=%f, Dither const=%d", buf, 0x18u);
      }
      if (v22)
      {
        v32 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          v84 = (int)v55;
          v85 = 1024;
          *(_DWORD *)v86 = HIDWORD(v55);
          *(_WORD *)&v86[4] = 2048;
          *(double *)&v86[6] = v20;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#find-range,Secondary scheduling params: Delay(us)=%d, Interval(us)=%d, Duty Cycle=%f", buf, 0x18u);
        }
      }
      buf[0] = 0;
      v87 = 0;
      v33 = v28 | (unsigned __int16)((_WORD)v29 << 8);
      v88 = 17000;
      v89 = 1;
      v90 = v58;
      v91 = v15;
      v92 = v17;
      v93 = 0;
      v94 = v33;
      v95 = 0;
      memset(v97, 0, sizeof(v97));
      v96 = 0;
      if (!BYTE2(a3->range_enable_params.fira.local_addr.var0.__val_))
        __assert_rtn("-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]", "NIServerFindingRanging.mm", 4375, "serviceRequest.range_enable_params.nbamms.nb_bch.has_value()");
      v34 = LOWORD(a3->range_enable_params.fira.local_addr.var0.__val_) | 0x10000;
      v70 = 0;
      v69 = 0;
      v65 = 2;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v71 = 1;
      v72 = 1;
      v73 = 17000;
      v74 = 1;
      v75 = v58;
      v76 = v15;
      v77 = v17;
      v78 = 0;
      v79 = v33;
      v54 = v34;
      v80 = v34;
      memset(v81, 0, sizeof(v81));
      v82 = 0;
      v35 = -[NIServerFindingRangingProvider rangingAcquisitionType](self, "rangingAcquisitionType");
      v56 = a6;
      v36 = (id)qword_10085F520;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = v35 ? "BTAidedAcquisition" : "DirectAcquisition";
        sub_10000BF04(__p, v37);
        v38 = v60 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)v63 = 136315138;
        v64 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#find-range,ranging acquisition type = %s", v63, 0xCu);
        if (v60 < 0)
          operator delete(__p[0]);
      }

      if (v35 == 1)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
        v41 = v40;
        if (!v40)
        {
          v61 = NSLocalizedFailureReasonErrorKey;
          v62 = CFSTR("Advertisement is missing for specified token");
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v53));

          goto LABEL_57;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "advertisement"));
        v43 = objc_msgSend(v42, "address");
        v65 = 2;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = (int)v43;
        v70 = WORD2(v43);
        v71 = 1;
        v72 = 1;
        v73 = 17000;
        v74 = 1;
        v75 = v58;
        v76 = v15;
        v77 = v17;
        v78 = 0;
        v79 = v33;
        v80 = v54;
        memset(v81, 0, sizeof(v81));
        v82 = 0;

      }
      else if (!v35 && v22)
      {
        v39 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(__p[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#find-range,Resetting NBAMMSStartOptions", (uint8_t *)__p, 2u);
        }
        v70 = 0;
        v69 = 0;
        v65 = 2;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v71 = 1;
        v72 = 1;
        v73 = 17000;
        v74 = 1;
        v75 = v58;
        v76 = v15;
        v77 = v17;
        v78 = 0;
        v79 = v33;
        v80 = v54;
        v81[0] = 0;
        *(_QWORD *)&v81[1] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | v55;
        *(_QWORD *)&v81[5] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | HIDWORD(v55);
        *(float *)&v81[9] = v57;
        LOBYTE(v81[11]) = 1;
      }
      objc_initWeak(__p, self);
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindingNBAMMSSessionManager sharedInstance](NIServerFindingNBAMMSSessionManager, "sharedInstance"));
      v45 = LOBYTE(self->_identifier.__r_.var0) != 0;
      WeakRetained = objc_loadWeakRetained(__p);
      if (LOBYTE(self->_uwbSystemListener.__cntrl_))
        v47 = buf;
      else
        v47 = (uint8_t *)&v65;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "registerNBAMMSSessionWithToken:isFinder:client:serviceRequest:startRangingOptions:sharedProtocol:", v10, v45, WeakRetained, a3, v47, v56));

      debugParameters = self->_debugParameters;
      if (v26)
      {
        -[NSDictionary removeObjectForKey:](debugParameters, "removeObjectForKey:", v10);
        v49 = v26;
      }
      else
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](debugParameters, "objectForKey:", v10));
        if (!v50)
          __assert_rtn("-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]", "NIServerFindingRanging.mm", 4423, "[_trackingPeers objectForKey:token] != nil");

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
        objc_msgSend(v51, "setRangingActive:", 1);

      }
      objc_destroyWeak(__p);
    }
    else
    {
      v98 = NSLocalizedFailureReasonErrorKey;
      v99 = CFSTR("Device does not support specified technology");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v27));

    }
  }
  else
  {
    v100 = NSLocalizedFailureReasonErrorKey;
    v101 = CFSTR("Specified technology not supported");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v25));

  }
LABEL_57:

  return v26;
}

- (BOOL)_doesWantTriggeredDutyCycledAcquisition
{
  unsigned int v3;
  float v4;

  v3 = -[NIServerFindingRangingProvider _getSchedulingIntervalForTriggeredDutyCycledAcquisition](self, "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
  -[NIServerFindingRangingProvider _getDutyCycleForTriggeredDutyCycledAcquisition](self, "_getDutyCycleForTriggeredDutyCycledAcquisition");
  return v4 <= 1.0 && v3 != 0;
}

- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition
{
  int v3;
  void *v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  PRRangingManagerClient *ptr;
  void *v13;
  void *v14;

  v3 = BYTE1(self->_identifier.__r_.var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("FindingDisableDutyCycledAcquisition"));
  if (v3)
    v6 = 30000;
  else
    v6 = 29000;

  if (v5)
    v7 = 0;
  else
    v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("FindingSchedulingInterval")));

  if (v9)
  {
    v11 = objc_opt_class(NSNumber, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      v7 = objc_msgSend(v9, "intValue");
  }
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", CFSTR("schedulingInterval")));
    v14 = v13;
    if (v13)
      v7 = objc_msgSend(v13, "intValue");

  }
  return v7;
}

- (float)_getDutyCycleForTriggeredDutyCycledAcquisition
{
  int v3;
  void *v4;
  unsigned int v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  PRRangingManagerClient *ptr;
  void *v14;
  void *v15;
  float v16;

  v3 = BYTE1(self->_identifier.__r_.var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("FindingDisableDutyCycledAcquisition"));
  v6 = 0.0;
  if (v3)
    v7 = 0.0;
  else
    v7 = 0.1034;

  if (!v5)
    v6 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("FindingDutyCycle")));

  if (v9)
  {
    v11 = objc_opt_class(NSNumber, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      v6 = v12;
    }
  }
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", CFSTR("dutyCycle")));
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "floatValue");
      v6 = v16;
    }

  }
  return v6;
}

- (float)_adjustDutyCycleForInterfaceDelays:(float)a3 schedulingInterval:(unsigned int)a4
{
  float v5;
  NSObject *v6;
  uint8_t v8[16];

  v5 = (float)((unint64_t)(a4 - 17000) - 2000);
  if ((float)((float)a4 * a3) > v5)
  {
    v6 = qword_10085F520;
    a3 = v5 / (float)a4;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-range,Provided duty cycle leads to scan window > scheduling interval - (start time offset + interface delays), using entire available scan window", v8, 2u);
    }
  }
  return a3;
}

- (optional<unsigned)_getDitherConst
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  _BOOL4 v6;
  __int16 v7;
  unsigned __int8 v8;
  const char *v9;
  uint8_t *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  PRRangingManagerClient *ptr;
  void *v17;
  void *v18;
  __int16 v20;
  uint8_t buf[2];

  if (BYTE1(self->_identifier.__r_.var0))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("FindingDisableDitheredAcq"));

    if (v4)
    {
      v5 = qword_10085F520;
      v6 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
      v7 = 0;
      v8 = 0;
      if (v6)
      {
        v20 = 0;
        v9 = "#find-range,Dithered duty cycled acquisition is disabled using defaults write";
        v10 = (uint8_t *)&v20;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
        v7 = 0;
        v8 = 0;
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("FindingDitherConst")));

      if (v13 && (v15 = objc_opt_class(NSNumber, v14), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
        v8 = objc_msgSend(v13, "intValue");
      else
        v8 = 10;
      ptr = self->_uwbSystemListener.__ptr_;
      if (ptr)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", CFSTR("ditherConst")));
        v18 = v17;
        if (v17)
          v8 = objc_msgSend(v17, "intValue");

      }
      v7 = 1;
    }
  }
  else
  {
    v5 = qword_10085F520;
    v11 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
    v7 = 0;
    v8 = 0;
    if (v11)
    {
      *(_WORD *)buf = 0;
      v9 = "#find-range,Dithered duty cycled acquisition not valid for responder";
      v10 = buf;
      goto LABEL_7;
    }
  }
  return (optional<unsigned char>)(v8 | (unsigned __int16)(v7 << 8));
}

- (optional<SecondarySchedulingParameters>)_getFindingSecondarySchedulingParameters
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  const mach_header_64 *v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  PRRangingManagerClient *ptr;
  void *v19;
  void *v20;
  BOOL v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  int v28;
  PRRangingManagerClient *v29;
  void *v30;
  void *v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  float v38;
  uint64_t v39;
  int v40;
  PRRangingManagerClient *v41;
  void *v42;
  void *v43;
  float v44;
  BOOL v46;
  unsigned int v47;
  unsigned int v48;
  optional<SecondarySchedulingParameters> result;

  if (BYTE1(self->_identifier.__r_.var0))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E0A14();
    goto LABEL_5;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("FindingDisableDutyCycledAcquisition"));

  if ((v4 & 1) != 0)
  {
LABEL_5:
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("FindingSecondarySchedulingDelay")));

  if (v13 && (v15 = objc_opt_class(NSNumber, v14), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
  {
    v16 = objc_msgSend(v13, "intValue");
    v17 = 1;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", CFSTR("secondarySchedulingDelay")));
    v20 = v19;
    if (v19)
    {
      v16 = objc_msgSend(v19, "intValue");
      v17 = 1;
    }

  }
  if (v16)
    v21 = v17 == 0;
  else
    v21 = 1;
  if (v21)
    v22 = 30000000;
  else
    v22 = v16;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("FindingSecondarySchedulingInterval")));

  if (v24 && (v26 = objc_opt_class(NSNumber, v25), (objc_opt_isKindOfClass(v24, v26) & 1) != 0))
  {
    v27 = objc_msgSend(v24, "intValue");
    v28 = 1;
  }
  else
  {
    v27 = 0;
    v28 = 0;
  }
  v29 = self->_uwbSystemListener.__ptr_;
  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](v29, "objectForKey:", CFSTR("secondarySchedulingInterval")));
    v31 = v30;
    if (v30)
    {
      v27 = objc_msgSend(v30, "intValue");
      v28 = 1;
    }

  }
  if (v27)
    v32 = v28 == 0;
  else
    v32 = 1;
  if (v32)
    v33 = 59000;
  else
    v33 = v27;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("FindingSecondaryDutyCycle")));

  v38 = 0.0;
  if (v35 && (v39 = objc_opt_class(NSNumber, v36), (objc_opt_isKindOfClass(v35, v39) & 1) != 0))
  {
    objc_msgSend(v35, "floatValue");
    v38 = *(float *)&v37;
    v40 = 1;
  }
  else
  {
    v40 = 0;
  }
  v41 = self->_uwbSystemListener.__ptr_;
  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](v41, "objectForKey:", CFSTR("secondaryDutyCycle")));
    v43 = v42;
    if (v42)
    {
      objc_msgSend(v42, "floatValue");
      v38 = v44;
      v40 = 1;
    }

  }
  v46 = v38 > 1.0 || v38 <= 0.0 || v40 == 0;
  LODWORD(v37) = 1028658089;
  if (!v46)
    *(float *)&v37 = v38;
  -[NIServerFindingRangingProvider _adjustDutyCycleForInterfaceDelays:schedulingInterval:](self, "_adjustDutyCycleForInterfaceDelays:schedulingInterval:", v33, v37);
  v48 = v47;
  v9 = v22 & 0xFFFFFF00;

  v8 = v22;
  v5 = v33 << 32;
  v6 = v48;
  v7 = &_mh_execute_header;
LABEL_6:
  v10 = v5 | v9 | v8;
  v11 = (unint64_t)v7 | v6;
  *(_QWORD *)&result.var0.var1.var2 = v11;
  *(_QWORD *)&result.var0.var0 = v10;
  return result;
}

- (unint64_t)_macAddressForIRK:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = objc_retainAutorelease(a3);
  v4 = SipHash(objc_msgSend(v3, "bytes"), &unk_100472E18, 8);

  return v4;
}

- (id)_getDefaultNbammsRangingConfigParameters
{
  int cntrl_low;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSNumber *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v35;
  int v36;
  uint64_t v37;
  __int16 v38;

  cntrl_low = LOBYTE(self->_uwbSystemListener.__cntrl_);
  v4 = qword_10085F520;
  v5 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if (cntrl_low)
  {
    if (!v5)
      goto LABEL_7;
    v38 = 0;
    v6 = "#find-range,Setting default ranging params for Test Nbamms MAC Mode";
    v7 = (uint8_t *)&v38;
  }
  else
  {
    if (!v5)
      goto LABEL_7;
    LOWORD(v37) = 0;
    v6 = "#find-range,Setting default ranging params for POR Nbamms MAC Mode";
    v7 = (uint8_t *)&v37;
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
LABEL_7:
  v8 = objc_opt_new(NSMutableDictionary);
  v9 = sub_100004784();
  if (sub_100395734((uint64_t)v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, CFSTR("nbTxAntenna"));

    v11 = atomic_load((unsigned __int8 *)&qword_100859558);
    if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_100859558))
    {
      v35 = sub_100004784();
      if (sub_10039574C((uint64_t)v35))
        v36 = 5;
      else
        v36 = 4;
      dword_100859550 = v36;
      __cxa_guard_release(&qword_100859558);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", dword_100859550, v37));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, CFSTR("nbRxAntenna"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4097));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, CFSTR("nbPacketType"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, CFSTR("mmsBandChannel"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, CFSTR("nbSlotSize"));

    if (LOBYTE(self->_uwbSystemListener.__cntrl_))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 72));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, CFSTR("mmsSlotSize"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 16));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v17, CFSTR("mmsNumFragments"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10000000));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, CFSTR("startTimeUncertainty"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 99));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v19, CFSTR("interval"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v20, CFSTR("enableNonInterlacedMMS"));

    v21 = sub_100004784();
    v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_100395798((uint64_t)v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v23, CFSTR("enableAntennaDiversity"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v24, CFSTR("overrideDefaultAntenna"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v25, CFSTR("useDedicatedAntennas"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v26, CFSTR("napSlotSize"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v27, CFSTR("dataSlotSize"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v28, CFSTR("useType2Addr"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("enforceNBBandChannel")));

    if (v30)
    {
      v32 = objc_opt_class(NSNumber, v31);
      if ((objc_opt_isKindOfClass(v30, v32) & 1) != 0)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (unsigned __int16)objc_msgSend(v30, "intValue")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v33, CFSTR("nbBandChannel"));

      }
    }

  }
  return v8;
}

- (void)_setInitiator
{
  void *v3;
  char var0;

  v3 = sub_100004784();
  if (!sub_100395734((uint64_t)v3))
  {
    var0 = self->_identifier.__r_.var0;
LABEL_5:
    var0 ^= 1u;
    goto LABEL_6;
  }
  var0 = self->_identifier.__r_.var0;
  if (!LOBYTE(self->_uwbSystemListener.__cntrl_))
    goto LABEL_5;
LABEL_6:
  BYTE1(self->_identifier.__r_.var0) = var0;
}

- (void)_assignDebugParametersIfAvailable:(id)a3
{
  void *v4;
  PRRangingManagerClient *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  PRRangingManagerClient *ptr;
  id v69;

  v69 = a3;
  if (!v69)
    __assert_rtn("-[NIServerFindingRangingProvider _assignDebugParametersIfAvailable:]", "NIServerFindingRanging.mm", 4751, "debugParameters != nil");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingRangingProvider _getDefaultNbammsRangingConfigParameters](self, "_getDefaultNbammsRangingConfigParameters"));
  v5 = (PRRangingManagerClient *)objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbTxAntenna")));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbTxAntenna")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, CFSTR("nbTxAntenna"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbRxAntenna")));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbRxAntenna")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, CFSTR("nbRxAntenna"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbPacketType")));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbPacketType")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, CFSTR("nbPacketType"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbBandChannel")));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbBandChannel")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, CFSTR("nbBandChannel"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsTxAntenna")));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsTxAntenna")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, CFSTR("mmsTxAntenna"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsRxAntenna")));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsRxAntenna")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, CFSTR("mmsRxAntenna"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsRxSyncAntenna")));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsRxSyncAntenna")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, CFSTR("mmsRxSyncAntenna"));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsPacketType")));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsPacketType")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v21, CFSTR("mmsPacketType"));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsPSR")));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsPSR")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, CFSTR("mmsPSR"));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsGap")));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsGap")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v25, CFSTR("mmsGap"));

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsSeqIdx")));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsSeqIdx")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v27, CFSTR("mmsSeqIdx"));

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsBandChannel")));

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsBandChannel")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v29, CFSTR("mmsBandChannel"));

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbSlotSize")));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbSlotSize")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v31, CFSTR("nbSlotSize"));

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsSlotSize")));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsSlotSize")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v33, CFSTR("mmsSlotSize"));

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsNumFragments")));

  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("mmsNumFragments")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v35, CFSTR("mmsNumFragments"));

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("interval")));

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("interval")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v37, CFSTR("interval"));

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("enableNonInterlacedMMS")));

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("enableNonInterlacedMMS")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v39, CFSTR("enableNonInterlacedMMS"));

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("enableAntennaDiversity")));

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("enableAntennaDiversity")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v41, CFSTR("enableAntennaDiversity"));

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("useDedicatedAntennas")));

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("useDedicatedAntennas")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v43, CFSTR("useDedicatedAntennas"));

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("overrideDefaultAntenna")));

  if (v44)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("overrideDefaultAntenna")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v45, CFSTR("overrideDefaultAntenna"));

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbChannelSelectionMask")));

  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("nbChannelSelectionMask")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v47, CFSTR("nbChannelSelectionMask"));

  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("napSlotSize")));

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("napSlotSize")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v49, CFSTR("napSlotSize"));

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("dataSlotSize")));

  if (v50)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("dataSlotSize")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v51, CFSTR("dataSlotSize"));

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("useType2Addr")));

  if (v52)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("useType2Addr")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v53, CFSTR("useType2Addr"));

  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("schedulingInterval")));

  if (v54)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("schedulingInterval")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v55, CFSTR("schedulingInterval"));

  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("dutyCycle")));

  if (v56)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("dutyCycle")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v57, CFSTR("dutyCycle"));

  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("antennaDiversityMask")));

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("antennaDiversityMask")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v59, CFSTR("antennaDiversityMask"));

  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("ditherConst")));

  if (v60)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("ditherConst")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v61, CFSTR("ditherConst"));

  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("secondarySchedulingDelay")));

  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("secondarySchedulingDelay")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v63, CFSTR("secondarySchedulingDelay"));

  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("secondarySchedulingInterval")));

  if (v64)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("secondarySchedulingInterval")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v65, CFSTR("secondarySchedulingInterval"));

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("secondaryDutyCycle")));

  if (v66)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", CFSTR("secondaryDutyCycle")));
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v67, CFSTR("secondaryDutyCycle"));

  }
  ptr = self->_uwbSystemListener.__ptr_;
  self->_uwbSystemListener.__ptr_ = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);
  objc_storeStrong((id *)&self->_uwbSystemListener.__ptr_, 0);
  sub_10001AE68((uint64_t)&self->_pbLogger.__cntrl_);
  sub_10001AE68((uint64_t)&self->_consumer);
  objc_storeStrong((id *)&self->_isFinder, 0);
  objc_destroyWeak((id *)&self->_identifier.var0);
  if (*((char *)&self->_identifier.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_identifier.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
