@implementation CLWMAccelerometer

- (CLWMAccelerometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMAccelerometer *v8;
  CLWMAccelerometer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLWMAccelerometer;
  v8 = -[CLWMBase init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_fWorkoutRecorderAccelSampleCount = 0;
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_accelIntervalSeconds = a5->accelIntervalSeconds;
    v9->_kWorkoutRecorderWaitNumAccelSamples = *(_DWORD *)&a5->recordingType.__r_.var1;
    v9->_sampleCount = 0;
  }
  return v9;
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

  if (sub_10024095C())
  {
    if (!self->_accelerometerDispatcher.__ptr_.__value_)
    {
      -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
      operator new();
    }
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7B38);
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
      v13 = "!_accelerometerDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of accelerometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7B38);
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
      v13 = "!_accelerometerDispatcher";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of accelerometer listener.", "{\"msg%{public}.0s\":\"Duplicate creation of accelerometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7B38);
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
      v13 = "!_accelerometerDispatcher";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of accelerometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMAccelerometer.mm", 71, "-[CLWMAccelerometer setupListener]");
    __break(1u);
  }
}

- (void)teardownListeners
{
  uint64_t v3;
  Dispatcher *value;

  if (self->_accelerometerDispatcher.__ptr_.__value_)
  {
    v3 = sub_10024095C();
    sub_1000A4A6C(v3, 0, (uint64_t)self->_accelerometerDispatcher.__ptr_.__value_);
    value = self->_accelerometerDispatcher.__ptr_.__value_;
    self->_accelerometerDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
    self->_fWorkoutRecorderAccelSampleCount = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMAccelerometer;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)onAccelerometerData:(const Sample *)a3
{
  WriterManager *ptr;
  unsigned int fWorkoutRecorderAccelSampleCount;
  id v7;
  CFAbsoluteTime Current;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double var0;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[431];
  uint64_t v18;
  char v19;
  _QWORD v20[5];

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    ++self->_sampleCount;
    fWorkoutRecorderAccelSampleCount = self->_fWorkoutRecorderAccelSampleCount;
    if (fWorkoutRecorderAccelSampleCount >= self->_kWorkoutRecorderWaitNumAccelSamples)
    {
      if (!-[NSMutableDictionary objectForKey:](self->_metadata, "objectForKey:", CFSTR("SensorRecordingActiveAndEnabled")))
      {
        v7 = objc_msgSend(-[CLIntersiloUniverse vendor](self->_universe, "vendor"), "proxyForService:", CFSTR("CLFallNotifier"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1018D5840;
        v20[3] = &unk_102155328;
        v20[4] = self;
        objc_msgSend(v7, "doAsync:", v20);
      }
    }
    else
    {
      self->_fWorkoutRecorderAccelSampleCount = fWorkoutRecorderAccelSampleCount + 1;
    }
    sub_1015EB864(v17);
    Current = CFAbsoluteTimeGetCurrent();
    v16.receiver = self;
    v16.super_class = (Class)CLWMAccelerometer;
    -[CLWMBase makeSafeCFAbsoluteTime:](&v16, "makeSafeCFAbsoluteTime:", Current);
    v19 |= 1u;
    v17[77] = v9;
    sub_101602B70((uint64_t)v17);
    sub_101547254(v18);
    v10 = v18;
    v11 = *(_QWORD *)(v18 + 8);
    var0 = a3->var0;
    *(_BYTE *)(v11 + 32) |= 1u;
    *(double *)(v11 + 8) = var0;
    v13 = *(_QWORD *)(v10 + 8);
    *(float *)&var0 = a3->var1.var0;
    *(_BYTE *)(v13 + 32) |= 4u;
    *(_DWORD *)(v13 + 20) = LODWORD(var0);
    v14 = *(_QWORD *)(v10 + 8);
    *(float *)&var0 = a3->var1.var1;
    *(_BYTE *)(v14 + 32) |= 8u;
    *(_DWORD *)(v14 + 24) = LODWORD(var0);
    v15 = *(_QWORD *)(v10 + 8);
    *(float *)&var0 = a3->var1.var2;
    *(_BYTE *)(v15 + 32) |= 0x10u;
    *(_DWORD *)(v15 + 28) = LODWORD(var0);
    sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
    sub_1015EE304((PB::Base *)v17);
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
  value = self->_accelerometerDispatcher.__ptr_.__value_;
  self->_accelerometerDispatcher.__ptr_.__value_ = 0;
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
