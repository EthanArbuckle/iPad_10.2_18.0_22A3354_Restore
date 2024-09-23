@implementation CLBarometerCalibrationSourceSurfaceCalibration

- (CLBarometerCalibrationSourceSurfaceCalibration)initWithUniverse:(id)a3 delegate:(id)a4
{
  CLBarometerCalibrationSourceSurfaceCalibration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLBarometerCalibrationSourceSurfaceCalibration;
  v4 = -[CLBarometerCalibrationSource initWithUniverse:delegate:](&v6, "initWithUniverse:delegate:", a3, a4);
  if (v4)
  {
    -[CLIntersiloUniverse silo](v4->super._universe, "silo");
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  void *value;
  objc_super v4;

  value = self->_surfaceCalibrationDispatcher.__ptr_.__value_;
  self->_surfaceCalibrationDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4.receiver = self;
  v4.super_class = (Class)CLBarometerCalibrationSourceSurfaceCalibration;
  -[CLBarometerCalibrationSource dealloc](&v4, "dealloc");
}

- (void)enableSource
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (!self->super._sourceEnabled)
  {
    if (sub_1001FBB04(0))
    {
      v3 = sub_1001FBB04(0);
      sub_1000A4FD8(v3, 38, (uint64_t)self->_surfaceCalibrationDispatcher.__ptr_.__value_, -1.0);
    }
    self->super._sourceEnabled = 1;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B4FA0);
    v4 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "surface calibration source enabled", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B4FA0);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "surface calibration source enabled", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceSurfaceCalibration enableSource]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
}

- (void)disableSource
{
  uint64_t v3;

  if (self->super._sourceEnabled)
  {
    if (sub_1001FBB04(0))
    {
      v3 = sub_1001FBB04(0);
      sub_1000A4A6C(v3, 38, (uint64_t)self->_surfaceCalibrationDispatcher.__ptr_.__value_);
    }
    self->super._sourceEnabled = 0;
  }
}

- (void)onSurfaceCalibration:(const CMSurfaceCalibrationSample *)a3
{
  _QWORD *v5;
  unint64_t *v6;
  CLBarometerCalibrationSourceClient *delegate;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  char *v15;
  std::__shared_weak_count *v16;
  char *v17;
  std::__shared_weak_count *v18;

  v5 = operator new(0x30uLL);
  v5[2] = 0;
  *v5 = off_102167860;
  v5[5] = 1;
  v5[3] = *(_QWORD *)&a3->var0;
  v17 = (char *)(v5 + 3);
  v18 = (std::__shared_weak_count *)v5;
  *((double *)v5 + 4) = a3->var1;
  v5[1] = 0;
  v6 = v5 + 1;
  v15 = (char *)(v5 + 3);
  v16 = (std::__shared_weak_count *)v5;
  delegate = self->super._delegate;
  do
    v8 = __ldxr(v6);
  while (__stxr(v8 + 1, v6));
  -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 7, &v15);
  v9 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = v18;
  if (v18)
  {
    v13 = (unint64_t *)&v18->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (void).cxx_destruct
{
  void *value;

  value = self->_surfaceCalibrationDispatcher.__ptr_.__value_;
  self->_surfaceCalibrationDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
