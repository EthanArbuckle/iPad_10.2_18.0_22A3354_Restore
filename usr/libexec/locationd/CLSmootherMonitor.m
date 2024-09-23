@implementation CLSmootherMonitor

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
  if (qword_10230F1C0 != -1)
    dispatch_once(&qword_10230F1C0, &stru_1021B78B0);
  return (id)qword_10230F1B8;
}

- (CLSmootherMonitor)init
{
  CLSmootherMonitor *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSmootherMonitor;
  v2 = -[CLSmootherMonitor initWithInboundProtocol:outboundProtocol:](&v7, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSmootherMonitorServiceProtocol, &OBJC_PROTOCOL___CLSmootherMonitorClientProtocol);
  if (v2)
  {
    v3 = qword_102314060;
    qword_102314060 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    v4 = qword_102314068;
    qword_102314068 = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    v5 = qword_102314070;
    qword_102314070 = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    byte_1023140B0 = 0;
    byte_1023140B1 = 0;
    byte_1023140B2 = 0;
  }
  return v2;
}

- (void)beginService
{
  NSObject *v3;
  NSXPCListener *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  CLRoutineMonitorServiceProtocol *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (qword_1022A00B0 != -1)
    dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
  v3 = qword_1022A00B8;
  if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRS,beginService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 0, "CLRS,beginService", v9, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor beginService]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  v4 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.locationd.smoother"));
  self->_listener = v4;
  -[NSXPCListener _setQueue:](v4, "_setQueue:", objc_msgSend(-[CLSmootherMonitor silo](self, "silo"), "queue"));
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.locationd.smoother"), 0, 0, 1u);
  -[CLSmootherMonitor registerForCompanionNotification](self, "registerForCompanionNotification");
  -[CLSmootherMonitor registerForDaemonStatusNotification](self, "registerForDaemonStatusNotification");
  -[CLSmootherMonitor registerForTelephonyNotification](self, "registerForTelephonyNotification");
  self->_smootherMonitorRoutineAdapter = objc_alloc_init(CLSmootherMonitorRoutineAdapter);
  v6 = (CLRoutineMonitorServiceProtocol *)objc_msgSend(objc_msgSend(-[CLSmootherMonitor universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLRoutineMonitor"));
  self->_routineMonitor = v6;
  -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v6, "registerDelegate:inSilo:", self->_smootherMonitorRoutineAdapter, objc_msgSend(-[CLSmootherMonitor universe](self, "universe"), "silo"));
}

- (void)endService
{
  NSObject *v3;
  CLRoutineMonitorServiceProtocol *routineMonitor;
  CLSmootherMonitorRoutineAdapter *smootherMonitorRoutineAdapter;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A00B0 != -1)
    dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
  v3 = qword_1022A00B8;
  if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRS,endService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 0, "CLRS,endService", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor endService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  -[NSXPCConnection invalidate](-[CLSmootherMonitor connection](self, "connection"), "invalidate");
  -[CLSmootherMonitor setConnection:](self, "setConnection:", 0);
  -[NSXPCListener invalidate](-[CLSmootherMonitor listener](self, "listener"), "invalidate");
  -[CLSmootherMonitor setListener:](self, "setListener:", 0);
  -[CLSmootherMonitor unregisterForCompanionNotification](self, "unregisterForCompanionNotification");
  -[CLSmootherMonitor unregisterForDaemonStatusNotification](self, "unregisterForDaemonStatusNotification");
  -[CLSmootherMonitor unregisterForTelephonyNotification](self, "unregisterForTelephonyNotification");
  routineMonitor = self->_routineMonitor;
  if (routineMonitor)

  self->_routineMonitor = 0;
  smootherMonitorRoutineAdapter = self->_smootherMonitorRoutineAdapter;
  if (smootherMonitorRoutineAdapter)
  {
    -[CLSmootherMonitorRoutineAdapter invalidate](smootherMonitorRoutineAdapter, "invalidate");

  }
  self->_smootherMonitorRoutineAdapter = 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLSmootherMonitor;
  -[CLSmootherMonitor dealloc](&v2, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  NSObject *v32;
  unsigned int v33;
  audit_token_t *v34;
  uint64_t v35;
  unsigned int v36;
  std::string *v37;
  char *v38;
  char *v39;
  NSObject *v40;
  const char *v41;
  audit_token_t *v42;
  const char *v43;
  audit_token_t *v44;
  const char *v45;
  uint64_t v47;
  _QWORD v48[5];
  _QWORD v49[5];
  audit_token_t __p;
  std::string v51;
  _DWORD v52[2];
  __int16 v53;
  std::string *v54;
  audit_token_t buf[51];

  if (qword_1022A00B0 != -1)
    dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
  v6 = qword_1022A00B8;
  if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0].val[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLRS,shouldAcceptNewConnection", (uint8_t *)buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    LOWORD(__p.val[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 2, "CLRS,shouldAcceptNewConnection", &__p, 2);
    v42 = (audit_token_t *)v41;
    sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor listener:shouldAcceptNewConnection:]", "%s\n", v41);
    if (v42 != buf)
      free(v42);
  }
  -[CLSmootherMonitor silo](self, "silo");
  if (qword_1022A00B0 != -1)
    dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
  v7 = qword_1022A00B8;
  if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0].val[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLRS,LocationServer received incoming connection", (uint8_t *)buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    LOWORD(__p.val[0]) = 0;
    LODWORD(v47) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 2, "CLRS,LocationServer received incoming connection", &__p, v47);
    v44 = (audit_token_t *)v43;
    sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor listener:shouldAcceptNewConnection:]", "%s\n", v43);
    if (v44 != buf)
      free(v44);
  }
  if (a4)
  {
    v9 = objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.locationd.smoother"));
    if (v9)
    {
      v10 = objc_opt_class(NSNumber, v8);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
      {
        objc_msgSend(a4, "setExportedInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLLocationSmootherServerInterface));
        objc_msgSend(a4, "setExportedObject:", self);
        v11 = objc_msgSend(a4, "exportedInterface");
        v13 = objc_opt_class(NSArray, v12);
        objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(CLLocation, v14), 0), "smoothLocations:workoutActivity:shouldReconstructRoute:handler:", 0, 0);
        v15 = objc_msgSend(a4, "exportedInterface");
        v17 = objc_opt_class(NSArray, v16);
        objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(CLLocation, v18), 0), "smoothLocations:workoutActivity:shouldReconstructRoute:handler:", 0, 1);
        v19 = objc_msgSend(a4, "exportedInterface");
        v21 = objc_opt_class(NSArray, v20);
        objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, objc_opt_class(CLLocation, v22), 0), "smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:", 0, 0);
        v23 = objc_msgSend(a4, "exportedInterface");
        v25 = objc_opt_class(NSArray, v24);
        objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, objc_opt_class(NSDateInterval, v26), 0), "smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:", 3, 0);
        v27 = objc_msgSend(a4, "exportedInterface");
        v29 = objc_opt_class(NSArray, v28);
        objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, objc_opt_class(CLLocation, v30), 0), "smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:", 0, 1);
        objc_msgSend(a4, "setRemoteObjectInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLLocationSmootherClientInterface));
        objc_msgSend(a4, "_setQueue:", objc_msgSend(-[CLSmootherMonitor silo](self, "silo"), "queue"));
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_101465B20;
        v49[3] = &unk_10212BB58;
        v49[4] = self;
        objc_msgSend(a4, "setInterruptionHandler:", v49);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_101465CD0;
        v48[3] = &unk_10212BB58;
        v48[4] = self;
        objc_msgSend(a4, "setInvalidationHandler:", v48);
        -[CLSmootherMonitor setConnection:](self, "setConnection:", a4);
        -[NSXPCConnection resume](-[CLSmootherMonitor connection](self, "connection"), "resume");
        LOBYTE(v31) = 1;
        return v31;
      }
    }
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v32 = qword_1022A00B8;
    if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_FAULT))
    {
      v33 = objc_msgSend(a4, "processIdentifier");
      objc_msgSend(a4, "auditToken");
      sub_1001A48F4(buf, (std::string *)&__p);
      v34 = (__p.val[5] & 0x80000000) == 0 ? &__p : *(audit_token_t **)__p.val;
      LODWORD(v51.__r_.__value_.__l.__data_) = 67240450;
      HIDWORD(v51.__r_.__value_.__r.__words[0]) = v33;
      LOWORD(v51.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&v51.__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "CLRS,process is not entitled to use CLLocationSmoother, pid, %{public}d, executable, %{public}s", (uint8_t *)&v51, 0x12u);
      if (SHIBYTE(__p.val[5]) < 0)
        operator delete(*(void **)__p.val);
    }
    v31 = sub_1001BFF7C(115, 0);
    if (v31)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      v35 = qword_1022A00B8;
      v36 = objc_msgSend(a4, "processIdentifier");
      objc_msgSend(a4, "auditToken");
      sub_1001A48F4(&__p, &v51);
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v37 = &v51;
      else
        v37 = (std::string *)v51.__r_.__value_.__r.__words[0];
      v52[0] = 67240450;
      v52[1] = v36;
      v53 = 2082;
      v54 = v37;
      LODWORD(v47) = 18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v35, 17, "CLRS,process is not entitled to use CLLocationSmoother, pid, %{public}d, executable, %{public}s", v52, v47);
      v39 = v38;
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v51.__r_.__value_.__l.__data_);
      sub_100512490("Generic", 1, 0, 0, "-[CLSmootherMonitor listener:shouldAcceptNewConnection:]", "%s\n", v39);
      if (v39 == (char *)buf)
        goto LABEL_34;
      goto LABEL_33;
    }
  }
  else
  {
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v40 = qword_1022A00B8;
    if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "CLRS,Why didn't we get a connection?", (uint8_t *)buf, 2u);
    }
    v31 = sub_1001BFF7C(115, 0);
    if (v31)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      LOWORD(__p.val[0]) = 0;
      LODWORD(v47) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 17, "CLRS,Why didn't we get a connection?", &__p, v47);
      v39 = (char *)v45;
      sub_100512490("Generic", 1, 0, 0, "-[CLSmootherMonitor listener:shouldAcceptNewConnection:]", "%s\n", v45);
      if (v39 == (char *)buf)
        goto LABEL_34;
LABEL_33:
      free(v39);
LABEL_34:
      LOBYTE(v31) = 0;
    }
  }
  return v31;
}

- (void)smoothLocationsInternal:(void *)a3 workoutActivity:(int)a4 shouldReconstructRoute:(BOOL)a5 intervalEpochsVector:(void *)a6 handler:(id)a7
{
  BOOL v9;
  BOOL v10;
  unsigned int v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  _OWORD *v25;
  _OWORD *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  NSObject *v36;
  id *v37;
  uint64_t v38;
  const char *v39;
  uint8_t *v40;
  _BOOL4 v42;
  _WORD v44[8];
  _OWORD v45[8];
  _BYTE v46[28];
  void *__p;
  _BYTE *v48;
  uint64_t v49;
  BOOL v50[40];
  uint64_t v51;
  int v52;
  char v53;
  char v54;
  char v55;
  uint8_t buf[8];
  _BYTE v57[10];
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  unsigned int v67;

  if (byte_1023140B2)
    v9 = 0;
  else
    v9 = byte_1023140B0 == 0;
  v10 = v9 && byte_1023140B1 == 0;
  v42 = a5;
  if (v10)
  {
    sub_100197040();
    v12 = sub_100195F08() ^ 1;
  }
  else
  {
    v12 = 1;
  }
  sub_1001E4804(buf);
  v50[0] = 0;
  if (sub_1001E4874(*(uint64_t *)buf, "CLRSNetworkAccessAllowed", v50))
    v12 = v50[0];
  v13 = *(std::__shared_weak_count **)v57;
  if (*(_QWORD *)v57)
  {
    v14 = (unint64_t *)(*(_QWORD *)v57 + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (qword_1022A00B0 != -1)
    dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
  v16 = qword_1022A00B8;
  if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = byte_1023140B2;
    v18 = byte_1023140B1;
    v19 = byte_1023140B0;
    sub_100197040();
    v20 = sub_100195F08();
    *(_DWORD *)buf = 68290306;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v57 = 2082;
    *(_QWORD *)&v57[2] = "";
    v58 = 1026;
    v59 = v17;
    v60 = 1026;
    v61 = v18;
    v62 = 1026;
    v63 = v19;
    v64 = 1026;
    v65 = v20;
    v66 = 1026;
    v67 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLRS\", \"isCompanionConnected\":%{public}d, \"hasActiveCellConnection\":%{public}d, \"hasLargeReachability\":%{public}d, \"isWatch\":%{public}d, \"networkAccessAllowed\":%{public}d}", buf, 0x30u);
  }
  sub_1002433B8((uint64_t)v50);
  v51 = 0x101010001;
  v52 = 65537;
  v53 = 1;
  v54 = 0;
  v55 = 0;
  __p = 0;
  v48 = 0;
  v49 = 0;
  v21 = sub_100829408(v50, (uint64_t)objc_msgSend(objc_msgSend(-[CLSmootherMonitor universe](self, "universe"), "silo"), "queue"), (uint64_t)a3, &__p, a4, v42, v12, (id **)a6);
  v22 = *(void **)a3;
  *((_QWORD *)a3 + 1) = 0;
  *((_QWORD *)a3 + 2) = 0;
  *(_QWORD *)a3 = 0;
  if (v22)
    operator delete(v22);
  if (v21)
  {
    (*((void (**)(id, NSArray *, NSError *))a7 + 2))(a7, +[NSArray array](NSArray, "array"), +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CLSmootherErrorDomain"), v21, 0));
  }
  else
  {
    v23 = objc_alloc((Class)NSMutableArray);
    v24 = objc_msgSend(v23, "initWithCapacity:", 0x6F96F96F96F96F97 * ((v48 - (_BYTE *)__p) >> 2));
    v25 = __p;
    v26 = v48;
    if (__p != v48)
    {
      do
      {
        v27 = objc_alloc((Class)CLLocation);
        v28 = v25[1];
        v45[0] = *v25;
        v45[1] = v28;
        v29 = v25[2];
        v30 = v25[3];
        v31 = v25[5];
        v45[4] = v25[4];
        v45[5] = v31;
        v45[2] = v29;
        v45[3] = v30;
        v32 = v25[6];
        v33 = v25[7];
        v34 = v25[8];
        *(_OWORD *)&v46[12] = *(_OWORD *)((char *)v25 + 140);
        v45[7] = v33;
        *(_OWORD *)v46 = v34;
        v45[6] = v32;
        v35 = objc_msgSend(v27, "initWithClientLocation:", v45);
        objc_msgSend(v24, "addObject:", v35);

        v25 = (_OWORD *)((char *)v25 + 156);
      }
      while (v25 != v26);
    }
    (*((void (**)(id, id, _QWORD))a7 + 2))(a7, v24, 0);

  }
  if (qword_1022A00B0 != -1)
    dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
  v36 = qword_1022A00B8;
  if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "CLRS,Releasing held memory and OSTransaction", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v44[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 1, "CLRS,Releasing held memory and OSTransaction", v44, 2);
    v40 = (uint8_t *)v39;
    sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor smoothLocationsInternal:workoutActivity:shouldReconstructRoute:intervalEpochsVector:handler:]", "%s\n", v39);
    if (v40 != buf)
      free(v40);
  }
  v37 = (id *)qword_102314098;
  v38 = qword_1023140A0;
  if (qword_102314098 != qword_1023140A0)
  {
    do
    {

      v37[1] = 0;
      *v37 = 0;
      v37 += 2;
    }
    while (v37 != (id *)v38);
    v37 = (id *)qword_102314098;
  }
  qword_1023140A0 = (uint64_t)v37;
  sub_100D823A8(qword_102314078);
  if (__p)
  {
    v48 = __p;
    operator delete(__p);
  }
}

- (void)smoothLocations:(id)a3 workoutActivity:(int)a4 shouldReconstructRoute:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  objc_msgSend(-[CLSmootherMonitor universe](self, "universe"), "silo");
  -[CLSmootherMonitor smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:](self, "smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:", a3, v8, v7, 0, a6);
}

- (void)smoothLocations:(id)a3 workoutActivity:(int)a4 shouldReconstructRoute:(BOOL)a5 timeIntervalsThatNeedPopulated:(id)a6 handler:(id)a7
{
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned __int8 v14;
  unint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  NSArray *v25;
  id v26;
  double v27;
  NSDate *v28;
  id v29;
  double v30;
  uint64_t v31;
  char v32;
  BOOL v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  NSUInteger v37;
  BOOL v38;
  id v39;
  void *i;
  void *v41;
  double v42;
  double v43;
  double v44;
  char v46;
  char *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  unsigned int v51;
  unsigned int v52;
  const char *v53;
  uint8_t *v54;
  char v55;
  char v56;
  id v57;
  NSArray *obj;
  uint64_t v59;
  NSUInteger v60;
  uint64_t v61;
  _BOOL4 v63;
  void *__p[2];
  uint64_t v65;
  _QWORD v66[13];
  int v67;
  int v68;
  BOOL v69;
  _QWORD v70[2];
  void (*v71)(uint64_t, unsigned int, dispatch_object_t *, char *);
  void *v72;
  CLSmootherMonitor *v73;
  _QWORD *v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  _QWORD v79[7];
  int v80;
  BOOL v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  __n128 (*v89)(__n128 *, __n128 *);
  void (*v90)(uint64_t);
  void *v91;
  void *v92[3];
  _QWORD v93[7];
  int v94;
  BOOL v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;
  uint64_t *v103;
  __int128 v104;
  void (*v105)(uint64_t);
  void *v106;
  void *v107[4];
  uint8_t buf[16];
  __int128 v109;
  __int128 v110;
  void *v111[2];
  _OWORD v112[2];
  __int128 v113;
  __int128 v114;
  _BYTE v115[28];

  v63 = a5;
  objc_msgSend(-[CLSmootherMonitor universe](self, "universe"), "silo");
  if ((sub_100241564() & 1) == 0)
  {
    (*((void (**)(id, NSArray *, NSError *))a7 + 2))(a7, +[NSArray array](NSArray, "array"), +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CLSmootherErrorDomain"), 1, 0));
    sub_100D823A8(qword_102314078);
    return;
  }
  sub_100D823D8((uint64_t)qword_102314078);
  v57 = a7;
  if (qword_1022A00B0 != -1)
    dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
  v11 = qword_1022A00B8;
  if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
    {
      v12 = objc_msgSend(a3, "count");
      if (a6)
      {
LABEL_7:
        v13 = objc_msgSend(a6, "count");
LABEL_11:
        *(_DWORD *)buf = 67240960;
        *(_DWORD *)&buf[4] = v12;
        *(_WORD *)&buf[8] = 1026;
        *(_DWORD *)&buf[10] = a4;
        *(_WORD *)&buf[14] = 1026;
        LODWORD(v109) = v63;
        WORD2(v109) = 1026;
        *(_DWORD *)((char *)&v109 + 6) = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLRS,smoothLocations,locations,size,%{public}d,workoutActivity,%{public}d,shouldReconstructRoute,%{public}d,timeIntervalsThatNeedPopulated,size,%{public}d", buf, 0x1Au);
        goto LABEL_12;
      }
    }
    else
    {
      v12 = -1;
      if (a6)
        goto LABEL_7;
    }
    v13 = -1;
    goto LABEL_11;
  }
LABEL_12:
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v50 = qword_1022A00B8;
    if (a3)
      v51 = objc_msgSend(a3, "count");
    else
      v51 = -1;
    if (a6)
      v52 = objc_msgSend(a6, "count");
    else
      v52 = -1;
    LODWORD(v102) = 67240960;
    HIDWORD(v102) = v51;
    LOWORD(v103) = 1026;
    *(_DWORD *)((char *)&v103 + 2) = a4;
    HIWORD(v103) = 1026;
    LODWORD(v104) = v63;
    WORD2(v104) = 1026;
    *(_DWORD *)((char *)&v104 + 6) = v52;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v50, 0, "CLRS,smoothLocations,locations,size,%{public}d,workoutActivity,%{public}d,shouldReconstructRoute,%{public}d,timeIntervalsThatNeedPopulated,size,%{public}d", &v102, 26);
    v54 = (uint8_t *)v53;
    sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor smoothLocations:workoutActivity:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:]", "%s\n", v53);
    if (v54 != buf)
      free(v54);
  }
  v14 = atomic_load((unsigned __int8 *)&qword_10230F1D0);
  if ((v14 & 1) == 0 && __cxa_guard_acquire(&qword_10230F1D0))
  {
    sub_1001E4804(buf);
    LOBYTE(v102) = 0;
    v55 = sub_1001E4874(*(uint64_t *)buf, "ForceCreateAutoStartIntervalUsingFullRoute", (BOOL *)&v102);
    if ((_BYTE)v102)
      v56 = v55;
    else
      v56 = 0;
    sub_100261F44((uint64_t)buf);
    byte_10230F1C8 = v56;
    __cxa_guard_release(&qword_10230F1D0);
  }
  if (byte_10230F1C8)
    v15 = 1;
  else
    v15 = (unint64_t)objc_msgSend(a3, "count");
  v102 = 0;
  v103 = &v102;
  *(_QWORD *)&v104 = 0x4812000000;
  *((_QWORD *)&v104 + 1) = sub_1002073A0;
  v105 = sub_100207E9C;
  v106 = &unk_102080316;
  sub_10083AFE0(v107, v15);
  if (byte_10230F1C8)
  {
    v16 = objc_msgSend(a3, "objectAtIndexedSubscript:", (char *)objc_msgSend(a3, "count") - 1);
    if (v16)
    {
      objc_msgSend(v16, "clientLocation");
    }
    else
    {
      memset(v115, 0, sizeof(v115));
      v114 = 0u;
      v113 = 0u;
      memset(v112, 0, sizeof(v112));
      *(_OWORD *)v111 = 0u;
      v109 = 0u;
      v110 = 0u;
      *(_OWORD *)buf = 0u;
    }
    sub_100835670((uint64_t)buf, v103[6]);
  }
  else
  {
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
    if (v17)
    {
      v18 = 0;
      v19 = *(_QWORD *)v97;
      do
      {
        v20 = 0;
        v21 = 112 * v18;
        do
        {
          if (*(_QWORD *)v97 != v19)
            objc_enumerationMutation(a3);
          v22 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)v20);
          if (v22)
          {
            objc_msgSend(v22, "clientLocation");
          }
          else
          {
            memset(v115, 0, sizeof(v115));
            v114 = 0u;
            v113 = 0u;
            memset(v112, 0, sizeof(v112));
            *(_OWORD *)v111 = 0u;
            v109 = 0u;
            v110 = 0u;
            *(_OWORD *)buf = 0u;
          }
          v23 = sub_100835670((uint64_t)buf, v103[6] + v21);
          v20 = (char *)v20 + 1;
          v21 += 112;
        }
        while (v17 != v20);
        v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v96, v101, 16, v23);
        v18 += (uint64_t)v20;
      }
      while (v17);
    }
  }
  v24 = objc_autoreleasePoolPush();
  v25 = (NSArray *)a6;
  if (byte_10230F1C8)
  {
    v26 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    if (v26)
    {
      objc_msgSend(v26, "clientLocation");
      v27 = *(double *)((char *)v112 + 12);
    }
    else
    {
      memset(v115, 0, sizeof(v115));
      v114 = 0u;
      v113 = 0u;
      memset(v112, 0, sizeof(v112));
      *(_OWORD *)v111 = 0u;
      v109 = 0u;
      v110 = 0u;
      v27 = 0.0;
      *(_OWORD *)buf = 0u;
    }
    v28 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v27);
    v29 = objc_msgSend(a3, "objectAtIndexedSubscript:", (char *)objc_msgSend(a3, "count") - 1);
    if (v29)
    {
      objc_msgSend(v29, "clientLocation");
      v30 = *(double *)((char *)v112 + 12);
    }
    else
    {
      memset(v115, 0, sizeof(v115));
      v114 = 0u;
      v113 = 0u;
      memset(v112, 0, sizeof(v112));
      *(_OWORD *)v111 = 0u;
      v109 = 0u;
      v110 = 0u;
      v30 = 0.0;
      *(_OWORD *)buf = 0u;
    }
    v25 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v28, +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v30)), 0);
    LOBYTE(v63) = 0;
  }
  sub_1001E4804(buf);
  v31 = *(_QWORD *)buf;
  v32 = _os_feature_enabled_impl("Workout", "AutostartRouteMaps");
  LOBYTE(v86) = 0;
  if (sub_1001E4874(v31, "EnableAutostartRouteReconstruction", (BOOL *)&v86))
    v33 = (_BYTE)v86 != 0;
  else
    v33 = v32;
  v34 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v35 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  if (v25 && ((v37 = -[NSArray count](v25, "count")) != 0 ? (v38 = v33) : (v38 = 0), v38))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&v109 = 0x4812000000;
    *((_QWORD *)&v109 + 1) = sub_101467074;
    *(_QWORD *)&v110 = sub_101467098;
    *((_QWORD *)&v110 + 1) = &unk_102080316;
    sub_10146C458(v111, v37);
    v86 = 0;
    v87 = &v86;
    v88 = 0x4812000000;
    v89 = sub_101467074;
    v90 = sub_101467098;
    v91 = &unk_102080316;
    sub_10146C458(v92, v37);
    v60 = v37;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = v25;
    v39 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
    if (v39)
    {
      v61 = 0;
      v59 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(_QWORD *)v83 != v59)
            objc_enumerationMutation(obj);
          v41 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
          objc_msgSend(objc_msgSend(v41, "endDate"), "timeIntervalSinceReferenceDate");
          v43 = v42;
          if (objc_msgSend(a3, "count"))
          {
            objc_msgSend(objc_msgSend(objc_msgSend(a3, "firstObject"), "timestamp"), "timeIntervalSinceReferenceDate");
            if (v43 > v44 + -10.0 && v43 < v44 + -1.0)
              v43 = v44 + -1.0;
          }
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472;
          v79[2] = sub_1014670B0;
          v79[3] = &unk_1021B7900;
          v79[5] = v57;
          v79[6] = &v102;
          v80 = a4;
          v81 = v63;
          v79[4] = self;
          sub_1015A2E04(&v77, "inertial odometry");
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3321888768;
          v71 = sub_1014674C0;
          v72 = &unk_1021B7960;
          v73 = self;
          v46 = HIBYTE(v78);
          if (SHIBYTE(v78) < 0)
          {
            sub_100115CE4(&v75, (void *)v77, *((unint64_t *)&v77 + 1));
            v46 = HIBYTE(v78);
          }
          else
          {
            v75 = v77;
            v76 = v78;
          }
          v47 = (char *)i + v61;
          v74 = v79;
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472;
          v66[2] = sub_101467970;
          v66[3] = &unk_1021B79C0;
          v66[7] = v57;
          v66[8] = &v86;
          v66[9] = buf;
          v66[10] = &v102;
          v66[11] = v60;
          v67 = v61 + (_DWORD)i;
          v68 = a4;
          v69 = v63;
          v66[5] = v41;
          v66[6] = v70;
          v66[4] = self;
          *(double *)&v66[12] = v43;
          v48 = v87[6];
          if (v46 < 0)
          {
            sub_100115CE4(__p, (void *)v77, *((unint64_t *)&v77 + 1));
          }
          else
          {
            *(_OWORD *)__p = v77;
            v65 = v78;
          }
          v71((uint64_t)v70, v47, (dispatch_object_t *)(v48 + 8 * v47), (char *)__p);
          if (SHIBYTE(v65) < 0)
            operator delete(__p[0]);
          objc_msgSend(objc_msgSend(v41, "startDate"), "timeIntervalSinceReferenceDate");
          -[CLSmootherMonitor fetchBackgroundInertialOdometrySamplesWithStartTime:endTime:intervalIndex:completionBlock:](self, "fetchBackgroundInertialOdometrySamplesWithStartTime:endTime:intervalIndex:completionBlock:", v47, v66);
          if (SHIBYTE(v76) < 0)
            operator delete((void *)v75);
          if (SHIBYTE(v78) < 0)
            operator delete((void *)v77);
        }
        v39 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
        v61 = (v61 + (_DWORD)i);
      }
      while (v39);
    }
    _Block_object_dispose(&v86, 8);
    if (v92[0])
    {
      v92[1] = v92[0];
      operator delete(v92[0]);
    }
    _Block_object_dispose(buf, 8);
    if (v111[0])
    {
      v111[1] = v111[0];
      operator delete(v111[0]);
    }
  }
  else
  {
    v49 = objc_msgSend(-[CLSmootherMonitor universe](self, "universe"), "silo");
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_10146704C;
    v93[3] = &unk_1021B78D8;
    v93[6] = &v102;
    v94 = a4;
    v95 = v63;
    v93[4] = self;
    v93[5] = v57;
    objc_msgSend(v49, "async:", v93);
  }
  objc_autoreleasePoolPop(v24);
  _Block_object_dispose(&v102, 8);
  if (v107[0])
  {
    v107[1] = v107[0];
    operator delete(v107[0]);
  }
}

- (void)registerForCompanionNotification
{
  if (!qword_102314060)
  {
    -[CLSmootherMonitor universe](self, "universe");
    sub_1001B6924();
  }
}

- (void)registerForDaemonStatusNotification
{
  if (!qword_102314068)
  {
    -[CLSmootherMonitor universe](self, "universe");
    sub_100647FA8();
  }
}

- (void)registerForTelephonyNotification
{
  if (!qword_102314070)
  {
    -[CLSmootherMonitor universe](self, "universe");
    sub_1005A7F94();
  }
}

- (void)unregisterForCompanionNotification
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  _WORD v5[8];
  uint8_t buf[1640];

  if (qword_102314060)
  {
    objc_msgSend(*(id *)(qword_102314060 + 16), "unregister:forNotification:", *(_QWORD *)(qword_102314060 + 8), 5);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v2 = qword_1022A00B8;
    if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "CLRS,unregisterForCompanionNotification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      v5[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 1, "CLRS,unregisterForCompanionNotification", v5, 2);
      v4 = (uint8_t *)v3;
      sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor unregisterForCompanionNotification]", "%s\n", v3);
      if (v4 != buf)
        free(v4);
    }
  }
}

- (void)unregisterForDaemonStatusNotification
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  _WORD v5[8];
  uint8_t buf[1640];

  if (qword_102314068)
  {
    objc_msgSend(*(id *)(qword_102314068 + 16), "unregister:forNotification:", *(_QWORD *)(qword_102314068 + 8), 6);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v2 = qword_1022A00B8;
    if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "CLRS,unregisterForDaemonStatusNotification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      v5[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 1, "CLRS,unregisterForDaemonStatusNotification", v5, 2);
      v4 = (uint8_t *)v3;
      sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor unregisterForDaemonStatusNotification]", "%s\n", v3);
      if (v4 != buf)
        free(v4);
    }
  }
}

- (void)unregisterForTelephonyNotification
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  unsigned int buf[410];

  v2 = qword_102314070;
  if (qword_102314070)
  {
    sub_10013F950(buf, CFSTR("kDataStatusNotification"));
    objc_msgSend(*(id *)(v2 + 16), "unregister:forNotification:", *(_QWORD *)(v2 + 8), sub_1001CFE7C(buf));
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v3 = qword_1022A00B8;
    if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLRS,unregisterForTelephonyNotification", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 1, "CLRS,unregisterForTelephonyNotification", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor unregisterForTelephonyNotification]", "%s\n", v4);
      if (v5 != (uint8_t *)buf)
        free(v5);
    }
  }
}

- (void)onCompanionNotification:(int)a3 data:(char *)a4
{
  NSObject *v5;
  int v6;
  int v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[4];
  uint8_t buf[4];
  int v12;

  if (a3 == 5)
  {
    sub_100197040();
    if (sub_100195F08())
    {
      byte_1023140B2 = *a4;
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      v5 = qword_1022A00B8;
      if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *a4;
        *(_DWORD *)buf = 67240192;
        v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLRS,kNotificationCompanionConnectionUpdate,isNearby,%{public}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00B0 != -1)
          dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
        v7 = *a4;
        v10[0] = 67240192;
        v10[1] = v7;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 0, "CLRS,kNotificationCompanionConnectionUpdate,isNearby,%{public}d", v10, 8);
        v9 = (uint8_t *)v8;
        sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor onCompanionNotification:data:]", "%s\n", v8);
        if (v9 != buf)
          free(v9);
      }
    }
  }
}

- (void)onDaemonStatusNotification:(int)a3 data:(uint64_t)a4
{
  unsigned int v5;
  NSObject *v7;
  double v8;
  uint8_t *v9;
  uint8_t *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  double v16;
  uint8_t *v17;
  int v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  int v22;
  int v23;
  __int16 v24;
  int v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;

  if (a3 == 6)
  {
    v5 = *(_DWORD *)(a4 + 4);
    if (v5 < 2 || v5 == 1000)
    {
      byte_1023140B0 = 0;
    }
    else if (v5 == 2)
    {
      byte_1023140B0 = 1;
    }
    else
    {
      byte_1023140B0 = 0;
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      v11 = qword_1022A00B8;
      if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_DWORD *)(a4 + 4);
        *(_DWORD *)buf = 67240192;
        v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLRS,unhandled reachability,%{public}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00B0 != -1)
          dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
        v18 = *(_DWORD *)(a4 + 4);
        v22 = 67240192;
        v23 = v18;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 0, "CLRS,unhandled reachability,%{public}d", &v22, 8);
        v20 = (uint8_t *)v19;
        sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor onDaemonStatusNotification:data:]", "%s\n", v19);
        if (v20 != buf)
          free(v20);
      }
    }
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v13 = qword_1022A00B8;
    if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_DWORD *)(a4 + 4);
      *(_DWORD *)buf = 67240448;
      v27 = v14;
      v28 = 1026;
      v29 = byte_1023140B0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CLRS,onDaemonStatusNotification,kNotificationReachability,current,%{public}d,hasLargeReachability,%{public}d", buf, 0xEu);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v15 = *(_DWORD *)(a4 + 4);
    v22 = 67240448;
    v23 = v15;
    v24 = 1026;
    v25 = byte_1023140B0;
    LODWORD(v21) = 14;
    v16 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 0, "CLRS,onDaemonStatusNotification,kNotificationReachability,current,%{public}d,hasLargeReachability,%{public}d", &v22, v21);
    v10 = v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor onDaemonStatusNotification:data:]", "%s\n", v16);
LABEL_29:
    if (v10 != buf)
      free(v10);
    return;
  }
  if (qword_1022A00B0 != -1)
    dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
  v7 = qword_1022A00B8;
  if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67240192;
    v27 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLRS,daemonStatus notification,%{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00B0 != -1)
      dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
    v22 = 67240192;
    v23 = a3;
    v8 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 16, "CLRS,daemonStatus notification,%{public}d", &v22, 8);
    v10 = v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLSmootherMonitor onDaemonStatusNotification:data:]", "%s\n", v8);
    goto LABEL_29;
  }
}

- (void)onTelephonyNotification:(int)a3 data:(void *)a4
{
  const void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  unsigned int v9;
  NSObject *v10;
  int v11;
  unsigned int v12;
  const void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  void **v21;
  NSObject *v22;
  const __CFString *v23;
  void **v24;
  const char *v25;
  uint8_t *v26;
  const char *v27;
  uint8_t *v28;
  void *__p[2];
  char v30;
  int v31;
  void *v32[2];
  __int128 v33;
  int v34;
  int v35;
  uint8_t buf[8];
  __int16 v37;
  const char *v38;
  __int16 v39;
  _BYTE v40[10];
  int v41;

  v35 = a3;
  v5 = (const void *)sub_1001DEC98(&v35);
  if (CFEqual(CFSTR("kDataStatusNotification"), v5))
  {
    v6 = *a4;
    if (*a4)
    {
      *(_OWORD *)v32 = 0u;
      v33 = 0u;
      v34 = 1065353216;
      if (sub_101260B14(v6, (uint64_t)v32))
      {
        if (qword_1022A00B0 != -1)
          dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
        v7 = qword_1022A00B8;
        if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 0;
          __p[0] = &v31;
          v8 = *((_DWORD *)sub_10071E124((uint64_t)v32, &v31, (uint64_t)&unk_101B9EB60, (_DWORD **)__p) + 9);
          *(_DWORD *)buf = 68289538;
          *(_DWORD *)&buf[4] = 0;
          v37 = 2082;
          v38 = "";
          v39 = 1026;
          *(_DWORD *)v40 = 0;
          *(_WORD *)&v40[4] = 1026;
          *(_DWORD *)&v40[6] = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLRS,kDataStatusNotification\", \"sim\":%{public}d, \"RAT\":%{public}d}", buf, 0x1Eu);
        }
        LODWORD(__p[0]) = 0;
        *(_QWORD *)buf = __p;
        v9 = *((_DWORD *)sub_10071E124((uint64_t)v32, (int *)__p, (uint64_t)&unk_101B9EB60, (_DWORD **)buf) + 9);
        byte_1023140B1 = (v9 < 0xB) & (0x7BDu >> v9);
        if (sub_1001DC538())
        {
          if (qword_1022A00B0 != -1)
            dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
          v10 = qword_1022A00B8;
          if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
          {
            v31 = 1;
            __p[0] = &v31;
            v11 = *((_DWORD *)sub_10071E124((uint64_t)v32, &v31, (uint64_t)&unk_101B9EB60, (_DWORD **)__p) + 9);
            *(_DWORD *)buf = 68289538;
            *(_DWORD *)&buf[4] = 0;
            v37 = 2082;
            v38 = "";
            v39 = 1026;
            *(_DWORD *)v40 = 1;
            *(_WORD *)&v40[4] = 1026;
            *(_DWORD *)&v40[6] = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLRS,kDataStatusNotification\", \"sim\":%{public}d, \"RAT\":%{public}d}", buf, 0x1Eu);
          }
          LODWORD(__p[0]) = 1;
          *(_QWORD *)buf = __p;
          v12 = *((_DWORD *)sub_10071E124((uint64_t)v32, (int *)__p, (uint64_t)&unk_101B9EB60, (_DWORD **)buf) + 9);
          byte_1023140B1 |= (v12 < 0xB) & (0x7BDu >> v12);
        }
      }
      else
      {
        if (qword_1022A00B0 != -1)
          dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
        v18 = qword_1022A00B8;
        if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CLRS,copyValuesFromDataStatusDictionary,failed", buf, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00B0 != -1)
            dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
          LOWORD(__p[0]) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 16, "CLRS,copyValuesFromDataStatusDictionary,failed", __p, 2);
          v28 = (uint8_t *)v27;
          sub_100512490("Generic", 1, 0, 0, "-[CLSmootherMonitor onTelephonyNotification:data:]", "%s\n", v27);
          if (v28 != buf)
            free(v28);
        }
      }
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      v19 = qword_1022A00B8;
      if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (const __CFString *)sub_1001DEC98(&v35);
        sub_1001A486C(v20, (uint64_t)__p);
        v21 = v30 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        v37 = 2082;
        v38 = "";
        v39 = 2082;
        *(_QWORD *)v40 = v21;
        *(_WORD *)&v40[8] = 1026;
        v41 = byte_1023140B1;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLRS\", \"received CT notification\":%{public, location:escape_only}s, \"hasActiveCellConnection\":%{public}d}", buf, 0x22u);
        if (v30 < 0)
          operator delete(__p[0]);
      }
      sub_100067AC4((uint64_t)v32);
    }
    else
    {
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      v15 = qword_1022A00B8;
      if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CLRS,kDataStatusNotification,error fetching info", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00B0 != -1)
          dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
        LOWORD(v32[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 16, "CLRS,kDataStatusNotification,error fetching info", v32, 2);
        v17 = (uint8_t *)v16;
        sub_100512490("Generic", 1, 0, 0, "-[CLSmootherMonitor onTelephonyNotification:data:]", "%s\n", v16);
        if (v17 != buf)
          free(v17);
      }
    }
  }
  else
  {
    v13 = (const void *)sub_1001DEC98(&v35);
    if (CFEqual(CFSTR("kCLTelephonyServiceResetNotification"), v13))
    {
      if (qword_1022A00B0 != -1)
        dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
      v14 = qword_1022A00B8;
      if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CLRS,kResetNotification,setting active cell flag to false", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00B0 != -1)
          dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
        LOWORD(v32[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00B8, 0, "CLRS,kResetNotification,setting active cell flag to false", v32, 2);
        v26 = (uint8_t *)v25;
        sub_100512490("Generic", 1, 0, 2, "-[CLSmootherMonitor onTelephonyNotification:data:]", "%s\n", v25);
        if (v26 != buf)
          free(v26);
      }
      byte_1023140B1 = 0;
    }
  }
  if (qword_1022A00B0 != -1)
    dispatch_once(&qword_1022A00B0, &stru_1021B7A80);
  v22 = qword_1022A00B8;
  if (os_log_type_enabled((os_log_t)qword_1022A00B8, OS_LOG_TYPE_DEBUG))
  {
    v23 = (const __CFString *)sub_1001DEC98(&v35);
    sub_1001A486C(v23, (uint64_t)v32);
    if ((SBYTE7(v33) & 0x80u) == 0)
      v24 = v32;
    else
      v24 = (void **)v32[0];
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v37 = 2082;
    v38 = "";
    v39 = 2082;
    *(_QWORD *)v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLRS\", \"received CT notification\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (SBYTE7(v33) < 0)
      operator delete(v32[0]);
  }
}

- (BOOL)isLocationUsefulForSmoothing:(int)a3
{
  return (a3 < 0xC) & (0xE12u >> a3);
}

- (void)fetchBackgroundInertialOdometrySamplesWithStartTime:(double)a3 endTime:(double)a4 intervalIndex:(unsigned int)a5 completionBlock:(id)a6
{
  void *v11;
  id v12;
  _QWORD v13[8];
  unsigned int v14;

  v11 = objc_autoreleasePoolPush();
  v12 = objc_msgSend(objc_alloc((Class)RTBackgroundInertialOdometrySampleEnumerationOptions), "initWithDateInterval:", objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3), +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4)));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10146B1B8;
  v13[3] = &unk_1021B7A10;
  v13[5] = sub_1001FCBB4();
  *(double *)&v13[6] = a4;
  *(double *)&v13[7] = a3;
  v14 = a5;
  v13[4] = a6;
  -[CLRoutineMonitorServiceProtocol fetchBackgroundInertialOdometrySamplesWithOptions:handler:](self->_routineMonitor, "fetchBackgroundInertialOdometrySamplesWithOptions:handler:", v12, v13);
  objc_autoreleasePoolPop(v11);
}

- (void)fetchLocationsWithStartTime:(double)a3 endTime:(double)a4 intervalIndex:(unsigned int)a5 locationArray:(id)a6 completionBlock:(id)a7
{
  void *v13;
  id v14;
  double v15;
  CLRoutineMonitorServiceProtocol *routineMonitor;
  _QWORD v17[12];
  unsigned int v18;
  _QWORD v19[6];

  v13 = objc_autoreleasePoolPush();
  v14 = objc_msgSend(objc_alloc((Class)RTStoredLocationEnumerationOptions), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3), +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a4)), 0, 0, 0.0);
  v15 = sub_1001FCBB4();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3052000000;
  v19[3] = sub_101468710;
  v19[4] = sub_101468720;
  v19[5] = 0;
  routineMonitor = self->_routineMonitor;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10146B8D4;
  v17[3] = &unk_1021B7A60;
  v18 = a5;
  v17[4] = self;
  v17[5] = a6;
  v17[7] = a7;
  v17[8] = v19;
  *(double *)&v17[9] = v15;
  *(double *)&v17[10] = a4;
  *(double *)&v17[11] = a3;
  v17[6] = v14;
  -[CLRoutineMonitorServiceProtocol enumerateStoredLocationsWithOptions:withReply:](routineMonitor, "enumerateStoredLocationsWithOptions:withReply:", v14, v17);
  _Block_object_dispose(v19, 8);
  objc_autoreleasePoolPop(v13);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (BOOL)diminishedMode
{
  return self->_diminishedMode;
}

- (void)setDiminishedMode:(BOOL)a3
{
  self->_diminishedMode = a3;
}

- (NSMutableSet)visitClients
{
  return self->_visitClients;
}

- (void)setVisitClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)visitMonitorWakeTimerEnabled
{
  return self->_visitMonitorWakeTimerEnabled;
}

- (void)setVisitMonitorWakeTimerEnabled:(BOOL)a3
{
  self->_visitMonitorWakeTimerEnabled = a3;
}

- (BOOL)wifiPowerEnabled
{
  return self->_wifiPowerEnabled;
}

- (void)setWifiPowerEnabled:(BOOL)a3
{
  self->_wifiPowerEnabled = a3;
}

- (NSMutableDictionary)scenarioTriggerClients
{
  return self->_scenarioTriggerClients;
}

- (void)setScenarioTriggerClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSDate)lastUpdateVisitMonitorWakeTimerDate
{
  return self->_lastUpdateVisitMonitorWakeTimerDate;
}

- (void)setLastUpdateVisitMonitorWakeTimerDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
