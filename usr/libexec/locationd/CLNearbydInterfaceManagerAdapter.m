@implementation CLNearbydInterfaceManagerAdapter

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
  if (qword_1023100A8 != -1)
    dispatch_once(&qword_1023100A8, &stru_1021D6740);
  return (id)qword_1023100A0;
}

+ (BOOL)isSupported
{
  sub_100197040();
  if ((sub_1000C4240() & 1) != 0)
    return 1;
  sub_100197040();
  return sub_100195F08();
}

- (CLNearbydInterfaceManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLNearbydInterfaceManagerAdapter;
  return -[CLNearbydInterfaceManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLNearbydInterfaceManagerProtocol, &OBJC_PROTOCOL___CLNearbydInterfaceManagerClientProtocol);
}

- (void)setSilo:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D6760);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  objc_msgSend(a3, "suspend");
  v8.receiver = self;
  v8.super_class = (Class)CLNearbydInterfaceManagerAdapter;
  -[CLNearbydInterfaceManagerAdapter setSilo:](&v8, "setSilo:", a3);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D6760);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10188FA9C;
  v7[3] = &unk_1021436B8;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:completion:](IDSService, "serviceWithIdentifier:completion:", CFSTR("com.apple.private.alloy.regulatorysync"), v7);
}

- (void)beginService
{
  NSObject *v3;
  uint8_t buf[8];
  _WORD v5[812];

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D6760);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v5[0] = 2082;
    *(_QWORD *)&v5[1] = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,beginService\"}", buf, 0x12u);
  }
  -[CLNearbydInterfaceManagerAdapter universe](self, "universe");
  operator new();
}

- (void)endService
{
  uint64_t *p_fNearbydIfMgrInstance;
  CLNearbydInterfaceManager *value;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  p_fNearbydIfMgrInstance = (uint64_t *)&self->fNearbydIfMgrInstance;
  value = self->fNearbydIfMgrInstance.__ptr_.__value_;
  *((_QWORD *)value + 16) = 0;
  v5 = *((_QWORD *)value + 14);
  *((_QWORD *)value + 14) = 0;
  if (v5)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = *((_QWORD *)value + 13);
  *((_QWORD *)value + 13) = 0;
  if (v6)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
  v7 = *((_QWORD *)value + 15);
  *((_QWORD *)value + 15) = 0;
  if (v7)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v7 + 8))(v7, a2);
  sub_1018906F4(p_fNearbydIfMgrInstance, 0);
  -[CLNearbydInterfaceManagerAdapter setService:](self, "setService:", 0);
}

- (BOOL)isRegulatorySyncSupportedOnWatch:(id *)a3
{
  return a3->var0 > 7 || a3->var0 == 7 && a3->var1 > 3;
}

- (void)updateNearbyStatusWithDevices:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  NSObject *v12;
  NSString *v13;
  BOOL v14;
  CLNearbydInterfaceManager *value;
  NSObject *v16;
  CLNearbydInterfaceManager *v17;
  uint64_t *v18;
  uint64_t *v19;
  NSObject *v20;
  const char *v21;
  char *v22;
  const char *v23;
  char *v24;
  _QWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  _BYTE buf[1632];
  _BYTE v35[128];

  objc_msgSend(-[CLNearbydInterfaceManagerAdapter universe](self, "universe"), "silo");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v8)
  {
    v3 = v8;
    v9 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(a3);
        v4 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v4, "isDefaultPairedDevice") && objc_msgSend(v4, "isNearby"))
        {
          v11 = objc_msgSend(v4, "uniqueIDOverride");
          if (v4)
          {
            objc_msgSend(v4, "operatingSystemVersion");
            v4 = *(void **)buf;
            v3 = *(id *)&buf[8];
            v5 = *(_QWORD *)&buf[16];
          }
          else
          {
            v5 = 0;
            v3 = 0;
          }
          goto LABEL_14;
        }
      }
      v3 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v3)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:
  if ((objc_msgSend(v11, "isEqualToString:", -[CLNearbydInterfaceManagerAdapter nearbyPairUniqueID](self, "nearbyPairUniqueID")) & 1) == 0)
  {
    -[CLNearbydInterfaceManagerAdapter setNearbyPairUniqueID:](self, "setNearbyPairUniqueID:", v11);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[CLNearbydInterfaceManagerAdapter nearbyPairUniqueID](self, "nearbyPairUniqueID");
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = v13 != 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,Nearby status change\", \"is nearby\":%{public}d}", buf, 0x18u);
    }
    v25[0] = v4;
    v25[1] = v3;
    v25[2] = v5;
    self->_pairSupportsRegulatorySync = -[CLNearbydInterfaceManagerAdapter isRegulatorySyncSupportedOnWatch:](self, "isRegulatorySyncSupportedOnWatch:", v25);
    v14 = -[CLNearbydInterfaceManagerAdapter nearbyPairUniqueID](self, "nearbyPairUniqueID") != 0;
    value = self->fNearbydIfMgrInstance.__ptr_.__value_;
    *(_BYTE *)value = v14;
    *((_BYTE *)value + 1) = self->_pairSupportsRegulatorySync;
    if (-[CLNearbydInterfaceManagerAdapter nearbyPairUniqueID](self, "nearbyPairUniqueID"))
    {
      if (self->_pairSupportsRegulatorySync)
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021D6760);
        v16 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v4;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v3;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr, Phone found its paired watch, OS version number = %ld.%ld, Calling fNearbydIfMgrInstance->syncIsoCountry()", buf, 0x16u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_1021D6760);
          v30 = 134218240;
          v31 = v4;
          v32 = 2048;
          v33 = v3;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#NearbydIfMgr, Phone found its paired watch, OS version number = %ld.%ld, Calling fNearbydIfMgrInstance->syncIsoCountry()", &v30, 22);
          v22 = (char *)v21;
          sub_100512490("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter updateNearbyStatusWithDevices:]", "%s\n", v21);
          if (v22 != buf)
            free(v22);
        }
        v17 = self->fNearbydIfMgrInstance.__ptr_.__value_;
        v18 = sub_1001EE134((_QWORD *)v17 + 1, 0);
        if (v18)
        {
          *((_BYTE *)v18 + 48) = 1;
          sub_100259648(v18 + 7);
        }
        sub_101892340((uint64_t)v17, 0);
        v19 = sub_1001EE134((_QWORD *)v17 + 1, 1);
        if (v19)
        {
          *((_BYTE *)v19 + 48) = 1;
          sub_100259648(v19 + 7);
        }
        sub_101892340((uint64_t)v17, 1);
      }
      else
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021D6760);
        v20 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v4;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v3;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr, Phone found its paired watch, OS version number = %ld.%ld, watch does not support regulatorysync", buf, 0x16u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_1021D6760);
          v30 = 134218240;
          v31 = v4;
          v32 = 2048;
          v33 = v3;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#NearbydIfMgr, Phone found its paired watch, OS version number = %ld.%ld, watch does not support regulatorysync", &v30, 22);
          v24 = (char *)v23;
          sub_100512490("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter updateNearbyStatusWithDevices:]", "%s\n", v23);
          if (v24 != buf)
            free(v24);
        }
      }
    }
  }
}

- (BOOL)sendMessageToWatch:(id)a3 identifier:(id *)a4
{
  IDSService *v7;
  unsigned int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint8_t *v12;
  double v13;
  NSObject *v14;
  uint8_t *v15;
  NSObject *v16;
  id v17;
  id v18;
  const char *v19;
  uint8_t *v20;
  NSObject *v21;
  double v23;
  uint8_t *v24;
  uint64_t v25;
  int v26;
  _QWORD v27[3];
  uint8_t buf[4];
  _QWORD v29[204];

  objc_msgSend(-[CLNearbydInterfaceManagerAdapter universe](self, "universe"), "silo");
  if (!-[CLNearbydInterfaceManagerAdapter nearbyPairUniqueID](self, "nearbyPairUniqueID"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#NearbydIfMgr,sendMessageToWatch, returned early, watch is not nearby", buf, 2u);
    }
    LOBYTE(v10) = 0;
    if (!sub_1001BFF7C(115, 0))
      return v10;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    LOWORD(v26) = 0;
    v13 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 16, "#NearbydIfMgr,sendMessageToWatch, returned early, watch is not nearby", &v26, 2);
LABEL_26:
    v15 = v12;
    sub_100512490("Generic", 1, 0, 0, "-[CLNearbydInterfaceManagerAdapter sendMessageToWatch:identifier:]", "%s\n", v13);
    goto LABEL_46;
  }
  if (!self->_pairSupportsRegulatorySync)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    v14 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#NearbydIfMgr,sendMessageToWatch, returned early, watchOS does not support IDS regulatory sync", buf, 2u);
    }
    LOBYTE(v10) = 0;
    if (!sub_1001BFF7C(115, 0))
      return v10;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    LOWORD(v26) = 0;
    v13 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 16, "#NearbydIfMgr,sendMessageToWatch, returned early, watchOS does not support IDS regulatory sync", &v26, 2);
    goto LABEL_26;
  }
  *a4 = 0;
  v25 = 0;
  v7 = -[CLNearbydInterfaceManagerAdapter service](self, "service");
  v8 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v7, "sendMessage:toDestinations:priority:options:identifier:error:", a3, +[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice), 200, 0, a4, &v25);
  if (v25)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29[0] = v25;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,sendMessageToWatch, #warning got error from IDS, error, %@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_9;
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    v26 = 138412290;
    v27[0] = v25;
    v23 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#NearbydIfMgr,sendMessageToWatch, #warning got error from IDS, error, %@", &v26, 12);
    v15 = v24;
    sub_100512490("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter sendMessageToWatch:identifier:]", "%s\n", v23);
LABEL_46:
    if (v15 != buf)
      free(v15);
LABEL_9:
    LOBYTE(v10) = 0;
    return v10;
  }
  if (*a4)
  {
    v10 = v8;
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    v16 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *a4;
      *(_DWORD *)buf = 67109378;
      LODWORD(v29[0]) = v10;
      WORD2(v29[0]) = 2112;
      *(_QWORD *)((char *)v29 + 6) = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,sendMessageToWatch,recoverable=%d,identifier=%@", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D6760);
      v18 = *a4;
      v26 = 67109378;
      LODWORD(v27[0]) = v10;
      WORD2(v27[0]) = 2112;
      *(_QWORD *)((char *)v27 + 6) = v18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#NearbydIfMgr,sendMessageToWatch,recoverable=%d,identifier=%@", &v26, 18);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter sendMessageToWatch:identifier:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
    return v10;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D6760);
  v21 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "#NearbydIfMgr,sendMessageToWatch, No error, but also no identifier", buf, 2u);
  }
  LOBYTE(v10) = 0;
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    LOWORD(v26) = 0;
    v13 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 17, "#NearbydIfMgr,sendMessageToWatch, No error, but also no identifier", &v26, 2);
    goto LABEL_26;
  }
  return v10;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  objc_msgSend(-[CLNearbydInterfaceManagerAdapter universe](self, "universe", a3, a4, a5, a6, a7), "silo");
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v7;
  char *v10;
  NSObject *v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;
  NSObject *v15;
  void **v16;
  void **v17;
  const char *v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t *v21;
  NSObject *v22;
  int v23;
  void **v24;
  int v25;
  const char *v26;
  uint8_t *v27;
  int v28;
  void **v29;
  int v30;
  const char *v31;
  uint8_t *v32;
  const char *v33;
  __int128 v34;
  void *__p[2];
  char v36;
  int v37;
  _BYTE v38[14];
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  int v42;
  uint8_t buf[4];
  _BYTE v44[14];
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  int v48;

  v7 = a6;
  objc_msgSend(-[CLNearbydInterfaceManagerAdapter universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  if (a5)
    v10 = (char *)objc_msgSend(a5, "UTF8String");
  else
    v10 = "";
  sub_1015A2E04(__p, v10);
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D6760);
  v11 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v44 = a5;
    *(_WORD *)&v44[8] = 1024;
    *(_DWORD *)&v44[10] = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr, Calling processDidSendMsgWithSuccess,identifier=%@,success=%d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    v37 = 138412546;
    *(_QWORD *)v38 = a5;
    *(_WORD *)&v38[8] = 1024;
    *(_DWORD *)&v38[10] = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#NearbydIfMgr, Calling processDidSendMsgWithSuccess,identifier=%@,success=%d", &v37, 18);
    v27 = (uint8_t *)v26;
    sub_100512490("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter service:account:identifier:didSendWithSuccess:error:]", "%s\n", v26);
    if (v27 != buf)
      free(v27);
  }
  v13 = (uint64_t *)*((_QWORD *)self->fNearbydIfMgrInstance.__ptr_.__value_ + 3);
  if (v13)
  {
    *(_QWORD *)&v12 = 136315138;
    v34 = v12;
    while (1)
    {
      v14 = sub_100304CA0(v13[7], v13[8], (unsigned __int8 **)__p);
      if (v14 != v13[8])
        break;
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D6760);
      v15 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        if (v36 >= 0)
          v16 = __p;
        else
          v16 = (void **)__p[0];
        *(_DWORD *)buf = v34;
        *(_QWORD *)v44 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,#processDidSendMsgWithSuccess,could not find msgIdentifier:%s", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021D6760);
        if (v36 >= 0)
          v17 = __p;
        else
          v17 = (void **)__p[0];
        v37 = v34;
        *(_QWORD *)v38 = v17;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#NearbydIfMgr,#processDidSendMsgWithSuccess,could not find msgIdentifier:%s", (const char *)&v37);
        v19 = (uint8_t *)v18;
        sub_100512490("Generic", 1, 0, 2, "void CLNearbydInterfaceManager::processDidSendMsgWithSuccess(const std::string &, BOOL)", "%s\n", v18);
        if (v19 != buf)
          free(v19);
      }
      v13 = (uint64_t *)*v13;
      if (!v13)
        goto LABEL_39;
    }
    v20 = v14;
    v21 = v13 + 7;
    if (v7)
    {
      *((_BYTE *)v13 + 48) = 0;
      sub_100259648(v21);
    }
    else
    {
      sub_1011AE72C((uint64_t)v21, v20, (__int128 *)(v20 + 24));
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    v22 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v23 = -1431655765 * ((unint64_t)(v13[8] - v13[7]) >> 3);
      v24 = __p;
      if (v36 < 0)
        v24 = (void **)__p[0];
      v25 = *((unsigned __int8 *)v13 + 48);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v44 = v23;
      *(_WORD *)&v44[4] = 2080;
      *(_QWORD *)&v44[6] = v24;
      v45 = 1024;
      v46 = v7;
      v47 = 1024;
      v48 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,#processDidSendMsgWithSuccess, identifier was found & removed, savedMsgIdentifiers.size()=%d, identifier=%s, success=%d, sendIt=%d", buf, 0x1Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D6760);
      v28 = -1431655765 * ((unint64_t)(v13[8] - v13[7]) >> 3);
      v29 = __p;
      if (v36 < 0)
        v29 = (void **)__p[0];
      v30 = *((unsigned __int8 *)v13 + 48);
      v37 = 67109890;
      *(_DWORD *)v38 = v28;
      *(_WORD *)&v38[4] = 2080;
      *(_QWORD *)&v38[6] = v29;
      v39 = 1024;
      v40 = v7;
      v41 = 1024;
      v42 = v30;
      LODWORD(v33) = 30;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#NearbydIfMgr,#processDidSendMsgWithSuccess, identifier was found & removed, savedMsgIdentifiers.size()=%d, identifier=%s, success=%d, sendIt=%d", &v37, v33, (_DWORD)v34, DWORD2(v34));
      v32 = (uint8_t *)v31;
      sub_100512490("Generic", 1, 0, 2, "void CLNearbydInterfaceManager::processDidSendMsgWithSuccess(const std::string &, BOOL)", "%s\n", v31);
      if (v32 != buf)
        free(v32);
    }
  }
LABEL_39:
  if (v36 < 0)
    operator delete(__p[0]);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;

  objc_msgSend(-[CLNearbydInterfaceManagerAdapter universe](self, "universe", a3), "silo");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D6760);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,nearbyDevicesChanged\"}", (uint8_t *)v7, 0x12u);
  }
  -[CLNearbydInterfaceManagerAdapter updateNearbyStatusWithDevices:](self, "updateNearbyStatusWithDevices:", a4);
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  id v12;
  uint8_t buf[4];
  id v14;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D6760);
  v8 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,didSwitchActivePairedDevice,activePairedDevice=%@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D6760);
    v11 = 138412290;
    v12 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#NearbydIfMgr,didSwitchActivePairedDevice,activePairedDevice=%@", &v11, 12);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter service:didSwitchActivePairedDevice:acknowledgementBlock:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  (*((void (**)(id))a5 + 2))(a5);
  self->_nearbyPairUniqueID = 0;
  -[CLNearbydInterfaceManagerAdapter updateNearbyStatusWithDevices:](self, "updateNearbyStatusWithDevices:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a4, 0));
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)nearbyPairUniqueID
{
  return self->_nearbyPairUniqueID;
}

- (void)setNearbyPairUniqueID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)pairSupportsRegulatorySync
{
  return self->_pairSupportsRegulatorySync;
}

- (void)setPairSupportsRegulatorySync:(BOOL)a3
{
  self->_pairSupportsRegulatorySync = a3;
}

- (void).cxx_destruct
{
  sub_1018906F4((uint64_t *)&self->fNearbydIfMgrInstance, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
