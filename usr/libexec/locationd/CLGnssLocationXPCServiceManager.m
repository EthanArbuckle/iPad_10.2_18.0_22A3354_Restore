@implementation CLGnssLocationXPCServiceManager

- (CLGnssLocationXPCServiceManager)init
{
  CLGnssLocationXPCServiceManager *v2;
  NSObject *v3;
  double v4;
  uint8_t *v5;
  uint8_t *v6;
  NSObject *v7;
  double v9;
  uint8_t *v10;
  _WORD v11[8];
  objc_super v12;
  uint8_t buf[1640];

  v12.receiver = self;
  v12.super_class = (Class)CLGnssLocationXPCServiceManager;
  v2 = -[CLGnssLocationXPCServiceManager init](&v12, "init");
  if (v2)
  {
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v3 = qword_1022A00A8;
    if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,init", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00A0 != -1)
        dispatch_once(&qword_1022A00A0, &stru_1021431B0);
      v11[0] = 0;
      v4 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 0, "CLGLS,CLGnssLocationXPCServiceManager,init", v11, 2);
      v6 = v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager init]", "%s\n", v4);
LABEL_19:
      if (v6 != buf)
        free(v6);
    }
  }
  else
  {
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v7 = qword_1022A00A8;
    if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLGLS,CLGnssLocationXPCServiceManager,could not initialize object", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00A0 != -1)
        dispatch_once(&qword_1022A00A0, &stru_1021431B0);
      v11[0] = 0;
      v9 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 16, "CLGLS,CLGnssLocationXPCServiceManager,could not initialize object", v11, 2);
      v6 = v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLGnssLocationXPCServiceManager init]", "%s\n", v9);
      goto LABEL_19;
    }
  }
  *(_WORD *)&v2->fRavenCurrentlyRunning = 0;
  v2->fRavenPlatformInfoData = 0;
  v2->fRavenParametersString = 0;
  return v2;
}

- (id)getConnection
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSSet *v7;
  NSXPCConnection *connection;
  NSXPCConnection *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  result = self->_connection;
  if (!result)
  {
    result = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.corelocation.GNSSLocationService"));
    self->_connection = (NSXPCConnection *)result;
    if (result)
    {
      -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___GNSSLocationServiceProtocol));
      v5 = objc_opt_class(NSString, v4);
      v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(NSData, v6), 0);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v7, "getRavenSolutionWithReply:", 0, 0);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v7, "getRavenSolutionWithReply:", 0, 1);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v7, "getRavenSolutionAtMCTime:WithReply:", 0, 0);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v7, "getRavenSolutionAtMCTime:WithReply:", 0, 1);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](-[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v7, "raiseRavenEventsFromData:", 0, 0);
      connection = self->_connection;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100555C40;
      v11[3] = &unk_10212BB58;
      v11[4] = self;
      -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", v11);
      v9 = self->_connection;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100555DE8;
      v10[3] = &unk_10212BB58;
      v10[4] = self;
      -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v10);
      -[NSXPCConnection activate](self->_connection, "activate");
      return self->_connection;
    }
  }
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  NSXPCConnection *connection;
  NSData *fRavenPlatformInfoData;
  NSString *fRavenParametersString;
  const char *v7;
  uint8_t *v8;
  objc_super v9;
  _WORD v10[8];
  uint8_t buf[1640];

  if (qword_1022A00A0 != -1)
    dispatch_once(&qword_1022A00A0, &stru_1021431B0);
  v3 = qword_1022A00A8;
  if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,dealloc", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v10[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 0, "CLGLS,GNSSLocationService,dealloc", v10, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager dealloc]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");

  }
  self->_connection = 0;
  fRavenPlatformInfoData = self->fRavenPlatformInfoData;
  if (fRavenPlatformInfoData)
  {

    self->fRavenPlatformInfoData = 0;
  }
  fRavenParametersString = self->fRavenParametersString;
  if (fRavenParametersString)
  {

    self->fRavenParametersString = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CLGnssLocationXPCServiceManager;
  -[CLGnssLocationXPCServiceManager dealloc](&v9, "dealloc");
}

- (void)reconfigureRavenIfNeeded
{
  NSObject *v3;
  id v4;
  NSData *fRavenPlatformInfoData;
  NSString *fRavenParametersString;
  const char *v7;
  uint8_t *v8;
  _QWORD v9[5];
  _WORD v10[8];
  uint8_t buf[1640];

  if (self->fRavenCurrentlyRunning
    && self->fConnectionInterruptedAfterRavenConfiguration
    && self->fRavenPlatformInfoData
    && self->fRavenParametersString)
  {
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v3 = qword_1022A00A8;
    if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,reconfigureRavenIfNeeded", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00A0 != -1)
        dispatch_once(&qword_1022A00A0, &stru_1021431B0);
      v10[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 0, "CLGLS,reconfigureRavenIfNeeded", v10, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager reconfigureRavenIfNeeded]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    v4 = -[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy");
    fRavenPlatformInfoData = self->fRavenPlatformInfoData;
    fRavenParametersString = self->fRavenParametersString;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100556380;
    v9[3] = &unk_102142CC0;
    v9[4] = self;
    objc_msgSend(v4, "configureInitializeAndStartRavenSupervisorWithPlatformInfo:withParametersOverrideString:withCompletion:", fRavenPlatformInfoData, fRavenParametersString, v9);
  }
}

- (id)getSynchronousRemoteObjectProxy
{
  return objc_msgSend(-[CLGnssLocationXPCServiceManager getConnection](self, "getConnection"), "synchronousRemoteObjectProxyWithErrorHandler:", &stru_102143168);
}

- (void)configureInitializeAndStartRavenSupervisorWithPlatformInfo:(id)a3 withParametersOverrideString:(id)a4 withCompletion:(id)a5
{
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  uint8_t buf[1640];

  if (qword_1022A00A0 != -1)
    dispatch_once(&qword_1022A00A0, &stru_1021431B0);
  v9 = qword_1022A00A8;
  if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,configureInitializeAndStartRavenSupervisorWithPlatformInfo", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v12[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 0, "CLGLS,CLGnssLocationXPCServiceManager,configureInitializeAndStartRavenSupervisorWithPlatformInfo", v12, 2);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager configureInitializeAndStartRavenSupervisorWithPlatformInfo:withParametersOverrideString:withCompletion:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  objc_msgSend(-[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy"), "configureInitializeAndStartRavenSupervisorWithPlatformInfo:withParametersOverrideString:withCompletion:", a3, a4, a5);
  *(_WORD *)&self->fRavenCurrentlyRunning = 1;
  self->fRavenPlatformInfoData = (NSData *)a3;
  self->fRavenParametersString = (NSString *)a4;
}

- (void)pauseResetAndFreeRavenSupervisorWithCompletion:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _QWORD v8[6];
  _WORD v9[8];
  uint8_t buf[1640];

  if (qword_1022A00A0 != -1)
    dispatch_once(&qword_1022A00A0, &stru_1021431B0);
  v5 = qword_1022A00A8;
  if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,pauseResetAndFreeRavenSupervisor", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 0, "CLGLS,CLGnssLocationXPCServiceManager,pauseResetAndFreeRavenSupervisor", v9, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager pauseResetAndFreeRavenSupervisorWithCompletion:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100556AB8;
  v8[3] = &unk_102142CE8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(-[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy"), "pauseResetAndFreeRavenSupervisorWithCompletion:", v8);
}

- (void)getRavenSolutionAtMCTime:(double)a3 WithReply:(id)a4
{
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[5];
  int v11;
  double v12;
  uint8_t buf[4];
  double v14;

  if (qword_1022A00A0 != -1)
    dispatch_once(&qword_1022A00A0, &stru_1021431B0);
  v7 = qword_1022A00A8;
  if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply,%{public}.2lf", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v11 = 134349056;
    v12 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 0, "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply,%{public}.2lf", &v11, 12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager getRavenSolutionAtMCTime:WithReply:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  -[CLGnssLocationXPCServiceManager reconfigureRavenIfNeeded](self, "reconfigureRavenIfNeeded");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100556CF0;
  v10[3] = &unk_102143190;
  v10[4] = a4;
  objc_msgSend(-[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy"), "getRavenSolutionAtMCTime:WithReply:", v10, a3);
}

- (void)getRavenSolutionWithReply:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _QWORD v8[5];
  _WORD v9[8];
  uint8_t buf[1640];

  if (qword_1022A00A0 != -1)
    dispatch_once(&qword_1022A00A0, &stru_1021431B0);
  v5 = qword_1022A00A8;
  if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 0, "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply", v9, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager getRavenSolutionWithReply:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  -[CLGnssLocationXPCServiceManager reconfigureRavenIfNeeded](self, "reconfigureRavenIfNeeded");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100556ED8;
  v8[3] = &unk_102143190;
  v8[4] = a3;
  objc_msgSend(-[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy"), "getRavenSolutionWithReply:", v8);
}

- (void)raiseRavenEventsFromData:(id)a3
{
  -[CLGnssLocationXPCServiceManager reconfigureRavenIfNeeded](self, "reconfigureRavenIfNeeded");
  objc_msgSend(-[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy"), "raiseRavenEventsFromData:", a3);
}

- (void)reset
{
  NSObject *v3;
  NSData *fRavenPlatformInfoData;
  NSString *fRavenParametersString;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A00A0 != -1)
    dispatch_once(&qword_1022A00A0, &stru_1021431B0);
  v3 = qword_1022A00A8;
  if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,reset", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 0, "CLGLS,GNSSLocationService,reset", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager reset]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  fRavenPlatformInfoData = self->fRavenPlatformInfoData;
  if (fRavenPlatformInfoData)
  {

    self->fRavenPlatformInfoData = 0;
  }
  fRavenParametersString = self->fRavenParametersString;
  if (fRavenParametersString)
  {

    self->fRavenParametersString = 0;
  }
  self->fRavenCurrentlyRunning = 0;
}

- (void)shutdown
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  -[CLGnssLocationXPCServiceManager reset](self, "reset");
  if (self->_connection)
  {
    if (qword_1022A00A0 != -1)
      dispatch_once(&qword_1022A00A0, &stru_1021431B0);
    v3 = qword_1022A00A8;
    if (os_log_type_enabled((os_log_t)qword_1022A00A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,invalidating connection", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00A0 != -1)
        dispatch_once(&qword_1022A00A0, &stru_1021431B0);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00A8, 0, "CLGLS,GNSSLocationService,invalidating connection", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager shutdown]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
