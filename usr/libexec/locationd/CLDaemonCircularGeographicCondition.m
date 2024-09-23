@implementation CLDaemonCircularGeographicCondition

- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 removePersistingFenceFromMonitoring:(BOOL)a8 callbackHandler:(id)a9
{
  _BOOL4 v9;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CLDaemonCircularGeographicCondition *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CLFenceManagerProtocol *v28;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  CLDaemonCircularGeographicCondition *v46;

  v9 = a8;
  objc_msgSend(a3, "center");
  v17 = v16;
  v19 = v18;
  objc_msgSend(a3, "radius");
  v30.receiver = self;
  v30.super_class = (Class)CLDaemonCircularGeographicCondition;
  v21 = -[CLDaemonCircularGeographicCondition initWithCenter:radius:](&v30, "initWithCenter:radius:", v17, v19, v20);
  if (v21)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195A20);
    v22 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      -[CLDaemonCircularGeographicCondition center](v21, "center");
      v24 = v23;
      -[CLDaemonCircularGeographicCondition center](v21, "center");
      v26 = v25;
      -[CLDaemonCircularGeographicCondition radius](v21, "radius");
      *(_DWORD *)buf = 68290563;
      v32 = 0;
      v33 = 2082;
      v34 = "";
      v35 = 2049;
      v36 = v24;
      v37 = 2049;
      v38 = v26;
      v39 = 2050;
      v40 = v27;
      v41 = 2114;
      v42 = a7;
      v43 = 1026;
      v44 = v9;
      v45 = 2050;
      v46 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#circularGeographicCondition created\", \"lat\":\"%{private}.08f\", \"lon\":\"%{private}.08f\", \"radius\":\"%{public}f\", \"identifier\":%{public, location:escape_only}@, \"removePersistingFenceFromMonitoring\":%{public}hhd, \"self\":\"%{public}p\"}", buf, 0x4Au);
    }
    -[CLDaemonCircularGeographicCondition setAuthorizationContext:](v21, "setAuthorizationContext:", a5);
    -[CLDaemonCircularGeographicCondition setOnConditionUpdateCallbackHandler:](v21, "setOnConditionUpdateCallbackHandler:", a9);
    -[CLDaemonCircularGeographicCondition setUniverse:](v21, "setUniverse:", a6);
    -[CLDaemonCircularGeographicCondition setCkp:](v21, "setCkp:", a4);
    -[CLDaemonCircularGeographicCondition setLastMonitoringState:](v21, "setLastMonitoringState:", 0);
    v28 = (CLFenceManagerProtocol *)objc_msgSend(objc_msgSend(a6, "vendor"), "proxyForService:", CFSTR("CLFenceManager"));
    v21->_fenceManagerProxy = v28;
    -[CLFenceManagerProtocol registerDelegate:inSilo:](v28, "registerDelegate:inSilo:", v21, objc_msgSend(-[CLDaemonCircularGeographicCondition universe](v21, "universe"), "silo"));
    -[CLFenceManagerProtocol setDelegateEntityName:](v21->_fenceManagerProxy, "setDelegateEntityName:", -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-DaemonCircularGeographicCondition"), a7), "UTF8String"));
    -[CLDaemonCircularGeographicCondition setValid:](v21, "setValid:", 1);
    -[CLDaemonCircularGeographicCondition setIdentifier:](v21, "setIdentifier:", a7);
    if (v9)
      -[CLDaemonCircularGeographicCondition stopMonitoring](v21, "stopMonitoring");
    else
      -[CLDaemonCircularGeographicCondition startMonitoring](v21, "startMonitoring");
  }
  return v21;
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
  CLDaemonCircularGeographicCondition *v10;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102195A20);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2050;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#circularGeographicCondition dealloc\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  -[CLDaemonCircularGeographicCondition stopMonitoring](self, "stopMonitoring");

  self->_fenceManagerProxy = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonCircularGeographicCondition;
  -[CLDaemonCircularGeographicCondition dealloc](&v4, "dealloc");
}

- (BOOL)isAuthorized
{
  return objc_msgSend(-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 524290);
}

- (void)startMonitoring
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t buf[8];
  __int16 v8;
  const char *v9;
  __int16 v10;
  CLDaemonCircularGeographicCondition *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102195A20);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&buf[4] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2050;
    v11 = self;
    v12 = 2114;
    v13 = -[CLDaemonCircularGeographicCondition identifier](self, "identifier");
    v14 = 1026;
    v15 = -[CLDaemonCircularGeographicCondition isAuthorized](self, "isAuthorized");
    v16 = 1026;
    v17 = -[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #circularGeographicCondition startMonitoring\", \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@, \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", buf, 0x32u);
  }
  if ((-[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring") & 1) == 0)
  {
    if (-[CLDaemonCircularGeographicCondition isAuthorized](self, "isAuthorized"))
    {
      -[CLDaemonCircularGeographicCondition setIsMonitoring:](self, "setIsMonitoring:", 1);
      sub_1015A2E04(&v6, (char *)objc_msgSend(objc_msgSend(-[CLDaemonCircularGeographicCondition ckp](self, "ckp"), "legacyClientKey"), "UTF8String"));
      sub_100F6B650();
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195A20);
    v4 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[CLDaemonCircularGeographicCondition identifier](self, "identifier");
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2050;
      v11 = self;
      v12 = 2114;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #circularGeographicCondition startMonitoring not authorized\", \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@}", buf, 0x26u);
    }
  }
}

- (void)stopMonitoring
{
  NSObject *v3;
  CLFenceManagerProtocol *fenceManagerProxy;
  void *v5[2];
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *__p[2];
  char v17;
  void *v18[2];
  char v19;
  void *v20[2];
  char v21;
  uint8_t buf[8];
  __int16 v23;
  const char *v24;
  __int16 v25;
  _BYTE v26[18];
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  _BYTE v30[10];
  char v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102195A20);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&buf[4] = 0;
    v23 = 2082;
    v24 = "";
    v25 = 2050;
    *(_QWORD *)v26 = self;
    *(_WORD *)&v26[8] = 2114;
    *(_QWORD *)&v26[10] = -[CLDaemonCircularGeographicCondition identifier](self, "identifier");
    v27 = 1026;
    v28 = -[CLDaemonCircularGeographicCondition isAuthorized](self, "isAuthorized");
    v29 = 1026;
    *(_DWORD *)v30 = -[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #circularGeographicCondition stopMonitoring\", \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@, \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", buf, 0x32u);
  }
  if (-[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring"))
  {
    sub_1015A2E04(v20, (char *)objc_msgSend(objc_msgSend(-[CLDaemonCircularGeographicCondition ckp](self, "ckp"), "legacyClientKey"), "UTF8String"));
    sub_1015A2E04(v18, (char *)objc_msgSend(-[CLDaemonCircularGeographicCondition identifier](self, "identifier"), "UTF8String"));
    sub_1015A2E04(__p, "");
    sub_1001158A8((char *)buf, (uint64_t)v20, (uint64_t)v18, (uint64_t)__p);
    if (v17 < 0)
      operator delete(__p[0]);
    if (v19 < 0)
      operator delete(v18[0]);
    if (v21 < 0)
      operator delete(v20[0]);
    fenceManagerProxy = self->_fenceManagerProxy;
    sub_1004E5748((char *)v5, (__int128 *)buf);
    -[CLFenceManagerProtocol removeFence:](fenceManagerProxy, "removeFence:", sub_1004E2AE4((__int128 *)v5));
    if (v14)
    {
      v15 = v14;
      operator delete(v14);
    }

    if (v12 < 0)
      operator delete(v11);
    if (v10 < 0)
      operator delete(v9);
    if (v8 < 0)
      operator delete(v7);
    if (v6 < 0)
      operator delete(v5[0]);
    -[CLFenceManagerProtocol unregister:forNotification:](self->_fenceManagerProxy, "unregister:forNotification:", self, 8);
    -[CLFenceManagerProtocol unregister:forNotification:](self->_fenceManagerProxy, "unregister:forNotification:", self, 1);
    -[CLFenceManagerProtocol unregister:forNotification:](self->_fenceManagerProxy, "unregister:forNotification:", self, 0);
    -[CLFenceManagerProtocol unregister:forNotification:](self->_fenceManagerProxy, "unregister:forNotification:", self, 4);
    -[CLFenceManagerProtocol unregister:forNotification:](self->_fenceManagerProxy, "unregister:forNotification:", self, 7);
    -[CLDaemonCircularGeographicCondition setIsMonitoring:](self, "setIsMonitoring:", 0);
    -[CLDaemonCircularGeographicCondition setLastMonitoringState:](self, "setLastMonitoringState:", 0);
    -[CLDaemonCircularGeographicCondition setRefinement:](self, "setRefinement:", 0);
    if (v35)
    {
      v36 = v35;
      operator delete(v35);
    }

    if (v33 < 0)
      operator delete(v32);
    if (v31 < 0)
      operator delete(*(void **)&v30[2]);
    if ((v30[1] & 0x80000000) != 0)
      operator delete(*(void **)&v26[4]);
    if ((v26[3] & 0x80000000) != 0)
      operator delete(*(void **)buf);
  }
}

- (unint64_t)diagnosticMaskIfNonFunctional
{
  unint64_t v3;
  unint64_t v4;

  if ((-[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring") & 1) != 0)
    return 0;
  if ((int)objc_msgSend(-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"), "inUseLevel") <= 0)v3 = 16* (objc_msgSend(-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"), "transientAwareRegistrationResult") != 0);
  else
    v3 = 0;
  if (!objc_msgSend(-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceType:", 12))v3 |= 0x40uLL;
  v4 = v3 | 0x1000;
  if (objc_msgSend(-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 2))v3 |= 0x1000uLL;
  if ((objc_msgSend(-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 0x100000) & 1) == 0&& objc_msgSend(-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"), "transientAwareRegistrationResult") == 4)
  {
    return v4;
  }
  return v3;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  char *v6;
  int v7;
  id v8;
  _QWORD *v9;
  NSObject *v10;
  void **v11;
  CLLocationCoordinate2D v12;
  id v13;
  uint64_t v14;
  NSObject *v16;
  void (**v17)(id, id, CLDaemonCircularGeographicCondition *, uint64_t, _QWORD);
  void *__p[2];
  char v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  CLDaemonCircularGeographicCondition *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  CLDaemonCircularGeographicCondition *v29;
  __int16 v30;
  uint64_t v31;

  v6 = (char *)sub_10091C4E0(a4, (uint64_t)a2);
  v7 = *((_DWORD *)v6 + 163);
  v8 = -[CLDaemonCircularGeographicCondition identifier](self, "identifier");
  v9 = v6 + 24;
  if (v6[47] < 0)
    v9 = (_QWORD *)*v9;
  if (objc_msgSend(v8, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9)))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102195A20);
    v10 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      sub_100C3B9BC((uint64_t)v6, __p);
      v11 = v19 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 68290051;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2050;
      v25 = (CLDaemonCircularGeographicCondition *)a3;
      v26 = 2081;
      v27 = (uint64_t)v11;
      v28 = 2050;
      v29 = self;
      v30 = 2049;
      v31 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#circularGeographicCondition received notification\", \"notification\":%{public, location:CLFenceManager_Type::Notification}lld, \"fence\":%{private, location:escape_only}s, \"self\":\"%{public}p\", \"status\":%{private, location:CLFenceManager_Type::FenceStatus}lld}", buf, 0x3Au);
      if (v19 < 0)
        operator delete(__p[0]);
    }
    v12 = CLLocationCoordinate2DMake(*((CLLocationDegrees *)v6 + 9), *((CLLocationDegrees *)v6 + 10));
    v13 = objc_msgSend(objc_alloc((Class)CLCircularGeographicCondition), "initWithCenter:radius:", v12.latitude, v12.longitude, *((double *)v6 + 11));
    v14 = 2;
    if (a3 != 1 && v7 != 1)
    {
      v14 = 1;
      if (a3)
      {
        if (v7)
        {
          if (a3 == 4 || a3 == 7)
            v14 = 3;
          else
            v14 = 0;
        }
      }
    }
    if (-[CLDaemonCircularGeographicCondition isEqual:](self, "isEqual:", v13)
      && -[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring"))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102195A20);
      v16 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289795;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2113;
        v25 = self;
        v26 = 2050;
        v27 = v14;
        v28 = 2050;
        v29 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#circularGeographicCondition received state update\", \"condition\":%{private, location:escape_only}@, \"monitoringState\":%{public, location:CLMonitoringState}lld, \"self\":\"%{public}p\"}", buf, 0x30u);
      }
      -[CLDaemonCircularGeographicCondition setLastMonitoringState:](self, "setLastMonitoringState:", v14);
      if (-[CLDaemonCircularGeographicCondition onConditionUpdateCallbackHandler](self, "onConditionUpdateCallbackHandler"))
      {
        v17 = (void (**)(id, id, CLDaemonCircularGeographicCondition *, uint64_t, _QWORD))-[CLDaemonCircularGeographicCondition onConditionUpdateCallbackHandler](self, "onConditionUpdateCallbackHandler");
        v17[2](v17, -[CLDaemonCircularGeographicCondition monitoredIdentifier](self, "monitoredIdentifier"), self, v14, 0);
      }
    }
  }
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
