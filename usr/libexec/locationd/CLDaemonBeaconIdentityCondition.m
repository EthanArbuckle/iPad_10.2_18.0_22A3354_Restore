@implementation CLDaemonBeaconIdentityCondition

- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 removePersistingFenceFromMonitoring:(BOOL)a8 callbackHandler:(id)a9
{
  _BOOL4 v9;
  id v16;
  id v17;
  CLDaemonBeaconIdentityCondition *v18;
  id v19;
  id *p_isa;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v27;
  objc_super v28;
  objc_super v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  id *v45;

  v9 = a8;
  v16 = objc_msgSend(a3, "major");
  v17 = objc_msgSend(a3, "minor");
  if (v17)
  {
    v29.receiver = self;
    v29.super_class = (Class)CLDaemonBeaconIdentityCondition;
    v18 = -[CLDaemonBeaconIdentityCondition initWithUUID:major:minor:](&v29, "initWithUUID:major:minor:", objc_msgSend(a3, "UUID"), objc_msgSend(v16, "unsignedShortValue"), objc_msgSend(v17, "unsignedShortValue"));
  }
  else
  {
    v19 = objc_msgSend(a3, "UUID");
    if (v16)
    {
      v28.receiver = self;
      v28.super_class = (Class)CLDaemonBeaconIdentityCondition;
      v18 = -[CLDaemonBeaconIdentityCondition initWithUUID:major:](&v28, "initWithUUID:major:", v19, objc_msgSend(v16, "unsignedShortValue"));
    }
    else
    {
      v27.receiver = self;
      v27.super_class = (Class)CLDaemonBeaconIdentityCondition;
      v18 = -[CLDaemonBeaconIdentityCondition initWithUUID:](&v27, "initWithUUID:", v19);
    }
  }
  p_isa = (id *)&v18->super.super.super.isa;
  if (v18)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
    v21 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(p_isa, "UUID");
      v23 = objc_msgSend(p_isa, "major");
      v24 = objc_msgSend(p_isa, "minor");
      *(_DWORD *)buf = 68290563;
      v32 = 2082;
      v31 = 0;
      v33 = "";
      v34 = 2113;
      v35 = v22;
      v36 = 2113;
      v37 = v23;
      v38 = 2113;
      v39 = v24;
      v40 = 2114;
      v41 = a7;
      v42 = 1026;
      v43 = v9;
      v44 = 2050;
      v45 = p_isa;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition created\", \"UUID\":%{private, location:escape_only}@, \"major\":%{private, location:escape_only}@, \"minor\":%{private, location:escape_only}@, \"identifier\":%{public, location:escape_only}@, \"removePersistingFenceFromMonitoring\":%{public}hhd, \"self\":\"%{public}p\"}", buf, 0x4Au);
    }
    objc_msgSend(p_isa, "setAuthorizationContext:", a5);
    objc_msgSend(p_isa, "setUniverse:", a6);
    objc_msgSend(p_isa, "setOnConditionUpdateCallbackHandler:", a9);
    objc_msgSend(p_isa, "setCkp:", a4);
    v25 = objc_msgSend(objc_msgSend(a6, "vendor"), "proxyForService:", CFSTR("CLBTLEFenceManager"));
    p_isa[1] = v25;
    objc_msgSend(v25, "registerDelegate:inSilo:", p_isa, objc_msgSend(objc_msgSend(p_isa, "universe"), "silo"));
    objc_msgSend(p_isa[1], "setDelegateEntityName:", -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-DaemonBeaconIdentityCondition"), objc_msgSend(p_isa, "identifier")), "UTF8String"));
    objc_msgSend(p_isa, "setValid:", 1);
    objc_msgSend(p_isa, "setIdentifier:", a7);
    if (v9)
      objc_msgSend(p_isa, "stopMonitoring");
    else
      objc_msgSend(p_isa, "startMonitoring");
  }
  return p_isa;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  CLDaemonBeaconIdentityCondition *v10;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2050;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition dealloc\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  -[CLDaemonBeaconIdentityCondition stopMonitoring](self, "stopMonitoring");

  self->_btleFenceManagerProxy = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonBeaconIdentityCondition;
  -[CLDaemonBeaconIdentityCondition dealloc](&v4, "dealloc");
}

- (MonitoredRegion)getBeaconRegion
{
  void *v1;
  void *v2;
  MonitoredRegion *result;
  void *__p[2];
  char v6;
  void *v7[2];
  char v8;
  __int128 v9;
  char v10;

  v2 = v1;
  sub_1015A2E04(&v9, (char *)objc_msgSend(objc_msgSend(objc_msgSend(v1, "ckp"), "legacyClientKey"), "UTF8String"));
  sub_1015A2E04(v7, (char *)objc_msgSend(objc_msgSend(v2, "identifier"), "UTF8String"));
  sub_1015A2E04(__p, "");
  sub_1004E5948((uint64_t)retstr, &v9, (__int128 *)v7, (__int128 *)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  if (v8 < 0)
    operator delete(v7[0]);
  if (v10 < 0)
    operator delete((void *)v9);
  *(_DWORD *)&retstr->var1.__r_.var1 = 0;
  if (objc_msgSend(v2, "UUID"))
  {
    *(_DWORD *)&retstr->var1.__r_.var1 |= 1u;
    std::string::assign((std::string *)&retstr->var1, (const std::string::value_type *)objc_msgSend(objc_msgSend(objc_msgSend(v2, "UUID"), "UUIDString"), "UTF8String"));
  }
  if (objc_msgSend(v2, "major"))
  {
    *(_DWORD *)&retstr->var1.__r_.var1 |= 2u;
    LOWORD(retstr->var1.__r_.var0) = (unsigned __int16)objc_msgSend(objc_msgSend(v2, "major"), "unsignedShortValue");
  }
  result = (MonitoredRegion *)objc_msgSend(v2, "minor");
  if (result)
  {
    *(_DWORD *)&retstr->var1.__r_.var1 |= 4u;
    result = (MonitoredRegion *)objc_msgSend(objc_msgSend(v2, "minor"), "unsignedShortValue");
    HIWORD(retstr->var1.__r_.var0) = (_WORD)result;
  }
  LODWORD(retstr[2].var1.__r_.__value_.var0.var1.__size_) = 259;
  return result;
}

- (void)startMonitoring
{
  NSObject *v3;
  NSObject *v4;
  void *__p;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  CLDaemonBeaconIdentityCondition *v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  unsigned int v15;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289794;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2050;
    v11 = self;
    v12 = 1026;
    v13 = -[CLDaemonBeaconIdentityCondition isAuthorized](self, "isAuthorized");
    v14 = 1026;
    v15 = -[CLDaemonBeaconIdentityCondition isMonitoring](self, "isMonitoring");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #beaconIdentityCondition startMonitoring\", \"self\":\"%{public}p\", \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", buf, 0x28u);
  }
  if ((-[CLDaemonBeaconIdentityCondition isMonitoring](self, "isMonitoring") & 1) == 0)
  {
    if (-[CLDaemonBeaconIdentityCondition isAuthorized](self, "isAuthorized"))
    {
      -[CLDaemonBeaconIdentityCondition setIsMonitoring:](self, "setIsMonitoring:", 1);
      sub_1015A2E04(&__p, (char *)objc_msgSend(objc_msgSend(-[CLDaemonBeaconIdentityCondition ckp](self, "ckp"), "legacyClientKey"), "UTF8String"));
      sub_100F6B650();
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
    v4 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2050;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #beaconIdentityCondition startMonitoring not authorized\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    }
  }
}

- (void)stopMonitoring
{
  NSObject *v3;
  CLBTLEFenceManagerProtocol *btleFenceManagerProxy;
  _BYTE v5[120];
  uint8_t buf[48];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2050;
    *(_QWORD *)&buf[20] = self;
    *(_WORD *)&buf[28] = 1026;
    *(_DWORD *)&buf[30] = -[CLDaemonBeaconIdentityCondition isAuthorized](self, "isAuthorized");
    *(_WORD *)&buf[34] = 1026;
    *(_DWORD *)&buf[36] = -[CLDaemonBeaconIdentityCondition isMonitoring](self, "isMonitoring");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition stopMonitoring\", \"self\":\"%{public}p\", \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", buf, 0x28u);
  }
  if (-[CLDaemonBeaconIdentityCondition isMonitoring](self, "isMonitoring"))
  {
    if (self)
    {
      -[CLDaemonBeaconIdentityCondition getBeaconRegion](self, "getBeaconRegion");
    }
    else
    {
      v11 = 0;
      v9 = 0u;
      v10 = 0u;
      v7 = 0u;
      v8 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    btleFenceManagerProxy = self->_btleFenceManagerProxy;
    sub_1004E5FB0((uint64_t)v5, (uint64_t)buf);
    -[CLBTLEFenceManagerProtocol removeMonitoredRegion:](btleFenceManagerProxy, "removeMonitoredRegion:", sub_1010C0D7C((uint64_t)v5));
    sub_100114750((uint64_t)v5);
    -[CLBTLEFenceManagerProtocol unregister:forNotification:](self->_btleFenceManagerProxy, "unregister:forNotification:", self, 2);
    -[CLBTLEFenceManagerProtocol unregister:forNotification:](self->_btleFenceManagerProxy, "unregister:forNotification:", self, 3);
    -[CLDaemonBeaconIdentityCondition setIsMonitoring:](self, "setIsMonitoring:", 0);
    -[CLDaemonBeaconIdentityCondition setLastMonitoringState:](self, "setLastMonitoringState:", 0);
    -[CLDaemonBeaconIdentityCondition setRefinement:](self, "setRefinement:", 0);
    sub_100114750((uint64_t)buf);
  }
}

- (BOOL)isAuthorized
{
  return objc_msgSend(-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 524289);
}

- (unint64_t)diagnosticMaskIfNonFunctional
{
  unint64_t v3;
  unint64_t v4;

  if ((-[CLDaemonBeaconIdentityCondition isMonitoring](self, "isMonitoring") & 1) != 0)
    return 0;
  if ((int)objc_msgSend(-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext"), "inUseLevel") <= 0)v3 = 16* (objc_msgSend(-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext"), "transientAwareRegistrationResult") != 0);
  else
    v3 = 0;
  if (!objc_msgSend(-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceType:", 12))v3 |= 0x40uLL;
  v4 = v3 | 0x1000;
  if (objc_msgSend(-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 1))v3 |= 0x1000uLL;
  if ((objc_msgSend(-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 0x100000) & 1) == 0&& objc_msgSend(-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext"), "transientAwareRegistrationResult") == 4)
  {
    return v4;
  }
  return v3;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  char *v9;
  int v10;
  int v11;
  id v12;
  _QWORD *v13;
  int v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  void (**v23)(id, id, CLDaemonBeaconIdentityCondition *, uint64_t, void *);
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  uint8_t v30[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  _BYTE v35[10];
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  CLDaemonBeaconIdentityCondition *v47;
  _QWORD *v48;
  char v49;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v41 = 0;
    v42 = 2082;
    v43 = "";
    v44 = 2050;
    v45 = a3;
    v46 = 2050;
    v47 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition received notification\", \"notification\":%{public, location:CLBTLEFenceManager_Type::Notification}lld, \"self\":\"%{public}p\"}", buf, 0x26u);
  }
  v9 = (char *)sub_1007A2B68(a4, v8);
  v10 = *((_DWORD *)v9 + 42);
  v11 = *((_DWORD *)v9 + 30);
  sub_1004E5FB0((uint64_t)buf, (uint64_t)v9);
  if (-[CLDaemonBeaconIdentityCondition isMonitoring](self, "isMonitoring")
    && -[CLDaemonBeaconIdentityCondition onConditionUpdateCallbackHandler](self, "onConditionUpdateCallbackHandler"))
  {
    v12 = -[CLDaemonBeaconIdentityCondition identifier](self, "identifier");
    v13 = v49 >= 0 ? &v48 : v48;
    if ((objc_msgSend(v12, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13)) & 1) != 0)
    {
      if (v11)
      {
        v14 = 0;
        v15 = 3;
      }
      else if (v10 == 4)
      {
        v14 = 0;
        v15 = 2;
      }
      else
      {
        if (v10 != 2)
        {
          if (qword_1022A01D0 != -1)
            goto LABEL_58;
          while (1)
          {
            v24 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
            {
              v25 = *((_DWORD *)v9 + 42);
              *(_DWORD *)v30 = 68290051;
              v31 = 0;
              v32 = 2082;
              v33 = "";
              v34 = 1026;
              *(_DWORD *)v35 = a3;
              *(_WORD *)&v35[4] = 1026;
              *(_DWORD *)&v35[6] = v25;
              v36 = 2082;
              v37 = "assert";
              v38 = 2081;
              v39 = "region";
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition Region is nil\", \"notification\":%{public}d, \"state\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v30, 0x32u);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
            }
            v26 = qword_1022A01D8;
            if (os_signpost_enabled((os_log_t)qword_1022A01D8))
            {
              v27 = *((_DWORD *)v9 + 42);
              *(_DWORD *)v30 = 68290051;
              v31 = 0;
              v32 = 2082;
              v33 = "";
              v34 = 1026;
              *(_DWORD *)v35 = a3;
              *(_WORD *)&v35[4] = 1026;
              *(_DWORD *)&v35[6] = v27;
              v36 = 2082;
              v37 = "assert";
              v38 = 2081;
              v39 = "region";
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#beaconIdentityCondition Region is nil", "{\"msg%{public}.0s\":\"#beaconIdentityCondition Region is nil\", \"notification\":%{public}d, \"state\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v30, 0x32u);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
            }
            v28 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
            {
              v29 = *((_DWORD *)v9 + 42);
              *(_DWORD *)v30 = 68290051;
              v31 = 0;
              v32 = 2082;
              v33 = "";
              v34 = 1026;
              *(_DWORD *)v35 = a3;
              *(_WORD *)&v35[4] = 1026;
              *(_DWORD *)&v35[6] = v29;
              v36 = 2082;
              v37 = "assert";
              v38 = 2081;
              v39 = "region";
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#beaconIdentityCondition Region is nil\", \"notification\":%{public}d, \"state\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v30, 0x32u);
            }
            abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/DaemonIdentifiableClients/CLDaemonBeaconIdentityCondition.mm", 244, "-[CLDaemonBeaconIdentityCondition onNotification:withData:]");
            __break(1u);
LABEL_58:
            dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
          }
        }
        v9 += 128;
        v14 = 1;
        v15 = 1;
      }
      v16 = objc_alloc((Class)NSUUID);
      v17 = v9 + 8;
      if (v9[31] < 0)
        v17 = (_QWORD *)*v17;
      v18 = objc_msgSend(v16, "initWithUUIDString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
      if ((v9[36] & 1) == 0
        || !objc_msgSend(-[CLDaemonBeaconIdentityCondition UUID](self, "UUID"), "isEqual:", v18))
      {
        goto LABEL_35;
      }
      if ((v9[36] & 2) != 0)
      {
        if (-[CLDaemonBeaconIdentityCondition major](self, "major")
          && objc_msgSend(-[CLDaemonBeaconIdentityCondition major](self, "major"), "unsignedShortValue") != *((unsigned __int16 *)v9 + 16))
        {
          goto LABEL_35;
        }
        v19 = 2;
      }
      else
      {
        v19 = 1;
      }
      if ((v9[36] & 4) == 0)
        goto LABEL_30;
      if (!-[CLDaemonBeaconIdentityCondition minor](self, "minor")
        || objc_msgSend(-[CLDaemonBeaconIdentityCondition minor](self, "minor"), "unsignedShortValue") == *((unsigned __int16 *)v9 + 17))
      {
        ++v19;
LABEL_30:
        if (!v14)
        {
          v21 = 0;
LABEL_47:
          -[CLDaemonBeaconIdentityCondition setLastMonitoringState:](self, "setLastMonitoringState:", v15);
          -[CLDaemonBeaconIdentityCondition setRefinement:](self, "setRefinement:", v21);
          v23 = (void (**)(id, id, CLDaemonBeaconIdentityCondition *, uint64_t, void *))-[CLDaemonBeaconIdentityCondition onConditionUpdateCallbackHandler](self, "onConditionUpdateCallbackHandler");
          v23[2](v23, -[CLDaemonBeaconIdentityCondition monitoredIdentifier](self, "monitoredIdentifier"), self, v15, v21);
          goto LABEL_36;
        }
        switch(v19)
        {
          case 3:
            v20 = objc_msgSend(objc_alloc((Class)CLBeaconIdentityCondition), "initWithUUID:major:minor:", v18, *((unsigned __int16 *)v9 + 16), *((unsigned __int16 *)v9 + 17));
            break;
          case 2:
            v20 = objc_msgSend(objc_alloc((Class)CLBeaconIdentityCondition), "initWithUUID:major:", v18, *((unsigned __int16 *)v9 + 16));
            break;
          case 1:
            v20 = objc_msgSend(objc_alloc((Class)CLBeaconIdentityCondition), "initWithUUID:", v18);
            break;
          default:
            v21 = 0;
            goto LABEL_43;
        }
        v21 = v20;
LABEL_43:
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10219FAE0);
        v22 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v30 = 68289283;
          v31 = 0;
          v32 = 2082;
          v33 = "";
          v34 = 2113;
          *(_QWORD *)v35 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition received event\", \"condition\":%{private, location:escape_only}@}", v30, 0x1Cu);
        }
        goto LABEL_47;
      }
LABEL_35:
      v21 = 0;
LABEL_36:

    }
  }
  sub_100114750((uint64_t)buf);
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

@end
