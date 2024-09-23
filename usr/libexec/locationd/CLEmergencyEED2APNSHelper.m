@implementation CLEmergencyEED2APNSHelper

- (CLEmergencyEED2APNSHelper)initWithUniverse:(id)a3 apnsTokenCallback:(id)a4 apnsMessageCallback:(id)a5 apnsReconnectedCallback:(id)a6
{
  CLEmergencyEED2APNSHelper *v10;
  uint64_t v11;
  const char *v12;
  APSConnection *v13;
  NSObject *v14;
  APSConnection *apsConnection;
  NSObject *v16;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  __int16 v22;
  objc_super v23;
  id v24;
  uint8_t buf[1640];

  v23.receiver = self;
  v23.super_class = (Class)CLEmergencyEED2APNSHelper;
  v10 = -[CLEmergencyEED2APNSHelper init](&v23, "init");
  if (objc_opt_class(APSConnection, v11))
  {
    v10->_fUniverse = (CLIntersiloUniverse *)a3;
    v10->_fAPNSTokenCallback = _Block_copy(a4);
    v10->_fAPNSMessageCallback = _Block_copy(a5);
    v10->_fAPNSReconnectedCallback = _Block_copy(a6);
    if (byte_102308D5F >= 0)
      v12 = (const char *)&qword_102308D48;
    else
      v12 = (const char *)qword_102308D48;
    v10->_apsdQueue = (OS_dispatch_queue *)dispatch_queue_create(v12, 0);
    v13 = (APSConnection *)objc_msgSend(objc_alloc((Class)APSConnection), "initWithEnvironmentName:namedDelegatePort:queue:", -[CLEmergencyEED2APNSHelper getEEDAPNSEnvironment](v10, "getEEDAPNSEnvironment"), CFSTR("com.apple.aps.eed"), -[CLEmergencyEED2APNSHelper apsdQueue](v10, "apsdQueue"));
    v10->_apsConnection = v13;
    if (!v13)
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021902A8);
      v14 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#EED2APNSHelper,initWithUniverse:apnsTokenCallback,APSConnection init failed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_1021902A8);
        v22 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2APNSHelper,initWithUniverse:apnsTokenCallback,APSConnection init failed", &v22, 2);
        v21 = (uint8_t *)v20;
        sub_100512490("Generic", 1, 0, 0, "-[CLEmergencyEED2APNSHelper initWithUniverse:apnsTokenCallback:apnsMessageCallback:apnsReconnectedCallback:]", "%s\n", v20);
        if (v21 != buf)
          free(v21);
      }
    }
    -[APSConnection setDelegate:](v10->_apsConnection, "setDelegate:", v10);
    apsConnection = v10->_apsConnection;
    v24 = -[CLEmergencyEED2APNSHelper getEEDAPNSTopic](v10, "getEEDAPNSTopic");
    -[APSConnection setEnabledTopics:ignoredTopics:](apsConnection, "setEnabledTopics:ignoredTopics:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1), 0);
    -[APSConnection setEnableCriticalReliability:](v10->_apsConnection, "setEnableCriticalReliability:", 1);
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v16 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#EED2APNSHelper,initWithUniverse:apnsTokenCallback,APSConnection not found init failed, early return", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021902A8);
      v22 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 16, "#EED2APNSHelper,initWithUniverse:apnsTokenCallback,APSConnection not found init failed, early return", &v22, 2);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 0, "-[CLEmergencyEED2APNSHelper initWithUniverse:apnsTokenCallback:apnsMessageCallback:apnsReconnectedCallback:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    return 0;
  }
  return v10;
}

- (void)dealloc
{
  APSConnection *apsConnection;
  objc_super v4;

  apsConnection = self->_apsConnection;
  if (apsConnection)
  {
    -[APSConnection setEnableCriticalReliability:](apsConnection, "setEnableCriticalReliability:", 0);
    -[APSConnection shutdown](self->_apsConnection, "shutdown");

    self->_apsConnection = 0;
  }
  _Block_release(self->_fAPNSTokenCallback);
  self->_fAPNSTokenCallback = 0;
  _Block_release(self->_fAPNSMessageCallback);
  self->_fAPNSMessageCallback = 0;
  _Block_release(self->_fAPNSReconnectedCallback);
  self->_fAPNSReconnectedCallback = 0;
  dispatch_release((dispatch_object_t)self->_apsdQueue);
  v4.receiver = self;
  v4.super_class = (Class)CLEmergencyEED2APNSHelper;
  -[CLEmergencyEED2APNSHelper dealloc](&v4, "dealloc");
}

- (void)requestAPNSToken
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint8_t *v6;
  int v7;
  id v8;
  uint8_t buf[4];
  id v10;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021902A8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = -[CLEmergencyEED2APNSHelper getEEDAPNSTopic](self, "getEEDAPNSTopic");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2,CLEmergencyAPNSHelper,requestAPNSToken,for topic:%@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v4 = qword_1022A0088;
    v7 = 138412290;
    v8 = -[CLEmergencyEED2APNSHelper getEEDAPNSTopic](self, "getEEDAPNSTopic");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v4, 0, "#EED2,CLEmergencyAPNSHelper,requestAPNSToken,for topic:%@", &v7, 12);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper requestAPNSToken]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  -[APSConnection requestTokenForTopic:identifier:](-[CLEmergencyEED2APNSHelper apsConnection](self, "apsConnection"), "requestTokenForTopic:identifier:", -[CLEmergencyEED2APNSHelper getEEDAPNSTopic](self, "getEEDAPNSTopic"), &stru_1021D8FB8);
}

- (id)getEEDAPNSTopic
{
  int v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  char *v10;
  int v12;
  const __CFString *v13;
  _OWORD buf[102];

  sub_1001E4804(buf);
  LOBYTE(v12) = 0;
  v2 = sub_1001E4874(*(uint64_t *)&buf[0], "EEDAPNSTest", (BOOL *)&v12);
  if ((_BYTE)v12)
    v3 = v2;
  else
    v3 = 0;
  v4 = (std::__shared_weak_count *)*((_QWORD *)&buf[0] + 1);
  if (*((_QWORD *)&buf[0] + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&buf[0] + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      if (v3)
        goto LABEL_9;
      return CFSTR("com.apple.eed");
    }
  }
  if (!v3)
    return CFSTR("com.apple.eed");
LABEL_9:
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021902A8);
  v7 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 138543362;
    *(_QWORD *)((char *)buf + 4) = CFSTR("com.apple.eed.test");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,getEEDAPNSTopic,APNS EED test mode with topic:%{public}@", (uint8_t *)buf, 0xCu);
  }
  v8 = CFSTR("com.apple.eed.test");
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v12 = 138543362;
    v13 = CFSTR("com.apple.eed.test");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2APNSHelper,getEEDAPNSTopic,APNS EED test mode with topic:%{public}@", &v12, 12);
    v10 = (char *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper getEEDAPNSTopic]", "%s\n", v9);
    if (v10 != (char *)buf)
      free(v10);
    return CFSTR("com.apple.eed.test");
  }
  return (id)v8;
}

- (id)getEEDAPNSEnvironment
{
  int v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  NSObject *v7;
  id *v8;
  NSObject *v9;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  BOOL v15[16];
  uint8_t buf[8];
  std::__shared_weak_count *v17;

  sub_1001E4804(buf);
  v15[0] = 0;
  v2 = sub_1001E4874(*(uint64_t *)buf, "EEDAPNSEnvironmentDevelopment", v15);
  if (v15[0])
    v3 = v2;
  else
    v3 = 0;
  v4 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v7 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,getEEDAPNSEnvironment,APSEnvironmentDevelopment", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021902A8);
      *(_WORD *)v15 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2APNSHelper,getEEDAPNSEnvironment,APSEnvironmentDevelopment", v15, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper getEEDAPNSEnvironment]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    v8 = (id *)&APSEnvironmentDevelopment;
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v9 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2,getEEDAPNSEnvironment,APSEnvironmentProduction", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021902A8);
      *(_WORD *)v15 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2,getEEDAPNSEnvironment,APSEnvironmentProduction", v15, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper getEEDAPNSEnvironment]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v8 = (id *)&APSEnvironmentProduction;
  }
  return *v8;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021902A8);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v14 = a4;
    v15 = 2113;
    v16 = objc_msgSend(a4, "__imHexString");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connection:didReceivePublicToken,%{private}@,hexstring,%{private}@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v6 = qword_1022A0088;
    v9 = 138478083;
    v10 = a4;
    v11 = 2113;
    v12 = objc_msgSend(a4, "__imHexString");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 0, "#EED2APNSHelper,connection:didReceivePublicToken,%{private}@,hexstring,%{private}@", &v9, 22);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connection:didReceivePublicToken:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD block[6];
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021902A8);
  v9 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478339;
    v28 = a4;
    v29 = 2113;
    v30 = objc_msgSend(a4, "__imHexString");
    v31 = 2114;
    v32 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connection:didReceiveToken,%{private}@,hexstring,%{private}@,forTopic,%{public}@", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v12 = qword_1022A0088;
    v21 = 138478339;
    v22 = a4;
    v23 = 2113;
    v24 = objc_msgSend(a4, "__imHexString");
    v25 = 2114;
    v26 = a5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 0, "#EED2APNSHelper,connection:didReceiveToken,%{private}@,hexstring,%{private}@,forTopic,%{public}@", &v21, 32);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connection:didReceiveToken:forTopic:identifier:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  if ((objc_msgSend(a5, "isEqualToString:", -[CLEmergencyEED2APNSHelper getEEDAPNSTopic](self, "getEEDAPNSTopic")) & 1) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100EA87D0;
    block[3] = &unk_10212BB30;
    block[4] = a4;
    block[5] = self;
    dispatch_async((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](-[CLEmergencyEED2APNSHelper fUniverse](self, "fUniverse"), "silo"), "queue"), block);
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v10 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
    {
      v11 = -[CLEmergencyEED2APNSHelper getEEDAPNSTopic](self, "getEEDAPNSTopic");
      *(_DWORD *)buf = 138543618;
      v28 = a5;
      v29 = 2114;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#EED2APNSHelper,connection:didReceiveToken:forTopic,%{public}@,mismatch with expected topic,%{public}@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_1021902A8);
      v15 = qword_1022A0088;
      v16 = -[CLEmergencyEED2APNSHelper getEEDAPNSTopic](self, "getEEDAPNSTopic");
      v21 = 138543618;
      v22 = a5;
      v23 = 2114;
      v24 = v16;
      LODWORD(v19) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v15, 16, "#EED2APNSHelper,connection:didReceiveToken:forTopic,%{public}@,mismatch with expected topic,%{public}@", &v21, v19);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 0, "-[CLEmergencyEED2APNSHelper connection:didReceiveToken:forTopic:identifier:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD block[6];
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021902A8);
  v6 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v25 = a4;
    v26 = 2112;
    v27 = objc_msgSend(a4, "topic");
    v28 = 2112;
    v29 = objc_msgSend(a4, "token");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connection:didReceiveIncomingMessage,%@,topic,%@,token,%@", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v9 = qword_1022A0088;
    v18 = 138412802;
    v19 = a4;
    v20 = 2112;
    v21 = objc_msgSend(a4, "topic");
    v22 = 2112;
    v23 = objc_msgSend(a4, "token");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "#EED2APNSHelper,connection:didReceiveIncomingMessage,%@,topic,%@,token,%@", &v18, 32);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connection:didReceiveIncomingMessage:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021902A8);
  v7 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(a4, "userInfo");
    *(_DWORD *)buf = 138412290;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connection:didReceiveIncomingMessage,userInfo,%@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v12 = qword_1022A0088;
    v13 = objc_msgSend(a4, "userInfo");
    v18 = 138412290;
    v19 = v13;
    LODWORD(v16) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 0, "#EED2APNSHelper,connection:didReceiveIncomingMessage,userInfo,%@", &v18, v16);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connection:didReceiveIncomingMessage:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100EA8E70;
  block[3] = &unk_10212BB30;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](-[CLEmergencyEED2APNSHelper fUniverse](self, "fUniverse"), "silo"), "queue"), block);
}

- (void)connectionDidReconnect:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _QWORD block[5];
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_1021902A8);
  v4 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connectionDidReconnect", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_1021902A8);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#EED2APNSHelper,connectionDidReconnect", v8, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connectionDidReconnect:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100EA9228;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)objc_msgSend(-[CLIntersiloUniverse silo](-[CLEmergencyEED2APNSHelper fUniverse](self, "fUniverse"), "silo"), "queue"), block);
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)apsdQueue
{
  return self->_apsdQueue;
}

- (void)setApsdQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CLIntersiloUniverse)fUniverse
{
  return self->_fUniverse;
}

- (void)setFUniverse:(id)a3
{
  self->_fUniverse = (CLIntersiloUniverse *)a3;
}

- (id)fAPNSTokenCallback
{
  return self->_fAPNSTokenCallback;
}

- (void)setFAPNSTokenCallback:(id)a3
{
  self->_fAPNSTokenCallback = a3;
}

- (id)fAPNSMessageCallback
{
  return self->_fAPNSMessageCallback;
}

- (void)setFAPNSMessageCallback:(id)a3
{
  self->_fAPNSMessageCallback = a3;
}

- (id)fAPNSReconnectedCallback
{
  return self->_fAPNSReconnectedCallback;
}

- (void)setFAPNSReconnectedCallback:(id)a3
{
  self->_fAPNSReconnectedCallback = a3;
}

@end
