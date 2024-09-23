@implementation CLWMPressure

- (CLWMPressure)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMPressure *v8;
  CLWMPressure *v9;
  uint64_t v10;
  float v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLWMPressure;
  v8 = -[CLWMBase init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_kPressureUpdateInterval = a5->kPressureUpdateInterval;
    v10 = rand();
    v11 = a5->kPrivacyPressureMaxOffset
        * (double)(int)(((unint64_t)((v10 << 32 >> 2) + (int)v10) >> 63)
                      + ((int)((unint64_t)((v10 << 32 >> 2) + (int)v10) >> 32) >> 29));
    v9->_privacyPressureOffset = v11;
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
  if (sub_1000824CC())
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

  if (self->_pressureDispatcher.__ptr_.__value_ && sub_1000824CC())
  {
    v3 = sub_1000824CC();
    sub_1000A4A6C(v3, 1, (uint64_t)self->_pressureDispatcher.__ptr_.__value_);
    value = self->_pressureDispatcher.__ptr_.__value_;
    self->_pressureDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D8480);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording pressure stopped.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D8480);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Recording pressure stopped.", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMPressure teardownListeners]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)onPressureData:(const Sample *)a3
{
  WriterManager *ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double var0;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[443];
  uint64_t v13;
  char v14;

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && !self->_disablePressure)
  {
    ++self->_sampleCount;
    sub_1015EB864(v12);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v14 |= 1u;
    v12[77] = v6;
    sub_101603084((uint64_t)v12);
    sub_101639100(v13);
    v7 = v13;
    v8 = *(_QWORD *)(v13 + 8);
    var0 = a3->var0;
    *(_BYTE *)(v8 + 24) |= 1u;
    *(double *)(v8 + 8) = var0;
    v10 = *(_QWORD *)(v7 + 8);
    *(float *)&var0 = a3->var1.var0 + self->_privacyPressureOffset;
    *(_BYTE *)(v10 + 24) |= 2u;
    *(_DWORD *)(v10 + 16) = LODWORD(var0);
    v11 = *(_QWORD *)(v7 + 8);
    *(float *)&var0 = a3->var1.var1;
    *(_BYTE *)(v11 + 24) |= 4u;
    *(_DWORD *)(v11 + 20) = LODWORD(var0);
    sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v12);
    sub_1015EE304((PB::Base *)v12);
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
  value = self->_pressureDispatcher.__ptr_.__value_;
  self->_pressureDispatcher.__ptr_.__value_ = 0;
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
