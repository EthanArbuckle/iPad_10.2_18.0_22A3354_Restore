@implementation CLNoMovementService

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
  if (qword_102308230 != -1)
    dispatch_once(&qword_102308230, &stru_1021846F8);
  return (id)qword_102308228;
}

- (CLNoMovementService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLNoMovementService;
  return -[CLNoMovementService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLNoMovementServiceProtocol, &OBJC_PROTOCOL___CLNoMovementServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_102308240 != -1)
    dispatch_once(&qword_102308240, &stru_102184718);
  return byte_102308238;
}

- (void)beginService
{
  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  -[CLNoMovementService setClientRegistry:](self, "setClientRegistry:", objc_opt_new(NSMutableSet));
  sub_1006CB5B4();
}

- (void)endService
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  -[CLNoMovementService setClientRegistry:](self, "setClientRegistry:", 0);
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 2);
    v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
  v5 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
  if (v5)
  {
    objc_msgSend(*((id *)v5 + 2), "unregister:forNotification:", *((_QWORD *)v5 + 1), 0);
    v6 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
    self->fWatchOrientationSettingsClient.__ptr_.__value_ = 0;
    if (v6)
      (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  }
  v7 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(void *))(*(_QWORD *)v7 + 8))(v7);
  if (qword_10229FFE0 != -1)
    dispatch_once(&qword_10229FFE0, &stru_102184738);
  v8 = qword_10229FFE8;
  if (os_log_type_enabled((os_log_t)qword_10229FFE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CLNoMovement] service: ended service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFE0 != -1)
      dispatch_once(&qword_10229FFE0, &stru_102184738);
    v11[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFE8, 0, "[CLNoMovement] service: ended service", v11, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLNoMovementService endService]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
}

- (void)registerForStateUpdates:(id)a3
{
  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  -[NSMutableSet addObject:](-[CLNoMovementService clientRegistry](self, "clientRegistry"), "addObject:", a3);
}

- (void)unregisterForStateUpdates:(id)a3
{
  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  -[NSMutableSet removeObject:](-[CLNoMovementService clientRegistry](self, "clientRegistry"), "removeObject:", a3);
}

- (void)requestLatestStateUpdate:(id)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  unsigned int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  unsigned int v19;

  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  notify_post("com.apple.locationd.nomovement.stateupdate");
  v5 = (void *)sub_100EF24BC((uint64_t)&self->fController);
  objc_msgSend(a3, "onStateUpdate:", objc_msgSend(v5, "copy"));
  if (qword_10229FFE0 != -1)
    dispatch_once(&qword_10229FFE0, &stru_102184738);
  v6 = qword_10229FFE8;
  if (os_log_type_enabled((os_log_t)qword_10229FFE8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "startTime");
    *(_DWORD *)buf = 134218240;
    v17 = v7;
    v18 = 1024;
    v19 = objc_msgSend(v5, "state");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CLNoMovement] service: served client request for latest state update,startTime,%f,state,%d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFE0 != -1)
      dispatch_once(&qword_10229FFE0, &stru_102184738);
    v8 = qword_10229FFE8;
    objc_msgSend(v5, "startTime");
    v12 = 134218240;
    v13 = v9;
    v14 = 1024;
    v15 = objc_msgSend(v5, "state");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 0, "[CLNoMovement] service: served client request for latest state update,startTime,%f,state,%d", COERCE_DOUBLE(&v12), 18);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLNoMovementService requestLatestStateUpdate:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
}

- (void)serveClientsStateUpdate
{
  void *v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  const char *v17;
  uint8_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  unsigned int v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  unsigned int v30;
  _BYTE v31[128];

  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  notify_post("com.apple.locationd.nomovement.stateupdate");
  v3 = (void *)sub_100EF24BC((uint64_t)&self->fController);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = -[CLNoMovementService clientRegistry](self, "clientRegistry");
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "onStateUpdate:", objc_msgSend(v3, "copy"));
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v6);
  }
  if (qword_10229FFE0 != -1)
    dispatch_once(&qword_10229FFE0, &stru_102184738);
  v9 = qword_10229FFE8;
  if (os_log_type_enabled((os_log_t)qword_10229FFE8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "startTime");
    v11 = v10;
    v12 = objc_msgSend(v3, "state");
    *(_DWORD *)buf = 134218240;
    v28 = v11;
    v29 = 1024;
    v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[CLNoMovement] service: served all clients state update,startTime,%f,state,%d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFE0 != -1)
      dispatch_once(&qword_10229FFE0, &stru_102184738);
    v13 = qword_10229FFE8;
    objc_msgSend(v3, "startTime");
    v15 = v14;
    v16 = objc_msgSend(v3, "state");
    v23 = 134218240;
    v24 = v15;
    v25 = 1024;
    v26 = v16;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 0, "[CLNoMovement] service: served all clients state update,startTime,%f,state,%d", COERCE_DOUBLE(&v23), 18);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLNoMovementService serveClientsStateUpdate]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
}

- (void)toggleDeviceMotion:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  _WORD v13[8];
  uint8_t buf[1640];

  v3 = a3;
  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  if (sub_1002433D4())
  {
    if (v3)
    {
      if (qword_10229FFE0 != -1)
        dispatch_once(&qword_10229FFE0, &stru_102184738);
      v5 = qword_10229FFE8;
      if (os_log_type_enabled((os_log_t)qword_10229FFE8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CLNoMovement] service: attempt to enable device motion", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFE0 != -1)
          dispatch_once(&qword_10229FFE0, &stru_102184738);
        v13[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFE8, 1, "[CLNoMovement] service: attempt to enable device motion", v13, 2);
        v10 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 2, "-[CLNoMovementService toggleDeviceMotion:]", "%s\n", v9);
        if (v10 != buf)
          free(v10);
      }
      v6 = sub_1002433D4();
      sub_1011932BC(v6, (uint64_t)self->fDeviceMotionDispatcher.__ptr_.__value_, 0.01);
    }
    else
    {
      if (qword_10229FFE0 != -1)
        dispatch_once(&qword_10229FFE0, &stru_102184738);
      v7 = qword_10229FFE8;
      if (os_log_type_enabled((os_log_t)qword_10229FFE8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[CLNoMovement] service: attempt to disable device motion", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFE0 != -1)
          dispatch_once(&qword_10229FFE0, &stru_102184738);
        v13[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFE8, 1, "[CLNoMovement] service: attempt to disable device motion", v13, 2);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLNoMovementService toggleDeviceMotion:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      v8 = sub_1002433D4();
      sub_101193558(v8, (uint64_t)self->fDeviceMotionDispatcher.__ptr_.__value_);
    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const char *v18;
  uint8_t *v19;
  _WORD v20[8];
  __int128 v21[14];
  uint64_t v22;
  uint8_t buf[1640];

  objc_msgSend(-[CLNoMovementService universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  if (*a3 == 2)
  {
    if (qword_10229FFE0 != -1)
      dispatch_once(&qword_10229FFE0, &stru_102184738);
    v10 = qword_10229FFE8;
    if (os_log_type_enabled((os_log_t)qword_10229FFE8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[CLNoMovement] service: received workout-event notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFE0 != -1)
        dispatch_once(&qword_10229FFE0, &stru_102184738);
      v20[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFE8, 1, "[CLNoMovement] service: received workout-event notification", v20, 2);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLNoMovementService onMotionStateMediatorNotification:data:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    v11 = *((_OWORD *)a4 + 13);
    v21[12] = *((_OWORD *)a4 + 12);
    v21[13] = v11;
    v22 = *((_QWORD *)a4 + 28);
    v12 = *((_OWORD *)a4 + 9);
    v21[8] = *((_OWORD *)a4 + 8);
    v21[9] = v12;
    v13 = *((_OWORD *)a4 + 11);
    v21[10] = *((_OWORD *)a4 + 10);
    v21[11] = v13;
    v14 = *((_OWORD *)a4 + 5);
    v21[4] = *((_OWORD *)a4 + 4);
    v21[5] = v14;
    v15 = *((_OWORD *)a4 + 7);
    v21[6] = *((_OWORD *)a4 + 6);
    v21[7] = v15;
    v16 = *((_OWORD *)a4 + 1);
    v21[0] = *(_OWORD *)a4;
    v21[1] = v16;
    v17 = *((_OWORD *)a4 + 3);
    v21[2] = *((_OWORD *)a4 + 2);
    v21[3] = v17;
    sub_100EF24C4((uint64_t)&self->fController, v21);
  }
}

- (void)onWatchOrientationSettingsNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  __int128 v8;
  const char *v9;
  uint8_t *v10;
  _OWORD v11[2];
  _WORD v12[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  if (*a3 == 1)
  {
    if (qword_10229FFE0 != -1)
      dispatch_once(&qword_10229FFE0, &stru_102184738);
    v7 = qword_10229FFE8;
    if (os_log_type_enabled((os_log_t)qword_10229FFE8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[CLNoMovement] service: received wrist-status notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFE0 != -1)
        dispatch_once(&qword_10229FFE0, &stru_102184738);
      v12[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFE8, 1, "[CLNoMovement] service: received wrist-status notification", v12, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLNoMovementService onWatchOrientationSettingsNotification:data:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    v8 = *((_OWORD *)a4 + 1);
    v11[0] = *(_OWORD *)a4;
    v11[1] = v8;
    sub_100EF2C50((uint64_t)&self->fController, (int *)v11);
  }
}

- (void)onDeviceMotionData:(const Sample *)a3
{
  double var0;
  __int128 v6;
  uint64_t v7;
  double v8;
  CFAbsoluteTime Current;

  objc_msgSend(-[CLNoMovementService universe](self, "universe"), "silo");
  v6 = *(_OWORD *)&a3[1].var1.var2;
  var0 = a3->var0;
  v7 = *(_QWORD *)&a3[2].var1.var0;
  v8 = var0;
  Current = CFAbsoluteTimeGetCurrent();
  sub_100EF2E50(&self->fController, (uint64_t)&v6);
}

- (void)onMobileAssetNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v7;
  void **v8;
  NSObject *v9;
  void **v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  _BYTE v16[16];
  void *__p[2];
  uint64_t v18;
  int v19;
  void **v20;
  uint8_t buf[4];
  void **v22;

  objc_msgSend(objc_msgSend(a1, "universe"), "silo");
  if (a3 == 10)
  {
    __p[0] = 0;
    __p[1] = 0;
    v18 = 0;
    (*(void (**)(uint64_t, void **))(*(_QWORD *)a4 + 800))(a4, __p);
    if (qword_10229FFE0 != -1)
      dispatch_once(&qword_10229FFE0, &stru_102184738);
    v7 = qword_10229FFE8;
    if (os_log_type_enabled((os_log_t)qword_10229FFE8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = __p;
      if (v18 < 0)
        v8 = (void **)__p[0];
      *(_DWORD *)buf = 136446210;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CLNoMovement] service: received mobile-asset: %{public}s", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFE0 != -1)
        dispatch_once(&qword_10229FFE0, &stru_102184738);
      v10 = __p;
      if (v18 < 0)
        v10 = (void **)__p[0];
      v19 = 136446210;
      v20 = v10;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFE8, 0, "[CLNoMovement] service: received mobile-asset: %{public}s", &v19, 12);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLNoMovementService onMobileAssetNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    if (sub_10011A5AC(a4))
    {
      sub_100525028(v16);
      sub_100EF2ED4((uint64_t)a1 + 32, (uint64_t)v16);
      sub_10011A5A8(v16);
    }
    else
    {
      if (qword_10229FFE0 != -1)
        dispatch_once(&qword_10229FFE0, &stru_102184738);
      v9 = qword_10229FFE8;
      if (os_log_type_enabled((os_log_t)qword_10229FFE8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[CLNoMovement] service: failed to convert mobile-asset to dict", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFE0 != -1)
          dispatch_once(&qword_10229FFE0, &stru_102184738);
        LOWORD(v19) = 0;
        LODWORD(v15) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFE8, 16, "[CLNoMovement] service: failed to convert mobile-asset to dict", &v19, v15);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 0, "-[CLNoMovementService onMobileAssetNotification:data:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
    }
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
  }
}

- (NSMutableSet)clientRegistry
{
  return self->_clientRegistry;
}

- (void)setClientRegistry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  Client *value;
  void *v4;
  Client *v5;
  Client *v6;

  value = self->fMobileAssetClient.__ptr_.__value_;
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  sub_10011A5A8(&self->fController.fMobileAssetWorkoutSettings);
  sub_100840D24(&self->fController.fDetector);
  v4 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(void *))(*(_QWORD *)v4 + 8))(v4);
  v5 = self->fWatchOrientationSettingsClient.__ptr_.__value_;
  self->fWatchOrientationSettingsClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  v6 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
}

- (id).cxx_construct
{
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  self->fWatchOrientationSettingsClient.__ptr_.__value_ = 0;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  sub_100EF24AC(&self->fController, a2);
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  return self;
}

@end
