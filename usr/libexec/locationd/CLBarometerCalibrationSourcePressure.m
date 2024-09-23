@implementation CLBarometerCalibrationSourcePressure

- (void)onKFFilteredPressure:(const CMKFFilteredPressureSample *)a3
{
  CFAbsoluteTime Current;
  NSObject *v6;
  double var1;
  double var0;
  double var5;
  double var3;
  double var2;
  double var6;
  double var4;
  double v14;
  double v15;
  unint64_t *v16;
  CLBarometerCalibrationSourceClient *delegate;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  double v25;
  float v26;
  float v27;
  unint64_t *v28;
  CLBarometerCalibrationSourceClient *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  char *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  CFAbsoluteTime v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;
  _BYTE buf[22];
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;

  Current = CFAbsoluteTimeGetCurrent();
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B8C00);
  v6 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    var1 = a3->var1;
    var0 = a3->var0;
    var5 = a3->var5;
    var3 = a3->var3;
    var2 = a3->var2;
    var6 = a3->var6;
    var4 = a3->var4;
    *(_DWORD *)buf = 134219776;
    *(CFAbsoluteTime *)&buf[4] = Current;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = var1;
    v67 = 2048;
    v68 = var0;
    v69 = 2048;
    v70 = var5;
    v71 = 2048;
    v72 = var3;
    v73 = 2048;
    v74 = var2;
    v75 = 2048;
    v76 = var6;
    v77 = 2048;
    v78 = var4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "received KF filtered pressure from AOP,now,%f,filteredPressureTimestamp,%f,filteredPressure,%f,kfTimestamp,%f,kfElevation,%f,kfPressure,%f temperature,%f,absAltUnc,%f", buf, 0x52u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B8C00);
    v37 = a3->var1;
    v38 = a3->var0;
    v39 = a3->var5;
    v40 = a3->var3;
    v41 = a3->var2;
    v42 = a3->var6;
    v43 = a3->var4;
    v50 = 134219776;
    v51 = Current;
    v52 = 2048;
    v53 = v37;
    v54 = 2048;
    v55 = v38;
    v56 = 2048;
    v57 = v39;
    v58 = 2048;
    v59 = v40;
    v60 = 2048;
    v61 = v41;
    v62 = 2048;
    v63 = v42;
    v64 = 2048;
    v65 = v43;
    LODWORD(v45) = 82;
    v44 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "received KF filtered pressure from AOP,now,%f,filteredPressureTimestamp,%f,filteredPressure,%f,kfTimestamp,%f,kfElevation,%f,kfPressure,%f temperature,%f,absAltUnc,%f", COERCE_DOUBLE(&v50), v45, v46, v47, v48, v49);
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourcePressure onKFFilteredPressure:]", "%s\n", v44);
    if (v44 != buf)
      free(v44);
  }
  v14 = a3->var1;
  if (vabdd_f64(v14, self->_lastPressureBufferTimestamp) > 0.833333333)
  {
    self->_lastPressureBufferTimestamp = v14;
    v15 = COERCE_DOUBLE(operator new(0x38uLL));
    *(_QWORD *)(*(_QWORD *)&v15 + 8) = 0;
    v16 = (unint64_t *)(*(_QWORD *)&v15 + 8);
    *(_QWORD *)(*(_QWORD *)&v15 + 16) = 0;
    **(_QWORD **)&v15 = off_1021A5AE0;
    *(double *)(*(_QWORD *)&v15 + 24) = a3->var1;
    *(_QWORD *)buf = *(_QWORD *)&v15 + 24;
    *(double *)&buf[8] = v15;
    *(double *)(*(_QWORD *)&v15 + 32) = (float)(a3->var0 / 1000.0);
    *(float64x2_t *)(*(_QWORD *)&v15 + 40) = vcvtq_f64_f32(*(float32x2_t *)&a3->var6);
    delegate = self->super._delegate;
    *(_QWORD *)&v48 = *(_QWORD *)&v15 + 24;
    v49 = v15;
    do
      v18 = __ldxr(v16);
    while (__stxr(v18 + 1, v16));
    -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 1, &v48);
    v19 = *(std::__shared_weak_count **)&v49;
    if (v49 != 0.0)
    {
      v20 = (unint64_t *)(*(_QWORD *)&v49 + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v23 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  v25 = COERCE_DOUBLE(operator new(0x38uLL));
  *(double *)(*(_QWORD *)&v25 + 24) = a3->var5;
  v26 = a3->var3;
  v27 = a3->var2 / 1000.0;
  *(_QWORD *)(*(_QWORD *)&v25 + 8) = 0;
  v28 = (unint64_t *)(*(_QWORD *)&v25 + 8);
  *(_QWORD *)(*(_QWORD *)&v25 + 16) = 0;
  **(_QWORD **)&v25 = off_1021A5B30;
  *(_QWORD *)buf = *(_QWORD *)&v25 + 24;
  *(double *)&buf[8] = v25;
  *(double *)(*(_QWORD *)&v25 + 32) = v26;
  *(double *)(*(_QWORD *)&v25 + 40) = v27;
  *(double *)(*(_QWORD *)&v25 + 48) = a3->var4;
  v29 = self->super._delegate;
  *(_QWORD *)&v46 = *(_QWORD *)&v25 + 24;
  v47 = v25;
  do
    v30 = __ldxr(v28);
  while (__stxr(v30 + 1, v28));
  -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](v29, "didUpdateSource:withData:", 5, &v46);
  v31 = *(std::__shared_weak_count **)&v47;
  if (v47 != 0.0)
  {
    v32 = (unint64_t *)(*(_QWORD *)&v47 + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v35 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
}

- (void)enableSource
{
  uint64_t v3;

  if (!self->super._sourceEnabled)
  {
    if (sub_1001FBB04(0))
    {
      v3 = sub_1001FBB04(0);
      sub_1000A4FD8(v3, 30, (uint64_t)self->_kfFilteredPressureDispatcher.__ptr_.__value_, -1.0);
    }
    self->super._sourceEnabled = 1;
  }
}

- (CLBarometerCalibrationSourcePressure)initWithUniverse:(id)a3 delegate:(id)a4
{
  CLBarometerCalibrationSourcePressure *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLBarometerCalibrationSourcePressure;
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

  value = self->_kfFilteredPressureDispatcher.__ptr_.__value_;
  self->_kfFilteredPressureDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4.receiver = self;
  v4.super_class = (Class)CLBarometerCalibrationSourcePressure;
  -[CLBarometerCalibrationSource dealloc](&v4, "dealloc");
}

- (void)disableSource
{
  uint64_t v3;

  if (self->super._sourceEnabled)
  {
    if (sub_1001FBB04(0))
    {
      v3 = sub_1001FBB04(0);
      sub_1000A4A6C(v3, 30, (uint64_t)self->_kfFilteredPressureDispatcher.__ptr_.__value_);
    }
    self->super._sourceEnabled = 0;
  }
}

- (void).cxx_destruct
{
  void *value;

  value = self->_kfFilteredPressureDispatcher.__ptr_.__value_;
  self->_kfFilteredPressureDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
