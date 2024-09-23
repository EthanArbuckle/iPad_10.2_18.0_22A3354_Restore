@implementation CLMobilityWalkingBoutService

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  if (!*a3)
    sub_1000DBD44((uint64_t)self->fBoutExtractor.__ptr_.__value_, (uint64_t)a4 + 8);
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
  if (qword_102308DD8 != -1)
    dispatch_once(&qword_102308DD8, &stru_102190780);
  return (id)qword_102308DD0;
}

- (CLMobilityWalkingBoutService)init
{
  CLMobilityWalkingBoutService *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLMobilityWalkingBoutService;
  v2 = -[CLMobilityWalkingBoutService initWithInboundProtocol:outboundProtocol:](&v4, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMobilityWalkingBoutServiceProtocol, &OBJC_PROTOCOL___CLMobilityWalkingBoutServiceClientProtocol);
  if (v2)
  {
    -[CLMobilityWalkingBoutService setBoutClients:](v2, "setBoutClients:", objc_opt_new(NSMutableSet));
    -[CLMobilityWalkingBoutService setSteadinessClients:](v2, "setSteadinessClients:", objc_opt_new(NSMutableSet));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMobilityWalkingBoutService;
  -[CLMobilityWalkingBoutService dealloc](&v3, "dealloc");
}

+ (BOOL)isSupported
{
  if (qword_102308DE8 != -1)
    dispatch_once(&qword_102308DE8, &stru_1021907A0);
  return byte_102308DE0;
}

- (void)beginService
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  const char *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 buf;

  if (qword_10229FE90 != -1)
    dispatch_once(&qword_10229FE90, &stru_1021908E8);
  v3 = qword_10229FE98;
  if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Starting up CLMobilityWalkingBoutService", (uint8_t *)&buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    LOWORD(v9) = 0;
    _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FE98, 2, "Starting up CLMobilityWalkingBoutService", &v9, 2);
    v8 = (__int128 *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService beginService]", "%s\n", v7);
    if (v8 != &buf)
      free(v8);
  }
  LOBYTE(v10) = 0;
  sub_100EC6344((unsigned __int8 *)&v10, &buf);
  sub_1002B7674((uint64_t)&self->fBoutBoundaryDb, &buf);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  operator new();
}

- (void)endService
{
  NSObject *v3;
  NSObject *fAggregationTimer;
  uint64_t v5;
  Client *value;
  Client *v7;
  Client *v8;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  uint8_t buf[1640];

  if (qword_10229FE90 != -1)
    dispatch_once(&qword_10229FE90, &stru_1021908E8);
  v3 = qword_10229FE98;
  if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Shutting down CLMobilityWalkingBoutService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v11[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 2, "Shutting down CLMobilityWalkingBoutService", v11, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService endService]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }
  if (sub_1001FBB04(0))
  {
    v5 = sub_1001FBB04(0);
    sub_1000A4A6C(v5, 27, (uint64_t)self->fSPUGaitMetricsDispatcher.__ptr_.__value_);
  }
  value = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v7 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
  v8 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);

  self->fHealthKitWriter = 0;
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  int v8;
  int v9;
  const char *v10;
  uint8_t *v11;
  _DWORD v12[4];
  uint8_t buf[4];
  int v14;

  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
  if (*a3)
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v7 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_ERROR))
    {
      v8 = *a3;
      *(_DWORD *)buf = 67240192;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLMobilityWalkingBoutService: Received unexpected type %{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v9 = *a3;
      v12[0] = 67240192;
      v12[1] = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 16, "CLMobilityWalkingBoutService: Received unexpected type %{public}d", v12, 8);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onStepCountNotification:data:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
  else
  {
    sub_100C29528((uint64_t)self->fBoutExtractor.__ptr_.__value_, (uint64_t)a4);
  }
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint8_t *v15;
  int v16;
  const char *v17;
  uint8_t *v18;
  _OWORD v19[2];
  _OWORD v20[2];
  _DWORD v21[4];
  uint8_t buf[4];
  int v23;

  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
  if (*a3 == 2)
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v7 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLMobilityWalkingBoutService: Received user info update", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      LOWORD(v21[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 2, "CLMobilityWalkingBoutService: Received user info update", v21, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onUserInfoUpdate:data:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    if (!sub_1018CBFA4((uint64_t)a4, (uint64_t)&self->_previousBodyMetrics))
    {
      sub_100C2A484((uint64_t)self->fBoutExtractor.__ptr_.__value_, (__int128 *)a4);
      sub_1014A1304((uint64_t)self->fSteadinessClassifier.__ptr_.__value_, (uint64_t)a4);
      v8 = *((_OWORD *)a4 + 1);
      v19[0] = *(_OWORD *)a4;
      v19[1] = v8;
      v20[0] = *((_OWORD *)a4 + 2);
      *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)((char *)a4 + 44);
      -[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:](self, "checkForHistoricalComputeTrigger:", v19);
    }
    v9 = *(_OWORD *)a4;
    v10 = *((_OWORD *)a4 + 1);
    v11 = *((_OWORD *)a4 + 2);
    *(_OWORD *)&self->_previousBodyMetrics.runVo2max = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)&self->_previousBodyMetrics.vo2max = v10;
    *(_OWORD *)&self->_previousBodyMetrics.hronset = v11;
    *(_OWORD *)&self->_previousBodyMetrics.gender = v9;
  }
  else
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v12 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *a3;
      *(_DWORD *)buf = 67109120;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v16 = *a3;
      v21[0] = 67109120;
      v21[1] = v16;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 0, "#Warning Unhandled notification type, %d", v21);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onUserInfoUpdate:data:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
  }
}

- (void)onStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if ((*a3 == 17 || *a3 == 11) && !self->fIsMigrationComplete && *(_BYTE *)a4 != 0)
  {
    self->fIsMigrationComplete = 1;
    objc_msgSend(*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fDaemonStatusClient.__ptr_.__value_ + 1), 11);
    objc_msgSend(*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fDaemonStatusClient.__ptr_.__value_ + 1), 17);
  }
}

- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4
{
  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
  if (!*a3)
    sub_100C2AD6C((uint64_t)self->fBoutExtractor.__ptr_.__value_, (uint64_t)a4);
}

- (void)onSPUGaitMetrics:(const SPUGaitMetrics *)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  sub_100197040();
  if ((sub_1001B7910() & 0x20000000000000) == 0)
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v5 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "This device is not expected to support Gait Metrics. Please file a radar: rdar://component/1021534", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 17, "This device is not expected to support Gait Metrics. Please file a radar: rdar://component/1021534", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onSPUGaitMetrics:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
  sub_100C2A6A4((uint64_t)self->fBoutExtractor.__ptr_.__value_, (uint64_t)a3);
}

- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  const char *v13;
  uint8_t *v14;
  _DWORD v15[4];
  uint8_t buf[4];
  int v17;

  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
  if (*a3 == 5)
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v7 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "companionConnected notification received.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      LOWORD(v15[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 2, "companionConnected notification received.", v15, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onCompanionNotification:data:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    self->fCompanionConnected = *(_BYTE *)a4;
  }
  else
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v8 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_ERROR))
    {
      v9 = *a3;
      *(_DWORD *)buf = 67109120;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v12 = *a3;
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 16, "Unhandled notification type, %d", v15);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onCompanionNotification:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (void)onMobilityProcessBoutsActivity:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint8_t *v10;
  _QWORD v11[5];
  int v12;
  const char *v13;
  __int16 v14;
  xpc_activity_state_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  xpc_activity_state_t v19;

  if (!a3)
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v7 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "com.apple.locationd.Mobility.ProcessBouts";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v12 = 136315138;
    v13 = "com.apple.locationd.Mobility.ProcessBouts";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 16, "Invalid xpc activity (%s).", &v12);
LABEL_22:
    v10 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onMobilityProcessBoutsActivity:]", "%s\n", v8);
    if (v10 != buf)
      free(v10);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100EB9594;
    v11[3] = &unk_10213F4C0;
    v11[4] = a3;
    -[CLMobilityWalkingBoutService checkForBoutsReadyToProcessWithCompletion:activity:](self, "checkForBoutsReadyToProcessWithCompletion:activity:", v11, a3);
    return;
  }
  if (qword_10229FE90 != -1)
    dispatch_once(&qword_10229FE90, &stru_1021908E8);
  v9 = qword_10229FE98;
  if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "com.apple.locationd.Mobility.ProcessBouts";
    v18 = 2048;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v12 = 136315394;
    v13 = "com.apple.locationd.Mobility.ProcessBouts";
    v14 = 2048;
    v15 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 16, "Unexpected activity (%s) state: %ld", &v12, 22);
    goto LABEL_22;
  }
}

- (void)onMobilityClassificationActivity:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint8_t *v10;
  _QWORD v11[6];
  int v12;
  const char *v13;
  __int16 v14;
  xpc_activity_state_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  xpc_activity_state_t v19;

  if (!a3)
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v7 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc classification activity.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    LOWORD(v12) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 16, "Invalid xpc classification activity.");
LABEL_22:
    v10 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onMobilityClassificationActivity:]", "%s\n", v8);
    if (v10 != buf)
      free(v10);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100EB9C04;
    v11[3] = &unk_1021907C8;
    v11[4] = a3;
    v11[5] = self;
    -[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:](self, "classifySteadinessWithCompletion:activity:", v11, a3);
    return;
  }
  if (qword_10229FC40 != -1)
    dispatch_once(&qword_10229FC40, &stru_102190908);
  v9 = qword_10229FC48;
  if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "com.apple.locationd.Mobility.Classification";
    v18 = 2048;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v12 = 136315394;
    v13 = "com.apple.locationd.Mobility.Classification";
    v14 = 2048;
    v15 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 16, "Unexpected activity (%s) state: %ld", &v12, 22);
    goto LABEL_22;
  }
}

- (void)onDataCollectionRequested:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100EB9E98;
  v3[3] = &unk_102159978;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo"), "queue"), v3);
}

- (void)onAggregationTimer
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100EBA324;
  v2[3] = &unk_10213F4C0;
  v2[4] = self;
  -[CLMobilityWalkingBoutService checkForBoutsReadyToProcessWithCompletion:activity:](self, "checkForBoutsReadyToProcessWithCompletion:activity:", v2, 0);
}

- (void)onMobilityCompanionSyncActivity:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  _BOOL8 fCompanionConnected;
  CLMobilityWalkingBoutService *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t *value;
  double v14;
  double Current;
  NSData *v16;
  NSData *v17;
  NSObject *v18;
  NSObject *v19;
  xpc_activity_state_t v20;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  const char *v24;
  uint8_t *v25;
  const char *v26;
  uint8_t *v27;
  uint64_t v28;
  xpc_activity_state_t v29;
  uint8_t *v30;
  uint64_t v31;
  _QWORD v32[5];
  int v33;
  const char *v34;
  __int16 v35;
  xpc_activity_state_t v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  xpc_activity_state_t v40;

  if (!a3)
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v7 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "com.apple.locationd.Mobility.CompanionSync";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "XPC Mobility Sync: Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v33 = 136315138;
      v34 = "com.apple.locationd.Mobility.CompanionSync";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 16, "XPC Mobility Sync: Invalid xpc activity (%s).", (const char *)&v33);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
    fCompanionConnected = self->fCompanionConnected;
    v9 = self;
    v10 = 0;
    goto LABEL_12;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    if (-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:](self, "checkDeferMobilityCompanionSyncActivity:", a3))
    {
      -[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:](self, "sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:", 0, 0, 1, 1, self->fCompanionConnected);
      return;
    }
    if (self->fCompanionConnected)
    {
      value = (uint64_t *)self->fMobilityCalManager.__ptr_.__value_;
      v14 = CFAbsoluteTimeGetCurrent() - (double)qword_102308DC8;
      Current = CFAbsoluteTimeGetCurrent();
      v16 = sub_10147BA78(value, v14, Current);
      v17 = v16;
      if (v16 && -[NSData length](v16, "length"))
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100EBC4B0;
        v32[3] = &unk_102155328;
        v32[4] = v17;
        objc_msgSend(objc_msgSend(objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLCompanionNotifier")), "doAsync:", v32);
      }
      else
      {
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v18 = qword_10229FE98;
        if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "XPC Mobility Sync: No data to send", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE90 != -1)
            dispatch_once(&qword_10229FE90, &stru_1021908E8);
          LOWORD(v33) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 0, "XPC Mobility Sync: No data to send", &v33, 2);
          v25 = (uint8_t *)v24;
          sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]", "%s\n", v24);
          if (v25 != buf)
            free(v25);
        }
      }
      -[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:](self, "sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:", -[NSData length](v17, "length"), 1, 0, 1, self->fCompanionConnected);
      if (xpc_activity_set_state((xpc_activity_t)a3, 5))
        return;
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v19 = qword_10229FE98;
      if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_FAULT))
      {
        v20 = xpc_activity_get_state((xpc_activity_t)a3);
        *(_DWORD *)buf = 136446466;
        v38 = "com.apple.locationd.Mobility.CompanionSync";
        v39 = 2050;
        v40 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "XPC Mobility Sync: failed to mark %{public}s activity as Done. Current state is %{public}ld", buf, 0x16u);
      }
      if (!sub_1001BFF7C(115, 0))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v28 = qword_10229FE98;
      v29 = xpc_activity_get_state((xpc_activity_t)a3);
      v33 = 136446466;
      v34 = "com.apple.locationd.Mobility.CompanionSync";
      v35 = 2050;
      v36 = v29;
      LODWORD(v31) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v28, 17, "XPC Mobility Sync: failed to mark %{public}s activity as Done. Current state is %{public}ld", &v33, v31);
LABEL_58:
      v30 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]", "%s\n", v12);
      if (v30 != buf)
        free(v30);
      return;
    }
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v21 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[PhoneService] Cannot send data, companion not nearby", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      LOWORD(v33) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 0, "[PhoneService] Cannot send data, companion not nearby", &v33, 2);
      v27 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService onMobilityCompanionSyncActivity:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
    -[CLMobilityWalkingBoutService setCompanionSyncActivityAsDone:](self, "setCompanionSyncActivityAsDone:", a3);
    fCompanionConnected = self->fCompanionConnected;
    v9 = self;
    v10 = 1;
LABEL_12:
    -[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:](v9, "sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:", 0, 0, 0, v10, fCompanionConnected);
    return;
  }
  if (qword_10229FE90 != -1)
    dispatch_once(&qword_10229FE90, &stru_1021908E8);
  v11 = qword_10229FE98;
  if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "com.apple.locationd.Mobility.CompanionSync";
    v39 = 2048;
    v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "XPC Mobility Sync: Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v33 = 136315394;
    v34 = "com.apple.locationd.Mobility.CompanionSync";
    v35 = 2048;
    v36 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 16, "XPC Mobility Sync: Unexpected activity (%s) state: %ld", &v33, 22);
    goto LABEL_58;
  }
}

- (BOOL)checkDeferMobilityCompanionSyncActivity:(id)a3
{
  _BOOL4 should_defer;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  xpc_activity_state_t state;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  xpc_activity_state_t v14;
  const char *v15;
  uint64_t v17;
  int v18;
  const char *v19;
  uint8_t buf[4];
  const char *v21;

  if (a3)
  {
    should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v5 = qword_10229FE98;
      if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "com.apple.locationd.Mobility.CompanionSync";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "XPC Mobility Sync: Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v18 = 136446210;
        v19 = "com.apple.locationd.Mobility.CompanionSync";
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 1, "XPC Mobility Sync: Cancelling (%{public}s) early due to deferral.", &v18, 12);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      if (xpc_activity_set_state((xpc_activity_t)a3, 3))
      {
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v6 = qword_10229FE98;
        if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "XPC Mobility Sync: Activity deferred", buf, 2u);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_24;
        bzero(buf, 0x65CuLL);
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        LOWORD(v18) = 0;
        LODWORD(v17) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 1, "XPC Mobility Sync: Activity deferred", &v18, v17);
        v8 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]", "%s\n", v7);
        if (v8 == buf)
          goto LABEL_24;
      }
      else
      {
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v9 = qword_10229FE98;
        if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_FAULT))
        {
          state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          v21 = (const char *)state;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "XPC Mobility Sync: Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
        }
        if (!sub_1001BFF7C(115, 0))
          goto LABEL_24;
        bzero(buf, 0x65CuLL);
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v13 = qword_10229FE98;
        v14 = xpc_activity_get_state((xpc_activity_t)a3);
        v18 = 134349056;
        v19 = (const char *)v14;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 17, "XPC Mobility Sync: Failed to defer activity. Current state is %{public}ld", &v18, v17);
        v8 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService checkDeferMobilityCompanionSyncActivity:]", "%s\n", v15);
        if (v8 == buf)
          goto LABEL_24;
      }
      free(v8);
LABEL_24:
      LOBYTE(should_defer) = 1;
    }
  }
  else
  {
    LOBYTE(should_defer) = 0;
  }
  return should_defer;
}

- (void)setCompanionSyncActivityAsDone:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  const char *v9;
  __int16 v10;
  xpc_activity_state_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  xpc_activity_state_t state;

  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v4 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "com.apple.locationd.Mobility.CompanionSync";
      v14 = 2050;
      state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "[PhoneService] failed to mark %{public}s activity as Done. Current state is %{public}ld", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v5 = qword_10229FE98;
      v8 = 136446466;
      v9 = "com.apple.locationd.Mobility.CompanionSync";
      v10 = 2050;
      v11 = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 17, "[PhoneService] failed to mark %{public}s activity as Done. Current state is %{public}ld", &v8, 22);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService setCompanionSyncActivityAsDone:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (BOOL)checkDeferRequestForBoutsActivity:(id)a3
{
  _BOOL4 should_defer;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  xpc_activity_state_t state;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  xpc_activity_state_t v14;
  const char *v15;
  uint64_t v17;
  int v18;
  const char *v19;
  uint8_t buf[4];
  const char *v21;

  if (a3)
  {
    should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v5 = qword_10229FE98;
      if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "com.apple.locationd.Mobility.ProcessBouts";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v18 = 136446210;
        v19 = "com.apple.locationd.Mobility.ProcessBouts";
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 1, "BoutService: Cancelling (%{public}s) early due to deferral.", &v18, 12);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      if (xpc_activity_set_state((xpc_activity_t)a3, 3))
      {
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v6 = qword_10229FE98;
        if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BoutService: Activity deferred", buf, 2u);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_24;
        bzero(buf, 0x65CuLL);
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        LOWORD(v18) = 0;
        LODWORD(v17) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 1, "BoutService: Activity deferred", &v18, v17);
        v8 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]", "%s\n", v7);
        if (v8 == buf)
          goto LABEL_24;
      }
      else
      {
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v9 = qword_10229FE98;
        if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_FAULT))
        {
          state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          v21 = (const char *)state;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
        }
        if (!sub_1001BFF7C(115, 0))
          goto LABEL_24;
        bzero(buf, 0x65CuLL);
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v13 = qword_10229FE98;
        v14 = xpc_activity_get_state((xpc_activity_t)a3);
        v18 = 134349056;
        v19 = (const char *)v14;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 17, "Failed to defer activity. Current state is %{public}ld", &v18, v17);
        v8 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:]", "%s\n", v15);
        if (v8 == buf)
          goto LABEL_24;
      }
      free(v8);
LABEL_24:
      LOBYTE(should_defer) = 1;
    }
  }
  else
  {
    LOBYTE(should_defer) = 0;
  }
  return should_defer;
}

- (void)checkForBoutsReadyToProcessWithCompletion:(id)a3 activity:(id)a4
{
  id *ptr;
  _QWORD v8[9];
  double v9;
  double v10;

  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
  v9 = 0.0;
  v10 = 0.0;
  if (sub_100C2AF10(self->fBoutExtractor.__ptr_.__value_, &v10, &v9))
  {
    if (-[CLMobilityWalkingBoutService checkDeferRequestForBoutsActivity:](self, "checkDeferRequestForBoutsActivity:", a4))
    {
      (*((void (**)(id, uint64_t))a3 + 2))(a3, 103);
    }
    else
    {
      ptr = (id *)self->fHKQueryDelegate.__ptr_;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100EBD07C;
      v8[3] = &unk_102190850;
      *(double *)&v8[7] = v10;
      *(double *)&v8[8] = v9;
      v8[5] = a4;
      v8[6] = a3;
      v8[4] = self;
      sub_1010DE2B0(ptr, (uint64_t)v8, v10, v9);
      sub_100E65844(self->fSmoothedGaitMetricsProcessor.__ptr_.__value_);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 109);
  }
}

- (void)handleBoutResults:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult
{
  NSObject *v5;
  unint64_t v6;
  vector<CLMobility::ProcessedBoutResult, std::allocator<CLMobility::ProcessedBoutResult>> *v7;
  ProcessedBoutResult *v8;
  ProcessedBoutResult *v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  NSMutableSet *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  NSDate *v30;
  NSDate *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  unint64_t v37;
  uint64_t v38;
  int v39;
  const char *v40;
  uint8_t *v41;
  ProcessedBoutResult *v42;
  uint64_t v43;
  ProcessedBoutResult *var1;
  ProcessedBoutResult *var0;
  const char *v46;
  uint8_t *v47;
  double v48;
  int v49;
  vector<CLMobility::ProcessedBoutResult, std::allocator<CLMobility::ProcessedBoutResult>> *v50;
  void *__p;
  void *v52;
  uint64_t v53;
  _OWORD v54[14];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  int v60;
  unint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  int v65;
  uint8_t buf[4];
  unint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  int v71;

  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
  v50 = a3;
  if (-[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count")
    && a3->var1 != a3->var0)
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v5 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
    {
      v6 = 0xEEEEEEEEEEEEEEEFLL * ((v50->var1 - v50->var0) >> 4);
      *(_DWORD *)buf = 134218240;
      v67 = v6;
      v68 = 1024;
      LODWORD(v69) = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CLMobilityWalkingBoutService: Sending %lu bout metrics to %d client(s)", buf, 0x12u);
    }
    a3 = v50;
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v43 = qword_10229FE98;
      var0 = v50->var0;
      var1 = v50->var1;
      v60 = 134218240;
      v61 = 0xEEEEEEEEEEEEEEEFLL * ((var1 - var0) >> 4);
      v62 = 1024;
      LODWORD(v63) = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v43, 1, "CLMobilityWalkingBoutService: Sending %lu bout metrics to %d client(s)", &v60, 18);
      v47 = (uint8_t *)v46;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService handleBoutResults:]", "%s\n", v46);
      if (v47 != buf)
        free(v47);
      a3 = v50;
    }
  }
  v7 = a3;
  v8 = a3->var0;
  v9 = v7->var1;
  if (v8 == v9)
  {
    v42 = v8;
  }
  else
  {
    do
    {
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v10 = qword_10229FE98;
      if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEBUG))
      {
        v11 = *((_QWORD *)v8 + 3);
        v12 = *((_QWORD *)v8 + 4);
        v13 = *((_DWORD *)v8 + 10);
        *(_DWORD *)buf = 134218496;
        v67 = v11;
        v68 = 2048;
        v69 = v12;
        v70 = 1024;
        v71 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Bout metrics result, startTime, %.2f, endTime, %.2f, stepCount, %d", buf, 0x1Cu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE90 != -1)
          dispatch_once(&qword_10229FE90, &stru_1021908E8);
        v37 = *((_QWORD *)v8 + 3);
        v38 = *((_QWORD *)v8 + 4);
        v39 = *((_DWORD *)v8 + 10);
        v60 = 134218496;
        v61 = v37;
        v62 = 2048;
        v63 = v38;
        v64 = 1024;
        v65 = v39;
        LODWORD(v48) = 28;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 2, "Bout metrics result, startTime, %.2f, endTime, %.2f, stepCount, %d", COERCE_DOUBLE(&v60), v48, v49);
        v41 = (uint8_t *)v40;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService handleBoutResults:]", "%s\n", v40);
        if (v41 != buf)
          free(v41);
      }
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v14 = -[CLMobilityWalkingBoutService boutClients](self, "boutClients");
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v56 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
            v19 = *((_OWORD *)v8 + 1);
            v20 = *((_OWORD *)v8 + 2);
            v21 = *((_OWORD *)v8 + 3);
            v22 = *((_OWORD *)v8 + 4);
            v23 = *((_OWORD *)v8 + 6);
            v54[4] = *((_OWORD *)v8 + 5);
            v54[5] = v23;
            v24 = *((_OWORD *)v8 + 7);
            v25 = *((_OWORD *)v8 + 9);
            v26 = *((_OWORD *)v8 + 10);
            v54[7] = *((_OWORD *)v8 + 8);
            v54[8] = v25;
            v27 = *((_OWORD *)v8 + 11);
            v28 = *((_OWORD *)v8 + 12);
            v29 = *((_OWORD *)v8 + 14);
            v54[12] = *((_OWORD *)v8 + 13);
            v54[13] = v29;
            v54[10] = v27;
            v54[11] = v28;
            v54[9] = v26;
            v54[6] = v24;
            v54[2] = v21;
            v54[3] = v22;
            v54[0] = v19;
            v54[1] = v20;
            objc_msgSend(v18, "onMobilityBoutMetrics:", v54);
          }
          v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        }
        while (v15);
      }
      if (!*((_DWORD *)v8 + 17))
      {
        v30 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *((double *)v8 + 3));
        v31 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *((double *)v8 + 4));
        v32 = *((_DWORD *)v8 + 17);
        if (v32)
          v33 = 42;
        else
          v33 = -1;
        if ((v33 & *((_DWORD *)v8 + 52)) == 0)
        {
          -[CLMobilityHealthKitWriter writeToHealthKitType:value:startDate:endDate:](self->fHealthKitWriter, "writeToHealthKitType:value:startDate:endDate:", 0, v30, v31, *((double *)v8 + 16));
          v32 = *((_DWORD *)v8 + 17);
        }
        if (v32)
          v34 = 42;
        else
          v34 = -1;
        if ((v34 & *((_DWORD *)v8 + 53)) == 0)
        {
          -[CLMobilityHealthKitWriter writeToHealthKitType:value:startDate:endDate:](self->fHealthKitWriter, "writeToHealthKitType:value:startDate:endDate:", 1, v30, v31, *((double *)v8 + 17));
          v32 = *((_DWORD *)v8 + 17);
        }
        if (v32)
          v35 = 42;
        else
          v35 = -1;
        if ((v35 & *((_DWORD *)v8 + 54)) == 0)
        {
          -[CLMobilityHealthKitWriter writeToHealthKitType:value:startDate:endDate:](self->fHealthKitWriter, "writeToHealthKitType:value:startDate:endDate:", 2, v30, v31, *((double *)v8 + 18));
          v32 = *((_DWORD *)v8 + 17);
        }
        if (v32)
          v36 = 42;
        else
          v36 = -1;
        if ((v36 & *((_DWORD *)v8 + 55)) == 0)
          -[CLMobilityHealthKitWriter writeToHealthKitType:value:startDate:endDate:deviceSide:](self->fHealthKitWriter, "writeToHealthKitType:value:startDate:endDate:deviceSide:", 3, v30, v31, *((unsigned __int8 *)v8 + 64), *((double *)v8 + 19));
      }
      (*(void (**)(BoutMetricsRecorderDb *, uint64_t))(*(_QWORD *)self->fBoutMetricsDb.__ptr_ + 152))(self->fBoutMetricsDb.__ptr_, (uint64_t)v8 + 16);
      sub_100C2FD2C(self->fBoutExtractor.__ptr_.__value_);
      v8 = (ProcessedBoutResult *)((char *)v8 + 240);
    }
    while (v8 != v9);
    v42 = v50->var0;
    v8 = v50->var1;
  }
  __p = 0;
  v52 = 0;
  v53 = 0;
  sub_100EC70B0(&__p, v42, (uint64_t)v8, 0xEEEEEEEEEEEEEEEFLL * ((v8 - v42) >> 4));
  -[CLMobilityWalkingBoutService sendAnalyticsBoutMetrics:](self, "sendAnalyticsBoutMetrics:", &__p);
  if (__p)
  {
    v52 = __p;
    operator delete(__p);
  }
}

- (void)classifySteadinessWithCompletion:(id)a3 activity:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  xpc_activity_state_t state;
  NSObject *v11;
  const char *v12;
  char *v13;
  double Current;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  char *v24;
  NSObject *v25;
  uint64_t v26;
  double v27;
  void *v28;
  id v29;
  NSObject *v30;
  id *ptr;
  id v32;
  NSObject *v33;
  const char *v34;
  char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  char *v39;
  const char *v40;
  char *v41;
  const char *v42;
  uint64_t v43;
  _QWORD v44[11];
  _OWORD v45[5];
  _WORD v46[8];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD v55[5];
  _BYTE buf[18];
  __int16 v57;
  const char *v58;

  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
  if (self->fIsMigrationComplete)
  {
    if (-[CLMobilityHealthKitWriter isWalkingSteadinessAvailable](self->fHealthKitWriter, "isWalkingSteadinessAvailable"))
    {
      if (self->fClassificationInProgress)
      {
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_102190908);
        v7 = qword_10229FC48;
        if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#warning: Classification already in progress", buf, 2u);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_68;
        bzero(buf, 0x65CuLL);
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_102190908);
        LOWORD(v55[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 1, "#warning: Classification already in progress", v55, 2);
        v13 = (char *)v36;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v36);
        if (v13 == buf)
          goto LABEL_68;
        goto LABEL_89;
      }
      if (a4 && xpc_activity_should_defer((xpc_activity_t)a4))
      {
        state = xpc_activity_get_state((xpc_activity_t)a4);
        if (xpc_activity_set_state((xpc_activity_t)a4, 3))
        {
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_102190908);
          v11 = qword_10229FC48;
          if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#warning: Classification deferred", buf, 2u);
          }
          if (!sub_1001BFF7C(115, 2))
            goto LABEL_68;
          bzero(buf, 0x65CuLL);
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_102190908);
          LOWORD(v55[0]) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 1, "#warning: Classification deferred", v55, 2);
          v13 = (char *)v12;
          sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v12);
        }
        else
        {
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_102190908);
          v33 = qword_10229FC48;
          if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134349056;
            *(_QWORD *)&buf[4] = state;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Failed to mark activity as Deferred. Current state is %{public}ld", buf, 0xCu);
          }
          if (!sub_1001BFF7C(115, 0))
            goto LABEL_68;
          bzero(buf, 0x65CuLL);
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_102190908);
          LODWORD(v55[0]) = 134349056;
          *(_QWORD *)((char *)v55 + 4) = state;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 17, "Failed to mark activity as Deferred. Current state is %{public}ld", v55, 12);
          v13 = (char *)v42;
          sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v42);
        }
        if (v13 == buf)
        {
LABEL_68:
          (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
          return;
        }
LABEL_89:
        free(v13);
        goto LABEL_68;
      }
      self->fClassificationInProgress = 1;
      Current = CFAbsoluteTimeGetCurrent();
      v51 = 0;
      v52 = (double *)&v51;
      v53 = 0x2020000000;
      v54 = 0;
      v47 = 0;
      v48 = &v47;
      v49 = 0x2020000000;
      v50 = 0;
      v15 = sub_100127B9C();
      sub_100081C10(v15, buf);
      sub_1001FD98C(*(uint64_t *)buf, "steadinessClassificationNextClassificationTime", v52 + 3);
      v16 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v17 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      v19 = v52[3];
      if (v19 <= Current + -7776000.0)
      {
        v52[3] = Current + -7776000.0;
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_102190908);
        v25 = qword_10229FC48;
        if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEFAULT))
        {
          v26 = *((_QWORD *)v52 + 3);
          *(_DWORD *)buf = 134349056;
          *(_QWORD *)&buf[4] = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Checking for historical samples -- setting classification time in the past: (%{public}.2f)", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_102190908);
          v37 = *((_QWORD *)v52 + 3);
          LODWORD(v55[0]) = 134349056;
          *(_QWORD *)((char *)v55 + 4) = v37;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 0, "Checking for historical samples -- setting classification time in the past: (%{public}.2f)", v55, 12);
          v39 = (char *)v38;
          sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v38);
          if (v39 != buf)
            free(v39);
        }
        *((_BYTE *)v48 + 24) = 1;
      }
      else if (v19 > Current)
      {
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_102190908);
        v20 = qword_10229FC48;
        if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_ERROR))
        {
          v21 = *((_QWORD *)v52 + 3);
          *(_DWORD *)buf = 134349056;
          *(_QWORD *)&buf[4] = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Trying to classify a time period in the future (%{public}.2f)", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_102190908);
          v22 = *((_QWORD *)v52 + 3);
          LODWORD(v55[0]) = 134349056;
          *(_QWORD *)((char *)v55 + 4) = v22;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 16, "Trying to classify a time period in the future (%{public}.2f)", v55, 12);
          v24 = (char *)v23;
          sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v23);
          if (v24 != buf)
            free(v24);
        }
      }
      v27 = sub_1014A4650((double *)v55, v52[3], Current);
      v28 = (void *)(*(uint64_t (**)(BoutMetricsRecorderDb *, double))(*(_QWORD *)self->fBoutMetricsDb.__ptr_
                                                                               + 176))(self->fBoutMetricsDb.__ptr_, v27);
      if (v28)
      {
        v29 = objc_msgSend(v28, "copy");
      }
      else
      {
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_102190908);
        v30 = qword_10229FC48;
        if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "Missing Database UUID", buf, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_102190908);
          v46[0] = 0;
          LODWORD(v43) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 17, "Missing Database UUID", v46, v43);
          v41 = (char *)v40;
          sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v40);
          if (v41 != buf)
            free(v41);
        }
        v29 = 0;
      }
      ptr = (id *)self->fHKQueryDelegate.__ptr_;
      v32 = objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
      v45[3] = v55[3];
      v45[4] = v55[4];
      v45[1] = v55[1];
      v45[2] = v55[2];
      v45[0] = v55[0];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100EBE830;
      v44[3] = &unk_102190878;
      *(double *)&v44[10] = Current;
      v44[8] = &v51;
      v44[9] = &v47;
      v44[4] = self;
      v44[5] = v29;
      v44[6] = a4;
      v44[7] = a3;
      sub_1010E2EFC(ptr, v32, (double *)v45, (uint64_t)v29, (uint64_t)v44);
      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&v51, 8);
    }
    else
    {
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_102190908);
      v9 = qword_10229FC48;
      if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#warning: HealthKit: Walking Steadiness unavailable", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_102190908);
        LOWORD(v55[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 0, "#warning: HealthKit: Walking Steadiness unavailable", v55, 2);
        v35 = (char *)v34;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:]", "%s\n", v34);
        if (v35 != buf)
          free(v35);
      }
      (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, 1, 1);
    }
  }
  else
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v8 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      v57 = 2082;
      v58 = "Migration is not complete";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"classifySteadinessWithCompletion: NO\", \"reason\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
  }
}

- (void)checkForHistoricalComputeTrigger:(CLBodyMetrics *)a3
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  char *v18;
  _QWORD v19[5];
  double v20;
  int v21;
  double v22;
  _BYTE buf[18];
  __int16 v24;
  const char *v25;

  if (a3->_isHeightSet)
  {
    if (sub_101138108((uint64_t)self->fGaitMetricsDb.__ptr_ + 72))
    {
      if (self->fIsMigrationComplete)
      {
        v20 = 0.0;
        v4 = sub_100127B9C();
        sub_100081C10(v4, buf);
        sub_1001FD98C(*(uint64_t *)buf, "steadinessClassificationNextClassificationTime", &v20);
        v5 = *(std::__shared_weak_count **)&buf[8];
        if (*(_QWORD *)&buf[8])
        {
          v6 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
          do
            v7 = __ldaxr(v6);
          while (__stlxr(v7 - 1, v6));
          if (!v7)
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }
        if (v20 <= CFAbsoluteTimeGetCurrent() + -7776000.0)
        {
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_102190908);
          v16 = qword_10229FC48;
          if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "checkForHistoricalComputeTrigger: YES, attempting classification", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FC40 != -1)
              dispatch_once(&qword_10229FC40, &stru_102190908);
            LOWORD(v21) = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 0, "checkForHistoricalComputeTrigger: YES, attempting classification", &v21, 2);
            v18 = (char *)v17;
            sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]", "%s\n", v17);
            if (v18 != buf)
              free(v18);
          }
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100EC072C;
          v19[3] = &unk_1021908A0;
          v19[4] = self;
          -[CLMobilityWalkingBoutService classifySteadinessWithCompletion:activity:](self, "classifySteadinessWithCompletion:activity:", v19, 0);
        }
        else
        {
          if (qword_10229FC40 != -1)
            dispatch_once(&qword_10229FC40, &stru_102190908);
          v8 = qword_10229FC48;
          if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134349056;
            *(double *)&buf[4] = v20;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "checkForHistoricalComputeTrigger: NO, nextClassificationTime already set (%{public}.2f)", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FC40 != -1)
              dispatch_once(&qword_10229FC40, &stru_102190908);
            v21 = 134349056;
            v22 = v20;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 2, "checkForHistoricalComputeTrigger: NO, nextClassificationTime already set (%{public}.2f)", &v21, 12);
            v10 = (char *)v9;
            sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]", "%s\n", v9);
LABEL_34:
            if (v10 != buf)
              free(v10);
          }
        }
      }
      else
      {
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_102190908);
        v15 = qword_10229FC48;
        if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = "";
          v24 = 2082;
          v25 = "Migration is not complete";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"checkForHistoricalComputeTrigger: NO\", \"reason\":%{public, location:escape_only}s}", buf, 0x1Cu);
        }
      }
    }
    else
    {
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_102190908);
      v13 = qword_10229FC48;
      if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "checkForHistoricalComputeTrigger: NO, ClassB database inaccessible", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FC40 != -1)
          dispatch_once(&qword_10229FC40, &stru_102190908);
        LOWORD(v21) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 2, "checkForHistoricalComputeTrigger: NO, ClassB database inaccessible", &v21, 2);
        v10 = (char *)v14;
        sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]", "%s\n", v14);
        goto LABEL_34;
      }
    }
  }
  else
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v11 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "checkForHistoricalComputeTrigger: NO, height is unset", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_102190908);
      LOWORD(v21) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 2, "checkForHistoricalComputeTrigger: NO, height is unset", &v21, 2);
      v10 = (char *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService checkForHistoricalComputeTrigger:]", "%s\n", v12);
      goto LABEL_34;
    }
  }
}

- (float)BMIFromHeight:(float)a3 weight:(float)a4
{
  float result;

  result = 0.0;
  if (a3 != 0.0)
    return a4 / (float)(a3 * a3);
  return result;
}

- (void)sendAnalyticsBoutMetrics:()vector<CLMobility:(std::allocator<CLMobility::ProcessedBoutResult>> *)a3 :ProcessedBoutResult
{
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  ProcessedBoutResult *var0;
  ProcessedBoutResult *var1;
  NSObject *v11;
  const char *v12;
  char *v13;
  _QWORD v14[6];
  _WORD v15[8];
  _BYTE buf[32];
  _BYTE v17[32];
  __int128 v18;
  __int128 v19;

  if (objc_opt_class(MCProfileConnection, a2)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v4 = atomic_load((unsigned __int8 *)&qword_102308E08);
    if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_102308E08))
    {
      *(_OWORD *)buf = xmmword_101C2D25C;
      *(_OWORD *)&buf[16] = unk_101C2D26C;
      *(_OWORD *)v17 = xmmword_101C2D27C;
      *(_OWORD *)&v17[12] = *(__int128 *)((char *)&xmmword_101C2D27C + 12);
      sub_10041C4B4(&qword_102308DF0, buf, 0xFuLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_102308DF0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102308E08);
    }
    v5 = atomic_load((unsigned __int8 *)&qword_102308E28);
    if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_102308E28))
    {
      *(_OWORD *)buf = xmmword_101C2D298;
      *(_OWORD *)&buf[12] = *(__int128 *)((char *)&xmmword_101C2D298 + 12);
      sub_10041C4B4(&qword_102308E10, buf, 7uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_102308E10, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102308E28);
    }
    v6 = atomic_load((unsigned __int8 *)&qword_102308E48);
    if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_102308E48))
    {
      *(_OWORD *)buf = xmmword_101C2D2B4;
      *(_OWORD *)&buf[12] = *(__int128 *)((char *)&xmmword_101C2D2B4 + 12);
      sub_10041C4B4(&qword_102308E30, buf, 7uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_102308E30, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102308E48);
    }
    v7 = atomic_load((unsigned __int8 *)&qword_102308E68);
    if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_102308E68))
    {
      LODWORD(v18) = 200;
      *(_OWORD *)buf = xmmword_101C2D2D0;
      *(_OWORD *)&buf[16] = unk_101C2D2E0;
      *(_OWORD *)v17 = xmmword_101C2D2F0;
      *(_OWORD *)&v17[16] = unk_101C2D300;
      sub_100EC0C5C(&qword_102308E50, buf, 0x11uLL);
      __cxa_atexit((void (*)(void *))sub_100EC0CDC, &qword_102308E50, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102308E68);
    }
    v8 = atomic_load((unsigned __int8 *)&qword_102308E88);
    if ((v8 & 1) == 0 && __cxa_guard_acquire(&qword_102308E88))
    {
      *(_OWORD *)v17 = xmmword_101C2D338;
      *(_OWORD *)&v17[16] = unk_101C2D348;
      v18 = xmmword_101C2D358;
      v19 = unk_101C2D368;
      *(_OWORD *)buf = xmmword_101C2D318;
      *(_OWORD *)&buf[16] = unk_101C2D328;
      sub_100EC0D0C(&qword_102308E70, buf, 0xCuLL);
      __cxa_atexit((void (*)(void *))sub_1004093B0, &qword_102308E70, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102308E88);
    }
    var0 = a3->var0;
    var1 = a3->var1;
    if (a3->var0 != var1)
    {
      do
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100EC0D8C;
        v14[3] = &unk_102139B90;
        v14[4] = (char *)var0 + 16;
        v14[5] = var0;
        AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.Mobility.WalkingBout"), v14);
        var0 = (ProcessedBoutResult *)((char *)var0 + 240);
      }
      while (var0 != var1);
    }
  }
  else if (a3->var0 != a3->var1)
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v11 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "BoutService: Not authorized to submit analytics without IHA", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      v15[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 2, "BoutService: Not authorized to submit analytics without IHA", v15, 2);
      v13 = (char *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendAnalyticsBoutMetrics:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
  }
}

- (void)sendAnalyticsSteadinessResult:(uint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  double Current;
  double v19;
  int v20;
  NSObject *v21;
  const char *v22;
  char *v23;
  double v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  char *v35;
  _QWORD v36[5];
  _BYTE v37[1120];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  int v54;
  int v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  _BYTE __dst[1120];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  int v73;
  double v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  int v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  int v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint8_t v87[128];
  _BYTE buf[12];
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  int v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  int v96;

  objc_msgSend(objc_msgSend(a1, "universe"), "silo");
  if (objc_msgSend(objc_msgSend(a1, "steadinessClients"), "count"))
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v6 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = objc_msgSend(objc_msgSend(a1, "steadinessClients"), "count");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BoutService: Sending WalkingSteadiness to %d client(s)", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_102190908);
      v29 = qword_10229FC48;
      LODWORD(v83) = 67109120;
      DWORD1(v83) = objc_msgSend(objc_msgSend(a1, "steadinessClients"), "count");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v29, 1, "BoutService: Sending WalkingSteadiness to %d client(s)", &v83);
      v31 = (char *)v30;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendAnalyticsSteadinessResult:]", "%s\n", v30);
      if (v31 != buf)
        free(v31);
    }
    v72 = 0u;
    v71 = 0u;
    v70 = 0u;
    v69 = 0u;
    v7 = objc_msgSend(a1, "steadinessClients");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          memcpy(__dst, (const void *)a3, sizeof(__dst));
          objc_msgSend(v11, "onWalkingSteadinessClassification:", __dst);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
      }
      while (v8);
    }
  }
  if (objc_opt_class(MCProfileConnection, v5)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v12 = *(_OWORD *)(a3 + 208);
    v83 = *(_OWORD *)(a3 + 192);
    v84 = v12;
    v85 = *(_OWORD *)(a3 + 224);
    v86 = *(_QWORD *)(a3 + 240);
    v13 = *(_OWORD *)(a3 + 416);
    v64 = *(_OWORD *)(a3 + 400);
    v65 = v13;
    v66 = *(_OWORD *)(a3 + 432);
    v67 = *(_QWORD *)(a3 + 448);
    v14 = *(_OWORD *)(a3 + 552);
    v60 = *(_OWORD *)(a3 + 536);
    v61 = v14;
    v62 = *(_OWORD *)(a3 + 568);
    v63 = *(_QWORD *)(a3 + 584);
    v15 = *(_OWORD *)(a3 + 640);
    v56 = *(_OWORD *)(a3 + 624);
    v57 = v15;
    v58 = *(_OWORD *)(a3 + 656);
    v59 = *(_QWORD *)(a3 + 672);
    v16 = atomic_load((unsigned __int8 *)&qword_102308EA8);
    if ((v16 & 1) == 0 && __cxa_guard_acquire(&qword_102308EA8))
    {
      *(_QWORD *)buf = 0x420C000041A00000;
      *(_DWORD *)&buf[8] = 1112014848;
      sub_10041C4B4(&qword_102308E90, buf, 3uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_102308E90, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102308EA8);
    }
    v17 = atomic_load((unsigned __int8 *)&qword_102308EC8);
    if ((v17 & 1) == 0 && __cxa_guard_acquire(&qword_102308EC8))
    {
      *(_QWORD *)buf = 0x41C8000041940000;
      *(_DWORD *)&buf[8] = 1106247680;
      sub_10041C4B4(&qword_102308EB0, buf, 3uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_102308EB0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102308EC8);
    }
    Current = CFAbsoluteTimeGetCurrent();
    v19 = *(double *)(a3 + 1072);
    if (v19 <= 0.0)
      v20 = -1;
    else
      v20 = (int)((Current - v19) / 604800.0);
    v24 = *(double *)(a3 + 1080);
    if (v24 <= 0.0)
      v25 = -1;
    else
      v25 = (int)((Current - v24) / 604800.0);
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v26 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEBUG))
    {
      v27 = *(_QWORD *)(a3 + 1072);
      v28 = *(_QWORD *)(a3 + 1080);
      *(_DWORD *)buf = 134219009;
      *(double *)&buf[4] = Current;
      v89 = 2049;
      v90 = v27;
      v91 = 1025;
      v92 = v20;
      v93 = 2049;
      v94 = v28;
      v95 = 1025;
      v96 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "currentTime, %{}.2f, mostRecentLowNotificationTime, %{private}.2f,  weeksSinceLowNotification, %{private}d, mostRecentVeryLowNotificationTime, %{private}.2f, weeksSinceVeryLowNotification, %{private}d", buf, 0x2Cu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_102190908);
      v32 = *(_QWORD *)(a3 + 1072);
      v33 = *(_QWORD *)(a3 + 1080);
      v73 = 134219009;
      v74 = Current;
      v75 = 2049;
      v76 = v32;
      v77 = 1025;
      v78 = v20;
      v79 = 2049;
      v80 = v33;
      v81 = 1025;
      v82 = v25;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 2, "currentTime, %{}.2f, mostRecentLowNotificationTime, %{private}.2f,  weeksSinceLowNotification, %{private}d, mostRecentVeryLowNotificationTime, %{private}.2f, weeksSinceVeryLowNotification, %{private}d", &v73, 44);
      v35 = (char *)v34;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendAnalyticsSteadinessResult:]", "%s\n", v34);
      if (v35 != buf)
        free(v35);
    }
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100EC2680;
    v36[3] = &unk_1021908C8;
    memcpy(v37, (const void *)a3, sizeof(v37));
    v38 = v83;
    v39 = v84;
    v40 = v85;
    v36[4] = a1;
    v41 = v86;
    v42 = v60;
    v43 = v61;
    v44 = v62;
    v45 = v63;
    v47 = v65;
    v48 = v66;
    v46 = v64;
    v49 = v67;
    v53 = v59;
    v52 = v58;
    v51 = v57;
    v50 = v56;
    v54 = v20;
    v55 = v25;
    AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.Mobility.SteadinessClassificationV3"), v36);
  }
  else
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v21 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "BoutService: Not authorized to submit steadiness analytics without IHA", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_102190908);
      LOWORD(v83) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 2, "BoutService: Not authorized to submit steadiness analytics without IHA", &v83, 2);
      v23 = (char *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendAnalyticsSteadinessResult:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
  }
}

- (void)setUpClassificationActivityWithDeferral:(BOOL)a3
{
  _BOOL4 v3;
  double Current;
  uint64_t v6;
  double v7;
  NSObject *v8;
  const int64_t *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  const char *v17;
  uint8_t *v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  _QWORD handler[6];
  double v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  int v26;
  const char *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  uint64_t v37;

  v3 = a3;
  objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo");
  Current = CFAbsoluteTimeGetCurrent();
  v6 = sub_100127B9C();
  sub_100081C10(v6, &v24);
  v23 = 0.0;
  sub_1001FD98C(v24, "steadinessClassificationNextClassificationTime", &v23);
  v7 = v23;
  if (v23 > Current + 691200.0)
  {
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v8 = qword_10229FC48;
    if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v33 = "steadinessClassificationNextClassificationTime";
      v34 = 2050;
      v35 = v23;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC40 != -1)
        dispatch_once(&qword_10229FC40, &stru_102190908);
      v26 = 136446466;
      v27 = "steadinessClassificationNextClassificationTime";
      v28 = 2050;
      v29 = v23;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 16, "%{public}s is too far in the future (%{public}.2f). Resetting!", &v26, 22);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 0, "-[CLMobilityWalkingBoutService setUpClassificationActivityWithDeferral:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
    sub_100525484(v24, "steadinessClassificationNextClassificationTime", 0xFFFFFFFFLL);
    v23 = 0.0;
    v7 = 0.0;
  }
  v9 = &XPC_ACTIVITY_INTERVAL_1_DAY;
  if (!v3)
    v9 = &XPC_ACTIVITY_INTERVAL_30_MIN;
  v10 = *v9;
  v11 = v7 - Current;
  if (v10 <= (uint64_t)v11)
    v12 = (uint64_t)v11;
  else
    v12 = v10;
  if (qword_10229FC40 != -1)
    dispatch_once(&qword_10229FC40, &stru_102190908);
  v13 = qword_10229FC48;
  if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v33 = "com.apple.locationd.Mobility.Classification";
    v34 = 2050;
    v35 = v23;
    v36 = 2050;
    v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextClassificationTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v26 = 136446722;
    v27 = "com.apple.locationd.Mobility.Classification";
    v28 = 2050;
    v29 = v23;
    v30 = 2050;
    v31 = v12;
    LODWORD(v21) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC48, 0, "%{public}s: Registering XPC Activity with nextClassificationTime=(%{public}.2f) and delay=(%{public}lld)", &v26, v21);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService setUpClassificationActivityWithDeferral:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
  xpc_activity_unregister("com.apple.locationd.Mobility.Classification");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100EC35E4;
  handler[3] = &unk_1021384B8;
  handler[4] = objc_msgSend(objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLMobilityWalkingBoutService"));
  handler[5] = v12;
  xpc_activity_register("com.apple.locationd.Mobility.Classification", XPC_ACTIVITY_CHECK_IN, handler);
  v14 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (void)setUpProcessBoutsActivity
{
  xpc_object_t v3;
  _QWORD handler[5];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 600);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100EC3C6C;
  handler[3] = &unk_102144B48;
  handler[4] = objc_msgSend(objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLMobilityWalkingBoutService"));
  xpc_activity_register("com.apple.locationd.Mobility.ProcessBouts", v3, handler);
  xpc_release(v3);
}

- (void)setUpAggregationOnTimer
{
  uint64_t v3;
  int v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  OS_dispatch_source *v9;
  NSObject *fAggregationTimer;
  _QWORD v11[5];
  uint64_t v12;
  std::__shared_weak_count *v13;
  int v14;

  sub_100EC4178((void **)self->fBoutBoundaryAggregator.__ptr_.__value_, 86400.0);
  sub_100EC442C((void **)self->fGaitMetricsAggregator.__ptr_.__value_, 86400.0);
  sub_100EC46E0((void **)self->fBoutMetricsAggregator.__ptr_.__value_, 7776000.0);
  sub_100EC4994((void **)self->fSmoothedGaitMetricsAggregator.__ptr_.__value_, 259200.0);
  v14 = 86400;
  v3 = sub_100127B9C();
  sub_100081C10(v3, &v12);
  v4 = sub_1001E4B84(v12, "MobilityAggregationInterval", &v14);
  v5 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (v4)
    v8 = 1000000000 * v14;
  else
    v8 = 86400000000000;
  v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "silo"), "queue"));
  self->fAggregationTimer = v9;
  dispatch_source_set_timer((dispatch_source_t)v9, 0, v8, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100EC4C48;
  v11[3] = &unk_10212BB58;
  v11[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v11);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)setUpMobilityCompanionSyncActivity
{
  NSObject *v3;
  xpc_object_t v4;
  const char *v5;
  uint8_t *v6;
  _QWORD handler[5];
  int v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;

  if (qword_10229FE90 != -1)
    dispatch_once(&qword_10229FE90, &stru_1021908E8);
  v3 = qword_10229FE98;
  if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = qword_102308DC8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "XPC Mobility Sync: setting up activity. Timer set to %lld seconds", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v8 = 134217984;
    v9 = qword_102308DC8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 1, "XPC Mobility Sync: setting up activity. Timer set to %lld seconds", &v8);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService setUpMobilityCompanionSyncActivity]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, qword_102308DC8);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100EC4EF0;
  handler[3] = &unk_102144B48;
  handler[4] = objc_msgSend(objc_msgSend(-[CLMobilityWalkingBoutService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLMobilityWalkingBoutService"));
  xpc_activity_register("com.apple.locationd.Mobility.CompanionSync", v4, handler);
  xpc_release(v4);
}

- (void)registerForMobilityBoutMetrics:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  __int16 v11;
  unsigned int v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unsigned int v16;

  -[NSMutableSet addObject:](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "addObject:", a3);
  if (qword_10229FE90 != -1)
    dispatch_once(&qword_10229FE90, &stru_1021908E8);
  v5 = qword_10229FE98;
  if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = a3;
    v15 = 1024;
    v16 = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Registered new BoutMetrics client %@. Current client count: %d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v6 = qword_10229FE98;
    v9 = 138412546;
    v10 = a3;
    v11 = 1024;
    v12 = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 1, "BoutService: Registered new BoutMetrics client %@. Current client count: %d", &v9, 18);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService registerForMobilityBoutMetrics:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)unregisterForMobilityBoutMetrics:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  __int16 v11;
  unsigned int v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unsigned int v16;

  -[NSMutableSet removeObject:](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "removeObject:", a3);
  if (qword_10229FE90 != -1)
    dispatch_once(&qword_10229FE90, &stru_1021908E8);
  v5 = qword_10229FE98;
  if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = a3;
    v15 = 1024;
    v16 = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Unregistered BoutMetrics client %@. Current client count: %d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v6 = qword_10229FE98;
    v9 = 138412546;
    v10 = a3;
    v11 = 1024;
    v12 = -[NSMutableSet count](-[CLMobilityWalkingBoutService boutClients](self, "boutClients"), "count");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 1, "BoutService: Unregistered BoutMetrics client %@. Current client count: %d", &v9, 18);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService unregisterForMobilityBoutMetrics:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)registerForWalkingSteadiness:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  __int16 v11;
  unsigned int v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unsigned int v16;

  -[NSMutableSet addObject:](-[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"), "addObject:", a3);
  if (qword_10229FC40 != -1)
    dispatch_once(&qword_10229FC40, &stru_102190908);
  v5 = qword_10229FC48;
  if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = a3;
    v15 = 1024;
    v16 = -[NSMutableSet count](-[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"), "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Registered new WalkingSteadiness client %@. Current client count: %d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v6 = qword_10229FC48;
    v9 = 138412546;
    v10 = a3;
    v11 = 1024;
    v12 = -[NSMutableSet count](-[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"), "count");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 1, "BoutService: Registered new WalkingSteadiness client %@. Current client count: %d", &v9, 18);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService registerForWalkingSteadiness:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)unregisterForWalkingSteadiness:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  __int16 v11;
  unsigned int v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unsigned int v16;

  -[NSMutableSet removeObject:](-[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"), "removeObject:", a3);
  if (qword_10229FC40 != -1)
    dispatch_once(&qword_10229FC40, &stru_102190908);
  v5 = qword_10229FC48;
  if (os_log_type_enabled((os_log_t)qword_10229FC48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = a3;
    v15 = 1024;
    v16 = -[NSMutableSet count](-[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"), "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BoutService: Unregistered new WalkingSteadiness client %@. Current client count: %d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC40 != -1)
      dispatch_once(&qword_10229FC40, &stru_102190908);
    v6 = qword_10229FC48;
    v9 = 138412546;
    v10 = a3;
    v11 = 1024;
    v12 = -[NSMutableSet count](-[CLMobilityWalkingBoutService steadinessClients](self, "steadinessClients"), "count");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 1, "BoutService: Unregistered new WalkingSteadiness client %@. Current client count: %d", &v9, 18);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService unregisterForWalkingSteadiness:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
}

- (void)sendCompanionSyncAnalyticsWithMsgSize:(int)a3 isSuccess:(BOOL)a4 isActivityDeferred:(BOOL)a5 isActivityValid:(BOOL)a6 isWatchPaired:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  const char *v22;
  uint8_t *v23;
  uint64_t v24;
  void **v25;
  uint64_t v26;
  NSDictionary *(*v27)(uint64_t);
  void *v28;
  int v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  _DWORD *v34;
  _BYTE *v35;
  uint64_t v36;
  _DWORD v37[2];
  __int16 v38;
  int v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  _BOOL4 v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  _BOOL4 v57;
  __int16 v58;
  _BOOL4 v59;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = operator new(0x14uLL);
  v12[4] = 500000;
  *(_OWORD *)v12 = xmmword_101C2D378;
  v35 = 0;
  v36 = 0;
  v34 = 0;
  sub_10027205C(&v34, v12, (uint64_t)(v12 + 5), 5uLL);
  v13 = v35 - (_BYTE *)v34;
  if (v35 == (_BYTE *)v34)
  {
    LODWORD(v14) = 0;
    v16 = 0;
    if (!v35)
      goto LABEL_9;
  }
  else
  {
    v14 = 0;
    v15 = v13 >> 2;
    if ((unint64_t)(v13 >> 2) <= 1)
      v15 = 1;
    while (v34[v14] < a3)
    {
      if (v15 == ++v14)
      {
        LODWORD(v14) = v15;
        break;
      }
    }
  }
  v35 = v34;
  operator delete(v34);
  v16 = v14;
LABEL_9:
  if (qword_10229FE90 != -1)
    dispatch_once(&qword_10229FE90, &stru_1021908E8);
  v17 = qword_10229FE98;
  if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110400;
    v49 = a3;
    v50 = 1024;
    v51 = v16;
    v52 = 1024;
    v53 = v9;
    v54 = 1024;
    v55 = v10;
    v56 = 1024;
    v57 = v8;
    v58 = 1024;
    v59 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CLMobilityWalkingBoutService: CompanionSync core analytics: %d, %d, %d, %d, %d, %d", buf, 0x26u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v37[0] = 67110400;
    v37[1] = a3;
    v38 = 1024;
    v39 = v16;
    v40 = 1024;
    v41 = v9;
    v42 = 1024;
    v43 = v10;
    v44 = 1024;
    v45 = v8;
    v46 = 1024;
    v47 = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 0, "CLMobilityWalkingBoutService: CompanionSync core analytics: %d, %d, %d, %d, %d, %d", v37, 38, (_DWORD)v25, v26, (_DWORD)v27, (_DWORD)v28);
    v21 = (uint8_t *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
  if (objc_opt_class(MCProfileConnection, v18)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_100EC5E64;
    v28 = &unk_102131FE8;
    v30 = v9;
    v31 = v10;
    v32 = v8;
    v33 = v7;
    v29 = v16;
    AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.Mobility.MobilityCalibrationCommunication"), &v25);
  }
  else
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021908E8);
    v19 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "CLMobilityWalkingBoutService: Not authorized to submit analytics without IHA", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021908E8);
      LOWORD(v37[0]) = 0;
      LODWORD(v24) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 1, "CLMobilityWalkingBoutService: Not authorized to submit analytics without IHA", v37, v24);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityWalkingBoutService sendCompanionSyncAnalyticsWithMsgSize:isSuccess:isActivityDeferred:isActivityValid:isWatchPaired:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
  }
  operator delete(v12);
}

- (NSMutableSet)boutClients
{
  return self->_boutClients;
}

- (void)setBoutClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (NSMutableSet)steadinessClients
{
  return self->_steadinessClients;
}

- (void)setSteadinessClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  unique_ptr<CMMobilityCal::CMMobilityCalibrationManager, std::default_delete<CMMobilityCal::CMMobilityCalibrationManager>> *p_fMobilityCalManager;
  CMMobilityCalibrationManager *value;
  void *v5;
  WalkingBoutExtractor *v6;
  Client *v7;
  Client *v8;
  Client *v9;
  Client *v10;
  Client *v11;
  Client *v12;

  p_fMobilityCalManager = &self->fMobilityCalManager;
  value = p_fMobilityCalManager->__ptr_.__value_;
  p_fMobilityCalManager->__ptr_.__value_ = 0;
  if (value)
    sub_100EC6838((uint64_t)p_fMobilityCalManager, value);
  sub_100EC67E8((uint64_t *)&self->fSmoothedGaitMetricsProcessor, 0);
  v5 = self->fSPUGaitMetricsDispatcher.__ptr_.__value_;
  self->fSPUGaitMetricsDispatcher.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(void *))(*(_QWORD *)v5 + 8))(v5);
  sub_100EC66AC((uint64_t *)&self->fSteadinessClassifier, 0);
  v6 = self->fBoutExtractor.__ptr_.__value_;
  self->fBoutExtractor.__ptr_.__value_ = 0;
  if (v6)
    sub_100EC662C((uint64_t)&self->fBoutExtractor, (uint64_t)v6);
  sub_10041D2EC((uint64_t *)&self->fSmoothedGaitMetricsAggregator, 0);
  sub_100261F44((uint64_t)&self->fSmoothedGaitMetricsDb);
  sub_100261F44((uint64_t)&self->fHKQueryDelegate);
  sub_100261F44((uint64_t)&self->fPedometerDb);
  sub_10041D2EC((uint64_t *)&self->fBoutMetricsAggregator, 0);
  sub_100261F44((uint64_t)&self->fBoutMetricsDb);
  sub_10041D2EC((uint64_t *)&self->fGaitMetricsAggregator, 0);
  sub_100261F44((uint64_t)&self->fGaitMetricsDb);
  sub_10041D2EC((uint64_t *)&self->fBoutBoundaryAggregator, 0);
  sub_100261F44((uint64_t)&self->fBoutBoundaryDb);
  v7 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
  v8 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);
  v9 = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = 0;
  if (v9)
    (*(void (**)(Client *))(*(_QWORD *)v9 + 8))(v9);
  v10 = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = 0;
  if (v10)
    (*(void (**)(Client *))(*(_QWORD *)v10 + 8))(v10);
  v11 = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0;
  if (v11)
    (*(void (**)(Client *))(*(_QWORD *)v11 + 8))(v11);
  v12 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (v12)
    (*(void (**)(Client *))(*(_QWORD *)v12 + 8))(v12);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  return self;
}

@end
