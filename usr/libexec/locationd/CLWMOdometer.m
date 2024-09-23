@implementation CLWMOdometer

- (CLWMOdometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMOdometer *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLWMOdometer;
  result = -[CLWMBase init](&v9, "init");
  if (result)
  {
    result->_delegate = (CLWorkoutRecordingDelegate *)a3;
    result->_universe = (CLIntersiloUniverse *)a4;
    result->_disablePrivacyElevationOffset = a5->disablePrivacyElevationOffset;
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

  if (!self->_odometerObserverClient.__ptr_.__value_)
    sub_1004FAEDC();
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D75F8);
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
    v11 = "!_odometerObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of odometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75F8);
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
    v11 = "!_odometerObserverClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of odometer listener.", "{\"msg%{public}.0s\":\"Duplicate creation of odometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75F8);
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
    v11 = "!_odometerObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of odometer listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMOdometer.mm", 66, "-[CLWMOdometer setupListener]");
}

- (void)teardownListeners
{
  Client *value;

  value = self->_odometerObserverClient.__ptr_.__value_;
  self->_odometerObserverClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4
{
  WriterManager *ptr;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[442];
  uint64_t v45;
  char v46;

  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      sub_1015EB864(v44);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v46 |= 1u;
      v44[77] = v7;
      sub_101602D64((uint64_t)v44);
      sub_101638D48(v45);
      v8 = v45;
      sub_101654E98(*(_QWORD *)(v45 + 8));
      v9 = *(_QWORD *)(v8 + 8);
      v10 = *(_QWORD *)(v9 + 72);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *(double *)a4);
      *(_WORD *)(v10 + 100) |= 0x80u;
      *(_QWORD *)(v10 + 64) = v11;
      v12 = *(_QWORD *)(v9 + 72);
      v13 = *((_QWORD *)a4 + 1);
      *(_WORD *)(v12 + 100) |= 2u;
      *(_QWORD *)(v12 + 16) = v13;
      v14 = *(_QWORD *)(v9 + 72);
      v15 = *((_QWORD *)a4 + 2);
      *(_WORD *)(v14 + 100) |= 1u;
      *(_QWORD *)(v14 + 8) = v15;
      v16 = *(_QWORD *)(v9 + 72);
      -[CLWMOdometer makeSafeAbsoluteElevation:](self, "makeSafeAbsoluteElevation:", *((double *)a4 + 3));
      *(_WORD *)(v16 + 100) |= 4u;
      *(_QWORD *)(v16 + 24) = v17;
      v18 = *(_QWORD *)(v9 + 72);
      v19 = *((_QWORD *)a4 + 4);
      *(_WORD *)(v18 + 100) |= 0x40u;
      *(_QWORD *)(v18 + 56) = v19;
      v20 = *(_QWORD *)(v9 + 72);
      v21 = *((_QWORD *)a4 + 5);
      *(_WORD *)(v20 + 100) |= 0x20u;
      *(_QWORD *)(v20 + 48) = v21;
      v22 = *(_QWORD *)(v9 + 72);
      v23 = *((_QWORD *)a4 + 6);
      *(_WORD *)(v22 + 100) |= 0x10u;
      *(_QWORD *)(v22 + 40) = v23;
      v24 = *(_QWORD *)(v9 + 72);
      v25 = *((_QWORD *)a4 + 7);
      *(_WORD *)(v24 + 100) |= 8u;
      *(_QWORD *)(v24 + 32) = v25;
      v26 = *(_QWORD *)(v9 + 72);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *((double *)a4 + 8));
      *(_WORD *)(v26 + 100) |= 0x100u;
      *(_QWORD *)(v26 + 72) = v27;
      v28 = *(_QWORD *)(v9 + 72);
      v29 = *((_DWORD *)a4 + 21);
      *(_WORD *)(v28 + 100) |= 0x400u;
      *(_DWORD *)(v28 + 84) = v29;
      v30 = *(_QWORD *)(v9 + 72);
      v31 = *((_DWORD *)a4 + 20);
      *(_WORD *)(v30 + 100) |= 0x800u;
      *(_DWORD *)(v30 + 88) = v31;
      v32 = *(_QWORD *)(v8 + 8);
      -[CLWMOdometer makeSafeAbsoluteElevation:](self, "makeSafeAbsoluteElevation:", *((double *)a4 + 12));
      *(_BYTE *)(v32 + 80) |= 4u;
      *(_QWORD *)(v32 + 24) = v33;
      v34 = *(_QWORD *)(v8 + 8);
      v35 = *((_QWORD *)a4 + 13);
      *(_BYTE *)(v34 + 80) |= 8u;
      *(_QWORD *)(v34 + 32) = v35;
      v36 = *(_QWORD *)(v8 + 8);
      -[CLWMOdometer makeSafeAbsoluteElevation:](self, "makeSafeAbsoluteElevation:", *((double *)a4 + 14));
      *(_BYTE *)(v36 + 80) |= 0x40u;
      *(_QWORD *)(v36 + 56) = v37;
      v38 = *(_QWORD *)(v8 + 8);
      v39 = *((_QWORD *)a4 + 15);
      *(_BYTE *)(v38 + 80) |= 0x80u;
      *(_QWORD *)(v38 + 64) = v39;
      v40 = *(_QWORD *)(v8 + 8);
      v41 = *((_QWORD *)a4 + 16);
      *(_BYTE *)(v40 + 80) |= 2u;
      *(_QWORD *)(v40 + 16) = v41;
      v42 = *(_QWORD *)(v8 + 8);
      v43 = *((_QWORD *)a4 + 17);
      *(_BYTE *)(v42 + 80) |= 1u;
      *(_QWORD *)(v42 + 8) = v43;
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v44);
      sub_1015EE304((PB::Base *)v44);
    }
  }
}

- (double)makeSafeAbsoluteElevation:(double)a3
{
  NSObject *v5;
  double privacyElevationOffset;
  double v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  double v12;
  uint8_t buf[4];
  double v14;

  if (a3 != 0.0 && self->_privacyElevationOffset == 0.0 && !self->_disablePrivacyElevationOffset)
  {
    self->_privacyElevationOffset = a3;
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D75F8);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      privacyElevationOffset = self->_privacyElevationOffset;
      *(_DWORD *)buf = 134283521;
      v14 = privacyElevationOffset;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Offsetting elevation by %{private}f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D75F8);
      v8 = self->_privacyElevationOffset;
      v11 = 134283521;
      v12 = v8;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Offsetting elevation by %{private}f", &v11, 12);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMOdometer makeSafeAbsoluteElevation:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
  return a3 - self->_privacyElevationOffset;
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
  value = self->_odometerObserverClient.__ptr_.__value_;
  self->_odometerObserverClient.__ptr_.__value_ = 0;
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
