@implementation CLDurianClientAdapter

- (NSString)clientname
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (CLDurianClientAdapter)initWithClient:(CLDurianManagementClient *)a3
{
  CLDurianClientAdapter *v4;
  CLDurianClientAdapter *v5;
  void *p_p;
  NSObject *v7;
  NSString *clientname;
  objc_super v10;
  void *__p;
  __int16 v12;
  const char *v13;
  __int16 v14;
  NSString *v15;

  v10.receiver = self;
  v10.super_class = (Class)CLDurianClientAdapter;
  v4 = -[CLDurianClientAdapter init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    v4->_valid = 1;
    v4->_client = a3;
    (*((void (**)(void **__return_ptr, CLDurianManagementClient *))a3->var0 + 3))(&__p, a3);
    if (SBYTE3(v15) >= 0)
      p_p = &__p;
    else
      p_p = __p;
    v5->_clientname = (NSString *)-[NSArray lastObject](-[NSString componentsSeparatedByString:](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p), "componentsSeparatedByString:", CFSTR("/")), "lastObject");
    if (SBYTE3(v15) < 0)
      operator delete(__p);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021479A8);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      clientname = v5->_clientname;
      __p = (void *)68289282;
      v12 = 2082;
      v13 = "";
      v14 = 2114;
      v15 = clientname;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #client init\", \"name\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x1Cu);
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianClientAdapter;
  -[CLDurianClientAdapter dealloc](&v3, "dealloc");
}

- (void)sendMessage:()basic_string<char forTag:()std:(std::allocator<char>> *)a3 :char_traits<char> withError:
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v9;
  uint64_t *v10;
  uint64_t *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSString *clientname;
  id v16;
  CLDurianManagementClient *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD v30[2];
  CLConnectionMessage *v31;
  std::__shared_weak_count *v32;
  NSDictionary *v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  id v45;
  const __CFString *v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];

  v5 = v4;
  v6 = v3;
  v33 = 0;
  if (v4)
  {
    v48[0] = CFSTR("CLDurianIdentifier");
    v48[1] = CFSTR("CLDurianError");
    v49[0] = v3;
    v49[1] = v4;
    v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  }
  else
  {
    v46 = CFSTR("CLDurianIdentifier");
    v47 = v3;
    v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  }
  v33 = v9;
  sub_1005E0C4C((uint64_t)a3, &v33, &v31);
  v10 = (uint64_t *)CLConnectionMessage::name(v31);
  if (*((char *)v10 + 23) >= 0)
    v11 = v10;
  else
    v11 = (uint64_t *)*v10;
  v12 = -[NSArray lastObject](-[NSString componentsSeparatedByString:](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11), "componentsSeparatedByString:", CFSTR("/")), "lastObject");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021479A8);
  v13 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(objc_msgSend(v6, "description"), "substringToIndex:", 8);
    clientname = self->_clientname;
    v16 = objc_msgSend(v5, "description");
    *(_DWORD *)buf = 68290051;
    v36 = 2082;
    v35 = 0;
    v37 = "";
    v38 = 2114;
    v39 = v12;
    v40 = 2113;
    v41 = v14;
    v42 = 2114;
    v43 = clientname;
    v44 = 2114;
    v45 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #client sendMessage\", \"name\":%{public, location:escape_only}@, \"item\":%{private, location:escape_only}@, \"client\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
  }
  if (-[CLDurianClientAdapter client](self, "client"))
  {
    v17 = -[CLDurianClientAdapter client](self, "client");
    v18 = v32;
    v30[0] = v31;
    v30[1] = v32;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    sub_1005D6420((uint64_t)v17, (uint64_t)v30);
    if (v18)
    {
      v21 = (unint64_t *)&v18->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021479A8);
    v23 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(objc_msgSend(v6, "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2113;
      v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #client invalid\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021479A8);
    }
    v25 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v26 = objc_msgSend(objc_msgSend(v6, "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2113;
      v39 = v26;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #client invalid", "{\"msg%{public}.0s\":\"#durian #client invalid\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  v27 = v32;
  if (v32)
  {
    v28 = (unint64_t *)&v32->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
}

- (void)sendMessage:()basic_string<char forTag:()std:(std::allocator<char>> *)a3 :char_traits<char> withPayload:
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSString *clientname;
  id v14;
  CLDurianManagementClient *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD v28[2];
  CLConnectionMessage *v29;
  std::__shared_weak_count *v30;
  id v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  NSString *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;

  v5 = v3;
  v31 = v4;
  sub_1005E0C4C((uint64_t)a3, &v31, &v29);
  v7 = objc_msgSend(v31, "objectForKey:", CFSTR("CLDurianError"));
  v8 = (uint64_t *)CLConnectionMessage::name(v29);
  if (*((char *)v8 + 23) >= 0)
    v9 = v8;
  else
    v9 = (uint64_t *)*v8;
  v10 = -[NSArray lastObject](-[NSString componentsSeparatedByString:](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9), "componentsSeparatedByString:", CFSTR("/")), "lastObject");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021479A8);
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(objc_msgSend(v5, "description"), "substringToIndex:", 8);
    clientname = self->_clientname;
    v14 = objc_msgSend(v7, "description");
    *(_DWORD *)buf = 68290307;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v36 = 2114;
    v37 = v10;
    v38 = 2113;
    v39 = v12;
    v40 = 2114;
    v41 = clientname;
    v42 = 2114;
    v43 = v14;
    v44 = 2113;
    v45 = v31;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #client sendMessage\", \"name\":%{public, location:escape_only}@, \"item\":%{private, location:escape_only}@, \"client\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"payload\":%{private, location:escape_only}@}", buf, 0x44u);
  }
  if (-[CLDurianClientAdapter client](self, "client"))
  {
    v15 = -[CLDurianClientAdapter client](self, "client");
    v16 = v30;
    v28[0] = v29;
    v28[1] = v30;
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }
    sub_1005D6420((uint64_t)v15, (uint64_t)v28);
    if (v16)
    {
      v19 = (unint64_t *)&v16->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021479A8);
    v21 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(objc_msgSend(v5, "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #client invalid\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021479A8);
    }
    v23 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v24 = objc_msgSend(objc_msgSend(v5, "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2113;
      v37 = v24;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #client invalid", "{\"msg%{public}.0s\":\"#durian #client invalid\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  v25 = v30;
  if (v30)
  {
    v26 = (unint64_t *)&v30->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  id v7;
  _UNKNOWN **v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  void *__p[2];
  char v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  if (_os_feature_enabled_impl("CoreLocation", "StandardUT")
    && (objc_msgSend(a3, "isApple") & 1) == 0)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021479A8);
    v13 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v10 = "{\"msg%{public}.0s\":\"#durian #client dropping non-Apple advertisement\"}";
      v11 = v13;
      v12 = 18;
      goto LABEL_23;
    }
  }
  else
  {
    if (a4 && objc_msgSend(a4, "uuid"))
    {
      v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      if (objc_msgSend(a3, "scanDate"))
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "scanDate"), CFSTR("CLAvengerAdvertisementScanDateKey"));
      if (objc_msgSend(a3, "address"))
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "address"), CFSTR("CLAvengerAdvertisementAddressKey"));
      if (objc_msgSend(a3, "advertisementData"))
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "advertisementData"), CFSTR("CLAvengerAdvertisementDataKey"));
      if (objc_msgSend(a3, "reserved"))
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "reserved"), CFSTR("CLAvengerAdvertisementReservedKey"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "type")), CFSTR("CLAvengerAdvertisementOwnershipTypeKey"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(a3, "status")), CFSTR("CLAvengerAdvertisementStatusKey"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "rssi")), CFSTR("CLAvengerAdvertisementRSSIKey"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a4, "uuid"), CFSTR("CLDurianIdentifier"));
      if (objc_msgSend(a3, "channel"))
        v8 = (_UNKNOWN **)objc_msgSend(a3, "channel");
      else
        v8 = &off_10221B2D0;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("CLAvengerAdvertisementChannelKey"));
      sub_1015A2E04(__p, "DurianManagement/DidObserveAdvertisement");
      -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, objc_msgSend(a4, "uuid"), v7);
      if (v15 < 0)
        operator delete(__p[0]);
      return;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021479A8);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68290563;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = objc_msgSend(a3, "address");
      v22 = 2113;
      v23 = objc_msgSend(a3, "advertisementData");
      v24 = 2113;
      v25 = objc_msgSend(a3, "scanDate");
      v26 = 1025;
      v27 = objc_msgSend(a3, "status");
      v28 = 2049;
      v29 = objc_msgSend(a3, "rssi");
      v30 = 2113;
      v31 = objc_msgSend(a3, "reserved");
      v10 = "{\"msg%{public}.0s\":\"#durian #client skipping unreconciled advertisement\", \"address\":%{private, locatio"
            "n:escape_only}@, \"advertisementData\":%{private, location:escape_only}@, \"scanDate\":%{private, location:e"
            "scape_only}@, \"status\":%{private}u, \"rssi\":%{private}ld, \"reserved\":%{private, location:escape_only}@}";
      v11 = v9;
      v12 = 74;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    }
  }
}

- (id)clientIdentifier
{
  return self->_clientname;
}

- (void)onUpdatedPowerState
{
  sub_1005D6D14((uint64_t)-[CLDurianClientAdapter client](self, "client"));
}

- (void)didStartPlayingSoundOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidStartPlayingSound");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didCompletePlayingSoundOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidCompletePlayingSound");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didStopPlayingSoundOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidStopPlayingSound");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didCompletePlayingUnauthorizedSoundOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidCompletePlayingUnauthorizedSound");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didStartPlayingUnauthorizedSoundOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidStartPlayingUnauthorizedSound");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didStopPlayingUnauthorizedSoundOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidStopPlayingUnauthorizedSound");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didConnectToTag:(id)a3 withMacAddress:(id)a4 withError:(id)a5
{
  NSDictionary *v7;
  void **v8;
  NSDictionary *v9;
  _QWORD v10[2];
  char v11;
  _QWORD v12[2];
  char v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];

  if (a5)
  {
    v16[0] = CFSTR("CLDurianIdentifier");
    v16[1] = CFSTR("CLDurianError");
    v17[0] = a3;
    v17[1] = a5;
    v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    sub_1015A2E04(v12, "DurianManagement/DidConnect");
    -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", v12, a3, v7);
    if ((v13 & 0x80000000) == 0)
      return;
    v8 = (void **)v12;
  }
  else
  {
    v14[0] = CFSTR("CLDurianIdentifier");
    v14[1] = CFSTR("CLDurianMacAddress");
    v15[0] = a3;
    v15[1] = a4;
    v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    sub_1015A2E04(v10, "DurianManagement/DidConnect");
    -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", v10, a3, v9);
    if ((v11 & 0x80000000) == 0)
      return;
    v8 = (void **)v10;
  }
  operator delete(*v8);
}

- (void)didDisconnectFromTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidDisconnect");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didReceiveKeyRollIndex:(unsigned int)a3 onTag:(id)a4
{
  NSDictionary *v6;
  void *__p[2];
  char v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = CFSTR("CLDurianIdentifier");
  v9[1] = CFSTR("CLDurianKeyRollIndex");
  v10[0] = a4;
  v10[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  sub_1015A2E04(__p, "DurianManagement/DidReceiveKeyRollIndex");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v6);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didFetchConnectionState:(unint64_t)a3 forTag:(id)a4 withError:(id)a5
{
  NSDictionary *v7;
  void *__p[2];
  char v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v10[0] = CFSTR("CLDurianIdentifier");
  v10[1] = CFSTR("CLDurianConnectionState");
  v11[0] = a4;
  v11[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3);
  v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  sub_1015A2E04(__p, "DurianManagement/DidFetchConnectionState");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v7);
  if (v9 < 0)
    operator delete(__p[0]);
}

- (void)didGetMultiStatus:(unint64_t)a3 forTag:(id)a4 withError:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
  {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  }
  else if (a3)
  {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), CFSTR("CLDurianMultiStatus"));
  }
  sub_1015A2E04(__p, "DurianManagement/DidGetMultiStatus");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didReceiveGroupRelationStatus:(unsigned __int8)a3 maintenanceStatus:(unsigned __int8)a4 onTag:(id)a5 withError:(id)a6
{
  uint64_t v7;
  NSDictionary *v9;
  void *__p[2];
  char v11;
  _QWORD v12[3];
  _QWORD v13[3];

  v7 = a4;
  v13[0] = a5;
  v12[0] = CFSTR("CLDurianIdentifier");
  v12[1] = CFSTR("CLDurianGroupRelation");
  v13[1] = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", a3);
  v12[2] = CFSTR("CLDurianGroupMaintenance");
  v13[2] = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v7);
  v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  sub_1015A2E04(__p, "DurianManagement/DidReceiveGroupStatus");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a5, v9);
  if (v11 < 0)
    operator delete(__p[0]);
}

- (void)didDetectCrashOnTag:(id)a3
{
  NSDictionary *v5;
  void *__p[2];
  char v7;
  const __CFString *v8;
  id v9;

  v8 = CFSTR("CLDurianIdentifier");
  v9 = a3;
  v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  sub_1015A2E04(__p, "DurianManagement/DidDetectCrash");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v5);
  if (v7 < 0)
    operator delete(__p[0]);
}

- (void)didDumpLogs:(id)a3 ofType:(unint64_t)a4 fromTag:(id)a5 withError:(id)a6
{
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  __CFString **v12;
  void *__p[2];
  char v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v15[0] = CFSTR("CLDurianIdentifier");
  v15[1] = CFSTR("CLDurianLogType");
  v16[0] = a5;
  v16[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4);
  v10 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  v11 = v10;
  if (a6)
  {
    v12 = &off_1021407C8;
  }
  else
  {
    if (!a3)
      goto LABEL_6;
    v12 = &off_1021407D0;
    a6 = a3;
  }
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", a6, *v12);
LABEL_6:
  sub_1015A2E04(__p, "DurianManagement/DidDumpLogs");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a5, v11);
  if (v14 < 0)
    operator delete(__p[0]);
}

- (void)didFetchFirmwareVersion:(id)a3 fromTag:(id)a4 withError:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  __CFString **v11;
  void *__p[2];
  char v13;
  const __CFString *v14;
  id v15;

  v14 = CFSTR("CLDurianIdentifier");
  v15 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v10 = v9;
  if (a5)
  {
    v11 = &off_1021407C8;
  }
  else
  {
    if (!a3)
      goto LABEL_6;
    v11 = &off_1021407E0;
    a5 = a3;
  }
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, *v11);
LABEL_6:
  sub_1015A2E04(__p, "DurianManagement/DidFetchFirmwareVersion");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v13 < 0)
    operator delete(__p[0]);
}

- (void)didFetchUserStats_Deprecated:(id)a3 fromTag:(id)a4 withError:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  __CFString **v11;
  void *__p[2];
  char v13;
  const __CFString *v14;
  id v15;

  v14 = CFSTR("CLDurianIdentifier");
  v15 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v10 = v9;
  if (a5)
  {
    v11 = &off_1021407C8;
  }
  else
  {
    if (!a3)
      goto LABEL_6;
    v11 = &off_102140840;
    a5 = a3;
  }
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, *v11);
LABEL_6:
  sub_1015A2E04(__p, "DurianManagement/DidFetchUserStats_Deprecated");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v13 < 0)
    operator delete(__p[0]);
}

- (void)didFetchUserStats:(id)a3 fromTag:(id)a4 withError:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  __CFString **v11;
  void *__p[2];
  char v13;
  const __CFString *v14;
  id v15;

  v14 = CFSTR("CLDurianIdentifier");
  v15 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v10 = v9;
  if (a5)
  {
    v11 = &off_1021407C8;
  }
  else
  {
    if (!a3)
      goto LABEL_6;
    v11 = &off_102140840;
    a5 = a3;
  }
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, *v11);
LABEL_6:
  sub_1015A2E04(__p, "DurianManagement/DidFetchUserStats");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v13 < 0)
    operator delete(__p[0]);
}

- (void)didUnpairFromTag:(id)a3 withError:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidUnpair");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didSetTagTypeOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidSetTagType");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didSetObfuscatedIdentifierOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidSetObfuscatedIdentifier");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didSetNearOwnerTimeoutOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidSetNearOwnerTimeout");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didSetWildModeConfigruationOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidSetWildConfiguration");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didRollWildKeyOnTag:(id)a3 withError:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidRollWildKey");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didInitRangingOnTag:(id)a3 withStatus:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v6 = *(_QWORD *)&a4;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6), CFSTR("CLDurianRangingStatus"));
  sub_1015A2E04(__p, "DurianManagement/DidInitRanging");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didDeinitRangingOnTag:(id)a3 withStatus:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v6 = *(_QWORD *)&a4;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6), CFSTR("CLDurianRangingStatus"));
  sub_1015A2E04(__p, "DurianManagement/DidDeinitRanging");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didConfigureRangingOnTag:(id)a3 withStatus:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v6 = *(_QWORD *)&a4;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6), CFSTR("CLDurianRangingStatus"));
  sub_1015A2E04(__p, "DurianManagement/DidConfigureRanging");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didPrepareRangingOnTag:(id)a3 error:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidPrepareRanging");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didStartRangingOnTag:(id)a3 error:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidStartRanging");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didCompleteRangingOnTag:(id)a3 withStatus:(unsigned int)a4 endReason:(unsigned __int8)a5 error:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *__p[2];
  char v14;
  const __CFString *v15;
  id v16;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v15 = CFSTR("CLDurianIdentifier");
  v16 = a3;
  v11 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v12 = v11;
  if (a6)
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", a6, CFSTR("CLDurianError"));
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8), CFSTR("CLDurianRangingStatus"));
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v7), CFSTR("CLDurianRangingEndReason"));
  sub_1015A2E04(__p, "DurianManagement/DidCompleteRanging");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v12);
  if (v14 < 0)
    operator delete(__p[0]);
}

- (void)didReceiveRangingErrorFromTag:(id)a3 withStatus:(unsigned int)a4
{
  NSDictionary *v6;
  void *__p[2];
  char v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = CFSTR("CLDurianIdentifier");
  v9[1] = CFSTR("CLDurianRangingStatus");
  v10[0] = a3;
  v10[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a4);
  v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  sub_1015A2E04(__p, "DurianManagement/DidReceiveRangingError");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v6);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didReceiveRangingTimestampsFromTag:(id)a3 eventStatus:(unsigned __int16)a4 rtt:(unint64_t)a5 tat:(unint64_t)a6 cycleIndex:(unsigned __int16)a7
{
  uint64_t v7;
  NSMutableDictionary *v12;
  void *__p[2];
  char v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v7 = a7;
  v16[0] = a3;
  v15[0] = CFSTR("CLDurianIdentifier");
  v15[1] = CFSTR("CLDurianRangingTimestampStatus");
  v16[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", a4);
  v15[2] = CFSTR("CLDurianRangingRtt");
  v16[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a5);
  v15[3] = CFSTR("CLDurianRangingTat");
  v16[3] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a6);
  v15[4] = CFSTR("CLDurianRangingCycleIndex");
  v16[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v7);
  v12 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 5));
  sub_1015A2E04(__p, "DurianManagement/DidReceiveRangingTimestamps");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v12);
  if (v14 < 0)
    operator delete(__p[0]);
}

- (void)didFailRangingEventCounterActionForTag:(id)a3 error:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidFailRangingEventCounterAction");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didHaveRangingMovementOnTag:(id)a3
{
  NSMutableDictionary *v5;
  void *__p[2];
  char v7;
  const __CFString *v8;
  id v9;

  v8 = CFSTR("CLDurianIdentifier");
  v9 = a3;
  v5 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  sub_1015A2E04(__p, "DurianManagement/DidHaveRangingMovement");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v5);
  if (v7 < 0)
    operator delete(__p[0]);
}

- (void)didSetAccelerometerSlopeModeConfigurationOnTag:(id)a3 error:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidSetAccelerometerSlopeMode");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didSetAccelerometerOrientationModeConfigurationOnTag:(id)a3 error:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidSetAccelerometerOrientationMode");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAccelerometerSlopeModeConfiguration:(id)a3 onTag:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a3, CFSTR("CLDurianAccelerometerSlopeModeConfigurationKey"));
  sub_1015A2E04(__p, "DurianManagement/DidGetAccelerometerSlopeModeConfiguration");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAccelerometerOrientationModeConfiguration:(id)a3 onTag:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a3, CFSTR("CLDurianAccelerometerOrientationModeConfigurationKey"));
  sub_1015A2E04(__p, "DurianManagement/DidSetAccelerometerOrientationMode");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAccelerometerMode:(unsigned __int8)a3 onTag:(id)a4 error:(id)a5
{
  uint64_t v7;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v7 = a3;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v7), CFSTR("CLDurianAccelerometerModeKey"));
  sub_1015A2E04(__p, "DurianManagement/DidGetAccelerometerMode");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchBatteryStatus:(unint64_t)a3 fromTag:(id)a4 withError:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), CFSTR("CLDurianBatteryStatus"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchBatteryStatus");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didRetrievePersonalizationInformation:(id)a3 forTag:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a3, CFSTR("CLDurianPersonalizationInfo"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchPersonalizationInformation");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didUpdateFirmwareForTag:(id)a3 error:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidUpdateFirmware");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didSetUnauthorizedPlaySoundRateLimitFromTag:(id)a3 error:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidSetUnauthorizedPlaySoundRateLimit");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didSetBatteryStatusOnTag:(id)a3 error:(id)a4
{
  void *__p[2];
  char v8;

  sub_1015A2E04(__p, "DurianManagement/DidSetBatteryStatus");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didCompleteHawkeyeTaskWithOpcode:(unsigned __int16)a3 fromDevice:(id)a4 withError:(id)a5
{
  uint64_t v7;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v7 = a3;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7), CFSTR("CLHawkeyeTaskOpcodeKey"));
  sub_1015A2E04(__p, "DurianManagement/DidCompleteHawkeyeTask");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didSetHawkeyeUTMotionConfigForDevice:(id)a3 withError:(id)a4
{
  NSMutableDictionary *v7;
  void *__p[2];
  char v9;
  const __CFString *v10;
  id v11;

  v10 = CFSTR("CLDurianIdentifier");
  v11 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidSetHawkeyeUTMotionConfig");
  -[CLDurianClientAdapter sendMessage:forTag:withError:](self, "sendMessage:forTag:withError:", __p, a3, a4);
  if (v9 < 0)
    operator delete(__p[0]);
}

- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a4;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", a3, CFSTR("CLHawkeyeTxPowerKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchTxPower");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a4, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didStartAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidStartAggressiveAdvertising");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didStopAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidStopAggressiveAdvertising");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didCompleteAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidCompleteAggressiveAdvertising");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didStartUnauthorizedAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  const __CFString *v11;
  id v12;

  v11 = CFSTR("CLDurianIdentifier");
  v12 = a3;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = v7;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a4, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidStartUnauthorizedAggressiveAdvertising");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeAISProductDataKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeAISProductData");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeAISManufacturerNameKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeAISManufacturerName");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeAISModelNameKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeAISModelName");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeAISModelColorCodeFromDevice:(id)a3 modelColorCode:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeAISModelColorCodeKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeAISModelColorCode");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeAISAccessoryCategoryKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeAISAccessoryCategory");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeAISAccessoryCapabilitiesKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeAISAccessoryCapabilities");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeAISFindMyVersionFromDevice:(id)a3 findMyVersion:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v6 = *(_QWORD *)&a4;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6), CFSTR("CLHawkeyeAISFindMyVersionKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeAISFindMyVersion");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeAISBatteryTypeFromDevice:(id)a3 batteryType:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeAISBatteryTypeKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeAISBatteryType");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeSerialNumberFromDevice:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeSerialNumberKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeSerialNumber");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeCurrentPrimaryKeyFromDevice:(id)a3 currentPrimaryKey:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeCurrentPrimaryKeyKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeCurrentPrimaryKey");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchHawkeyeiCloudIdentifierFromDevice:(id)a3 iCloudIdentifier:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLHawkeyeiCloudIdentifierKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchHawkeyeiCloudIdentifier");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didReceiveHawkeyeDataFragment:(id)a3 withOpcode:(unsigned __int16)a4 fromDevice:(id)a5 error:(id)a6
{
  uint64_t v8;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *__p[2];
  char v14;
  const __CFString *v15;
  id v16;

  v8 = a4;
  v15 = CFSTR("CLDurianIdentifier");
  v16 = a5;
  v11 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v12 = v11;
  if (a6)
  {
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", a6, CFSTR("CLDurianError"));
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", a3, CFSTR("CLHawkeyeDataFragmentKey"));
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v8), CFSTR("CLHawkeyeTaskOpcodeKey"));
  }
  sub_1015A2E04(__p, "DurianManagement/DidReceiveDataFragment");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a5, v12);
  if (v14 < 0)
    operator delete(__p[0]);
}

- (void)didUseLocalFirmwareAssetRequestForProductGroup:(id)a3 andProductNumber:(id)a4 withError:(id)a5
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v11[0] = CFSTR("CLHawkeyeProductGroupKey");
  v11[1] = CFSTR("CLHawkeyeProductNumberKey");
  v12[0] = a3;
  v12[1] = a4;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v8 = v7;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidUseLocalAssetRequest");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, 0, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didUseDefaultFirmwareAssetRequestForProductGroup:(id)a3 andProductNumber:(id)a4 withError:(id)a5
{
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *__p[2];
  char v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v11[0] = CFSTR("CLHawkeyeProductGroupKey");
  v11[1] = CFSTR("CLHawkeyeProductNumberKey");
  v12[0] = a3;
  v12[1] = a4;
  v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v8 = v7;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  sub_1015A2E04(__p, "DurianManagement/DidUseDefaultAssetRequest");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, 0, v8);
  if (v10 < 0)
    operator delete(__p[0]);
}

- (void)didFetchWhetherLocalFirmwareAssetIsInUseForProductGroup:(id)a3 andProductNumber:(id)a4 withResult:(BOOL)a5
{
  NSMutableDictionary *v6;
  void *__p[2];
  char v8;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("CLHawkeyeProductGroupKey");
  v9[1] = CFSTR("CLHawkeyeProductNumberKey");
  v10[0] = a3;
  v10[1] = a4;
  v9[2] = CFSTR("CLHawkeyeLocalFirmwareInUseResultKey");
  v10[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a5);
  v6 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  sub_1015A2E04(__p, "DurianManagement/DidFetchWhetherLocalFirmwareAssetIsInUse");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, 0, v6);
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLAISProductDataKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISProductData");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLAISManufacturerNameKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISManufacturerName");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLAISModelNameKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISModelName");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISProtocolImplementationFromDevice:(id)a3 protocolImplementation:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v6 = *(_QWORD *)&a4;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6), CFSTR("CLAISProtocolImplementationKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISProtocolImplementation");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v6 = a4;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6), CFSTR("CLAISAccessoryCategoryKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISAccessoryCategory");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLAISAccessoryCapabilitiesKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISAccessoryCapabilities");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISNetworkIDFromDevice:(id)a3 networkID:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v6 = a4;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6), CFSTR("CLAISNetworkIDKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISNetworkID");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISFirmwareVersionFromDevice:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLAISFirmwareVersionKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISFirmwareVersion");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISBatteryTypeFromDevice:(id)a3 batteryType:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v6 = a4;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6), CFSTR("CLAISBatteryTypeKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISBatteryType");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISBatteryLevelFromDevice:(id)a3 batteryLevel:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v6 = a4;
  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6), CFSTR("CLAISBatteryLevelKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISBatteryLevel");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchAISSerialNumberFromDevice:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *__p[2];
  char v12;
  const __CFString *v13;
  id v14;

  v13 = CFSTR("CLDurianIdentifier");
  v14 = a3;
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v10 = v9;
  if (a5)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a5, CFSTR("CLDurianError"));
  else
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, CFSTR("CLAISSerialNumberKey"));
  sub_1015A2E04(__p, "DurianManagement/DidFetchAISSerialNumber");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, a3, v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

- (void)didFetchStatusOfUTEnablementRequirementsWithStatus:(id)a3
{
  NSDictionary *v4;
  void *__p[2];
  char v6;
  const __CFString *v7;
  id v8;

  v7 = CFSTR("CLTAEnablementRequirementsStatusKey");
  v8 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  sub_1015A2E04(__p, "DurianManagement/DidFetchStatusOfUTEnablementRequirements");
  -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, 0, v4);
  if (v6 < 0)
    operator delete(__p[0]);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLDurianManagementClient)client
{
  return self->_client;
}

- (void)setClient:(CLDurianManagementClient *)a3
{
  self->_client = a3;
}

@end
