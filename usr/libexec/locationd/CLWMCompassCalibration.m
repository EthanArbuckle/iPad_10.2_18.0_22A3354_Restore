@implementation CLWMCompassCalibration

- (CLWMCompassCalibration)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMCompassCalibration *v8;
  CLWMCompassCalibration *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLWMCompassCalibration;
  v8 = -[CLWMBase init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_kCompassCalibrationKey = *(__CFString **)&a5[1].disableAveragedALS;
    v9->_kCachedCalibrationLifeTime = *(double *)&a5[1].disableOdometer;
    v9->_kCachedCompassCalibrationQuality = a5->kCachedCompassCalibrationQuality;
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
  if (!self->_compassCalibrationDispatcher.__ptr_.__value_)
  {
    -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
    operator new();
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

  if (self->_compassCalibrationDispatcher.__ptr_.__value_)
  {
    v3 = sub_1000A652C(0);
    sub_1000A4A6C(v3, 6, (uint64_t)self->_compassCalibrationDispatcher.__ptr_.__value_);
    value = self->_compassCalibrationDispatcher.__ptr_.__value_;
    self->_compassCalibrationDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7A08);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording compass calibration stopped.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7A08);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Recording compass calibration stopped.", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMCompassCalibration teardownListeners]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMCompassCalibration;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)retrieveCachedCompassCalibration
{
  WriterManager *ptr;
  uint64_t v4;
  float v5;
  float v6;
  id v7;
  id v8;
  uint64_t v9;
  CFAbsoluteTime v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  float kCachedCompassCalibrationQuality;
  NSObject *v27;
  const char *v28;
  uint8_t *v29;
  __int16 v30;
  void *v31;
  uint8_t buf[616];
  uint64_t v33;
  uint64_t v34;
  char v35;

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    v31 = 0;
    v4 = sub_1001FD94C();
    if ((sub_100219F40(v4, (uint64_t)self->_kCompassCalibrationKey, (CFTypeRef *)&v31) & 1) != 0)
    {
      objc_msgSend(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Time")), "floatValue");
      v6 = v5;
      v7 = objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Bias"));
      v8 = objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Scale"));
      sub_1015EB864(buf);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v35 |= 1u;
      v33 = v9;
      sub_1016037F0((uint64_t)buf);
      sub_101637340(v34);
      v10 = v6;
      v11 = v34;
      v12 = *(_QWORD *)(v34 + 8);
      *(_DWORD *)(v12 + 80) |= 1u;
      *(CFAbsoluteTime *)(v12 + 8) = v10;
      v13 = *(_QWORD *)(v11 + 8);
      objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "floatValue");
      *(_DWORD *)(v13 + 80) |= 2u;
      *(_DWORD *)(v13 + 16) = v14;
      v15 = *(_QWORD *)(v11 + 8);
      objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "floatValue");
      *(_DWORD *)(v15 + 80) |= 4u;
      *(_DWORD *)(v15 + 20) = v16;
      v17 = *(_QWORD *)(v11 + 8);
      objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 2), "floatValue");
      *(_DWORD *)(v17 + 80) |= 8u;
      *(_DWORD *)(v17 + 24) = v18;
      v19 = *(_QWORD *)(v11 + 8);
      objc_msgSend(objc_msgSend(v8, "objectAtIndexedSubscript:", 0), "floatValue");
      *(_DWORD *)(v19 + 80) |= 0x2000u;
      *(_DWORD *)(v19 + 64) = v20;
      v21 = *(_QWORD *)(v11 + 8);
      objc_msgSend(objc_msgSend(v8, "objectAtIndexedSubscript:", 1), "floatValue");
      *(_DWORD *)(v21 + 80) |= 0x4000u;
      *(_DWORD *)(v21 + 68) = v22;
      v23 = *(_QWORD *)(v11 + 8);
      objc_msgSend(objc_msgSend(v8, "objectAtIndexedSubscript:", 2), "floatValue");
      *(_DWORD *)(v23 + 80) |= 0x8000u;
      *(_DWORD *)(v23 + 72) = v24;
      v25 = *(_QWORD *)(v11 + 8);
      kCachedCompassCalibrationQuality = self->_kCachedCompassCalibrationQuality;
      *(_DWORD *)(v25 + 80) |= 0x1000u;
      *(float *)(v25 + 60) = kCachedCompassCalibrationQuality;
      if (CFAbsoluteTimeGetCurrent() - self->_kCachedCalibrationLifeTime <= v10)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ContainsValidCompassCalibration"));
      sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)buf);
      sub_1015EE304((PB::Base *)buf);
    }
    else
    {
      if (qword_10229FD40 != -1)
        dispatch_once(&qword_10229FD40, &stru_1021D7A28);
      v27 = qword_10229FD48;
      if (os_log_type_enabled((os_log_t)qword_10229FD48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[CompassCalibration] no persistent calibration found", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FD40 != -1)
          dispatch_once(&qword_10229FD40, &stru_1021D7A28);
        v30 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD48, 0, "[CompassCalibration] no persistent calibration found", &v30, 2);
        v29 = (uint8_t *)v28;
        sub_100512490("Generic", 1, 0, 2, "-[CLWMCompassCalibration retrieveCachedCompassCalibration]", "%s\n", v28);
        if (v29 != buf)
          free(v29);
      }
    }
  }
}

- (void)onCompassCalibrationData:(const CompassCalibration *)a3
{
  WriterManager *ptr;
  uint64_t v6;
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
  _QWORD v17[435];
  uint64_t v18;
  char v19;

  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ContainsValidCompassCalibration"));
      sub_1015EB864(v17);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v19 |= 1u;
      v17[77] = v6;
      sub_1016037F0((uint64_t)v17);
      sub_101637340(v18);
      v7 = v18;
      v8 = *(_QWORD *)(v18 + 8);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      *(_DWORD *)(v8 + 80) |= 1u;
      *(_QWORD *)(v8 + 8) = v9;
      v10 = *(_QWORD *)(v7 + 8);
      LODWORD(v9) = *(_DWORD *)(&a3->var4 + 1);
      *(_DWORD *)(v10 + 80) |= 2u;
      *(_DWORD *)(v10 + 16) = v9;
      v11 = *(_QWORD *)(v7 + 8);
      *(float *)&v9 = *(float *)((char *)a3->var5 + 1);
      *(_DWORD *)(v11 + 80) |= 4u;
      *(_DWORD *)(v11 + 20) = v9;
      v12 = *(_QWORD *)(v7 + 8);
      *(float *)&v9 = *(float *)((char *)&a3->var5[1] + 1);
      *(_DWORD *)(v12 + 80) |= 8u;
      *(_DWORD *)(v12 + 24) = v9;
      v13 = *(_QWORD *)(v7 + 8);
      *(float *)&v9 = *(float *)((char *)&a3->var6[2] + 1);
      *(_DWORD *)(v13 + 80) |= 0x2000u;
      *(_DWORD *)(v13 + 64) = v9;
      v14 = *(_QWORD *)(v7 + 8);
      *(float *)&v9 = *(float *)((char *)a3->var7 + 1);
      *(_DWORD *)(v14 + 80) |= 0x4000u;
      *(_DWORD *)(v14 + 68) = v9;
      v15 = *(_QWORD *)(v7 + 8);
      *(float *)&v9 = *(float *)((char *)&a3->var7[1] + 1);
      *(_DWORD *)(v15 + 80) |= 0x8000u;
      *(_DWORD *)(v15 + 72) = v9;
      v16 = *(_QWORD *)(v7 + 8);
      *(float *)&v9 = *(float *)((char *)&a3->var8[2] + 1);
      *(_DWORD *)(v16 + 80) |= 0x1000u;
      *(_DWORD *)(v16 + 60) = v9;
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
  Dispatcher *value;

  value = self->_compassCalibrationDispatcher.__ptr_.__value_;
  self->_compassCalibrationDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Dispatcher *, SEL))(*(_QWORD *)value + 8))(value, a2);
  sub_100261F44((uint64_t)&self->_writer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
