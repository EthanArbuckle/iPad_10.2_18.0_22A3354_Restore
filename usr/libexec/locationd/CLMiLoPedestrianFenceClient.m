@implementation CLMiLoPedestrianFenceClient

- (CLMiLoPedestrianFenceClient)init
{
  -[CLMiLoPedestrianFenceClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)initInUniverse:(id)a3 andIdentifier:(id)a4 andRadiusInMeters:(float)a5 andCallback:(id)a6 andStatusCallback:(id)a7 andErrorCallback:(id)a8
{
  CLMiLoPedestrianFenceClient *v14;
  CLPedestrianFenceServiceProtocol *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLMiLoPedestrianFenceClient;
  v14 = -[CLMiLoPedestrianFenceClient init](&v17, "init");
  if (v14)
  {
    v14->_universe = (CLIntersiloUniverse *)a3;
    v14->_delegateQueue = (OS_dispatch_queue *)objc_msgSend(objc_msgSend(a3, "silo"), "queue");
    v14->_onMotionMeasurements = objc_msgSend(a6, "copy");
    v14->_onStatusReport = objc_msgSend(a7, "copy");
    v14->_onErrorIndication = objc_msgSend(a8, "copy");
    v15 = (CLPedestrianFenceServiceProtocol *)objc_msgSend(-[CLIntersiloUniverse vendor](v14->_universe, "vendor"), "proxyForService:", CFSTR("CLPedestrianFenceService"));
    v14->_pedestrianFenceManager = v15;
    -[CLPedestrianFenceServiceProtocol registerDelegate:inSilo:](v15, "registerDelegate:inSilo:", v14, -[CLIntersiloUniverse silo](v14->_universe, "silo"));
    -[CLPedestrianFenceServiceProtocol setDelegateEntityName:](v14->_pedestrianFenceManager, "setDelegateEntityName:", "CLMiLoPedestrianFenceClient");
    v14->_sessionActive = 0;
    v14->_fenceActive = 0;
    v14->_fenceIdStr = (NSString *)a4;
    v14->_valid = 1;
    v14->_radius = a5;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[CLPedestrianFenceServiceProtocol endSessionForClient:](self->_pedestrianFenceManager, "endSessionForClient:", self);
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPedestrianFenceClient;
  -[CLMiLoPedestrianFenceClient dealloc](&v3, "dealloc");
}

- (void)setFence
{
  NSObject *delegateQueue;
  _QWORD v4[5];
  void *__p;
  char v6;

  sub_1015A2E04(&__p, "");
  delegateQueue = self->_delegateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003732D8;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  dispatch_async(delegateQueue, v4);
  if (v6 < 0)
    operator delete(__p);
}

- (void)clearFence
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003736C0;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)startSession
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003739F8;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)endSession
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100373B50;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)didExitFence:(id)a3
{
  NSObject *delegateQueue;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  if (objc_msgSend(a3, "isEqualToString:", self->_fenceIdStr))
  {
    self->_fenceActive = 0;
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100373E30;
    block[3] = &unk_10212BB58;
    block[4] = self;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102131528);
    v6 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289283;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2081;
      v15 = objc_msgSend(a3, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Got fence exit notification for an unknown fence\", \"fenceId\":%{private, location:escape_only}s}", buf, 0x1Cu);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_102131528);
    }
    v7 = qword_1022A00F8;
    if (os_signpost_enabled((os_log_t)qword_1022A00F8))
    {
      v8 = objc_msgSend(a3, "UTF8String");
      *(_DWORD *)buf = 68289283;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2081;
      v15 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Got fence exit notification for an unknown fence", "{\"msg%{public}.0s\":\"Got fence exit notification for an unknown fence\", \"fenceId\":%{private, location:escape_only}s}", buf, 0x1Cu);
    }
  }
}

- (void)didFailWithError:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *delegateQueue;
  _QWORD v8[6];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int64_t v14;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102131528);
  v5 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2049;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Got Failure notification from Pedestrian Fence Manager with\", \"Error Code\":%{private}ld}", buf, 0x1Cu);
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102131528);
  }
  v6 = qword_1022A00F8;
  if (os_signpost_enabled((os_log_t)qword_1022A00F8))
  {
    *(_DWORD *)buf = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2049;
    v14 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Got Failure notification from Pedestrian Fence Manager with", "{\"msg%{public}.0s\":\"Got Failure notification from Pedestrian Fence Manager with\", \"Error Code\":%{private}ld}", buf, 0x1Cu);
  }
  delegateQueue = self->_delegateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100374164;
  v8[3] = &unk_102131360;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(delegateQueue, v8);
}

- (void)sessionStatusReport:(id)a3
{
  NSObject *v5;
  NSObject *delegateQueue;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _WORD v10[8];
  _QWORD block[6];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102131528);
  v5 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMiLoPedestrianFenceClient: Received status report\", \"Status Report\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  if (self->_fenceActive)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003743DC;
    block[3] = &unk_10212BB30;
    block[4] = self;
    block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102131528);
    v7 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Got status report when we didn't have an active fence -- ignoring notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A00F0 != -1)
        dispatch_once(&qword_1022A00F0, &stru_102131528);
      v10[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00F8, 16, "Got status report when we didn't have an active fence -- ignoring notification", v10, 2);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLMiLoPedestrianFenceClient sessionStatusReport:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)fenceActive
{
  return self->_fenceActive;
}

- (id)onMotionMeasurement
{
  return self->_onMotionMeasurement;
}

- (void)setOnMotionMeasurement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end
