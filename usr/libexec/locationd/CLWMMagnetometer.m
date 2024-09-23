@implementation CLWMMagnetometer

- (CLWMMagnetometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMMagnetometer *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLWMMagnetometer;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_magIntervalSeconds = a5->magIntervalSeconds;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t aBlock;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  if (sub_1000A6A30())
  {
    if (!self->_magnetometerDispatcher.__ptr_.__value_)
    {
      -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
      operator new();
    }
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D87C8);
    v3 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_FAULT))
    {
      aBlock = 68289539;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "!_magnetometerDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of magnetometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&aBlock, 0x26u);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D87C8);
    }
    v4 = qword_10229FE38;
    if (os_signpost_enabled((os_log_t)qword_10229FE38))
    {
      aBlock = 68289539;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "!_magnetometerDispatcher";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of magnetometer listener.", "{\"msg%{public}.0s\":\"Duplicate creation of magnetometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&aBlock, 0x26u);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D87C8);
    }
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_INFO))
    {
      aBlock = 68289539;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "!_magnetometerDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of magnetometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&aBlock, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMMagnetometer.mm", 62, "-[CLWMMagnetometer setupListener]");
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

  if (self->_magnetometerDispatcher.__ptr_.__value_)
  {
    v3 = sub_1000A6A30();
    sub_1000A4A6C(v3, 0, (uint64_t)self->_magnetometerDispatcher.__ptr_.__value_);
    value = self->_magnetometerDispatcher.__ptr_.__value_;
    self->_magnetometerDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D87C8);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording magnetometer stopped.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D87C8);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Recording magnetometer stopped.", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMMagnetometer teardownListeners]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (id)metadata
{
  return 0;
}

- (void)onMagnetometerData:(const Sample *)a3
{
  WriterManager *ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double var0;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[441];
  uint64_t v15;
  char v16;

  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_1015EB864(v14);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v16 |= 1u;
      v14[77] = v6;
      sub_10160378C((uint64_t)v14);
      sub_1015AC500(v15);
      v7 = v15;
      v8 = *(_QWORD *)(v15 + 8);
      var0 = a3->var0;
      *(_BYTE *)(v8 + 36) |= 1u;
      *(double *)(v8 + 8) = var0;
      v10 = *(_QWORD *)(v7 + 8);
      *(float *)&var0 = a3->var1.var0;
      *(_BYTE *)(v10 + 36) |= 8u;
      *(_DWORD *)(v10 + 24) = LODWORD(var0);
      v11 = *(_QWORD *)(v7 + 8);
      *(float *)&var0 = a3->var1.var1;
      *(_BYTE *)(v11 + 36) |= 0x10u;
      *(_DWORD *)(v11 + 28) = LODWORD(var0);
      v12 = *(_QWORD *)(v7 + 8);
      *(float *)&var0 = a3->var1.var2;
      *(_BYTE *)(v12 + 36) |= 0x20u;
      *(_DWORD *)(v12 + 32) = LODWORD(var0);
      v13 = *(_QWORD *)(v7 + 8);
      *(float *)&var0 = a3->var2;
      *(_BYTE *)(v13 + 36) |= 4u;
      *(_DWORD *)(v13 + 20) = LODWORD(var0);
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v14);
      sub_1015EE304((PB::Base *)v14);
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
  value = self->_magnetometerDispatcher.__ptr_.__value_;
  self->_magnetometerDispatcher.__ptr_.__value_ = 0;
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
