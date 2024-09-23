@implementation CLWMFaceCovered

- (CLWMFaceCovered)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMFaceCovered *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLWMFaceCovered;
  result = -[CLWMBase init](&v8, "init", a3, a4, a5);
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_sampleCount = 0;
    result->_inSwimmingWorkout = 0;
  }
  return result;
}

- (void)setupListener
{
  -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
  operator new();
}

- (void)teardownListeners
{
  uint64_t v3;
  void *value;

  if (self->_faceCoveredDispatcher.__ptr_.__value_)
  {
    v3 = sub_1001FBB04(0);
    sub_1000A4A6C(v3, 39, (uint64_t)self->_faceCoveredDispatcher.__ptr_.__value_);
    value = self->_faceCoveredDispatcher.__ptr_.__value_;
    self->_faceCoveredDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
}

- (void)onFaceCovered:(const FaceCovered *)a3
{
  WriterManager *ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  _WORD v14[8];
  uint8_t buf[616];
  uint64_t v16;
  uint64_t v17;
  char v18;

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    if (self->_inSwimmingWorkout)
    {
      ++self->_sampleCount;
      sub_1015EB864(buf);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v18 |= 1u;
      v16 = v6;
      sub_101604920((uint64_t)buf);
      sub_101637AB0(v17);
      v7 = v17;
      v8 = *(_QWORD *)(v17 + 8);
      v9 = (double)a3->var0 / 1000000.0;
      *(_BYTE *)(v8 + 20) |= 1u;
      *(double *)(v8 + 8) = v9;
      v10 = *(_QWORD *)(v7 + 8);
      LOBYTE(v8) = a3->var1;
      *(_BYTE *)(v10 + 20) |= 2u;
      *(_BYTE *)(v10 + 16) = v8;
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)buf);
      sub_1015EE304((PB::Base *)buf);
    }
    else
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021D6DD0);
      v11 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLWMFC,do not write face covered event for non-swimming workout", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021D6DD0);
        v14[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "CLWMFC,do not write face covered event for non-swimming workout", v14, 2);
        v13 = (uint8_t *)v12;
        sub_100512490("Generic", 1, 0, 2, "-[CLWMFaceCovered onFaceCovered:]", "%s\n", v12);
        if (v13 != buf)
          free(v13);
      }
    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  uint64_t v7;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t *v14;
  uint8_t buf[4];
  CFAbsoluteTime Current;

  if (*((_QWORD *)a4 + 14) == 19)
  {
    v7 = *((_QWORD *)a4 + 2);
    if ((unint64_t)(v7 - 1) < 2)
    {
      self->_inSwimmingWorkout = 0;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021D6DD0);
      v12 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CLWMFC,swimming workout stopped,timestamp,%f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021D6DD0);
        v13 = qword_10229FE88;
        CFAbsoluteTimeGetCurrent();
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 0, "CLWMFC,swimming workout stopped,timestamp,%f");
        goto LABEL_25;
      }
    }
    else if (v7 == 3 || v7 == 0)
    {
      self->_inSwimmingWorkout = 1;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021D6DD0);
      v9 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLWMFC,swimming workout started,timestamp,%f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021D6DD0);
        v10 = qword_10229FE88;
        CFAbsoluteTimeGetCurrent();
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 0, "CLWMFC,swimming workout started,timestamp,%f");
LABEL_25:
        v14 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLWMFaceCovered onMotionStateMediatorNotification:data:]", "%s\n", v11);
        if (v14 != buf)
          free(v14);
      }
    }
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  sub_100349198(&self->_writer.__ptr_, (uint64_t *)a3.__ptr_);
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void).cxx_destruct
{
  Client *value;
  void *v4;

  sub_100261F44((uint64_t)&self->_writer);
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v4 = self->_faceCoveredDispatcher.__ptr_.__value_;
  self->_faceCoveredDispatcher.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(void *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
