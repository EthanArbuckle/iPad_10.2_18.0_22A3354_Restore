@implementation CLInternalService

- (void)getLocationServicesEnabledWithReplyBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetLocationServicesEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &v8);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v6 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetLocationServicesEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v7 = sub_10019CFA0();
  (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v7);
  os_activity_scope_leave(&v8);

}

- (void)getOscarTimeSyncWithReplyBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  char *v10;
  _QWORD v11[6];
  _WORD v12[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonOscarTimeSync (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v6 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonOscarTimeSync\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v7 = sub_1001FBB04(0);
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000AE8C;
    v11[3] = &unk_1021D6958;
    v11[4] = a3;
    v11[5] = _Block_copy(a3);
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v7 + 144))(v7, v11);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v8 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "TimeSyncWithReplyBlock, can't find motionCoprocessor", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v12[0] = 0;
      v10 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "TimeSyncWithReplyBlock, can't find motionCoprocessor", v12, 2);
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService getOscarTimeSyncWithReplyBlock:]", "%s\n", v10);
      if (v10 != (char *)buf)
        free(v10);
    }
    v9 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id, _QWORD, _QWORD))a3 + 2))(a3, v9, 0, 0);

  }
  os_activity_scope_leave(&state);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  unsigned int v6;
  NSObject *v7;
  _QWORD v9[4];
  unsigned int v10;
  _QWORD v11[4];
  unsigned int v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  unsigned int v18;

  if (qword_1023100D0 != -1)
    dispatch_once(&qword_1023100D0, &stru_1021D6800);
  objc_msgSend(a4, "setExportedInterface:", qword_1023100C8);
  objc_msgSend(a4, "setExportedObject:", self);
  v6 = objc_msgSend(a4, "processIdentifier");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1018942F4;
  v11[3] = &unk_1021AA678;
  v12 = v6;
  objc_msgSend(a4, "setInterruptionHandler:", v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1018943DC;
  v9[3] = &unk_1021AA678;
  v10 = v6;
  objc_msgSend(a4, "setInvalidationHandler:", v9);
  objc_msgSend(a4, "_setQueue:", objc_msgSend(-[CLInternalService silo](self, "silo"), "queue"));
  objc_msgSend(a4, "resume");
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 1026;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, New connection resumed\", \"pid\":%{public}d}", buf, 0x18u);
  }
  return 1;
}

- (void)getGnssBandsInUseWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  unsigned int *v13;
  unsigned int *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  char *v19;
  char *v20;
  __int16 v21[8];
  void *__p;
  unsigned int *v23;
  uint64_t v24;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetGnssBandsInUse (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    v30 = 2082;
    v31 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetGnssBandsInUse\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.status"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    __p = 0;
    v23 = 0;
    v24 = 0;
    if ((objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLGnssProvider")), "syncgetActiveGnssBands:", &__p) & 1) != 0)
    {
      v11 = objc_alloc((Class)NSMutableArray);
      v12 = objc_msgSend(v11, "initWithCapacity:", ((char *)v23 - (_BYTE *)__p) >> 2);
      v13 = (unsigned int *)__p;
      v14 = v23;
      while (v13 != v14)
        objc_msgSend(v12, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *v13++));
      (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, v12);

    }
    else
    {
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v17 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Spi, #warning Couldn't get active GNSS bands", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v21[0] = 0;
        v20 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, #warning Couldn't get active GNSS bands", v21, 2);
        sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getGnssBandsInUseWithReplyBlock:]", "%s\n", v20);
        if (v20 != (char *)buf)
          free(v20);
      }
      v18 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v18, 0);

    }
    if (__p)
    {
      v23 = (unsigned int *)__p;
      operator delete(__p);
    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v15 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(__p) = 0;
      v19 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &__p, 2);
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getGnssBandsInUseWithReplyBlock:]", "%s\n", v19);
      if (v19 != (char *)buf)
        free(v19);
    }
    v16 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v16, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)getMonitoredRegionsForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  audit_token_t *v10;
  id v11;
  id v12;
  void **v13;
  NSObject *v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t j;
  id v26;
  NSData *v27;
  uint64_t v28;
  id v29;
  void **v30;
  uint64_t i;
  const char *v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  CLInternalService *v37;
  id v39;
  uint64_t v40;
  int v41;
  _DWORD v42[4];
  _BYTE v43[16];
  void *v44[2];
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _OWORD v49[2];
  _BYTE v50[16];
  os_activity_scope_state_s state;
  uint8_t v52[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  uint64_t v57;
  void *__p;
  _BYTE v59[24];
  char v60;
  void *v61;
  char v62;
  void *v63;
  char v64;
  void *v65[2];
  unsigned __int8 v66;
  void *v67;
  char v68;
  void *v69;
  char v70;
  _BYTE buf[32];
  __int128 v72;
  void *v73[2];
  void *v74[2];
  _BYTE v75[24];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void *v79[4];

  v39 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetMonitoredRegions (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetMonitoredRegions\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  sub_100119F3C(v50);
  *(_OWORD *)v74 = 0u;
  memset(v75, 0, 19);
  v72 = 0u;
  *(_OWORD *)v73 = 0u;
  memset(buf, 0, sizeof(buf));
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  memset(v79, 0, 27);
  if (!+[CLInternalService getEffectiveClientName:bundlePath:name:](CLInternalService, "getEffectiveClientName:bundlePath:name:", a3, a4, buf))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id, _QWORD))a5 + 2))(a5, v11, 0);

    goto LABEL_69;
  }
  if (self)
    -[CLInternalService currentToken](self, "currentToken");
  else
    memset(v49, 0, sizeof(v49));
  CLConnection::getUserNameFromAuditToken(&__p, (CLConnection *)v49, v10);
  sub_1001AE664((std::string *)buf, (const std::string *)&__p);
  if ((v59[15] & 0x80000000) != 0)
    operator delete(__p);
  v46 = 0;
  v47 = 0;
  v48 = 0;
  sub_1001A885C((uint64_t)buf, (uint64_t)v44);
  v12 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLFenceManager"));
  if (v45 >= 0)
    v13 = v44;
  else
    v13 = (void **)v44[0];
  if ((objc_msgSend(v12, "syncgetFences:forKey:", &v46, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13)) & 1) == 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v44;
      if (v45 < 0)
        v15 = (void **)v44[0];
      __p = (void *)68289282;
      *(_WORD *)v59 = 2082;
      *(_QWORD *)&v59[2] = "";
      *(_WORD *)&v59[10] = 2082;
      *(_QWORD *)&v59[12] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, #warning Couldn't get fences for client key\", \"clientKey\":%{public, location:escape_only}s}", (uint8_t *)&__p, 0x1Cu);
    }
  }
  if (v46 == v47)
  {
LABEL_56:
    __p = &__p;
    *(_QWORD *)v59 = &__p;
    *(_QWORD *)&v59[8] = 0;
    v29 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLBTLEFenceManager"));
    if (v45 >= 0)
      v30 = v44;
    else
      v30 = (void **)v44[0];
    objc_msgSend(v29, "syncgetMonitoredRegions:forClient:", &__p, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v30));
    sub_100119F3C(v52);
    for (i = *(_QWORD *)v59; (void **)i != &__p; i = *(_QWORD *)(i + 8))
    {
      sub_100119F3C(v43);
      v32 = (const char *)(i + 104);
      sub_100528888((uint64_t)v43, "kCLConnectionMessageNameKey", (char *)(i + 104));
      sub_100528888((uint64_t)v43, "kCLConnectionMessageOnBehalfOfKey", (char *)(i + 80));
      v42[0] = 0;
      sub_10011B4E4((uint64_t)v43, "kCLConnectionMessageRegionTypeKey", v42);
      sub_10011B4E4((uint64_t)v43, "kCLConnectionMessageRegionDefinitionKey", (const void *)(i + 52));
      v33 = (char *)(i + 24);
      if (*(char *)(i + 47) < 0)
        v33 = *(char **)v33;
      sub_1005285B4((uint64_t)v43, "kCLConnectionMessageProximityUUIDKey", v33);
      sub_100527A78((uint64_t)v43, "kCLConnectionMessageMajorKey", (unsigned __int16 *)(i + 48));
      sub_100527A78((uint64_t)v43, "kCLConnectionMessageMinorKey", (unsigned __int16 *)(i + 50));
      v42[0] = *(_DWORD *)(i + 128) & 1;
      sub_10011B4E4((uint64_t)v43, "kCLConnectionMessageNotifyOnEntryKey", v42);
      v42[0] = *(_DWORD *)(i + 128) & 2;
      sub_10011B4E4((uint64_t)v43, "kCLConnectionMessageNotifyOnExitKey", v42);
      v42[0] = *(_DWORD *)(i + 128) & 4;
      sub_10011B4E4((uint64_t)v43, "kCLConnectionMessageNotifyEntryStateOnDisplayKey", v42);
      v42[0] = *(_DWORD *)(i + 128) & 8;
      sub_10011B4E4((uint64_t)v43, "kCLConnectionMessageConservativeEntry", v42);
      LOBYTE(v42[0]) = 0;
      sub_10011B47C((uint64_t)v43, "kCLConnectionMessageEmergencyKey", v42);
      if (*(char *)(i + 127) < 0)
        v32 = *(const char **)v32;
      sub_1000CADE4((uint64_t)v52, v32, (uint64_t)v43);
      sub_10011A5A8(v43);
    }
    sub_1000CADE4((uint64_t)v50, "kCLConnectionMessageBeaconRegionKey", (uint64_t)v52);
    sub_10011A5A8(v52);
    sub_1000CAD6C((uint64_t *)&__p);
    v34 = sub_10011A5AC((uint64_t)v50);
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, v34);
    goto LABEL_66;
  }
  v37 = self;
  sub_100119F3C(v43);
  v16 = v46;
  v17 = v47;
  if (v46 == v47)
  {
LABEL_55:
    sub_1000CADE4((uint64_t)v50, "kCLConnectionMessageCircularRegionKey", (uint64_t)v43);
    self = v37;
    sub_10011A5A8(v43);
    goto LABEL_56;
  }
  while (1)
  {
    sub_100119F3C(v42);
    v18 = (const char *)(v16 + 24);
    sub_100528888((uint64_t)v42, "kCLConnectionMessageNameKey", (char *)(v16 + 24));
    sub_100204320((std::string *)(v16 + 48), (uint64_t)&__p);
    sub_1001A8D50((uint64_t)&__p);
    v19 = v66;
    if ((v66 & 0x80u) != 0)
      v19 = (unint64_t)v65[1];
    v20 = (char *)&v61;
    if (v19)
    {
      sub_1001A8D50((uint64_t)&__p);
      v20 = (char *)v65;
    }
    sub_100528888((uint64_t)v42, "kCLConnectionMessageOnBehalfOfKey", v20);
    *(_DWORD *)v52 = *(_DWORD *)(v16 + 180);
    sub_10011B4E4((uint64_t)v42, "kCLConnectionMessageReferenceFrameKey", v52);
    v52[0] = (*(_BYTE *)(v16 + 160) & 4) != 0;
    sub_10011B47C((uint64_t)v42, "kCLConnectionMessageConservativeEntry", v52);
    v52[0] = (*(_BYTE *)(v16 + 160) & 0x10) != 0;
    sub_10011B47C((uint64_t)v42, "kCLConnectionMessageEmergencyKey", v52);
    v52[0] = *(_BYTE *)(v16 + 160) & 1;
    sub_10011B47C((uint64_t)v42, "kCLConnectionMessageNotifyOnEntryKey", v52);
    v52[0] = (*(_BYTE *)(v16 + 160) & 2) != 0;
    sub_10011B47C((uint64_t)v42, "kCLConnectionMessageNotifyOnExitKey", v52);
    v21 = *(_QWORD *)(v16 + 232) - *(_QWORD *)(v16 + 224);
    if (!v21)
    {
      if ((*(_BYTE *)(v16 + 160) & 0x80) != 0)
        *(_DWORD *)v52 = 3;
      else
        *(_DWORD *)v52 = 1;
      sub_10011B4E4((uint64_t)v42, "kCLConnectionMessageRegionTypeKey", v52);
      sub_10018A4CC((uint64_t)v42, "kCLConnectionMessageLatitudeKey", (const void *)(v16 + 72));
      sub_10018A4CC((uint64_t)v42, "kCLConnectionMessageLongitudeKey", (const void *)(v16 + 80));
      sub_10018A4CC((uint64_t)v42, "kCLConnectionMessageRadiusKey", (const void *)(v16 + 88));
      v52[0] = (*(_BYTE *)(v16 + 160) & 8) != 0;
      sub_10011B47C((uint64_t)v42, "kCLConnectionMessageMonitoringNearby", v52);
      v52[0] = (*(_BYTE *)(v16 + 160) & 0x20) != 0;
      sub_10011B47C((uint64_t)v42, "kCLConnectionMessageLowPowerFenceKey", v52);
      goto LABEL_38;
    }
    v41 = v21 >> 4;
    v22 = objc_alloc((Class)NSMutableArray);
    v23 = objc_msgSend(v22, "initWithCapacity:", v41);
    if (v41 >= 1)
    {
      v24 = 0;
      for (j = 0; j < v41; ++j)
      {
        v26 = objc_msgSend(objc_alloc((Class)_CLVertex), "initWithClientCoordinate:", *(double *)(*(_QWORD *)(v16 + 224) + v24), *(double *)(*(_QWORD *)(v16 + 224) + v24 + 8));
        objc_msgSend(v23, "addObject:", v26);

        v24 += 16;
      }
    }
    v40 = 0;
    v27 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, &v40);
    if (v40)
      break;
    v28 = (uint64_t)v27;
    *(_DWORD *)v52 = 2;
    sub_10011B4E4((uint64_t)v42, "kCLConnectionMessageRegionTypeKey", v52);
    sub_10011B4E4((uint64_t)v42, "kCLConnectionMessagePolygonalVerticesCountKey", &v41);
    sub_10011B54C((uint64_t)v42, "kCLConnectionMessagePolygonalVerticesKey", v28);
    v52[0] = (*(_BYTE *)(v16 + 160) & 8) != 0;
    sub_10011B47C((uint64_t)v42, "kCLConnectionMessageMonitoringNearby", v52);

LABEL_38:
    if (*(char *)(v16 + 47) < 0)
      v18 = *(const char **)v18;
    sub_1000CADE4((uint64_t)v43, v18, (uint64_t)v42);
    if (v70 < 0)
      operator delete(v69);
    if (v68 < 0)
      operator delete(v67);
    if ((char)v66 < 0)
      operator delete(v65[0]);
    if (v64 < 0)
      operator delete(v63);
    if (v62 < 0)
      operator delete(v61);
    if (v60 < 0)
      operator delete(*(void **)&v59[16]);
    if ((v59[15] & 0x80000000) != 0)
      operator delete(__p);
    sub_10011A5A8(v42);
    v16 += 248;
    if (v16 == v17)
      goto LABEL_55;
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v35 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)v52 = 68289282;
    v53 = 0;
    v54 = 2082;
    v55 = "";
    v56 = 2114;
    v57 = v40;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, #error Unable to encode vertices\", \"error\":%{public, location:escape_only}@}", v52, 0x1Cu);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  }
  v36 = qword_1022A01C8;
  if (os_signpost_enabled((os_log_t)qword_1022A01C8))
  {
    *(_DWORD *)v52 = 68289282;
    v53 = 0;
    v54 = 2082;
    v55 = "";
    v56 = 2114;
    v57 = v40;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, #error Unable to encode vertices", "{\"msg%{public}.0s\":\"#Spi, #error Unable to encode vertices\", \"error\":%{public, location:escape_only}@}", v52, 0x1Cu);
  }
  if (v70 < 0)
    operator delete(v69);
  if (v68 < 0)
    operator delete(v67);
  if ((char)v66 < 0)
    operator delete(v65[0]);
  if (v64 < 0)
    operator delete(v63);
  if (v62 < 0)
    operator delete(v61);
  if (v60 < 0)
    operator delete(*(void **)&v59[16]);
  if ((v59[15] & 0x80000000) != 0)
    operator delete(__p);
  sub_10011A5A8(v42);
  sub_10011A5A8(v43);
LABEL_66:
  if (v45 < 0)
    operator delete(v44[0]);
  __p = &v46;
  sub_10091BBB0((void ***)&__p);
LABEL_69:
  if (SHIBYTE(v79[2]) < 0)
    operator delete(v79[0]);
  if (SHIBYTE(v78) < 0)
    operator delete(*((void **)&v77 + 1));
  if (SBYTE7(v77) < 0)
    operator delete((void *)v76);
  if ((v75[15] & 0x80000000) != 0)
    operator delete(v74[1]);
  if (SHIBYTE(v74[0]) < 0)
    operator delete(v73[0]);
  if (SHIBYTE(v72) < 0)
    operator delete(*(void **)&buf[24]);
  if ((buf[23] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  sub_10011A5A8(v50);
  os_activity_scope_leave(&state);

}

- (void)getTechnologiesInUseWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  int *v13;
  int *v14;
  int *v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  char *v21;
  char *v22;
  __int16 v23[8];
  int *v24;
  _QWORD *v25;
  uint64_t v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetTechnologiesInUse (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2082;
    v33 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetTechnologiesInUse\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.status"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v25 = 0;
    v26 = 0;
    v24 = (int *)&v25;
    if ((objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLLocationController")), "syncgetActiveTechs:", &v24) & 1) != 0)
    {
      v11 = objc_alloc((Class)NSMutableArray);
      v12 = objc_msgSend(v11, "initWithCapacity:", v26);
      v13 = v24;
      if (v24 != (int *)&v25)
      {
        do
        {
          if (v13[7] >= 1)
            objc_msgSend(v12, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
          v14 = (int *)*((_QWORD *)v13 + 1);
          if (v14)
          {
            do
            {
              v15 = v14;
              v14 = *(int **)v14;
            }
            while (v14);
          }
          else
          {
            do
            {
              v15 = (int *)*((_QWORD *)v13 + 2);
              v16 = *(_QWORD *)v15 == (_QWORD)v13;
              v13 = v15;
            }
            while (!v16);
          }
          v13 = v15;
        }
        while (v15 != (int *)&v25);
      }
      (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, v12);

    }
    else
    {
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v19 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Spi, #warning Couldn't get active location technologies", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v23[0] = 0;
        v22 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, #warning Couldn't get active location technologies", v23, 2);
        sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getTechnologiesInUseWithReplyBlock:]", "%s\n", v22);
        if (v22 != (char *)buf)
          free(v22);
      }
      v20 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v20, 0);

    }
    sub_100008848((uint64_t)&v24, v25);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v17 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v24) = 0;
      v21 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v24, 2);
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getTechnologiesInUseWithReplyBlock:]", "%s\n", v21);
      if (v21 != (char *)buf)
        free(v21);
    }
    v18 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v18, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)getAuthorizationStatusForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  audit_token_t *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  std::string *v17;
  int v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  id v22;
  _OWORD v23[2];
  std::string v24;
  void *__dst[2];
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *__p;
  char v38;
  _OWORD v39[2];
  void *v40[2];
  void *v41[2];
  __int128 v42;
  void *v43[2];
  void *v44[2];
  _BYTE v45[24];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49[5];
  os_activity_scope_state_s state;
  uint8_t v51[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  std::string *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  uint8_t *v62;
  __int16 v63;
  const char *v64;
  uint8_t buf[8];
  __int16 v66;
  const char *v67;
  __int16 v68;
  _BYTE v69[12];
  char v70;
  void *v71;
  char v72;
  void *v73;
  char v74;
  void *v75;
  char v76;
  void *v77;
  char v78;
  void *v79;
  char v80;

  v22 = objc_alloc_init((Class)NSAutoreleasePool);
  v9 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetAuthorizationStatus (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v9, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v10 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v66 = 2082;
    v67 = "";
    v68 = 2082;
    *(_QWORD *)v69 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetAuthorizationStatus\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  *(_OWORD *)v44 = 0u;
  memset(v45, 0, 19);
  v42 = 0u;
  *(_OWORD *)v43 = 0u;
  *(_OWORD *)v40 = 0u;
  *(_OWORD *)v41 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  memset(v49, 0, 27);
  if (+[CLInternalService getEffectiveClientName:bundlePath:name:](CLInternalService, "getEffectiveClientName:bundlePath:name:", a3, a4, v40))
  {
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(v39, 0, sizeof(v39));
    CLConnection::getUserNameFromAuditToken(buf, (CLConnection *)v39, v11);
    sub_1001AE664((std::string *)v40, (const std::string *)buf);
    if ((v69[3] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    v13 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
    sub_1001AF190((char *)__dst, (__int128 *)v40);
    v14 = objc_msgSend(v13, "syncgetClientEffectiveRegistrationResultWithTransientAwareness:", sub_1001AE728((__int128 *)__dst));
    if (v38 < 0)
      operator delete(__p);
    if (v36 < 0)
      operator delete(v35);
    if (v34 < 0)
      operator delete(v33);
    if (v32 < 0)
      operator delete(v31);
    if (v30 < 0)
      operator delete(v29);
    if (v28 < 0)
      operator delete(v27);
    if (v26 < 0)
      operator delete(__dst[0]);
    v15 = objc_msgSend(v13, "syncgetRegistrationResultToAuthorizationStatus:", v14);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v16 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
    {
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v23, 0, sizeof(v23));
      sub_1001AE4D0((uint64_t)v23, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, &v24);
      if (v80 < 0)
        operator delete(v79);
      if (v78 < 0)
        operator delete(v77);
      if (v76 < 0)
        operator delete(v75);
      if (v74 < 0)
        operator delete(v73);
      if (v72 < 0)
        operator delete(v71);
      if (v70 < 0)
        operator delete(*(void **)&v69[4]);
      if ((v69[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v17 = &v24;
      else
        v17 = (std::string *)v24.__r_.__value_.__r.__words[0];
      sub_1001A885C((uint64_t)v40, (uint64_t)buf);
      v18 = v69[3];
      v19 = *(uint8_t **)buf;
      v20 = sub_1001AE704(v15);
      v21 = buf;
      *(_DWORD *)v51 = 68290306;
      if (v18 < 0)
        v21 = v19;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2082;
      v56 = v17;
      v57 = 2114;
      v58 = a3;
      v59 = 2114;
      v60 = a4;
      v61 = 2082;
      v62 = v21;
      v63 = 2082;
      v64 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Authorization status for BundleID or BundlePath\", \"bundle\":%{public, location:escape_only}s, \"SpecifiedBundleId\":%{public, location:escape_only}@, \"SpecifiedBundlePath\":%{public, location:escape_only}@, \"clientKey\":%{public, location:escape_only}s, \"status\":%{public, location:escape_only}s}", v51, 0x44u);
      if ((v69[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);
    }
    (*((void (**)(id, _QWORD, id))a5 + 2))(a5, 0, v15);
  }
  else
  {
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id, _QWORD))a5 + 2))(a5, v12, 0);

  }
  if (SHIBYTE(v49[2]) < 0)
    operator delete(v49[0]);
  if (SHIBYTE(v48) < 0)
    operator delete(*((void **)&v47 + 1));
  if (SBYTE7(v47) < 0)
    operator delete((void *)v46);
  if ((v45[15] & 0x80000000) != 0)
    operator delete(v44[1]);
  if (SHIBYTE(v44[0]) < 0)
    operator delete(v43[0]);
  if (SHIBYTE(v42) < 0)
    operator delete(v41[1]);
  if (SHIBYTE(v41[0]) < 0)
    operator delete(v40[0]);
  os_activity_scope_leave(&state);

}

- ($115C4C562B26FF47E01F9F4EA65B5887)currentToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

+ (BOOL)getEffectiveClientName:(id)a3 bundlePath:(id)a4 name:(void *)a5
{
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  char *v14;
  char *v15;
  const char *v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  BOOL v20;
  char *v21;
  char *v22;
  char *v23;
  NSObject *v24;
  const __CFString *v25;
  const __CFString *v26;
  NSXPCConnection *v28;
  const __CFString *v29;
  const __CFString *v30;
  char *v31;
  _BYTE __str[32];
  _BYTE buf[38];
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *__p;
  char v44;

  v8 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!objc_msgSend(a3, "length") && !objc_msgSend(a4, "length")
    || (v10 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.effective_bundle"))) != 0&& (v11 = objc_opt_class(NSNumber, v9), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)&& (objc_msgSend(v10, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a3, "length"))
    {
      sub_1015A2E04(__str, (char *)objc_msgSend(a3, "UTF8String"));
      sub_1001AE67C((std::string *)__str, (uint64_t)buf);
      sub_1001AEF2C((uint64_t)a5, (__int128 *)buf);
      if (v44 < 0)
        operator delete(__p);
      if (v42 < 0)
        operator delete(v41);
      if (v40 < 0)
        operator delete(v39);
      if (v38 < 0)
        operator delete(v37);
      if (v36 < 0)
        operator delete(v35);
      if (v34 < 0)
        operator delete(*(void **)&buf[24]);
      if ((buf[23] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if ((__str[23] & 0x80000000) != 0)
        operator delete(*(void **)__str);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v12 = qword_1022A01C8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
        goto LABEL_66;
      sub_1001A8D50((uint64_t)a5);
      v15 = (char *)*((_QWORD *)a5 + 13);
      v14 = (char *)a5 + 104;
      v13 = v15;
      if (v14[23] >= 0)
        v13 = v14;
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v13;
      v16 = "{\"msg%{public}.0s\":\"#Spi, Called for bundle identifier\", \"bundleID\":%{public, location:escape_only}s}";
    }
    else
    {
      if (!objc_msgSend(a4, "length"))
      {
        v28 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
        if (v28)
          -[NSXPCConnection auditToken](v28, "auditToken");
        else
          memset(__str, 0, sizeof(__str));
        sub_1001AE4D0((uint64_t)__str, (uint64_t)buf);
        sub_1001AEF2C((uint64_t)a5, (__int128 *)buf);
        if (v44 < 0)
          operator delete(__p);
        if (v42 < 0)
          operator delete(v41);
        if (v40 < 0)
          operator delete(v39);
        if (v38 < 0)
          operator delete(v37);
        if (v36 < 0)
          operator delete(v35);
        if (v34 < 0)
          operator delete(*(void **)&buf[24]);
        if ((buf[23] & 0x80000000) != 0)
          operator delete(*(void **)buf);
        goto LABEL_64;
      }
      sub_1015A2E04(__str, (char *)objc_msgSend(a4, "UTF8String"));
      sub_1001B8590((std::string *)__str, (uint64_t)buf);
      sub_1001AEF2C((uint64_t)a5, (__int128 *)buf);
      if (v44 < 0)
        operator delete(__p);
      if (v42 < 0)
        operator delete(v41);
      if (v40 < 0)
        operator delete(v39);
      if (v38 < 0)
        operator delete(v37);
      if (v36 < 0)
        operator delete(v35);
      if (v34 < 0)
        operator delete(*(void **)&buf[24]);
      if ((buf[23] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if ((__str[23] & 0x80000000) != 0)
        operator delete(*(void **)__str);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v12 = qword_1022A01C8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
        goto LABEL_66;
      v23 = (char *)*((_QWORD *)a5 + 6);
      v22 = (char *)a5 + 48;
      v21 = v23;
      if (v22[23] >= 0)
        v21 = v22;
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v21;
      v16 = "{\"msg%{public}.0s\":\"#Spi, Called for bundle path\", \"bundlePath\":%{public, location:escape_only}s}";
    }
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, v16, buf, 0x1Cu);
LABEL_64:
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
LABEL_66:
    v24 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      v25 = &stru_1021D8FB8;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      if (a3)
        v26 = (const __CFString *)a3;
      else
        v26 = &stru_1021D8FB8;
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      if (a4)
        v25 = (const __CFString *)a4;
      *(_WORD *)&buf[18] = 2114;
      *(_QWORD *)&buf[20] = v26;
      *(_WORD *)&buf[28] = 2114;
      *(_QWORD *)&buf[30] = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"client getting effective client name\", \"bundleId\":%{public, location:escape_only}@, \"bundlePath\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    v20 = 1;
    goto LABEL_74;
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v17 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
  {
    v18 = &stru_1021D8FB8;
    if (a3)
      v19 = (const __CFString *)a3;
    else
      v19 = &stru_1021D8FB8;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = CFSTR("com.apple.locationd.effective_bundle");
    *(_WORD *)&buf[12] = 2114;
    if (a4)
      v18 = (const __CFString *)a4;
    *(_QWORD *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Spi, requires entitlement '%{public}@' with bundle identifier '%{public}@' or bundle path '%{public}@'", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v29 = &stru_1021D8FB8;
    if (a3)
      v30 = (const __CFString *)a3;
    else
      v30 = &stru_1021D8FB8;
    *(_DWORD *)__str = 138543874;
    if (a4)
      v29 = (const __CFString *)a4;
    *(_QWORD *)&__str[4] = CFSTR("com.apple.locationd.effective_bundle");
    *(_WORD *)&__str[12] = 2114;
    *(_QWORD *)&__str[14] = v30;
    *(_WORD *)&__str[22] = 2114;
    *(_QWORD *)&__str[24] = v29;
    v31 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "#Spi, requires entitlement '%{public}@' with bundle identifier '%{public}@' or bundle path '%{public}@'", COERCE_DOUBLE(138543874), __str, 32);
    sub_100512490("Generic", 1, 0, 0, "+[CLInternalService getEffectiveClientName:bundlePath:name:]", "%s\n", v31);
    if (v31 != buf)
      free(v31);
  }
  v20 = 0;
LABEL_74:

  return v20;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_1023100C0 != -1)
    dispatch_once(&qword_1023100C0, &stru_1021D67E0);
  return (id)qword_1023100B8;
}

- (CLInternalService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLInternalService;
  return -[CLInternalService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLInternalServiceSiloProtocol, &OBJC_PROTOCOL___CLInternalServiceSiloClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  int v4;
  double v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  NSObject *v9;
  NSXPCListener *listener;
  const char *v11;
  char *v12;
  NSXPCListener *v13;
  const char *v14;
  char *v15;
  uint64_t v16;
  _BYTE v17[12];
  _OWORD buf[102];

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v3 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Spi, beginService", (uint8_t *)buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    *(_WORD *)v17 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, beginService", v17, 2);
    v12 = (char *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService beginService]", "%s\n", v11);
    if (v12 != (char *)buf)
      free(v12);
  }
  sub_1001E4804(buf);
  *(_QWORD *)v17 = 0;
  v4 = sub_1001FD98C(*(uint64_t *)&buf[0], "CLGetGroundAltitudeDistThres", v17);
  v5 = *(double *)v17;
  if (!v4)
    v5 = 80000.0;
  self->_groundAltitudeDistanceThreshold = v5;
  v6 = (std::__shared_weak_count *)*((_QWORD *)&buf[0] + 1);
  if (*((_QWORD *)&buf[0] + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&buf[0] + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  self->_listener = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.locationd.synchronous"));
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    listener = self->_listener;
    LODWORD(buf[0]) = 138543362;
    *(_QWORD *)((char *)buf + 4) = listener;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#Spi , Listener?, %{public}@", (uint8_t *)buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v13 = self->_listener;
    *(_DWORD *)v17 = 138543362;
    *(_QWORD *)&v17[4] = v13;
    LODWORD(v16) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 2, "#Spi , Listener?, %{public}@", v17, v16);
    v15 = (char *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService beginService]", "%s\n", v14);
    if (v15 != (char *)buf)
      free(v15);
  }
  -[NSXPCListener _setQueue:](-[CLInternalService listener](self, "listener"), "_setQueue:", objc_msgSend(-[CLInternalService silo](self, "silo"), "queue"));
  -[NSXPCListener setDelegate:](-[CLInternalService listener](self, "listener"), "setDelegate:", self);
  -[NSXPCListener resume](-[CLInternalService listener](self, "listener"), "resume");
}

- (void)endService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v3 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Spi, endService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, endService", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService endService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }

}

+ (id)getIntersiloDelegate
{
  if (qword_1023100E0 != -1)
    dispatch_once(&qword_1023100E0, &stru_1021D6820);
  return (id)qword_1023100D8;
}

+ (id)getAsyncResponseSilo
{
  if (qword_1023100F0 != -1)
    dispatch_once(&qword_1023100F0, &stru_1021D6840);
  return (id)qword_1023100E8;
}

- (void)getAppsUsingLocationWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  _WORD v16[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetAppsUsingLocation (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetAppsUsingLocation\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.status"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager")), "syncgetCopyClients");
    if (v11)
    {
      (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, v11);
    }
    else
    {
      v11 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v11, 0);
    }

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v16, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getAppsUsingLocationWithReplyBlock:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v13, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)getActiveClientsUsingLocationWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  _WORD v16[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetActiveClientsUsingLocation (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetActiveClientsUsingLocation\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.status"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager")), "syncgetCopyClients");
    if (v11)
    {
      (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, v11);
    }
    else
    {
      v11 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v11, 0);
    }

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v16, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getActiveClientsUsingLocationWithReplyBlock:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v13, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)getClientManagerInternalStateWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint8_t *v14;
  _QWORD v15[5];
  _WORD v16[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetClientManagerInternalState (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetClientManagerInternalState\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.status"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1018950A4;
    v15[3] = &unk_1021D6868;
    v15[4] = a3;
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLInternalService")), "getClientManagerInternalStateWithReply:", v15);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v11 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v16, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getClientManagerInternalStateWithReplyBlock:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v12, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)setLocationDefaultForKey:(id)a3 andValue:(id)a4 replyBlock:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  std::string *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  const char *v22;
  uint8_t *v23;
  _OWORD v24[2];
  std::string v25;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  std::string *v34;
  uint8_t buf[8];
  _BYTE v36[10];
  __int16 v37;
  _BYTE v38[12];
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  void *__p;
  char v49;

  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetLocationDefault (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v36 = 2082;
    *(_QWORD *)&v36[2] = "";
    v37 = 2082;
    *(_QWORD *)v38 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetLocationDefault\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v13 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.defaults_access"));
  if (v13
    && (v14 = objc_opt_class(NSNumber, v12), (objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    && (objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v15 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
    {
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v24, 0, sizeof(v24));
      sub_1001AE4D0((uint64_t)v24, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, &v25);
      if (v49 < 0)
        operator delete(__p);
      if (v47 < 0)
        operator delete(v46);
      if (v45 < 0)
        operator delete(v44);
      if (v43 < 0)
        operator delete(v42);
      if (v41 < 0)
        operator delete(v40);
      if (v39 < 0)
        operator delete(*(void **)&v38[4]);
      if ((v38[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v18 = &v25;
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v18 = (std::string *)v25.__r_.__value_.__r.__words[0];
      *(_DWORD *)v27 = 68289538;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2114;
      v32 = a3;
      v33 = 2082;
      v34 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Setting default\", \"key\":%{public, location:escape_only}@, \"from\":%{public, location:escape_only}s}", v27, 0x26u);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v25.__r_.__value_.__l.__data_);
    }
    if (a4)
      +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a4, 0, 0, 0);
    sub_1001E4804(buf);
    sub_10023EC14(*(uint64_t *)buf);
    v19 = *(std::__shared_weak_count **)v36;
    if (*(_QWORD *)v36)
    {
      v20 = (unint64_t *)(*(_QWORD *)v36 + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v16 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v27 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v27, 2);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setLocationDefaultForKey:andValue:replyBlock:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
    v17 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a5 + 2))(a5, v17);

  }
  os_activity_scope_leave(&state);

}

- (void)getLocationDefaultForKey:(id)a3 replyBlock:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  std::string *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  const char *v20;
  uint8_t *v21;
  _OWORD v22[2];
  std::string v23;
  os_activity_scope_state_s state;
  uint8_t v25[8];
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  std::string *v31;
  uint8_t buf[8];
  _BYTE v33[10];
  __int16 v34;
  _BYTE v35[12];
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *__p;
  char v46;

  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetLocationDefault (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v33 = 2082;
    *(_QWORD *)&v33[2] = "";
    v34 = 2082;
    *(_QWORD *)v35 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetLocationDefault\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v11 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.defaults_access"));
  if (v11
    && (v12 = objc_opt_class(NSNumber, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v13 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
    {
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v22, 0, sizeof(v22));
      sub_1001AE4D0((uint64_t)v22, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, &v23);
      if (v46 < 0)
        operator delete(__p);
      if (v44 < 0)
        operator delete(v43);
      if (v42 < 0)
        operator delete(v41);
      if (v40 < 0)
        operator delete(v39);
      if (v38 < 0)
        operator delete(v37);
      if (v36 < 0)
        operator delete(*(void **)&v35[4]);
      if ((v35[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v16 = &v23;
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v16 = (std::string *)v23.__r_.__value_.__r.__words[0];
      *(_DWORD *)v25 = 68289538;
      *(_DWORD *)&v25[4] = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2114;
      v29 = a3;
      v30 = 2082;
      v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Getting default\", \"key\":%{public, location:escape_only}@, \"for\":%{public, location:escape_only}s}", v25, 0x26u);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v23.__r_.__value_.__l.__data_);
    }
    *(_QWORD *)v25 = 0;
    sub_1001E4804(buf);
    sub_100219F40(*(uint64_t *)buf, (uint64_t)a3, (CFTypeRef *)v25);
    v17 = *(std::__shared_weak_count **)v33;
    if (*(_QWORD *)v33)
    {
      v18 = (unint64_t *)(*(_QWORD *)v33 + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    if (*(_QWORD *)v25)
      +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", *(_QWORD *)v25, 200, 0, 0);
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v25 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v25, 2);
      v21 = (uint8_t *)v20;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getLocationDefaultForKey:replyBlock:]", "%s\n", v20);
      if (v21 != buf)
        free(v21);
    }
    v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a4 + 2))(a4, v15, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)timeZoneForLocation:(id *)a3 replyBlock:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void **v18;
  NSObject *v19;
  id v20;
  id v21;
  const char *v22;
  char *v23;
  uint64_t v24;
  void *__p[2];
  uint64_t v26;
  os_activity_scope_state_s state;
  _BYTE buf[32];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  _OWORD v35[94];

  v6 = objc_alloc_init((Class)NSAutoreleasePool);
  v7 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonTimeZoneAtLocation (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v8 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonTimeZoneAtLocation\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v10 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.time_zone"));
  if (v10
    && (v11 = objc_opt_class(NSNumber, v9), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && (objc_msgSend(v10, "BOOLValue") & 1) != 0)
  {
    __p[0] = 0;
    __p[1] = 0;
    v26 = 0;
    v24 = 0;
    v12 = sub_10068878C();
    v13 = *(_OWORD *)&a3->var11;
    v14 = *(_OWORD *)&a3->var14;
    var13 = a3->var13;
    v35[0] = v14;
    *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)&a3->var16;
    v15 = *(_OWORD *)&a3->var5;
    v29 = *(_OWORD *)&a3->var3;
    v30 = v15;
    v16 = *(_OWORD *)&a3->var9;
    v31 = *(_OWORD *)&a3->var7;
    v32 = v16;
    v33 = v13;
    v17 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    *(_OWORD *)&buf[16] = v17;
    if (sub_100688C38(v12, (uint64_t)buf, (uint64_t)__p, (double *)&v24))
    {
      if (v26 >= 0)
        v18 = __p;
      else
        v18 = (void **)__p[0];
      (*((void (**)(id, _QWORD, NSString *))a4 + 2))(a4, 0, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18));
    }
    else
    {
      v21 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, _QWORD))a4 + 2))(a4, v21, 0);

    }
    if (SHIBYTE(v26) < 0)
      operator delete(__p[0]);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v19 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(__p[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", __p, 2);
      v23 = (char *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService timeZoneForLocation:replyBlock:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
    v20 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a4 + 2))(a4, v20, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)setAuthorizationStatus:(BOOL)a3 withCorrectiveCompensation:(int)a4 forBundleID:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7
{
  _BOOL4 v10;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  audit_token_t *v18;
  NSObject *v19;
  id v20;
  char v21;
  uint64_t v22;
  id v23;
  id v24;
  double v25;
  std::string *p_str;
  NSObject *v27;
  id v28;
  const char *v29;
  char *v30;
  const char *v31;
  char *v32;
  uint64_t v33;
  _OWORD v34[2];
  void *__dst[2];
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  _OWORD v49[2];
  std::string __str;
  void *__p[2];
  void *v52[4];
  void *v53[2];
  void *v54[5];
  __int128 v55;
  _OWORD v56[4];
  os_activity_scope_state_s state;
  _BYTE buf[40];
  void *v59;
  __int128 v60;
  void *v61;
  __int128 v62;
  void *v63;
  __int16 v64;
  char v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  __int16 v72;
  char v73;

  HIDWORD(v33) = a4;
  v10 = a3;
  v12 = objc_alloc_init((Class)NSAutoreleasePool);
  v13 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetAuthorizationStatus (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v13, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v14 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetAuthorizationStatus\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v16 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v16
    && (v17 = objc_opt_class(NSNumber, v15), (objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    && (objc_msgSend(v16, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a5, "length") || objc_msgSend(a6, "length"))
    {
      memset(v54, 0, 35);
      *(_OWORD *)v53 = 0u;
      *(_OWORD *)__p = 0u;
      memset(v52, 0, sizeof(v52));
      v55 = 0u;
      memset(v56, 0, 59);
      if (objc_msgSend(a5, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a5, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)buf);
      }
      else
      {
        if (!objc_msgSend(a6, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v49, 0, sizeof(v49));
          CLConnection::getUserNameFromAuditToken(buf, (CLConnection *)v49, v18);
          sub_1001AE664((std::string *)__p, (const std::string *)buf);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
          if (v10)
            v22 = 3;
          else
            v22 = 2;
          v23 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
          sub_1001AF190((char *)__dst, (__int128 *)__p);
          v24 = sub_1001AE728((__int128 *)__dst);
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v34, 0, sizeof(v34));
          sub_1001AE4D0((uint64_t)v34, (uint64_t)buf);
          v25 = sub_1001A8444((uint64_t)buf, &__str);
          if (SHIBYTE(v71) < 0)
            operator delete((void *)v70);
          if (SHIBYTE(v69) < 0)
            operator delete((void *)v68);
          if (SHIBYTE(v67) < 0)
            operator delete((void *)v66);
          if (SHIBYTE(v63) < 0)
            operator delete((void *)v62);
          if (SHIBYTE(v61) < 0)
            operator delete((void *)v60);
          if (SHIBYTE(v59) < 0)
            operator delete(*(void **)&buf[24]);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
          if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            p_str = &__str;
          else
            p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
          objc_msgSend(v23, "setClientAuthorization:zoneIdentifier:subIdentityIdentifier:status:correctiveCompensation:mayIncreaseAuth:entity:", v24, 0, 0, v22, HIDWORD(v33), 1, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_str, v25));
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__str.__r_.__value_.__l.__data_);
          if (v48 < 0)
            operator delete(v47);
          if (v46 < 0)
            operator delete(v45);
          if (v44 < 0)
            operator delete(v43);
          if (v42 < 0)
            operator delete(v41);
          if (v40 < 0)
            operator delete(v39);
          if (v38 < 0)
            operator delete(v37);
          if (v36 < 0)
            operator delete(__dst[0]);
          (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
          if (SBYTE7(v56[3]) < 0)
            operator delete(*(void **)&v56[2]);
          if (SHIBYTE(v56[1]) < 0)
            operator delete(*((void **)&v56[0] + 1));
          if (SBYTE7(v56[0]) < 0)
            operator delete((void *)v55);
          if (SHIBYTE(v54[3]) < 0)
            operator delete(v54[1]);
          if (SHIBYTE(v54[0]) < 0)
            operator delete(v53[0]);
          if (SHIBYTE(v52[3]) < 0)
            operator delete(v52[1]);
          if (SHIBYTE(v52[0]) < 0)
            operator delete(__p[0]);
          goto LABEL_18;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a6, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)buf);
      }
      if (SHIBYTE(v52[0]) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = *(_OWORD *)buf;
      v52[0] = *(void **)&buf[16];
      buf[23] = 0;
      buf[0] = 0;
      if (SHIBYTE(v52[3]) < 0)
        operator delete(v52[1]);
      *(_OWORD *)&v52[1] = *(_OWORD *)&buf[24];
      v52[3] = v59;
      HIBYTE(v59) = 0;
      buf[24] = 0;
      if (SHIBYTE(v54[0]) < 0)
        operator delete(v53[0]);
      *(_OWORD *)v53 = v60;
      v54[0] = v61;
      HIBYTE(v61) = 0;
      LOBYTE(v60) = 0;
      if (SHIBYTE(v54[3]) < 0)
        operator delete(v54[1]);
      *(_OWORD *)&v54[1] = v62;
      v54[3] = v63;
      HIBYTE(v63) = 0;
      LOBYTE(v62) = 0;
      LOWORD(v54[4]) = v64;
      BYTE2(v54[4]) = v65;
      if (SBYTE7(v56[0]) < 0)
        operator delete((void *)v55);
      v55 = v66;
      *(_QWORD *)&v56[0] = v67;
      HIBYTE(v67) = 0;
      LOBYTE(v66) = 0;
      if (SHIBYTE(v56[1]) < 0)
        operator delete(*((void **)&v56[0] + 1));
      v21 = 0;
      *(_OWORD *)((char *)v56 + 8) = v68;
      *((_QWORD *)&v56[1] + 1) = v69;
      HIBYTE(v69) = 0;
      LOBYTE(v68) = 0;
      if (SBYTE7(v56[3]) < 0)
      {
        operator delete(*(void **)&v56[2]);
        v21 = HIBYTE(v69);
      }
      v56[2] = v70;
      *(_QWORD *)&v56[3] = v71;
      HIBYTE(v71) = 0;
      LOBYTE(v70) = 0;
      WORD4(v56[3]) = v72;
      BYTE10(v56[3]) = v73;
      if (v21 < 0)
        operator delete((void *)v68);
      if (SHIBYTE(v67) < 0)
        operator delete((void *)v66);
      if (SHIBYTE(v63) < 0)
        operator delete((void *)v62);
      if (SHIBYTE(v61) < 0)
        operator delete((void *)v60);
      if (SHIBYTE(v59) < 0)
        operator delete(*(void **)&buf[24]);
      if ((buf[23] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v27 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(__p[0]) = 0;
      LODWORD(v33) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status", __p, v33);
      v32 = (char *)v31;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService setAuthorizationStatus:withCorrectiveCompensation:forBundleID:orBundlePath:replyBlock:]", "%s\n", v31);
      if (v32 != buf)
        free(v32);
    }
    v28 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a7 + 2))(a7, v28);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v19 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(__p[0]) = 0;
      LODWORD(v33) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", __p, v33);
      v30 = (char *)v29;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setAuthorizationStatus:withCorrectiveCompensation:forBundleID:orBundlePath:replyBlock:]", "%s\n", v29);
      if (v30 != buf)
        free(v30);
    }
    v20 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a7 + 2))(a7, v20);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4 withReplyBlock:(id)a5
{
  uint64_t v7;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  const char *v18;
  uint8_t *v19;
  _WORD v20[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  _QWORD v27[202];

  v7 = *(_QWORD *)&a3;
  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: -[CLInternalService reportLocationUtilityEvent:atDate:withReplyBlock:] (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2082;
    v27[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"-[CLInternalService reportLocationUtilityEvent:atDate:withReplyBlock:]\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v13 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.report_location_utility_event"));
  if (v13
    && (v14 = objc_opt_class(NSNumber, v12), (objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    && (objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v15 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 1026;
      LODWORD(v27[0]) = v7;
      WORD2(v27[0]) = 2114;
      *(_QWORD *)((char *)v27 + 6) = a4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, #LocationUtilityEvent Reported\", \"utility\":%{public}d, \"date\":%{public, location:escape_only}@}", buf, 0x22u);
    }
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager")), "reportLocationUtilityEvent:atDate:", v7, a4);
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v16 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v20[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v20, 2);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService reportLocationUtilityEvent:atDate:withReplyBlock:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    v17 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a5 + 2))(a5, v17);

  }
  os_activity_scope_leave(&state);

}

- (void)resetClientForBundleId:(id)a3 orBundlePath:(id)a4 withReplyBlock:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  audit_token_t *v12;
  char v13;
  NSObject *v14;
  id v15;
  id v16;
  std::string *v17;
  NSObject *v18;
  NSObject *v19;
  _OWORD v20[2];
  std::string __str;
  std::string v22;
  std::string v23;
  __int128 v24;
  void *v25;
  __int128 v26;
  void *v27;
  __int16 v28;
  char v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int16 v36;
  char v37;
  os_activity_scope_state_s state;
  std::string buf[2];
  void *v40[2];
  void *v41[5];
  __int128 v42;
  _OWORD v43[4];

  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonResetClient (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonResetClient\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D69F0);
    v18 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      buf[0].__r_.__value_.__r.__words[0] = 68289539;
      LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"assert";
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 2081;
      *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 6) = (std::string::size_type)"bundleId || bundlePath";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"bundleId or bundlePath must be provided to reset client authorization\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)buf, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D69F0);
    }
    v19 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      buf[0].__r_.__value_.__r.__words[0] = 68289539;
      LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"assert";
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 2081;
      *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 6) = (std::string::size_type)"bundleId || bundlePath";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "bundleId or bundlePath must be provided to reset client authorization", "{\"msg%{public}.0s\":\"bundleId or bundlePath must be provided to reset client authorization\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)buf, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D69F0);
    }
    a5 = (id)qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      buf[0].__r_.__value_.__r.__words[0] = 68289539;
      LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"assert";
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 2081;
      *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 6) = (std::string::size_type)"bundleId || bundlePath";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)a5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"bundleId or bundlePath must be provided to reset client authorization\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)buf, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLInternalService.mm", 549, "-[CLInternalService resetClientForBundleId:orBundlePath:withReplyBlock:]");
    __break(1u);
LABEL_80:
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    goto LABEL_42;
  }
  if ((sub_10189771C((uint64_t)CFSTR("com.apple.locationd.clearauthorizations")) & 1) != 0
    || (sub_10189771C((uint64_t)CFSTR("com.apple.locationd.authorizeapplications")) & 1) != 0)
  {
    memset(v41, 0, 35);
    *(_OWORD *)v40 = 0u;
    memset(buf, 0, sizeof(buf));
    v42 = 0u;
    memset(v43, 0, 59);
    if (objc_msgSend(a3, "length"))
    {
      sub_1015A2E04(&__str, (char *)objc_msgSend(a3, "UTF8String"));
      sub_1001AE67C(&__str, (uint64_t)&v22);
    }
    else
    {
      if (!objc_msgSend(a4, "length"))
        goto LABEL_39;
      sub_1015A2E04(&__str, (char *)objc_msgSend(a4, "UTF8String"));
      sub_1001B8590(&__str, (uint64_t)&v22);
    }
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf[0].__r_.__value_.__l.__data_);
    buf[0] = v22;
    *((_BYTE *)&v22.__r_.__value_.__s + 23) = 0;
    v22.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf[1].__r_.__value_.__l.__data_);
    buf[1] = v23;
    *((_BYTE *)&v23.__r_.__value_.__s + 23) = 0;
    v23.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v41[0]) < 0)
      operator delete(v40[0]);
    *(_OWORD *)v40 = v24;
    v41[0] = v25;
    HIBYTE(v25) = 0;
    LOBYTE(v24) = 0;
    if (SHIBYTE(v41[3]) < 0)
      operator delete(v41[1]);
    *(_OWORD *)&v41[1] = v26;
    v41[3] = v27;
    HIBYTE(v27) = 0;
    LOBYTE(v26) = 0;
    LOWORD(v41[4]) = v28;
    BYTE2(v41[4]) = v29;
    if (SBYTE7(v43[0]) < 0)
      operator delete((void *)v42);
    v42 = v30;
    *(_QWORD *)&v43[0] = v31;
    HIBYTE(v31) = 0;
    LOBYTE(v30) = 0;
    if (SHIBYTE(v43[1]) < 0)
      operator delete(*((void **)&v43[0] + 1));
    v13 = 0;
    *(_OWORD *)((char *)v43 + 8) = v32;
    *((_QWORD *)&v43[1] + 1) = v33;
    HIBYTE(v33) = 0;
    LOBYTE(v32) = 0;
    if (SBYTE7(v43[3]) < 0)
    {
      operator delete(*(void **)&v43[2]);
      v13 = HIBYTE(v33);
    }
    v43[2] = v34;
    *(_QWORD *)&v43[3] = v35;
    HIBYTE(v35) = 0;
    LOBYTE(v34) = 0;
    WORD4(v43[3]) = v36;
    BYTE10(v43[3]) = v37;
    if (v13 < 0)
      operator delete((void *)v32);
    if (SHIBYTE(v31) < 0)
      operator delete((void *)v30);
    if (SHIBYTE(v27) < 0)
      operator delete((void *)v26);
    if (SHIBYTE(v25) < 0)
      operator delete((void *)v24);
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v23.__r_.__value_.__l.__data_);
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v22.__r_.__value_.__l.__data_);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__str.__r_.__value_.__l.__data_);
      if (self)
        goto LABEL_40;
      goto LABEL_46;
    }
LABEL_39:
    if (self)
    {
LABEL_40:
      -[CLInternalService currentToken](self, "currentToken");
LABEL_47:
      CLConnection::getUserNameFromAuditToken(&v22, (CLConnection *)v20, v12);
      sub_1001AE664(buf, &v22);
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v22.__r_.__value_.__l.__data_);
      v16 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
      sub_1001A885C((uint64_t)buf, (uint64_t)&v22);
      if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v17 = &v22;
      else
        v17 = (std::string *)v22.__r_.__value_.__r.__words[0];
      objc_msgSend(v16, "resetClient:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v22.__r_.__value_.__l.__data_);
      (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
      if (SBYTE7(v43[3]) < 0)
        operator delete(*(void **)&v43[2]);
      if (SHIBYTE(v43[1]) < 0)
        operator delete(*((void **)&v43[0] + 1));
      if (SBYTE7(v43[0]) < 0)
        operator delete((void *)v42);
      if (SHIBYTE(v41[3]) < 0)
        operator delete(v41[1]);
      if (SHIBYTE(v41[0]) < 0)
        operator delete(v40[0]);
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      goto LABEL_68;
    }
LABEL_46:
    memset(v20, 0, sizeof(v20));
    goto LABEL_47;
  }
  if (qword_1022A01C0 != -1)
    goto LABEL_80;
LABEL_42:
  v14 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289026;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, connecting process isn't entitled, they shall not pass\"}", (uint8_t *)buf, 0x12u);
  }
  v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
  (*((void (**)(id, id))a5 + 2))(a5, v15);

LABEL_68:
  os_activity_scope_leave(&state);

}

- (void)resetAllClientsWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  double v14;
  std::string *v15;
  const char *v16;
  uint8_t *v17;
  _OWORD v18[2];
  std::string v19;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  __int16 v22;
  const char *v23;
  __int16 v24;
  _QWORD v25[3];
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *__p;
  char v36;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonResetAllClients (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonResetAllClients\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(v18, 0, sizeof(v18));
    sub_1001AE4D0((uint64_t)v18, (uint64_t)buf);
    v14 = sub_1001A8444((uint64_t)buf, &v19);
    if (v36 < 0)
      operator delete(__p);
    if (v34 < 0)
      operator delete(v33);
    if (v32 < 0)
      operator delete(v31);
    if (v30 < 0)
      operator delete(v29);
    if (v28 < 0)
      operator delete(v27);
    if (v26 < 0)
      operator delete(*(void **)((char *)v25 + 4));
    if (SBYTE3(v25[0]) < 0)
      operator delete(*(void **)buf);
    if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = &v19;
    else
      v15 = (std::string *)v19.__r_.__value_.__r.__words[0];
    objc_msgSend(v11, "setLastLocationSettingsEventSource:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15, v14));
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v19.__r_.__value_.__l.__data_);
    objc_msgSend(v11, "resetClients");
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v19.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v19, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService resetAllClientsWithReplyBlock:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a3 + 2))(a3, v13);

  }
  os_activity_scope_leave(&state);

}

- (void)getArchivedAuthorizationDecisionsWithReplyBlock:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  const char *v12;
  uint8_t *v13;
  _WORD v14[8];
  uint8_t buf[1640];

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v7 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.archived_authorization_decisions"));
  if (v7
    && (v8 = objc_opt_class(NSNumber, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    v9 = objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager")), "syncgetArchivedAuthorizationDecisions");
    if (v9)
      (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, v9);
    else
      (*((void (**)(id, NSError *, _QWORD))a3 + 2))(a3, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, 0), 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v10 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v14[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v14, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getArchivedAuthorizationDecisionsWithReplyBlock:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    v11 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v11, 0);

  }
}

- (void)applyArchivedAuthorizationDecisions:(id)a3 withConfirmationToken:(id)a4 replyBlock:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  const char *v15;
  uint8_t *v16;
  _WORD v17[8];
  uint8_t buf[1640];

  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v11 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.archived_authorization_decisions"));
  if (v11
    && (v12 = objc_opt_class(NSNumber, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    (*((void (**)(id, id))a5 + 2))(a5, objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager")), "syncgetApplyArchivedAuthorizationDecisionsAndDie:unlessTokenMatches:", a3, a4));
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v13 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v17[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v17, 2);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService applyArchivedAuthorizationDecisions:withConfirmationToken:replyBlock:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    v14 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a5 + 2))(a5, v14);

  }
}

- (void)setPrivateMode:(BOOL)a3 replyBlock:(id)a4
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  const char *v23;
  uint8_t *v24;
  BOOL v25[8];
  os_activity_scope_state_s state;
  BOOL v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;

  v5 = a3;
  v27 = a3;
  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetPrivateMode (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2082;
    v33 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetPrivateMode\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v11 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.CoreLocation.PrivateMode"));
  if (v11
    && (v12 = objc_opt_class(NSNumber, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    v25[0] = 0;
    v13 = sub_1001FD94C();
    v14 = sub_1001E48E4(v13, (uint64_t)CFSTR("PrivateMode"), v25);
    if (v25[0] == v5)
      v15 = v14;
    else
      v15 = 0;
    if ((v15 & 1) == 0)
    {
      v16 = sub_1001FD94C();
      sub_10011B81C(v16, CFSTR("PrivateMode"), &v27);
      v17 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 944))(v17);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v18 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289282;
        v29 = 0;
        v30 = 2082;
        v31 = "";
        v32 = 1026;
        LODWORD(v33) = v27;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, private mode changed\", \"privateModeEnabled\":%{public}hhd}", buf, 0x18u);
      }
      v19 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLNetworkLocationProvider"));
      objc_msgSend(v19, "setPrivateMode:", v27);
      v20 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLHarvesterService"));
      objc_msgSend(v20, "setPrivateMode:", v27);
    }
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v21 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v25 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v25, 2);
      v24 = (uint8_t *)v23;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setPrivateMode:replyBlock:]", "%s\n", v23);
      if (v24 != buf)
        free(v24);
    }
    v22 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a4 + 2))(a4, v22);

  }
  os_activity_scope_leave(&state);

}

- (void)getPrivateMode:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint8_t *v17;
  BOOL v18[16];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetPrivateMode (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v6 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetPrivateMode\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.CoreLocation.PrivateMode"));
  if (v8
    && (v9 = objc_opt_class(NSNumber, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v18[0] = 0;
    v10 = sub_1001FD94C();
    v11 = sub_1001E48E4(v10, (uint64_t)CFSTR("PrivateMode"), v18);
    if (v18[0])
      v12 = v11;
    else
      v12 = 0;
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v13 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289282;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 1026;
      LODWORD(v25) = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"getPrivateMode called\", \"privateMode\":%{public}hhd}", buf, 0x18u);
    }
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v12);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v18 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v18, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getPrivateMode:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v15, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)setLocationServicesEnabled:(BOOL)a3 replyBlock:(id)a4
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  std::string *v16;
  const char *v17;
  double v18;
  std::string *v19;
  NSString *v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  std::string *v24;
  const char *v25;
  char *v26;
  char *v27;
  _OWORD v28[2];
  _OWORD v29[2];
  os_activity_scope_state_s v30[2];
  os_activity_scope_state_s state;
  std::string v32[8];
  std::string v33;
  int v34;
  std::string *v35;
  __int16 v36;
  const char *v37;
  uint8_t buf[8];
  __int16 v39;
  const char *v40;
  __int16 v41;
  _BYTE v42[12];
  char v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  char v51;
  void *__p;
  char v53;

  v5 = a3;
  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetLocationServicesEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v39 = 2082;
    v40 = "";
    v41 = 2082;
    *(_QWORD *)v42 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetLocationServicesEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v11 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v11
    && (v12 = objc_opt_class(NSNumber, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v13 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v30, 0, sizeof(v30));
      sub_1001AE4D0((uint64_t)v30, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, v32);
      if (v53 < 0)
        operator delete(__p);
      if (v51 < 0)
        operator delete(v50);
      if (v49 < 0)
        operator delete(v48);
      if (v47 < 0)
        operator delete(v46);
      if (v45 < 0)
        operator delete(v44);
      if (v43 < 0)
        operator delete(*(void **)&v42[4]);
      if ((v42[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v16 = v32;
      if ((v32[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v16 = (std::string *)v32[0].__r_.__value_.__r.__words[0];
      v17 = "enabled";
      if (!v5)
        v17 = "disabled";
      LODWORD(v33.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)v33.__r_.__value_.__r.__words + 4) = (std::string::size_type)v16;
      WORD2(v33.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&v33.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Spi, %{public}s is setting location services to %{public}s", (uint8_t *)&v33, 0x16u);
      if (SHIBYTE(v32[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(v32[0].__r_.__value_.__l.__data_);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v23 = qword_1022A01C8;
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v29, 0, sizeof(v29));
      sub_1001AE4D0((uint64_t)v29, (uint64_t)v32);
      sub_1001A8444((uint64_t)v32, &v33);
      sub_100010174((uint64_t)v32);
      v24 = (std::string *)v33.__r_.__value_.__r.__words[0];
      v25 = "disabled";
      if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v24 = &v33;
      if (v5)
        v25 = "enabled";
      v34 = 136446466;
      v35 = v24;
      v36 = 2082;
      v37 = v25;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 0, "#Spi, %{public}s is setting location services to %{public}s", &v34, 22);
      v27 = v26;
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v33.__r_.__value_.__l.__data_);
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setLocationServicesEnabled:replyBlock:]", "%s\n", v27);
      if (v27 != (char *)buf)
        free(v27);
    }
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(v28, 0, sizeof(v28));
    sub_1001AE4D0((uint64_t)v28, (uint64_t)buf);
    v18 = sub_1001A8444((uint64_t)buf, v32);
    if (v53 < 0)
      operator delete(__p);
    if (v51 < 0)
      operator delete(v50);
    if (v49 < 0)
      operator delete(v48);
    if (v47 < 0)
      operator delete(v46);
    if (v45 < 0)
      operator delete(v44);
    if (v43 < 0)
      operator delete(*(void **)&v42[4]);
    if ((v42[3] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if ((v32[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = v32;
    else
      v19 = (std::string *)v32[0].__r_.__value_.__r.__words[0];
    v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19, v18);
    if (SHIBYTE(v32[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v32[0].__r_.__value_.__l.__data_);
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager")), "syncgetSetLocationServicesEnabledStatically:withEventSource:", v5, v20);
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v32[0].__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v32, 2);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setLocationServicesEnabled:replyBlock:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
    v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a4 + 2))(a4, v15);

  }
  os_activity_scope_leave(&state);

}

- (void)setAuthorizationPromptMapDisplayEnabled:(BOOL)a3 replyBlock:(id)a4
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  std::string *v16;
  const char *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  const char *v24;
  uint8_t *v25;
  uint64_t v26;
  std::string *v27;
  const char *v28;
  char *v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  os_activity_scope_state_s state;
  BOOL v36;
  std::string v37[8];
  std::string v38;
  int v39;
  std::string *v40;
  __int16 v41;
  const char *v42;
  uint8_t buf[8];
  _BYTE v44[10];
  __int16 v45;
  _BYTE v46[12];
  char v47;
  void *v48;
  char v49;
  void *v50;
  char v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  void *__p;
  char v57;

  v5 = a3;
  v36 = a3;
  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetAuthorizationPromptMapDisplayEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v44 = 2082;
    *(_QWORD *)&v44[2] = "";
    v45 = 2082;
    *(_QWORD *)v46 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetAuthorizationPromptMapDisplayEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v11 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v11
    && (v12 = objc_opt_class(NSNumber, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v13 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else
      {
        v33 = 0u;
        v34 = 0u;
      }
      sub_1001AE4D0((uint64_t)&v33, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, v37);
      if (v57 < 0)
        operator delete(__p);
      if (v55 < 0)
        operator delete(v54);
      if (v53 < 0)
        operator delete(v52);
      if (v51 < 0)
        operator delete(v50);
      if (v49 < 0)
        operator delete(v48);
      if (v47 < 0)
        operator delete(*(void **)&v46[4]);
      if ((v46[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v16 = v37;
      if ((v37[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v16 = (std::string *)v37[0].__r_.__value_.__r.__words[0];
      v17 = "enabled";
      if (!v5)
        v17 = "disabled";
      LODWORD(v38.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)v38.__r_.__value_.__r.__words + 4) = (std::string::size_type)v16;
      WORD2(v38.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&v38.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Spi, %{public}s is setting authorization prompt map display to %{public}s", (uint8_t *)&v38, 0x16u);
      if (SHIBYTE(v37[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(v37[0].__r_.__value_.__l.__data_);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v26 = qword_1022A01C8;
      if (self)
      {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else
      {
        v31 = 0u;
        v32 = 0u;
      }
      sub_1001AE4D0((uint64_t)&v31, (uint64_t)v37);
      sub_1001A8444((uint64_t)v37, &v38);
      sub_100010174((uint64_t)v37);
      v27 = (std::string *)v38.__r_.__value_.__r.__words[0];
      v28 = "disabled";
      if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v27 = &v38;
      if (v5)
        v28 = "enabled";
      v39 = 136446466;
      v40 = v27;
      v41 = 2082;
      v42 = v28;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v26, 0, "#Spi, %{public}s is setting authorization prompt map display to %{public}s", &v39, 22, v31, v32, v33, v34);
      v30 = v29;
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v38.__r_.__value_.__l.__data_);
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setAuthorizationPromptMapDisplayEnabled:replyBlock:]", "%s\n", v30);
      if (v30 != (char *)buf)
        free(v30);
    }
    sub_1001E4804(buf);
    sub_10011B81C(*(uint64_t *)buf, CFSTR("AuthorizationPromptMapDisplayEnabled"), &v36);
    v18 = *(std::__shared_weak_count **)v44;
    if (*(_QWORD *)v44)
    {
      v19 = (unint64_t *)(*(_QWORD *)v44 + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    sub_1001E4804(buf);
    sub_100569514(*(uint64_t *)buf);
    v21 = *(std::__shared_weak_count **)v44;
    if (*(_QWORD *)v44)
    {
      v22 = (unint64_t *)(*(_QWORD *)v44 + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v37[0].__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v37, 2);
      v25 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setAuthorizationPromptMapDisplayEnabled:replyBlock:]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
    v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a4 + 2))(a4, v15);

  }
  os_activity_scope_leave(&state);

}

- (void)getAuthorizationPromptMapDisplayEnabledWithReplyBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL8 v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetAuthorizationPromptMapDisplayEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &v8);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v6 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetAuthorizationPromptMapDisplayEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v7 = sub_100515A84();
  (*((void (**)(id, _QWORD, _BOOL8))a3 + 2))(a3, 0, v7);
  os_activity_scope_leave(&v8);

}

- (void)setGestureServiceEnabled:(BOOL)a3 replyBlock:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  std::string *v15;
  const char *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v24;
  uint8_t *v25;
  _OWORD v26[2];
  std::string v27;
  void *v28[2];
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  os_activity_scope_state_s state;
  BOOL v43;
  uint8_t v44[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  std::string *v49;
  __int16 v50;
  const char *v51;
  uint8_t buf[48];
  void *v53;
  char v54;
  void *v55;
  char v56;
  void *v57;
  char v58;
  void *v59;
  char v60;
  void *__p;
  char v62;

  v43 = a3;
  v6 = objc_alloc_init((Class)NSAutoreleasePool);
  v7 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetGestureServiceEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v8 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetGestureServiceEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v10 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v10
    && (v11 = objc_opt_class(NSNumber, v9), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    && (objc_msgSend(v10, "BOOLValue") & 1) != 0)
  {
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(buf, 0, 32);
    sub_1001AE4D0((uint64_t)buf, (uint64_t)v28);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v26, 0, sizeof(v26));
      sub_1001AE4D0((uint64_t)v26, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, &v27);
      if (v62 < 0)
        operator delete(__p);
      if (v60 < 0)
        operator delete(v59);
      if (v58 < 0)
        operator delete(v57);
      if (v56 < 0)
        operator delete(v55);
      if (v54 < 0)
        operator delete(v53);
      if ((char)buf[47] < 0)
        operator delete(*(void **)&buf[24]);
      if ((char)buf[23] < 0)
        operator delete(*(void **)buf);
      v15 = &v27;
      if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v15 = (std::string *)v27.__r_.__value_.__r.__words[0];
      v16 = "enabled";
      *(_DWORD *)v44 = 68289538;
      if (!v43)
        v16 = "disabled";
      v45 = 0;
      v46 = 2082;
      v47 = "";
      v48 = 2082;
      v49 = v15;
      v50 = 2082;
      v51 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Setting ear gesture service\", \"bundle\":%{public, location:escape_only}s, \"setting\":%{public, location:escape_only}s}", v44, 0x26u);
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v27.__r_.__value_.__l.__data_);
    }
    sub_1001E4804(buf);
    sub_10011B81C(*(uint64_t *)buf, CFSTR("GestureServiceEnabled"), &v43);
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
    sub_1001E4804(buf);
    sub_100569514(*(uint64_t *)buf);
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
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.locationd/Prefs"), 0, 0, 1u);
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
    if (v41 < 0)
      operator delete(v40);
    if (v39 < 0)
      operator delete(v38);
    if (v37 < 0)
      operator delete(v36);
    if (v35 < 0)
      operator delete(v34);
    if (v33 < 0)
      operator delete(v32);
    if (v31 < 0)
      operator delete(v30);
    if (v29 < 0)
      operator delete(v28[0]);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v28[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v28, 2);
      v25 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setGestureServiceEnabled:replyBlock:]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a4 + 2))(a4, v13);

  }
  os_activity_scope_leave(&state);

}

- (void)setTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 statusData:(id)a5 replyBlock:(id)a6
{
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  audit_token_t *v16;
  NSObject *v17;
  id v18;
  char v19;
  NSObject *v20;
  std::string *v21;
  id v22;
  const char *v23;
  std::string *v24;
  void *__dst[2];
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  _BYTE v40[40];
  std::string __str;
  os_activity_scope_state_s state;
  _BYTE v43[48];
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  __int16 v48;
  char v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int16 v56;
  char v57;
  std::string buf[2];
  __int128 v59;
  _QWORD v60[5];
  __int128 v61;
  _OWORD v62[95];

  v10 = objc_alloc_init((Class)NSAutoreleasePool);
  v11 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLSetClientTransientAuthorizationInfo (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v11, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v12 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLSetClientTransientAuthorizationInfo\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v14 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v14)
  {
    v15 = objc_opt_class(NSNumber, v13);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0 && (objc_msgSend(v14, "BOOLValue") & 1) != 0)
    {
      memset(v60, 0, 35);
      v59 = 0u;
      memset(buf, 0, sizeof(buf));
      v61 = 0u;
      memset(v62, 0, 59);
      if (objc_msgSend(a3, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a3, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)v43);
      }
      else
      {
        if (!objc_msgSend(a4, "length"))
          goto LABEL_46;
        sub_1015A2E04(&__str, (char *)objc_msgSend(a4, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)v43);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = *(std::string *)v43;
      v43[23] = 0;
      v43[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = *(std::string *)&v43[24];
      v43[47] = 0;
      v43[24] = 0;
      if (SHIBYTE(v60[0]) < 0)
        operator delete((void *)v59);
      v59 = v44;
      v60[0] = v45;
      HIBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      if (SHIBYTE(v60[3]) < 0)
        operator delete((void *)v60[1]);
      *(_OWORD *)&v60[1] = v46;
      v60[3] = v47;
      HIBYTE(v47) = 0;
      LOBYTE(v46) = 0;
      LOWORD(v60[4]) = v48;
      BYTE2(v60[4]) = v49;
      if (SBYTE7(v62[0]) < 0)
        operator delete((void *)v61);
      v61 = v50;
      *(_QWORD *)&v62[0] = v51;
      HIBYTE(v51) = 0;
      LOBYTE(v50) = 0;
      if (SHIBYTE(v62[1]) < 0)
        operator delete(*((void **)&v62[0] + 1));
      v19 = 0;
      *(_OWORD *)((char *)v62 + 8) = v52;
      *((_QWORD *)&v62[1] + 1) = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      if (SBYTE7(v62[3]) < 0)
      {
        operator delete(*(void **)&v62[2]);
        v19 = HIBYTE(v53);
      }
      v62[2] = v54;
      *(_QWORD *)&v62[3] = v55;
      HIBYTE(v55) = 0;
      LOBYTE(v54) = 0;
      WORD4(v62[3]) = v56;
      BYTE10(v62[3]) = v57;
      if (v19 < 0)
        operator delete((void *)v52);
      if (SHIBYTE(v51) < 0)
        operator delete((void *)v50);
      if (SHIBYTE(v47) < 0)
        operator delete((void *)v46);
      if (SHIBYTE(v45) < 0)
        operator delete((void *)v44);
      if ((v43[47] & 0x80000000) != 0)
        operator delete(*(void **)&v43[24]);
      if ((v43[23] & 0x80000000) != 0)
        operator delete(*(void **)v43);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__str.__r_.__value_.__l.__data_);
        if (self)
          goto LABEL_47;
        goto LABEL_49;
      }
LABEL_46:
      if (self)
      {
LABEL_47:
        -[CLInternalService currentToken](self, "currentToken");
LABEL_50:
        CLConnection::getUserNameFromAuditToken(v43, (CLConnection *)v40, v16);
        sub_1001AE664(buf, (const std::string *)v43);
        if ((v43[23] & 0x80000000) != 0)
          operator delete(*(void **)v43);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v20 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
        {
          sub_1001A8444((uint64_t)buf, &__str);
          v21 = (__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &__str
              : (std::string *)__str.__r_.__value_.__r.__words[0];
          *(_DWORD *)v43 = 68289282;
          *(_DWORD *)&v43[4] = 0;
          *(_WORD *)&v43[8] = 2082;
          *(_QWORD *)&v43[10] = "";
          *(_WORD *)&v43[18] = 2082;
          *(_QWORD *)&v43[20] = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"setting temporary authorization status info for client\", \"name\":%{public, location:escape_only}s}", v43, 0x1Cu);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__str.__r_.__value_.__l.__data_);
        }
        v22 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
        sub_1001AF190((char *)__dst, (__int128 *)buf);
        objc_msgSend(v22, "setTemporaryAuthorizationStatusInfoForClient:data:", sub_1001AE728((__int128 *)__dst), a5);
        if (v39 < 0)
          operator delete(v38);
        if (v37 < 0)
          operator delete(v36);
        if (v35 < 0)
          operator delete(v34);
        if (v33 < 0)
          operator delete(v32);
        if (v31 < 0)
          operator delete(v30);
        if (v29 < 0)
          operator delete(v28);
        if (v27 < 0)
          operator delete(__dst[0]);
        (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
        if (SBYTE7(v62[3]) < 0)
          operator delete(*(void **)&v62[2]);
        if (SHIBYTE(v62[1]) < 0)
          operator delete(*((void **)&v62[0] + 1));
        if (SBYTE7(v62[0]) < 0)
          operator delete((void *)v61);
        if (SHIBYTE(v60[3]) < 0)
          operator delete((void *)v60[1]);
        if (SHIBYTE(v60[0]) < 0)
          operator delete((void *)v59);
        if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf[1].__r_.__value_.__l.__data_);
        if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf[0].__r_.__value_.__l.__data_);
        goto LABEL_16;
      }
LABEL_49:
      memset(v40, 0, 32);
      goto LABEL_50;
    }
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v17 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    *(_WORD *)v43 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v43, 2);
    v24 = (std::string *)v23;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setTemporaryAuthorizationStatusForBundleId:orBundlePath:statusData:replyBlock:]", "%s\n", v23);
    if (v24 != buf)
      free(v24);
  }
  v18 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
  (*((void (**)(id, id))a6 + 2))(a6, v18);

LABEL_16:
  os_activity_scope_leave(&state);

}

- (void)getAuthorizationStatusForAppWithAuditToken:(id *)a3 replyBlock:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  std::string *v18;
  int v19;
  uint8_t *v20;
  const char *v21;
  uint8_t *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  uint8_t *v26;
  _OWORD v27[2];
  std::string v28;
  void *__dst[2];
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *__p;
  char v42;
  void *v43[2];
  char v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  os_activity_scope_state_s state;
  uint8_t v58[4];
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  std::string *v63;
  __int16 v64;
  uint8_t *v65;
  __int16 v66;
  const char *v67;
  uint8_t buf[8];
  __int16 v69;
  const char *v70;
  __int16 v71;
  _BYTE v72[12];
  char v73;
  void *v74;
  char v75;
  void *v76;
  char v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v82;
  char v83;

  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetAuthorizationStatusForAppWithAuditToken (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v69 = 2082;
    v70 = "";
    v71 = 2082;
    *(_QWORD *)v72 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetAuthorizationStatusForAppWithAuditToken\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v11 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.effective_bundle"));
  if (v11
    && (v12 = objc_opt_class(NSNumber, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    sub_1001AE4D0((uint64_t)a3, (uint64_t)v43);
    v13 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
    sub_1001AF190((char *)__dst, (__int128 *)v43);
    v14 = objc_msgSend(v13, "syncgetClientEffectiveRegistrationResultWithTransientAwareness:", sub_1001AE728((__int128 *)__dst));
    if (v42 < 0)
      operator delete(__p);
    if (v40 < 0)
      operator delete(v39);
    if (v38 < 0)
      operator delete(v37);
    if (v36 < 0)
      operator delete(v35);
    if (v34 < 0)
      operator delete(v33);
    if (v32 < 0)
      operator delete(v31);
    if (v30 < 0)
      operator delete(__dst[0]);
    v15 = objc_msgSend(v13, "syncgetRegistrationResultToAuthorizationStatus:", v14);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v16 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
    {
      v17 = *(_OWORD *)&a3->var0[4];
      v27[0] = *(_OWORD *)a3->var0;
      v27[1] = v17;
      sub_1001AE4D0((uint64_t)v27, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, &v28);
      if (v83 < 0)
        operator delete(v82);
      if (v81 < 0)
        operator delete(v80);
      if (v79 < 0)
        operator delete(v78);
      if (v77 < 0)
        operator delete(v76);
      if (v75 < 0)
        operator delete(v74);
      if (v73 < 0)
        operator delete(*(void **)&v72[4]);
      if ((v72[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v18 = &v28;
      else
        v18 = (std::string *)v28.__r_.__value_.__r.__words[0];
      sub_1001A885C((uint64_t)v43, (uint64_t)buf);
      v19 = v72[3];
      v20 = *(uint8_t **)buf;
      v21 = sub_1001AE704(v15);
      v22 = buf;
      *(_DWORD *)v58 = 68289794;
      if (v19 < 0)
        v22 = v20;
      v59 = 0;
      v60 = 2082;
      v61 = "";
      v62 = 2082;
      v63 = v18;
      v64 = 2082;
      v65 = v22;
      v66 = 2082;
      v67 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Authorization status for App With Audit Token\", \"bundle\":%{public, location:escape_only}s, \"clientKey\":%{public, location:escape_only}s, \"status\":%{public, location:escape_only}s}", v58, 0x30u);
      if ((v72[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v28.__r_.__value_.__l.__data_);
    }
    (*((void (**)(id, _QWORD, id))a4 + 2))(a4, 0, v15);
    if (v56 < 0)
      operator delete(v55);
    if (v54 < 0)
      operator delete(v53);
    if (v52 < 0)
      operator delete(v51);
    if (v50 < 0)
      operator delete(v49);
    if (v48 < 0)
      operator delete(v47);
    if (v46 < 0)
      operator delete(v45);
    if (v44 < 0)
      operator delete(v43[0]);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v23 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v43[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v43, 2);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getAuthorizationStatusForAppWithAuditToken:replyBlock:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    v24 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a4 + 2))(a4, v24, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)getTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  audit_token_t *v15;
  NSObject *v16;
  id v17;
  char v18;
  NSObject *v19;
  std::string *v20;
  id v21;
  id v22;
  NSObject *v23;
  std::string *v24;
  const char *v25;
  std::string *v26;
  void *__dst[2];
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  _BYTE v41[40];
  std::string __str;
  os_activity_scope_state_s state;
  _BYTE v44[48];
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int16 v49;
  char v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int16 v57;
  char v58;
  std::string buf[2];
  __int128 v60;
  _QWORD v61[5];
  __int128 v62;
  _OWORD v63[95];

  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLGetClientTransientAuthorizationInfo (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLGetClientTransientAuthorizationInfo\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v13 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v13)
  {
    v14 = objc_opt_class(NSNumber, v12);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0 && (objc_msgSend(v13, "BOOLValue") & 1) != 0)
    {
      memset(v61, 0, 35);
      v60 = 0u;
      memset(buf, 0, sizeof(buf));
      v62 = 0u;
      memset(v63, 0, 59);
      if (objc_msgSend(a3, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a3, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)v44);
      }
      else
      {
        if (!objc_msgSend(a4, "length"))
          goto LABEL_46;
        sub_1015A2E04(&__str, (char *)objc_msgSend(a4, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)v44);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = *(std::string *)v44;
      v44[23] = 0;
      v44[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = *(std::string *)&v44[24];
      v44[47] = 0;
      v44[24] = 0;
      if (SHIBYTE(v61[0]) < 0)
        operator delete((void *)v60);
      v60 = v45;
      v61[0] = v46;
      HIBYTE(v46) = 0;
      LOBYTE(v45) = 0;
      if (SHIBYTE(v61[3]) < 0)
        operator delete((void *)v61[1]);
      *(_OWORD *)&v61[1] = v47;
      v61[3] = v48;
      HIBYTE(v48) = 0;
      LOBYTE(v47) = 0;
      LOWORD(v61[4]) = v49;
      BYTE2(v61[4]) = v50;
      if (SBYTE7(v63[0]) < 0)
        operator delete((void *)v62);
      v62 = v51;
      *(_QWORD *)&v63[0] = v52;
      HIBYTE(v52) = 0;
      LOBYTE(v51) = 0;
      if (SHIBYTE(v63[1]) < 0)
        operator delete(*((void **)&v63[0] + 1));
      v18 = 0;
      *(_OWORD *)((char *)v63 + 8) = v53;
      *((_QWORD *)&v63[1] + 1) = v54;
      HIBYTE(v54) = 0;
      LOBYTE(v53) = 0;
      if (SBYTE7(v63[3]) < 0)
      {
        operator delete(*(void **)&v63[2]);
        v18 = HIBYTE(v54);
      }
      v63[2] = v55;
      *(_QWORD *)&v63[3] = v56;
      HIBYTE(v56) = 0;
      LOBYTE(v55) = 0;
      WORD4(v63[3]) = v57;
      BYTE10(v63[3]) = v58;
      if (v18 < 0)
        operator delete((void *)v53);
      if (SHIBYTE(v52) < 0)
        operator delete((void *)v51);
      if (SHIBYTE(v48) < 0)
        operator delete((void *)v47);
      if (SHIBYTE(v46) < 0)
        operator delete((void *)v45);
      if ((v44[47] & 0x80000000) != 0)
        operator delete(*(void **)&v44[24]);
      if ((v44[23] & 0x80000000) != 0)
        operator delete(*(void **)v44);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__str.__r_.__value_.__l.__data_);
        if (self)
          goto LABEL_47;
        goto LABEL_49;
      }
LABEL_46:
      if (self)
      {
LABEL_47:
        -[CLInternalService currentToken](self, "currentToken");
LABEL_50:
        CLConnection::getUserNameFromAuditToken(v44, (CLConnection *)v41, v15);
        sub_1001AE664(buf, (const std::string *)v44);
        if ((v44[23] & 0x80000000) != 0)
          operator delete(*(void **)v44);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v19 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
        {
          sub_1001A8444((uint64_t)buf, &__str);
          v20 = (__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &__str
              : (std::string *)__str.__r_.__value_.__r.__words[0];
          *(_DWORD *)v44 = 68289282;
          *(_DWORD *)&v44[4] = 0;
          *(_WORD *)&v44[8] = 2082;
          *(_QWORD *)&v44[10] = "";
          *(_WORD *)&v44[18] = 2082;
          *(_QWORD *)&v44[20] = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"getting temporary authorization status info for client, if applicable\", \"name\":%{public, location:escape_only}s}", v44, 0x1Cu);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__str.__r_.__value_.__l.__data_);
        }
        v21 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
        sub_1001AF190((char *)__dst, (__int128 *)buf);
        v22 = objc_msgSend(v21, "syncgetTemporaryAuthorizationStatusForClient:", sub_1001AE728((__int128 *)__dst));
        if (v40 < 0)
          operator delete(v39);
        if (v38 < 0)
          operator delete(v37);
        if (v36 < 0)
          operator delete(v35);
        if (v34 < 0)
          operator delete(v33);
        if (v32 < 0)
          operator delete(v31);
        if (v30 < 0)
          operator delete(v29);
        if (v28 < 0)
          operator delete(__dst[0]);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v23 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
        {
          sub_1001A8444((uint64_t)buf, &__str);
          v24 = (__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &__str
              : (std::string *)__str.__r_.__value_.__r.__words[0];
          *(_DWORD *)v44 = 68289282;
          *(_DWORD *)&v44[4] = 0;
          *(_WORD *)&v44[8] = 2082;
          *(_QWORD *)&v44[10] = "";
          *(_WORD *)&v44[18] = 2082;
          *(_QWORD *)&v44[20] = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"temporary auth replying for client\", \"name\":%{public, location:escape_only}s}", v44, 0x1Cu);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__str.__r_.__value_.__l.__data_);
        }
        (*((void (**)(id, _QWORD, id))a5 + 2))(a5, 0, v22);
        if (SBYTE7(v63[3]) < 0)
          operator delete(*(void **)&v63[2]);
        if (SHIBYTE(v63[1]) < 0)
          operator delete(*((void **)&v63[0] + 1));
        if (SBYTE7(v63[0]) < 0)
          operator delete((void *)v62);
        if (SHIBYTE(v61[3]) < 0)
          operator delete((void *)v61[1]);
        if (SHIBYTE(v61[0]) < 0)
          operator delete((void *)v60);
        if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf[1].__r_.__value_.__l.__data_);
        if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf[0].__r_.__value_.__l.__data_);
        goto LABEL_16;
      }
LABEL_49:
      memset(v41, 0, 32);
      goto LABEL_50;
    }
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v16 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    *(_WORD *)v44 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v44, 2);
    v26 = (std::string *)v25;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getTemporaryAuthorizationStatusForBundleId:orBundlePath:replyBlock:]", "%s\n", v25);
    if (v26 != buf)
      free(v26);
  }
  v17 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
  (*((void (**)(id, id, _QWORD))a5 + 2))(a5, v17, 0);

LABEL_16:
  os_activity_scope_leave(&state);

}

- (void)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  audit_token_t *v18;
  NSObject *v19;
  id v20;
  char v21;
  NSObject *v22;
  _BYTE *v23;
  double v24;
  double v25;
  const char *v26;
  char *v27;
  uint64_t v28;
  std::string *v29;
  char *v30;
  char *v31;
  void *__dst[2];
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  _BYTE v46[32];
  std::string __p[2];
  __int128 v48;
  _QWORD v49[5];
  __int128 v50;
  _OWORD v51[4];
  os_activity_scope_state_s state;
  int v53;
  std::string *v54;
  std::string v55;
  _BYTE buf[48];
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  __int16 v61;
  char v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  __int16 v69;
  char v70;

  v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLInternalChangeClientAuthorizationTime (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v13 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLInternalChangeClientAuthorizationTime\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v15 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.integritycheck"));
  if (v15)
  {
    v16 = objc_opt_class(NSNumber, v14);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0 && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
    {
      v17 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
      memset(v49, 0, 35);
      v48 = 0u;
      memset(__p, 0, sizeof(__p));
      v50 = 0u;
      memset(v51, 0, 59);
      if (objc_msgSend(a4, "length"))
      {
        sub_1015A2E04(&v55, (char *)objc_msgSend(a4, "UTF8String"));
        sub_1001AE67C(&v55, (uint64_t)buf);
      }
      else
      {
        if (!objc_msgSend(a5, "length"))
          goto LABEL_46;
        sub_1015A2E04(&v55, (char *)objc_msgSend(a5, "UTF8String"));
        sub_1001B8590(&v55, (uint64_t)buf);
      }
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      __p[0] = *(std::string *)buf;
      buf[23] = 0;
      buf[0] = 0;
      if (SHIBYTE(__p[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[1].__r_.__value_.__l.__data_);
      __p[1] = *(std::string *)&buf[24];
      buf[47] = 0;
      buf[24] = 0;
      if (SHIBYTE(v49[0]) < 0)
        operator delete((void *)v48);
      v48 = v57;
      v49[0] = v58;
      HIBYTE(v58) = 0;
      LOBYTE(v57) = 0;
      if (SHIBYTE(v49[3]) < 0)
        operator delete((void *)v49[1]);
      *(_OWORD *)&v49[1] = v59;
      v49[3] = v60;
      HIBYTE(v60) = 0;
      LOBYTE(v59) = 0;
      LOWORD(v49[4]) = v61;
      BYTE2(v49[4]) = v62;
      if (SBYTE7(v51[0]) < 0)
        operator delete((void *)v50);
      v50 = v63;
      *(_QWORD *)&v51[0] = v64;
      HIBYTE(v64) = 0;
      LOBYTE(v63) = 0;
      if (SHIBYTE(v51[1]) < 0)
        operator delete(*((void **)&v51[0] + 1));
      v21 = 0;
      *(_OWORD *)((char *)v51 + 8) = v65;
      *((_QWORD *)&v51[1] + 1) = v66;
      HIBYTE(v66) = 0;
      LOBYTE(v65) = 0;
      if (SBYTE7(v51[3]) < 0)
      {
        operator delete(*(void **)&v51[2]);
        v21 = HIBYTE(v66);
      }
      v51[2] = v67;
      *(_QWORD *)&v51[3] = v68;
      HIBYTE(v68) = 0;
      LOBYTE(v67) = 0;
      WORD4(v51[3]) = v69;
      BYTE10(v51[3]) = v70;
      if (v21 < 0)
        operator delete((void *)v65);
      if (SHIBYTE(v64) < 0)
        operator delete((void *)v63);
      if (SHIBYTE(v60) < 0)
        operator delete((void *)v59);
      if (SHIBYTE(v58) < 0)
        operator delete((void *)v57);
      if ((buf[47] & 0x80000000) != 0)
        operator delete(*(void **)&buf[24]);
      if ((buf[23] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v55.__r_.__value_.__l.__data_);
        if (self)
          goto LABEL_47;
        goto LABEL_49;
      }
LABEL_46:
      if (self)
      {
LABEL_47:
        -[CLInternalService currentToken](self, "currentToken");
LABEL_50:
        CLConnection::getUserNameFromAuditToken(buf, (CLConnection *)v46, v18);
        sub_1001AE664(__p, (const std::string *)buf);
        if ((buf[23] & 0x80000000) != 0)
          operator delete(*(void **)buf);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v22 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
        {
          sub_1001A8444((uint64_t)__p, (std::string *)buf);
          v23 = buf[23] >= 0 ? buf : *(_BYTE **)buf;
          LODWORD(v55.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 4) = (std::string::size_type)v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "#appclip updating for %s", (uint8_t *)&v55, 0xCu);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
          v28 = qword_1022A01C8;
          sub_1001A8444((uint64_t)__p, &v55);
          if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v29 = &v55;
          else
            v29 = (std::string *)v55.__r_.__value_.__r.__words[0];
          v53 = 136315138;
          v54 = v29;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v28, 1, "#appclip updating for %s", (const char *)&v53);
          v31 = v30;
          if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v55.__r_.__value_.__l.__data_);
          sub_100512490("Generic", 1, 0, 2, "-[CLInternalService modifyOrSetAuthorizationTime:forBundleID:orBundlePath:replyBlock:]", "%s\n", v31);
          if (v31 != buf)
            free(v31);
        }
        sub_1001AF190((char *)__dst, (__int128 *)__p);
        objc_msgSend(v17, "syncgetAndSetOrChangeAppClipAuthorizationTime:forClient:", sub_1001AE728((__int128 *)__dst), a3);
        v25 = v24;
        if (v45 < 0)
          operator delete(v44);
        if (v43 < 0)
          operator delete(v42);
        if (v41 < 0)
          operator delete(v40);
        if (v39 < 0)
          operator delete(v38);
        if (v37 < 0)
          operator delete(v36);
        if (v35 < 0)
          operator delete(v34);
        if (v33 < 0)
          operator delete(__dst[0]);
        (*((void (**)(id, _QWORD, double))a6 + 2))(a6, 0, v25);
        if (SBYTE7(v51[3]) < 0)
          operator delete(*(void **)&v51[2]);
        if (SHIBYTE(v51[1]) < 0)
          operator delete(*((void **)&v51[0] + 1));
        if (SBYTE7(v51[0]) < 0)
          operator delete((void *)v50);
        if (SHIBYTE(v49[3]) < 0)
          operator delete((void *)v49[1]);
        if (SHIBYTE(v49[0]) < 0)
          operator delete((void *)v48);
        if (SHIBYTE(__p[1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p[1].__r_.__value_.__l.__data_);
        if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p[0].__r_.__value_.__l.__data_);
        goto LABEL_16;
      }
LABEL_49:
      memset(v46, 0, sizeof(v46));
      goto LABEL_50;
    }
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v19 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    LOWORD(__p[0].__r_.__value_.__l.__data_) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", __p, 2);
    v27 = (char *)v26;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService modifyOrSetAuthorizationTime:forBundleID:orBundlePath:replyBlock:]", "%s\n", v26);
    if (v27 != buf)
      free(v27);
  }
  v20 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
  (*((void (**)(id, id, double))a6 + 2))(a6, v20, -1.0);

LABEL_16:
  os_activity_scope_leave(&state);

}

- (void)triggerExpiredAuthorizationPurgeWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint8_t *v14;
  _WORD v15[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLInternalTriggerExpiredAuthorizationPurge (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLInternalTriggerExpiredAuthorizationPurge\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.integritycheck"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager")), "triggerClearAppClipAuthorizationIfNecessary");
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v11 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v15[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v15, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService triggerExpiredAuthorizationPurgeWithReplyBlock:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a3 + 2))(a3, v12);

  }
  os_activity_scope_leave(&state);

}

- (void)getGestureServiceEnabledWithReplyBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  _BOOL8 v12;
  BOOL v13;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v16[10];
  __int16 v17;
  const char *v18;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetGestureServiceEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v6 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = "";
    v17 = 2082;
    v18 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetGestureServiceEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v13 = 0;
  sub_1001E4804(buf);
  v7 = sub_1001E48E4(*(uint64_t *)buf, (uint64_t)CFSTR("GestureServiceEnabled"), &v13);
  v8 = v7;
  v9 = *(std::__shared_weak_count **)v16;
  if (*(_QWORD *)v16)
  {
    v10 = (unint64_t *)(*(_QWORD *)v16 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      if (v8)
        goto LABEL_10;
LABEL_12:
      v12 = 0;
      v13 = 0;
      goto LABEL_13;
    }
  }
  if (!v7)
    goto LABEL_12;
LABEL_10:
  v12 = v13;
LABEL_13:
  (*((void (**)(id, _QWORD, _BOOL8))a3 + 2))(a3, 0, v12);
  os_activity_scope_leave(&state);

}

- (void)pingDaemonWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  std::string *v9;
  _OWORD v10[2];
  std::string v11;
  os_activity_scope_state_s state;
  uint8_t v13[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  std::string *v18;
  uint8_t buf[8];
  __int16 v20;
  const char *v21;
  __int16 v22;
  _QWORD v23[3];
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *__p;
  char v34;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonPingDaemon (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonPingDaemon\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  }
  v8 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
  {
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(v10, 0, sizeof(v10));
    sub_1001AE4D0((uint64_t)v10, (uint64_t)buf);
    sub_1001A8444((uint64_t)buf, &v11);
    if (v34 < 0)
      operator delete(__p);
    if (v32 < 0)
      operator delete(v31);
    if (v30 < 0)
      operator delete(v29);
    if (v28 < 0)
      operator delete(v27);
    if (v26 < 0)
      operator delete(v25);
    if (v24 < 0)
      operator delete(*(void **)((char *)v23 + 4));
    if (SBYTE3(v23[0]) < 0)
      operator delete(*(void **)buf);
    v9 = &v11;
    if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v9 = (std::string *)v11.__r_.__value_.__r.__words[0];
    *(_DWORD *)v13 = 68289282;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Pinged by external process\", \"process\":%{public, location:escape_only}s}", v13, 0x1Cu);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  os_activity_scope_leave(&state);

}

- (void)getPrecisionPermissionForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  audit_token_t *v12;
  id v13;
  id v14;
  std::string *p_p;
  id v16;
  unsigned int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  std::string __p;
  os_activity_scope_state_s state;
  _BYTE buf[32];
  __int128 v24;
  void *v25[2];
  void *v26[2];
  _BYTE v27[24];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31[4];

  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetPrecisionPermission (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetPrecisionPermission\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  *(_OWORD *)v26 = 0u;
  memset(v27, 0, 19);
  v24 = 0u;
  *(_OWORD *)v25 = 0u;
  memset(buf, 0, sizeof(buf));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  memset(v31, 0, 27);
  if (+[CLInternalService getEffectiveClientName:bundlePath:name:](CLInternalService, "getEffectiveClientName:bundlePath:name:", a3, a4, buf))
  {
    if (self)
    {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
    }
    CLConnection::getUserNameFromAuditToken(&__p, (CLConnection *)&v19, v12);
    sub_1001AE664((std::string *)buf, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v14 = objc_msgSend(-[CLInternalService vendor](self, "vendor", v19, v20), "proxyForService:", CFSTR("CLClientAuthorizationCache"));
    sub_1001A885C((uint64_t)buf, (uint64_t)&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v16 = objc_msgSend(v14, "syncgetAuthorizationContextIfClientIsNonZonal:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v17 = objc_msgSend(v16, "isAuthorizedForServiceType:", 12);
    if (objc_msgSend(v16, "transientAwareRegistrationResult") == 4)
      v18 = 1;
    else
      v18 = v17;
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, v18);
  }
  else
  {
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id, _QWORD))a5 + 2))(a5, v13, 0);

  }
  if (SHIBYTE(v31[2]) < 0)
    operator delete(v31[0]);
  if (SHIBYTE(v30) < 0)
    operator delete(*((void **)&v29 + 1));
  if (SBYTE7(v29) < 0)
    operator delete((void *)v28);
  if ((v27[15] & 0x80000000) != 0)
    operator delete(v26[1]);
  if (SHIBYTE(v26[0]) < 0)
    operator delete(v25[0]);
  if (SHIBYTE(v24) < 0)
    operator delete(*(void **)&buf[24]);
  if ((buf[23] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  os_activity_scope_leave(&state);

}

- (void)getIncidentalUseModeForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  audit_token_t *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  void *__dst[2];
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  _OWORD v30[2];
  std::string __p;
  os_activity_scope_state_s state;
  _BYTE buf[32];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[24];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41[4];

  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: getIncidentalUseModeForBundleID:forBundleID:orBundlePath:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289282;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"getIncidentalUseModeForBundleID:forBundleID:orBundlePath:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v36 = 0u;
  memset(v37, 0, 19);
  v34 = 0u;
  v35 = 0u;
  memset(buf, 0, sizeof(buf));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  memset(v41, 0, 27);
  if (+[CLInternalService getEffectiveClientName:bundlePath:name:](CLInternalService, "getEffectiveClientName:bundlePath:name:", a3, a4, buf))
  {
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(v30, 0, sizeof(v30));
    CLConnection::getUserNameFromAuditToken(&__p, (CLConnection *)v30, v12);
    sub_1001AE664((std::string *)buf, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v14 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLInternalService"));
    sub_1001AF190((char *)__dst, (__int128 *)buf);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10189D198;
    v15[3] = &unk_1021907F0;
    v15[4] = a5;
    objc_msgSend(v14, "getIncidentalUseModeForClient:withReply:", sub_1001AE728((__int128 *)__dst), v15);
    if (v29 < 0)
      operator delete(v28);
    if (v27 < 0)
      operator delete(v26);
    if (v25 < 0)
      operator delete(v24);
    if (v23 < 0)
      operator delete(v22);
    if (v21 < 0)
      operator delete(v20);
    if (v19 < 0)
      operator delete(v18);
    if (v17 < 0)
      operator delete(__dst[0]);
  }
  else
  {
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id, _QWORD))a5 + 2))(a5, v13, 0);

  }
  if (SHIBYTE(v41[2]) < 0)
    operator delete(v41[0]);
  if (SHIBYTE(v40) < 0)
    operator delete(*((void **)&v39 + 1));
  if (SBYTE7(v39) < 0)
    operator delete((void *)v38);
  if ((v37[15] & 0x80000000) != 0)
    operator delete(*((void **)&v36 + 1));
  if (SBYTE7(v36) < 0)
    operator delete((void *)v35);
  if (SHIBYTE(v34) < 0)
    operator delete(*(void **)&buf[24]);
  if ((buf[23] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  os_activity_scope_leave(&state);

}

- (void)registerCircularInterestZoneWithId:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleId:(id)a9 orBundlePath:(id)a10 replyBlock:(id)a11
{
  id v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  audit_token_t *v25;
  NSObject *v26;
  id v27;
  char v28;
  NSObject *v29;
  double v30;
  int v31;
  std::string::size_type v32;
  id v33;
  std::string *p_str;
  id v35;
  _BYTE *v36;
  NSObject *v37;
  id v38;
  const char *v39;
  std::string *v40;
  const char *v41;
  std::string *v42;
  _QWORD v45[5];
  _OWORD v46[2];
  std::string __str;
  os_activity_scope_state_s state;
  _BYTE v49[48];
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int16 v54;
  char v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  __int16 v62;
  char v63;
  std::string buf[2];
  __int128 v65;
  _QWORD v66[5];
  __int128 v67;
  _OWORD v68[95];

  v19 = objc_alloc_init((Class)NSAutoreleasePool);
  v20 = _os_activity_create((void *)&_mh_execute_header, "CL: registerCircularInterestZoneWithId: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v20, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v21 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"registerCircularInterestZoneWithId:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v23 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v23
    && (v24 = objc_opt_class(NSNumber, v22), (objc_opt_isKindOfClass(v23, v24) & 1) != 0)
    && (objc_msgSend(v23, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a9, "length") || objc_msgSend(a10, "length"))
    {
      memset(v66, 0, 35);
      v65 = 0u;
      memset(buf, 0, sizeof(buf));
      v67 = 0u;
      memset(v68, 0, 59);
      if (objc_msgSend(a9, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a9, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)v49);
      }
      else
      {
        if (!objc_msgSend(a10, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v46, 0, sizeof(v46));
          CLConnection::getUserNameFromAuditToken(v49, (CLConnection *)v46, v25);
          sub_1001AE664(buf, (const std::string *)v49);
          if ((v49[23] & 0x80000000) != 0)
            operator delete(*(void **)v49);
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
          v29 = qword_1022A01C8;
          if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
          {
            v30 = sub_1001A8444((uint64_t)buf, &__str);
            v31 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
            v32 = __str.__r_.__value_.__r.__words[0];
            v33 = objc_msgSend(a3, "UTF8String", v30);
            p_str = &__str;
            *(_DWORD *)v49 = 68289538;
            if (v31 < 0)
              p_str = (std::string *)v32;
            *(_DWORD *)&v49[4] = 0;
            *(_WORD *)&v49[8] = 2082;
            *(_QWORD *)&v49[10] = "";
            *(_WORD *)&v49[18] = 2082;
            *(_QWORD *)&v49[20] = p_str;
            *(_WORD *)&v49[28] = 2082;
            *(_QWORD *)&v49[30] = v33;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Register Circular InterestZone\", \"client\":%{public, location:escape_only}s, \"ZoneName\":%{public, location:escape_only}s}", v49, 0x26u);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__str.__r_.__value_.__l.__data_);
          }
          v35 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLInternalService"));
          sub_1001A885C((uint64_t)buf, (uint64_t)v49);
          if (v49[23] >= 0)
            v36 = v49;
          else
            v36 = *(_BYTE **)v49;
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_10189DCCC;
          v45[3] = &unk_102152378;
          v45[4] = a11;
          objc_msgSend(v35, "registerCircularInterestZoneForClientKey:withId:latitude:longitude:serviceMaskOperator:provenanceType:radius:withReply:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v36), a3, a7, a8, v45, a4, a5, a6);
          if ((v49[23] & 0x80000000) != 0)
            operator delete(*(void **)v49);
          if (SBYTE7(v68[3]) < 0)
            operator delete(*(void **)&v68[2]);
          if (SHIBYTE(v68[1]) < 0)
            operator delete(*((void **)&v68[0] + 1));
          if (SBYTE7(v68[0]) < 0)
            operator delete((void *)v67);
          if (SHIBYTE(v66[3]) < 0)
            operator delete((void *)v66[1]);
          if (SHIBYTE(v66[0]) < 0)
            operator delete((void *)v65);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_18;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a10, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)v49);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = *(std::string *)v49;
      v49[23] = 0;
      v49[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = *(std::string *)&v49[24];
      v49[47] = 0;
      v49[24] = 0;
      if (SHIBYTE(v66[0]) < 0)
        operator delete((void *)v65);
      v65 = v50;
      v66[0] = v51;
      HIBYTE(v51) = 0;
      LOBYTE(v50) = 0;
      if (SHIBYTE(v66[3]) < 0)
        operator delete((void *)v66[1]);
      *(_OWORD *)&v66[1] = v52;
      v66[3] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      LOWORD(v66[4]) = v54;
      BYTE2(v66[4]) = v55;
      if (SBYTE7(v68[0]) < 0)
        operator delete((void *)v67);
      v67 = v56;
      *(_QWORD *)&v68[0] = v57;
      HIBYTE(v57) = 0;
      LOBYTE(v56) = 0;
      if (SHIBYTE(v68[1]) < 0)
        operator delete(*((void **)&v68[0] + 1));
      v28 = 0;
      *(_OWORD *)((char *)v68 + 8) = v58;
      *((_QWORD *)&v68[1] + 1) = v59;
      HIBYTE(v59) = 0;
      LOBYTE(v58) = 0;
      if (SBYTE7(v68[3]) < 0)
      {
        operator delete(*(void **)&v68[2]);
        v28 = HIBYTE(v59);
      }
      v68[2] = v60;
      *(_QWORD *)&v68[3] = v61;
      HIBYTE(v61) = 0;
      LOBYTE(v60) = 0;
      WORD4(v68[3]) = v62;
      BYTE10(v68[3]) = v63;
      if (v28 < 0)
        operator delete((void *)v58);
      if (SHIBYTE(v57) < 0)
        operator delete((void *)v56);
      if (SHIBYTE(v53) < 0)
        operator delete((void *)v52);
      if (SHIBYTE(v51) < 0)
        operator delete((void *)v50);
      if ((v49[47] & 0x80000000) != 0)
        operator delete(*(void **)&v49[24]);
      if ((v49[23] & 0x80000000) != 0)
        operator delete(*(void **)v49);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v37 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "#Spi registerCircularInterestZone, Must provide a bundle identifier or bundle path", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v49 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi registerCircularInterestZone, Must provide a bundle identifier or bundle path", v49, 2);
      v42 = (std::string *)v41;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService registerCircularInterestZoneWithId:latitude:longitude:radius:serviceMaskOperator:provenanceType:forBundleId:orBundlePath:replyBlock:]", "%s\n", v41);
      if (v42 != buf)
        free(v42);
    }
    v38 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a11 + 2))(a11, v38);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v26 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v49 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v49, 2);
      v40 = (std::string *)v39;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService registerCircularInterestZoneWithId:latitude:longitude:radius:serviceMaskOperator:provenanceType:forBundleId:orBundlePath:replyBlock:]", "%s\n", v39);
      if (v40 != buf)
        free(v40);
    }
    v27 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a11 + 2))(a11, v27);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleId:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9
{
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  audit_token_t *v19;
  NSObject *v20;
  id v21;
  char v22;
  NSObject *v23;
  double v24;
  int v25;
  std::string::size_type v26;
  id v27;
  std::string *p_str;
  id v29;
  _BYTE *v30;
  NSObject *v31;
  id v32;
  const char *v33;
  std::string *v34;
  const char *v35;
  std::string *v36;
  _QWORD v40[5];
  _OWORD v41[2];
  std::string __str;
  os_activity_scope_state_s state;
  _BYTE v44[48];
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int16 v49;
  char v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int16 v57;
  char v58;
  std::string buf[2];
  __int128 v60;
  _QWORD v61[5];
  __int128 v62;
  _OWORD v63[95];

  v13 = objc_alloc_init((Class)NSAutoreleasePool);
  v14 = _os_activity_create((void *)&_mh_execute_header, "CL: registerPhenolicInterestZoneWithId: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v14, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v15 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"registerPhenolicInterestZoneWithId:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v17 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v17
    && (v18 = objc_opt_class(NSNumber, v16), (objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    && (objc_msgSend(v17, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a7, "length") || objc_msgSend(a8, "length"))
    {
      memset(v61, 0, 35);
      v60 = 0u;
      memset(buf, 0, sizeof(buf));
      v62 = 0u;
      memset(v63, 0, 59);
      if (objc_msgSend(a7, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a7, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)v44);
      }
      else
      {
        if (!objc_msgSend(a8, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v41, 0, sizeof(v41));
          CLConnection::getUserNameFromAuditToken(v44, (CLConnection *)v41, v19);
          sub_1001AE664(buf, (const std::string *)v44);
          if ((v44[23] & 0x80000000) != 0)
            operator delete(*(void **)v44);
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
          v23 = qword_1022A01C8;
          if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
          {
            v24 = sub_1001A8444((uint64_t)buf, &__str);
            v25 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
            v26 = __str.__r_.__value_.__r.__words[0];
            v27 = objc_msgSend(a3, "UTF8String", v24);
            p_str = &__str;
            *(_DWORD *)v44 = 68289538;
            if (v25 < 0)
              p_str = (std::string *)v26;
            *(_DWORD *)&v44[4] = 0;
            *(_WORD *)&v44[8] = 2082;
            *(_QWORD *)&v44[10] = "";
            *(_WORD *)&v44[18] = 2082;
            *(_QWORD *)&v44[20] = p_str;
            *(_WORD *)&v44[28] = 2082;
            *(_QWORD *)&v44[30] = v27;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Register Phenolic InterestZone\", \"client\":%{public, location:escape_only}s, \"ZoneName\":%{public, location:escape_only}s}", v44, 0x26u);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__str.__r_.__value_.__l.__data_);
          }
          v29 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLInternalService"));
          sub_1001A885C((uint64_t)buf, (uint64_t)v44);
          if (v44[23] >= 0)
            v30 = v44;
          else
            v30 = *(_BYTE **)v44;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_10189E6E8;
          v40[3] = &unk_102152378;
          v40[4] = a9;
          objc_msgSend(v29, "registerPhenolicInterestZoneForClientKey:withId:phenolicLocation:serviceMaskOperator:provenanceType:withReply:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v30), a3, a4, a5, a6, v40);
          if ((v44[23] & 0x80000000) != 0)
            operator delete(*(void **)v44);
          if (SBYTE7(v63[3]) < 0)
            operator delete(*(void **)&v63[2]);
          if (SHIBYTE(v63[1]) < 0)
            operator delete(*((void **)&v63[0] + 1));
          if (SBYTE7(v63[0]) < 0)
            operator delete((void *)v62);
          if (SHIBYTE(v61[3]) < 0)
            operator delete((void *)v61[1]);
          if (SHIBYTE(v61[0]) < 0)
            operator delete((void *)v60);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_18;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a8, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)v44);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = *(std::string *)v44;
      v44[23] = 0;
      v44[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = *(std::string *)&v44[24];
      v44[47] = 0;
      v44[24] = 0;
      if (SHIBYTE(v61[0]) < 0)
        operator delete((void *)v60);
      v60 = v45;
      v61[0] = v46;
      HIBYTE(v46) = 0;
      LOBYTE(v45) = 0;
      if (SHIBYTE(v61[3]) < 0)
        operator delete((void *)v61[1]);
      *(_OWORD *)&v61[1] = v47;
      v61[3] = v48;
      HIBYTE(v48) = 0;
      LOBYTE(v47) = 0;
      LOWORD(v61[4]) = v49;
      BYTE2(v61[4]) = v50;
      if (SBYTE7(v63[0]) < 0)
        operator delete((void *)v62);
      v62 = v51;
      *(_QWORD *)&v63[0] = v52;
      HIBYTE(v52) = 0;
      LOBYTE(v51) = 0;
      if (SHIBYTE(v63[1]) < 0)
        operator delete(*((void **)&v63[0] + 1));
      v22 = 0;
      *(_OWORD *)((char *)v63 + 8) = v53;
      *((_QWORD *)&v63[1] + 1) = v54;
      HIBYTE(v54) = 0;
      LOBYTE(v53) = 0;
      if (SBYTE7(v63[3]) < 0)
      {
        operator delete(*(void **)&v63[2]);
        v22 = HIBYTE(v54);
      }
      v63[2] = v55;
      *(_QWORD *)&v63[3] = v56;
      HIBYTE(v56) = 0;
      LOBYTE(v55) = 0;
      WORD4(v63[3]) = v57;
      BYTE10(v63[3]) = v58;
      if (v22 < 0)
        operator delete((void *)v53);
      if (SHIBYTE(v52) < 0)
        operator delete((void *)v51);
      if (SHIBYTE(v48) < 0)
        operator delete((void *)v47);
      if (SHIBYTE(v46) < 0)
        operator delete((void *)v45);
      if ((v44[47] & 0x80000000) != 0)
        operator delete(*(void **)&v44[24]);
      if ((v44[23] & 0x80000000) != 0)
        operator delete(*(void **)v44);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v31 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "#Spi registerPhenolicInterestZone, Must provide a bundle identifier or bundle path", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v44 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi registerPhenolicInterestZone, Must provide a bundle identifier or bundle path", v44, 2);
      v36 = (std::string *)v35;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService registerPhenolicInterestZoneWithId:phenolicLocation:serviceMaskOperator:provenanceType:forBundleId:orBundlePath:replyBlock:]", "%s\n", v35);
      if (v36 != buf)
        free(v36);
    }
    v32 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a9 + 2))(a9, v32);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v20 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v44 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v44, 2);
      v34 = (std::string *)v33;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService registerPhenolicInterestZoneWithId:phenolicLocation:serviceMaskOperator:provenanceType:forBundleId:orBundlePath:replyBlock:]", "%s\n", v33);
      if (v34 != buf)
        free(v34);
    }
    v21 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a9 + 2))(a9, v21);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleId:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7
{
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  audit_token_t *v18;
  NSObject *v19;
  id v20;
  char v21;
  NSObject *v22;
  double v23;
  int v24;
  std::string::size_type v25;
  id v26;
  std::string *p_str;
  id v28;
  _BYTE *v29;
  NSObject *v30;
  id v31;
  const char *v32;
  std::string *v33;
  const char *v34;
  std::string *v35;
  _BOOL4 v36;
  _QWORD v37[5];
  _OWORD v38[2];
  std::string __str;
  os_activity_scope_state_s state;
  _BYTE v41[48];
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int16 v46;
  char v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int16 v54;
  char v55;
  std::string buf[2];
  __int128 v57;
  _QWORD v58[5];
  __int128 v59;
  _OWORD v60[95];

  v36 = a3;
  v12 = objc_alloc_init((Class)NSAutoreleasePool);
  v13 = _os_activity_create((void *)&_mh_execute_header, "CL: setRelevance:forInterestZoneWithName: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v13, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v14 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setRelevance:forInterestZoneWithName:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v16 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v16
    && (v17 = objc_opt_class(NSNumber, v15), (objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    && (objc_msgSend(v16, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a5, "length") || objc_msgSend(a6, "length"))
    {
      memset(v58, 0, 35);
      v57 = 0u;
      memset(buf, 0, sizeof(buf));
      v59 = 0u;
      memset(v60, 0, 59);
      if (objc_msgSend(a5, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a5, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)v41);
      }
      else
      {
        if (!objc_msgSend(a6, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v38, 0, sizeof(v38));
          CLConnection::getUserNameFromAuditToken(v41, (CLConnection *)v38, v18);
          sub_1001AE664(buf, (const std::string *)v41);
          if ((v41[23] & 0x80000000) != 0)
            operator delete(*(void **)v41);
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
          v22 = qword_1022A01C8;
          if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
          {
            v23 = sub_1001A8444((uint64_t)buf, &__str);
            v24 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
            v25 = __str.__r_.__value_.__r.__words[0];
            v26 = objc_msgSend(a4, "UTF8String", v23);
            p_str = &__str;
            *(_DWORD *)v41 = 68289538;
            if (v24 < 0)
              p_str = (std::string *)v25;
            *(_DWORD *)&v41[4] = 0;
            *(_WORD *)&v41[8] = 2082;
            *(_QWORD *)&v41[10] = "";
            *(_WORD *)&v41[18] = 2082;
            *(_QWORD *)&v41[20] = p_str;
            *(_WORD *)&v41[28] = 2082;
            *(_QWORD *)&v41[30] = v26;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, SetRelevanceForInterestZone\", \"client\":%{public, location:escape_only}s, \"ZoneName\":%{public, location:escape_only}s}", v41, 0x26u);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__str.__r_.__value_.__l.__data_);
          }
          v28 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLInternalService"));
          sub_1001A885C((uint64_t)buf, (uint64_t)v41);
          if (v41[23] >= 0)
            v29 = v41;
          else
            v29 = *(_BYTE **)v41;
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_10189F0FC;
          v37[3] = &unk_102152378;
          v37[4] = a7;
          objc_msgSend(v28, "setRelevance:forInterestZoneWithId:registeredForClientKey:withReply:", v36, a4, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v29), v37);
          if ((v41[23] & 0x80000000) != 0)
            operator delete(*(void **)v41);
          if (SBYTE7(v60[3]) < 0)
            operator delete(*(void **)&v60[2]);
          if (SHIBYTE(v60[1]) < 0)
            operator delete(*((void **)&v60[0] + 1));
          if (SBYTE7(v60[0]) < 0)
            operator delete((void *)v59);
          if (SHIBYTE(v58[3]) < 0)
            operator delete((void *)v58[1]);
          if (SHIBYTE(v58[0]) < 0)
            operator delete((void *)v57);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_18;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a6, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)v41);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = *(std::string *)v41;
      v41[23] = 0;
      v41[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = *(std::string *)&v41[24];
      v41[47] = 0;
      v41[24] = 0;
      if (SHIBYTE(v58[0]) < 0)
        operator delete((void *)v57);
      v57 = v42;
      v58[0] = v43;
      HIBYTE(v43) = 0;
      LOBYTE(v42) = 0;
      if (SHIBYTE(v58[3]) < 0)
        operator delete((void *)v58[1]);
      *(_OWORD *)&v58[1] = v44;
      v58[3] = v45;
      HIBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      LOWORD(v58[4]) = v46;
      BYTE2(v58[4]) = v47;
      if (SBYTE7(v60[0]) < 0)
        operator delete((void *)v59);
      v59 = v48;
      *(_QWORD *)&v60[0] = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      if (SHIBYTE(v60[1]) < 0)
        operator delete(*((void **)&v60[0] + 1));
      v21 = 0;
      *(_OWORD *)((char *)v60 + 8) = v50;
      *((_QWORD *)&v60[1] + 1) = v51;
      HIBYTE(v51) = 0;
      LOBYTE(v50) = 0;
      if (SBYTE7(v60[3]) < 0)
      {
        operator delete(*(void **)&v60[2]);
        v21 = HIBYTE(v51);
      }
      v60[2] = v52;
      *(_QWORD *)&v60[3] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      WORD4(v60[3]) = v54;
      BYTE10(v60[3]) = v55;
      if (v21 < 0)
        operator delete((void *)v50);
      if (SHIBYTE(v49) < 0)
        operator delete((void *)v48);
      if (SHIBYTE(v45) < 0)
        operator delete((void *)v44);
      if (SHIBYTE(v43) < 0)
        operator delete((void *)v42);
      if ((v41[47] & 0x80000000) != 0)
        operator delete(*(void **)&v41[24]);
      if ((v41[23] & 0x80000000) != 0)
        operator delete(*(void **)v41);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v30 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "#Spi setRelevanceForInterestZone, Must provide a bundle identifier or bundle path", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v41 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi setRelevanceForInterestZone, Must provide a bundle identifier or bundle path", v41, 2);
      v35 = (std::string *)v34;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService setRelevance:forInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]", "%s\n", v34);
      if (v35 != buf)
        free(v35);
    }
    v31 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a7 + 2))(a7, v31);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v19 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v41 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v41, 2);
      v33 = (std::string *)v32;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setRelevance:forInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]", "%s\n", v32);
      if (v33 != buf)
        free(v33);
    }
    v20 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a7 + 2))(a7, v20);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)deleteInterestZoneWithId:(id)a3 registeredForBundleId:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  audit_token_t *v17;
  NSObject *v18;
  id v19;
  char v20;
  NSObject *v21;
  double v22;
  int v23;
  std::string::size_type v24;
  id v25;
  std::string *p_str;
  id v27;
  _BYTE *v28;
  NSObject *v29;
  id v30;
  const char *v31;
  std::string *v32;
  const char *v33;
  std::string *v34;
  _QWORD v35[5];
  _OWORD v36[2];
  std::string __str;
  os_activity_scope_state_s state;
  _BYTE v39[48];
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int16 v44;
  char v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int16 v52;
  char v53;
  std::string buf[2];
  __int128 v55;
  _QWORD v56[5];
  __int128 v57;
  _OWORD v58[95];

  v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = _os_activity_create((void *)&_mh_execute_header, "CL: deleteInterestZoneWithId: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v13 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"deleteInterestZoneWithId:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v15 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v15
    && (v16 = objc_opt_class(NSNumber, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a4, "length") || objc_msgSend(a5, "length"))
    {
      memset(v56, 0, 35);
      v55 = 0u;
      memset(buf, 0, sizeof(buf));
      v57 = 0u;
      memset(v58, 0, 59);
      if (objc_msgSend(a4, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a4, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)v39);
      }
      else
      {
        if (!objc_msgSend(a5, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v36, 0, sizeof(v36));
          CLConnection::getUserNameFromAuditToken(v39, (CLConnection *)v36, v17);
          sub_1001AE664(buf, (const std::string *)v39);
          if ((v39[23] & 0x80000000) != 0)
            operator delete(*(void **)v39);
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
          v21 = qword_1022A01C8;
          if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
          {
            v22 = sub_1001A8444((uint64_t)buf, &__str);
            v23 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
            v24 = __str.__r_.__value_.__r.__words[0];
            v25 = objc_msgSend(a3, "UTF8String", v22);
            p_str = &__str;
            *(_DWORD *)v39 = 68289538;
            if (v23 < 0)
              p_str = (std::string *)v24;
            *(_DWORD *)&v39[4] = 0;
            *(_WORD *)&v39[8] = 2082;
            *(_QWORD *)&v39[10] = "";
            *(_WORD *)&v39[18] = 2082;
            *(_QWORD *)&v39[20] = p_str;
            *(_WORD *)&v39[28] = 2082;
            *(_QWORD *)&v39[30] = v25;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, delete interest zone\", \"client\":%{public, location:escape_only}s, \"ZoneName\":%{public, location:escape_only}s}", v39, 0x26u);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__str.__r_.__value_.__l.__data_);
          }
          v27 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLInternalService"));
          sub_1001A885C((uint64_t)buf, (uint64_t)v39);
          if (v39[23] >= 0)
            v28 = v39;
          else
            v28 = *(_BYTE **)v39;
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10189FB08;
          v35[3] = &unk_102152378;
          v35[4] = a6;
          objc_msgSend(v27, "deleteInterestZoneWithId:registeredForClientKey:withReply:", a3, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v28), v35);
          if ((v39[23] & 0x80000000) != 0)
            operator delete(*(void **)v39);
          if (SBYTE7(v58[3]) < 0)
            operator delete(*(void **)&v58[2]);
          if (SHIBYTE(v58[1]) < 0)
            operator delete(*((void **)&v58[0] + 1));
          if (SBYTE7(v58[0]) < 0)
            operator delete((void *)v57);
          if (SHIBYTE(v56[3]) < 0)
            operator delete((void *)v56[1]);
          if (SHIBYTE(v56[0]) < 0)
            operator delete((void *)v55);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_18;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a5, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)v39);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = *(std::string *)v39;
      v39[23] = 0;
      v39[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = *(std::string *)&v39[24];
      v39[47] = 0;
      v39[24] = 0;
      if (SHIBYTE(v56[0]) < 0)
        operator delete((void *)v55);
      v55 = v40;
      v56[0] = v41;
      HIBYTE(v41) = 0;
      LOBYTE(v40) = 0;
      if (SHIBYTE(v56[3]) < 0)
        operator delete((void *)v56[1]);
      *(_OWORD *)&v56[1] = v42;
      v56[3] = v43;
      HIBYTE(v43) = 0;
      LOBYTE(v42) = 0;
      LOWORD(v56[4]) = v44;
      BYTE2(v56[4]) = v45;
      if (SBYTE7(v58[0]) < 0)
        operator delete((void *)v57);
      v57 = v46;
      *(_QWORD *)&v58[0] = v47;
      HIBYTE(v47) = 0;
      LOBYTE(v46) = 0;
      if (SHIBYTE(v58[1]) < 0)
        operator delete(*((void **)&v58[0] + 1));
      v20 = 0;
      *(_OWORD *)((char *)v58 + 8) = v48;
      *((_QWORD *)&v58[1] + 1) = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      if (SBYTE7(v58[3]) < 0)
      {
        operator delete(*(void **)&v58[2]);
        v20 = HIBYTE(v49);
      }
      v58[2] = v50;
      *(_QWORD *)&v58[3] = v51;
      HIBYTE(v51) = 0;
      LOBYTE(v50) = 0;
      WORD4(v58[3]) = v52;
      BYTE10(v58[3]) = v53;
      if (v20 < 0)
        operator delete((void *)v48);
      if (SHIBYTE(v47) < 0)
        operator delete((void *)v46);
      if (SHIBYTE(v43) < 0)
        operator delete((void *)v42);
      if (SHIBYTE(v41) < 0)
        operator delete((void *)v40);
      if ((v39[47] & 0x80000000) != 0)
        operator delete(*(void **)&v39[24]);
      if ((v39[23] & 0x80000000) != 0)
        operator delete(*(void **)v39);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v29 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "#Spi deleteInterestZoneWithId, Must provide a bundle identifier or bundle path", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v39 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi deleteInterestZoneWithId, Must provide a bundle identifier or bundle path", v39, 2);
      v34 = (std::string *)v33;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService deleteInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]", "%s\n", v33);
      if (v34 != buf)
        free(v34);
    }
    v30 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v30);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v18 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v39 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v39, 2);
      v32 = (std::string *)v31;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService deleteInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]", "%s\n", v31);
      if (v32 != buf)
        free(v32);
    }
    v19 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v19);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)performMigrationWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint8_t *v14;
  _QWORD v15[7];
  _QWORD v16[5];
  _WORD v17[8];
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v20[10];
  __int16 v21;
  const char *v22;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonPerformMigration (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v20 = 2082;
    *(_QWORD *)&v20[2] = "";
    v21 = 2082;
    v22 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonPerformMigration\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.integritycheck"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10189FF24;
    v16[3] = &unk_102148AC0;
    v16[4] = self;
    *(_QWORD *)buf = mach_absolute_time();
    *(_QWORD *)v20 = v16;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1018A0140;
    v15[3] = &unk_102180A50;
    v15[4] = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLInternalService"));
    v15[5] = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLDaemonStatus"));
    v15[6] = a3;
    objc_msgSend(+[CLSilo main](CLSilo, "main"), "async:", v15);
    sub_100134E40((uint64_t *)buf);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v11 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v17[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v17, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService performMigrationWithReplyBlock:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a3 + 2))(a3, v12);

  }
  os_activity_scope_leave(&state);

}

- (void)shutdownDaemonWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  std::string *v9;
  _OWORD v10[2];
  std::string v11;
  os_activity_scope_state_s state;
  uint8_t v13[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  std::string *v18;
  uint8_t buf[8];
  __int16 v20;
  const char *v21;
  __int16 v22;
  _QWORD v23[3];
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *__p;
  char v34;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonShutdownDaemon (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonShutdownDaemon\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  }
  v8 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(v10, 0, sizeof(v10));
    sub_1001AE4D0((uint64_t)v10, (uint64_t)buf);
    sub_1001A8444((uint64_t)buf, &v11);
    if (v34 < 0)
      operator delete(__p);
    if (v32 < 0)
      operator delete(v31);
    if (v30 < 0)
      operator delete(v29);
    if (v28 < 0)
      operator delete(v27);
    if (v26 < 0)
      operator delete(v25);
    if (v24 < 0)
      operator delete(*(void **)((char *)v23 + 4));
    if (SBYTE3(v23[0]) < 0)
      operator delete(*(void **)buf);
    v9 = &v11;
    if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v9 = (std::string *)v11.__r_.__value_.__r.__words[0];
    *(_DWORD *)v13 = 68289282;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Daemon shutdown requested\", \"requester\":%{public, location:escape_only}s}", v13, 0x1Cu);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
  sub_10187E568((unsigned int *)qword_102314138, 1);
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  os_activity_scope_leave(&state);

}

- (void)displayStatisticsWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  std::string *v9;
  uint64_t v10;
  _OWORD v11[2];
  std::string v12;
  os_activity_scope_state_s state;
  uint8_t v14[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  std::string *v19;
  uint8_t buf[8];
  __int16 v21;
  const char *v22;
  __int16 v23;
  _QWORD v24[3];
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *__p;
  char v35;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonDisplayStatistics (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonDisplayStatistics\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  }
  v8 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(v11, 0, sizeof(v11));
    sub_1001AE4D0((uint64_t)v11, (uint64_t)buf);
    sub_1001A8444((uint64_t)buf, &v12);
    if (v35 < 0)
      operator delete(__p);
    if (v33 < 0)
      operator delete(v32);
    if (v31 < 0)
      operator delete(v30);
    if (v29 < 0)
      operator delete(v28);
    if (v27 < 0)
      operator delete(v26);
    if (v25 < 0)
      operator delete(*(void **)((char *)v24 + 4));
    if (SBYTE3(v24[0]) < 0)
      operator delete(*(void **)buf);
    v9 = &v12;
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v9 = (std::string *)v12.__r_.__value_.__r.__words[0];
    *(_DWORD *)v14 = 68289282;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Daemon stats requested\", \"requester\":%{public, location:escape_only}s}", v14, 0x1Cu);
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v12.__r_.__value_.__l.__data_);
  }
  v10 = sub_10073C788();
  sub_10073CE88(v10);
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  os_activity_scope_leave(&state);

}

- (void)dumpLogsWithDescription:(id)a3 replyBlock:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  std::string *v11;
  const __CFString *v12;
  __CFNotificationCenter *LocalCenter;
  uint64_t v14;
  std::string *v15;
  const __CFString *v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  os_activity_scope_state_s state;
  std::string v24[7];
  std::string v25;
  int v26;
  std::string *v27;
  __int16 v28;
  const __CFString *v29;
  uint8_t buf[8];
  __int16 v31;
  const char *v32;
  __int16 v33;
  _BYTE v34[12];
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *__p;
  char v45;

  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonDumpLogs (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v31 = 2082;
    v32 = "";
    v33 = 2082;
    *(_QWORD *)v34 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonDumpLogs\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  }
  v10 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
    }
    sub_1001AE4D0((uint64_t)&v21, (uint64_t)buf);
    sub_1001A8444((uint64_t)buf, v24);
    if (v45 < 0)
      operator delete(__p);
    if (v43 < 0)
      operator delete(v42);
    if (v41 < 0)
      operator delete(v40);
    if (v39 < 0)
      operator delete(v38);
    if (v37 < 0)
      operator delete(v36);
    if (v35 < 0)
      operator delete(*(void **)&v34[4]);
    if ((v34[3] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    v11 = v24;
    if ((v24[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v11 = (std::string *)v24[0].__r_.__value_.__r.__words[0];
    v12 = &stru_1021D8FB8;
    if (a3)
      v12 = (const __CFString *)a3;
    LODWORD(v25.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v25.__r_.__value_.__r.__words + 4) = (std::string::size_type)v11;
    WORD2(v25.__r_.__value_.__r.__words[1]) = 2112;
    *(std::string::size_type *)((char *)&v25.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, Log dump requested by %s: %@", (uint8_t *)&v25, 0x16u);
    if (SHIBYTE(v24[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24[0].__r_.__value_.__l.__data_);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (self)
    {
      -[CLInternalService currentToken](self, "currentToken");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
    }
    sub_1001AE4D0((uint64_t)&v19, (uint64_t)v24);
    sub_1001A8444((uint64_t)v24, &v25);
    sub_100010174((uint64_t)v24);
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = &v25;
    else
      v15 = (std::string *)v25.__r_.__value_.__r.__words[0];
    v16 = &stru_1021D8FB8;
    if (a3)
      v16 = (const __CFString *)a3;
    v26 = 136315394;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 0, "#Spi, Log dump requested by %s: %@", &v26, 22, v19, v20, v21, v22);
    v18 = v17;
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService dumpLogsWithDescription:replyBlock:]", "%s\n", v18);
    if (v18 != (char *)buf)
      free(v18);
  }
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("com.apple.locationd.DumpDiagnostics"), 0, 0, 1u);
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  os_activity_scope_leave(&state);

}

- (void)copyLastLogWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  std::string *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _OWORD v13[2];
  std::string v14;
  os_activity_scope_state_s state;
  uint8_t v16[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  std::string *v21;
  uint8_t buf[8];
  __int16 v23;
  const char *v24;
  __int16 v25;
  _QWORD v26[3];
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *__p;
  char v37;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonCopyLastLog (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v23 = 2082;
    v24 = "";
    v25 = 2082;
    v26[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonCopyLastLog\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  }
  v8 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(v13, 0, sizeof(v13));
    sub_1001AE4D0((uint64_t)v13, (uint64_t)buf);
    sub_1001A8444((uint64_t)buf, &v14);
    if (v37 < 0)
      operator delete(__p);
    if (v35 < 0)
      operator delete(v34);
    if (v33 < 0)
      operator delete(v32);
    if (v31 < 0)
      operator delete(v30);
    if (v29 < 0)
      operator delete(v28);
    if (v27 < 0)
      operator delete(*(void **)((char *)v26 + 4));
    if (SBYTE3(v26[0]) < 0)
      operator delete(*(void **)buf);
    v9 = &v14;
    if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v9 = (std::string *)v14.__r_.__value_.__r.__words[0];
    *(_DWORD *)v16 = 68289282;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2082;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, requested to copy locationd's last logs to crash reporter\", \"requester\":%{public, location:escape_only}s}", v16, 0x1Cu);
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
  }
  v10 = sub_1001BFFCC();
  if (sub_10122587C(v10) && (v11 = sub_1011B78D4(), sub_10122587C(v11)))
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
  else
  {
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a3 + 2))(a3, v12);

  }
  os_activity_scope_leave(&state);

}

- (void)checkAndExerciseAuthorizationForBundleID:(id)a3 orBundlePath:(id)a4 services:(unint64_t)a5 replyBlock:(id)a6
{
  NSObject *v11;
  NSObject *v12;
  audit_token_t *v13;
  id v14;
  void *p_p;
  NSString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void **v22;
  NSObject *v23;
  void **v24;
  const char *v25;
  void **v26;
  id v27;
  void *__dst[2];
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42[2];
  char v43;
  os_activity_scope_state_s v44[2];
  os_activity_scope_state_s state;
  void *__p;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void **v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  id v54;
  _BYTE buf[32];
  __int128 v56;
  void *v57[2];
  void *v58[2];
  _BYTE v59[24];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63[4];

  v27 = objc_alloc_init((Class)NSAutoreleasePool);
  v11 = _os_activity_create((void *)&_mh_execute_header, "CL: checkAndExerciseAuthorizationForBundleID:orBundlePath:services:replyBlock:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v12 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"checkAndExerciseAuthorizationForBundleID:orBundlePath:services:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  *(_OWORD *)v58 = 0u;
  memset(v59, 0, 19);
  v56 = 0u;
  *(_OWORD *)v57 = 0u;
  memset(buf, 0, sizeof(buf));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  memset(v63, 0, 27);
  if (!+[CLInternalService getEffectiveClientName:bundlePath:name:](CLInternalService, "getEffectiveClientName:bundlePath:name:", a3, a4, buf))
  {
    v14 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id, _QWORD))a6 + 2))(a6, v14, 0);

    goto LABEL_59;
  }
  if (self)
    -[CLInternalService currentToken](self, "currentToken");
  else
    memset(v44, 0, sizeof(v44));
  CLConnection::getUserNameFromAuditToken(&__p, (CLConnection *)v44, v13);
  sub_1001AE664((std::string *)buf, (const std::string *)&__p);
  if (SBYTE3(v50) < 0)
    operator delete(__p);
  sub_1001A885C((uint64_t)buf, (uint64_t)&__p);
  if (SBYTE3(v50) >= 0)
    p_p = &__p;
  else
    p_p = __p;
  v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p);
  if (SBYTE3(v50) < 0)
    operator delete(__p);
  v17 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientAuthorizationCache"));
  v18 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLInternalService"));
  v19 = objc_msgSend(v17, "syncgetAuthorizationContextIfClientIsNonZonal:", v16);
  v20 = objc_msgSend(v19, "isNonProvisionallyAuthorizedForServiceTypeMask:", a5);
  if ((v20 & 1) != 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D69F0);
    v21 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      sub_1001A885C((uint64_t)buf, (uint64_t)v42);
      v22 = v43 >= 0 ? v42 : (void **)v42[0];
      __p = (void *)68289282;
      v47 = 2082;
      v48 = "";
      v49 = 2082;
      v50 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"markReceivingLocationInformation\", \"Client\":%{public, location:escape_only}s}", (uint8_t *)&__p, 0x1Cu);
      if (v43 < 0)
        operator delete(v42[0]);
    }
    sub_1001AF190((char *)__dst, (__int128 *)buf);
    objc_msgSend(v18, "markReceivingLocationInformation:", sub_1001AE728((__int128 *)__dst));
    if (v41 < 0)
      operator delete(v40);
    if (v39 < 0)
      operator delete(v38);
    if (v37 < 0)
      operator delete(v36);
    if (v35 < 0)
      operator delete(v34);
    if (v33 < 0)
      operator delete(v32);
    if (v31 < 0)
      operator delete(v30);
    if (v29 < 0)
      operator delete(__dst[0]);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v23 = qword_1022A01C8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_58;
    sub_1001A885C((uint64_t)buf, (uint64_t)v42);
    if (v43 >= 0)
      v24 = v42;
    else
      v24 = (void **)v42[0];
    __p = (void *)68289794;
    v47 = 2082;
    v48 = "";
    v49 = 2082;
    v50 = v24;
    v51 = 2050;
    v52 = a5;
    v53 = 2114;
    v54 = v19;
    v25 = "{\"msg%{public}.0s\":\"checkAndExerciseAuthorization response is YES\", \"client\":%{public, location:escape_o"
          "nly}s, \"requiredServices\":%{public}ld, \"authContext\":%{public, location:escape_only}@}";
  }
  else
  {
    if (objc_msgSend(v19, "isAuthorizedForServiceTypeMask:", a5))
      objc_msgSend(v18, "handleProvisionalIntermediationForService:forClientKey:at:withReply:", 10, v16, 0, &stru_1021D6888);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v23 = qword_1022A01C8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_58;
    sub_1001A885C((uint64_t)buf, (uint64_t)v42);
    if (v43 >= 0)
      v26 = v42;
    else
      v26 = (void **)v42[0];
    __p = (void *)68289794;
    v47 = 2082;
    v48 = "";
    v49 = 2082;
    v50 = v26;
    v51 = 2050;
    v52 = a5;
    v53 = 2114;
    v54 = v19;
    v25 = "{\"msg%{public}.0s\":\"checkAndExerciseAuthorization response is NO\", \"client\":%{public, location:escape_on"
          "ly}s, \"requiredServices\":%{public}ld, \"authContext\":%{public, location:escape_only}@}";
  }
  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&__p, 0x30u);
  if (v43 < 0)
    operator delete(v42[0]);
LABEL_58:
  (*((void (**)(id, _QWORD, id))a6 + 2))(a6, 0, v20);
LABEL_59:
  if (SHIBYTE(v63[2]) < 0)
    operator delete(v63[0]);
  if (SHIBYTE(v62) < 0)
    operator delete(*((void **)&v61 + 1));
  if (SBYTE7(v61) < 0)
    operator delete((void *)v60);
  if ((v59[15] & 0x80000000) != 0)
    operator delete(v58[1]);
  if (SHIBYTE(v58[0]) < 0)
    operator delete(v57[0]);
  if (SHIBYTE(v56) < 0)
    operator delete(*(void **)&buf[24]);
  if ((buf[23] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  os_activity_scope_leave(&state);

}

- (void)getLocationForBundleID:(id)a3 orBundlePath:(id)a4 dynamicAccuracyReductionEnabled:(BOOL)a5 allowsAlteredAccessoryLocations:(BOOL)a6 replyBlock:(id)a7
{
  NSObject *v11;
  NSObject *v12;
  unsigned int v13;
  audit_token_t *v14;
  id v15;
  id v16;
  uint8_t *v17;
  id v18;
  id v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  NSObject *v34;
  void **v35;
  NSObject *v36;
  uint8_t *v37;
  NSObject *v38;
  uint8_t *v39;
  id v40;
  id v41;
  id v42;
  std::__shared_weak_count *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  unint64_t v46;
  int v47;
  char v48;
  id v49;
  void *__dst[2];
  char v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  void *v56;
  char v57;
  void *v58;
  char v59;
  void *v60;
  char v61;
  void *v62;
  char v63;
  void *__p[2];
  char v65;
  _QWORD v66[6];
  _OWORD v67[8];
  _OWORD v68[2];
  _QWORD v69[6];
  void *v70;
  char v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  void *v76;
  char v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v82;
  char v83;
  _OWORD v84[2];
  void *v85[2];
  void *v86[2];
  __int128 v87;
  void *v88[2];
  void *v89[2];
  _BYTE v90[24];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  void *v94[5];
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  __n128 (*v98)(uint64_t, uint64_t);
  uint64_t (*v99)();
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[28];
  os_activity_scope_state_s state;
  uint8_t v111[8];
  __int16 v112;
  const char *v113;
  __int16 v114;
  _BYTE v115[14];
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  unsigned int v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  uint64_t v127;
  uint8_t buf[8];
  __int16 v129;
  const char *v130;
  __int16 v131;
  _BYTE v132[20];
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  std::__shared_weak_count *v136;

  v46 = __PAIR64__(a6, a5);
  v49 = objc_alloc_init((Class)NSAutoreleasePool);
  v11 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetLocation (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v11, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v12 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v129 = 2082;
    v130 = "";
    v131 = 2082;
    *(_QWORD *)v132 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetLocation\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v95 = 0;
  v96 = &v95;
  v97 = 0xD012000000;
  v98 = sub_1002075B0;
  v99 = nullsub_62;
  v100 = &unk_102080316;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  memset(v109, 0, sizeof(v109));
  v13 = -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v46), "processIdentifier");
  *(_OWORD *)v89 = 0u;
  memset(v90, 0, 19);
  v87 = 0u;
  *(_OWORD *)v88 = 0u;
  *(_OWORD *)v85 = 0u;
  *(_OWORD *)v86 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  memset(v94, 0, 27);
  if (!+[CLInternalService getEffectiveClientName:bundlePath:name:](CLInternalService, "getEffectiveClientName:bundlePath:name:", a3, a4, v85))
  {
    v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id, _QWORD))a7 + 2))(a7, v15, 0);

    goto LABEL_71;
  }
  if (self)
    -[CLInternalService currentToken](self, "currentToken");
  else
    memset(v84, 0, sizeof(v84));
  CLConnection::getUserNameFromAuditToken(buf, (CLConnection *)v84, v14);
  sub_1001AE664((std::string *)v85, (const std::string *)buf);
  if ((v132[3] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  v16 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientAuthorizationCache"));
  sub_1001A885C((uint64_t)v85, (uint64_t)buf);
  if (v132[3] >= 0)
    v17 = buf;
  else
    v17 = *(uint8_t **)buf;
  v18 = objc_msgSend(v16, "syncgetAuthorizationContextIfClientIsNonZonal:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
  if ((v132[3] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  v19 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
  objc_msgSend(v19, "registerDelegate:inSilo:", +[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate"), +[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo"));
  if (v18)
  {
    if ((objc_msgSend(v18, "isNonProvisionallyAuthorizedForServiceType:", 4) & 1) != 0)
    {
      if ((objc_msgSend(v18, "isNonProvisionallyAuthorizedForServiceType:", 12) & 1) != 0)
      {
        v20 = objc_msgSend(-[CLInternalService vendor](self, "vendor", sub_10012A33C(buf).n128_f64[0]), "proxyForService:", CFSTR("CLLocationController"));
        v21 = objc_msgSend(v20, "syncgetLocation:", v96 + 6);
        v22 = objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLLocationController")), "syncgetLocationPrivate:", buf);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v23 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v111 = 68291075;
          *(_DWORD *)&v111[4] = 0;
          v112 = 2082;
          v113 = "";
          v114 = 1040;
          *(_DWORD *)v115 = 156;
          *(_WORD *)&v115[4] = 2097;
          *(_QWORD *)&v115[6] = v96 + 6;
          v116 = 2049;
          v117 = *(_QWORD *)&v132[4];
          v118 = 2049;
          v119 = *(_QWORD *)&v132[12];
          v120 = 1025;
          v121 = v21;
          v122 = 2049;
          v123 = v133;
          v124 = 2049;
          v125 = v134;
          v126 = 2049;
          v127 = v135;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, altered getLocation\", \"location\":%{private, location:CLClientLocation}.*P, \"timestampGps\":\"%{private}f\", \"machTime\":\"%{private}f\", \"gotLocation\":%{private}hhd, \"specialCoordinateLat\":\"%{private}f\", \"specialCoordinateLon\":\"%{private}f\", \"specialHorizontalAccuracy\":\"%{private}f\"}", v111, 0x5Au);
        }
        if ((v21 & 1) != 0
          && ((v48 & 1) != 0
           || !sub_10145D170((uint64_t)(v96 + 6))
           || v22 && sub_10145D188((uint64_t)(v96 + 6), (uint64_t)buf)))
        {
          if (v47)
          {
            v24 = dispatch_group_create();
            dispatch_group_enter(v24);
            v25 = objc_alloc((Class)CLLocation);
            v26 = *((_OWORD *)v96 + 5);
            v27 = *((_OWORD *)v96 + 8);
            v28 = *((_OWORD *)v96 + 9);
            *(_OWORD *)((char *)v68 + 12) = *(_OWORD *)((char *)v96 + 188);
            v29 = *((_OWORD *)v96 + 10);
            v30 = *((_OWORD *)v96 + 11);
            v67[6] = v28;
            v67[7] = v29;
            v68[0] = v30;
            v31 = *((_OWORD *)v96 + 6);
            v32 = *((_OWORD *)v96 + 7);
            v67[2] = v26;
            v67[3] = v31;
            v67[4] = v32;
            v67[5] = v27;
            v33 = *((_OWORD *)v96 + 4);
            v67[0] = *((_OWORD *)v96 + 3);
            v67[1] = v33;
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472;
            v66[2] = sub_1018A25D4;
            v66[3] = &unk_1021738A0;
            v66[4] = v24;
            v66[5] = &v95;
            objc_msgSend(v19, "reduceAccuracy:withReply:", objc_msgSend(v25, "initWithClientLocation:", v67), v66);
            dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
            dispatch_release(v24);
          }
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_1021D69F0);
          v34 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
          {
            sub_1001A885C((uint64_t)v85, (uint64_t)__p);
            v35 = v65 >= 0 ? __p : (void **)__p[0];
            *(_DWORD *)v111 = 68289282;
            *(_DWORD *)&v111[4] = 0;
            v112 = 2082;
            v113 = "";
            v114 = 2082;
            *(_QWORD *)v115 = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"markReceivingLocationInformation\", \"Client\":%{public, location:escape_only}s}", v111, 0x1Cu);
            if (v65 < 0)
              operator delete(__p[0]);
          }
          sub_1001AF190((char *)__dst, (__int128 *)v85);
          objc_msgSend(v19, "markReceivingLocationInformation:", sub_1001AE728((__int128 *)__dst));
          if (v63 < 0)
            operator delete(v62);
          if (v61 < 0)
            operator delete(v60);
          if (v59 < 0)
            operator delete(v58);
          if (v57 < 0)
            operator delete(v56);
          if (v55 < 0)
            operator delete(v54);
          if (v53 < 0)
            operator delete(v52);
          if (v51 < 0)
            operator delete(__dst[0]);
          (*((void (**)(id, _QWORD, NSData *))a7 + 2))(a7, 0, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v96 + 6, 156));
        }
        else
        {
          v42 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
          (*((void (**)(id, id, _QWORD))a7 + 2))(a7, v42, 0);

        }
        v43 = v136;
        if (v136)
        {
          p_shared_owners = (unint64_t *)&v136->__shared_owners_;
          do
            v45 = __ldaxr(p_shared_owners);
          while (__stlxr(v45 - 1, p_shared_owners));
          if (!v45)
          {
            ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
            std::__shared_weak_count::__release_weak(v43);
          }
        }
      }
      else
      {
        v41 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLCorrectiveCompensatedLocationProvider"), CFSTR("CLInternalService"));
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3321888768;
        v69[2] = sub_1018A22AC;
        v69[3] = &unk_1021D68B0;
        sub_1001AF190((char *)&v70, (__int128 *)v85);
        v69[4] = v19;
        v69[5] = a7;
        objc_msgSend(v41, "fetchLocationWithReply:", v69);
        if (v83 < 0)
          operator delete(v82);
        if (v81 < 0)
          operator delete(v80);
        if (v79 < 0)
          operator delete(v78);
        if (v77 < 0)
          operator delete(v76);
        if (v75 < 0)
          operator delete(v74);
        if (v73 < 0)
          operator delete(v72);
        if (v71 < 0)
          operator delete(v70);
      }
      goto LABEL_71;
    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v36 = qword_1022A01C8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_64;
    sub_1001A8444((uint64_t)v85, (std::string *)v111);
    if (v115[3] >= 0)
      v37 = v111;
    else
      v37 = *(uint8_t **)v111;
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&buf[4] = 0;
    v129 = 2082;
    v130 = "";
    v131 = 2082;
    *(_QWORD *)v132 = v37;
    *(_WORD *)&v132[8] = 1026;
    *(_DWORD *)&v132[10] = v13;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #Spi, GetLocation rejected for entity: no way to establish effective authorization\", \"name\":%{public, location:escape_only}s, \"pid\":%{public}d}", buf, 0x22u);
    if ((v115[3] & 0x80000000) != 0)
      operator delete(*(void **)v111);
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
LABEL_64:
  v38 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    sub_1001A8444((uint64_t)v85, (std::string *)v111);
    v39 = v115[3] >= 0 ? v111 : *(uint8_t **)v111;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v129 = 2082;
    v130 = "";
    v131 = 2082;
    *(_QWORD *)v132 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, GetLocation rejected for entity: insufficient effective authorization\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if ((v115[3] & 0x80000000) != 0)
      operator delete(*(void **)v111);
  }
  v40 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
  (*((void (**)(id, id, _QWORD))a7 + 2))(a7, v40, 0);

LABEL_71:
  if (SHIBYTE(v94[2]) < 0)
    operator delete(v94[0]);
  if (SHIBYTE(v93) < 0)
    operator delete(*((void **)&v92 + 1));
  if (SBYTE7(v92) < 0)
    operator delete((void *)v91);
  if ((v90[15] & 0x80000000) != 0)
    operator delete(v89[1]);
  if (SHIBYTE(v89[0]) < 0)
    operator delete(v88[0]);
  if (SHIBYTE(v87) < 0)
    operator delete(v86[1]);
  if (SHIBYTE(v86[0]) < 0)
    operator delete(v85[0]);
  _Block_object_dispose(&v95, 8);
  os_activity_scope_leave(&state);

}

- (void)getGroundAltitudeForBundleID:(id)a3 orBundlePath:(id)a4 location:(id)a5 replyBlock:(id)a6
{
  id v11;
  NSObject *v12;
  NSObject *v13;
  audit_token_t *v14;
  id v15;
  _BYTE *v16;
  NSString *v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v32;
  id v33;
  std::__shared_weak_count *v34;
  unint64_t *p_shared_owners;
  unint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[2];
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[6];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  __n128 (*v63)(uint64_t, uint64_t);
  uint64_t (*v64)();
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[28];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  _OWORD v84[2];
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  void *v88[2];
  void *v89[2];
  __int128 v90;
  void *v91[2];
  void *v92[2];
  _BYTE v93[24];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  void *__p[5];
  os_activity_scope_state_s state;
  _BYTE buf[96];
  __int128 v100;
  __int128 v101;
  _BYTE v102[28];
  _BYTE v103[528];
  std::__shared_weak_count *v104;

  v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetGroundAltitude (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v13 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetGroundAltitude\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  *(_OWORD *)v92 = 0u;
  memset(v93, 0, 19);
  v90 = 0u;
  *(_OWORD *)v91 = 0u;
  *(_OWORD *)v88 = 0u;
  *(_OWORD *)v89 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  memset(__p, 0, 27);
  if (+[CLInternalService getEffectiveClientName:bundlePath:name:](CLInternalService, "getEffectiveClientName:bundlePath:name:", a3, a4, v88))
  {
    if (self)
      -[CLInternalService currentToken](self, "currentToken");
    else
      memset(v84, 0, sizeof(v84));
    CLConnection::getUserNameFromAuditToken(buf, (CLConnection *)v84, v14);
    sub_1001AE664((std::string *)v88, (const std::string *)buf);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    sub_1001A885C((uint64_t)v88, (uint64_t)buf);
    if (buf[23] >= 0)
      v16 = buf;
    else
      v16 = *(_BYTE **)buf;
    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    v18 = objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientAuthorizationCache")), "syncgetAuthorizationContextIfClientIsNonZonal:", v17);
    if ((objc_msgSend(v18, "isNonProvisionallyAuthorizedForServiceType:", 10) & 1) != 0)
    {
      v75 = 0;
      v76 = &v75;
      v77 = 0x3052000000;
      v78 = sub_1018A2EC0;
      v79 = sub_1018A2ED0;
      v80 = 0;
      v60 = 0;
      v61 = &v60;
      v62 = 0xD012000000;
      v63 = sub_1002075B0;
      v64 = nullsub_62;
      v65 = &unk_102080316;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      memset(v74, 0, sizeof(v74));
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1018A2EDC;
      v59[3] = &unk_1021D6908;
      v59[4] = &v75;
      v59[5] = &v60;
      -[CLInternalService getLocationForBundleID:orBundlePath:dynamicAccuracyReductionEnabled:allowsAlteredAccessoryLocations:replyBlock:](self, "getLocationForBundleID:orBundlePath:dynamicAccuracyReductionEnabled:allowsAlteredAccessoryLocations:replyBlock:", a3, a4, 0, 0, v59);
      if (v76[5])
      {
        v19 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
        v56 = xmmword_101BAFEE0;
        v57 = 0;
        v58 = 0xFFFFFFFFLL;
        (*((void (**)(id, id, __int128 *))a6 + 2))(a6, v19, &v56);

      }
      else
      {
        v21 = *(double *)((char *)v61 + 52);
        v22 = *(double *)((char *)v61 + 60);
        objc_msgSend(a5, "coordinate");
        v24 = v23;
        objc_msgSend(a5, "coordinate");
        if (sub_100124100(v21, v22, v24, v25) <= self->_groundAltitudeDistanceThreshold)
        {
          *(_QWORD *)&buf[12] = 0;
          *(_QWORD *)&buf[4] = 0;
          *(_OWORD *)&buf[20] = xmmword_101BAFC90;
          __asm { FMOV            V0.2D, #-1.0 }
          *(_OWORD *)&buf[36] = _Q0;
          *(_OWORD *)&buf[52] = _Q0;
          *(_OWORD *)&buf[68] = _Q0;
          *(_DWORD *)buf = 0xFFFF;
          *(_DWORD *)&buf[84] = 0;
          *(_QWORD *)&buf[88] = 0xBFF0000000000000;
          v100 = 0uLL;
          *(_QWORD *)((char *)&v101 + 4) = 0xBFF0000000000000;
          LODWORD(v101) = 0;
          HIDWORD(v101) = 0x7FFFFFFF;
          memset(v102, 0, 25);
          *(_QWORD *)&v32 = sub_10012A33C(v103).n128_u64[0];
          if (a5)
          {
            objc_msgSend(a5, "clientLocation", v32);
          }
          else
          {
            v51 = 0u;
            memset(v52, 0, 28);
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v44 = 0u;
          }
          v100 = v50;
          v101 = v51;
          *(_OWORD *)v102 = v52[0];
          *(_OWORD *)&v102[12] = *(_OWORD *)((char *)v52 + 12);
          *(_OWORD *)&buf[32] = v46;
          *(_OWORD *)&buf[48] = v47;
          *(_OWORD *)&buf[64] = v48;
          *(_OWORD *)&buf[80] = v49;
          *(_OWORD *)buf = v44;
          *(_OWORD *)&buf[16] = v45;
          v43 = 0;
          *(_QWORD *)&v44 = 0;
          if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLDigitalElevationModel")), "syncgetAltitude:rel:undulation:", buf, &v43, &v44))
          {
            v40 = *(_OWORD *)&v103[376];
            v41 = v44;
            v42 = 2;
            (*((void (**)(id, _QWORD, __int128 *))a6 + 2))(a6, 0, &v40);
          }
          else
          {
            v33 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
            v37 = xmmword_101BAFEE0;
            v38 = 0;
            v39 = 0xFFFFFFFFLL;
            (*((void (**)(id, id, __int128 *))a6 + 2))(a6, v33, &v37);

          }
          v34 = v104;
          if (v104)
          {
            p_shared_owners = (unint64_t *)&v104->__shared_owners_;
            do
              v36 = __ldaxr(p_shared_owners);
            while (__stlxr(v36 - 1, p_shared_owners));
            if (!v36)
            {
              ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
              std::__shared_weak_count::__release_weak(v34);
            }
          }
        }
        else
        {
          v26 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
          v53 = xmmword_101BAFEE0;
          v54 = 0;
          v55 = 0xFFFFFFFFLL;
          (*((void (**)(id, id, __int128 *))a6 + 2))(a6, v26, &v53);

        }
      }
      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v75, 8);
    }
    else
    {
      if (objc_msgSend(v18, "isAuthorizedForServiceType:", 10))
        objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLInternalService")), "handleProvisionalIntermediationForService:forClientKey:at:withReply:", 10, v17, 0, &stru_1021D68E0);
      v20 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 3, 0);
      v81 = xmmword_101BAFEE0;
      v82 = 0;
      v83 = 0xFFFFFFFFLL;
      (*((void (**)(id, id, __int128 *))a6 + 2))(a6, v20, &v81);

    }
  }
  else
  {
    v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    v85 = xmmword_101BAFEE0;
    v86 = 0;
    v87 = 0xFFFFFFFFLL;
    (*((void (**)(id, id, __int128 *))a6 + 2))(a6, v15, &v85);

  }
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v96) < 0)
    operator delete(*((void **)&v95 + 1));
  if (SBYTE7(v95) < 0)
    operator delete((void *)v94);
  if ((v93[15] & 0x80000000) != 0)
    operator delete(v92[1]);
  if (SHIBYTE(v92[0]) < 0)
    operator delete(v91[0]);
  if (SHIBYTE(v90) < 0)
    operator delete(v89[1]);
  if (SHIBYTE(v89[0]) < 0)
    operator delete(v88[0]);
  os_activity_scope_leave(&state);

}

- (void)getStatusBarIconState:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  const char *v18;
  uint8_t *v19;
  os_activity_scope_state_s state;
  _DWORD v21[4];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetStatusBarIconState (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2082;
    v27 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetStatusBarIconState\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.status"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLStatusBarIconManager")), "syncgetIconState");
    if (v11 >= 3)
    {
      v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v15 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v23 = (int)v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Unexpected iconState: %d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v21[0] = 67109120;
        v21[1] = (_DWORD)v11;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 2, "Unexpected iconState: %d", v21);
        v19 = (uint8_t *)v18;
        sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getStatusBarIconState:]", "%s\n", v18);
        if (v19 != buf)
          free(v19);
      }
      v11 = 0;
    }
    else
    {
      v12 = 0;
    }
    (*((void (**)(id, id, id))a3 + 2))(a3, v12, v11);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v13 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v21[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v21, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getStatusBarIconState:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    v14 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v14, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)setStatusBarIconEnabledForEntityClass:(unsigned int)a3 enabled:(BOOL)a4 replyBlock:(id)a5
{
  _BOOL8 v6;
  uint64_t v7;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  std::string *v18;
  const char *v19;
  uint8_t *v20;
  _OWORD v21[2];
  std::string v22;
  os_activity_scope_state_s state;
  uint8_t v24[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  std::string *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  uint8_t buf[8];
  __int16 v35;
  const char *v36;
  __int16 v37;
  _BYTE v38[12];
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  void *__p;
  char v49;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetStatusBarIconEnabledForEntityClass (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v35 = 2082;
    v36 = "";
    v37 = 2082;
    *(_QWORD *)v38 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetStatusBarIconEnabledForEntityClass\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v13 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v13
    && (v14 = objc_opt_class(NSNumber, v12), (objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    && (objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v15 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v21, 0, sizeof(v21));
      sub_1001AE4D0((uint64_t)v21, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, &v22);
      if (v49 < 0)
        operator delete(__p);
      if (v47 < 0)
        operator delete(v46);
      if (v45 < 0)
        operator delete(v44);
      if (v43 < 0)
        operator delete(v42);
      if (v41 < 0)
        operator delete(v40);
      if (v39 < 0)
        operator delete(*(void **)&v38[4]);
      if ((v38[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v18 = &v22;
      if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v18 = (std::string *)v22.__r_.__value_.__r.__words[0];
      *(_DWORD *)v24 = 68289794;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = v18;
      v30 = 1026;
      v31 = v7;
      v32 = 1026;
      v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, setting the status bar icon enabled state\", \"name\":%{public, location:escape_only}s, \"entityClass\":%{public}u, \"enabled\":%{public}hhd}", v24, 0x28u);
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v22.__r_.__value_.__l.__data_);
    }
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLStatusBarIconManager")), "setStatusBarIconForEntityClass:visible:", v7, v6);
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v16 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v24 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v24, 2);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setStatusBarIconEnabledForEntityClass:enabled:replyBlock:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
    v17 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a5 + 2))(a5, v17);

  }
  os_activity_scope_leave(&state);

}

- (void)getStatusBarIconEnabledForEntityClass:(unsigned int)a3 replyBlock:(id)a4
{
  uint64_t v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  std::string *v16;
  const char *v17;
  uint8_t *v18;
  _OWORD v19[2];
  std::string v20;
  os_activity_scope_state_s state;
  uint8_t v22[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  std::string *v27;
  __int16 v28;
  int v29;
  uint8_t buf[8];
  __int16 v31;
  const char *v32;
  __int16 v33;
  _BYTE v34[12];
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *__p;
  char v45;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetStatusBarIconEnabledForEntityClass (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v31 = 2082;
    v32 = "";
    v33 = 2082;
    *(_QWORD *)v34 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetStatusBarIconEnabledForEntityClass\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v11 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v11
    && (v12 = objc_opt_class(NSNumber, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v13 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
    {
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v19, 0, sizeof(v19));
      sub_1001AE4D0((uint64_t)v19, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, &v20);
      if (v45 < 0)
        operator delete(__p);
      if (v43 < 0)
        operator delete(v42);
      if (v41 < 0)
        operator delete(v40);
      if (v39 < 0)
        operator delete(v38);
      if (v37 < 0)
        operator delete(v36);
      if (v35 < 0)
        operator delete(*(void **)&v34[4]);
      if ((v34[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v16 = &v20;
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v16 = (std::string *)v20.__r_.__value_.__r.__words[0];
      *(_DWORD *)v22 = 68289538;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2082;
      v27 = v16;
      v28 = 1026;
      v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Retrieved the status bar icon enabled state\", \"name\":%{public, location:escape_only}s, \"entityClass\":%{public}u}", v22, 0x22u);
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v20.__r_.__value_.__l.__data_);
    }
    (*((void (**)(id, _QWORD, id))a4 + 2))(a4, 0, objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLStatusBarIconManager")), "syncgetStatusBarIconForEntityClass:", v5));
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v22 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v22, 2);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getStatusBarIconEnabledForEntityClass:replyBlock:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a4 + 2))(a4, v15, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)setMapMatchingRouteHint:(id)a3 routingType:(int)a4 stepType:(int)a5 replyBlock:(id)a6
{
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  _OWORD *v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  char *v33;
  __int128 v34;
  __int128 v35;
  char *v36;
  void (**v37)(id, _QWORD);
  unsigned int v38;
  unsigned int v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  std::string *v43;
  uint64_t v44;
  const char *v45;
  uint8_t *v46;
  uint64_t v47;
  std::string *v48;
  char *v49;
  char *v50;
  void (**v51)(id, _QWORD);
  unint64_t v52;
  id v53;
  int v54;
  int v55;
  _OWORD v56[2];
  std::string v57;
  _OWORD v58[2];
  void *__p;
  _OWORD *v60;
  char *v61;
  os_activity_scope_state_s state;
  std::string v63;
  __int16 v64;
  std::string *v65;
  uint8_t buf[8];
  __int16 v67;
  const char *v68;
  __int16 v69;
  _BYTE v70[12];
  char v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  void *v76;
  char v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  uint8_t v82[4];
  unint64_t v83;
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;
  __int16 v88;
  std::string *v89;

  v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetMapMatchingRouteHint (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v13 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v67 = 2082;
    v68 = "";
    v69 = 2082;
    *(_QWORD *)v70 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetMapMatchingRouteHint\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v15 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.route_hint"));
  if (v15
    && (v16 = objc_opt_class(NSNumber, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
  {
    v53 = v11;
    v17 = (char *)objc_msgSend(a3, "bytes");
    v51 = (void (**)(id, _QWORD))a6;
    v54 = a4;
    v55 = a5;
    v18 = (unint64_t)objc_msgSend(a3, "length");
    v52 = v18 / 0x28;
    __p = 0;
    v60 = 0;
    v61 = 0;
    if (v18 >= 0x28)
    {
      v19 = 0;
      v20 = 0;
      if (v52 <= 1)
        v21 = 1;
      else
        v21 = v18 / 0x28;
      do
      {
        v22 = &v17[40 * v20];
        if (v19 >= (_OWORD *)v61)
        {
          v25 = __p;
          v26 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v19 - (_BYTE *)__p) >> 3);
          v27 = v26 + 1;
          if (v26 + 1 > 0x666666666666666)
            sub_100259694();
          if (0x999999999999999ALL * ((v61 - (_BYTE *)__p) >> 3) > v27)
            v27 = 0x999999999999999ALL * ((v61 - (_BYTE *)__p) >> 3);
          if (0xCCCCCCCCCCCCCCCDLL * ((v61 - (_BYTE *)__p) >> 3) >= 0x333333333333333)
            v28 = 0x666666666666666;
          else
            v28 = v27;
          if (v28)
          {
            v29 = (char *)sub_100357184((uint64_t)&v61, v28);
            v25 = __p;
            v19 = v60;
          }
          else
          {
            v29 = 0;
          }
          v30 = &v29[40 * v26];
          v31 = *(_OWORD *)v22;
          v32 = *((_OWORD *)v22 + 1);
          *((_QWORD *)v30 + 4) = *((_QWORD *)v22 + 4);
          *(_OWORD *)v30 = v31;
          *((_OWORD *)v30 + 1) = v32;
          if (v19 == v25)
          {
            v36 = &v29[40 * v26];
          }
          else
          {
            v33 = &v29[40 * v26];
            do
            {
              v34 = *(_OWORD *)((char *)v19 - 40);
              v35 = *(_OWORD *)((char *)v19 - 24);
              v36 = v33 - 40;
              *((_QWORD *)v33 - 1) = *((_QWORD *)v19 - 1);
              *(_OWORD *)(v33 - 24) = v35;
              *(_OWORD *)(v33 - 40) = v34;
              v19 = (_OWORD *)((char *)v19 - 40);
              v33 -= 40;
            }
            while (v19 != v25);
          }
          v19 = v30 + 40;
          __p = v36;
          v60 = v30 + 40;
          v61 = &v29[40 * v28];
          if (v25)
            operator delete(v25);
        }
        else
        {
          v23 = *(_OWORD *)v22;
          v24 = *((_OWORD *)v22 + 1);
          *((_QWORD *)v19 + 4) = *((_QWORD *)v22 + 4);
          *v19 = v23;
          v19[1] = v24;
          v19 = (_OWORD *)((char *)v19 + 40);
        }
        v60 = v19;
        ++v20;
      }
      while (v20 != v21);
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v11 = v53;
    v37 = (void (**)(id, _QWORD))a6;
    v39 = v54;
    v38 = v55;
    v40 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
    {
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v58, 0, sizeof(v58));
      sub_1001AE4D0((uint64_t)v58, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, &v63);
      if (v81 < 0)
        operator delete(v80);
      if (v79 < 0)
        operator delete(v78);
      if (v77 < 0)
        operator delete(v76);
      if (v75 < 0)
        operator delete(v74);
      if (v73 < 0)
        operator delete(v72);
      if (v71 < 0)
        operator delete(*(void **)&v70[4]);
      if ((v70[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v43 = &v63;
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v43 = (std::string *)v63.__r_.__value_.__r.__words[0];
      *(_DWORD *)v82 = 134349826;
      v83 = v52;
      v84 = 1026;
      v85 = v54;
      v86 = 1026;
      v87 = v55;
      v88 = 2082;
      v89 = v43;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "#Spi,RouteHints,setMapMatchingRouteHint,received,%{public}lu,routeType,%{public}d,stepType,%{public}d,source,%{public}s", v82, 0x22u);
      if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v63.__r_.__value_.__l.__data_);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v47 = qword_1022A01C8;
      if (self)
        -[CLInternalService currentToken](self, "currentToken");
      else
        memset(v56, 0, sizeof(v56));
      sub_1001AE4D0((uint64_t)v56, (uint64_t)v82);
      sub_1001A8444((uint64_t)v82, &v57);
      sub_100010174((uint64_t)v82);
      if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v48 = &v57;
      else
        v48 = (std::string *)v57.__r_.__value_.__r.__words[0];
      LODWORD(v63.__r_.__value_.__l.__data_) = 134349826;
      *(std::string::size_type *)((char *)v63.__r_.__value_.__r.__words + 4) = v52;
      WORD2(v63.__r_.__value_.__r.__words[1]) = 1026;
      *(_DWORD *)((char *)&v63.__r_.__value_.__r.__words[1] + 6) = v54;
      WORD1(v63.__r_.__value_.__r.__words[2]) = 1026;
      HIDWORD(v63.__r_.__value_.__r.__words[2]) = v55;
      v64 = 2082;
      v65 = v48;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v47, 2, "#Spi,RouteHints,setMapMatchingRouteHint,received,%{public}lu,routeType,%{public}d,stepType,%{public}d,source,%{public}s", &v63, 34);
      v50 = v49;
      if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v57.__r_.__value_.__l.__data_);
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setMapMatchingRouteHint:routingType:stepType:replyBlock:]", "%s\n", v50);
      if (v50 != (char *)buf)
        free(v50);
      v11 = v53;
      v37 = v51;
      v39 = v54;
      v38 = v55;
    }
    v44 = sub_10022B068();
    sub_1008BBA34(v44, v39, v38, (uint64_t)&__p);
    v37[2](v37, 0);
    if (__p)
    {
      v60 = __p;
      operator delete(__p);
    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v41 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      *(_WORD *)v82 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v82, 2);
      v46 = (uint8_t *)v45;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setMapMatchingRouteHint:routingType:stepType:replyBlock:]", "%s\n", v45);
      if (v46 != buf)
        free(v46);
    }
    v42 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v42);

  }
  os_activity_scope_leave(&state);

}

- (void)setTrackRunHint:(id)a3 replyBlock:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  std::string *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  std::string *v20;
  char *v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  os_activity_scope_state_s state;
  std::string v28[8];
  std::string v29;
  int v30;
  std::string *v31;
  uint8_t buf[8];
  __int16 v33;
  const char *v34;
  __int16 v35;
  _BYTE v36[12];
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *__p;
  char v47;

  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetTrackRunHint (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v33 = 2082;
    v34 = "";
    v35 = 2082;
    *(_QWORD *)v36 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetTrackRunHint\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v11 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.grassland"));
  if (v11
    && (v12 = objc_opt_class(NSNumber, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    if (qword_10229FC50 != -1)
      dispatch_once(&qword_10229FC50, &stru_1021D6A30);
    v13 = qword_10229FC58;
    if (os_log_type_enabled((os_log_t)qword_10229FC58, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else
      {
        v25 = 0u;
        v26 = 0u;
      }
      sub_1001AE4D0((uint64_t)&v25, (uint64_t)buf);
      sub_1001A8444((uint64_t)buf, v28);
      if (v47 < 0)
        operator delete(__p);
      if (v45 < 0)
        operator delete(v44);
      if (v43 < 0)
        operator delete(v42);
      if (v41 < 0)
        operator delete(v40);
      if (v39 < 0)
        operator delete(v38);
      if (v37 < 0)
        operator delete(*(void **)&v36[4]);
      if ((v36[3] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v16 = v28;
      if ((v28[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v16 = (std::string *)v28[0].__r_.__value_.__r.__words[0];
      LODWORD(v29.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)v29.__r_.__value_.__r.__words + 4) = (std::string::size_type)v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Spi,CLTR,Daemon,setTrackRunHint,received,source,%{public}s", (uint8_t *)&v29, 0xCu);
      if (SHIBYTE(v28[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(v28[0].__r_.__value_.__l.__data_);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC50 != -1)
        dispatch_once(&qword_10229FC50, &stru_1021D6A30);
      v19 = qword_10229FC58;
      if (self)
      {
        -[CLInternalService currentToken](self, "currentToken");
      }
      else
      {
        v23 = 0u;
        v24 = 0u;
      }
      sub_1001AE4D0((uint64_t)&v23, (uint64_t)v28);
      sub_1001A8444((uint64_t)v28, &v29);
      sub_100010174((uint64_t)v28);
      if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v20 = &v29;
      else
        v20 = (std::string *)v29.__r_.__value_.__r.__words[0];
      v30 = 136446210;
      v31 = v20;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 0, "#Spi,CLTR,Daemon,setTrackRunHint,received,source,%{public}s", &v30, 12, v23, v24, v25, v26);
      v22 = v21;
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v29.__r_.__value_.__l.__data_);
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setTrackRunHint:replyBlock:]", "%s\n", v22);
      if (v22 != (char *)buf)
        free(v22);
    }
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLLocationController")), "setTrackRunHint:", a3);
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v28[0].__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v28, 2);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setTrackRunHint:replyBlock:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a4 + 2))(a4, v15);

  }
  os_activity_scope_leave(&state);

}

- (void)getAccessoryTypeBitSetWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  _QWORD v16[5];
  _WORD v17[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: getAccessoryTypeBitSetWithReplyBlock (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"getAccessoryTypeBitSetWithReplyBlock\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.accessory_location"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLAccessoryLocationProvider"));
    objc_msgSend(v11, "registerDelegate:inSilo:", +[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate"), +[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1018A4FF8;
    v16[3] = &unk_1021907F0;
    v16[4] = a3;
    objc_msgSend(v11, "fetchAccessoryBitSetWithReply:", v16);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v17[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v17, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getAccessoryTypeBitSetWithReplyBlock:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v13, 0xFFFFFFFFLL);

  }
  os_activity_scope_leave(&state);

}

- (void)getAccessoryPASCDTransmissionStateWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  _QWORD v16[5];
  _WORD v17[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: getAccessoryPASCDTransmissionStateWithReplyBlock (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"getAccessoryPASCDTransmissionStateWithReplyBlock\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.accessory_location"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLAccessoryLocationProvider"));
    objc_msgSend(v11, "registerDelegate:inSilo:", +[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate"), +[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1018A53C8;
    v16[3] = &unk_1021907F0;
    v16[4] = a3;
    objc_msgSend(v11, "fetchAccessoryPASCDTransmissionStateWithReply:", v16);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v17[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v17, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getAccessoryPASCDTransmissionStateWithReplyBlock:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v13, 4);

  }
  os_activity_scope_leave(&state);

}

- (void)getOdometryBatchedLocationsWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  _QWORD v16[5];
  _WORD v17[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: getOdometryBatchedLocationsWithReplyBlock (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"getOdometryBatchedLocationsWithReplyBlock\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.batched_location"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLGnssProvider"));
    objc_msgSend(v11, "registerDelegate:inSilo:", +[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate"), +[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1018A5798;
    v16[3] = &unk_1021D6868;
    v16[4] = a3;
    objc_msgSend(v11, "fetchOdometryBatchedLocationsWithReply:", v16);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v17[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v17, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getOdometryBatchedLocationsWithReplyBlock:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v13, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)getPipelinedCacheWithReply:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  NSFileManager *v11;
  NSObject *v12;
  group *v13;
  passwd *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSArray *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  unsigned int v36;
  unsigned int v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  uint8_t *v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  const char *v45;
  uint8_t *v46;
  const char *v47;
  id v48;
  void (**v49)(id, _QWORD, NSArray *);
  NSObject *v50;
  dispatch_time_t v51;
  NSObject *v52;
  const char *v53;
  uint8_t *v54;
  const char *v55;
  uint8_t *v56;
  const char *v57;
  uint8_t *v58;
  const char *v59;
  uint8_t *v60;
  const char *v61;
  uint8_t *v62;
  const char *v63;
  uint8_t *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  uint8_t *v68;
  const char *v69;
  uint8_t *v70;
  uint64_t v71;
  CLInternalService *v72;
  void (**v73)(id, _QWORD, NSArray *);
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  uid_t pw_uid;
  gid_t gr_gid;
  _QWORD block[6];
  char v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  os_activity_scope_state_s state;
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];
  int v95;
  id v96;
  __int16 v97;
  uint64_t v98;
  uint8_t buf[4];
  _BYTE v100[24];

  v77 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemongetPipelinedCache (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v6 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)v100 = 0;
    *(_WORD *)&v100[4] = 2082;
    *(_QWORD *)&v100[6] = "";
    *(_WORD *)&v100[14] = 2082;
    *(_QWORD *)&v100[16] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemongetPipelinedCache\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.pipelined_diagnostic"));
  if (!v8
    || (v9 = objc_opt_class(NSNumber, v7), (objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    || (objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v18 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v95) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v95, 2);
      v54 = (uint8_t *)v53;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v53);
      if (v54 != buf)
        free(v54);
    }
    v19 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, NSArray *))a3 + 2))(a3, v19, +[NSArray array](NSArray, "array"));

    goto LABEL_44;
  }
  v10 = objc_msgSend(CFSTR("/var/mobile/Library/Logs/pipelined"), "stringByAppendingPathComponent:", CFSTR("/tiles"));
  v11 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (qword_1023100B0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply cancelling previous delete due to new request", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v95) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 1, "getPipelinedCacheWithReply cancelling previous delete due to new request", &v95, 2);
      v56 = (uint8_t *)v55;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v55);
      if (v56 != buf)
        free(v56);
    }
    dispatch_block_cancel((dispatch_block_t)qword_1023100B0);
    _Block_release((const void *)qword_1023100B0);
    qword_1023100B0 = 0;
  }
  v13 = getgrnam("_analyticsusers");
  v14 = getpwnam("root");
  if (!v13 || !v14)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v20 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to find root uid and _analyticsusers gid", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v95) = 0;
      LODWORD(v71) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "getPipelinedCacheWithReply FAILED to find root uid and _analyticsusers gid", &v95, v71);
      v58 = (uint8_t *)v57;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v57);
      if (v58 != buf)
        free(v58);
    }
    v21 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id, void *))a3 + 2))(a3, v21, &__NSArray0__struct);

    goto LABEL_44;
  }
  pw_uid = v14->pw_uid;
  gr_gid = v13->gr_gid;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](v11, "fileExistsAtPath:isDirectory:", v10, 0))
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v15 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply destination root path exists, deleting directory now...", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v95) = 0;
      LODWORD(v71) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 1, "getPipelinedCacheWithReply destination root path exists, deleting directory now...", &v95, v71);
      v60 = (uint8_t *)v59;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v59);
      if (v60 != buf)
        free(v60);
    }
    v90 = 0;
    if (!-[NSFileManager removeItemAtPath:error:](v11, "removeItemAtPath:error:", v10, &v90))
    {
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v23 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v100 = v10;
        *(_WORD *)&v100[8] = 2112;
        *(_QWORD *)&v100[10] = v90;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply removal of %@ FAILED with error %@", buf, 0x16u);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_62;
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v95 = 138412546;
      v96 = v10;
      v97 = 2112;
      v98 = v90;
      LODWORD(v71) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "getPipelinedCacheWithReply removal of %@ FAILED with error %@", &v95, v71);
      v64 = (uint8_t *)v66;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v66);
      if (v64 == buf)
        goto LABEL_62;
LABEL_164:
      free(v64);
LABEL_62:
      v24 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, void *))a3 + 2))(a3, v24, &__NSArray0__struct);

      goto LABEL_44;
    }
  }
  v90 = 0;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v90))
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v22 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v100 = v10;
      *(_WORD *)&v100[8] = 2112;
      *(_QWORD *)&v100[10] = v90;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to create destination root path %@ with error %@", buf, 0x16u);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_62;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v95 = 138412546;
    v96 = v10;
    v97 = 2112;
    v98 = v90;
    LODWORD(v71) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "getPipelinedCacheWithReply FAILED to create destination root path %@ with error %@", &v95, v71);
    v64 = (uint8_t *)v63;
    sub_100512490("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v63);
    if (v64 == buf)
      goto LABEL_62;
    goto LABEL_164;
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v16 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v100 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply created destination root path %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v95 = 138412290;
    v96 = v10;
    LODWORD(v71) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 1, "getPipelinedCacheWithReply created destination root path %@", &v95, v71);
    v62 = (uint8_t *)v61;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v61);
    if (v62 != buf)
      free(v62);
  }
  if (chown((const char *)objc_msgSend(v10, "UTF8String"), pw_uid, gr_gid)
    || chmod((const char *)objc_msgSend(v10, "UTF8String"), 0x1E8u))
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v17 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v100 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_62;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v95 = 138412290;
    v96 = v10;
    LODWORD(v71) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible", &v95, v71);
    v64 = (uint8_t *)v65;
    sub_100512490("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v65);
    if (v64 == buf)
      goto LABEL_62;
    goto LABEL_164;
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v25 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v100 = v10;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v95 = 138412290;
    v96 = v10;
    LODWORD(v71) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 1, "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible", &v95, v71);
    v68 = (uint8_t *)v67;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v67);
    if (v68 != buf)
      free(v68);
  }
  v72 = self;
  v73 = (void (**)(id, _QWORD, NSArray *))a3;
  v88 = 0u;
  v89 = 0u;
  v87 = 0u;
  v86 = 0u;
  v26 = objc_msgSend(&off_102220BB8, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
  if (v26)
  {
    v74 = *(_QWORD *)v87;
    do
    {
      v27 = 0;
      v75 = v26;
      do
      {
        if (*(_QWORD *)v87 != v74)
          objc_enumerationMutation(&off_102220BB8);
        v76 = v27;
        v28 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v27);
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v29 = -[NSFileManager subpathsAtPath:](v11, "subpathsAtPath:", v28);
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v83;
          do
          {
            v32 = 0;
            do
            {
              if (*(_QWORD *)v83 != v31)
                objc_enumerationMutation(v29);
              v33 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v32);
              v34 = objc_msgSend(v28, "stringByAppendingPathComponent:", v33);
              v35 = objc_msgSend(v10, "stringByAppendingPathComponent:", objc_msgSend(v33, "lastPathComponent"));
              v81 = 0;
              v36 = -[NSFileManager fileExistsAtPath:isDirectory:](v11, "fileExistsAtPath:isDirectory:", v34, &v81);
              if (v81)
                v37 = 0;
              else
                v37 = v36;
              if (v37 == 1)
              {
                if (sub_100512FFC((const char *)objc_msgSend(v34, "UTF8String"), (const char *)objc_msgSend(v35, "UTF8String")))
                {
                  if (qword_1022A01C0 != -1)
                    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
                  v38 = qword_1022A01C8;
                  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v100 = v34;
                    *(_WORD *)&v100[8] = 2112;
                    *(_QWORD *)&v100[10] = v35;
                    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply successfully copied %@ to %@", buf, 0x16u);
                  }
                  if (sub_1001BFF7C(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1022A01C0 != -1)
                      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
                    v95 = 138412546;
                    v96 = v34;
                    v97 = 2112;
                    v98 = (uint64_t)v35;
                    LODWORD(v71) = 22;
                    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 1, "getPipelinedCacheWithReply successfully copied %@ to %@", &v95, v71);
                    v46 = (uint8_t *)v45;
                    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v45);
                    if (v46 != buf)
                      free(v46);
                  }
                  if (chown((const char *)objc_msgSend(v35, "UTF8String"), pw_uid, gr_gid))
                  {
                    if (qword_1022A01C0 != -1)
                      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
                    v39 = qword_1022A01C8;
                    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v100 = v35;
                      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible", buf, 0xCu);
                    }
                    if (sub_1001BFF7C(115, 0))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_1022A01C0 != -1)
                        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
                      v95 = 138412290;
                      v96 = v35;
                      LODWORD(v71) = 12;
                      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible", &v95, v71);
                      v41 = (uint8_t *)v40;
                      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v40);
LABEL_119:
                      if (v41 != buf)
                        free(v41);
                    }
                  }
                  else
                  {
                    if (qword_1022A01C0 != -1)
                      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
                    v44 = qword_1022A01C8;
                    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v100 = v35;
                      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible", buf, 0xCu);
                    }
                    if (sub_1001BFF7C(115, 2))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_1022A01C0 != -1)
                        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
                      v95 = 138412290;
                      v96 = v35;
                      LODWORD(v71) = 12;
                      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 1, "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible", &v95, v71);
                      v41 = (uint8_t *)v47;
                      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v47);
                      goto LABEL_119;
                    }
                  }
                }
                else
                {
                  if (qword_1022A01C0 != -1)
                    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
                  v42 = qword_1022A01C8;
                  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v100 = v34;
                    *(_WORD *)&v100[8] = 2112;
                    *(_QWORD *)&v100[10] = v35;
                    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to copy %@ to %@. Check PROTECTION CLASS of the file and device protection state.", buf, 0x16u);
                  }
                  if (sub_1001BFF7C(115, 0))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1022A01C0 != -1)
                      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
                    v95 = 138412546;
                    v96 = v34;
                    v97 = 2112;
                    v98 = (uint64_t)v35;
                    LODWORD(v71) = 22;
                    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "getPipelinedCacheWithReply FAILED to copy %@ to %@. Check PROTECTION CLASS of the file and device protection state.", &v95, v71);
                    v41 = (uint8_t *)v43;
                    sub_100512490("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v43);
                    goto LABEL_119;
                  }
                }
              }
              v32 = (char *)v32 + 1;
            }
            while (v30 != v32);
            v48 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
            v30 = v48;
          }
          while (v48);
        }
        v27 = v76 + 1;
      }
      while ((id)(v76 + 1) != v75);
      v26 = objc_msgSend(&off_102220BB8, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    }
    while (v26);
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v49 = v73;
  v50 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v100 = v10;
    *(_WORD *)&v100[8] = 2048;
    *(_QWORD *)&v100[10] = 3600;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply deleting %@ in %llu seconds", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v95 = 138412546;
    v96 = v10;
    v97 = 2048;
    v98 = 3600;
    LODWORD(v71) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 1, "getPipelinedCacheWithReply deleting %@ in %llu seconds", &v95, v71);
    v70 = (uint8_t *)v69;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v69);
    if (v70 != buf)
      free(v70);
    v49 = v73;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1018A7340;
  block[3] = &unk_10212BB30;
  block[4] = v11;
  block[5] = v10;
  qword_1023100B0 = (uint64_t)dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v51 = dispatch_time(0, 3600000000000);
  v52 = objc_msgSend(-[CLInternalService silo](v72, "silo"), "queue");
  dispatch_after(v51, v52, (dispatch_block_t)qword_1023100B0);
  v92 = v10;
  v49[2](v49, 0, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v92, 1));
LABEL_44:
  os_activity_scope_leave(&state);

}

- (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 orAuditToken:(id *)a6 byLocationButton:(BOOL)a7 voiceInteractionEnabled:(BOOL)a8 replyBlock:(id)a9
{
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  audit_token_t *v19;
  char v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  audit_token_t *v25;
  char v26;
  id v27;
  std::string *v28;
  NSString *v29;
  __int128 v30;
  const char *v31;
  std::string *v32;
  const char *v33;
  std::string *v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _OWORD v38[2];
  _OWORD v39[2];
  _OWORD v40[2];
  std::string __str;
  std::string v42;
  std::string v43;
  __int128 v44;
  void *v45;
  __int128 v46;
  void *v47;
  __int16 v48;
  char v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int16 v56;
  char v57;
  os_activity_scope_state_s state;
  std::string buf[2];
  void *v60[2];
  void *v61[5];
  __int128 v62;
  _OWORD v63[95];

  v36 = a8;
  v37 = a7;
  v35 = a3;
  v13 = objc_alloc_init((Class)NSAutoreleasePool);
  v14 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetAuthorizationStatusByType (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v14, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v15 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetAuthorizationStatusByType\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v17 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v17)
  {
    v18 = objc_opt_class(NSNumber, v16);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0 && (objc_msgSend(v17, "BOOLValue") & 1) != 0)
    {
      if (!objc_msgSend(a4, "length") && !objc_msgSend(a5, "length") && !v37)
      {
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v23 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
        {
          LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path if setting temporary authorization not by LocationButton", (uint8_t *)buf, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
          LOWORD(v42.__r_.__value_.__l.__data_) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi, Must provide a bundle identifier or bundle path if setting temporary authorization not by LocationButton", &v42, 2);
          v34 = (std::string *)v33;
          sub_100512490("Generic", 1, 0, 0, "-[CLInternalService setTemporaryAuthorizationGranted:forBundleID:orBundlePath:orAuditToken:byLocationButton:voiceInteractionEnabled:replyBlock:]", "%s\n", v33);
          if (v34 != buf)
            free(v34);
        }
        v24 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
        (*((void (**)(id, id))a9 + 2))(a9, v24);

        goto LABEL_46;
      }
      memset(v61, 0, 35);
      *(_OWORD *)v60 = 0u;
      memset(buf, 0, sizeof(buf));
      v62 = 0u;
      memset(v63, 0, 59);
      if (objc_msgSend(a4, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a4, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)&v42);
        if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf[0].__r_.__value_.__l.__data_);
        buf[0] = v42;
        *((_BYTE *)&v42.__r_.__value_.__s + 23) = 0;
        v42.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf[1].__r_.__value_.__l.__data_);
        buf[1] = v43;
        *((_BYTE *)&v43.__r_.__value_.__s + 23) = 0;
        v43.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(v61[0]) < 0)
          operator delete(v60[0]);
        *(_OWORD *)v60 = v44;
        v61[0] = v45;
        HIBYTE(v45) = 0;
        LOBYTE(v44) = 0;
        if (SHIBYTE(v61[3]) < 0)
          operator delete(v61[1]);
        *(_OWORD *)&v61[1] = v46;
        v61[3] = v47;
        HIBYTE(v47) = 0;
        LOBYTE(v46) = 0;
        LOWORD(v61[4]) = v48;
        BYTE2(v61[4]) = v49;
        if (SBYTE7(v63[0]) < 0)
          operator delete((void *)v62);
        v62 = v50;
        *(_QWORD *)&v63[0] = v51;
        HIBYTE(v51) = 0;
        LOBYTE(v50) = 0;
        if (SHIBYTE(v63[1]) < 0)
          operator delete(*((void **)&v63[0] + 1));
        v20 = 0;
        *(_OWORD *)((char *)v63 + 8) = v52;
        *((_QWORD *)&v63[1] + 1) = v53;
        HIBYTE(v53) = 0;
        LOBYTE(v52) = 0;
        if (SBYTE7(v63[3]) < 0)
        {
          operator delete(*(void **)&v63[2]);
          v20 = HIBYTE(v53);
        }
        v63[2] = v54;
        *(_QWORD *)&v63[3] = v55;
        HIBYTE(v55) = 0;
        LOBYTE(v54) = 0;
        WORD4(v63[3]) = v56;
        BYTE10(v63[3]) = v57;
        if (v20 < 0)
          operator delete((void *)v52);
        if (SHIBYTE(v51) < 0)
          operator delete((void *)v50);
        if (SHIBYTE(v47) < 0)
          operator delete((void *)v46);
        if (SHIBYTE(v45) < 0)
          operator delete((void *)v44);
        if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v43.__r_.__value_.__l.__data_);
        if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v42.__r_.__value_.__l.__data_);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
        if (self)
          -[CLInternalService currentToken](self, "currentToken");
        else
          memset(v40, 0, sizeof(v40));
        CLConnection::getUserNameFromAuditToken(&v42, (CLConnection *)v40, v19);
        sub_1001AE664(buf, &v42);
      }
      else
      {
        if (!objc_msgSend(a5, "length"))
        {
          sub_1001AE4D0((uint64_t)a6, (uint64_t)&v42);
          sub_1001AEF2C((uint64_t)buf, (__int128 *)&v42);
          sub_100010174((uint64_t)&v42);
LABEL_93:
          v27 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
          sub_1001A885C((uint64_t)buf, (uint64_t)&v42);
          if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v28 = &v42;
          else
            v28 = (std::string *)v42.__r_.__value_.__r.__words[0];
          v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v28);
          v30 = *(_OWORD *)&a6->var0[4];
          v38[0] = *(_OWORD *)a6->var0;
          v38[1] = v30;
          objc_msgSend(v27, "markClientTemporaryAuthorizationGranted:forClientKey:andAuditToken:byLocationButton:voiceInteractionEnabled:", v35, v29, v38, v37, v36);
          if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v42.__r_.__value_.__l.__data_);
          (*((void (**)(id, _QWORD))a9 + 2))(a9, 0);
          if (SBYTE7(v63[3]) < 0)
            operator delete(*(void **)&v63[2]);
          if (SHIBYTE(v63[1]) < 0)
            operator delete(*((void **)&v63[0] + 1));
          if (SBYTE7(v63[0]) < 0)
            operator delete((void *)v62);
          if (SHIBYTE(v61[3]) < 0)
            operator delete(v61[1]);
          if (SHIBYTE(v61[0]) < 0)
            operator delete(v60[0]);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_46;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a5, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)&v42);
        if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf[0].__r_.__value_.__l.__data_);
        buf[0] = v42;
        *((_BYTE *)&v42.__r_.__value_.__s + 23) = 0;
        v42.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf[1].__r_.__value_.__l.__data_);
        buf[1] = v43;
        *((_BYTE *)&v43.__r_.__value_.__s + 23) = 0;
        v43.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(v61[0]) < 0)
          operator delete(v60[0]);
        *(_OWORD *)v60 = v44;
        v61[0] = v45;
        HIBYTE(v45) = 0;
        LOBYTE(v44) = 0;
        if (SHIBYTE(v61[3]) < 0)
          operator delete(v61[1]);
        *(_OWORD *)&v61[1] = v46;
        v61[3] = v47;
        HIBYTE(v47) = 0;
        LOBYTE(v46) = 0;
        LOWORD(v61[4]) = v48;
        BYTE2(v61[4]) = v49;
        if (SBYTE7(v63[0]) < 0)
          operator delete((void *)v62);
        v62 = v50;
        *(_QWORD *)&v63[0] = v51;
        HIBYTE(v51) = 0;
        LOBYTE(v50) = 0;
        if (SHIBYTE(v63[1]) < 0)
          operator delete(*((void **)&v63[0] + 1));
        v26 = 0;
        *(_OWORD *)((char *)v63 + 8) = v52;
        *((_QWORD *)&v63[1] + 1) = v53;
        HIBYTE(v53) = 0;
        LOBYTE(v52) = 0;
        if (SBYTE7(v63[3]) < 0)
        {
          operator delete(*(void **)&v63[2]);
          v26 = HIBYTE(v53);
        }
        v63[2] = v54;
        *(_QWORD *)&v63[3] = v55;
        HIBYTE(v55) = 0;
        LOBYTE(v54) = 0;
        WORD4(v63[3]) = v56;
        BYTE10(v63[3]) = v57;
        if (v26 < 0)
          operator delete((void *)v52);
        if (SHIBYTE(v51) < 0)
          operator delete((void *)v50);
        if (SHIBYTE(v47) < 0)
          operator delete((void *)v46);
        if (SHIBYTE(v45) < 0)
          operator delete((void *)v44);
        if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v43.__r_.__value_.__l.__data_);
        if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v42.__r_.__value_.__l.__data_);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
        if (self)
          -[CLInternalService currentToken](self, "currentToken");
        else
          memset(v39, 0, sizeof(v39));
        CLConnection::getUserNameFromAuditToken(&v42, (CLConnection *)v39, v25);
        sub_1001AE664(buf, &v42);
      }
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v42.__r_.__value_.__l.__data_);
      goto LABEL_93;
    }
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v21 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    LOWORD(v42.__r_.__value_.__l.__data_) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v42, 2);
    v32 = (std::string *)v31;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setTemporaryAuthorizationGranted:forBundleID:orBundlePath:orAuditToken:byLocationButton:voiceInteractionEnabled:replyBlock:]", "%s\n", v31);
    if (v32 != buf)
      free(v32);
  }
  v22 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
  (*((void (**)(id, id))a9 + 2))(a9, v22);

LABEL_46:
  os_activity_scope_leave(&state);

}

- (void)setTemporaryPreciseAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  _BOOL8 v9;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  audit_token_t *v17;
  NSObject *v18;
  id v19;
  char v20;
  id v21;
  std::string *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  std::string *v26;
  const char *v27;
  std::string *v28;
  _OWORD v29[2];
  std::string __str;
  std::string v31;
  std::string v32;
  __int128 v33;
  void *v34;
  __int128 v35;
  void *v36;
  __int16 v37;
  char v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int16 v45;
  char v46;
  os_activity_scope_state_s state;
  std::string buf[2];
  void *v49[2];
  void *v50[5];
  __int128 v51;
  _OWORD v52[95];

  v9 = a3;
  v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetTemporaryPreciseAuthorization (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v13 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetTemporaryPreciseAuthorization\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v15 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v15
    && (v16 = objc_opt_class(NSNumber, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a4, "length") || objc_msgSend(a5, "length"))
    {
      memset(v50, 0, 35);
      *(_OWORD *)v49 = 0u;
      memset(buf, 0, sizeof(buf));
      v51 = 0u;
      memset(v52, 0, 59);
      if (objc_msgSend(a4, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a4, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)&v31);
      }
      else
      {
        if (!objc_msgSend(a5, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v29, 0, sizeof(v29));
          CLConnection::getUserNameFromAuditToken(&v31, (CLConnection *)v29, v17);
          sub_1001AE664(buf, &v31);
          if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v31.__r_.__value_.__l.__data_);
          v21 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
          sub_1001A885C((uint64_t)buf, (uint64_t)&v31);
          if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v22 = &v31;
          else
            v22 = (std::string *)v31.__r_.__value_.__r.__words[0];
          objc_msgSend(v21, "markTemporaryPreciseAuthorizationGranted:forClientKey:", v9, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22));
          if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v31.__r_.__value_.__l.__data_);
          (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
          if (SBYTE7(v52[3]) < 0)
            operator delete(*(void **)&v52[2]);
          if (SHIBYTE(v52[1]) < 0)
            operator delete(*((void **)&v52[0] + 1));
          if (SBYTE7(v52[0]) < 0)
            operator delete((void *)v51);
          if (SHIBYTE(v50[3]) < 0)
            operator delete(v50[1]);
          if (SHIBYTE(v50[0]) < 0)
            operator delete(v49[0]);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_18;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a5, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)&v31);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = v31;
      *((_BYTE *)&v31.__r_.__value_.__s + 23) = 0;
      v31.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = v32;
      *((_BYTE *)&v32.__r_.__value_.__s + 23) = 0;
      v32.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v50[0]) < 0)
        operator delete(v49[0]);
      *(_OWORD *)v49 = v33;
      v50[0] = v34;
      HIBYTE(v34) = 0;
      LOBYTE(v33) = 0;
      if (SHIBYTE(v50[3]) < 0)
        operator delete(v50[1]);
      *(_OWORD *)&v50[1] = v35;
      v50[3] = v36;
      HIBYTE(v36) = 0;
      LOBYTE(v35) = 0;
      LOWORD(v50[4]) = v37;
      BYTE2(v50[4]) = v38;
      if (SBYTE7(v52[0]) < 0)
        operator delete((void *)v51);
      v51 = v39;
      *(_QWORD *)&v52[0] = v40;
      HIBYTE(v40) = 0;
      LOBYTE(v39) = 0;
      if (SHIBYTE(v52[1]) < 0)
        operator delete(*((void **)&v52[0] + 1));
      v20 = 0;
      *(_OWORD *)((char *)v52 + 8) = v41;
      *((_QWORD *)&v52[1] + 1) = v42;
      HIBYTE(v42) = 0;
      LOBYTE(v41) = 0;
      if (SBYTE7(v52[3]) < 0)
      {
        operator delete(*(void **)&v52[2]);
        v20 = HIBYTE(v42);
      }
      v52[2] = v43;
      *(_QWORD *)&v52[3] = v44;
      HIBYTE(v44) = 0;
      LOBYTE(v43) = 0;
      WORD4(v52[3]) = v45;
      BYTE10(v52[3]) = v46;
      if (v20 < 0)
        operator delete((void *)v41);
      if (SHIBYTE(v40) < 0)
        operator delete((void *)v39);
      if (SHIBYTE(v36) < 0)
        operator delete((void *)v35);
      if (SHIBYTE(v34) < 0)
        operator delete((void *)v33);
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v32.__r_.__value_.__l.__data_);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v31.__r_.__value_.__l.__data_);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v23 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path if setting temporary precise authorization", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v31.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi, Must provide a bundle identifier or bundle path if setting temporary precise authorization", &v31, 2);
      v28 = (std::string *)v27;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService setTemporaryPreciseAuthorizationGranted:forBundleID:orBundlePath:replyBlock:]", "%s\n", v27);
      if (v28 != buf)
        free(v28);
    }
    v24 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v24);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v18 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v31.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v31, 2);
      v26 = (std::string *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setTemporaryPreciseAuthorizationGranted:forBundleID:orBundlePath:replyBlock:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    v19 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v19);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)tearDownLocationAuthPromptForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  audit_token_t *v15;
  NSObject *v16;
  id v17;
  char v18;
  id v19;
  std::string *v20;
  NSObject *v21;
  id v22;
  const char *v23;
  std::string *v24;
  const char *v25;
  std::string *v26;
  _OWORD v27[2];
  std::string __str;
  std::string v29;
  std::string v30;
  __int128 v31;
  void *v32;
  __int128 v33;
  void *v34;
  __int16 v35;
  char v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int16 v43;
  char v44;
  os_activity_scope_state_s state;
  std::string buf[2];
  void *v47[2];
  void *v48[5];
  __int128 v49;
  _OWORD v50[95];

  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonTearDownLocationAuthPrompt (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonTearDownLocationAuthPrompt\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v13 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v13
    && (v14 = objc_opt_class(NSNumber, v12), (objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    && (objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a3, "length") || objc_msgSend(a4, "length"))
    {
      memset(v48, 0, 35);
      *(_OWORD *)v47 = 0u;
      memset(buf, 0, sizeof(buf));
      v49 = 0u;
      memset(v50, 0, 59);
      if (objc_msgSend(a3, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a3, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)&v29);
      }
      else
      {
        if (!objc_msgSend(a4, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v27, 0, sizeof(v27));
          CLConnection::getUserNameFromAuditToken(&v29, (CLConnection *)v27, v15);
          sub_1001AE664(buf, &v29);
          if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v29.__r_.__value_.__l.__data_);
          v19 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
          sub_1001A885C((uint64_t)buf, (uint64_t)&v29);
          if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v20 = &v29;
          else
            v20 = (std::string *)v29.__r_.__value_.__r.__words[0];
          objc_msgSend(v19, "tearDownLocationAuthPrompt:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20));
          if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v29.__r_.__value_.__l.__data_);
          (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
          if (SBYTE7(v50[3]) < 0)
            operator delete(*(void **)&v50[2]);
          if (SHIBYTE(v50[1]) < 0)
            operator delete(*((void **)&v50[0] + 1));
          if (SBYTE7(v50[0]) < 0)
            operator delete((void *)v49);
          if (SHIBYTE(v48[3]) < 0)
            operator delete(v48[1]);
          if (SHIBYTE(v48[0]) < 0)
            operator delete(v47[0]);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_18;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a4, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)&v29);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = v29;
      *((_BYTE *)&v29.__r_.__value_.__s + 23) = 0;
      v29.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = v30;
      *((_BYTE *)&v30.__r_.__value_.__s + 23) = 0;
      v30.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v48[0]) < 0)
        operator delete(v47[0]);
      *(_OWORD *)v47 = v31;
      v48[0] = v32;
      HIBYTE(v32) = 0;
      LOBYTE(v31) = 0;
      if (SHIBYTE(v48[3]) < 0)
        operator delete(v48[1]);
      *(_OWORD *)&v48[1] = v33;
      v48[3] = v34;
      HIBYTE(v34) = 0;
      LOBYTE(v33) = 0;
      LOWORD(v48[4]) = v35;
      BYTE2(v48[4]) = v36;
      if (SBYTE7(v50[0]) < 0)
        operator delete((void *)v49);
      v49 = v37;
      *(_QWORD *)&v50[0] = v38;
      HIBYTE(v38) = 0;
      LOBYTE(v37) = 0;
      if (SHIBYTE(v50[1]) < 0)
        operator delete(*((void **)&v50[0] + 1));
      v18 = 0;
      *(_OWORD *)((char *)v50 + 8) = v39;
      *((_QWORD *)&v50[1] + 1) = v40;
      HIBYTE(v40) = 0;
      LOBYTE(v39) = 0;
      if (SBYTE7(v50[3]) < 0)
      {
        operator delete(*(void **)&v50[2]);
        v18 = HIBYTE(v40);
      }
      v50[2] = v41;
      *(_QWORD *)&v50[3] = v42;
      HIBYTE(v42) = 0;
      LOBYTE(v41) = 0;
      WORD4(v50[3]) = v43;
      BYTE10(v50[3]) = v44;
      if (v18 < 0)
        operator delete((void *)v39);
      if (SHIBYTE(v38) < 0)
        operator delete((void *)v37);
      if (SHIBYTE(v34) < 0)
        operator delete((void *)v33);
      if (SHIBYTE(v32) < 0)
        operator delete((void *)v31);
      if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v30.__r_.__value_.__l.__data_);
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v29.__r_.__value_.__l.__data_);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v21 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path if tearing down location auth prompt", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v29.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi, Must provide a bundle identifier or bundle path if tearing down location auth prompt", &v29, 2);
      v26 = (std::string *)v25;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService tearDownLocationAuthPromptForBundleID:orBundlePath:replyBlock:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    v22 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a5 + 2))(a5, v22);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v16 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v29.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v29, 2);
      v24 = (std::string *)v23;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService tearDownLocationAuthPromptForBundleID:orBundlePath:replyBlock:]", "%s\n", v23);
      if (v24 != buf)
        free(v24);
    }
    v17 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a5 + 2))(a5, v17);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)getGyroCalibrationDatabaseBiasFitAtTemperature:(float)a3 withReply:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;

  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1018A94C4;
  v8[3] = &unk_1021D6930;
  v8[4] = a4;
  objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLGyroCalibrationDatabase"), CFSTR("CLInternalService")), "getBiasFitWithReply:", v8);
  os_activity_scope_leave(&state);
}

- (void)getActivitiesWithReplyBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint8_t *v17;
  const char *v18;
  uint8_t *v19;
  _WORD v20[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetActivities (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v6 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2082;
    v27 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetActivities\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.status"));
  if (v8
    && (v9 = objc_opt_class(NSNumber, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v10 = sub_1012A67DC();
    if (v10)
    {
      v11 = sub_1012A7364(v10);
      (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, v11);

    }
    else
    {
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v14 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, #warning _CLDaemonGetActivityAlarms called without support for activity alarms", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v20[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, #warning _CLDaemonGetActivityAlarms called without support for activity alarms", v20, 2);
        v19 = (uint8_t *)v18;
        sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getActivitiesWithReplyBlock:]", "%s\n", v18);
        if (v19 != buf)
          free(v19);
      }
      v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v15, 0);

    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v20[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v20, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getActivitiesWithReplyBlock:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v13, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 andZoneIdentifier:(id)a5 andSubIdentityIdentifier:(id)a6 forBundleID:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  audit_token_t *v20;
  char v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  double v33;
  std::string *v34;
  const char *v35;
  std::string *v36;
  const char *v37;
  std::string *v38;
  id v40;
  _BYTE __str[32];
  std::string v42;
  void *__dst[2];
  char v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  _OWORD v57[2];
  std::string v58;
  std::string v59;
  __int128 v60;
  void *v61;
  __int128 v62;
  void *v63;
  __int16 v64;
  char v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  __int16 v72;
  char v73;
  os_activity_scope_state_s state;
  std::string buf[2];
  void *v76[2];
  void *v77[5];
  __int128 v78;
  _OWORD v79[95];

  v12 = *(_QWORD *)&a4;
  v13 = *(_QWORD *)&a3;
  v40 = objc_alloc_init((Class)NSAutoreleasePool);
  v15 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetAuthorizationStatusByType (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v15, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v16 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetAuthorizationStatusByType\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v18 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v18
    && (v19 = objc_opt_class(NSNumber, v17), (objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    && (objc_msgSend(v18, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a7, "length") || objc_msgSend(a8, "length"))
    {
      if (v13 > 4 || (_DWORD)v13 == 1)
      {
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v27 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
        {
          buf[0].__r_.__value_.__r.__words[0] = 68289282;
          LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
          WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 2;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, Invalid authorization\", \"auth\":%{public, location:CLClientAuthorizationStatus}lld}", (uint8_t *)buf, 0x1Cu);
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        }
        v28 = qword_1022A01C8;
        if (os_signpost_enabled((os_log_t)qword_1022A01C8))
        {
          buf[0].__r_.__value_.__r.__words[0] = 68289282;
          LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
          WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 2;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, Invalid authorization", "{\"msg%{public}.0s\":\"#Spi, Invalid authorization\", \"auth\":%{public, location:CLClientAuthorizationStatus}lld}", (uint8_t *)buf, 0x1Cu);
        }
      }
      else
      {
        if (v12 < 3)
        {
          memset(v77, 0, 35);
          *(_OWORD *)v76 = 0u;
          memset(buf, 0, sizeof(buf));
          v78 = 0u;
          memset(v79, 0, 59);
          if (objc_msgSend(a7, "length"))
          {
            sub_1015A2E04(__str, (char *)objc_msgSend(a7, "UTF8String"));
            sub_1001AE67C((std::string *)__str, (uint64_t)&v58);
            if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf[0].__r_.__value_.__l.__data_);
            buf[0] = v58;
            *((_BYTE *)&v58.__r_.__value_.__s + 23) = 0;
            v58.__r_.__value_.__s.__data_[0] = 0;
            if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf[1].__r_.__value_.__l.__data_);
            buf[1] = v59;
            *((_BYTE *)&v59.__r_.__value_.__s + 23) = 0;
            v59.__r_.__value_.__s.__data_[0] = 0;
            if (SHIBYTE(v77[0]) < 0)
              operator delete(v76[0]);
            *(_OWORD *)v76 = v60;
            v77[0] = v61;
            HIBYTE(v61) = 0;
            LOBYTE(v60) = 0;
            if (SHIBYTE(v77[3]) < 0)
              operator delete(v77[1]);
            *(_OWORD *)&v77[1] = v62;
            v77[3] = v63;
            HIBYTE(v63) = 0;
            LOBYTE(v62) = 0;
            LOWORD(v77[4]) = v64;
            BYTE2(v77[4]) = v65;
            if (SBYTE7(v79[0]) < 0)
              operator delete((void *)v78);
            v78 = v66;
            *(_QWORD *)&v79[0] = v67;
            HIBYTE(v67) = 0;
            LOBYTE(v66) = 0;
            if (SHIBYTE(v79[1]) < 0)
              operator delete(*((void **)&v79[0] + 1));
            v21 = 0;
            *(_OWORD *)((char *)v79 + 8) = v68;
            *((_QWORD *)&v79[1] + 1) = v69;
            HIBYTE(v69) = 0;
            LOBYTE(v68) = 0;
            if (SBYTE7(v79[3]) < 0)
            {
              operator delete(*(void **)&v79[2]);
              v21 = HIBYTE(v69);
            }
            v79[2] = v70;
            *(_QWORD *)&v79[3] = v71;
            HIBYTE(v71) = 0;
            LOBYTE(v70) = 0;
            WORD4(v79[3]) = v72;
            BYTE10(v79[3]) = v73;
            if (v21 < 0)
              operator delete((void *)v68);
            if (SHIBYTE(v67) < 0)
              operator delete((void *)v66);
            if (SHIBYTE(v63) < 0)
              operator delete((void *)v62);
            if (SHIBYTE(v61) < 0)
              operator delete((void *)v60);
            if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v59.__r_.__value_.__l.__data_);
            if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v58.__r_.__value_.__l.__data_);
          }
          else
          {
            if (!objc_msgSend(a8, "length"))
            {
LABEL_73:
              if (self)
                -[CLInternalService currentToken](self, "currentToken");
              else
                memset(v57, 0, sizeof(v57));
              CLConnection::getUserNameFromAuditToken(&v58, (CLConnection *)v57, v20);
              sub_1001AE664(buf, &v58);
              if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v58.__r_.__value_.__l.__data_);
              v31 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
              sub_1001AF190((char *)__dst, (__int128 *)buf);
              v32 = sub_1001AE728((__int128 *)__dst);
              if (self)
                -[CLInternalService currentToken](self, "currentToken");
              else
                memset(__str, 0, sizeof(__str));
              sub_1001AE4D0((uint64_t)__str, (uint64_t)&v58);
              v33 = sub_1001A8444((uint64_t)&v58, &v42);
              if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v34 = &v42;
              else
                v34 = (std::string *)v42.__r_.__value_.__r.__words[0];
              objc_msgSend(v31, "setClientAuthorization:zoneIdentifier:subIdentityIdentifier:status:correctiveCompensation:mayIncreaseAuth:entity:", v32, a5, a6, v13, v12, 1, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v34, v33));
              if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v42.__r_.__value_.__l.__data_);
              if (SHIBYTE(v71) < 0)
                operator delete((void *)v70);
              if (SHIBYTE(v69) < 0)
                operator delete((void *)v68);
              if (SHIBYTE(v67) < 0)
                operator delete((void *)v66);
              if (SHIBYTE(v63) < 0)
                operator delete((void *)v62);
              if (SHIBYTE(v61) < 0)
                operator delete((void *)v60);
              if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v59.__r_.__value_.__l.__data_);
              if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v58.__r_.__value_.__l.__data_);
              if (v56 < 0)
                operator delete(v55);
              if (v54 < 0)
                operator delete(v53);
              if (v52 < 0)
                operator delete(v51);
              if (v50 < 0)
                operator delete(v49);
              if (v48 < 0)
                operator delete(v47);
              if (v46 < 0)
                operator delete(v45);
              if (v44 < 0)
                operator delete(__dst[0]);
              (*((void (**)(id, _QWORD))a9 + 2))(a9, 0);
              if (SBYTE7(v79[3]) < 0)
                operator delete(*(void **)&v79[2]);
              if (SHIBYTE(v79[1]) < 0)
                operator delete(*((void **)&v79[0] + 1));
              if (SBYTE7(v79[0]) < 0)
                operator delete((void *)v78);
              if (SHIBYTE(v77[3]) < 0)
                operator delete(v77[1]);
              if (SHIBYTE(v77[0]) < 0)
                operator delete(v76[0]);
              if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
                operator delete(buf[1].__r_.__value_.__l.__data_);
              if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
                operator delete(buf[0].__r_.__value_.__l.__data_);
              goto LABEL_46;
            }
            sub_1015A2E04(__str, (char *)objc_msgSend(a8, "UTF8String"));
            sub_1001B8590((std::string *)__str, (uint64_t)&v58);
            sub_1001AEF2C((uint64_t)buf, (__int128 *)&v58);
            sub_100010174((uint64_t)&v58);
          }
          if ((__str[23] & 0x80000000) != 0)
            operator delete(*(void **)__str);
          goto LABEL_73;
        }
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v24 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
        {
          buf[0].__r_.__value_.__r.__words[0] = 68289282;
          LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
          WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, Invalid corrective compensation state\", \"compensate\":%{public, location:CLClientCorrectiveCompensation}lld}", (uint8_t *)buf, 0x1Cu);
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        }
        v25 = qword_1022A01C8;
        if (os_signpost_enabled((os_log_t)qword_1022A01C8))
        {
          buf[0].__r_.__value_.__r.__words[0] = 68289282;
          LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
          WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
          *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, Invalid corrective compensation state", "{\"msg%{public}.0s\":\"#Spi, Invalid corrective compensation state\", \"compensate\":%{public, location:CLClientCorrectiveCompensation}lld}", (uint8_t *)buf, 0x1Cu);
        }
      }
      v26 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id))a9 + 2))(a9, v26);

      goto LABEL_46;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v29 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v58.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status", &v58, 2);
      v38 = (std::string *)v37;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService setAuthorizationStatusByType:withCorrectiveCompensation:andZoneIdentifier:andSubIdentityIdentifier:forBundleID:orBundlePath:replyBlock:]", "%s\n", v37);
      if (v38 != buf)
        free(v38);
    }
    v30 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a9 + 2))(a9, v30);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v22 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v58.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v58, 2);
      v36 = (std::string *)v35;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setAuthorizationStatusByType:withCorrectiveCompensation:andZoneIdentifier:andSubIdentityIdentifier:forBundleID:orBundlePath:replyBlock:]", "%s\n", v35);
      if (v36 != buf)
        free(v36);
    }
    v23 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a9 + 2))(a9, v23);

  }
LABEL_46:
  os_activity_scope_leave(&state);

}

- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3 replyBlock:(id)a4
{
  uint64_t v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint8_t *v18;
  _WORD v19[8];
  os_activity_scope_state_s v20;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: updatePillButtonChoiceForOutstandingPrompt:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2082;
    v27 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"updatePillButtonChoiceForOutstandingPrompt:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: updateCorrectiveCompensationChoiceForOutstandingPrompt:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &v20);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2082;
    v27 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"updateCorrectiveCompensationChoiceForOutstandingPrompt:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v13 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v13
    && (v14 = objc_opt_class(NSNumber, v12), (objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    && (objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager")), "updatePillButtonChoiceForOutstandingPrompt:", v5);
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v15 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v19[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v19, 2);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService updatePillButtonChoiceForOutstandingPrompt:replyBlock:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    v16 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a4 + 2))(a4, v16);

  }
  os_activity_scope_leave(&v20);
  os_activity_scope_leave(&state);

}

- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4 replyBlock:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint8_t *v17;
  _WORD v18[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v9 = _os_activity_create((void *)&_mh_execute_header, "CL: updatePromptedLatitude:longitude:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v9, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v10 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"updatePromptedLatitude:longitude:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v12 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v12
    && (v13 = objc_opt_class(NSNumber, v11), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    && (objc_msgSend(v12, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager")), "updatePromptedLatitude:longitude:", a3, a4);
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v14 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v18[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v18, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService updatePromptedLatitude:longitude:replyBlock:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    v15 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a5 + 2))(a5, v15);

  }
  os_activity_scope_leave(&state);
}

- (void)setIncidentalUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  uint64_t v9;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  audit_token_t *v17;
  NSObject *v18;
  id v19;
  char v20;
  id v21;
  NSObject *v22;
  id v23;
  const char *v24;
  std::string *v25;
  const char *v26;
  std::string *v27;
  void *__dst[2];
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  _BYTE v42[40];
  std::string __str;
  std::string v44;
  std::string v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  __int16 v50;
  char v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  __int16 v58;
  char v59;
  os_activity_scope_state_s state;
  std::string buf[2];
  __int128 v62;
  _QWORD v63[5];
  __int128 v64;
  _OWORD v65[95];

  v9 = *(_QWORD *)&a3;
  v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = _os_activity_create((void *)&_mh_execute_header, "CL: setIncidentalUseMode:forBundleID:orBundlePath:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v13 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setIncidentalUseMode:forBundleID:orBundlePath:replyBlock:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v15 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v15
    && (v16 = objc_opt_class(NSNumber, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a4, "length") || objc_msgSend(a5, "length"))
    {
      memset(v63, 0, 35);
      v62 = 0u;
      memset(buf, 0, sizeof(buf));
      v64 = 0u;
      memset(v65, 0, 59);
      if (objc_msgSend(a4, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a4, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)&v44);
      }
      else
      {
        if (!objc_msgSend(a5, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v42, 0, 32);
          CLConnection::getUserNameFromAuditToken(&v44, (CLConnection *)v42, v17);
          sub_1001AE664(buf, &v44);
          if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v44.__r_.__value_.__l.__data_);
          v21 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
          sub_1001AF190((char *)__dst, (__int128 *)buf);
          objc_msgSend(v21, "setIncidentalUseMode:forClient:", v9, sub_1001AE728((__int128 *)__dst));
          if (v41 < 0)
            operator delete(v40);
          if (v39 < 0)
            operator delete(v38);
          if (v37 < 0)
            operator delete(v36);
          if (v35 < 0)
            operator delete(v34);
          if (v33 < 0)
            operator delete(v32);
          if (v31 < 0)
            operator delete(v30);
          if (v29 < 0)
            operator delete(__dst[0]);
          (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
          if (SBYTE7(v65[3]) < 0)
            operator delete(*(void **)&v65[2]);
          if (SHIBYTE(v65[1]) < 0)
            operator delete(*((void **)&v65[0] + 1));
          if (SBYTE7(v65[0]) < 0)
            operator delete((void *)v64);
          if (SHIBYTE(v63[3]) < 0)
            operator delete((void *)v63[1]);
          if (SHIBYTE(v63[0]) < 0)
            operator delete((void *)v62);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_18;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a5, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)&v44);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = v44;
      *((_BYTE *)&v44.__r_.__value_.__s + 23) = 0;
      v44.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = v45;
      *((_BYTE *)&v45.__r_.__value_.__s + 23) = 0;
      v45.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v63[0]) < 0)
        operator delete((void *)v62);
      v62 = v46;
      v63[0] = v47;
      HIBYTE(v47) = 0;
      LOBYTE(v46) = 0;
      if (SHIBYTE(v63[3]) < 0)
        operator delete((void *)v63[1]);
      *(_OWORD *)&v63[1] = v48;
      v63[3] = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      LOWORD(v63[4]) = v50;
      BYTE2(v63[4]) = v51;
      if (SBYTE7(v65[0]) < 0)
        operator delete((void *)v64);
      v64 = v52;
      *(_QWORD *)&v65[0] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      if (SHIBYTE(v65[1]) < 0)
        operator delete(*((void **)&v65[0] + 1));
      v20 = 0;
      *(_OWORD *)((char *)v65 + 8) = v54;
      *((_QWORD *)&v65[1] + 1) = v55;
      HIBYTE(v55) = 0;
      LOBYTE(v54) = 0;
      if (SBYTE7(v65[3]) < 0)
      {
        operator delete(*(void **)&v65[2]);
        v20 = HIBYTE(v55);
      }
      v65[2] = v56;
      *(_QWORD *)&v65[3] = v57;
      HIBYTE(v57) = 0;
      LOBYTE(v56) = 0;
      WORD4(v65[3]) = v58;
      BYTE10(v65[3]) = v59;
      if (v20 < 0)
        operator delete((void *)v54);
      if (SHIBYTE(v53) < 0)
        operator delete((void *)v52);
      if (SHIBYTE(v49) < 0)
        operator delete((void *)v48);
      if (SHIBYTE(v47) < 0)
        operator delete((void *)v46);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v45.__r_.__value_.__l.__data_);
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v44.__r_.__value_.__l.__data_);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v22 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path for which to set incidental use mode", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v44.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi, Must provide a bundle identifier or bundle path for which to set incidental use mode", &v44, 2);
      v27 = (std::string *)v26;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService setIncidentalUseMode:forBundleID:orBundlePath:replyBlock:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
    v23 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v23);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v18 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v44.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v44, 2);
      v25 = (std::string *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setIncidentalUseMode:forBundleID:orBundlePath:replyBlock:]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
    v19 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v19);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)setLocationButtonUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  uint64_t v9;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  audit_token_t *v17;
  NSObject *v18;
  id v19;
  char v20;
  id v21;
  NSObject *v22;
  id v23;
  const char *v24;
  std::string *v25;
  const char *v26;
  std::string *v27;
  void *__dst[2];
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  _BYTE v42[40];
  std::string __str;
  std::string v44;
  std::string v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  __int16 v50;
  char v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  __int16 v58;
  char v59;
  os_activity_scope_state_s state;
  std::string buf[2];
  __int128 v62;
  _QWORD v63[5];
  __int128 v64;
  _OWORD v65[95];

  v9 = *(_QWORD *)&a3;
  v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = _os_activity_create((void *)&_mh_execute_header, "CL: setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v13 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v15 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v15
    && (v16 = objc_opt_class(NSNumber, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a4, "length") || objc_msgSend(a5, "length"))
    {
      memset(v63, 0, 35);
      v62 = 0u;
      memset(buf, 0, sizeof(buf));
      v64 = 0u;
      memset(v65, 0, 59);
      if (objc_msgSend(a4, "length"))
      {
        sub_1015A2E04(&__str, (char *)objc_msgSend(a4, "UTF8String"));
        sub_1001AE67C(&__str, (uint64_t)&v44);
      }
      else
      {
        if (!objc_msgSend(a5, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v42, 0, 32);
          CLConnection::getUserNameFromAuditToken(&v44, (CLConnection *)v42, v17);
          sub_1001AE664(buf, &v44);
          if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v44.__r_.__value_.__l.__data_);
          v21 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
          sub_1001AF190((char *)__dst, (__int128 *)buf);
          objc_msgSend(v21, "setLocationButtonUseMode:forClient:", v9, sub_1001AE728((__int128 *)__dst));
          if (v41 < 0)
            operator delete(v40);
          if (v39 < 0)
            operator delete(v38);
          if (v37 < 0)
            operator delete(v36);
          if (v35 < 0)
            operator delete(v34);
          if (v33 < 0)
            operator delete(v32);
          if (v31 < 0)
            operator delete(v30);
          if (v29 < 0)
            operator delete(__dst[0]);
          (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
          if (SBYTE7(v65[3]) < 0)
            operator delete(*(void **)&v65[2]);
          if (SHIBYTE(v65[1]) < 0)
            operator delete(*((void **)&v65[0] + 1));
          if (SBYTE7(v65[0]) < 0)
            operator delete((void *)v64);
          if (SHIBYTE(v63[3]) < 0)
            operator delete((void *)v63[1]);
          if (SHIBYTE(v63[0]) < 0)
            operator delete((void *)v62);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_18;
        }
        sub_1015A2E04(&__str, (char *)objc_msgSend(a5, "UTF8String"));
        sub_1001B8590(&__str, (uint64_t)&v44);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = v44;
      *((_BYTE *)&v44.__r_.__value_.__s + 23) = 0;
      v44.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = v45;
      *((_BYTE *)&v45.__r_.__value_.__s + 23) = 0;
      v45.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v63[0]) < 0)
        operator delete((void *)v62);
      v62 = v46;
      v63[0] = v47;
      HIBYTE(v47) = 0;
      LOBYTE(v46) = 0;
      if (SHIBYTE(v63[3]) < 0)
        operator delete((void *)v63[1]);
      *(_OWORD *)&v63[1] = v48;
      v63[3] = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      LOWORD(v63[4]) = v50;
      BYTE2(v63[4]) = v51;
      if (SBYTE7(v65[0]) < 0)
        operator delete((void *)v64);
      v64 = v52;
      *(_QWORD *)&v65[0] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      if (SHIBYTE(v65[1]) < 0)
        operator delete(*((void **)&v65[0] + 1));
      v20 = 0;
      *(_OWORD *)((char *)v65 + 8) = v54;
      *((_QWORD *)&v65[1] + 1) = v55;
      HIBYTE(v55) = 0;
      LOBYTE(v54) = 0;
      if (SBYTE7(v65[3]) < 0)
      {
        operator delete(*(void **)&v65[2]);
        v20 = HIBYTE(v55);
      }
      v65[2] = v56;
      *(_QWORD *)&v65[3] = v57;
      HIBYTE(v57) = 0;
      LOBYTE(v56) = 0;
      WORD4(v65[3]) = v58;
      BYTE10(v65[3]) = v59;
      if (v20 < 0)
        operator delete((void *)v54);
      if (SHIBYTE(v53) < 0)
        operator delete((void *)v52);
      if (SHIBYTE(v49) < 0)
        operator delete((void *)v48);
      if (SHIBYTE(v47) < 0)
        operator delete((void *)v46);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v45.__r_.__value_.__l.__data_);
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v44.__r_.__value_.__l.__data_);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v22 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path for which to set location-button use mode", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v44.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi, Must provide a bundle identifier or bundle path for which to set location-button use mode", &v44, 2);
      v27 = (std::string *)v26;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
    v23 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v23);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v18 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v44.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v44, 2);
      v25 = (std::string *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock:]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
    v19 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v19);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  _WORD v16[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseSupportsMiniCalibration (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseSupportsMiniCalibration\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.rebuild_gytt"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLGyroCalibrationDatabase")), "syncgetSupportsMiniCalibration"))
    {
      (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, 1);
    }
    else
    {
      v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v13, 0);

    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v11 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v16, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v12, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  _BOOL8 v9;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  audit_token_t *v17;
  NSObject *v18;
  id v19;
  char v20;
  id v21;
  id v22;
  double v23;
  std::string *v24;
  NSObject *v25;
  id v26;
  const char *v27;
  std::string *v28;
  const char *v29;
  std::string *v30;
  _BYTE __str[32];
  std::string v32;
  void *__dst[2];
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  _OWORD v47[2];
  std::string v48;
  std::string v49;
  __int128 v50;
  void *v51;
  __int128 v52;
  void *v53;
  __int16 v54;
  char v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  __int16 v62;
  char v63;
  os_activity_scope_state_s state;
  std::string buf[2];
  void *v66[2];
  void *v67[5];
  __int128 v68;
  _OWORD v69[95];

  v9 = a3;
  v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetBackgroundIndicatorEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v13 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetBackgroundIndicatorEnabled\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v15 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.authorizeapplications"));
  if (v15
    && (v16 = objc_opt_class(NSNumber, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(a4, "length") || objc_msgSend(a5, "length"))
    {
      memset(v67, 0, 35);
      *(_OWORD *)v66 = 0u;
      memset(buf, 0, sizeof(buf));
      v68 = 0u;
      memset(v69, 0, 59);
      if (objc_msgSend(a4, "length"))
      {
        sub_1015A2E04(__str, (char *)objc_msgSend(a4, "cStringUsingEncoding:", 4));
        sub_1001AE67C((std::string *)__str, (uint64_t)&v48);
      }
      else
      {
        if (!objc_msgSend(a5, "length"))
        {
LABEL_49:
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(v47, 0, sizeof(v47));
          CLConnection::getUserNameFromAuditToken(&v48, (CLConnection *)v47, v17);
          sub_1001AE664(buf, &v48);
          if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v48.__r_.__value_.__l.__data_);
          v21 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
          sub_1001AF190((char *)__dst, (__int128 *)buf);
          v22 = sub_1001AE728((__int128 *)__dst);
          if (self)
            -[CLInternalService currentToken](self, "currentToken");
          else
            memset(__str, 0, sizeof(__str));
          sub_1001AE4D0((uint64_t)__str, (uint64_t)&v48);
          v23 = sub_1001A8444((uint64_t)&v48, &v32);
          if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v24 = &v32;
          else
            v24 = (std::string *)v32.__r_.__value_.__r.__words[0];
          objc_msgSend(v21, "setClientBackgroundIndicator:enabled:entity:", v22, v9, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v24, v23));
          if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v32.__r_.__value_.__l.__data_);
          if (SHIBYTE(v61) < 0)
            operator delete((void *)v60);
          if (SHIBYTE(v59) < 0)
            operator delete((void *)v58);
          if (SHIBYTE(v57) < 0)
            operator delete((void *)v56);
          if (SHIBYTE(v53) < 0)
            operator delete((void *)v52);
          if (SHIBYTE(v51) < 0)
            operator delete((void *)v50);
          if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v49.__r_.__value_.__l.__data_);
          if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v48.__r_.__value_.__l.__data_);
          if (v46 < 0)
            operator delete(v45);
          if (v44 < 0)
            operator delete(v43);
          if (v42 < 0)
            operator delete(v41);
          if (v40 < 0)
            operator delete(v39);
          if (v38 < 0)
            operator delete(v37);
          if (v36 < 0)
            operator delete(v35);
          if (v34 < 0)
            operator delete(__dst[0]);
          (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
          if (SBYTE7(v69[3]) < 0)
            operator delete(*(void **)&v69[2]);
          if (SHIBYTE(v69[1]) < 0)
            operator delete(*((void **)&v69[0] + 1));
          if (SBYTE7(v69[0]) < 0)
            operator delete((void *)v68);
          if (SHIBYTE(v67[3]) < 0)
            operator delete(v67[1]);
          if (SHIBYTE(v67[0]) < 0)
            operator delete(v66[0]);
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[1].__r_.__value_.__l.__data_);
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf[0].__r_.__value_.__l.__data_);
          goto LABEL_18;
        }
        sub_1015A2E04(__str, (char *)objc_msgSend(a5, "cStringUsingEncoding:", 4));
        sub_1001B8590((std::string *)__str, (uint64_t)&v48);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      buf[0] = v48;
      *((_BYTE *)&v48.__r_.__value_.__s + 23) = 0;
      v48.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[1].__r_.__value_.__l.__data_);
      buf[1] = v49;
      *((_BYTE *)&v49.__r_.__value_.__s + 23) = 0;
      v49.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v67[0]) < 0)
        operator delete(v66[0]);
      *(_OWORD *)v66 = v50;
      v67[0] = v51;
      HIBYTE(v51) = 0;
      LOBYTE(v50) = 0;
      if (SHIBYTE(v67[3]) < 0)
        operator delete(v67[1]);
      *(_OWORD *)&v67[1] = v52;
      v67[3] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      LOWORD(v67[4]) = v54;
      BYTE2(v67[4]) = v55;
      if (SBYTE7(v69[0]) < 0)
        operator delete((void *)v68);
      v68 = v56;
      *(_QWORD *)&v69[0] = v57;
      HIBYTE(v57) = 0;
      LOBYTE(v56) = 0;
      if (SHIBYTE(v69[1]) < 0)
        operator delete(*((void **)&v69[0] + 1));
      v20 = 0;
      *(_OWORD *)((char *)v69 + 8) = v58;
      *((_QWORD *)&v69[1] + 1) = v59;
      HIBYTE(v59) = 0;
      LOBYTE(v58) = 0;
      if (SBYTE7(v69[3]) < 0)
      {
        operator delete(*(void **)&v69[2]);
        v20 = HIBYTE(v59);
      }
      v69[2] = v60;
      *(_QWORD *)&v69[3] = v61;
      HIBYTE(v61) = 0;
      LOBYTE(v60) = 0;
      WORD4(v69[3]) = v62;
      BYTE10(v69[3]) = v63;
      if (v20 < 0)
        operator delete((void *)v58);
      if (SHIBYTE(v57) < 0)
        operator delete((void *)v56);
      if (SHIBYTE(v53) < 0)
        operator delete((void *)v52);
      if (SHIBYTE(v51) < 0)
        operator delete((void *)v50);
      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v49.__r_.__value_.__l.__data_);
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v48.__r_.__value_.__l.__data_);
      if ((__str[23] & 0x80000000) != 0)
        operator delete(*(void **)__str);
      goto LABEL_49;
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v25 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Spi, both bundle-id and bundle-identifier are either zero-length or nil", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v48.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "#Spi, both bundle-id and bundle-identifier are either zero-length or nil", &v48, 2);
      v30 = (std::string *)v29;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService setBackgroundIndicatorEnabled:forBundleID:orBundlePath:replyBlock:]", "%s\n", v29);
      if (v30 != buf)
        free(v30);
    }
    v26 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v26);

  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v18 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v48.__r_.__value_.__l.__data_) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", &v48, 2);
      v28 = (std::string *)v27;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService setBackgroundIndicatorEnabled:forBundleID:orBundlePath:replyBlock:]", "%s\n", v27);
      if (v28 != buf)
        free(v28);
    }
    v19 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a6 + 2))(a6, v19);

  }
LABEL_18:
  os_activity_scope_leave(&state);

}

- (void)getControlPlaneStatusReportClear:(int)a3 replyBlock:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  id v17;
  uint64_t v23;
  os_activity_scope_state_s v24;
  _BYTE buf[32];
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unsigned int v29;

  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetControlPlaneStatusReport (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &v24);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetControlPlaneStatusReport\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if ((objc_msgSend(-[CLInternalService vendor](self, "vendor"), "isServiceRunning:", CFSTR("CLGnssProvider")) & 1) != 0)
  {
    v10 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLGnssProvider"));
    if (a3)
    {
      objc_msgSend(v10, "resetControlPlaneStatus");
    }
    else
    {
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)buf = _Q0;
      *(_OWORD *)&buf[16] = 0uLL;
      v26 = 0;
      v27 = 0xBFF0000000000000;
      v28 = -1;
      v29 = 0;
      if (objc_msgSend(v10, "syncgetControlPlaneStatusReport:", buf))
      {
        v11.n128_u64[0] = *(_QWORD *)buf;
        v12.n128_u64[0] = *(_QWORD *)&buf[8];
        v14.n128_u64[0] = *(_QWORD *)&buf[24];
        v13.n128_u64[0] = *(_QWORD *)&buf[16];
        v15.n128_u64[0] = v26;
        v16.n128_u64[0] = v27;
        v23 = v29;
LABEL_12:
        (*((void (**)(id, _QWORD, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))a4 + 2))(a4, 0, v23, v11, v12, v13, v14, v15, v16);
        goto LABEL_13;
      }
    }
    v23 = 0;
    v13.n128_u64[0] = 0;
    v11.n128_u64[0] = -1.0;
    v12.n128_u64[0] = -1.0;
    v14.n128_u64[0] = 0;
    v15.n128_u64[0] = 0;
    v16.n128_u64[0] = -1.0;
    goto LABEL_12;
  }
  v17 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 1, 0);
  (*((void (**)(id, id, _QWORD, double, double, double, double, double, double))a4 + 2))(a4, v17, 0, -1.0, -1.0, 0.0, 0.0, 0.0, -1.0);

LABEL_13:
  os_activity_scope_leave(&v24);

}

- (void)getEmergencyLocationSettingsVersion:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetEmergencyLocationSettingsVersion (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &v8);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetEmergencyLocationSettingsVersion\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLMobileAssetManager"), CFSTR("CLInternalService")), "getAssetVersionInfoFor:withReply:", 0, a3);
  os_activity_scope_leave(&v8);

}

- (void)deleteCurrentEmergencyLocationAsset:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonDeleteCurrentEmergencyLocationAsset (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &v8);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonDeleteCurrentEmergencyLocationAsset\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLMobileAssetManager"), CFSTR("CLInternalService")), "deleteCurrentAssetFor:withReply:", 0, a3);
  os_activity_scope_leave(&v8);

}

- (void)copyNearbyAssetSettings:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonCopyNearbyAssetSettings (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonCopyNearbyAssetSettings\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1018AD698;
  v8[3] = &unk_1021D6868;
  v8[4] = a3;
  objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLMobileAssetManager"), CFSTR("CLInternalService")), "copyNearbyAssetSettingsWithReply:", v8);
  os_activity_scope_leave(&state);

}

- (void)copyNearbyAssetSettingsOfAccessoryFile:(id)a3 withReply:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;

  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonCopyNearbyAssetSettingsOfAccessoryFileWithReply (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v9 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2082;
    v17 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonCopyNearbyAssetSettingsOfAccessoryFileWithReply\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1018ADA2C;
  v10[3] = &unk_1021D6868;
  v10[4] = a4;
  objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLMobileAssetManager"), CFSTR("CLInternalService")), "copyNearbyAssetSettingsOfAccessoryFile:withReply:", a3, v10);
  os_activity_scope_leave(&state);

}

- (void)copyRoutineAssetSettings:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonCopyRoutineAssetSettings (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonCopyRoutineAssetSettings\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1018ADDB0;
  v8[3] = &unk_1021D6980;
  v8[4] = a3;
  objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLMobileAssetManager"), CFSTR("CLInternalService")), "copyRoutineAssetSettingsWithReply:", v8);
  os_activity_scope_leave(&state);

}

- (void)shouldDisplayEEDUI:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonShouldDisplayEEDUI (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonShouldDisplayEEDUI\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1018AE174;
  v8[3] = &unk_102163458;
  v8[4] = a3;
  objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLEmergencyController"), CFSTR("CLInternalService")), "shouldDisplayEEDUIWithReply:", v8);
  os_activity_scope_leave(&state);

}

- (void)getEEDCloakingKeyWithReply:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint8_t *v14;
  _QWORD v15[5];
  _WORD v16[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetEEDCloakingKeyWithReply (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetEEDCloakingKeyWithReply\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.eed_cloaking_key"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1018AE6F0;
    v15[3] = &unk_1021D69A8;
    v15[4] = a3;
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLEmergencyController"), CFSTR("CLInternalService")), "getEEDCloakingKeyWithReply:", v15);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v11 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v16, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getEEDCloakingKeyWithReply:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v12, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)getEEDEmergencyContactNamesWithReply:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint8_t *v14;
  _QWORD v15[5];
  _WORD v16[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetEEDEmergencyContactNamesWithReply (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetEEDEmergencyContactNamesWithReply\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.eed_emergency_contact_names"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1018AED18;
    v15[3] = &unk_1021D69D0;
    v15[4] = a3;
    objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLEmergencyController"), CFSTR("CLInternalService")), "getEEDEmergencyContactNamesWithReply:", v15);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v11 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v16, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getEEDEmergencyContactNamesWithReply:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v12, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)startStopAdvertisingBeacon:(id)a3 atPower:(int)a4 replyBlock:(id)a5
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  const char *v19;
  uint8_t *v20;
  _WORD v21[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  v6 = *(_QWORD *)&a4;
  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonStartStopAdvertisingBeacon (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2082;
    v28 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonStartStopAdvertisingBeacon\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v13 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.advertise-beacon"));
  if (v13
    && (v14 = objc_opt_class(NSNumber, v12), (objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    && (objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v15 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2113;
      v28 = (const char *)a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, startStopAdvertisingBeacon, \", \"Region\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLBTLEBeaconProvider")), "syncgetadvertiseSelfAsBeaconForRegion:power:", a3, v6))
    {
      (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
    }
    else
    {
      v18 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id))a5 + 2))(a5, v18);

    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v16 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v21[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v21, 2);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService startStopAdvertisingBeacon:atPower:replyBlock:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
    v17 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a5 + 2))(a5, v17);

  }
  os_activity_scope_leave(&state);

}

- (void)getGyroCalibrationDatabaseBiasFitAtTemplerature:(float)a3 replyBlock:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;

  v6 = objc_alloc_init((Class)NSAutoreleasePool);
  v7 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &v10);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v8 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLGyroCalibrationDatabase")), "syncgetBiasFit:", buf))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 320);
    (*((void (**)(id, _QWORD, id))a4 + 2))(a4, 0, v9);
  }
  else
  {
    v9 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id, _QWORD))a4 + 2))(a4, v9, 0);
  }

  os_activity_scope_leave(&v10);
}

- (void)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6 replyBlock:(id)a7
{
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  double v15;
  id v16;
  os_activity_scope_state_s state;
  $E2C29196C7A5C696474C6955C5A9CE06 v18;
  $E2C29196C7A5C696474C6955C5A9CE06 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v19 = a3;
  v18 = a5;
  v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseInsertBiasEstimateIfValid (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v13 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseInsertBiasEstimateIfValid\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v14 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLGyroCalibrationDatabase"));
  *(float *)&v15 = a4;
  if (objc_msgSend(v14, "syncgetInsertWithBias:variance:temperature:timestamp:", &v19, &v18, v15, a6))
  {
    (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
  }
  else
  {
    v16 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
    (*((void (**)(id, id))a7 + 2))(a7, v16);

  }
  os_activity_scope_leave(&state);

}

- (void)gyroCalibrationDatabaseWipeWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  _WORD v16[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseWipe (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseWipe\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.rebuild_gytt"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLGyroCalibrationDatabase")), "syncgetWipeDatabase"))
    {
      (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
    }
    else
    {
      v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id))a3 + 2))(a3, v13);

    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v11 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v16[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v16, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService gyroCalibrationDatabaseWipeWithReplyBlock:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a3 + 2))(a3, v12);

  }
  os_activity_scope_leave(&state);

}

- (void)gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  const char *v15;
  uint8_t *v16;
  _WORD v17[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseGetNumTemperatures (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseGetNumTemperatures\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.rebuild_gytt"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLGyroCalibrationDatabase"));
    if (v11)
    {
      (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, objc_msgSend(v11, "syncgetNumTemperatures"));
    }
    else
    {
      v14 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v14, 0xFFFFFFFFLL);

    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v17[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v17, 2);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v13, 0xFFFFFFFFLL);

  }
  os_activity_scope_leave(&state);

}

- (void)configure:(id)a3 replyBlock:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64x2_t v14;
  int16x8_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  const char *v22;
  char *v23;
  const char *v24;
  char *v25;
  _QWORD v26[5];
  _WORD v27[8];
  os_activity_scope_state_s state;
  _DWORD buf[410];

  v5 = *(_QWORD *)&a3.var7;
  v6 = *(_QWORD *)&a3.var0;
  v8 = objc_alloc_init((Class)NSAutoreleasePool);
  v9 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonConfigure (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v9, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v10 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    buf[0] = 68289282;
    buf[1] = 0;
    LOWORD(buf[2]) = 2082;
    *(_QWORD *)((char *)&buf[2] + 2) = "";
    HIWORD(buf[4]) = 2082;
    *(_QWORD *)&buf[5] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonConfigure\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  v12 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.configure"));
  if (v12
    && (v13 = objc_opt_class(NSNumber, v11), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    && (objc_msgSend(v12, "BOOLValue") & 1) != 0)
  {
    if (sub_1001FBB04(0))
    {
      memset((char *)&buf[1] + 3, 0, 32);
      memset((char *)&buf[9] + 3, 0, 27);
      LOBYTE(buf[0]) = 6;
      BYTE1(buf[0]) = v6 & 1;
      v14 = (uint64x2_t)vdupq_n_s64(v6);
      v15 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_101CEB040), (int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_101CEB030));
      *(int8x8_t *)v15.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v15), (int8x8_t)0x1000100010001);
      *(_DWORD *)((char *)buf + 2) = vmovn_s16(v15).u32[0];
      BYTE2(buf[1]) = BYTE5(v6) & 1;
      BYTE1(buf[2]) = BYTE6(v6);
      BYTE2(buf[2]) = BYTE4(v5);
      *(_WORD *)((char *)&buf[2] + 3) = HIWORD(v5);
      *(_DWORD *)((char *)&buf[4] + 1) = v5;
      v16 = _Block_copy(a4);
      v17 = sub_1001FBB04(0);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1018B0530;
      v26[3] = &unk_102163458;
      v26[4] = v16;
      (*(void (**)(uint64_t, _DWORD *, id, _QWORD *))(*(_QWORD *)v17 + 128))(v17, buf, objc_msgSend(-[CLInternalService silo](self, "silo"), "queue"), v26);
    }
    else
    {
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v20 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "#Spi, Oscar not available", (uint8_t *)buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v27[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 17, "#Spi, Oscar not available", v27, 2);
        v25 = (char *)v24;
        sub_100512490("Generic", 1, 0, 0, "-[CLInternalService configure:replyBlock:]", "%s\n", v24);
        if (v25 != (char *)buf)
          free(v25);
      }
      v21 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id))a4 + 2))(a4, v21);

    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v18 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v27[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v27, 2);
      v23 = (char *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService configure:replyBlock:]", "%s\n", v22);
      if (v23 != (char *)buf)
        free(v23);
    }
    v19 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id))a4 + 2))(a4, v19);

  }
  os_activity_scope_leave(&state);

}

- (void)getMotionSensorLogsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSArray *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemongetMotionSensorLogs (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v6 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemongetMotionSensorLogs\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if (qword_1023118A8 != -1)
    dispatch_once(&qword_1023118A8, &stru_1021D6A50);
  if (qword_1023118B0)
  {
    v7 = (NSArray *)sub_100EC7F38(qword_1023118B0);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v8 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to access Motion Logger.  Maybe it is not enabled?", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "Unable to access Motion Logger.  Maybe it is not enabled?", v11, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService getMotionSensorLogsWithReply:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    v7 = +[NSArray array](NSArray, "array");
  }
  (*((void (**)(id, NSArray *, _QWORD))a3 + 2))(a3, v7, 0);
  os_activity_scope_leave(&state);

}

- (void)getAccessoryMotionSensorLogsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSArray *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemongetAccessoryMotionSensorLogs (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v6 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemongetAccessoryMotionSensorLogs\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v7 = sub_100BE44D8();
  if (v7)
  {
    v8 = (NSArray *)sub_100BEBD74(v7);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v9 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to access CLMotionLogger", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v12[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 16, "Unable to access CLMotionLogger", v12, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLInternalService getAccessoryMotionSensorLogsWithReply:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    v8 = +[NSArray array](NSArray, "array");
  }
  (*((void (**)(id, NSArray *, _QWORD))a3 + 2))(a3, v8, 0);
  os_activity_scope_leave(&state);

}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;

  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLPassKitNotifyPayment (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &v12);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v11 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLPassKitNotifyPayment\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLHarvesterService")), "notifyPassKitPayment:transaction:info:", a3, a4, a5);
  os_activity_scope_leave(&v12);

}

- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8
{

}

- (void)getMicroLocationInternalVersionWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  const char *v15;
  uint8_t *v16;
  id v17[2];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetMicroLocationInternalVersion (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetMicroLocationInternalVersion\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.status"));
  if (v9
    && (v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v17[0] = 0;
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLMicroLocationNotifier")), "syncgetMicroLocationInternalVersion:", v17)&& objc_msgSend(v17[0], "length"))
    {
      (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, v17[0]);
    }
    else
    {
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      v13 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi,MicroLocationInternalVersion,#warning Couldn't get MicroLocation Internal Version\"}", buf, 0x12u);
      }
      v14 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v14, 0);

    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    v11 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
      LOWORD(v17[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v17, 2);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getMicroLocationInternalVersionWithReplyBlock:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
    (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v12, 0);

  }
  os_activity_scope_leave(&state);

}

- (void)getZaxisStatsWithReplyBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  unsigned int v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  const char *v24;
  uint8_t *v25;
  os_activity_scope_state_s state;
  uint8_t v27[4];
  int v28;
  __int16 v29;
  const char *v30;
  uint8_t buf[8];
  _BYTE v32[20];

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetZaxisStats (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v7 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v32 = 2082;
    *(_QWORD *)&v32[2] = "";
    *(_WORD *)&v32[10] = 2082;
    *(_QWORD *)&v32[12] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetZaxisStats\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", CFSTR("com.apple.locationd.status"));
  if (v9)
  {
    v10 = objc_opt_class(NSNumber, v8);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)v32 = 0;
      *(_QWORD *)&v32[8] = 0;
      sub_100407BF8((void **)buf, 0x18uLL);
      if (*(_QWORD *)&v32[8] - *(_QWORD *)buf > 0xBFuLL)
      {
        if (!objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", CFSTR("CLLocationController")), "syncgetZaxisStats:", buf)|| *(_QWORD *)v32 == *(_QWORD *)buf)
        {
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
          v18 = qword_1022A01C8;
          if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v27 = 68289026;
            v28 = 0;
            v29 = 2082;
            v30 = "";
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi,ZaxisStats,#warning Couldn't get Zaxis Stats\"}", v27, 0x12u);
          }
        }
        else
        {
          v14 = objc_alloc((Class)NSMutableDictionary);
          v15 = objc_msgSend(v14, "initWithCapacity:", (uint64_t)(*(_QWORD *)v32 - *(_QWORD *)buf) >> 3);
          if (v15)
          {
            v16 = *(_QWORD *)buf;
            if (**(double **)buf == 1.0)
            {
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8)), CFSTR("CurrentMCT"));
              v17 = 2;
              v16 = *(_QWORD *)buf;
            }
            else
            {
              v17 = 1;
            }
            v21 = v17 + 1;
            if (*(double *)(v16 + 8 * v17) == 1.0)
            {
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v16 + 8 * v21)), CFSTR("GNSSAvailabilityPredictionTime"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v17 + 2))), CFSTR("GNSSAvailabilityPredictionState"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v17 + 3))), CFSTR("GNSSAvailabilityPredictionProbability"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v17 | 4))), CFSTR("ALSDecisionTreeOutputTime"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v17 + 5))), CFSTR("ALSDecisionTreeOutput"));
              v21 = v17 + 6;
              v16 = *(_QWORD *)buf;
            }
            v22 = v21 + 1;
            if (*(double *)(v16 + 8 * v21) == 1.0)
            {
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v16 + 8 * v22)), CFSTR("LastAltitudeUpdateFromBaro"));
              v22 = v21 + 2;
              v16 = *(_QWORD *)buf;
            }
            v23 = v22 + 1;
            if (*(double *)(v16 + 8 * v22) == 1.0)
            {
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v16 + 8 * v23)), CFSTR("CurrentBaroAltitude"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v22 + 2))), CFSTR("CurrentBaroAltitudeUnc"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v22 + 3))), CFSTR("Undulation"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v22 + 4))), CFSTR("CalibratedAltitudeFromRefPressureAndDEM"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v22 + 5))), CFSTR("CalibratedAltitudeFromDEMOnly"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v22 + 6))), CFSTR("CalibratedAltitudeUpdateTime"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v22 + 7))), CFSTR("CLBaroBiasCfAbsTime_s"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v22 + 8))), CFSTR("CLBaroBias_pa"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v22 + 9))), CFSTR("CLBaroBiasUnc_m"));
              v23 = v22 + 10;
              v16 = *(_QWORD *)buf;
            }
            if (*(double *)(v16 + 8 * v23) == 1.0)
            {
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v16 + 8 * (v23 + 1))), CFSTR("CurrentWiFiAltitudeTimestamp"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v23 + 2))), CFSTR("CurrentWiFiAltitude"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)buf + 8 * (v23 + 3))), CFSTR("CurrentWiFiAltitudeUnc"));
            }
            (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, v15);

            goto LABEL_46;
          }
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
          v19 = qword_1022A01C8;
          if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v27 = 68289026;
            v28 = 0;
            v29 = 2082;
            v30 = "";
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi,ZaxisStats,#warning dictionary allocation failed\"}", v27, 0x12u);
          }
        }
      }
      else
      {
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
        v11 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v27 = 68289026;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi,,ZaxisStats,#warning Couldn't get vector capacity to fetch data\"}", v27, 0x12u);
        }
      }
      v20 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 0, 0);
      (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v20, 0);

LABEL_46:
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)v32 = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
      goto LABEL_20;
    }
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
  v12 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021D6A10);
    *(_WORD *)v27 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01C8, 0, "#Spi, connecting process isn't entitled, they shall not pass", v27, 2);
    v25 = (uint8_t *)v24;
    sub_100512490("Generic", 1, 0, 2, "-[CLInternalService getZaxisStatsWithReplyBlock:]", "%s\n", v24);
    if (v25 != buf)
      free(v25);
  }
  v13 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.internalservice.errorDomain"), 2, 0);
  (*((void (**)(id, id, _QWORD))a3 + 2))(a3, v13, 0);

LABEL_20:
  os_activity_scope_leave(&state);

}

- (double)groundAltitudeDistanceThreshold
{
  return self->_groundAltitudeDistanceThreshold;
}

- (void)setGroundAltitudeDistanceThreshold:(double)a3
{
  self->_groundAltitudeDistanceThreshold = a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
