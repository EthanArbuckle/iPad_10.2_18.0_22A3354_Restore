@implementation CLCardioChangeService

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
  if (qword_10230E130 != -1)
    dispatch_once(&qword_10230E130, &stru_1021ADEF8);
  return (id)qword_10230E128;
}

- (CLCardioChangeService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCardioChangeService;
  return -[CLCardioChangeService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLCardioChangeServiceProtocol, &OBJC_PROTOCOL___CLCardioChangeServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_10230E140 != -1)
    dispatch_once(&qword_10230E140, &stru_1021ADF18);
  return byte_10230E138;
}

- (void)beginService
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  _WORD v13[8];
  uint8_t buf[1640];

  if (qword_10229FF50 != -1)
    dispatch_once(&qword_10229FF50, &stru_1021AE008);
  v3 = qword_10229FF58;
  if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLCardioChangeService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v13[0] = 0;
    LODWORD(v12) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 0, "Starting up CLCardioChangeService", v13, v12);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService beginService]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  HIBYTE(v12) = 0;
  sub_1012FB020((unsigned __int8 *)&v12 + 7, buf);
  sub_1002B7674((uint64_t)&self->fOutputDb, (__int128 *)buf);
  v4 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v5 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  HIBYTE(v12) = 0;
  sub_1012FB120((unsigned __int8 *)&v12 + 7, buf);
  sub_1002B7674((uint64_t)&self->fAggregateFeatureDb, (__int128 *)buf);
  v7 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  operator new();
}

- (void)endService
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  _WORD v5[8];
  uint8_t buf[1640];

  if (qword_10229FF50 != -1)
    dispatch_once(&qword_10229FF50, &stru_1021AE008);
  v2 = qword_10229FF58;
  if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Shutting down CLCardioChangeService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v5[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 0, "Shutting down CLCardioChangeService", v5, 2);
    v4 = (uint8_t *)v3;
    sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService endService]", "%s\n", v3);
    if (v4 != buf)
      free(v4);
  }
}

- (void)setUpAggregationOnTimer
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  OS_dispatch_source *v8;
  NSObject *fAggregationTimer;
  _QWORD v10[5];
  uint64_t v11;
  std::__shared_weak_count *v12;
  int v13;

  sub_1012F5070((void **)self->fChangeAggregator.__ptr_.__value_, 86400.0);
  sub_1012F5324((void **)self->fDailyAggregateFeatureAggregator.__ptr_.__value_, 8985600.0);
  v13 = 86400;
  v3 = sub_100127B9C();
  sub_100081C10(v3, &v11);
  sub_1001E4B84(v11, "CardioChangeAggregationTimeInterval", &v13);
  v4 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = 1000000000 * v13;
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "silo"), "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1012F55D8;
  v10[3] = &unk_10212BB58;
  v10[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  float v7;
  float v8;
  NSObject *v9;
  int v10;
  int v11;
  const char *v12;
  uint8_t *v13;
  _DWORD v14[4];
  uint8_t buf[4];
  int v16;

  objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "silo");
  if (*a3 == 2)
  {
    sub_1013F95F0((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (__int128 *)a4);
    self->fStats.biologicalSex = *((_DWORD *)a4 + 1);
    self->fStats.age = *((float *)a4 + 5);
    self->fStats.betaBlockerUse = *((_BYTE *)a4 + 48);
    v7 = *((float *)a4 + 3);
    if (v7 != 0.0)
    {
      v8 = *((float *)a4 + 2);
      if (v8 != 0.0)
        self->fStats.userBMI = v7 / (float)(v8 * v8);
    }
  }
  else
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v9 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_ERROR))
    {
      v10 = *a3;
      *(_DWORD *)buf = 67109120;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "CLCardioChangeService: Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v11 = *a3;
      v14[0] = 67109120;
      v14[1] = v11;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 16, "CLCardioChangeService: Unhandled notification type, %d", v14);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 0, "-[CLCardioChangeService onNatalimetryNotification:data:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
  }
}

- (void)onChangeEstimationActivity:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint8_t *v13;
  __int128 v14;
  uint8_t buf[4];
  xpc_activity_state_t v16;

  if (!a3)
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v8 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 16, "Invalid xpc activity.");
LABEL_31:
    v13 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLCardioChangeService onChangeEstimationActivity:]", "%s\n", v9);
    if (v13 != buf)
      free(v13);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v7 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to execute CardioChangeEstimation", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      LOWORD(v14) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 0, "Preparing to execute CardioChangeEstimation", &v14, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService onChangeEstimationActivity:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    -[CLCardioChangeService executeCardioChangeEstimation:](self, "executeCardioChangeEstimation:", a3);
    return;
  }
  if (qword_10229FF50 != -1)
    dispatch_once(&qword_10229FF50, &stru_1021AE008);
  v10 = qword_10229FF58;
  if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unexpected CardioChangeEstimation activity state: %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 16, "Unexpected CardioChangeEstimation activity state: %ld", &v14);
    goto LABEL_31;
  }
}

- (void)scheduleChangeEstimation
{
  double Current;
  uint64_t v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  double v9;
  int64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD handler[6];
  double v18;
  int v19;
  const char *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int64_t v24;
  uint8_t buf[4];
  _BYTE v26[18];
  __int16 v27;
  int64_t v28;

  Current = CFAbsoluteTimeGetCurrent();
  v18 = 0.0;
  v4 = sub_1001FD94C();
  sub_1001FD98C(v4, "CardioChangeNextEstimationTime", &v18);
  v5 = v18;
  sub_1018CA5B4(buf, "CardioChangeActivityInterval", &XPC_ACTIVITY_INTERVAL_7_DAYS, 0);
  if (v5 <= Current + (double)*(uint64_t *)&v26[4])
  {
    v8 = v18;
  }
  else
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v6 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)v26 = "CardioChangeNextEstimationTime";
      *(_WORD *)&v26[8] = 2050;
      *(double *)&v26[10] = v18;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v19 = 136446466;
      v20 = "CardioChangeNextEstimationTime";
      v21 = 2050;
      v22 = v18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 16, "%{public}s is too far in the future (%{public}.2f). Resetting!", &v19, 22);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 0, "-[CLCardioChangeService scheduleChangeEstimation]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v7 = sub_1001FD94C();
    sub_100525484(v7, "CardioChangeNextEstimationTime", 0xFFFFFFFFLL);
    v18 = 0.0;
    v8 = 0.0;
  }
  v9 = v8 - Current;
  if (XPC_ACTIVITY_INTERVAL_30_MIN <= (uint64_t)v9)
    v10 = (uint64_t)v9;
  else
    v10 = XPC_ACTIVITY_INTERVAL_30_MIN;
  if (qword_10229FF50 != -1)
    dispatch_once(&qword_10229FF50, &stru_1021AE008);
  v11 = qword_10229FF58;
  if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)v26 = "com.apple.locationd.CardioChange.Processing";
    *(_WORD *)&v26[8] = 2050;
    *(double *)&v26[10] = v18;
    v27 = 2050;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextEstimationTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v19 = 136446722;
    v20 = "com.apple.locationd.CardioChange.Processing";
    v21 = 2050;
    v22 = v18;
    v23 = 2050;
    v24 = v10;
    LODWORD(v16) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 0, "%{public}s: Registering XPC Activity with nextEstimationTime=(%{public}.2f) and delay=(%{public}lld)", &v19, v16);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService scheduleChangeEstimation]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  xpc_activity_unregister("com.apple.locationd.CardioChange.Processing");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1012F6CE0;
  handler[3] = &unk_1021384B8;
  handler[4] = objc_msgSend(objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLCardioChangeService"));
  handler[5] = v10;
  xpc_activity_register("com.apple.locationd.CardioChange.Processing", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)executeCardioChangeEstimation:(id)a3
{
  double Current;
  NSObject *v6;
  HealthKitQueryDelegate *value;
  const char *v8;
  uint8_t *v9;
  double v10;
  _QWORD v11[5];
  _QWORD v12[6];
  int v13;
  double v14;
  __int16 v15;
  double v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;

  if (objc_msgSend(objc_msgSend(objc_msgSend((id)sub_1012F7550(), "sharedInstance"), "getPairedDevices"), "count"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v6 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v18 = Current + -7776000.0;
      v19 = 2048;
      v20 = Current;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "executeCardioChangeEstimation - startTime %f, endTime %f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v13 = 134218240;
      v14 = Current + -7776000.0;
      v15 = 2048;
      v16 = Current;
      LODWORD(v10) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 2, "executeCardioChangeEstimation - startTime %f, endTime %f", COERCE_DOUBLE(&v13), v10);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService executeCardioChangeEstimation:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    value = self->fHKQueryDelegate.__ptr_.__value_;
    v11[4] = a3;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1012F7614;
    v12[3] = &unk_1021ADF60;
    v12[4] = a3;
    v12[5] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1012F78C4;
    v11[3] = &unk_1021ADF88;
    sub_100405EB8((uint64_t)value, objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "silo"), (uint64_t)v12, (uint64_t)v11, Current + -7776000.0, Current);
  }
  else
  {
    -[CLCardioChangeService resetCardioChangeEstimationActivity:withDelay:](self, "resetCardioChangeEstimationActivity:withDelay:", a3, XPC_ACTIVITY_INTERVAL_7_DAYS);
  }
}

- (void)resetCardioChangeEstimationActivity:(id)a3 withDelay:(int64_t)a4
{
  double v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  double v11;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  double v19;

  v6 = CFAbsoluteTimeGetCurrent() + (double)a4;
  v11 = v6;
  if (qword_10229FF50 != -1)
    dispatch_once(&qword_10229FF50, &stru_1021AE008);
  v7 = qword_10229FF58;
  if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "CardioChangeNextEstimationTime";
    v18 = 2050;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Resetting next activity time to: %{public}.1f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v12 = 136446466;
    v13 = "CardioChangeNextEstimationTime";
    v14 = 2050;
    v15 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 0, "%{public}s: Resetting next activity time to: %{public}.1f", &v12, 22);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService resetCardioChangeEstimationActivity:withDelay:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  v8 = sub_1001FD94C();
  sub_10018A4CC(v8, "CardioChangeNextEstimationTime", &v11);
  -[CLCardioChangeService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
  -[CLCardioChangeService scheduleChangeEstimation](self, "scheduleChangeEstimation");
}

- (void)markXpcActivityDone:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  xpc_activity_state_t v9;
  uint8_t buf[4];
  xpc_activity_state_t state;

  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v4 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Failed to mark activity as done. Current state is %{public}ld", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v5 = qword_10229FF58;
      v8 = 134349056;
      v9 = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 17, "Failed to mark activity as done. Current state is %{public}ld", &v8, 12);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLCardioChangeService markXpcActivityDone:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)scheduleDailyAggregateFeatureCompute
{
  xpc_object_t v3;
  _QWORD v4[5];
  unsigned __int8 v5[8];
  int64_t value;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  sub_1018CA5B4(v5, "DailyAggregateFeatureComputeIntervalTime", &XPC_ACTIVITY_INTERVAL_1_DAY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, value);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1012F8104;
  v4[3] = &unk_102144B48;
  v4[4] = objc_msgSend(objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLCardioChangeService"));
  xpc_activity_register("com.apple.locationd.CardioChange.DailyAggregateFeatureCompute", v3, v4);
  xpc_release(v3);
}

- (void)scheduleWeeklyRiskModelCompute
{
  double Current;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  double v9;
  int v10;
  double v11;
  uint8_t buf[4];
  double v13;

  Current = CFAbsoluteTimeGetCurrent();
  v9 = 0.0;
  v3 = sub_1001FD94C();
  sub_1001FD98C(v3, "WeeklyRiskModelEstimationTime", &v9);
  if (v9 == 0.0)
  {
    v9 = floor(Current / 86400.0) * 86400.0 + 604800.0;
    v4 = sub_1001FD94C();
    sub_10018A4CC(v4, "WeeklyRiskModelEstimationTime", &v9);
    v5 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 944))(v5);
  }
  else
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v6 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Weekly Risk Model Estimation time already set, %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v10 = 134217984;
      v11 = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 2, "Weekly Risk Model Estimation time already set, %f", COERCE_DOUBLE(&v10));
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService scheduleWeeklyRiskModelCompute]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (void)resetWeeklyRiskModuleComputeTime
{
  uint64_t v2;

  v2 = sub_1001FD94C();
  sub_100525484(v2, "WeeklyRiskModelEstimationTime", 0xFFFFFFFFLL);
}

- (void)onDailyAggregateFeatureComputeActivity:(id)a3
{
  xpc_activity_state_t state;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint8_t *v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;

  if (!a3)
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v8 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "com.apple.locationd.CardioChange.DailyAggregateFeatureCompute";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity, expecting (%s).", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 16, "Invalid xpc activity, expecting (%s).", &v14);
LABEL_32:
    v13 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLCardioChangeService onDailyAggregateFeatureComputeActivity:]", "%s\n", v9);
    if (v13 != buf)
      free(v13);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = (const char *)state, state == 2))
  {
    if (!-[CLCardioChangeService checkDeferral:](self, "checkDeferral:", a3))
    {
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v7 = qword_10229FF58;
      if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to execute DailyAggregateFeatureCompute", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF50 != -1)
          dispatch_once(&qword_10229FF50, &stru_1021AE008);
        LOWORD(v14) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 0, "Preparing to execute DailyAggregateFeatureCompute", &v14, 2);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService onDailyAggregateFeatureComputeActivity:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      -[CLCardioChangeService executeDailyAggregateFeatureCompute:](self, "executeDailyAggregateFeatureCompute:", a3);
    }
    return;
  }
  if (qword_10229FF50 != -1)
    dispatch_once(&qword_10229FF50, &stru_1021AE008);
  v10 = qword_10229FF58;
  if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unexpected DailyAggregateFeatureCompute activity state: %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 16, "Unexpected DailyAggregateFeatureCompute activity state: %ld", &v14);
    goto LABEL_32;
  }
}

- (void)executeDailyAggregateFeatureCompute:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  CLCardioChangeEstimator *value;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t *v15[3];
  int v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  int v22;
  uint64_t v23;
  uint8_t buf[1640];

  if (objc_msgSend(objc_msgSend(objc_msgSend((id)sub_1012F7550(), "sharedInstance"), "getPairedDevices"), "count"))
  {
    v20 = 0;
    v21 = 0.0;
    v22 = -1;
    v23 = 0;
    v5 = 0;
    v6 = floor(CFAbsoluteTimeGetCurrent() / 86400.0) * 86400.0;
    v18 = 0;
    v19 = 0;
    v17 = (uint64_t *)&v18;
    do
    {
      v16 = dword_101C49FE8[v5];
      if (sub_1004BD970((uint64_t)self->fAggregateFeatureDb.__ptr_) == 100)
      {
        v7 = v21;
        *(_QWORD *)buf = &v16;
        if (v21 <= 0.0)
          *((double *)sub_100041CE0(&v17, &v16, (uint64_t)&unk_101B9EB60, (_DWORD **)buf) + 5) = v6 + -7776000.0;
        else
          *((double *)sub_100041CE0(&v17, &v16, (uint64_t)&unk_101B9EB60, (_DWORD **)buf) + 5) = v7 + 86400.0;
      }
      ++v5;
    }
    while (v5 != 8);
    if (v19 == 8)
    {
      value = self->fCardioChangeEstimator.__ptr_.__value_;
      sub_1012FB6D4((uint64_t *)v15, (uint64_t)&v17);
      sub_1013F9888((uint64_t)value, v15, v6);
      sub_100008848((uint64_t)v15, v15[1]);
      -[CLCardioChangeService executeRiskModelFeatureCompute](self, "executeRiskModelFeatureCompute");
    }
    else
    {
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v10 = qword_10229FF58;
      if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get startTimes for all aggregate features", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF50 != -1)
          dispatch_once(&qword_10229FF50, &stru_1021AE008);
        LOWORD(v16) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 16, "Failed to get startTimes for all aggregate features", &v16, 2);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 0, "-[CLCardioChangeService executeDailyAggregateFeatureCompute:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
    }
    -[CLCardioChangeService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
    sub_100008848((uint64_t)&v17, v18);
  }
  else
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v9 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No paired watch, exit early", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 1, "No paired watch, exit early", &v20, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService executeDailyAggregateFeatureCompute:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    -[CLCardioChangeService markXpcActivityDone:](self, "markXpcActivityDone:", a3);
  }
}

- (void)executeRiskModelFeatureCompute
{
  double Current;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  const char *v16;
  uint8_t *v17;
  double v18;
  double v19[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  double v30;
  int v31;
  double v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint8_t buf[4];
  double v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;

  Current = CFAbsoluteTimeGetCurrent();
  v30 = 0.0;
  v4 = sub_1001FD94C();
  sub_1001FD98C(v4, "WeeklyRiskModelEstimationTime", &v30);
  if (v30 <= 0.0 || v30 > Current)
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v6 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v48 = v30;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Weekly risk model estimation scheduled to run at %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v31 = 134217984;
      v32 = v30;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 1, "Weekly risk model estimation scheduled to run at %f", COERCE_DOUBLE(&v31));
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
  else
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v9 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v48 = v30;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Running risk model compute, estimationTime, %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v31 = 134217984;
      v32 = v30;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 1, "Running risk model compute, estimationTime, %f", COERCE_DOUBLE(&v31));
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    v29 = 0;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    if (sub_1013FA874((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (uint64_t)&v25))
    {
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v10 = qword_10229FF58;
      if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219776;
        v48 = *((double *)&v25 + 1);
        v49 = 2048;
        v50 = v26;
        v51 = 2048;
        v52 = *((_QWORD *)&v26 + 1);
        v53 = 2048;
        v54 = v27;
        v55 = 2048;
        v56 = *((_QWORD *)&v27 + 1);
        v57 = 2048;
        v58 = v28;
        v59 = 2048;
        v60 = *((_QWORD *)&v28 + 1);
        v61 = 2048;
        v62 = v29;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Risk Model input features, sessionVo2maxDailyMean_Window0to90_Mean,%.2f, sessionHRRecovery_DailyMean_Window0to90_Mean,%.2f, heartRateDailyMax_Window0To90_Mean,%.2f, sixMinuteWalkDistanceDailyMean_Window0To90_Mean,%.2f,walkingHeartRateAverageDailyMean_Window0To90_Mean, %.2f,walkingSpeedNormLegLengthDailyMax_Window0to90_Mean,%.2f,stairAscentSpeedDailyMean_Window0to90_Mean,%.2f, stairDescentSpeedDailyMean_Window0to90_Mean,%.2f", buf, 0x52u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF50 != -1)
          dispatch_once(&qword_10229FF50, &stru_1021AE008);
        v31 = 134219776;
        v32 = *((double *)&v25 + 1);
        v33 = 2048;
        v34 = v26;
        v35 = 2048;
        v36 = *((_QWORD *)&v26 + 1);
        v37 = 2048;
        v38 = v27;
        v39 = 2048;
        v40 = *((_QWORD *)&v27 + 1);
        v41 = 2048;
        v42 = v28;
        v43 = 2048;
        v44 = *((_QWORD *)&v28 + 1);
        v45 = 2048;
        v46 = v29;
        LODWORD(v18) = 82;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 1, "Risk Model input features, sessionVo2maxDailyMean_Window0to90_Mean,%.2f, sessionHRRecovery_DailyMean_Window0to90_Mean,%.2f, heartRateDailyMax_Window0To90_Mean,%.2f, sixMinuteWalkDistanceDailyMean_Window0To90_Mean,%.2f,walkingHeartRateAverageDailyMean_Window0To90_Mean, %.2f,walkingSpeedNormLegLengthDailyMax_Window0to90_Mean,%.2f,stairAscentSpeedDailyMean_Window0to90_Mean,%.2f, stairDescentSpeedDailyMean_Window0to90_Mean,%.2f", COERCE_DOUBLE(&v31), v18, v19[0], v19[1], *(double *)&v20, *((double *)&v20 + 1), *(double *)&v21, *((double *)&v21 + 1));
        v15 = (uint8_t *)v14;
        sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v14);
        if (v15 != buf)
          free(v15);
      }
      v22 = v27;
      v23 = v28;
      v24 = v29;
      v20 = v25;
      v21 = v26;
      -[CLCardioChangeService sendCoreAnalyticsEvent:](self, "sendCoreAnalyticsEvent:", &v20);
      sub_1013FAE9C((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (double *)&v25, (uint64_t)&v31);
      sub_1013FAD4C((uint64_t)self->fCardioChangeEstimator.__ptr_.__value_, (uint64_t)&v25);
      if (*(_DWORD *)((char *)&v34 + 2) == 1)
      {
        if (qword_10229FF50 != -1)
          dispatch_once(&qword_10229FF50, &stru_1021AE008);
        v11 = qword_10229FF58;
        if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLCardioChangeService: Change detected. Firing alarm and notifying watch.", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FF50 != -1)
            dispatch_once(&qword_10229FF50, &stru_1021AE008);
          LOWORD(v19[0]) = 0;
          LODWORD(v18) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 0, "CLCardioChangeService: Change detected. Firing alarm and notifying watch.", v19, *(_QWORD *)&v18);
          v17 = (uint8_t *)v16;
          sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService executeRiskModelFeatureCompute]", "%s\n", v16);
          if (v17 != buf)
            free(v17);
        }
        objc_msgSend(objc_msgSend(objc_msgSend(-[CLCardioChangeService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLCompanionNotifier")), "doAsync:", &stru_1021ADFA8);
      }
      -[CLCardioChangeService resetWeeklyRiskModuleComputeTime](self, "resetWeeklyRiskModuleComputeTime");
      -[CLCardioChangeService scheduleWeeklyRiskModelCompute](self, "scheduleWeeklyRiskModelCompute");
    }
  }
}

- (BOOL)checkDeferral:(id)a3
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
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v5 = qword_10229FF58;
      if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "com.apple.locationd.CardioChange.DailyAggregateFeatureCompute";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service] Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF50 != -1)
          dispatch_once(&qword_10229FF50, &stru_1021AE008);
        v18 = 136446210;
        v19 = "com.apple.locationd.CardioChange.DailyAggregateFeatureCompute";
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 1, "[Service] Cancelling (%{public}s) early due to deferral.", &v18, 12);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService checkDeferral:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      if (xpc_activity_set_state((xpc_activity_t)a3, 3))
      {
        if (qword_10229FF50 != -1)
          dispatch_once(&qword_10229FF50, &stru_1021AE008);
        v6 = qword_10229FF58;
        if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Service] Activity deferred", buf, 2u);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_24;
        bzero(buf, 0x65CuLL);
        if (qword_10229FF50 != -1)
          dispatch_once(&qword_10229FF50, &stru_1021AE008);
        LOWORD(v18) = 0;
        LODWORD(v17) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 1, "[Service] Activity deferred", &v18, v17);
        v8 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService checkDeferral:]", "%s\n", v7);
        if (v8 == buf)
          goto LABEL_24;
      }
      else
      {
        if (qword_10229FF50 != -1)
          dispatch_once(&qword_10229FF50, &stru_1021AE008);
        v9 = qword_10229FF58;
        if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_FAULT))
        {
          state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          v21 = (const char *)state;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "[Service] Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
        }
        if (!sub_1001BFF7C(115, 0))
          goto LABEL_24;
        bzero(buf, 0x65CuLL);
        if (qword_10229FF50 != -1)
          dispatch_once(&qword_10229FF50, &stru_1021AE008);
        v13 = qword_10229FF58;
        v14 = xpc_activity_get_state((xpc_activity_t)a3);
        v18 = 134349056;
        v19 = (const char *)v14;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 17, "[Service] Failed to defer activity. Current state is %{public}ld", &v18, v17);
        v8 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 0, "-[CLCardioChangeService checkDeferral:]", "%s\n", v15);
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

- (void)logAnalytics:(EstimateResult *)a3
{
  uint64_t v5;
  int v6;
  NSObject *v7;
  Stats *p_fStats;
  NSObject *v9;
  double age;
  int biologicalSex;
  _BOOL4 betaBlockerUse;
  double userBMI;
  int status;
  double meanVO2MaxFromClusters;
  double likelihoodRatio;
  double maxAcceptedChange;
  double minConfidenceRatio;
  int numClustersContributed;
  double slope;
  int vo2Max;
  double v22;
  int v23;
  _BOOL4 v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  double v32;
  int v33;
  const char *v34;
  uint8_t *v35;
  const char *v36;
  uint8_t *v37;
  int v38;
  double v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  double v45;
  __int16 v46;
  int v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  int v57;
  __int16 v58;
  double v59;
  __int16 v60;
  int v61;
  uint8_t buf[4];
  double v63;
  __int16 v64;
  int v65;
  __int16 v66;
  _BOOL4 v67;
  __int16 v68;
  double v69;
  __int16 v70;
  int v71;
  __int16 v72;
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  int v81;
  __int16 v82;
  double v83;
  __int16 v84;
  int v85;
  __int128 v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v87 = 0;
  v89 = 0;
  v90 = 0;
  v91 = 0;
  v5 = sub_101125448();
  if ((sub_101125BF0(v5, &v86) & 1) != 0)
  {
    v6 = llround(v88);
  }
  else
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v7 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CardioChange, unable to access DB due to device lock.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      LOWORD(v38) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 0, "CardioChange, unable to access DB due to device lock.", &v38, 2);
      v37 = (uint8_t *)v36;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService logAnalytics:]", "%s\n", v36);
      if (v37 != buf)
        free(v37);
    }
    v6 = -1;
  }
  p_fStats = &self->fStats;
  self->fStats.vo2Max = v6;
  self->fStats.status = a3->var2;
  if (qword_10229FF50 != -1)
    dispatch_once(&qword_10229FF50, &stru_1021AE008);
  v9 = qword_10229FF58;
  if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEBUG))
  {
    age = self->fStats.age;
    biologicalSex = p_fStats->biologicalSex;
    betaBlockerUse = self->fStats.betaBlockerUse;
    userBMI = self->fStats.userBMI;
    status = self->fStats.status;
    meanVO2MaxFromClusters = self->fStats.meanVO2MaxFromClusters;
    likelihoodRatio = self->fStats.likelihoodRatio;
    maxAcceptedChange = self->fStats.maxAcceptedChange;
    minConfidenceRatio = self->fStats.minConfidenceRatio;
    numClustersContributed = self->fStats.numClustersContributed;
    slope = self->fStats.slope;
    vo2Max = self->fStats.vo2Max;
    *(_DWORD *)buf = 134220800;
    v63 = age;
    v64 = 1024;
    v65 = biologicalSex;
    v66 = 1024;
    v67 = betaBlockerUse;
    v68 = 2048;
    v69 = userBMI;
    v70 = 1024;
    v71 = status;
    v72 = 2048;
    v73 = meanVO2MaxFromClusters;
    v74 = 2048;
    v75 = likelihoodRatio;
    v76 = 2048;
    v77 = maxAcceptedChange;
    v78 = 2048;
    v79 = minConfidenceRatio;
    v80 = 1024;
    v81 = numClustersContributed;
    v82 = 2048;
    v83 = slope;
    v84 = 1024;
    v85 = vo2Max;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CardioChange Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,status,%d,avgFromClustersVO2Max,%.2f,likelihoodRatio,%.2f,maxAcceptedChange,%.2f,minConfidenceRatio,%.2f,numClustersContributed,%d,slope,%.2f,vo2Max,%d", buf, 0x66u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v22 = self->fStats.age;
    v23 = p_fStats->biologicalSex;
    v24 = self->fStats.betaBlockerUse;
    v25 = self->fStats.userBMI;
    v26 = self->fStats.status;
    v27 = self->fStats.meanVO2MaxFromClusters;
    v28 = self->fStats.likelihoodRatio;
    v29 = self->fStats.maxAcceptedChange;
    v30 = self->fStats.minConfidenceRatio;
    v31 = self->fStats.numClustersContributed;
    v32 = self->fStats.slope;
    v33 = self->fStats.vo2Max;
    v38 = 134220800;
    v39 = v22;
    v40 = 1024;
    v41 = v23;
    v42 = 1024;
    v43 = v24;
    v44 = 2048;
    v45 = v25;
    v46 = 1024;
    v47 = v26;
    v48 = 2048;
    v49 = v27;
    v50 = 2048;
    v51 = v28;
    v52 = 2048;
    v53 = v29;
    v54 = 2048;
    v55 = v30;
    v56 = 1024;
    v57 = v31;
    v58 = 2048;
    v59 = v32;
    v60 = 1024;
    v61 = v33;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 2, "CardioChange Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,status,%d,avgFromClustersVO2Max,%.2f,likelihoodRatio,%.2f,maxAcceptedChange,%.2f,minConfidenceRatio,%.2f,numClustersContributed,%d,slope,%.2f,vo2Max,%d", COERCE_DOUBLE(&v38), 102);
    v35 = (uint8_t *)v34;
    sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService logAnalytics:]", "%s\n", v34);
    if (v35 != buf)
      free(v35);
  }
  -[CLCardioChangeService sendAnalytics](self, "sendAnalytics");
}

- (void)sendAnalytics
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  const char *v9;
  _QWORD v10[5];
  _WORD v11[8];
  uint8_t buf[16];
  __int128 v13;
  int v14;

  if (objc_opt_class(MCProfileConnection, a2)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v3 = atomic_load((unsigned __int8 *)&qword_10230E160);
    if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_10230E160))
    {
      v14 = 1118961664;
      *(_OWORD *)buf = xmmword_101C4A008;
      v13 = unk_101C4A018;
      sub_10041C4B4(&qword_10230E148, buf, 9uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_10230E148, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10230E160);
    }
    v4 = atomic_load((unsigned __int8 *)&qword_10230E180);
    if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_10230E180))
    {
      LODWORD(v13) = 1108056474;
      *(_OWORD *)buf = xmmword_101C4A02C;
      sub_10041C4B4(&qword_10230E168, buf, 5uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_10230E168, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10230E180);
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1012FA33C;
    v10[3] = &unk_102132010;
    v10[4] = self;
    AnalyticsSendEventLazy(CFSTR("com.apple.com.apple.CoreMotion.CardioChangeEstimate"), v10);
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v5 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CardioChange, sent Core Analytics event.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 1, "CardioChange, sent Core Analytics event.", v11, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService sendAnalytics]", "%s\n", v6);
LABEL_22:
      if (v7 != buf)
        free(v7);
    }
  }
  else
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v8 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CardioChange, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 2, "CardioChange, not sending analytics, no IHA permission", v11, 2);
      v7 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService sendAnalytics]", "%s\n", v9);
      goto LABEL_22;
    }
  }
}

- (void)sendCoreAnalyticsEvent:(RiskModelFeatureInput *)a3
{
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  _QWORD v14[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double var8;
  uint64_t v20;
  _WORD v21[8];
  uint8_t buf[1640];

  if (objc_opt_class(MCProfileConnection, a2)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v5 = atomic_load((unsigned __int8 *)&qword_10230E1A0);
    if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_10230E1A0))
    {
      *(_OWORD *)buf = xmmword_101C4A040;
      *(_OWORD *)&buf[12] = *(__int128 *)((char *)&xmmword_101C4A040 + 12);
      sub_10041C4B4(&qword_10230E188, buf, 7uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_10230E188, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10230E1A0);
    }
    v6 = atomic_load((unsigned __int8 *)&qword_10230E1C0);
    if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_10230E1C0))
    {
      *(_OWORD *)buf = xmmword_101C4A05C;
      *(_OWORD *)&buf[16] = unk_101C4A06C;
      *(_QWORD *)&buf[32] = 0x3FF333333FECCCCDLL;
      sub_10041C4B4(&qword_10230E1A8, buf, 0xAuLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_10230E1A8, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10230E1C0);
    }
    v7 = atomic_load((unsigned __int8 *)&qword_10230E1E0);
    if ((v7 & 1) == 0)
    {
      if (__cxa_guard_acquire(&qword_10230E1E0))
      {
        *(_OWORD *)buf = xmmword_101C4A084;
        *(_OWORD *)&buf[16] = unk_101C4A094;
        *(_OWORD *)&buf[28] = unk_101C4A0A0;
        sub_10041C4B4(&qword_10230E1C8, buf, 0xBuLL);
        __cxa_atexit((void (*)(void *))sub_10041C534, &qword_10230E1C8, (void *)&_mh_execute_header);
        __cxa_guard_release(&qword_10230E1E0);
      }
    }
    v8 = (char *)self->fCardioChangeEstimator.__ptr_.__value_ + 64;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1012FAA88;
    v14[3] = &unk_1021ADFC8;
    memmove(&v20, v8, 0x3CuLL);
    v9 = *(_OWORD *)&a3->var6;
    v17 = *(_OWORD *)&a3->var4;
    v18 = v9;
    var8 = a3->var8;
    v10 = *(_OWORD *)&a3->var0;
    v16 = *(_OWORD *)&a3->var2;
    v15 = v10;
    AnalyticsSendEventLazy(CFSTR("com.apple.com.apple.CoreMotion.CardioChangeEstimate"), v14);
  }
  else
  {
    if (qword_10229FF50 != -1)
      dispatch_once(&qword_10229FF50, &stru_1021AE008);
    v11 = qword_10229FF58;
    if (os_log_type_enabled((os_log_t)qword_10229FF58, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CardioChange, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF50 != -1)
        dispatch_once(&qword_10229FF50, &stru_1021AE008);
      v21[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF58, 2, "CardioChange, not sending analytics, no IHA permission", v21, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLCardioChangeService sendCoreAnalyticsEvent:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
  }
}

- (void).cxx_destruct
{
  CLCardioChangeEstimator *value;
  Client *v4;

  sub_100261F44((uint64_t)&self->fHRRecoverySessionDb);
  sub_100261F44((uint64_t)&self->fVO2MaxOutputDb);
  sub_1012FB274((uint64_t *)&self->fHKQueryDelegate, 0);
  value = self->fCardioChangeEstimator.__ptr_.__value_;
  self->fCardioChangeEstimator.__ptr_.__value_ = 0;
  if (value)
    sub_1012FB220((uint64_t)&self->fCardioChangeEstimator, (uint64_t)value);
  v4 = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  sub_10041D2EC((uint64_t *)&self->fDailyAggregateFeatureAggregator, 0);
  sub_10041D2EC((uint64_t *)&self->fChangeAggregator, 0);
  sub_100261F44((uint64_t)&self->fAggregateFeatureDb);
  sub_100261F44((uint64_t)&self->fOutputDb);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_DWORD *)self + 16) = 0;
  __asm { FMOV            V0.2S, #-1.0 }
  *((_BYTE *)self + 76) = 0;
  *((_QWORD *)self + 10) = 0xFFFFFFFFLL;
  *((_DWORD *)self + 22) = -1;
  *(_QWORD *)((char *)self + 100) = 0;
  *(_QWORD *)((char *)self + 92) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *(_QWORD *)((char *)self + 68) = _D0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  return self;
}

@end
