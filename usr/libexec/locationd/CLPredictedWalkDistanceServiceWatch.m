@implementation CLPredictedWalkDistanceServiceWatch

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
  if (qword_102304F40 != -1)
    dispatch_once(&qword_102304F40, &stru_102158528);
  return (id)qword_102304F38;
}

- (CLPredictedWalkDistanceServiceWatch)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPredictedWalkDistanceServiceWatch;
  return -[CLPredictedWalkDistanceServiceWatch initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLPredictedWalkDistanceServiceWatchProtocol, &OBJC_PROTOCOL___CLPredictedWalkDistanceServiceWatchClientProtocol);
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)beginService
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  const char *v7;
  uint8_t *v8;
  uint64_t v9;
  _WORD v10[8];
  uint8_t buf[1640];

  if (qword_10229FEA0 != -1)
    dispatch_once(&qword_10229FEA0, &stru_102158548);
  v3 = qword_10229FEA8;
  if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting up CLPredictedWalkDistanceServiceWatch", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102158548);
    v10[0] = 0;
    LODWORD(v9) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 1, "Starting up CLPredictedWalkDistanceServiceWatch", v10, v9);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceWatch beginService]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  HIBYTE(v9) = 0;
  sub_10041CFEC((unsigned __int8 *)&v9 + 7, buf);
  sub_1002B7674((uint64_t)&self->fBoutDb, (__int128 *)buf);
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
  operator new();
}

- (void)endService
{
  Client *value;
  Client *v4;

  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value)
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
  v4 = self->fStepCountClient.__ptr_.__value_;
  if (v4)
    objc_msgSend(*((id *)v4 + 2), "unregister:forNotification:", *((_QWORD *)v4 + 1), 0);
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  objc_msgSend(-[CLPredictedWalkDistanceServiceWatch universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  sub_1005EBC90((uint64_t)self->fBoutDetector.__ptr_.__value_, (CLMotionActivity *)((char *)a4 + 8));
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  objc_msgSend(-[CLPredictedWalkDistanceServiceWatch universe](self, "universe", a3), "silo");
  sub_1005EC578((uint64_t)self->fBoutDetector.__ptr_.__value_, (uint64_t)a4);
}

- (void)onAddBout:(CLPredictedWalkDistanceBoutEntry *)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _QWORD v8[5];
  _WORD v9[8];
  uint8_t buf[1640];

  if (qword_10229FEA0 != -1)
    dispatch_once(&qword_10229FEA0, &stru_102158548);
  v5 = qword_10229FEA8;
  if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to send ids message from watch to phone", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102158548);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 0, "Attempting to send ids message from watch to phone", v9, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceWatch onAddBout:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10087245C;
  v8[3] = &unk_102155328;
  v8[4] = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, 120);
  objc_msgSend(objc_msgSend(objc_msgSend(-[CLPredictedWalkDistanceServiceWatch universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLCompanionNotifier")), "doAsync:", v8);
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
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

  objc_msgSend(-[CLPredictedWalkDistanceServiceWatch universe](self, "universe"), "silo");
  if (*a3 == 2)
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102158548);
    v7 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLPredictedWalkDistanceServiceWatch: Received user info update", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102158548);
      LOWORD(v15[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 2, "CLPredictedWalkDistanceServiceWatch: Received user info update", v15, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceWatch onUserInfoUpdate:data:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    sub_1005EE1DC((uint64_t)self->fBoutDetector.__ptr_.__value_, (__int128 *)a4);
  }
  else
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102158548);
    v8 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *a3;
      *(_DWORD *)buf = 67109120;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102158548);
      v12 = *a3;
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 0, "#Warning Unhandled notification type, %d", v15);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceWatch onUserInfoUpdate:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
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

  sub_100413DB8((void **)self->fBoutAggregator.__ptr_.__value_, 259200.0);
  v13 = 86400;
  v3 = sub_100127B9C();
  sub_100081C10(v3, &v11);
  sub_1001E4B84(v11, "P6MWDAggregationTimeInterval", &v13);
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
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLPredictedWalkDistanceServiceWatch universe](self, "universe"), "silo"), "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100872910;
  v10[3] = &unk_10212BB58;
  v10[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void).cxx_destruct
{
  CLPredictedWalkDistanceBoutDetector *value;
  Client *v4;
  Client *v5;
  Client *v6;

  sub_10041D2EC((uint64_t *)&self->fBoutAggregator, 0);
  sub_100261F44((uint64_t)&self->fBoutDb);
  value = self->fBoutDetector.__ptr_.__value_;
  self->fBoutDetector.__ptr_.__value_ = 0;
  if (value)
    sub_100872BF4((uint64_t)&self->fBoutDetector, value);
  v4 = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  v5 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  v6 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
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
  return self;
}

@end
