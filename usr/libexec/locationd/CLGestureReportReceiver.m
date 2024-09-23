@implementation CLGestureReportReceiver

- (void)setDelegate:(CLGestureReportReceiverDelegate *)a3
{
  self->_delegate = a3;
}

+ (BOOL)isSupported
{
  if (qword_10230DAA0 != -1)
    dispatch_once(&qword_10230DAA0, &stru_1021ABFA0);
  return byte_10230DA98;
}

- (CLGestureReportReceiver)init
{
  CLGestureReportReceiver *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLGestureReportReceiver;
  v2 = -[CLGestureReportReceiver init](&v4, "init");
  if (v2 && +[CLGestureReportReceiver isSupported](CLGestureReportReceiver, "isSupported"))
    operator new();
  return v2;
}

- (void)onWakeGesture:(const Sample *)a3
{
  _OWORD *v4;
  __int128 v5;
  CLGestureReportReceiverDelegate *delegate;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  const char *v11;
  __int128 v12;
  uint64_t v13;
  _WORD v14[8];
  uint64_t (**v15)(_QWORD);
  _BYTE v16[24];
  unsigned __int8 v17[32];
  uint8_t buf[1640];

  v4 = *(_OWORD **)&a3->var1.var0;
  v5 = *(_OWORD *)((char *)v4 + 12);
  *(_OWORD *)v17 = *v4;
  *(_OWORD *)&v17[12] = v5;
  *(_QWORD *)v16 = 0;
  *(_QWORD *)&v16[8] = 0;
  v15 = &off_102178A58;
  *(_DWORD *)&v16[15] = 0;
  sub_101217628(v17, &v15);
  if (!v16[16])
  {
    sub_100197040();
    if (!sub_100195F08())
      goto LABEL_18;
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021ABFC0);
    v7 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CLGestureReportReceiver] failed to visit WakeGesture", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_18;
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021ABFC0);
    v14[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 16, "[CLGestureReportReceiver] failed to visit WakeGesture", v14, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLGestureReportReceiver onWakeGesture:]", "%s\n", v8);
LABEL_22:
    if (v9 != buf)
      free(v9);
    goto LABEL_18;
  }
  delegate = self->_delegate;
  if (delegate)
  {
    v13 = *(_QWORD *)&v16[16];
    v12 = *(_OWORD *)v16;
    (*((void (**)(CLGestureReportReceiverDelegate *, __int128 *))delegate->var0 + 2))(delegate, &v12);
    goto LABEL_18;
  }
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_1021ABFC0);
  v10 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CLGestureReportReceiver] No delegate set", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021ABFC0);
    v14[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 16, "[CLGestureReportReceiver] No delegate set", v14, 2);
    v9 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 0, "-[CLGestureReportReceiver onWakeGesture:]", "%s\n", v11);
    goto LABEL_22;
  }
LABEL_18:
  nullsub_34(&v15);
}

- (void).cxx_destruct
{
  CMWakeGestureNotificationVisitor *value;
  void *v4;

  value = self->_wakeGestureNotificationVisitor.__ptr_.__value_;
  self->_wakeGestureNotificationVisitor.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CMWakeGestureNotificationVisitor *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_wakeDispatcher.__ptr_.__value_;
  self->_wakeDispatcher.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(void *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
