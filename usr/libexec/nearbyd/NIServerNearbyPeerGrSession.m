@implementation NIServerNearbyPeerGrSession

- (NIServerNearbyPeerGrSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NIServerNearbyPeerGrSession *v11;
  NIServerNearbyPeerGrSession *v12;
  void *v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  NIServerNearbyPeerGrSession *v18;
  __int128 v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NIServerNearbyPeerGrSession;
  v11 = -[NIServerNearbyPeerGrSession init](&v21, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_clientQueue, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getResourcesManager"));
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "protobufLogger");
    else
      v20 = 0uLL;
    sub_1000145E8((uint64_t)&v12->_pbLogger, &v20);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    v18 = v12;
  }

  return v12;
}

- (id)configure
{
  shared_ptr<rose::objects::GRSession> *p_grSession;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  __int128 v9;
  _BYTE v10[512];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  p_grSession = &self->_grSession;
  if (self->_grSession.__ptr_)
    goto LABEL_10;
  -[NIServerNearbyPeerGrSession _prepareServiceRequest](self, "_prepareServiceRequest");
  if (v10[504])
  {
    -[NIServerNearbyPeerGrSession _buildRoseSession:](self, "_buildRoseSession:", v10);
    sub_1000145E8((uint64_t)&self->_grSession, &v9);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
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
  else
  {
    sub_100180AF4(&self->_grSession.__ptr_);
  }
  if (p_grSession->__ptr_)
LABEL_10:
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  return v7;
}

- (id)run
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_grSession.__ptr_)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getResourcesManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btResource"));
    objc_msgSend(v5, "startAdvertising");

    if (objc_msgSend(v4, "isBackgroundOperationAllowed"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btResource"));
      objc_msgSend(v6, "allowScreenOffOperation:", 1);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btResource"));
    objc_msgSend(v7, "startScanning");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lifecycleSupervisor"));
    objc_msgSend(v8, "runWithConfigurationCalled");

    v9 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D7968();
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
  }
  return v9;
}

- (BOOL)shouldBypassBleDiscovery
{
  return 0;
}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  double v5;
  void *v6;
  Logger *ptr;
  id v8;
  id v9;
  void *__p[20];

  v4 = a3;
  if (self->_pbLogger.__ptr_)
  {
    v5 = sub_10000883C();
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NINearbyObject objectFromBluetoothDevice:](NINearbyObject, "objectFromBluetoothDevice:", v4));
    if (v6)
    {
      ptr = self->_pbLogger.__ptr_;
      v8 = objc_msgSend(v4, "u64Identifier");
      sub_100268FEC(v6, (uint64_t)__p);
      sub_100274790((uint64_t)ptr, (uint64_t)v8, (uint64_t)__p, v5);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }

  }
  v9 = -[NIServerNearbyPeerGrSession _triggerRanging:](self, "_triggerRanging:", v4);

}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  GRSession *ptr;
  _BOOL4 v15;
  unsigned int v16;
  char v17;
  unsigned int v18;
  _BOOL4 v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  id v25;
  NSObject *v26;
  const __CFString *v27;
  const __CFString *v28;
  int v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v9 = objc_msgSend(v7, "u64Identifier");
  v10 = objc_msgSend(v6, "u64Identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getResourcesManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lifecycleSupervisor"));
  v13 = objc_msgSend(v12, "doesClientWantSessionToRun");

  ptr = self->_grSession.__ptr_;
  if (ptr)
    v15 = *((_BYTE *)ptr + 33) != 0;
  else
    v15 = 0;
  v16 = objc_msgSend(WeakRetained, "isLongRangeEnabled");
  if (ptr)
    v17 = v13;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    v18 = v16;
    if (v16)
      v19 = v9 != v10;
    else
      v19 = v15;
    v20 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v21 = CFSTR("NO");
      v29 = 138413570;
      if (v19)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      v30 = v22;
      v31 = 2112;
      if (v9 == v10)
        v23 = CFSTR("NO");
      else
        v23 = CFSTR("YES");
      v32 = v23;
      v33 = 2112;
      if (v15)
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      v34 = CFSTR("YES");
      if (!v18)
        v21 = CFSTR("YES");
      v35 = 2112;
      v36 = CFSTR("YES");
      v37 = 2112;
      v38 = v24;
      v39 = 2112;
      v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#peer-gr,#restart ranging restart decision: %@. adr:%@,run:%@,has:%@,rsp:%@,uap:%@", (uint8_t *)&v29, 0x3Eu);
    }
    if (v19)
      v25 = -[NIServerNearbyPeerGrSession _triggerRanging:](self, "_triggerRanging:", v7);
  }
  else
  {
    v26 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v27 = CFSTR("NO");
      if (v13)
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      if (ptr)
        v27 = CFSTR("YES");
      v29 = 138412546;
      v30 = v28;
      v31 = 2112;
      v32 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#peer-gr,#restart early return. run: %@, has: %@", (uint8_t *)&v29, 0x16u);
    }
  }

}

- (void)updatePeerData:(const void *)a3
{
  id WeakRetained;
  unsigned __int8 v6;

  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D7994();
  if (self->_grSession.__ptr_)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v6 = objc_msgSend(WeakRetained, "isLongRangeEnabled");

    if ((v6 & 1) == 0)
      sub_1002B1E34((uint64_t)self->_grSession.__ptr_, (uint64_t)a3);
  }
}

- (void)didReceiveNewSolution:(const void *)a3
{
  int *v3;
  NSObject *v6;
  id WeakRetained;

  v3 = (int *)((char *)a3 + 32);
  if ((*((_DWORD *)a3 + 8) - 1) >= 3)
  {
    v6 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D79CC(v3, v6);
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didReceiveNewSolution:", a3);

  }
}

- (void)didReceiveRemoteData:(const void *)a3
{
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didReceiveRemoteData:", a3);

}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  unsigned int var2;
  uint64_t v4;
  id WeakRetained;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didServiceRequestUpdateStatus:", v4, var2);

}

- (void)invalidate
{
  uint64_t v3;
  shared_ptr<rose::objects::GRSession> *p_grSession;
  GRSession *ptr;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  ptr = self->_grSession.__ptr_;
  p_grSession = &self->_grSession;
  v3 = (uint64_t)ptr;
  if (ptr)
  {
    sub_1002AE5BC(v3);
    sub_100180AF4(p_grSession);
  }
}

- (void)_grSessionInvalidatedWithReason:(int)a3
{
  NSObject *v5;
  id WeakRetained;
  _QWORD v7[3];

  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1002B48E0(a3, v7);
    sub_1003D7A40();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didInvalidateUWBSession");

}

- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3
{
  _QWORD *v3;
  _QWORD *v6;
  id WeakRetained;
  NIServerNearbyPeerGrSession *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  NIServerNearbyPeerGrSession *v13;
  NIServerNearbyPeerGrSession *v14;
  NIServerNearbyPeerGrSession *v15;
  NIServerNearbyPeerGrSession *v16;
  NIServerNearbyPeerGrSession *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
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
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  GRSession *v45;
  __shared_weak_count *v46;
  __int128 v47;
  __int128 v48;
  void *__p[2];
  char v50;
  __int128 v51;
  _BYTE v52[24];
  _BYTE *v53;
  _BYTE v54[24];
  _BYTE *v55;
  _BYTE v56[24];
  _BYTE *v57;
  _QWORD v58[3];
  _QWORD *v59;
  _BYTE v60[24];
  _BYTE *v61;
  _QWORD v62[3];
  _QWORD *v63;
  _QWORD v64[3];
  _QWORD *v65;
  _QWORD v66[3];
  _QWORD *v67;
  uint8_t buf[8];
  NIServerNearbyPeerGrSession *v69;
  uint8_t *v70;
  shared_ptr<rose::objects::GRSession> result;

  v6 = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v8 = self;
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getContainerUniqueIdentifier")));
  sub_10000BF04(__p, (char *)objc_msgSend(v9, "UTF8String"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getResourcesManager"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "protobufLogger");
  else
    v47 = 0uLL;
  v12 = operator new(0x5D8uLL);
  v12[1] = 0;
  v12[2] = 0;
  *v12 = off_10080C460;
  v13 = v8;
  *(_QWORD *)buf = off_10080C4B0;
  v69 = v13;
  v70 = buf;
  v14 = v13;
  v66[0] = off_10080C530;
  v66[1] = v14;
  v67 = v66;
  v15 = v14;
  v64[0] = off_10080C5F8;
  v64[1] = v15;
  v65 = v64;
  v16 = v15;
  v62[0] = off_10080C6C0;
  v62[1] = v16;
  v63 = v62;
  v61 = 0;
  v17 = v16;
  v58[0] = off_10080C740;
  v58[1] = v17;
  v59 = v58;
  v57 = 0;
  v55 = 0;
  v53 = 0;
  v51 = v47;
  sub_1002ADC18((uint64_t)(v12 + 3), (__int128 *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v66, (uint64_t)v64, (uint64_t)v62, (uint64_t)v60, (uint64_t)v58, (uint64_t)v56, (uint64_t)v54, (uint64_t)v52, &v51);
  v12[3] = off_10080C7D0;
  v12[4] = off_10080C898;
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
  if (*((_QWORD *)&v51 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v53;
  if (v53 == v52)
  {
    v22 = 4;
    v21 = v52;
  }
  else
  {
    if (!v53)
      goto LABEL_14;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_14:
  v23 = v55;
  if (v55 == v54)
  {
    v24 = 4;
    v23 = v54;
  }
  else
  {
    if (!v55)
      goto LABEL_19;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_19:
  v25 = v57;
  if (v57 == v56)
  {
    v26 = 4;
    v25 = v56;
  }
  else
  {
    if (!v57)
      goto LABEL_24;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_24:
  v27 = v59;
  if (v59 == v58)
  {
    v28 = 4;
    v27 = v58;
  }
  else
  {
    if (!v59)
      goto LABEL_29;
    v28 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_29:
  v29 = v61;
  if (v61 == v60)
  {
    v30 = 4;
    v29 = v60;
  }
  else
  {
    if (!v61)
      goto LABEL_34;
    v30 = 5;
  }
  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_34:
  v31 = v63;
  if (v63 == v62)
  {
    v32 = 4;
    v31 = v62;
  }
  else
  {
    if (!v63)
      goto LABEL_39;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_39:
  v33 = v65;
  if (v65 == v64)
  {
    v34 = 4;
    v33 = v64;
  }
  else
  {
    if (!v65)
      goto LABEL_44;
    v34 = 5;
  }
  (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_44:
  v35 = v67;
  if (v67 == v66)
  {
    v36 = 4;
    v35 = v66;
  }
  else
  {
    if (!v67)
      goto LABEL_49;
    v36 = 5;
  }
  (*(void (**)(void))(*v35 + 8 * v36))();
LABEL_49:
  v37 = v70;
  if (v70 == buf)
  {
    v38 = 4;
    v37 = buf;
  }
  else
  {
    if (!v70)
      goto LABEL_54;
    v38 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v37 + 8 * v38))();
LABEL_54:
  *(_QWORD *)&v48 = v12 + 3;
  *((_QWORD *)&v48 + 1) = v12;
  sub_10001B020((uint64_t)&v48, v12 + 5, (uint64_t)(v12 + 3));

  v39 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#peer-gr,Registering for UWB service.", buf, 2u);
  }
  v40 = sub_1002AEA48(v48);
  if (v40)
  {
    v41 = (id)qword_10085F520;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v40, buf);
      sub_1003D7A8C();
    }

    *v6 = 0;
    v6[1] = 0;
    v42 = (std::__shared_weak_count *)*((_QWORD *)&v48 + 1);
    if (*((_QWORD *)&v48 + 1))
    {
      v43 = (unint64_t *)(*((_QWORD *)&v48 + 1) + 8);
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
  }
  else
  {
    *(_OWORD *)v6 = v48;
  }
  if (v50 < 0)
    operator delete(__p[0]);

  result.__cntrl_ = v46;
  result.__ptr_ = v45;
  return result;
}

- (unint64_t)sipHashForIRK:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = objc_retainAutorelease(a3);
  v4 = SipHash(objc_msgSend(v3, "bytes"), &unk_10046FCF0, 8);

  return v4;
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequest
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  unsigned int v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  const __CFString *v45;
  unint64_t *v46;
  unint64_t v47;
  optional<rose::RoseServiceRequest> *result;
  id v49;
  id v50;
  id v51[3];
  _DWORD buf[126];
  __int16 v53;
  char v54;
  int v55;
  char v56;
  char v57;
  char v58;
  char v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  __int16 v65;
  int v66;
  char v67;
  BOOL v68;
  int v69;
  char v70;
  int v71;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getNIConfiguration"));
  v7 = objc_msgSend(v6, "copy");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugParameters"));
  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugParameters")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("enableAdditionalUWBSignalFeatures"))),
        v10,
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugParameters"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("enableAdditionalUWBSignalFeatures")));

    if (v12)
    {
      if (objc_msgSend(v12, "BOOLValue"))
        v13 = 2;
      else
        v13 = 4;
    }
    else
    {
      v13 = 4;
    }

  }
  else
  {
    v13 = 4;
  }
  v14 = (char *)objc_msgSend(v7, "backgroundMode") - 3;
  v15 = (id)qword_10085F520;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getContainerUniqueIdentifier"));
    v17 = (void *)v16;
    v18 = CFSTR("yes");
    if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL)
      v18 = CFSTR("no");
    buf[0] = 138412546;
    *(_QWORD *)&buf[1] = v18;
    LOWORD(buf[3]) = 2112;
    *(_QWORD *)((char *)&buf[3] + 2) = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#peer-gr,Prepare service request. avoidDedicatedAntennas = [%@], Container ID: %@. ", (uint8_t *)buf, 0x16u);

  }
  v53 = 0;
  v54 = 0;
  v55 = 68354305;
  v56 = 0;
  v57 = 0;
  v58 = 0;
  v59 = 0;
  v60 = 3;
  v61 = v13;
  v62 = 3;
  v64 = 0;
  v63 = 0;
  v65 = 0;
  v66 = 1;
  v67 = 1;
  v68 = (unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL;
  v69 = 0;
  v70 = 0;
  v71 = 6;
  v19 = sub_1002CA108();
  v20 = (void *)*((_QWORD *)v19 + 406);
  v21 = (std::__shared_weak_count *)*((_QWORD *)v19 + 407);
  v51[1] = v20;
  v51[2] = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v23 = __ldxr(p_shared_owners);
    while (__stxr(v23 + 1, p_shared_owners));
  }
  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D7B20();
    goto LABEL_39;
  }
  if (!sub_1002A4728((uint64_t)v20, (char *)&v53, (unsigned __int8 *)&v53 + 1, 0))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D7B78();
LABEL_39:
    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    goto LABEL_51;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugParameters"));
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugParameters"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", CFSTR("forceAntennaDiversity")));
    v27 = v26 == 0;

    if (!v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugParameters"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("forceAntennaDiversity")));
      v31 = objc_opt_class(NSNumber, v30);
      isKindOfClass = objc_opt_isKindOfClass(v29, v31);

      if ((isKindOfClass & 1) != 0)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugParameters"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("forceAntennaDiversity")));
        v35 = objc_msgSend(v34, "BOOLValue");

        if (v35)
        {
          v36 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#peer-gr,* Antenna diversity turned ON from default writes.", (uint8_t *)buf, 2u);
          }
          LOWORD(v69) = 257;
        }
      }
    }
  }
  if (objc_msgSend(WeakRetained, "isLongRangeEnabled"))
  {
    v37 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#peer-gr,Long range enabled.", (uint8_t *)buf, 2u);
    }
    HIBYTE(v55) = 5;
    BYTE1(v55) = 0;
    BYTE2(v69) = 1;
    v66 = 1;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getResourcesManager"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "discoveryToken"));

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerDiscoveryToken"));
    v51[0] = 0;
    v41 = objc_msgSend(WeakRetained, "shouldInitiate:peerDiscoveryToken:error:", v39, v40, v51);
    v42 = v51[0];

    v43 = qword_10085F520;
    if (!v42)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v45 = CFSTR("No");
        if (v41)
          v45 = CFSTR("Yes");
        buf[0] = 138412290;
        *(_QWORD *)&buf[1] = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#peer-gr,Should initiate: %@.", (uint8_t *)buf, 0xCu);
      }
      if (v41)
      {
        sub_100163C14((char *)&v53, (uint64_t)buf);
        operator new();
      }
      sub_100164128((char *)&v53, (uint64_t)buf);
      operator new();
    }
    v44 = (id)qword_10085F520;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "description")));
      v50 = objc_msgSend(v49, "UTF8String");
      buf[0] = 136315138;
      *(_QWORD *)&buf[1] = v50;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "#peer-gr,unable to determine initiator: %s", (uint8_t *)buf, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D7B4C();
    v42 = 0;
  }
  retstr->var0.__null_state_ = 0;
  retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

LABEL_51:
  if (v21)
  {
    v46 = (unint64_t *)&v21->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return result;
}

- (id)_triggerRanging:(id)a3
{
  id v4;
  GRSession *ptr;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  __int128 v14;
  __int16 v15;
  char v16;
  int v17;
  __int16 v18;
  char v19;
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;

  v4 = a3;
  ptr = self->_grSession.__ptr_;
  if (ptr)
  {
    if (sub_1002AEE80((uint64_t)ptr))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
      if (objc_msgSend(WeakRetained, "isLongRangeEnabled"))
      {
        v7 = objc_msgSend(v4, "btAdvertisingAddress");
        v17 = (int)v7;
        v18 = WORD2(v7);
        LODWORD(v14) = 2;
        BYTE4(v14) = 0;
        v15 = 0;
        v16 = 0;
        v19 = 1;
        v20 = 1;
      }
      else
      {
        LOBYTE(v14) = 0;
        v20 = 0;
      }
      v21 = 0;
      v22 = 0;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0;
      v10 = sub_1002B1704((uint64_t)self->_grSession.__ptr_, &v14);

    }
    else
    {
      v9 = objc_msgSend(v4, "btAdvertisingAddress");
      v17 = (int)v9;
      v18 = WORD2(v9);
      LODWORD(v14) = 2;
      BYTE4(v14) = 0;
      v15 = 0;
      v16 = 0;
      v19 = 1;
      v20 = 1;
      v21 = 0;
      v22 = 0;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0;
      v10 = sub_1002B1704((uint64_t)self->_grSession.__ptr_, &v14);
    }
    if (!v10)
    {
      v12 = 0;
      goto LABEL_15;
    }
    v11 = (id)qword_10085F520;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v10, &v14);
      sub_1003D7BA4();
    }

    v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  }
  v12 = (void *)v8;
LABEL_15:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  sub_10001AE68((uint64_t)&self->_grSession);
  sub_10001AE68((uint64_t)&self->_pbLogger);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
