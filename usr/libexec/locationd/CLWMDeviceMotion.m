@implementation CLWMDeviceMotion

- (CLWMDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMDeviceMotion *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLWMDeviceMotion;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_rotationRateIntervalSeconds = a5->rotationRateIntervalSeconds;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;

  if (sub_1002433D4())
  {
    if (!self->_deviceMotionDispatcher.__ptr_.__value_)
    {
      -[CLDeviceMotionProperties initWithMode:]([CLDeviceMotionProperties alloc], "initWithMode:", 3);
      -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
      operator new();
    }
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D5EB8);
    v3 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "!_deviceMotionDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of rotation rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D5EB8);
    }
    v4 = qword_10229FE38;
    if (os_signpost_enabled((os_log_t)qword_10229FE38))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "!_deviceMotionDispatcher";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of rotation rate listener.", "{\"msg%{public}.0s\":\"Duplicate creation of rotation rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D5EB8);
    }
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "!_deviceMotionDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of rotation rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMDeviceMotion.mm", 62, "-[CLWMDeviceMotion setupListener]");
    __break(1u);
  }
}

- (void)teardownListeners
{
  uint64_t v3;
  Dispatcher *value;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (self->_deviceMotionDispatcher.__ptr_.__value_)
  {
    v3 = sub_1002433D4();
    sub_101193558(v3, (uint64_t)self->_deviceMotionDispatcher.__ptr_.__value_);
    value = self->_deviceMotionDispatcher.__ptr_.__value_;
    self->_deviceMotionDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D5EB8);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording rotation rate stopped.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D5EB8);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Recording rotation rate stopped.", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMDeviceMotion teardownListeners]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)onDeviceMotionData:(const Sample *)a3
{
  WriterManager *ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double var0;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[444];
  uint64_t v14;
  char v15;

  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_1015EB864(v13);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v15 |= 1u;
      v13[77] = v6;
      sub_101602D00((uint64_t)v13);
      sub_1016394B8(v14);
      v7 = v14;
      v8 = *(_QWORD *)(v14 + 8);
      var0 = a3->var0;
      *(_BYTE *)(v8 + 28) |= 1u;
      *(double *)(v8 + 8) = var0;
      v10 = *(_QWORD *)(v7 + 8);
      LODWORD(var0) = HIDWORD(a3[2].var0);
      *(_BYTE *)(v10 + 28) |= 2u;
      *(_DWORD *)(v10 + 16) = LODWORD(var0);
      v11 = *(_QWORD *)(v7 + 8);
      *(float *)&var0 = a3[2].var1.var0;
      *(_BYTE *)(v11 + 28) |= 4u;
      *(_DWORD *)(v11 + 20) = LODWORD(var0);
      v12 = *(_QWORD *)(v7 + 8);
      *(float *)&var0 = a3[2].var1.var1;
      *(_BYTE *)(v12 + 28) |= 8u;
      *(_DWORD *)(v12 + 24) = LODWORD(var0);
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v13);
      sub_1015EE304((PB::Base *)v13);
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
  Dispatcher *value;

  sub_100261F44((uint64_t)&self->_writer);
  value = self->_deviceMotionDispatcher.__ptr_.__value_;
  self->_deviceMotionDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
