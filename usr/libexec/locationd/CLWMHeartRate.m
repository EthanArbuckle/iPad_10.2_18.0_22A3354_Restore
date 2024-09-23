@implementation CLWMHeartRate

- (CLWMHeartRate)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMHeartRate *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLWMHeartRate;
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

  if (!self->_heartRateObserverClient.__ptr_.__value_)
    sub_100A01AFC();
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D8418);
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
    v11 = "!_heartRateObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D8418);
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
    v11 = "!_heartRateObserverClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of heart rate listener.", "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D8418);
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
    v11 = "!_heartRateObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMHeartRate.mm", 63, "-[CLWMHeartRate setupListener]");
}

- (void)teardownListeners
{
  Client *value;

  value = self->_heartRateObserverClient.__ptr_.__value_;
  self->_heartRateObserverClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (void)onHeartRateNotification:(const int *)a3 data:(const NotificationData *)a4
{
  WriterManager *ptr;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  _QWORD v22[440];
  uint64_t v23;
  char v24;

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    ++self->_sampleCount;
    if ((*a3 & 0xFFFFFFFE) == 4)
    {
      sub_1015EB864(v22);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v24 |= 1u;
      v22[77] = v7;
      sub_101602C9C((uint64_t)v22);
      sub_10161A348(v23);
      v8 = v23;
      v9 = *(_QWORD *)(v23 + 8);
      v10 = *(_DWORD *)a4;
      *(_WORD *)(v9 + 68) |= 0x40u;
      *(_DWORD *)(v9 + 52) = v10;
      v11 = *(_QWORD *)(v8 + 8);
      v12 = *((_QWORD *)a4 + 1);
      *(_WORD *)(v11 + 68) |= 2u;
      *(_QWORD *)(v11 + 16) = v12;
      v13 = *(_QWORD *)(v8 + 8);
      v14 = *((_QWORD *)a4 + 2);
      *(_WORD *)(v13 + 68) |= 1u;
      *(_QWORD *)(v13 + 8) = v14;
      v15 = *(_QWORD *)(v8 + 8);
      LOBYTE(v10) = *((_BYTE *)a4 + 24);
      *(_WORD *)(v15 + 68) |= 0x200u;
      *(_BYTE *)(v15 + 64) = v10;
      v16 = *(_QWORD *)(v8 + 8);
      v17 = *((_QWORD *)a4 + 4);
      *(_WORD *)(v16 + 68) |= 0x10u;
      *(_QWORD *)(v16 + 40) = v17;
      v18 = *(_QWORD *)(v8 + 8);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *((double *)a4 + 5));
      *(_WORD *)(v18 + 68) |= 8u;
      *(_QWORD *)(v18 + 32) = v19;
      v20 = *(_QWORD *)(v8 + 8);
      v21 = *((_DWORD *)a4 + 14);
      *(_WORD *)(v20 + 68) |= 0x20u;
      *(_DWORD *)(v20 + 48) = v21;
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v22);
      sub_1015EE304((PB::Base *)v22);
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
  value = self->_heartRateObserverClient.__ptr_.__value_;
  self->_heartRateObserverClient.__ptr_.__value_ = 0;
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
