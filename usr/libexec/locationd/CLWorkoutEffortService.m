@implementation CLWorkoutEffortService

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
  if (qword_10230DF20 != -1)
    dispatch_once(&qword_10230DF20, &stru_1021AC430);
  return (id)qword_10230DF18;
}

- (CLWorkoutEffortService)init
{
  CLWorkoutEffortService *v2;
  CLWorkoutEffortService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutEffortService;
  v2 = -[CLWorkoutEffortService initWithInboundProtocol:outboundProtocol:](&v5, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLWorkoutEffortServiceProtocol, &OBJC_PROTOCOL___CLWorkoutEffortServiceClientProtocol);
  v3 = v2;
  if (v2)
  {
    -[CLWorkoutEffortService setClients:](v2, "setClients:", 0);
    -[CLWorkoutEffortService setCallbackAdapter:](v3, "setCallbackAdapter:", 0);
  }
  return v3;
}

+ (BOOL)isSupported
{
  if (qword_10230DF30 != -1)
    dispatch_once(&qword_10230DF30, &stru_1021AC450);
  return byte_10230DF28;
}

- (void)beginService
{
  -[CLWorkoutEffortService setClients:](self, "setClients:", +[NSMutableSet set](NSMutableSet, "set"));
  operator new();
}

- (void)setupManager
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (!-[CLWorkoutEffortService manager](self, "manager"))
    operator new();
  if (qword_10229FFD0 != -1)
    dispatch_once(&qword_10229FFD0, &stru_1021AC4C0);
  v3 = qword_10229FFD8;
  if (os_log_type_enabled((os_log_t)qword_10229FFD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up up manager", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFD0 != -1)
      dispatch_once(&qword_10229FFD0, &stru_1021AC4C0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFD8, 0, "Setting up up manager", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutEffortService setupManager]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLWorkoutEffortService registerForAlgorithmSources](self, "registerForAlgorithmSources");
}

- (void)teardownManager
{
  NSObject *v3;
  uint64_t *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (-[CLWorkoutEffortService manager](self, "manager"))
  {
    if (qword_10229FFD0 != -1)
      dispatch_once(&qword_10229FFD0, &stru_1021AC4C0);
    v3 = qword_10229FFD8;
    if (os_log_type_enabled((os_log_t)qword_10229FFD8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down manager", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFD0 != -1)
        dispatch_once(&qword_10229FFD0, &stru_1021AC4C0);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFD8, 0, "Tearing down manager", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutEffortService teardownManager]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    -[CLWorkoutEffortService unregisterForAlgorithmSources](self, "unregisterForAlgorithmSources");
    v4 = -[CLWorkoutEffortService manager](self, "manager");
    if (v4)
    {
      sub_1012AA4A8(v4);
      operator delete();
    }
    -[CLWorkoutEffortService setManager:](self, "setManager:", 0);
  }
}

- (void)endService
{
  CLWorkoutEffortManagerCallbackAdapter *v3;

  -[CLWorkoutEffortService setClients:](self, "setClients:", 0);
  -[CLWorkoutEffortService teardownManager](self, "teardownManager");
  v3 = -[CLWorkoutEffortService callbackAdapter](self, "callbackAdapter");
  if (v3)
    (*((void (**)(CLWorkoutEffortManagerCallbackAdapter *))v3->var0 + 1))(v3);
  -[CLWorkoutEffortService setCallbackAdapter:](self, "setCallbackAdapter:", 0);
}

- (void)registerForAlgorithmSources
{
  sub_1006CB5B4();
}

- (void)unregisterForAlgorithmSources
{
  Client *value;
  Client *v4;
  CLMotionStateMediatorProtocol *fMotionStateMediatorProxy;
  Client *v6;
  Client *v7;

  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 2);
    v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
  fMotionStateMediatorProxy = self->fMotionStateMediatorProxy;
  if (fMotionStateMediatorProxy)
  {
    -[CLMotionStateMediatorProtocol removeClient:prepareSessionEndForSessionType:](fMotionStateMediatorProxy, "removeClient:prepareSessionEndForSessionType:", CLISP_ME_TOKEN, 66);

    self->fMotionStateMediatorProxy = 0;
  }
  v6 = self->fNatalimetryClient.__ptr_.__value_;
  if (v6)
  {
    objc_msgSend(*((id *)v6 + 2), "unregister:forNotification:", *((_QWORD *)v6 + 1), 2);
    objc_msgSend(*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fNatalimetryClient.__ptr_.__value_ + 1), 11);
    objc_msgSend(*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fNatalimetryClient.__ptr_.__value_ + 1), 10);
    v7 = self->fNatalimetryClient.__ptr_.__value_;
    self->fNatalimetryClient.__ptr_.__value_ = 0;
    if (v7)
      (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
  }
}

- (void)registerForUpdates:(id)a3
{
  -[NSMutableSet addObject:](-[CLWorkoutEffortService clients](self, "clients"), "addObject:", a3);
}

- (void)unregisterForUpdates:(id)a3
{
  -[NSMutableSet removeObject:](-[CLWorkoutEffortService clients](self, "clients"), "removeObject:", a3);
}

- (void)notifyClients:(const Result *)a3
{
  __int128 v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = *((_OWORD *)a3 + 1);
  v14 = *(_OWORD *)a3;
  v15 = v3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[CLWorkoutEffortService clients](self, "clients", 0);
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        v17 = v14;
        v18 = v15;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1012AA60C;
        v16[3] = &unk_1021AC500;
        objc_msgSend(v9, "onWorkoutEffortScoreUpdate:", objc_msgSend(v16, "copy"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v19, 16);
    }
    while (v6);
  }
}

- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4
{
  int v5;

  v5 = a3;
  if (-[CLWorkoutEffortService manager](self, "manager"))
    return sub_1014C5DF8((uint64_t)-[CLWorkoutEffortService manager](self, "manager"), v5, a4);
  else
    return 1;
}

- (void)onWorkoutEffortScoreUpdate:(const Result *)a3
{
  objc_msgSend(-[CLWorkoutEffortService universe](self, "universe"), "silo");
  -[CLWorkoutEffortService notifyClients:](self, "notifyClients:", a3);
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v10;
  int v11;
  int v12;
  const char *v13;
  uint8_t *v14;
  _DWORD v15[4];
  uint8_t buf[4];
  int v17;

  objc_msgSend(-[CLWorkoutEffortService universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  if (*a3 == 2)
  {
    if (-[CLWorkoutEffortService manager](self, "manager"))
      sub_1014C53F8((uint64_t)-[CLWorkoutEffortService manager](self, "manager"), (__int128 *)a4);
  }
  else
  {
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_1021AC4E0);
    v10 = qword_10229FF68;
    if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_ERROR))
    {
      v11 = *a3;
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLWorkoutEffortService, unhandled CLMotionStateMediator notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF60 != -1)
        dispatch_once(&qword_10229FF60, &stru_1021AC4E0);
      v12 = *a3;
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 16, "CLWorkoutEffortService, unhandled CLMotionStateMediator notification type, %d", v15);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutEffortService onMotionStateMediatorNotification:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  const char *v13;
  uint8_t *v14;
  _DWORD v15[4];
  uint8_t buf[4];
  int v17;

  objc_msgSend(-[CLWorkoutEffortService universe](self, "universe"), "silo");
  v7 = *a3;
  if (*a3 == 11)
  {
    if (-[CLWorkoutEffortService manager](self, "manager"))
      sub_1014C5228((uint64_t)-[CLWorkoutEffortService manager](self, "manager"), (double *)a4);
  }
  else if (v7 == 10)
  {
    if (-[CLWorkoutEffortService manager](self, "manager"))
    {
      v8 = *(_BYTE *)a4;
      v9 = -[CLWorkoutEffortService manager](self, "manager");
      if (v8)
        sub_1014C38B4((uint64_t)v9);
      else
        sub_1014C38C0((uint64_t)v9);
    }
  }
  else if (v7 == 2)
  {
    if (-[CLWorkoutEffortService manager](self, "manager"))
      sub_1014C5258((uint64_t)-[CLWorkoutEffortService manager](self, "manager"), (uint64_t)a4);
  }
  else
  {
    if (qword_10229FFD0 != -1)
      dispatch_once(&qword_10229FFD0, &stru_1021AC4C0);
    v10 = qword_10229FFD8;
    if (os_log_type_enabled((os_log_t)qword_10229FFD8, OS_LOG_TYPE_ERROR))
    {
      v11 = *a3;
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLWorkoutEffortService, unhandled CLNatalimetryNotifier notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFD0 != -1)
        dispatch_once(&qword_10229FFD0, &stru_1021AC4C0);
      v12 = *a3;
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFD8, 16, "CLWorkoutEffortService, unhandled CLNatalimetryNotifier notification type, %d", v15);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutEffortService onNatalimetryNotification:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)manager
{
  return self->_manager;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

- (CLWorkoutEffortManagerCallbackAdapter)callbackAdapter
{
  return self->_callbackAdapter;
}

- (void)setCallbackAdapter:(CLWorkoutEffortManagerCallbackAdapter *)a3
{
  self->_callbackAdapter = a3;
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;

  value = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
