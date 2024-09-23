@implementation CLWMCalorimetry

- (void)setWorkoutRecording:(id)a3
{
  self->_workoutRecording = (CLWorkoutRecording *)a3;
}

- (CLWMCalorimetry)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMCalorimetry *v8;
  CLWMCalorimetry *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLWMCalorimetry;
  v8 = -[CLWMBase init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_disableBodyMetrics = a5->disableBodyMetrics;
    v9->_disableMeanMaxMets = a5->disableMeanMaxMets;
    v9->_sampleCount = 0;
  }
  return v9;
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

  if (!self->_calorimetryClient.__ptr_.__value_)
    sub_1011D4D78();
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D7618);
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
    v11 = "!_calorimetryClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of calorimetry listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7618);
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
    v11 = "!_calorimetryClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of calorimetry listener.", "{\"msg%{public}.0s\":\"Duplicate creation of calorimetry listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7618);
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
    v11 = "!_calorimetryClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of calorimetry listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMCalorimetry.mm", 78, "-[CLWMCalorimetry setupListener]");
}

- (void)teardownListeners
{
  Client *value;

  -[CLWMCalorimetry writeBodyMetrics](self, "writeBodyMetrics");
  value = self->_calorimetryClient.__ptr_.__value_;
  self->_calorimetryClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (void)dealloc
{
  objc_super v3;

  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMCalorimetry;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)onCalorimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  int v6;
  NSMutableDictionary *metadata;
  uint64_t v9;
  void **v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *__p[2];
  char v15;

  ++self->_sampleCount;
  v6 = *a3;
  if (*a3 == 2)
  {
    if (!sub_1018CBFA4((uint64_t)&self->_bodyMetrics, (uint64_t)a4))
    {
      v11 = *(_OWORD *)a4;
      v12 = *((_OWORD *)a4 + 1);
      v13 = *((_OWORD *)a4 + 2);
      *(_OWORD *)&self->_bodyMetrics.runVo2max = *(_OWORD *)((char *)a4 + 44);
      *(_OWORD *)&self->_bodyMetrics.vo2max = v12;
      *(_OWORD *)&self->_bodyMetrics.hronset = v13;
      *(_OWORD *)&self->_bodyMetrics.gender = v11;
      -[CLWMCalorimetry writeBodyMetrics](self, "writeBodyMetrics");
      return;
    }
    v6 = *a3;
  }
  if (v6 == 8)
  {
    metadata = self->_metadata;
    v9 = sub_100197040();
    sub_10075A5A0(v9, (uint64_t)__p);
    if (v15 >= 0)
      v10 = __p;
    else
      v10 = (void **)__p[0];
    -[NSMutableDictionary setValue:forKey:](metadata, "setValue:forKey:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10), CFSTR("HardwareType"));
    if (v15 < 0)
      operator delete(__p[0]);
    -[NSMutableDictionary setValue:forKey:](self->_metadata, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)a4), CFSTR("MeanMaxMets"));
  }
}

- (void)resetBodyMetrics
{
  *(_OWORD *)&self->_bodyMetrics.hronset = xmmword_101CEB298;
  *(_OWORD *)&self->_bodyMetrics.runVo2max = *(__int128 *)((char *)&xmmword_101CEB298 + 12);
  *(_OWORD *)&self->_bodyMetrics.gender = xmmword_101CEB278;
  *(_OWORD *)&self->_bodyMetrics.vo2max = unk_101CEB288;
  self->_bodyMetrics.runVo2max = 7.0;
}

- (void)writeBodyMetrics
{
  WriterManager *ptr;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int gender;
  uint64_t v8;
  float heightM;
  uint64_t v10;
  float weightKG;
  uint64_t v12;
  float vo2max;
  uint64_t v14;
  float age;
  uint64_t v16;
  float hrmin;
  uint64_t v18;
  float hrmax;
  uint64_t v20;
  float hronset;
  _QWORD v22[434];
  uint64_t v23;
  char v24;

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && !self->_disableBodyMetrics)
  {
    sub_1015EB864(v22);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v24 |= 1u;
    v22[77] = v4;
    sub_101602BD4((uint64_t)v22);
    sub_101636F88(v23);
    v5 = v23;
    v6 = *(_QWORD *)(v23 + 8);
    gender = self->_bodyMetrics.gender;
    *(_WORD *)(v6 + 64) |= 0x10u;
    *(_DWORD *)(v6 + 24) = gender;
    v8 = *(_QWORD *)(v5 + 8);
    heightM = self->_bodyMetrics.heightM;
    *(_WORD *)(v8 + 64) |= 0x20u;
    *(float *)(v8 + 28) = heightM;
    v10 = *(_QWORD *)(v5 + 8);
    weightKG = self->_bodyMetrics.weightKG;
    *(_WORD *)(v10 + 64) |= 0x1000u;
    *(float *)(v10 + 56) = weightKG;
    v12 = *(_QWORD *)(v5 + 8);
    vo2max = self->_bodyMetrics.vo2max;
    *(_WORD *)(v12 + 64) |= 0x800u;
    *(float *)(v12 + 52) = vo2max;
    v14 = *(_QWORD *)(v5 + 8);
    age = self->_bodyMetrics.age;
    *(_WORD *)(v14 + 64) |= 2u;
    *(float *)(v14 + 12) = age;
    v16 = *(_QWORD *)(v5 + 8);
    hrmin = self->_bodyMetrics.hrmin;
    *(_WORD *)(v16 + 64) |= 0x80u;
    *(float *)(v16 + 36) = hrmin;
    v18 = *(_QWORD *)(v5 + 8);
    hrmax = self->_bodyMetrics.hrmax;
    *(_WORD *)(v18 + 64) |= 0x40u;
    *(float *)(v18 + 32) = hrmax;
    v20 = *(_QWORD *)(v5 + 8);
    hronset = self->_bodyMetrics.hronset;
    *(_WORD *)(v20 + 64) |= 0x100u;
    *(float *)(v20 + 40) = hronset;
    sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v22);
    sub_1015EE304((PB::Base *)v22);
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
  value = self->_calorimetryClient.__ptr_.__value_;
  self->_calorimetryClient.__ptr_.__value_ = 0;
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
