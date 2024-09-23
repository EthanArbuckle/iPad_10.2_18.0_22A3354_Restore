@implementation CSKappaConnection

- (CSKappaConnection)init
{
  CSKappaConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSKappaConnection;
  v2 = -[CSKappaConnection init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("CSKappaConnectionQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    operator new();
  }
  return 0;
}

- (void)defaultMessageHandler:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **ptr;
  NSObject *v4;
  uint64_t *v5;
  int v6;
  uint64_t *v7;
  uint64_t Dictionary;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t *v16;
  __int16 v17;
  uint64_t v18;

  ptr = (CLConnectionMessage **)a3.__ptr_;
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v4 = (id)qword_100387398;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (uint64_t *)CLConnectionMessage::name(*ptr);
    v6 = *((char *)v5 + 23);
    v7 = (uint64_t *)*v5;
    Dictionary = CLConnectionMessage::getDictionary(*ptr);
    v9 = objc_claimAutoreleasedReturnValue(Dictionary);
    v10 = (void *)v9;
    if (v6 >= 0)
      v11 = v5;
    else
      v11 = v7;
    v12[0] = 68289538;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = v11;
    v17 = 2114;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"defaultMessageHandler\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x26u);

  }
}

- (void)interruptionHandler
{
  NSObject *v2;
  uint8_t v3[16];

  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v2 = qword_100387398;
  if (os_log_type_enabled((os_log_t)qword_100387398, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection Interrupted", v3, 2u);
  }
}

- (void)sendTestMessage:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;
  uint64_t Dictionary;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  void *connection;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  CLConnectionMessage *v22;
  std::__shared_weak_count *v23;
  id v24;
  CLConnectionMessage *v25;
  std::__shared_weak_count *v26;
  void *__p;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t *v31;
  __int16 v32;
  uint64_t v33;

  v3 = *(_QWORD *)&a3;
  sub_100007088(&__p, (char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.kappa.message.test"), "UTF8String"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  sub_1002463CC((uint64_t)&__p, &v24, &v25);

  if (SBYTE3(v31) < 0)
    operator delete(__p);
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v5 = (id)qword_100387398;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (uint64_t *)CLConnectionMessage::name(v25);
    v7 = *((char *)v6 + 23);
    v8 = (uint64_t *)*v6;
    Dictionary = CLConnectionMessage::getDictionary(v25);
    v10 = objc_claimAutoreleasedReturnValue(Dictionary);
    v11 = (void *)v10;
    if (v7 >= 0)
      v12 = v6;
    else
      v12 = v8;
    __p = (void *)68289538;
    v28 = 2082;
    v29 = "";
    v30 = 2082;
    v31 = v12;
    v32 = 2114;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestMessage\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);

  }
  connection = self->_connection;
  v22 = v25;
  v23 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage(connection, &v22, 0);
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v26;
  if (v26)
  {
    v20 = (unint64_t *)&v26->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

- (void)sendTestCachedMessage:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;
  uint64_t Dictionary;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  void *connection;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  CLConnectionMessage *v22;
  std::__shared_weak_count *v23;
  id v24;
  CLConnectionMessage *v25;
  std::__shared_weak_count *v26;
  void *__p;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t *v31;
  __int16 v32;
  uint64_t v33;

  v3 = *(_QWORD *)&a3;
  sub_100007088(&__p, (char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.kappa.message.test"), "UTF8String"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  sub_1002463CC((uint64_t)&__p, &v24, &v25);

  if (SBYTE3(v31) < 0)
    operator delete(__p);
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v5 = (id)qword_100387398;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (uint64_t *)CLConnectionMessage::name(v25);
    v7 = *((char *)v6 + 23);
    v8 = (uint64_t *)*v6;
    Dictionary = CLConnectionMessage::getDictionary(v25);
    v10 = objc_claimAutoreleasedReturnValue(Dictionary);
    v11 = (void *)v10;
    if (v7 >= 0)
      v12 = v6;
    else
      v12 = v8;
    __p = (void *)68289538;
    v28 = 2082;
    v29 = "";
    v30 = 2082;
    v31 = v12;
    v32 = 2114;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestMessage\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);

  }
  connection = self->_connection;
  v22 = v25;
  v23 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage(connection, &v22, 1);
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v26;
  if (v26)
  {
    v20 = (unint64_t *)&v26->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

- (void)sendTestTrigger
{
  NSObject *v3;
  uint64_t *v4;
  int v5;
  uint64_t *v6;
  uint64_t Dictionary;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  void *connection;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  CLConnectionMessage *v20;
  std::__shared_weak_count *v21;
  CLConnectionMessage *v22;
  std::__shared_weak_count *v23;
  void *__p;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t *v28;
  __int16 v29;
  uint64_t v30;

  sub_100007088(&__p, (char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.kappa.trigger.test"), "UTF8String"));
  sub_1002464D0(&v22);
  if (SBYTE3(v28) < 0)
    operator delete(__p);
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v3 = (id)qword_100387398;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (uint64_t *)CLConnectionMessage::name(v22);
    v5 = *((char *)v4 + 23);
    v6 = (uint64_t *)*v4;
    Dictionary = CLConnectionMessage::getDictionary(v22);
    v8 = objc_claimAutoreleasedReturnValue(Dictionary);
    v9 = (void *)v8;
    if (v5 >= 0)
      v10 = v4;
    else
      v10 = v6;
    __p = (void *)68289538;
    v25 = 2082;
    v26 = "";
    v27 = 2082;
    v28 = v10;
    v29 = 2114;
    v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestTrigger\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);

  }
  connection = self->_connection;
  v20 = v22;
  v21 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage(connection, &v20, 0);
  v14 = v21;
  if (v21)
  {
    v15 = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

- (void)sendTestSOS
{
  NSObject *v3;
  uint64_t *v4;
  int v5;
  uint64_t *v6;
  uint64_t Dictionary;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  void *connection;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  CLConnectionMessage *v20;
  std::__shared_weak_count *v21;
  CLConnectionMessage *v22;
  std::__shared_weak_count *v23;
  void *__p;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t *v28;
  __int16 v29;
  uint64_t v30;

  sub_100007088(&__p, (char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.kappa.sos.test"), "UTF8String"));
  sub_1002464D0(&v22);
  if (SBYTE3(v28) < 0)
    operator delete(__p);
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v3 = (id)qword_100387398;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (uint64_t *)CLConnectionMessage::name(v22);
    v5 = *((char *)v4 + 23);
    v6 = (uint64_t *)*v4;
    Dictionary = CLConnectionMessage::getDictionary(v22);
    v8 = objc_claimAutoreleasedReturnValue(Dictionary);
    v9 = (void *)v8;
    if (v5 >= 0)
      v10 = v4;
    else
      v10 = v6;
    __p = (void *)68289538;
    v25 = 2082;
    v26 = "";
    v27 = 2082;
    v28 = v10;
    v29 = 2114;
    v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestSOS\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);

  }
  connection = self->_connection;
  v20 = v22;
  v21 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage(connection, &v20, 0);
  v14 = v21;
  if (v21)
  {
    v15 = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

- (void)sendTestTTR
{
  NSObject *v3;
  uint64_t *v4;
  int v5;
  uint64_t *v6;
  uint64_t Dictionary;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  void *connection;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  CLConnectionMessage *v20;
  std::__shared_weak_count *v21;
  CLConnectionMessage *v22;
  std::__shared_weak_count *v23;
  void *__p;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t *v28;
  __int16 v29;
  uint64_t v30;

  sub_100007088(&__p, (char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.kappa.ttr.test"), "UTF8String"));
  sub_1002464D0(&v22);
  if (SBYTE3(v28) < 0)
    operator delete(__p);
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v3 = (id)qword_100387398;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (uint64_t *)CLConnectionMessage::name(v22);
    v5 = *((char *)v4 + 23);
    v6 = (uint64_t *)*v4;
    Dictionary = CLConnectionMessage::getDictionary(v22);
    v8 = objc_claimAutoreleasedReturnValue(Dictionary);
    v9 = (void *)v8;
    if (v5 >= 0)
      v10 = v4;
    else
      v10 = v6;
    __p = (void *)68289538;
    v25 = 2082;
    v26 = "";
    v27 = 2082;
    v28 = v10;
    v29 = 2114;
    v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestTTR\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);

  }
  connection = self->_connection;
  v20 = v22;
  v21 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage(connection, &v20, 0);
  v14 = v21;
  if (v21)
  {
    v15 = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

- (void)sendCommand:(int)a3
{
  void *v4;
  NSObject *v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;
  uint64_t Dictionary;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  void *connection;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  CLConnectionMessage *v22;
  std::__shared_weak_count *v23;
  CLConnectionMessage *v24;
  std::__shared_weak_count *v25;
  id v26;
  void *__p;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t *v31;
  __int16 v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;

  v34 = CFSTR("CSKappaCommandKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
  v35 = v4;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));

  sub_100007088(&__p, (char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.kappa.command"), "UTF8String"));
  sub_100246574((uint64_t)&__p, &v26, &v24);
  if (SBYTE3(v31) < 0)
    operator delete(__p);
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v5 = (id)qword_100387398;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (uint64_t *)CLConnectionMessage::name(v24);
    v7 = *((char *)v6 + 23);
    v8 = (uint64_t *)*v6;
    Dictionary = CLConnectionMessage::getDictionary(v24);
    v10 = objc_claimAutoreleasedReturnValue(Dictionary);
    v11 = (void *)v10;
    if (v7 >= 0)
      v12 = v6;
    else
      v12 = v8;
    __p = (void *)68289538;
    v28 = 2082;
    v29 = "";
    v30 = 2082;
    v31 = v12;
    v32 = 2114;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendCommand\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);

  }
  connection = self->_connection;
  v22 = v24;
  v23 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage(connection, &v22, 0);
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v25;
  if (v25)
  {
    v20 = (unint64_t *)&v25->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

}

- (void)sendCommand:(int)a3 withValue:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t *v9;
  int v10;
  uint64_t *v11;
  uint64_t Dictionary;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  void *connection;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  CLConnectionMessage *v25;
  std::__shared_weak_count *v26;
  CLConnectionMessage *v27;
  std::__shared_weak_count *v28;
  id v29;
  void *__p;
  __int16 v31;
  const char *v32;
  __int16 v33;
  uint64_t *v34;
  __int16 v35;
  uint64_t v36;
  _QWORD v37[2];
  _QWORD v38[2];

  v4 = *(_QWORD *)&a4;
  v37[0] = CFSTR("CSKappaCommandKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
  v38[0] = v6;
  v37[1] = CFSTR("CSKappaValueKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v38[1] = v7;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 2));

  sub_100007088(&__p, (char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.kappa.command"), "UTF8String"));
  sub_100246574((uint64_t)&__p, &v29, &v27);
  if (SBYTE3(v34) < 0)
    operator delete(__p);
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v8 = (id)qword_100387398;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (uint64_t *)CLConnectionMessage::name(v27);
    v10 = *((char *)v9 + 23);
    v11 = (uint64_t *)*v9;
    Dictionary = CLConnectionMessage::getDictionary(v27);
    v13 = objc_claimAutoreleasedReturnValue(Dictionary);
    v14 = (void *)v13;
    if (v10 >= 0)
      v15 = v9;
    else
      v15 = v11;
    __p = (void *)68289538;
    v31 = 2082;
    v32 = "";
    v33 = 2082;
    v34 = v15;
    v35 = 2114;
    v36 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendCommand\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);

  }
  connection = self->_connection;
  v25 = v27;
  v26 = v28;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage(connection, &v25, &stru_10035C880);
  v19 = v26;
  if (v26)
  {
    v20 = (unint64_t *)&v26->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v28;
  if (v28)
  {
    v23 = (unint64_t *)&v28->__shared_owners_;
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

- (void)sendTestSMSignal:(double)a3
{
  void *v4;
  NSObject *v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;
  uint64_t Dictionary;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  void *connection;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  CLConnectionMessage *v22;
  std::__shared_weak_count *v23;
  CLConnectionMessage *v24;
  std::__shared_weak_count *v25;
  id v26;
  void *__p;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t *v31;
  __int16 v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;

  v34 = CFSTR("testSMSignal");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v35 = v4;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));

  sub_100007088(&__p, (char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.kappa.signal.test"), "UTF8String"));
  sub_100246574((uint64_t)&__p, &v26, &v24);
  if (SBYTE3(v31) < 0)
    operator delete(__p);
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v5 = (id)qword_100387398;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (uint64_t *)CLConnectionMessage::name(v24);
    v7 = *((char *)v6 + 23);
    v8 = (uint64_t *)*v6;
    Dictionary = CLConnectionMessage::getDictionary(v24);
    v10 = objc_claimAutoreleasedReturnValue(Dictionary);
    v11 = (void *)v10;
    if (v7 >= 0)
      v12 = v6;
    else
      v12 = v8;
    __p = (void *)68289538;
    v28 = 2082;
    v29 = "";
    v30 = 2082;
    v31 = v12;
    v32 = 2114;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestSMSignal\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);

  }
  connection = self->_connection;
  v22 = v24;
  v23 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage(connection, &v22, 0);
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v25;
  if (v25)
  {
    v20 = (unint64_t *)&v25->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

}

- (void)sendTestPowerAssertion:(double)a3
{
  void *v4;
  NSObject *v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;
  uint64_t Dictionary;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  void *connection;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  CLConnectionMessage *v22;
  std::__shared_weak_count *v23;
  CLConnectionMessage *v24;
  std::__shared_weak_count *v25;
  id v26;
  void *__p;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t *v31;
  __int16 v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;

  v34 = CFSTR("testPowerAssertionCmd");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v35 = v4;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));

  sub_100007088(&__p, (char *)objc_msgSend(CFSTR("com.apple.anomalydetectiond.kappa.powerassertion.test"), "UTF8String"));
  sub_100246574((uint64_t)&__p, &v26, &v24);
  if (SBYTE3(v31) < 0)
    operator delete(__p);
  if (qword_100387390 != -1)
    dispatch_once(&qword_100387390, &stru_10035C8A0);
  v5 = (id)qword_100387398;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (uint64_t *)CLConnectionMessage::name(v24);
    v7 = *((char *)v6 + 23);
    v8 = (uint64_t *)*v6;
    Dictionary = CLConnectionMessage::getDictionary(v24);
    v10 = objc_claimAutoreleasedReturnValue(Dictionary);
    v11 = (void *)v10;
    if (v7 >= 0)
      v12 = v6;
    else
      v12 = v8;
    __p = (void *)68289538;
    v28 = 2082;
    v29 = "";
    v30 = 2082;
    v31 = v12;
    v32 = 2114;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestSMSignal\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);

  }
  connection = self->_connection;
  v22 = v24;
  v23 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage(connection, &v22, 0);
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v25;
  if (v25)
  {
    v20 = (unint64_t *)&v25->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
