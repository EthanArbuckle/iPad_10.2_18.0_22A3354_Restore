@implementation CLBarometerCalibrationSourceSubmersionState

- (CLBarometerCalibrationSourceSubmersionState)initWithUniverse:(id)a3 delegate:(id)a4
{
  CLBarometerCalibrationSourceSubmersionState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLBarometerCalibrationSourceSubmersionState;
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

  value = self->_submersionStateDispatcher.__ptr_.__value_;
  self->_submersionStateDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4.receiver = self;
  v4.super_class = (Class)CLBarometerCalibrationSourceSubmersionState;
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
      sub_1000A4FD8(v3, 37, (uint64_t)self->_submersionStateDispatcher.__ptr_.__value_, -1.0);
    }
    self->super._sourceEnabled = 1;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102192168);
    v4 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "submersion state source enabled", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102192168);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "submersion state source enabled", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceSubmersionState enableSource]", "%s\n", v5);
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
      sub_1000A4A6C(v3, 37, (uint64_t)self->_submersionStateDispatcher.__ptr_.__value_);
    }
    self->super._sourceEnabled = 0;
  }
}

- (void)onSubmersionState:(const CMSubmersionState *)a3
{
  _QWORD *v5;
  unint64_t *v6;
  NSObject *v7;
  CLBarometerCalibrationSourceClient *delegate;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  const char *v16;
  uint8_t *v17;
  char *v18;
  std::__shared_weak_count *v19;
  _WORD v20[8];
  char *v21;
  std::__shared_weak_count *v22;
  uint8_t buf[1640];

  v5 = operator new(0x28uLL);
  v5[1] = 0;
  v6 = v5 + 1;
  v5[2] = 0;
  *v5 = off_102167810;
  v5[3] = *(_QWORD *)&a3->var0;
  v5[4] = 0;
  v21 = (char *)(v5 + 3);
  v22 = (std::__shared_weak_count *)v5;
  *((_BYTE *)v5 + 32) = a3->var1;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102192168);
  v7 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ping on submersion state", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102192168);
    v20[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "ping on submersion state", v20, 2);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceSubmersionState onSubmersionState:]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  delegate = self->super._delegate;
  v18 = (char *)(v5 + 3);
  v19 = (std::__shared_weak_count *)v5;
  do
    v9 = __ldxr(v6);
  while (__stxr(v9 + 1, v6));
  -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 8, &v18);
  v10 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v22;
  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

- (void).cxx_destruct
{
  void *value;

  value = self->_submersionStateDispatcher.__ptr_.__value_;
  self->_submersionStateDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
