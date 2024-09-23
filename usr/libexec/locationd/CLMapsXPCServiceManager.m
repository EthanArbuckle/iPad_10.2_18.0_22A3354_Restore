@implementation CLMapsXPCServiceManager

+ (id)sharedInstance
{
  NSObject *v2;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  _QWORD block[5];
  uint8_t buf[1640];

  if (!qword_102307408)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C5ADC4;
    block[3] = &unk_10212BB58;
    block[4] = a1;
    if (qword_102307410 != -1)
      dispatch_once(&qword_102307410, block);
    if (qword_1022A00E0 != -1)
      dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
    v2 = qword_1022A00E8;
    if (os_log_type_enabled((os_log_t)qword_1022A00E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,XPCManager allocate", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00E0 != -1)
        dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
      v6 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00E8, 0, "CLMM,CLTSP,XPCManager allocate", &v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "+[CLMapsXPCServiceManager sharedInstance]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
  return (id)qword_102307408;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "sharedInstance", a3);
}

- (void)createConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  _WORD v17[8];
  uint8_t buf[1640];

  connection = self->_connection;
  if (connection)
  {

    self->_connection = 0;
  }
  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.corelocation.maphelperservice"));
  self->_connection = v4;
  if (v4)
  {
    self->fInactivityTimer = 0;
    self->fTimerUpdateMachContTime = -1.0;
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLMapHelperServiceProtocol));
    v6 = objc_opt_class(NSArray, v5);
    v8 = objc_opt_class(NSString, v7);
    v10 = objc_opt_class(NSDictionary, v9);
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v8, v10, objc_opt_class(NSNumber, v11), 0);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v12, "fetchGEORoadDataAroundCoordinate:inRadius:allowNetwork:isPedestrianOrCycling:clearTiles:withReply:", 0, 1);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v12, "fetchGEOBuildingDataAroundCoordinate:inRadius:tileSetStyle:allowNetwork:clearTiles:withReply:", 0, 1);
    -[NSXPCConnection resume](self->_connection, "resume");
  }
  if (qword_1022A00E0 != -1)
    dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
  v13 = qword_1022A00E8;
  if (os_log_type_enabled((os_log_t)qword_1022A00E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,createConnection", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00E0 != -1)
      dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
    v17[0] = 0;
    LODWORD(v16) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00E8, 0, "CLMM,CLTSP,MapHelperService,createConnection", v17, v16);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager createConnection]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  objc_super v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A00E0 != -1)
    dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
  v3 = qword_1022A00E8;
  if (os_log_type_enabled((os_log_t)qword_1022A00E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,dealloc", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00E0 != -1)
      dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00E8, 0, "CLMM,CLTSP,MapHelperService,dealloc", v7, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager dealloc]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction](self, "releaseMapHelperServiceOSTransaction");
  -[NSXPCConnection invalidate](-[CLMapsXPCServiceManager connection](self, "connection"), "invalidate");

  -[CLMapsXPCServiceManager setConnection:](self, "setConnection:", 0);
  v6.receiver = self;
  v6.super_class = (Class)CLMapsXPCServiceManager;
  -[CLMapsXPCServiceManager dealloc](&v6, "dealloc");
}

- (void)collectMapDataOfType:(int64_t)a3 aroundCoordinate:(CLLocationCoordinate2D)a4 inRadius:(double)a5 allowNetwork:(BOOL)a6 isPedestrianOrCycling:(BOOL)a7 clearTiles:(BOOL)a8 callSynchronously:(BOOL)a9 WithReply:(id)a10
{
  _BOOL4 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  double longitude;
  double latitude;
  NSXPCConnection *connection;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void ***v25;
  void **v26;
  void **v27;
  _QWORD v28[9];
  BOOL v29;
  _QWORD v30[3];
  double v31;
  _QWORD v32[5];
  _QWORD v33[5];

  v11 = a9;
  v12 = a8;
  v13 = a7;
  v14 = a6;
  longitude = a4.longitude;
  latitude = a4.latitude;
  -[CLMapsXPCServiceManager updateTimer](self, "updateTimer");
  connection = self->_connection;
  if (v11)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100C5B4CC;
    v33[3] = &unk_102152378;
    v33[4] = a10;
    v21 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100C5B704;
    v32[3] = &unk_102152378;
    v32[4] = a10;
    v21 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v32);
  }
  v22 = v21;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0.0;
  v31 = sub_1001FCBB4();
  if (a3 == 2)
  {
    v26 = _NSConcreteStackBlock;
    v23 = 1;
    v24 = sub_100C5BEBC;
    v25 = &v26;
LABEL_10:
    v25[1] = (void **)3221225472;
    v25[2] = (void **)v24;
    v25[3] = (void **)&unk_10217C078;
    *((double *)v25 + 6) = latitude;
    *((double *)v25 + 7) = longitude;
    *((double *)v25 + 8) = a5;
    *((_BYTE *)v25 + 72) = v11;
    v25[4] = (void **)a10;
    v25[5] = (void **)v30;
    objc_msgSend(v22, "fetchGEOBuildingDataAroundCoordinate:inRadius:tileSetStyle:allowNetwork:clearTiles:withReply:", v23, v14, v12, latitude, longitude, a5, v26);
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    v23 = 0;
    v27 = _NSConcreteStackBlock;
    v24 = sub_100C5BBFC;
    v25 = &v27;
    goto LABEL_10;
  }
  if (a3)
  {
    (*((void (**)(id, _QWORD))a10 + 2))(a10, 0);
  }
  else
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100C5B93C;
    v28[3] = &unk_10217C078;
    *(double *)&v28[6] = latitude;
    *(double *)&v28[7] = longitude;
    *(double *)&v28[8] = a5;
    v29 = v11;
    v28[4] = a10;
    v28[5] = v30;
    objc_msgSend(v22, "fetchGEORoadDataAroundCoordinate:inRadius:allowNetwork:isPedestrianOrCycling:clearTiles:withReply:", v14, v13, v12, v28, latitude, longitude, a5);
  }
LABEL_12:
  _Block_object_dispose(v30, 8);
}

- (void)clearMemoryAndExitHelperProcessCleanly
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  _WORD v5[8];
  uint8_t buf[1640];

  if (qword_102307408)
  {
    _objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_10217C098), "clearMemoryAndExitCleanly");
  }
  else
  {
    if (qword_1022A00E0 != -1)
      dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
    v2 = qword_1022A00E8;
    if (os_log_type_enabled((os_log_t)qword_1022A00E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00E0 != -1)
        dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
      v5[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00E8, 0, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", v5, 2);
      v4 = (uint8_t *)v3;
      sub_100512490("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager clearMemoryAndExitHelperProcessCleanly]", "%s\n", v3);
      if (v4 != buf)
        free(v4);
    }
  }
}

- (void)updateTimer
{
  NSTimer *fInactivityTimer;
  NSObject *v4;
  double fTimerUpdateMachContTime;
  double v6;
  const char *v7;
  uint8_t *v8;
  _QWORD block[5];
  int v10;
  double v11;
  uint8_t buf[4];
  double v13;

  if (self->fTimerUpdateMachContTime <= 0.0 || vabdd_f64(sub_1001FCBB4(), self->fTimerUpdateMachContTime) >= 60.0)
  {
    self->fTimerUpdateMachContTime = sub_1001FCBB4();
    fInactivityTimer = self->fInactivityTimer;
    if (fInactivityTimer)
    {
      -[NSTimer invalidate](fInactivityTimer, "invalidate");
      self->fInactivityTimer = 0;
    }
    if (qword_1022A00E0 != -1)
      dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
    v4 = qword_1022A00E8;
    if (os_log_type_enabled((os_log_t)qword_1022A00E8, OS_LOG_TYPE_DEFAULT))
    {
      fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
      *(_DWORD *)buf = 134349056;
      v13 = fTimerUpdateMachContTime;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,Inactivity timer updated in XPC manager,updateTime,%{public}.2lf", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00E0 != -1)
        dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
      v6 = self->fTimerUpdateMachContTime;
      v10 = 134349056;
      v11 = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00E8, 0, "CLMM,CLTSP,MapHelperService,Inactivity timer updated in XPC manager,updateTime,%{public}.2lf", &v10, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager updateTimer]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C5C79C;
    block[3] = &unk_10212BB58;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)onTimerFire:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A00E0 != -1)
    dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
  v4 = qword_1022A00E8;
  if (os_log_type_enabled((os_log_t)qword_1022A00E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,onTimerFire", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00E0 != -1)
      dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00E8, 0, "CLMM,CLTSP,MapHelperService,onTimerFire", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager onTimerFire:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  -[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction](self, "releaseMapHelperServiceOSTransaction");
}

- (void)releaseMapHelperServiceOSTransaction
{
  NSObject *v3;
  double fTimerUpdateMachContTime;
  NSTimer *fInactivityTimer;
  NSObject *v6;
  double v7;
  const char *v8;
  uint8_t *v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  int v13;
  double v14;
  uint8_t buf[4];
  double v16;

  if (qword_1022A00E0 != -1)
    dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
  v3 = qword_1022A00E8;
  if (os_log_type_enabled((os_log_t)qword_1022A00E8, OS_LOG_TYPE_DEFAULT))
  {
    fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
    *(_DWORD *)buf = 134349056;
    v16 = fTimerUpdateMachContTime;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,releaseMapHelperServiceOSTransaction,lastTimerUpdateTime,%{public}.2lf", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00E0 != -1)
      dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
    v7 = self->fTimerUpdateMachContTime;
    v13 = 134349056;
    v14 = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00E8, 0, "CLMM,CLTSP,MapHelperService,releaseMapHelperServiceOSTransaction,lastTimerUpdateTime,%{public}.2lf", &v13, 12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  fInactivityTimer = self->fInactivityTimer;
  if (fInactivityTimer)
  {
    -[NSTimer invalidate](fInactivityTimer, "invalidate");
    self->fInactivityTimer = 0;
    self->fTimerUpdateMachContTime = -1.0;
  }
  if (qword_102307408)
  {
    objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_10217C0B8), "releaseOSTransaction");
  }
  else
  {
    if (qword_1022A00E0 != -1)
      dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
    v6 = qword_1022A00E8;
    if (os_log_type_enabled((os_log_t)qword_1022A00E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00E0 != -1)
        dispatch_once(&qword_1022A00E0, &stru_10217C0D8);
      LOWORD(v13) = 0;
      LODWORD(v12) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00E8, 0, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", &v13, v12);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
