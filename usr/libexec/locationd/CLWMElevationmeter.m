@implementation CLWMElevationmeter

- (CLWMElevationmeter)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMElevationmeter *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLWMElevationmeter;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_disableForceActiveListeners = a5->disableForceActiveListeners;
    result->_sampleCount = 0;
  }
  return result;
}

- (void)setupListener
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[8];
  __int16 v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;

  if (!self->_elevationmeterObserverClient.__ptr_.__value_)
    sub_1004FAEDC();
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D6E48);
  v2 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2082;
    v9 = "assert";
    v10 = 2081;
    v11 = "!_elevationmeterObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of elevationmeter listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6E48);
  }
  v3 = qword_10229FE38;
  if (os_signpost_enabled((os_log_t)qword_10229FE38))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2082;
    v9 = "assert";
    v10 = 2081;
    v11 = "!_elevationmeterObserverClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of elevationmeter listener.", "{\"msg%{public}.0s\":\"Duplicate creation of elevationmeter listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6E48);
  }
  v4 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2082;
    v9 = "assert";
    v10 = 2081;
    v11 = "!_elevationmeterObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of elevationmeter listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMElevationmeter.mm", 62, "-[CLWMElevationmeter setupListener]");
}

- (void)teardownListeners
{
  Client *value;

  value = self->_elevationmeterObserverClient.__ptr_.__value_;
  self->_elevationmeterObserverClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (void)onElevationmetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  WriterManager *ptr;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  _QWORD v17[436];
  uint64_t v18;
  char v19;

  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_1015EB864(v17);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v19 |= 1u;
      v17[77] = v7;
      sub_101602C38((uint64_t)v17);
      sub_1016376F8(v18);
      v8 = v18;
      v9 = *(_QWORD *)(v18 + 8);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *((double *)a4 + 1));
      *(_WORD *)(v9 + 60) |= 1u;
      *(_QWORD *)(v9 + 8) = v10;
      v11 = *(_QWORD *)(v8 + 8);
      v12 = *((_DWORD *)a4 + 4);
      *(_WORD *)(v11 + 60) |= 0x10u;
      *(_DWORD *)(v11 + 32) = v12;
      v13 = *(_QWORD *)(v8 + 8);
      v14 = *((_DWORD *)a4 + 5);
      *(_WORD *)(v13 + 60) |= 0x20u;
      *(_DWORD *)(v13 + 36) = v14;
      v15 = *(_QWORD *)(v8 + 8);
      v16 = *((_DWORD *)a4 + 10);
      *(_WORD *)(v15 + 60) |= 0x200u;
      *(_DWORD *)(v15 + 52) = v16;
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
      sub_1015EE304((PB::Base *)v17);
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

  sub_100261F44((uint64_t)&self->_writer);
  value = self->_elevationmeterObserverClient.__ptr_.__value_;
  self->_elevationmeterObserverClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
