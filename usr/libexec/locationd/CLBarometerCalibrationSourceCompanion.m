@implementation CLBarometerCalibrationSourceCompanion

- (CLBarometerCalibrationSourceCompanion)initWithUniverse:(id)a3 delegate:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLBarometerCalibrationSourceCompanion;
  if (-[CLBarometerCalibrationSource initWithUniverse:delegate:](&v5, "initWithUniverse:delegate:", a3, a4))
    sub_1001B6924();
  return 0;
}

- (void)enableSource
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (!self->super._sourceEnabled)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021444F0);
    v3 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Enabling companion data source", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021444F0);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "Enabling companion data source", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceCompanion enableSource]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
    objc_msgSend(*((id *)self->fCompanionClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fCompanionClient.__ptr_.__value_ + 1), 11, 0);
    objc_msgSend(*((id *)self->fCompanionClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fCompanionClient.__ptr_.__value_ + 1), 12, 0);
    self->super._sourceEnabled = 1;
  }
}

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    objc_msgSend(*((id *)self->fCompanionClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fCompanionClient.__ptr_.__value_ + 1), 11);
    objc_msgSend(*((id *)self->fCompanionClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fCompanionClient.__ptr_.__value_ + 1), 12);
    self->super._sourceEnabled = 0;
  }
}

- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4
{
  char *v6;
  unint64_t *v7;
  CLBarometerCalibrationSourceClient *delegate;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char *v16;
  std::__shared_weak_count *v17;
  char *v18;
  std::__shared_weak_count *v19;

  if (a3 == 11)
  {
    v6 = (char *)operator new(0x30uLL);
    *((_QWORD *)v6 + 1) = 0;
    v7 = (unint64_t *)(v6 + 8);
    *((_QWORD *)v6 + 2) = 0;
    *(_QWORD *)v6 = off_102144520;
    *(int64x2_t *)(v6 + 24) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *((_QWORD *)v6 + 5) = 0x7FEFFFFFFFFFFFFFLL;
    v18 = v6 + 24;
    v19 = (std::__shared_weak_count *)v6;
    *((CFAbsoluteTime *)v6 + 3) = CFAbsoluteTimeGetCurrent();
    *((_OWORD *)v6 + 2) = *(_OWORD *)a4;
    delegate = self->super._delegate;
    v16 = v6 + 24;
    v17 = (std::__shared_weak_count *)v6;
    do
      v9 = __ldxr(v7);
    while (__stxr(v9 + 1, v7));
    -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 4, &v16);
    v10 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = v19;
    if (v19)
    {
      v14 = (unint64_t *)&v19->__shared_owners_;
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
}

- (void).cxx_destruct
{
  Client *value;

  value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
