@implementation CLWMGymKit

- (void)setIsCyclingWorkout:(BOOL)a3
{
  self->_isCyclingWorkout = a3;
}

- (CLWMGymKit)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMGymKit *v8;
  NSObject *v9;
  const char *v11;
  uint8_t *v12;
  _QWORD aBlock[5];
  _WORD v14[8];
  objc_super v15;
  uint8_t buf[1640];

  v15.receiver = self;
  v15.super_class = (Class)CLWMGymKit;
  v8 = -[CLWMBase init](&v15, "init");
  if (v8)
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6E68);
    v9 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GymKit module is initialized.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6E68);
      v14[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "GymKit module is initialized.", v14, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMGymKit initWithDelegate:universeCopy:settings:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_disableForceActiveListeners = a5->disableForceActiveListeners;
    v8->_sampleCount = 0;
    v8->_isCyclingWorkout = sub_100F72B3C(*(_QWORD *)&a5[1].hasSyncInWatch);
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1018B90A8;
    aBlock[3] = &unk_102142CC0;
    aBlock[4] = v8;
    v8->_getBlockSetIsCycling = _Block_copy(aBlock);
  }
  return v8;
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

  if (!self->_fitnessMachineClient.__ptr_.__value_)
    sub_1010C50B4();
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D6E68);
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
    v11 = "!_fitnessMachineClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6E68);
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
    v11 = "!_fitnessMachineClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of heart rate listener.", "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6E68);
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
    v11 = "!_fitnessMachineClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMGymKit.mm", 82, "-[CLWMGymKit setupListener]");
}

- (void)teardownListeners
{
  Client *value;

  value = self->_fitnessMachineClient.__ptr_.__value_;
  self->_fitnessMachineClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  -[CLWMGymKit releaseBlocks](self, "releaseBlocks");
}

- (void)onFitnessMachineNotification:(const int *)a3 data:(const NotificationData *)a4
{
  WriterManager *ptr;
  int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[438];
  uint64_t v31;
  char v32;

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    ++self->_sampleCount;
    v7 = *((_DWORD *)a4 + 40);
    v8 = !*a3 && v7 == 1;
    if (v8 || !v7 && self->_isCyclingWorkout)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("HasCyclingMeterData"));
      sub_1015EB864(v30);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v32 |= 1u;
      v30[77] = v9;
      sub_101604470((uint64_t)v30);
      sub_101637E68(v31);
      v10 = v31;
      v11 = *(_QWORD *)(v31 + 8);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *(double *)a4);
      *(_DWORD *)(v11 + 176) |= 0x800u;
      *(_QWORD *)(v11 + 96) = v12;
      v13 = *(_QWORD *)(v10 + 8);
      v14 = *((_QWORD *)a4 + 14);
      *(_DWORD *)(v13 + 176) |= 0x20u;
      *(_QWORD *)(v13 + 48) = v14;
      v15 = *((double *)a4 + 15);
      v16 = *(_QWORD *)(v10 + 8);
      v17 = 0;
      v18 = 0;
      if (v15 > 0.0)
      {
        v18 = 0;
        if (v15 != 1.79769313e308)
        {
          -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", v15, 0.0);
          v18 = v19;
        }
      }
      *(_DWORD *)(v16 + 176) |= 0x80u;
      *(_QWORD *)(v16 + 64) = v18;
      v20 = *(_QWORD *)(v10 + 8);
      v21 = *((_QWORD *)a4 + 11);
      *(_DWORD *)(v20 + 176) |= 0x10u;
      *(_QWORD *)(v20 + 40) = v21;
      v22 = *((double *)a4 + 12);
      v23 = *(_QWORD *)(v10 + 8);
      if (v22 > 0.0 && v22 != 1.79769313e308)
      {
        -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:");
        v17 = v24;
      }
      *(_DWORD *)(v23 + 176) |= 2u;
      *(_QWORD *)(v23 + 16) = v17;
      v25 = *(_QWORD *)(v10 + 8);
      v26 = *((_QWORD *)a4 + 8);
      *(_DWORD *)(v25 + 176) |= 0x40u;
      *(_QWORD *)(v25 + 56) = v26;
      v27 = *((double *)a4 + 9);
      v28 = *(_QWORD *)(v10 + 8);
      v29 = 0;
      if (v27 > 0.0 && v27 != 1.79769313e308)
        -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", v27);
      *(_DWORD *)(v28 + 176) |= 0x400u;
      *(_QWORD *)(v28 + 88) = v29;
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v30);
      sub_1015EE304((PB::Base *)v30);
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

- (id)getBlockSetIsCycling
{
  return self->_getBlockSetIsCycling;
}

- (void)releaseBlocks
{
  _Block_release(self->_getBlockSetIsCycling);
}

- (void)dealloc
{
  objc_super v3;

  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMGymKit;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void).cxx_destruct
{
  Client *value;

  sub_100261F44((uint64_t)&self->_writer);
  value = self->_fitnessMachineClient.__ptr_.__value_;
  self->_fitnessMachineClient.__ptr_.__value_ = 0;
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
