@implementation CLWMAccelerometer800

- (CLWMAccelerometer800)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMAccelerometer800 *v7;
  CLWMAccelerometer800 *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLWMAccelerometer800;
  v7 = -[CLWMBase init](&v10, "init", a3, a4, a5);
  v8 = v7;
  if (v7)
  {
    v7->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v7->_universe = (CLIntersiloUniverse *)a4;
    v7->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_sampleCount = 0;
  }
  return v8;
}

- (void)setupListener
{
  if (!self->_accel800Dispatcher.__ptr_.__value_)
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

  if (self->_accel800Dispatcher.__ptr_.__value_)
  {
    v3 = sub_1001FBB04(0);
    sub_1000A4A6C(v3, 15, (uint64_t)self->_accel800Dispatcher.__ptr_.__value_);
    value = self->_accel800Dispatcher.__ptr_.__value_;
    self->_accel800Dispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D7AE0);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording fast accelerometer stopped.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D7AE0);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Recording fast accelerometer stopped.", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMAccelerometer800 teardownListeners]", "%s\n", v6);
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
  v3.super_class = (Class)CLWMAccelerometer800;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)onAccelerometer800Data:(const void *)a3 count:(unsigned int)a4
{
  WriterManager *ptr;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[432];
  uint64_t v18;
  char v19;

  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      LODWORD(v5) = a4;
      ++self->_sampleCount;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ContainsFastAccelData"));
      if ((_DWORD)v5)
      {
        v8 = *(_QWORD *)((char *)a3 + 224 * (v5 - 1) + 33);
        v5 = v5;
        v9 = (char *)a3 + 33;
        do
        {
          sub_1015EB864(v17);
          -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
          v19 |= 1u;
          v17[77] = v10;
          sub_101603340((uint64_t)v17);
          sub_101547254(v18);
          v11 = v18;
          v12 = *(double *)((char *)v9 - 25) + (double)(unint64_t)(v8 - *v9) / -1000000.0;
          v13 = *(_QWORD *)(v18 + 8);
          *(_BYTE *)(v13 + 32) |= 1u;
          *(double *)(v13 + 8) = v12;
          v14 = *(_QWORD *)(v11 + 8);
          LODWORD(v12) = *((_DWORD *)v9 - 4);
          *(_BYTE *)(v14 + 32) |= 4u;
          *(_DWORD *)(v14 + 20) = LODWORD(v12);
          v15 = *(_QWORD *)(v11 + 8);
          LODWORD(v12) = *((_DWORD *)v9 - 3);
          *(_BYTE *)(v15 + 32) |= 8u;
          *(_DWORD *)(v15 + 24) = LODWORD(v12);
          v16 = *(_QWORD *)(v11 + 8);
          LODWORD(v12) = *((_DWORD *)v9 - 2);
          *(_BYTE *)(v16 + 32) |= 0x10u;
          *(_DWORD *)(v16 + 28) = LODWORD(v12);
          sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
          sub_1015EE304((PB::Base *)v17);
          v9 += 28;
          --v5;
        }
        while (v5);
      }
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
  value = self->_accel800Dispatcher.__ptr_.__value_;
  self->_accel800Dispatcher.__ptr_.__value_ = 0;
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
