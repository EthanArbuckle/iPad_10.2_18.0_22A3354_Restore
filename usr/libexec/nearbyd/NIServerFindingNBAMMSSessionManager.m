@implementation NIServerFindingNBAMMSSessionManager

- (NIServerFindingNBAMMSSessionManager)init
{
  NIServerFindingNBAMMSSessionManager *v2;
  NIServerFindingNBAMMSSessionManager *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *internalQueue;
  _QWORD *v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  GroupFindingAnalytics *v15;
  GroupFindingAnalytics *analytics;
  NIServerFindingNBAMMSSessionManager *v17;
  _QWORD *v18;
  NIServerFindingNBAMMSSessionManager *v19;
  void ***v20;
  NIServerNBAMMSSession *v21;
  NIServerNBAMMSSession *v22;
  NIServerNBAMMSSession *nmiSession1;
  NIServerNBAMMSSession *v24;
  NIServerNBAMMSSession *nmiSession2;
  NSMutableDictionary *v26;
  NSMutableDictionary *tokenToMutualAuthSessions;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *, char, char);
  void *v32;
  NIServerFindingNBAMMSSessionManager *v33;
  id v34;
  _QWORD v35[4];
  NIServerFindingNBAMMSSessionManager *v36;
  id v37;
  __int128 location;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)NIServerFindingNBAMMSSessionManager;
  v2 = -[NIServerFindingNBAMMSSessionManager init](&v39, "init");
  v3 = v2;
  if (v2)
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.nearbyd.nbammssession", v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    v8 = sub_1002CA108();
    v9 = v8[21];
    *(_QWORD *)&location = v8[20];
    *((_QWORD *)&location + 1) = v9;
    if (v9)
    {
      v10 = (unint64_t *)(v9 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    sub_1000145E8((uint64_t)&v2->_pbLogger, &location);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&location + 1);
    if (*((_QWORD *)&location + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&location + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = objc_alloc_init(GroupFindingAnalytics);
    analytics = v3->_analytics;
    v3->_analytics = v15;

    objc_initWeak((id *)&location, v3);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1002241A8;
    v35[3] = &unk_10080F4F8;
    objc_copyWeak(&v37, (id *)&location);
    v17 = v3;
    v36 = v17;
    v18 = objc_retainBlock(v35);
    v29 = _NSConcreteStackBlock;
    v30 = 3221225472;
    v31 = sub_10022426C;
    v32 = &unk_10080F548;
    objc_copyWeak(&v34, (id *)&location);
    v19 = v17;
    v33 = v19;
    v20 = objc_retainBlock(&v29);
    v21 = [NIServerNBAMMSSession alloc];
    v22 = -[NIServerNBAMMSSession initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:](v21, "initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:", v3->_internalQueue, CFSTR("nmiSession1"), v18, v20, v29, v30, v31, v32);
    nmiSession1 = v19->_nmiSession1;
    v19->_nmiSession1 = v22;

    v24 = -[NIServerNBAMMSSession initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:]([NIServerNBAMMSSession alloc], "initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:", v3->_internalQueue, CFSTR("nmiSession2"), v18, v20);
    nmiSession2 = v19->_nmiSession2;
    v19->_nmiSession2 = v24;

    *(_QWORD *)&v19->_sessionState1 = 0;
    v26 = objc_opt_new(NSMutableDictionary);
    tokenToMutualAuthSessions = v19->_tokenToMutualAuthSessions;
    v19->_tokenToMutualAuthSessions = v26;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)&location);
  }
  return v3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002243DC;
  block[3] = &unk_1007FA668;
  block[4] = a1;
  if (qword_100859548 != -1)
    dispatch_once(&qword_100859548, block);
  return (id)qword_100859540;
}

- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8
{
  id v14;
  id v15;
  void *v16;
  OS_dispatch_queue *internalQueue;
  id v18;
  void *v19;
  _QWORD block[5];
  id v22;
  id v23;
  uint64_t *v24;
  const void *v25;
  const void *v26;
  int v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;

  v14 = a3;
  v15 = a5;
  v16 = v15;
  if (v14)
  {
    if (v15)
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = sub_10022467C;
      v33 = sub_10022468C;
      v34 = 0;
      internalQueue = self->_internalQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100224694;
      block[3] = &unk_10080F570;
      block[4] = self;
      v24 = &v29;
      v22 = v14;
      v28 = a4;
      v23 = v16;
      v25 = a6;
      v26 = a7;
      v27 = a8;
      dispatch_sync((dispatch_queue_t)internalQueue, block);
      v18 = (id)v30[5];

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DFA7C();
      v35 = NSLocalizedFailureReasonErrorKey;
      v36 = CFSTR("Client is nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v19));

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DFA50();
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10012, 0));
  }

  return v18;
}

- (void)unregisterNBAMMSSessionForToken:(id)a3
{
  id v4;
  OS_dispatch_queue *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100224D44;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);

}

- (void)refreshRangingForToken:(id)a3
{
  id v4;
  OS_dispatch_queue *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100225004;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, block);

}

- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4
{
  id v6;
  OS_dispatch_queue *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  const void *v11;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002250C0;
  block[3] = &unk_10080F290;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);

}

- (void)updateSignallingData:(const void *)a3 token:(id)a4
{
  id v6;
  OS_dispatch_queue *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  const void *v11;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100225184;
  block[3] = &unk_10080F290;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);

}

- (void)logUnservableRangingRequestWithToken:(id)a3 isFinder:(BOOL)a4
{
  id v6;
  OS_dispatch_queue *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100225248;
  block[3] = &unk_100809E88;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);

}

- (id)printableState
{
  OS_dispatch_queue *internalQueue;
  id v4;
  _QWORD block[7];
  _QWORD v7[5];
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  NSMutableArray *v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_10022467C;
  v13 = sub_10022468C;
  v14 = objc_opt_new(NSMutableArray);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_10022467C;
  v7[4] = sub_10022468C;
  v8 = objc_opt_new(NSMutableArray);
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100225384;
  block[3] = &unk_10080F598;
  block[4] = self;
  block[5] = &v9;
  block[6] = v7;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)session:(id)a3 updateState:(int)a4
{
  NIServerNBAMMSSession *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  int *p_sessionState1;
  int sessionState1;
  const char *v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  id v16;
  unsigned int v17;
  NIServerNBAMMSSession **p_nmiSession2;
  NIServerNBAMMSSession *v19;
  int *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  NSMutableArray *v26;
  int *__p;
  uint64_t v28;
  _OWORD v29[14];
  char v30;
  _BYTE __dst[504];
  uint8_t buf[520];

  v6 = (NIServerNBAMMSSession *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_nmiSession1 == v6)
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "IDLE";
      if (a4 == 1)
        v9 = "ACQ";
      if (a4 == 2)
        v9 = "RNG";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-range,Received session state %s from nmiSession1", buf, 0xCu);
    }
    p_sessionState1 = &self->_sessionState1;
    sessionState1 = self->_sessionState1;
  }
  else
  {
    v7 = qword_10085F520;
    if (self->_nmiSession2 != v6)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E05B4();
      goto LABEL_37;
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "IDLE";
      if (a4 == 1)
        v12 = "ACQ";
      if (a4 == 2)
        v12 = "RNG";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-range,Received session state %s from nmiSession2", buf, 0xCu);
    }
    p_sessionState1 = &self->_sessionState2;
    sessionState1 = self->_sessionState2;
  }
  if (sessionState1 == a4)
    goto LABEL_37;
  *p_sessionState1 = a4;
  if (!-[NIServerFindingNBAMMSSessionManager shouldAttemptMerging](self, "shouldAttemptMerging"))
    goto LABEL_37;
  v13 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Merging started", buf, 2u);
  }
  v14 = -[NIServerNBAMMSSession sessionState](self->_nmiSession1, "sessionState");
  v15 = 16;
  if (v14 == 1)
    v15 = 8;
  v16 = *(id *)((char *)&self->super.isa + v15);
  v17 = -[NIServerNBAMMSSession sessionState](self->_nmiSession1, "sessionState");
  p_nmiSession2 = &self->_nmiSession2;
  if (v17 == 2)
    p_nmiSession2 = &self->_nmiSession1;
  v19 = *p_nmiSession2;
  if (v16)
  {
    objc_msgSend(v16, "attachedRoles");
    v20 = __p;
    v21 = v28;
  }
  else
  {
    v20 = 0;
    v21 = 0;
    __p = 0;
  }
  if (v21 - (_QWORD)v20 != 4)
    __assert_rtn("-[NIServerFindingNBAMMSSessionManager session:updateState:]", "NIServerFindingRanging.mm", 3034, "acqSessionRoles.size() == 1");
  v22 = *v20;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sessionClientForFinder:", *v20 == 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sessionTokenForFinder:", v22 == 0));
  if (!v16)
  {
    memset(buf, 0, 512);
LABEL_41:
    __assert_rtn("-[NIServerFindingNBAMMSSessionManager session:updateState:]", "NIServerFindingRanging.mm", 3047, "optServiceRequest.has_value()");
  }
  objc_msgSend(v16, "sessionServiceRequestForFinder:", v22 == 0);
  if (!buf[504])
    goto LABEL_41;
  memcpy(__dst, buf, sizeof(__dst));
  objc_msgSend(v16, "sessionStartRangingOptionsForFinder:", v22 == 0);
  if (!v30)
    __assert_rtn("-[NIServerFindingNBAMMSSessionManager session:updateState:]", "NIServerFindingRanging.mm", 3052, "optStartRangingOptions.has_value()");
  v29[4] = v29[11];
  v29[5] = v29[12];
  v29[6] = v29[13];
  v29[0] = v29[7];
  v29[1] = v29[8];
  v29[2] = v29[9];
  v29[3] = v29[10];
  v25 = -[NIServerNBAMMSSession registerNBAMMSSessionWithToken:isFinder:client:serviceRequest:startRangingOptions:sharedProtocol:](v19, "registerNBAMMSSessionWithToken:isFinder:client:serviceRequest:startRangingOptions:sharedProtocol:", v24, v22 == 0, v23, __dst, v29, -[NIServerNBAMMSSession sharedProtocol](v19, "sharedProtocol"));
  v26 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v26, "addObject:", v19);
  -[NSMutableDictionary setObject:forKey:](self->_tokenToMutualAuthSessions, "setObject:forKey:", v26, v24);

  if (__p)
    operator delete(__p);

LABEL_37:
}

- (BOOL)shouldAttemptMerging
{
  int sessionState1;
  BOOL v4;
  NIServerNBAMMSSession *nmiSession1;
  NIServerNBAMMSSession *nmiSession2;
  void *v7;
  _DWORD *__p;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;

  sessionState1 = self->_sessionState1;
  if (sessionState1 == 1)
  {
    if (self->_sessionState2 != 2)
      return 0;
  }
  else if (sessionState1 != 2 || self->_sessionState2 != 1)
  {
    return 0;
  }
  nmiSession1 = self->_nmiSession1;
  if (nmiSession1)
  {
    -[NIServerNBAMMSSession attachedRoles](nmiSession1, "attachedRoles");
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  nmiSession2 = self->_nmiSession2;
  if (nmiSession2)
  {
    -[NIServerNBAMMSSession attachedRoles](nmiSession2, "attachedRoles");
  }
  else
  {
    __p = 0;
    v10 = 0;
  }
  if (v12 - (_QWORD)v11 != 4)
    goto LABEL_17;
  v7 = __p;
  if (v10 - (_QWORD)__p == 4)
  {
    if (*v11 != *__p && -[NIServerNBAMMSSession sharedProtocol](self->_nmiSession1, "sharedProtocol"))
    {
      v4 = -[NIServerNBAMMSSession sharedProtocol](self->_nmiSession2, "sharedProtocol") != 0;
      goto LABEL_18;
    }
LABEL_17:
    v4 = 0;
LABEL_18:
    v7 = __p;
    if (!__p)
      goto LABEL_20;
    goto LABEL_19;
  }
  v4 = 0;
  if (__p)
LABEL_19:
    operator delete(v7);
LABEL_20:
  if (v11)
    operator delete(v11);
  return v4;
}

- (BOOL)shouldInformMutualAuthFailure:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  int v13;
  BOOL v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession sessionTokenForFinder:](self->_nmiSession1, "sessionTokenForFinder:", 1));
  v6 = objc_msgSend(v5, "isEqual:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession sessionTokenForFinder:](self->_nmiSession1, "sessionTokenForFinder:", 0));
  v8 = objc_msgSend(v7, "isEqual:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession sessionTokenForFinder:](self->_nmiSession2, "sessionTokenForFinder:", 1));
  v10 = objc_msgSend(v9, "isEqual:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession sessionTokenForFinder:](self->_nmiSession2, "sessionTokenForFinder:", 0));
  v12 = objc_msgSend(v11, "isEqual:", v4);
  if (v6)
    v13 = 2;
  else
    v13 = 1;
  if (!v8)
    v13 = v6;
  v14 = v13 + v10 + v12 == 1;

  return v14;
}

- (void)mutualAuthUpdateForSession:(id)a3 token:(id)a4 isFinder:(BOOL)a5 result:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  NIServerNBAMMSSession *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NIServerNBAMMSSession *nmiSession1;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  NSObject *v18;
  _BOOL4 v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];

  v6 = a6;
  v7 = a5;
  v10 = (NIServerNBAMMSSession *)a3;
  v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_tokenToMutualAuthSessions, "objectForKey:", v11));

  if (v12)
  {
    if (v6)
    {
      v13 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Attachment is successful", buf, 2u);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_tokenToMutualAuthSessions, "removeObjectForKey:", v11);
      nmiSession1 = self->_nmiSession1;
      if (nmiSession1 != v10 || (nmiSession1 = self->_nmiSession2, nmiSession1 != v10))
        -[NIServerNBAMMSSession unregisterNBAMMSSessionForToken:](nmiSession1, "unregisterNBAMMSSessionForToken:", v11);
      -[NIServerFindingNBAMMSSessionManager _updateAnalyticsWithSuccessfulRangingRequest](self, "_updateAnalyticsWithSuccessfulRangingRequest");
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_tokenToMutualAuthSessions, "objectForKey:", v11));
      if (objc_msgSend(v15, "containsObject:", v10))
      {
        if ((unint64_t)objc_msgSend(v15, "count") < 2)
        {
          v17 = -[NIServerFindingNBAMMSSessionManager shouldInformMutualAuthFailure:](self, "shouldInformMutualAuthFailure:", v11);
          v18 = qword_10085F520;
          v19 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v19)
            {
              *(_WORD *)v21 = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#find-range,Inform mutual auth failure to client", v21, 2u);
            }
            -[NIServerNBAMMSSession informMutualAuthFailuresToClients](v10, "informMutualAuthFailuresToClients");
            -[NIServerFindingNBAMMSSessionManager _updateAnalyticsWithFailedRangingRequestToken:isFinder:](self, "_updateAnalyticsWithFailedRangingRequestToken:isFinder:", v11, v7);
          }
          else
          {
            if (v19)
            {
              *(_WORD *)v20 = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#find-range,Do not inform mutual auth failure to client, clean attached token silently", v20, 2u);
            }
            -[NIServerNBAMMSSession unregisterNBAMMSSessionForToken:](v10, "unregisterNBAMMSSessionForToken:", v11);
            -[NIServerFindingNBAMMSSessionManager _updateAnalyticsWithSuccessfulRangingRequest](self, "_updateAnalyticsWithSuccessfulRangingRequest");
          }
        }
        else
        {
          -[NIServerNBAMMSSession unregisterNBAMMSSessionForToken:](v10, "unregisterNBAMMSSessionForToken:", v11);
          v16 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v22 = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#find-range,One attaching attempt failed, more to come", v22, 2u);
          }
        }
        objc_msgSend(v15, "removeObject:", v10);
        if (!objc_msgSend(v15, "count"))
          -[NSMutableDictionary removeObjectForKey:](self->_tokenToMutualAuthSessions, "removeObjectForKey:", v11);
      }

    }
  }

}

- (pair<int,)_getAuthenticatedFinderFindeeClients
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (unint64_t)-[NIServerNBAMMSSession sessionClientsStatus](self->_nmiSession1, "sessionClientsStatus");
  v5 = v4;
  v7 = ((unint64_t)-[NIServerNBAMMSSession sessionClientsStatus](self->_nmiSession2, "sessionClientsStatus") & 0xFFFFFFFF00000001) == 1;
  if ((v3 & 0xFFFFFFFF00000001) == 1)
    ++v7;
  if ((v6 & 0xFFFFFFFF00000001) == 1)
    v8 = ((v5 & 0xFFFFFFFF00000001) == 1) + 1;
  else
    v8 = (v5 & 0xFFFFFFFF00000001) == 1;
  return (pair<int, int>)(v7 | (v8 << 32));
}

- (BOOL)_isReciprocalFindingPossibleRoleIsFinder:(BOOL)a3 rangingSession:(id)a4
{
  _DWORD *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  _DWORD *v10;
  uint64_t v11;

  v5 = a4;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "attachedRoles"), v5 = v10, v11 - (_QWORD)v10 == 8))
  {
    v7 = 0;
    v8 = 0;
    if (!v10)
      goto LABEL_7;
  }
  else
  {
    v7 = (*v5 == 0) ^ a3;
  }
  operator delete(v5);
  v8 = v7;
LABEL_7:

  return v8;
}

- (void)_updateAnalyticsWithSuccessfulRangingRequest
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  int v11;
  BOOL v12;
  unsigned __int8 v13;
  NSObject *v14;
  pair<int, int> v15;
  GroupFindingAnalytics *analytics;
  uint8_t v17[16];

  v3 = (unint64_t)-[NIServerNBAMMSSession sessionClientsStatus](self->_nmiSession1, "sessionClientsStatus");
  v5 = v4;
  v6 = v3;
  v7 = (unint64_t)-[NIServerNBAMMSSession sessionClientsStatus](self->_nmiSession2, "sessionClientsStatus");
  if ((_BYTE)v3)
    v9 = (v3 & 0xFFFFFFFF00000000) == 0x200000000;
  else
    v9 = 0;
  if (v9
    || ((_BYTE)v5 ? (v10 = (v5 & 0xFFFFFFFF00000000) == 0x200000000) : (v10 = 0),
        v10
     || ((v11 = v7, (_BYTE)v7) ? (v12 = (v7 & 0xFFFFFFFF00000000) == 0x200000000) : (v12 = 0),
         v12 || (v13 = v8) != 0 && (v8 & 0xFFFFFFFF00000000) == 0x200000000)))
  {
    v14 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-range,Mutual-auth still ongoing, not ready for analytics update", v17, 2u);
    }
  }
  else
  {
    v15 = -[NIServerFindingNBAMMSSessionManager _getAuthenticatedFinderFindeeClients](self, "_getAuthenticatedFinderFindeeClients");
    switch((unint64_t)v15)
    {
      case 0x200000000uLL:
        -[GroupFindingAnalytics updateTo0Finder2Findee](self->_analytics, "updateTo0Finder2Findee");
        break;
      case 0x100000001uLL:
        analytics = self->_analytics;
        if (v6 == v5 || v11 == v13)
          -[GroupFindingAnalytics updateToReciprocalFinding](analytics, "updateToReciprocalFinding");
        else
          -[GroupFindingAnalytics updateTo1Finder1Findee](analytics, "updateTo1Finder1Findee");
        break;
      case 0x200000001uLL:
        -[GroupFindingAnalytics updateTo1Finder2Findee](self->_analytics, "updateTo1Finder2Findee");
        break;
    }
  }
}

- (void)_updateAnalyticsWithFailedRangingRequestToken:(id)a3 isFinder:(BOOL)a4
{
  _BOOL4 v4;
  pair<int, int> v6;
  GroupFindingAnalytics *analytics;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = -[NIServerFindingNBAMMSSessionManager _getAuthenticatedFinderFindeeClients](self, "_getAuthenticatedFinderFindeeClients");
  if (v6 == 0x200000000)
  {
    analytics = self->_analytics;
    if (v4)
      -[GroupFindingAnalytics updateWithFinderRequestAt0Finder2Findee:](analytics, "updateWithFinderRequestAt0Finder2Findee:", v8);
    else
      -[GroupFindingAnalytics updateWithFindeeRequestAt0Finder2Findee:](analytics, "updateWithFindeeRequestAt0Finder2Findee:", v8);
  }
  else if (v6 != 0x100000001 || v4)
  {
    if (v6 == 0x200000001 && !v4)
      -[GroupFindingAnalytics updateWithFindeeRequestAt1Finder2Findee:](self->_analytics, "updateWithFindeeRequestAt1Finder2Findee:", v8);
  }
  else
  {
    -[GroupFindingAnalytics updateWithFindeeRequestAt1Finder1Findee:](self->_analytics, "updateWithFindeeRequestAt1Finder1Findee:", v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  sub_10001AE68((uint64_t)&self->_pbLogger);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_tokenToMutualAuthSessions, 0);
  objc_storeStrong((id *)&self->_nmiSession2, 0);
  objc_storeStrong((id *)&self->_nmiSession1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
