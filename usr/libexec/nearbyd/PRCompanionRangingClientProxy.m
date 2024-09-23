@implementation PRCompanionRangingClientProxy

- (PRCompanionRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PRCompanionRangingClientProxy *v10;
  PRCompanionRangingClientProxy *v11;
  NSDictionary *startOptions;
  PRNSXPCConnection *v13;
  PRRangingClientProtocol *connWrapper;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  PRRemoteDevice *companion;
  RoseServiceRequest *value;
  NSObject *v20;
  CLFindMyAccessoryManager *v21;
  CLFindMyAccessoryManager *companionRangingManager;
  NSObject *v23;
  void *v25;
  void *v26;
  __int128 buf;
  id location;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRCompanionRangingClientProxy.mm"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v9)
      goto LABEL_3;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRCompanionRangingClientProxy.mm"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)PRCompanionRangingClientProxy;
  v10 = -[PRCompanionRangingClientProxy init](&v29, "init");
  v11 = v10;
  if (v10)
  {
    *(_QWORD *)&v10->_localRangingState = 0;
    *(_QWORD *)&v10->_companionRoseState = 0;
    v10->_clientRequestState = 0;
    startOptions = v10->_startOptions;
    v10->_startOptions = 0;

    v13 = -[PRNSXPCConnection initWithConnection:]([PRNSXPCConnection alloc], "initWithConnection:", v7);
    connWrapper = v11->_connWrapper;
    v11->_connWrapper = (PRRangingClientProtocol *)v13;

    objc_storeStrong((id *)&v11->_queue, a4);
    objc_initWeak(&location, v11);
    sub_10001AEC0(&location, &buf);
    sub_1000145E8((uint64_t)&v11->_rangingManagerClient, &buf);
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
    companion = v11->_companion;
    v11->_companion = 0;

    if (v11->_peerDescriptor.__engaged_)
      v11->_peerDescriptor.__engaged_ = 0;
    value = v11->_rangingRequest.__ptr_.__value_;
    v11->_rangingRequest.__ptr_.__value_ = 0;
    if (value)
      operator delete();
    v11->_p2pServiceId = 0;
    *(_WORD *)&v11->_cleaningUponDidFail = 0;
    v20 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_companionRangingManager initWithDelegate #companion-retry", (uint8_t *)&buf, 2u);
    }
    v21 = (CLFindMyAccessoryManager *)objc_msgSend(objc_alloc((Class)CLFindMyAccessoryManager), "initWithDelegate:delegateQueue:", v11, v11->_queue);
    companionRangingManager = v11->_companionRangingManager;
    v11->_companionRangingManager = v21;

    objc_destroyWeak(&location);
  }
  v23 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PRCompanionRangingClientProxy init", (uint8_t *)&buf, 2u);
  }

  return v11;
}

- (void)connectWithClientInfo:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  unsigned int v12;

  v5 = a3;
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", PRProcessNameKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", PRProcessIdentifierKey));
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = objc_msgSend(v8, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: XPC connection created. Process name: %@, pid: %d", (uint8_t *)&v9, 0x12u);

  }
  objc_storeStrong((id *)&self->_clientInfo, a3);
  -[PRCompanionRangingClientProxy activate](self, "activate");

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRCompanionRangingClientProxy dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRCompanionRangingClientProxy;
  -[PRCompanionRangingClientProxy dealloc](&v4, "dealloc");
}

- (void)activate
{
  NSObject *v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint8_t buf[16];
  __int128 v20;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRRangingManager connect probe #companion-retry", buf, 2u);
  }
  v4 = sub_1002CA108();
  sub_10001ADBC(buf, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
  v20 = *(_OWORD *)buf;
  memset(buf, 0, sizeof(buf));
  sub_1002CE308((uint64_t)v4, (unint64_t *)&v20);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
  if (*((_QWORD *)&v20 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v8 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v9 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = sub_1002CA108();
  sub_10001ADBC(buf, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
  v17 = *(_QWORD *)buf;
  v18 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v12 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  sub_1002CA79C((uint64_t)v11, &v17);
  if (v18)
    std::__shared_weak_count::__release_weak(v18);
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

- (void)terminate
{
  NSObject *v3;
  PRRemoteDevice *companion;
  NSObject *v5;
  void *v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  OS_voucher *voucher;
  PRRangingManagerClient *ptr;
  __shared_weak_count *v15;
  uint8_t buf[4];
  PRRemoteDevice *v17;

  if (self->_companion)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      companion = self->_companion;
      *(_DWORD *)buf = 138412290;
      v17 = companion;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down companion ranging session. Companion: %@", buf, 0xCu);
    }
    -[PRCompanionRangingClientProxy deinitCompanion](self, "deinitCompanion");
  }
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PRRangingManager disconnect #companion-retry", buf, 2u);
  }
  v6 = sub_1002CA108();
  cntrl = self->_rangingManagerClient.__cntrl_;
  ptr = self->_rangingManagerClient.__ptr_;
  v15 = cntrl;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  sub_1002CE3E0((uint64_t)v6, (unint64_t *)&ptr);
  v10 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    v11 = (unint64_t *)((char *)v15 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  -[PRRangingClientProtocol invalidate](self->_connWrapper, "invalidate", ptr);
  voucher = self->_clientVoucher.voucher;
  self->_clientVoucher.voucher = 0;

}

- (void)handleError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PRRangingClientProtocol *connWrapper;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v5, "isEqualToString:", kCLErrorDomainPrivate))
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == (id)12)
      -[PRCompanionRangingClientProxy remoteDevice:didChangeState:](self, "remoteDevice:didChangeState:", self->_companion, 3);
  }
  else
  {

  }
  -[PRCompanionRangingClientProxy cleanupRangingManagerAndCompanionAfterError:](self, "cleanupRangingManagerAndCompanionAfterError:", v4);
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014CA0;
  v9[3] = &unk_1007FA308;
  v8 = v4;
  v10 = v8;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v9);

}

- (void)didFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#companion-retry didFailWithError: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014E60;
  v8[3] = &unk_1007FA330;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v4;
  OS_voucher *voucher;
  PRRangingClientProtocol *connWrapper;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v4 = a3;
  voucher = self->_clientVoucher.voucher;
  v10[0] = &self->_clientVoucher;
  v10[1] = voucher_adopt(voucher);
  connWrapper = self->_connWrapper;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014F74;
  v8[3] = &unk_1007FA308;
  v9 = v4;
  v7 = v4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v8);

  sub_10001AE30((uint64_t)v10);
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  PRRangingClientProtocol *connWrapper;
  _QWORD v5[6];

  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015054;
  v5[3] = &unk_1007FA350;
  v5[4] = a3;
  v5[5] = a4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v5);
}

- (void)reportRangingRequestStatusUpdate:(unint64_t)a3
{
  OS_voucher *voucher;
  PRVoucherWrapper *p_clientVoucher;
  OS_voucher *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  p_clientVoucher = &self->_clientVoucher;
  voucher = self->_clientVoucher.voucher;
  v8[0] = &self->_clientVoucher;
  v8[1] = voucher_adopt(voucher);
  v6 = p_clientVoucher[-11].voucher;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015174;
  v7[3] = &unk_1007FA370;
  v7[4] = a3;
  -[OS_voucher actOnRemoteObjectAndScheduleBarrierBlock:](v6, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);
  sub_10001AE30((uint64_t)v8);
}

- (void)combineAndReportLocalAndCompanionRangingRequestStatus
{
  int localRangingState;
  int v4;
  uint64_t v5;
  int clientRequestState;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t v17[16];
  id v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  localRangingState = self->_localRangingState;
  if (localRangingState == 4)
  {
    if (self->_companionRangingState != 5)
      return;
    clientRequestState = self->_clientRequestState;
    if (clientRequestState == 4)
    {
      v13 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PRCompanionRangingClientProxy absorbing PRRangingRequestStatusDidStart from a retry.  ", v17, 2u);
      }
    }
    else
    {
      if (clientRequestState == 3)
      {
        self->_clientRequestState = 4;
        v5 = 1;
        goto LABEL_11;
      }
      v19 = NSLocalizedDescriptionKey;
      v20 = CFSTR("Unexpected new status PRRangingRequestStatusDidStart");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v15 = PRErrorWithCodeAndUserInfo(999, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v16);
    }
  }
  else if (localRangingState == 1 && self->_companionRangingState == 1)
  {
    v4 = self->_clientRequestState;
    if (v4 == 4)
    {
      v18 = 0;
      v7 = -[PRCompanionRangingClientProxy startRangingMangagerAndCompanion:](self, "startRangingMangagerAndCompanion:", &v18);
      v8 = v18;
      v9 = v8;
      if ((v7 & 1) != 0)
      {

      }
      else
      {
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v8);

      }
    }
    else
    {
      if (v4 == 5)
      {
        self->_clientRequestState = 6;
        v5 = 2;
LABEL_11:
        -[PRCompanionRangingClientProxy reportRangingRequestStatusUpdate:](self, "reportRangingRequestStatusUpdate:", v5);
        return;
      }
      v21 = NSLocalizedDescriptionKey;
      v22 = CFSTR("Unexpected new status PRRangingRequestStatusStopped");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v11 = PRErrorWithCodeAndUserInfo(999, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v12);
    }
  }
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  OS_dispatch_queue *queue;
  _QWORD v6[5];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015538;
  v6[3] = &unk_1007FA398;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)queue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id v6;
  PRRangingClientProtocol *connWrapper;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a3;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100015A90;
  v9[3] = &unk_1007FA3C0;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v9);

}

- (void)didReceiveSessionStartNotification:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015BD4;
  block[3] = &unk_1007FA330;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)configureForCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  unint64_t *v25;
  unint64_t v26;
  BOOL v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  $C1B61179E9818A625A385C7F24D0BBAA v35;
  _BOOL4 engaged;
  void *v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  void *v41;
  void *v42;
  std::__shared_weak_count *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  NSObject *v46;
  char v47;
  id v48;
  void *v49;
  NSObject *v50;
  std::__shared_weak_count *v51;
  unint64_t *p_shared_weak_owners;
  unint64_t v53;
  int v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  unint64_t *v72;
  unint64_t v73;
  void *v74;
  void (**v75)(id, _QWORD, void *);
  void *v76;
  id v77;
  uint8_t v78[8];
  std::__shared_weak_count *v79;
  uint64_t v80;
  std::__shared_weak_count *v81;
  id v82[2];
  std::__shared_weak_count *v83;
  char v84;
  unsigned __int8 v85[7];
  optional<rose::RoseDeviceDescriptor> *p_peerDescriptor;
  __int16 v87;
  uint64_t v88;
  std::__shared_weak_count *v89;
  NSErrorUserInfoKey v90;
  const __CFString *v91;
  _BYTE buf[90];
  unsigned __int8 v93[416];
  NSErrorUserInfoKey v94;
  const __CFString *v95;
  NSErrorUserInfoKey v96;
  const __CFString *v97;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v98;
  $C1B61179E9818A625A385C7F24D0BBAA v99;
  NSErrorUserInfoKey v100;
  const __CFString *v101;
  NSErrorUserInfoKey v102;
  const __CFString *v103;
  _QWORD v104[2];
  _QWORD v105[2];

  v77 = a3;
  v9 = a4;
  v75 = (void (**)(id, _QWORD, void *))a5;
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v12, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: XPC command - configureForCompanionRanging. Process name: %@, pid: %d", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionaryRepresentation"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKey:", CFSTR("R1Preamble")));
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "integerValue");
    v17 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Setting special R1 preamble %lli", buf, 0xCu);
    }
    v104[0] = PRP2PArgsRxPreamble;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
    v105[0] = v18;
    v104[1] = PRP2PArgsTxPreamble;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
    v105[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v105, v104, 2));

    v21 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v21, "addEntriesFromDictionary:", v20);
    if (v9)
      objc_msgSend(v21, "addEntriesFromDictionary:", v9);

    v9 = v21;
  }
  else
  {
    v22 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Using normal R1 preamble", buf, 2u);
    }
  }
  if (!self->_p2pServiceId)
    goto LABEL_24;
  v23 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PRRangingManager unregisterForService #companion-retry", buf, 2u);
  }
  self->_localRangingState = 0;
  v24 = sub_1002CA108();
  sub_10001ADBC(buf, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
  v88 = *(_QWORD *)buf;
  v89 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v25 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }
  v27 = sub_1002CAF88((uint64_t)v24, &v88, self->_p2pServiceId);
  if (v89)
    std::__shared_weak_count::__release_weak(v89);
  v28 = *(std::__shared_weak_count **)&buf[8];
  if (!*(_QWORD *)&buf[8])
    goto LABEL_23;
  v29 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
  do
    v30 = __ldaxr(v29);
  while (__stlxr(v30 - 1, v29));
  if (v30)
  {
LABEL_23:
    if (v27)
      goto LABEL_24;
LABEL_62:
    v102 = NSLocalizedDescriptionKey;
    v103 = CFSTR("Failed to override P2P job.");
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
    v62 = PRErrorWithCodeAndUserInfo(999, v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);

    v75[2](v75, 0, v63);
    goto LABEL_77;
  }
  ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
  std::__shared_weak_count::__release_weak(v28);
  if (!v27)
    goto LABEL_62;
LABEL_24:
  if (objc_msgSend(v77, "deviceType") == (id)3)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "UUID"));
    v32 = v31 == 0;

    if (!v32)
    {
      objc_storeStrong((id *)&self->_companion, a3);
      v99 = 0;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice roseMACAddress](self->_companion, "roseMACAddress"));
      objc_msgSend(v33, "getBytes:range:", &v99, 0, 8);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
      objc_msgSend(v34, "getUUIDBytes:", &v98);

      v35 = v99;
      self->_peerDescriptor.var0.__val_.type = 3;
      engaged = self->_peerDescriptor.__engaged_;
      self->_peerDescriptor.var0.__val_.uuid.var0 = v98;
      self->_peerDescriptor.var0.__val_.uuid.__engaged_ = 1;
      self->_peerDescriptor.var0.__val_.rose_mac_address.var0 = v35;
      *(_WORD *)&self->_peerDescriptor.var0.__val_.rose_mac_address.__engaged_ = 1;
      self->_peerDescriptor.var0.__val_.bt_adv_address.__engaged_ = 0;
      if (!engaged)
        self->_peerDescriptor.__engaged_ = 1;
      *(_WORD *)v85 = 0;
      p_peerDescriptor = &self->_peerDescriptor;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v87 = 1;
      if (objc_msgSend(v37, "BOOLForKey:", CFSTR("CompanionFeature1Disable")))
        LOBYTE(v87) = 0;
      HIBYTE(v87) = 0;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("GattRanging")));
      v74 = v38;
      if (v38)
      {
        HIBYTE(v87) = objc_msgSend(v38, "BOOLValue", v38);
        v39 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          if (HIBYTE(v87))
            v40 = "YES";
          else
            v40 = "NO";
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Setting gatt ranging interval use to %s", buf, 0xCu);
        }
      }
      v41 = sub_1002CA108();
      v42 = (void *)*((_QWORD *)v41 + 406);
      v43 = (std::__shared_weak_count *)*((_QWORD *)v41 + 407);
      v82[1] = v42;
      v83 = v43;
      if (v43)
      {
        p_shared_owners = (unint64_t *)&v43->__shared_owners_;
        do
          v45 = __ldxr(p_shared_owners);
        while (__stxr(v45 + 1, p_shared_owners));
      }
      if (v42)
      {
        v46 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "PRRangingManager prepareRangingServiceRequest #companion-retry", buf, 2u);
        }
        if (sub_1002A4728((uint64_t)v42, &v84, v85, 0))
        {
          sub_100163150(&v84, (uint64_t)buf);
          if (v9)
          {
            v82[0] = 0;
            v47 = sub_100010BA8(v9, v93, v82);
            v48 = v82[0];
            v49 = v48;
            if ((v47 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                sub_1003C9E88();
              v75[2](v75, 0, v49);
LABEL_71:

              v43 = v83;
              if (v83)
                goto LABEL_72;
              goto LABEL_76;
            }

          }
          v50 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v78 = 0;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "PRRangingManager registerForService #companion-retry", v78, 2u);
          }
          v51 = (std::__shared_weak_count *)sub_1002CA108();
          sub_10001ADBC(v78, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
          v80 = *(_QWORD *)v78;
          v81 = v79;
          if (v79)
          {
            p_shared_weak_owners = (unint64_t *)&v79->__shared_weak_owners_;
            do
              v53 = __ldxr(p_shared_weak_owners);
            while (__stxr(v53 + 1, p_shared_weak_owners));
          }
          v54 = sub_1002CA950(v51, &v80, (uint64_t)buf);
          if (v81)
            std::__shared_weak_count::__release_weak(v81);
          v55 = v79;
          if (v79)
          {
            v56 = (unint64_t *)&v79->__shared_owners_;
            do
              v57 = __ldaxr(v56);
            while (__stlxr(v57 - 1, v56));
            if (!v57)
            {
              ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
              std::__shared_weak_count::__release_weak(v55);
            }
          }
          if ((v54 & 0xFF0000) != 0)
          {
            self->_localRangingState = 1;
            -[PRCompanionRangingClientProxy combineAndReportLocalAndCompanionRangingRequestStatus](self, "combineAndReportLocalAndCompanionRangingRequestStatus");
            objc_sync_enter(self);
            self->_p2pServiceId = v54;
            operator new();
          }
          v90 = NSLocalizedDescriptionKey;
          v91 = CFSTR("Register for service failed");
          v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1));
          v71 = PRErrorWithCodeAndUserInfo(999, v70);
          v49 = (void *)objc_claimAutoreleasedReturnValue(v71);

          v75[2](v75, 0, v49);
          goto LABEL_71;
        }
        v94 = NSLocalizedDescriptionKey;
        v95 = CFSTR("Failed to prepare service request.");
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1));
        v68 = PRErrorWithCodeAndUserInfo(999, v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);

        v75[2](v75, 0, v69);
      }
      else
      {
        v96 = NSLocalizedDescriptionKey;
        v97 = CFSTR("Configuration Manager Error.");
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1));
        v65 = PRErrorWithCodeAndUserInfo(999, v64);
        v66 = (void *)objc_claimAutoreleasedReturnValue(v65);

        v75[2](v75, 0, v66);
      }
      if (v43)
      {
LABEL_72:
        v72 = (unint64_t *)&v43->__shared_owners_;
        do
          v73 = __ldaxr(v72);
        while (__stlxr(v73 - 1, v72));
        if (!v73)
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
      }
LABEL_76:

      goto LABEL_77;
    }
  }
  v100 = NSLocalizedDescriptionKey;
  v101 = CFSTR("Remote device must be PRDeviceTypeCompanion and have a valid UUID.");
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1));
  v59 = PRErrorWithCodeAndUserInfo(100, v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);

  v75[2](v75, 0, v60);
LABEL_77:

}

- (void)startCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _BOOL8, _QWORD);
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  _BOOL8 v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  NSErrorUserInfoKey v33;
  const __CFString *v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;
  NSErrorUserInfoKey v37;
  const __CFString *v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  unsigned int v46;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _BOOL8, _QWORD))a5;
  v11 = (id)qword_10085F520;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    v44 = v12;
    v45 = 1024;
    v46 = objc_msgSend(v13, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: XPC command - startCompanionRanging. Process name: %@, pid: %d", buf, 0x12u);

  }
  if (objc_msgSend(v8, "deviceType") == (id)3
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"))) != 0
    && (v15 = !self->_peerDescriptor.__engaged_, v14, !v15))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
    {
      if (self->_p2pServiceId)
      {
        if (self->_localRangingState == 1)
        {
          if (self->_companionRangingState == 1)
          {
            objc_storeStrong((id *)&self->_startOptions, a4);
            v32 = 0;
            v19 = -[PRCompanionRangingClientProxy startRangingMangagerAndCompanion:](self, "startRangingMangagerAndCompanion:", &v32);
            v20 = v32;
            v21 = v20;
            if (v19)
            {
              v21 = 0;
              self->_clientRequestState = 3;
            }
            ((void (**)(id, _BOOL8, id))v10)[2](v10, v19, v21);
          }
          else
          {
            v33 = NSLocalizedDescriptionKey;
            v34 = CFSTR("Companion ranging is not stopped, cannot start.  ");
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
            v31 = PRErrorWithCodeAndUserInfo(102, v30);
            v20 = (id)objc_claimAutoreleasedReturnValue(v31);

            ((void (**)(id, _BOOL8, id))v10)[2](v10, 0, v20);
          }
        }
        else
        {
          v35 = NSLocalizedDescriptionKey;
          v36 = CFSTR("Local ranging is not stopped, cannot start.  ");
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
          v29 = PRErrorWithCodeAndUserInfo(102, v28);
          v20 = (id)objc_claimAutoreleasedReturnValue(v29);

          ((void (**)(id, _BOOL8, id))v10)[2](v10, 0, v20);
        }
      }
      else
      {
        v37 = NSLocalizedDescriptionKey;
        v38 = CFSTR("Asked to start ranging with invalid ticket id. Was ranging configured first?");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
        v27 = PRErrorWithCodeAndUserInfo(102, v26);
        v20 = (id)objc_claimAutoreleasedReturnValue(v27);

        ((void (**)(id, _BOOL8, id))v10)[2](v10, 0, v20);
      }
    }
    else
    {
      v39 = NSLocalizedDescriptionKey;
      v40 = CFSTR("Asked to start ranging with a companion with a different UUID than the one configured for ranging.");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
      v25 = PRErrorWithCodeAndUserInfo(100, v24);
      v20 = (id)objc_claimAutoreleasedReturnValue(v25);

      ((void (**)(id, _BOOL8, id))v10)[2](v10, 0, v20);
    }
  }
  else
  {
    v41 = NSLocalizedDescriptionKey;
    v42 = CFSTR("Remote device must be PRDeviceTypeCompanion and have a valid UUID.");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    v23 = PRErrorWithCodeAndUserInfo(100, v22);
    v20 = (id)objc_claimAutoreleasedReturnValue(v23);

    ((void (**)(id, _BOOL8, id))v10)[2](v10, 0, v20);
  }

}

- (BOOL)startRangingMangagerAndCompanion:(id *)a3
{
  int companionRangingState;
  NSObject *v5;
  CLFindMyAccessoryManager *companionRangingManager;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint8_t v12[8];
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  companionRangingState = self->_companionRangingState;
  if (companionRangingState == 1)
  {
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_companionRangingManager prepareRangingOnDevice #companion-retry", v12, 2u);
    }
    companionRangingManager = self->_companionRangingManager;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    -[CLFindMyAccessoryManager prepareRangingOnDevice:](companionRangingManager, "prepareRangingOnDevice:", v7);

    self->_companionRangingState = 2;
  }
  else
  {
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("startRangingMangagerAndCompanion failed, not in stopped state");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v9 = PRErrorWithCodeAndUserInfo(102, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v10);
  }
  return companionRangingState == 1;
}

- (void)startRangingMangager
{
  NSObject *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  NSDictionary *startOptions;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  NSObject *v20;
  CLFindMyAccessoryManager *companionRangingManager;
  void *v22;
  NSObject *v23;
  void *v24;
  unint64_t *p_shared_weak_owners;
  unint64_t v26;
  unsigned __int8 v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;
  uint8_t buf[16];
  __int128 v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;

  if (self->_lastStartScheduledTooSoon)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: using conservative start time offset", buf, 2u);
    }
    self->_lastStartScheduledTooSoon = 0;
    v4 = 1500000;
  }
  else
  {
    v4 = 510000;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("TimeSyncPathListeningWindowMSec")));
  v7 = v6;
  if (v6)
  {
    v8 = 1000 * objc_msgSend(v6, "intValue");
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: listeningWindowSizeUsec overridden by user to %u", buf, 8u);
    }
  }
  else
  {
    v8 = 3000;
  }
  startOptions = self->_startOptions;
  if (startOptions)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](startOptions, "objectForKey:", PRP2PArgsStartTimeOffsetUsec));
    if (v12)
    {
      v13 = objc_opt_class(NSNumber, v11);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        v4 = (int)objc_msgSend(v12, "intValue");
        v14 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v4;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: startCompanionRanging override startTimeOffsetUsec: %llu", buf, 0xCu);
        }
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_startOptions, "objectForKey:", PRP2PArgsListeningWindowSizeUsec));
    if (v16)
    {
      v17 = objc_opt_class(NSNumber, v15);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        v8 = objc_msgSend(v16, "intValue");
        v18 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: startCompanionRanging override listeningWindowSizeUsec: %u", buf, 8u);
        }
      }
    }

  }
  if (!self->_peerDescriptor.__engaged_)
    sub_10000BA44();
  v19 = *(__int128 *)((char *)&self->_peerDescriptor.var0.__val_.uuid.var0 + 12);
  *(_OWORD *)buf = *(_OWORD *)&self->_peerDescriptor.var0.__null_state_;
  v41 = v19;
  v42 = *(_QWORD *)&self->_peerDescriptor.var0.__val_.bt_adv_address.var0.__val_.__elems_[2];
  v43 = 1;
  v44 = 30000 * vcvtad_u64_f64((double)v4 / 30000.0);
  v45 = 2;
  v46 = v8;
  v47 = 0;
  v48 = 0x10000001ELL;
  v49 = 0u;
  v50 = 0u;
  v20 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_companionRangingManager startEventCounterForDevice #companion-retry", (uint8_t *)&v34, 2u);
  }
  companionRangingManager = self->_companionRangingManager;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
  -[CLFindMyAccessoryManager startEventCounterForDevice:](companionRangingManager, "startEventCounterForDevice:", v22);

  v23 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34) = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PRRangingManager startUserTriggeredRanging #companion-retry", (uint8_t *)&v34, 2u);
  }
  v24 = sub_1002CA108();
  sub_10001ADBC(&v34, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
  v36 = v34;
  v37 = v35;
  if (v35)
  {
    p_shared_weak_owners = (unint64_t *)&v35->__shared_weak_owners_;
    do
      v26 = __ldxr(p_shared_weak_owners);
    while (__stxr(v26 + 1, p_shared_weak_owners));
  }
  v27 = sub_1002CB6B4((uint64_t)v24, &v36, self->_p2pServiceId, (uint64_t)buf);
  if (v37)
    std::__shared_weak_count::__release_weak(v37);
  v28 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
      if ((v27 & 1) != 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  if ((v27 & 1) == 0)
  {
LABEL_35:
    v38 = NSLocalizedDescriptionKey;
    v39 = CFSTR("Initate user triggered ranging failed");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v32 = PRErrorWithCodeAndUserInfo(102, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

    -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v33);
  }
LABEL_36:
  self->_localRangingState = 2;

}

- (void)stopCompanionRanging:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8, _QWORD);
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL8 v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  unsigned int v24;

  v6 = a3;
  v7 = (void (**)(id, _BOOL8, _QWORD))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 1024;
    v24 = objc_msgSend(v10, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: XPC command - stopCompanionRanging. Process name: %@, pid: %d", buf, 0x12u);

  }
  if (objc_msgSend(v6, "deviceType") == (id)3
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"))) != 0
    && (v12 = !self->_peerDescriptor.__engaged_, v11, !v12))
  {
    v18 = 0;
    v13 = -[PRCompanionRangingClientProxy stopRangingMangagerAndCompanion:](self, "stopRangingMangagerAndCompanion:", &v18);
    v14 = v18;
    v15 = v14;
    if (v13)
    {
      v15 = 0;
      self->_clientRequestState = 5;
    }
    ((void (**)(id, _BOOL8, id))v7)[2](v7, v13, v15);
  }
  else
  {
    v19 = NSLocalizedDescriptionKey;
    v20 = CFSTR("Remote device must be PRDeviceTypeCompanion and have a valid UUID.");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v17 = PRErrorWithCodeAndUserInfo(100, v16);
    v14 = (id)objc_claimAutoreleasedReturnValue(v17);

    ((void (**)(id, _BOOL8, id))v7)[2](v7, 0, v14);
  }

}

- (BOOL)stopRangingMangagerAndCompanion:(id *)a3
{
  int localRangingState;
  void *v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  NSObject *v11;
  void *v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  char v18;
  void *v19;
  id v20;
  NSObject *v21;
  CLFindMyAccessoryManager *companionRangingManager;
  id v23;
  int companionRangingState;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  CLFindMyAccessoryManager *v30;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  NSErrorUserInfoKey v44;
  const __CFString *v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;

  localRangingState = self->_localRangingState;
  if ((localRangingState - 2) < 2)
  {
    if (a3)
    {
      v44 = NSLocalizedDescriptionKey;
      v45 = CFSTR("Received stopCompanionRanging while Local ranging is starting.  ");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
      v9 = PRErrorWithCodeAndUserInfo(103, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_8;
    }
  }
  else if (localRangingState == 4)
  {
    if (self->_p2pServiceId)
    {
      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PRRangingManager stopUserTriggeredRanging #companion-retry", (uint8_t *)&v32, 2u);
      }
      self->_localRangingState = 5;
      v12 = sub_1002CA108();
      sub_10001ADBC(&v32, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
      v34 = v32;
      v35 = v33;
      if (v33)
      {
        p_shared_weak_owners = (unint64_t *)&v33->__shared_weak_owners_;
        do
          v14 = __ldxr(p_shared_weak_owners);
        while (__stxr(v14 + 1, p_shared_weak_owners));
      }
      v10 = sub_1002CC2C8((uint64_t)v12, &v34, self->_p2pServiceId);
      if (v35)
        std::__shared_weak_count::__release_weak(v35);
      v15 = v33;
      if (v33)
      {
        p_shared_owners = (unint64_t *)&v33->__shared_owners_;
        do
          v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      if (a3)
        v18 = v10;
      else
        v18 = 1;
      if ((v18 & 1) == 0)
      {
        v40[0] = NSLocalizedDescriptionKey;
        v40[1] = NSLocalizedFailureReasonErrorKey;
        v41[0] = CFSTR("Failed to stop ranging");
        v41[1] = CFSTR("Stop ranging failed.");
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
        v20 = PRErrorWithCodeAndUserInfo(103, v19);
        *a3 = (id)objc_claimAutoreleasedReturnValue(v20);

      }
      v21 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "_companionRangingManager stopEventCounterForDevice #companion-retry", (uint8_t *)&v32, 2u);
      }
      companionRangingManager = self->_companionRangingManager;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
      -[CLFindMyAccessoryManager stopEventCounterForDevice:](companionRangingManager, "stopEventCounterForDevice:", v6);
      goto LABEL_30;
    }
    if (a3)
    {
      v42[0] = NSLocalizedDescriptionKey;
      v42[1] = NSLocalizedFailureReasonErrorKey;
      v43[0] = CFSTR("Failed to stop ranging");
      v43[1] = CFSTR("No service request.");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
      v23 = PRErrorWithCodeAndUserInfo(103, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v23);
      goto LABEL_8;
    }
  }
  else
  {
    if (localRangingState)
    {
      v10 = 1;
      goto LABEL_35;
    }
    if (a3)
    {
      v46 = NSLocalizedDescriptionKey;
      v47 = CFSTR("Local ranging state is not valid, cannot stop.  ");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
      v7 = PRErrorWithCodeAndUserInfo(103, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
LABEL_8:
      v10 = 0;
      *a3 = v8;
LABEL_30:

      goto LABEL_35;
    }
  }
  v10 = 0;
LABEL_35:
  companionRangingState = self->_companionRangingState;
  if ((companionRangingState - 2) < 3)
  {
    if (a3)
    {
      v36 = NSLocalizedDescriptionKey;
      v37 = CFSTR("Received stopCompanionRanging while Companion ranging is starting.  ");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
      v26 = PRErrorWithCodeAndUserInfo(103, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
LABEL_42:
      v10 = 0;
      *a3 = v27;
LABEL_47:

      return v10;
    }
    return 0;
  }
  if (companionRangingState == 5)
  {
    v29 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "_companionRangingManager stopRangingOnDevice #companion-retry", (uint8_t *)&v32, 2u);
    }
    self->_companionRangingState = 6;
    v30 = self->_companionRangingManager;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    -[CLFindMyAccessoryManager stopRangingOnDevice:](v30, "stopRangingOnDevice:", v25);
    goto LABEL_47;
  }
  if (!companionRangingState)
  {
    if (a3)
    {
      v38 = NSLocalizedDescriptionKey;
      v39 = CFSTR("Companion ranging state is not valid, cannot stop.  ");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      v28 = PRErrorWithCodeAndUserInfo(103, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_42;
    }
    return 0;
  }
  return v10;
}

- (void)cleanupRangingManagerAndCompanionAfterError:(id)a3
{
  id v4;
  _BOOL4 cleaningUponDidFail;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  CLFindMyAccessoryManager *v17;
  CLFindMyAccessoryManager *companionRangingManager;
  __int128 v19;
  id v20;
  uint8_t buf[24];

  v4 = a3;
  cleaningUponDidFail = self->_cleaningUponDidFail;
  v6 = qword_10085F520;
  v7 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if (cleaningUponDidFail)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received an error while cleaning up: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleanup companionRangingManager and Companion After Error #companion-retry", buf, 2u);
    }
    self->_cleaningUponDidFail = 1;
    v20 = 0;
    -[PRCompanionRangingClientProxy stopRangingMangagerAndCompanion:](self, "stopRangingMangagerAndCompanion:", &v20);
    v8 = v20;
    if (self->_p2pServiceId)
    {
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PRRangingManager unregisterForService #companion-retry", buf, 2u);
      }
      self->_localRangingState = 0;
      v10 = sub_1002CA108();
      sub_10001ADBC(buf, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
      v19 = *(_OWORD *)buf;
      if (*(_QWORD *)&buf[8])
      {
        v11 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
        do
          v12 = __ldxr(v11);
        while (__stxr(v12 + 1, v11));
      }
      sub_1002CAF88((uint64_t)v10, (uint64_t *)&v19, self->_p2pServiceId);
      if (*((_QWORD *)&v19 + 1))
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v19 + 1));
      v13 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      self->_p2pServiceId = 0;
    }
    -[PRCompanionRangingClientProxy deinitCompanion](self, "deinitCompanion");
    v16 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_companionRangingManager initWithDelegate #companion-retry", buf, 2u);
    }
    v17 = (CLFindMyAccessoryManager *)objc_msgSend(objc_alloc((Class)CLFindMyAccessoryManager), "initWithDelegate:delegateQueue:", self, self->_queue);
    companionRangingManager = self->_companionRangingManager;
    self->_companionRangingManager = v17;

    self->_cleaningUponDidFail = 0;
  }

}

- (void)initCompanion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  CLFindMyAccessoryManager *companionRangingManager;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Init companion. UUID: %@", (uint8_t *)&v11, 0xCu);

  }
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_companionRangingManager initRoseWithParameters #companion-retry", (uint8_t *)&v11, 2u);
  }
  self->_companionRoseState = 1;
  companionRangingManager = self->_companionRangingManager;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "roseMACAddress"));
  -[CLFindMyAccessoryManager initRangingOnDevice:macAddress:](companionRangingManager, "initRangingOnDevice:macAddress:", v9, v10);

}

- (void)deinitCompanion
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  CLFindMyAccessoryManager *companionRangingManager;
  void *v7;
  int v8;
  void *v9;

  if (self->_companionRoseState)
  {
    v3 = (id)qword_10085F520;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
      v8 = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deinit companion. UUID: %@", (uint8_t *)&v8, 0xCu);

    }
    *(_QWORD *)&self->_companionRangingState = 0x400000000;
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_companionRangingManager deinitRangingOnDevice #companion-retry", (uint8_t *)&v8, 2u);
    }
    companionRangingManager = self->_companionRangingManager;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    -[CLFindMyAccessoryManager deinitRangingOnDevice:](companionRangingManager, "deinitRangingOnDevice:", v7);

  }
}

- (void)configureCompanionForRanging
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  RoseServiceRequest *value;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  CLFindMyAccessoryManager *companionRangingManager;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  int v39;
  uint8_t v40[4];
  int v41;
  NSErrorUserInfoKey v42;
  const __CFString *v43;
  NSErrorUserInfoKey v44;
  const __CFString *v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;
  __int128 buf;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Configure companion for ranging. UUID: %@", (uint8_t *)&buf, 0xCu);

  }
  v10 = sub_1002CA108();
  v11 = *((_QWORD *)v10 + 406);
  v12 = (std::__shared_weak_count *)*((_QWORD *)v10 + 407);
  *(_QWORD *)&buf = v11;
  *((_QWORD *)&buf + 1) = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  if (v11)
  {
    value = self->_rangingRequest.__ptr_.__value_;
    if (value)
    {
      v39 = 0;
      if ((sub_1002A4D3C(v11, (uint64_t)value, (uint64_t)&v39, v5, v6, v7, v8, v9) & 1) != 0)
      {
        v16 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "+++++++++++++++++++++++++++++++++++++++++", v40, 2u);
        }
        v17 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sent command to remote device:", v40, 2u);
        }
        v18 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v40 = 67109120;
          v41 = v39;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "   countryCode: 0x%x", v40, 8u);
        }
        v19 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v40 = 67109120;
          v41 = BYTE1(v39) & 3;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "   channel: 0x%x", v40, 8u);
        }
        v20 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v40 = 67109120;
          v41 = (BYTE1(v39) >> 2) & 3;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "   txPreamble: 0x%x", v40, 8u);
        }
        v21 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v40 = 67109120;
          v41 = (BYTE1(v39) >> 4) & 3;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "   rxPreamble: 0x%x", v40, 8u);
        }
        v22 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v40 = 67109120;
          v41 = HIWORD(v39);
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "   intervalMs: %d", v40, 8u);
        }
        v23 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "+++++++++++++++++++++++++++++++++++++++++", v40, 2u);
        }
        v24 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "_companionRangingManager setRoseRangingParameters #companion-retry", v40, 2u);
        }
        self->_companionRoseState = 2;
        companionRangingManager = self->_companionRangingManager;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice roseMACAddress](self->_companion, "roseMACAddress"));
        LOWORD(v38) = HIWORD(v39);
        -[CLFindMyAccessoryManager configureRangingOnDevice:macAddress:countryCode:uwbChannel:acqPreamble:trackingPreamble:interval:](companionRangingManager, "configureRangingOnDevice:macAddress:countryCode:uwbChannel:acqPreamble:trackingPreamble:interval:", v26, v27, v39, BYTE1(v39) & 3, (BYTE1(v39) >> 2) & 3, (BYTE1(v39) >> 4) & 3, v38);

      }
      else
      {
        v42 = NSLocalizedDescriptionKey;
        v43 = CFSTR("Failed to construct companion range config command.");
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
        v35 = PRErrorWithCodeAndUserInfo(101, v34);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v35);

        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v26);
      }

    }
    else
    {
      v44 = NSLocalizedDescriptionKey;
      v45 = CFSTR("No cached ranging request.");
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
      v32 = PRErrorWithCodeAndUserInfo(999, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

      -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v33);
    }
  }
  else
  {
    v46 = NSLocalizedDescriptionKey;
    v47 = CFSTR("Configuration Manager Error.");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v29 = PRErrorWithCodeAndUserInfo(999, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v30);
  }
  if (v12)
  {
    v36 = (unint64_t *)&v12->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  CLFindMyAccessoryManager *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;
  uint8_t buf[4];
  id v20;

  v8 = (CLFindMyAccessoryManager *)a3;
  v9 = a4;
  v10 = a5;
  if (!v10
    || self->_companionRangingManager == v8
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID")),
        v12 = objc_msgSend(v10, "isEqual:", v11),
        v11,
        (v12 & 1) != 0))
  {
    v13 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didFailWithError #companion-retry error:%@", buf, 0xCu);
    }
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("Generic companion ranging error.");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v15 = PRErrorWithCodeAndUserInfo(301, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003C9EE8();
    -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v16);

  }
}

- (void)findMyAccessoryManager:(id)a3 didConnectDevice:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  int companionConnectionState;
  NSErrorUserInfoKey v18;
  const __CFString *v19;
  uint8_t buf[4];
  id v21;

  v8 = a4;
  v9 = a5;
  if (self->_companionRangingManager == a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if ((v11 & 1) != 0)
    {
      v12 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didConnectDevice #companion-retry error:%@", buf, 0xCu);
      }
      if (v9)
      {
        self->_companionConnectionState = 0;
        v18 = NSLocalizedDescriptionKey;
        v19 = CFSTR("Error connecting to peer.");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        v14 = PRErrorWithCodeAndUserInfo(301, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003C9F48();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v15);

      }
      else
      {
        v16 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v8;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "------ new connection: %@", buf, 0xCu);
        }
        companionConnectionState = self->_companionConnectionState;
        self->_companionConnectionState = 3;
        if (companionConnectionState == 2)
          -[PRCompanionRangingClientProxy initCompanion:](self, "initCompanion:", self->_companion);
      }
    }
  }

}

- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  NSObject *v10;
  PRRemoteDevice *companion;
  int companionConnectionState;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;
  uint8_t buf[4];
  PRRemoteDevice *v25;

  v6 = a4;
  if (self->_companionRangingManager == a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didDisconnectDevice #companion-retry", buf, 2u);
      }
      v10 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        companion = self->_companion;
        *(_DWORD *)buf = 138412290;
        v25 = companion;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "------ disconnection: %@", buf, 0xCu);
      }
      companionConnectionState = self->_companionConnectionState;
      if (companionConnectionState == 4)
      {
        v13 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_companionRangingManager disconnect complete #companion-retry", buf, 2u);
        }
      }
      else if (self->_companionRoseState)
      {
        v22 = NSLocalizedDescriptionKey;
        v23 = CFSTR("Disconnected while rose activity incomplete");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
        v15 = PRErrorWithCodeAndUserInfo(302, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003C9FD4();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v16);

      }
      else if (companionConnectionState == 2)
      {
        v20 = NSLocalizedDescriptionKey;
        v21 = CFSTR("Disconnected while connecting");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
        v18 = PRErrorWithCodeAndUserInfo(302, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003C9FA8();
        -[PRCompanionRangingClientProxy didFailWithError:](self, "didFailWithError:", v19);

      }
      -[PRCompanionRangingClientProxy remoteDevice:didChangeState:](self, "remoteDevice:didChangeState:", self->_companion, 0);
      self->_companionConnectionState = 1;
    }
  }

}

- (void)findMyAccessoryManager:(id)a3 didConfigureRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 error:(id)a6
{
  id v10;
  PRRemoteDevice *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  PRRemoteDevice *companion;
  NSErrorUserInfoKey v22;
  const __CFString *v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  uint8_t buf[4];
  PRRemoteDevice *v27;
  __int16 v28;
  unsigned int v29;

  v10 = a4;
  v11 = (PRRemoteDevice *)a6;
  if (self->_companionRangingManager == a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v13 = objc_msgSend(v10, "isEqual:", v12);

    if ((v13 & 1) != 0)
    {
      v14 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v11;
        v28 = 1024;
        v29 = a5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didConfigureRangingOnDevice #companion-retry error:%@, status:%d", buf, 0x12u);
      }
      if (self->_companionRoseState != 2)
      {
        v24 = NSLocalizedDescriptionKey;
        v25 = CFSTR("Unexpected didConfigureRangingOnDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
        v19 = PRErrorWithCodeAndUserInfo(301, v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v19);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA060();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v17);
        goto LABEL_13;
      }
      if (v11)
      {
        v22 = NSLocalizedDescriptionKey;
        v23 = CFSTR("Error configuring ranging parameters on peer.");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
        v16 = PRErrorWithCodeAndUserInfo(302, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA000();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v17);
LABEL_13:

        goto LABEL_14;
      }
      v20 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        companion = self->_companion;
        *(_DWORD *)buf = 138412290;
        v27 = companion;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "------ ConfigureRangingOnDevice: %@", buf, 0xCu);
      }
      *(_QWORD *)&self->_companionRangingState = 0x300000001;
      self->_clientRequestState = 2;
      -[PRCompanionRangingClientProxy remoteDevice:didChangeState:](self, "remoteDevice:didChangeState:", self->_companion, 1);
    }
  }
LABEL_14:

}

- (void)findMyAccessoryManager:(id)a3 didInitRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 error:(id)a6
{
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  unsigned __int8 v20;
  char v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  unsigned int v36;

  v10 = a4;
  v11 = a6;
  if (self->_companionRangingManager != a3)
    goto LABEL_30;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if ((v13 & 1) == 0)
    goto LABEL_30;
  v14 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v11;
    v35 = 1024;
    v36 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didInitRoseOnDevice #companion-retry error:%@, status:%d", buf, 0x12u);
  }
  if (self->_companionRoseState != 1)
  {
    v31 = NSLocalizedDescriptionKey;
    v32 = CFSTR("Unexpected didInitRoseOnDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v17 = PRErrorWithCodeAndUserInfo(301, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CA14C();
    -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v18);
    goto LABEL_29;
  }
  v15 = qword_10085F520;
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[[[******** Remote Device Ready ********]]]", buf, 2u);
    }
    v19 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = a5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Expected Ready ROSE_STATUS: 0x%x", buf, 8u);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v20 = objc_msgSend(v18, "BOOLForKey:", CFSTR("B389_SimulateLowPower"));
    if (a5 == 1)
      v21 = 1;
    else
      v21 = v20;
    if ((v21 & 1) != 0)
    {
      v29 = NSLocalizedDescriptionKey;
      v30 = CFSTR("Failed to initialize ranging on accessory");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
      v23 = PRErrorWithCodeAndUserInfo(300, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CA08C();
      -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v24);
    }
    else
    {
      if (!a5)
      {
        -[PRCompanionRangingClientProxy configureCompanionForRanging](self, "configureCompanionForRanging");
        goto LABEL_29;
      }
      v27 = NSLocalizedDescriptionKey;
      v28 = CFSTR("Error from R1 while initializing");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      v26 = PRErrorWithCodeAndUserInfo(301, v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v26);

      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CA08C();
      -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v24);
    }

LABEL_29:
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003CA0EC();
  -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v11);
LABEL_30:

}

- (void)findMyAccessoryManager:(id)a3 didDeinitRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 error:(id)a6
{
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  unsigned int companionConnectionState;
  void *v20;
  id v21;
  NSObject *v22;
  CLFindMyAccessoryManager *companionRangingManager;
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;

  v9 = a4;
  v10 = a6;
  if (self->_companionRangingManager == a3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if ((v12 & 1) != 0)
    {
      v13 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didDeinitRangingOnDevice #companion-retry error:%@", buf, 0xCu);
      }
      if (self->_companionRoseState != 4)
      {
        v28 = NSLocalizedDescriptionKey;
        v29 = CFSTR("Unexpected didDeinitRangingOnDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
        v18 = PRErrorWithCodeAndUserInfo(301, v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA1D8();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v16);
        goto LABEL_20;
      }
      if (v10)
      {
        v24 = NSLocalizedDescriptionKey;
        v25 = CFSTR("Error deiniting R1 on companion");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
        v15 = PRErrorWithCodeAndUserInfo(301, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA178();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v16);
        goto LABEL_20;
      }
      self->_companionRoseState = 0;
      companionConnectionState = self->_companionConnectionState;
      if (companionConnectionState < 3)
        goto LABEL_16;
      if (companionConnectionState == 3)
      {
        self->_companionConnectionState = 4;
        v22 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "_companionRangingManager disconnectFromDevice #companion-retry", buf, 2u);
        }
        companionRangingManager = self->_companionRangingManager;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
        -[CLFindMyAccessoryManager disconnectDevice:](companionRangingManager, "disconnectDevice:", v16);
        goto LABEL_20;
      }
      if (companionConnectionState == 4)
      {
LABEL_16:
        v26 = NSLocalizedDescriptionKey;
        v27 = CFSTR("Unexpected BT connection state");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
        v21 = PRErrorWithCodeAndUserInfo(301, v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v21);

        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v16);
LABEL_20:

      }
    }
  }

}

- (void)findMyAccessoryManager:(id)a3 didStartRangingOnDevice:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;
  uint8_t buf[4];
  id v24;

  v8 = a4;
  v9 = a5;
  if (self->_companionRangingManager == a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if ((v11 & 1) != 0)
    {
      v12 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didStartRangingOnDevice #companion-retry error:%@", buf, 0xCu);
      }
      if (self->_companionRangingState != 4)
      {
        v21 = NSLocalizedDescriptionKey;
        v22 = CFSTR("Unexpected didStartRangingOnDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
        v17 = PRErrorWithCodeAndUserInfo(301, v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v17);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA204();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v15);
        goto LABEL_13;
      }
      if (v9)
      {
        v19 = NSLocalizedDescriptionKey;
        v20 = CFSTR("Error starting ranging on companion");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
        v14 = PRErrorWithCodeAndUserInfo(301, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA178();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v15);
LABEL_13:

        goto LABEL_14;
      }
      v18 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "started ranging on companion", buf, 2u);
      }
      self->_companionRangingState = 5;
      -[PRCompanionRangingClientProxy combineAndReportLocalAndCompanionRangingRequestStatus](self, "combineAndReportLocalAndCompanionRangingRequestStatus");
    }
  }
LABEL_14:

}

- (void)findMyAccessoryManager:(id)a3 didCompleteRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 endReason:(unsigned __int8)a6 error:(id)a7
{
  int v8;
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  unsigned __int8 v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;
  NSErrorUserInfoKey v40;
  const __CFString *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v12 = a4;
  v13 = a7;
  if (self->_companionRangingManager == a3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v15 = objc_msgSend(v12, "isEqual:", v14);

    if ((v15 & 1) != 0)
    {
      v16 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v43 = v12;
        v44 = 2112;
        v45 = v13;
        v46 = 1024;
        v47 = v8;
        v48 = 1024;
        v49 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "_companionRangingManager didCompleteRoseRangingOnDevice #companion-retry on device: %@, error: %@, endReason: %d, status: %d", buf, 0x22u);
      }
      if ((self->_companionRangingState - 5) >= 2)
      {
        v40 = NSLocalizedDescriptionKey;
        v41 = CFSTR("Unexpected didCompleteRoseRangingOnDevice");
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
        v22 = PRErrorWithCodeAndUserInfo(301, v21);
        v19 = (id)objc_claimAutoreleasedReturnValue(v22);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA294();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v19);
        goto LABEL_13;
      }
      if (v13)
      {
        v38 = NSLocalizedDescriptionKey;
        v39 = CFSTR("Error reported upon ranging complete");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
        v18 = PRErrorWithCodeAndUserInfo(301, v17);
        v19 = (id)objc_claimAutoreleasedReturnValue(v18);

        v20 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v43 = v12;
          v44 = 2112;
          v45 = v13;
          v46 = 1024;
          v47 = v8;
          v48 = 1024;
          v49 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "CLFindMyAccessoryManager failed to complete Rose ranging on device: %@, error: %@, endReason: %d, status: %d", buf, 0x22u);
        }
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v19);
      }
      else
      {
        v23 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[[[******** Remote Device Range Complete ********]]]", buf, 2u);
        }
        self->_companionRangingState = 1;
        v24 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v43) = v9;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Range Complete Event ROSE_STATUS: 0x%x #companion-retry", buf, 8u);
        }
        if ((_DWORD)v9 == 7)
        {
          self->_lastStartScheduledTooSoon = 1;
        }
        else
        {
          self->_lastStartScheduledTooSoon = 0;
          if ((_DWORD)v9 == 14 || !(_DWORD)v9)
          {
            self->_companionRangingState = 1;
            v35 = 0;
            v25 = -[PRCompanionRangingClientProxy stopRangingMangagerAndCompanion:](self, "stopRangingMangagerAndCompanion:", &v35);
            v19 = v35;
            if ((v25 & 1) == 0)
              -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v19);
            -[PRCompanionRangingClientProxy combineAndReportLocalAndCompanionRangingRequestStatus](self, "combineAndReportLocalAndCompanionRangingRequestStatus");
            goto LABEL_13;
          }
        }
        v36 = NSLocalizedDescriptionKey;
        v37 = CFSTR("Error reported in ranging complete");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
        v27 = PRErrorWithCodeAndUserInfo(301, v26);
        v19 = (id)objc_claimAutoreleasedReturnValue(v27);

        v28 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA230(v9, v28, v29, v30, v31, v32, v33, v34);
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v19);
      }
LABEL_13:

    }
  }

}

- (void)findMyAccessoryManager:(id)a3 didReceiveRangingErrorFromDevice:(id)a4 withStatus:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  void *v20;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  if (self->_companionRangingManager == a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if ((v10 & 1) != 0)
    {
      self->_companionRoseState = 0;
      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v20) = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didReceiveRoseError #companion-retry, status: %d", buf, 8u);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error event ROSE_STATUS: %d"), v5));
      v13 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      v17[0] = NSLocalizedDescriptionKey;
      v17[1] = NSLocalizedFailureReasonErrorKey;
      v18[0] = CFSTR("Remote Device Reported Error");
      v18[1] = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
      v15 = PRErrorWithCodeAndUserInfo(301, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v16);
    }
  }

}

- (void)findMyAccessoryManager:(id)a3 didReceiveRangingTimestampFromDevice:(id)a4 status:(unsigned __int16)a5 rtt:(unint64_t)a6 tat:(unint64_t)a7 cycleIndex:(unsigned __int16)a8
{
  int v8;
  uint64_t v11;
  id v14;
  void *v15;
  unsigned __int8 v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint8_t v30[8];
  _WORD v31[4];
  unint64_t v32;
  unint64_t v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  int v41;
  NSErrorUserInfoKey v42;
  const __CFString *v43;

  v8 = a8;
  v11 = a5;
  v14 = a4;
  if (self->_companionRangingManager == a3)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
    {
      v17 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        v35 = v11;
        v36 = 2048;
        v37 = a6;
        v38 = 2048;
        v39 = a7;
        v40 = 1024;
        v41 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didReceiveRangingTimestampsFromDevice #companion-retry, status: %d, rtt: %llu, tat: %llu, cycleIndex: %d", buf, 0x22u);
      }
      if ((self->_companionRangingState - 5) >= 2)
      {
        v42 = NSLocalizedDescriptionKey;
        v43 = CFSTR("Unexpected didReceiveRangingTimestampsFromDevice");
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
        v28 = PRErrorWithCodeAndUserInfo(301, v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA2C0();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v29);

      }
      else
      {
        v31[0] = sub_10036BAF8(v11, v18, v19, v20, v21, v22, v23, v24);
        v31[1] = v8;
        v32 = a6;
        v33 = a7;
        sub_10015BC00((uint64_t)buf, 1, 0, 0, self->_p2pServiceId, (uint64_t)v31);
        v25 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "PRRangingManager ingestOutOfBandTimestampEvent #companion-retry", v30, 2u);
        }
        v26 = sub_1002CA108();
        (*(void (**)(void *, uint8_t *))(*(_QWORD *)v26 + 120))(v26, buf);
      }
    }
  }

}

- (void)findMyAccessoryManager:(id)a3 didHaveRangingMovementOnDevice:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a4;
  if (self->_companionRangingManager == a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didHaveRangingMovementOnDevice #companion-retry", v10, 2u);
      }
      -[PRCompanionRangingClientProxy remoteDevice:didChangeState:](self, "remoteDevice:didChangeState:", self->_companion, 2);
    }
  }

}

- (void)findMyAccessoryManager:(id)a3 didPrepareRangingOnDevice:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint8_t v16[8];
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v8 = a4;
  v9 = a5;
  if (self->_companionRangingManager == a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if ((v11 & 1) != 0)
    {
      v12 = qword_10085F520;
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003CA318();
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v9);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didPrepareForStartRangingOnDevice #companion-retry", v16, 2u);
        }
        if (self->_companionRangingState != 2)
        {
          v17 = NSLocalizedDescriptionKey;
          v18 = CFSTR("Unexpected didPrepareForStartRangingOnDevice");
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
          v14 = PRErrorWithCodeAndUserInfo(301, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003CA2EC();
          -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v15);

        }
        self->_companionRangingState = 3;
        -[PRCompanionRangingClientProxy startRangingMangager](self, "startRangingMangager");
      }
    }
  }

}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (PRRemoteDevice)companion
{
  return (PRRemoteDevice *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCompanion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (optional<rose::RoseDeviceDescriptor>)peerDescriptor
{
  optional<rose::RoseDeviceDescriptor> *result;

  objc_copyStruct(retstr, &self->_peerDescriptor, 44, 1, 0);
  return result;
}

- (void)setPeerDescriptor:(optional<rose::RoseDeviceDescriptor> *)a3
{
  objc_copyStruct(&self->_peerDescriptor, a3, 44, 1, 0);
}

- (void).cxx_destruct
{
  RoseServiceRequest *value;

  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_companionRangingManager, 0);

  objc_storeStrong((id *)&self->_startOptions, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  value = self->_rangingRequest.__ptr_.__value_;
  self->_rangingRequest.__ptr_.__value_ = 0;
  if (value)
    operator delete();
  sub_10001AE68((uint64_t)&self->_rangingManagerClient);
  objc_storeStrong((id *)&self->_connWrapper, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_BYTE *)self + 120) = 0;
  *((_BYTE *)self + 160) = 0;
  return self;
}

@end
