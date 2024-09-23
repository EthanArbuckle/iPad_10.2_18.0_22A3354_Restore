@implementation CLContextManagerWaterSubmersionBase

- (CLContextManagerWaterSubmersionBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  CLContextManagerWaterSubmersionBase *v7;
  CLContextManagerWaterSubmersionBase *v8;
  _QWORD *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  CLBarometerCalibrationWaterSubmersion *ptr;
  int v15;
  __int128 v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLContextManagerWaterSubmersionBase;
  v7 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:](&v17, "initWithUniverse:delegate:withBuffer:withSourceAggregator:", a3, a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    v7->_submersionState = 0;
    v7->_externalSubmersionState = 0;
    v9 = operator new(0x28uLL);
    v9[2] = 0;
    *v9 = off_102167810;
    v9[1] = 0;
    v9[4] = 0;
    *((_QWORD *)&v16 + 1) = v9;
    v9[3] = 0x7FEFFFFFFFFFFFFFLL;
    *(_QWORD *)&v16 = v9 + 3;
    sub_1002B7674((uint64_t)&v8->_aopSubmersionState, &v16);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    ptr = v8->_aopSubmersionState.__ptr_;
    *((_BYTE *)ptr + 8) = 1;
    *(_QWORD *)ptr = 0x7FEFFFFFFFFFFFFFLL;
    v8->_submersionStateMachine = -[CLSubmersionStateMachine initWithType:]([CLSubmersionStateMachine alloc], "initWithType:", 1);
    v8->_updatingSurfacePressure = 0;
    v8->_updatingHK = 0;
    v8->_inSwimmingWorkout = 0;
    v15 = 1075838976;
    sub_1018C2254((unsigned __int8 *)&v16, "SubmersionHKDecimationTime", &v15, 0);
    v8->_timeBetweenHKUpdates = *((float *)&v16 + 1);
    v8->_deepestDepthForHK = 0;
    v8->_lastHKUpdate = 1.79769313e308;
    v8->_hkCollector = -[CLSubmersionDataCollector initWithUniverse:andStateMachine:]([CLSubmersionDataCollector alloc], "initWithUniverse:andStateMachine:", a3, v8->_submersionStateMachine);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  CLPowerAssertion *value;
  CLPowerAssertion *v4;
  objc_super v5;

  self->_deepestDepthForHK = 0;
  self->_hkCollector = 0;

  self->_submersionStateMachine = 0;
  -[CLTimer invalidate](self->_submersionPowerAssertionTimer, "invalidate");

  self->_submersionPowerAssertionTimer = 0;
  value = self->_powerAssertionSubmersion.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    self->_powerAssertionSubmersion.__ptr_.__value_ = 0;
    goto LABEL_5;
  }
  sub_100E3E6F0((uint64_t)value);
  value = self->_powerAssertionSubmersion.__ptr_.__value_;
  self->_powerAssertionSubmersion.__ptr_.__value_ = 0;
  if (value)
LABEL_5:
    (*(void (**)(CLPowerAssertion *))(*(_QWORD *)value + 8))(value);
  v4 = self->_powerAssertionHK.__ptr_.__value_;
  if (*((int *)v4 + 2) <= 0)
  {
    self->_powerAssertionHK.__ptr_.__value_ = 0;
  }
  else
  {
    sub_100E3E6F0((uint64_t)v4);
    v4 = self->_powerAssertionHK.__ptr_.__value_;
    self->_powerAssertionHK.__ptr_.__value_ = 0;
    if (!v4)
      goto LABEL_11;
  }
  (*(void (**)(CLPowerAssertion *))(*(_QWORD *)v4 + 8))(v4);
LABEL_11:
  v5.receiver = self;
  v5.super_class = (Class)CLContextManagerWaterSubmersionBase;
  -[CLBarometerCalibrationContextManager dealloc](&v5, "dealloc");
}

- (void)startHKCollector:(double)a3
{
  NSObject *v5;
  CLPowerAssertion *value;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  void *__p[2];
  char v11;
  int v12;
  CFAbsoluteTime v13;
  uint8_t buf[4];
  CFAbsoluteTime Current;

  if (*((int *)self->_powerAssertionHK.__ptr_.__value_ + 2) <= 0)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v5 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "power assertion for writing to HK,timestamp,%{public}f,assertionState,1,reason,submergedDeep", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v7 = qword_10229FE88;
      v12 = 134349056;
      v13 = CFAbsoluteTimeGetCurrent();
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 0, "power assertion for writing to HK,timestamp,%{public}f,assertionState,1,reason,submergedDeep", &v12, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase startHKCollector:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    value = self->_powerAssertionHK.__ptr_.__value_;
    sub_1015A2E04(__p, "none");
    sub_10002B684((uint64_t)value, (uint64_t *)__p);
    if (v11 < 0)
      operator delete(__p[0]);
  }
  -[CLSubmersionDataCollector startAt:](self->_hkCollector, "startAt:", a3);
}

- (void)stopHKCollector
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint8_t *v6;
  int v7;
  CFAbsoluteTime v8;
  uint8_t buf[4];
  CFAbsoluteTime Current;

  -[CLSubmersionDataCollector finish](self->_hkCollector, "finish");
  if (*((int *)self->_powerAssertionHK.__ptr_.__value_ + 2) >= 1)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v3 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "power assertion for writing to HK,timestamp,%{public}f,assertionState,0,reason,notSubmergedDeep", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v4 = qword_10229FE88;
      v7 = 134349056;
      v8 = CFAbsoluteTimeGetCurrent();
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v4, 0, "power assertion for writing to HK,timestamp,%{public}f,assertionState,0,reason,notSubmergedDeep", &v7, 12);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase stopHKCollector]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    sub_100E3E6F0((uint64_t)self->_powerAssertionHK.__ptr_.__value_);
  }
}

- (void)notifyHKUpdates:(id)a3
{
  CLSubmersionDataCollector *hkCollector;
  double v5;

  hkCollector = self->_hkCollector;
  objc_msgSend(a3, "startAt");
  -[CLSubmersionDataCollector collectAt:measurement:atSensorLimit:](hkCollector, "collectAt:measurement:atSensorLimit:", a3, objc_msgSend(a3, "state") == (id)600, v5);
}

- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4
{
  CLWaterSubmersionState *v6;
  NSObject *v7;
  CFAbsoluteTime Current;
  uint64_t v9;
  uint64_t v10;
  CFAbsoluteTime v11;
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  int v15;
  CFAbsoluteTime v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unsigned int v20;
  uint8_t buf[4];
  CFAbsoluteTime v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unsigned int v26;

  if (a4 == 3)
  {
    v6 = objc_alloc_init(CLWaterSubmersionState);
    -[CLWaterSubmersionState setStartAt:](v6, "setStartAt:", CFAbsoluteTimeGetCurrent());
    if (-[CLContextManagerWaterSubmersionBase externalSubmersionState](self, "externalSubmersionState"))
    {
      -[CLWaterSubmersionState setState:](v6, "setState:", -[CLContextManagerWaterSubmersionBase externalSubmersionState](self, "externalSubmersionState"));
      objc_msgSend(a3, "onSubmersionStateUpdate:", v6);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v7 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        Current = CFAbsoluteTimeGetCurrent();
        -[CLWaterSubmersionState startAt](v6, "startAt");
        *(_DWORD *)buf = 134349568;
        v22 = Current;
        v23 = 2050;
        v24 = v9;
        v25 = 1026;
        v26 = -[CLWaterSubmersionState state](v6, "state");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "water submersion state sent to new client,timestamp,%{public}f,startAt,%{public}f,state,%{public}d", buf, 0x1Cu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        v10 = qword_10229FE88;
        v11 = CFAbsoluteTimeGetCurrent();
        -[CLWaterSubmersionState startAt](v6, "startAt");
        v15 = 134349568;
        v16 = v11;
        v17 = 2050;
        v18 = v12;
        v19 = 1026;
        v20 = -[CLWaterSubmersionState state](v6, "state");
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 0, "water submersion state sent to new client,timestamp,%{public}f,startAt,%{public}f,state,%{public}d", &v15, 28);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase clientConnected:withNotification:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
    }

  }
}

- (void)updateClientsSubmersionMeasurement:(id)a3
{
  NSObject *v5;
  CFAbsoluteTime Current;
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
  NSObject *v18;
  CFAbsoluteTime v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  CFAbsoluteTime v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint8_t *v52;
  uint64_t v53;
  CFAbsoluteTime v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint8_t *v67;
  int v68;
  CFAbsoluteTime v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  unsigned int v83;
  uint8_t buf[4];
  CFAbsoluteTime v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  unsigned int v99;

  -[CLBarometerCalibrationContextClient submersionMeasurementUpdate:](self->super._delegate, "submersionMeasurementUpdate:");
  if (self->_externalSubmersionState == 2
    && vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 15.0)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v5 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(a3, "startAt");
      v8 = v7;
      objc_msgSend(a3, "pressure");
      v10 = v9;
      objc_msgSend(a3, "depth");
      v12 = v11;
      objc_msgSend(a3, "temperature");
      v14 = v13;
      objc_msgSend(a3, "temperatureUncertainty");
      v16 = v15;
      objc_msgSend(a3, "surfacePressure");
      *(_DWORD *)buf = 134350848;
      v85 = Current;
      v86 = 2050;
      v87 = v8;
      v88 = 2050;
      v89 = v10;
      v90 = 2050;
      v91 = v12;
      v92 = 2050;
      v93 = v14;
      v94 = 2050;
      v95 = v16;
      v96 = 2050;
      v97 = v17;
      v98 = 1026;
      v99 = objc_msgSend(a3, "state");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{public}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d", buf, 0x4Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v53 = qword_10229FE88;
      v54 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(a3, "startAt");
      v56 = v55;
      objc_msgSend(a3, "pressure");
      v58 = v57;
      objc_msgSend(a3, "depth");
      v60 = v59;
      objc_msgSend(a3, "temperature");
      v62 = v61;
      objc_msgSend(a3, "temperatureUncertainty");
      v64 = v63;
      objc_msgSend(a3, "surfacePressure");
      v68 = 134350848;
      v69 = v54;
      v70 = 2050;
      v71 = v56;
      v72 = 2050;
      v73 = v58;
      v74 = 2050;
      v75 = v60;
      v76 = 2050;
      v77 = v62;
      v78 = 2050;
      v79 = v64;
      v80 = 2050;
      v81 = v65;
      v82 = 1026;
      v83 = objc_msgSend(a3, "state");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v53, 0, "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{public}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d", &v68, 78);
      v67 = (uint8_t *)v66;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateClientsSubmersionMeasurement:]", "%s\n", v66);
      if (v67 != buf)
        free(v67);
    }
    self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v18 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
    {
      v19 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(a3, "startAt");
      v21 = v20;
      objc_msgSend(a3, "pressure");
      v23 = v22;
      objc_msgSend(a3, "depth");
      v25 = v24;
      objc_msgSend(a3, "temperature");
      v27 = v26;
      objc_msgSend(a3, "temperatureUncertainty");
      v29 = v28;
      objc_msgSend(a3, "surfacePressure");
      *(_DWORD *)buf = 134350848;
      v85 = v19;
      v86 = 2050;
      v87 = v21;
      v88 = 2050;
      v89 = v23;
      v90 = 2050;
      v91 = v25;
      v92 = 2050;
      v93 = v27;
      v94 = 2050;
      v95 = v29;
      v96 = 2050;
      v97 = v30;
      v98 = 1026;
      v99 = objc_msgSend(a3, "state");
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{public}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d", buf, 0x4Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v38 = qword_10229FE88;
      v39 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(a3, "startAt");
      v41 = v40;
      objc_msgSend(a3, "pressure");
      v43 = v42;
      objc_msgSend(a3, "depth");
      v45 = v44;
      objc_msgSend(a3, "temperature");
      v47 = v46;
      objc_msgSend(a3, "temperatureUncertainty");
      v49 = v48;
      objc_msgSend(a3, "surfacePressure");
      v68 = 134350848;
      v69 = v39;
      v70 = 2050;
      v71 = v41;
      v72 = 2050;
      v73 = v43;
      v74 = 2050;
      v75 = v45;
      v76 = 2050;
      v77 = v47;
      v78 = 2050;
      v79 = v49;
      v80 = 2050;
      v81 = v50;
      v82 = 1026;
      v83 = objc_msgSend(a3, "state");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v38, 1, "water submersion sent to clients,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,depth,%{public}f,temperature,%{public}f,temperatureUncertainty,%{public}f,surfacePressure,%{public}f,depthState,%{public}d", &v68, 78);
      v52 = (uint8_t *)v51;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateClientsSubmersionMeasurement:]", "%s\n", v51);
      if (v52 != buf)
        free(v52);
    }
  }
  if (-[CLContextManagerWaterSubmersionBase sampleShouldBeWrittenToHK:](self, "sampleShouldBeWrittenToHK:", a3))
  {
    if (!self->_updatingHK)
    {
      objc_msgSend(a3, "startAt");
      -[CLContextManagerWaterSubmersionBase startHKCollector:](self, "startHKCollector:");
      v31 = 1;
LABEL_19:
      self->_updatingHK = v31;
    }
  }
  else if (self->_updatingHK)
  {
    -[CLContextManagerWaterSubmersionBase setDeepestDepthForHK:](self, "setDeepestDepthForHK:", 0);
    -[CLContextManagerWaterSubmersionBase stopHKCollector](self, "stopHKCollector");
    v31 = 0;
    goto LABEL_19;
  }
  if (-[CLContextManagerWaterSubmersionBase updatingHK](self, "updatingHK"))
  {
    -[CLContextManagerWaterSubmersionBase lastHKUpdate](self, "lastHKUpdate");
    if (v32 == 1.79769313e308
      || (objc_msgSend(a3, "startAt"),
          v34 = v33,
          -[CLContextManagerWaterSubmersionBase lastHKUpdate](self, "lastHKUpdate"),
          v36 = vabdd_f64(v34, v35),
          -[CLContextManagerWaterSubmersionBase timeBetweenHKUpdates](self, "timeBetweenHKUpdates"),
          v36 > v37))
    {
      -[CLContextManagerWaterSubmersionBase notifyHKUpdates:](self, "notifyHKUpdates:", -[CLContextManagerWaterSubmersionBase deepestDepthForHK](self, "deepestDepthForHK"));
      objc_msgSend(a3, "startAt");
      -[CLContextManagerWaterSubmersionBase setLastHKUpdate:](self, "setLastHKUpdate:");
      -[CLContextManagerWaterSubmersionBase setDeepestDepthForHK:](self, "setDeepestDepthForHK:", 0);
    }
  }
}

- (BOOL)sampleShouldBeWrittenToHK:(id)a3
{
  return self->_inSwimmingWorkout && objc_msgSend(a3, "state") == (id)200 || (uint64_t)objc_msgSend(a3, "state") > 299;
}

- (void)updateClientsSubmersionState:(id)a3
{
  NSObject *v4;
  CFAbsoluteTime Current;
  uint64_t v6;
  uint64_t v7;
  CFAbsoluteTime v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  CFAbsoluteTime v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  unsigned int v17;
  uint8_t buf[4];
  CFAbsoluteTime v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  unsigned int v23;

  -[CLBarometerCalibrationContextClient submersionStateUpdate:](self->super._delegate, "submersionStateUpdate:");
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021677E0);
  v4 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(a3, "startAt");
    *(_DWORD *)buf = 134349568;
    v19 = Current;
    v20 = 2050;
    v21 = v6;
    v22 = 1026;
    v23 = objc_msgSend(a3, "state");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "water submersion state sent to clients,timestamp,%{public}f,startAt,%{public}f,state,%{public}d", buf, 0x1Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v7 = qword_10229FE88;
    v8 = CFAbsoluteTimeGetCurrent();
    objc_msgSend(a3, "startAt");
    v12 = 134349568;
    v13 = v8;
    v14 = 2050;
    v15 = v9;
    v16 = 1026;
    v17 = objc_msgSend(a3, "state");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 0, "water submersion state sent to clients,timestamp,%{public}f,startAt,%{public}f,state,%{public}d", &v12, 28);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateClientsSubmersionState:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
}

- (void)updateSubmersionStateFromAOPState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  CLBarometerCalibrationWaterSubmersion *ptr;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  int64_t externalSubmersionState;
  CLWaterSubmersionState *v12;
  int v13;
  NSObject *v14;
  CFAbsoluteTime Current;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  CFAbsoluteTime v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  const char *v24;
  uint8_t *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  int v28;
  CFAbsoluteTime v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  uint8_t buf[4];
  CFAbsoluteTime v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  int v43;

  ptr = a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v26 = *(_QWORD *)a3.__ptr_;
  v27 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  -[CLContextManagerWaterSubmersionBase saveCachedSubmersionState:](self, "saveCachedSubmersionState:", &v26, a3.__cntrl_);
  v8 = v27;
  if (v27)
  {
    v9 = (unint64_t *)&v27->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  sub_100349198(&self->_aopSubmersionState.__ptr_, (uint64_t *)ptr);
  externalSubmersionState = self->_externalSubmersionState;
  v12 = objc_alloc_init(CLWaterSubmersionState);
  -[CLWaterSubmersionState setStartAt:](v12, "setStartAt:", *(double *)*(double *)ptr);
  v13 = *(unsigned __int8 *)(*(_QWORD *)ptr + 8);
  if (v13 == 1)
  {
    -[CLContextManagerWaterSubmersionBase onNotSubmerged](self, "onNotSubmerged");
    -[CLWaterSubmersionState setState:](v12, "setState:", 1);
  }
  else if (v13 == 2)
  {
    -[CLWaterSubmersionState setState:](v12, "setState:", 2);
    self->_externalSubmersionState = 2;
    self->_updatingSurfacePressure = 0;
  }
  else
  {
    -[CLWaterSubmersionState setState:](v12, "setState:", 0);
  }
  if (externalSubmersionState != self->_externalSubmersionState)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v14 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[CLWaterSubmersionState startAt](v12, "startAt");
      v17 = v16;
      v18 = -[CLWaterSubmersionState state](v12, "state");
      *(_DWORD *)buf = 134349824;
      v37 = Current;
      v38 = 2050;
      v39 = v17;
      v40 = 1026;
      v41 = v18;
      v42 = 1026;
      v43 = externalSubmersionState;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "update submersion state,timestamp,%{public}f,submersionState.startAt,%{public}f,submersionState.state,%{public}d,previousState,%{public}d", buf, 0x22u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v19 = qword_10229FE88;
      v20 = CFAbsoluteTimeGetCurrent();
      -[CLWaterSubmersionState startAt](v12, "startAt");
      v22 = v21;
      v23 = -[CLWaterSubmersionState state](v12, "state");
      v28 = 134349824;
      v29 = v20;
      v30 = 2050;
      v31 = v22;
      v32 = 1026;
      v33 = v23;
      v34 = 1026;
      v35 = externalSubmersionState;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 0, "update submersion state,timestamp,%{public}f,submersionState.startAt,%{public}f,submersionState.state,%{public}d,previousState,%{public}d", &v28, 34, v26);
      v25 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateSubmersionStateFromAOPState:]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
    -[CLContextManagerWaterSubmersionBase updateClientsSubmersionState:](self, "updateClientsSubmersionState:", v12);
    externalSubmersionState = self->_externalSubmersionState;
  }
  if (externalSubmersionState != 2)
    self->_submersionState = 100;

}

- (void)updateSubmersionStateFromMeasurement:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int64_t submersionState;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  int64_t v23;
  const char *v24;
  uint8_t *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  int v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  int v41;

  if ((id)-[CLContextManagerWaterSubmersionBase externalSubmersionState](self, "externalSubmersionState") == (id)2)
  {
    objc_msgSend(a3, "setState:", -[CLSubmersionStateMachine stateFromDepth:forceSubmersion:](self->_submersionStateMachine, "stateFromDepth:forceSubmersion:", a3, 1));
    if (-[CLContextManagerWaterSubmersionBase sampleShouldBeWrittenToHK:](self, "sampleShouldBeWrittenToHK:", a3))
    {
      if (!-[CLContextManagerWaterSubmersionBase deepestDepthForHK](self, "deepestDepthForHK")
        || (-[CLWaterSubmersionMeasurement depth](-[CLContextManagerWaterSubmersionBase deepestDepthForHK](self, "deepestDepthForHK"), "depth"), v6 = v5, objc_msgSend(a3, "depth"), v6 < v7))
      {
        -[CLContextManagerWaterSubmersionBase setDeepestDepthForHK:](self, "setDeepestDepthForHK:", a3);
      }
    }
    if (objc_msgSend(a3, "state") == (id)300)
    {
      objc_msgSend(a3, "startAt");
      -[CLContextManagerWaterSubmersionBase onDeepSubmersion:withStateChanged:](self, "onDeepSubmersion:withStateChanged:", objc_msgSend(a3, "state") != (id)self->_submersionState, v8);
    }
    else if (objc_msgSend(a3, "state") == (id)200)
    {
      objc_msgSend(a3, "startAt");
      -[CLContextManagerWaterSubmersionBase onShallowSubmersion:withStateChanged:](self, "onShallowSubmersion:withStateChanged:", objc_msgSend(a3, "state") != (id)self->_submersionState, v9);
    }
    if (objc_msgSend(a3, "state") != (id)self->_submersionState)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v10 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "depth");
        v12 = v11;
        -[CLSubmersionStateMachine deepThreshold](self->_submersionStateMachine, "deepThreshold");
        v14 = v13;
        v15 = objc_msgSend(a3, "state");
        submersionState = self->_submersionState;
        *(_DWORD *)buf = 134349824;
        v35 = v12;
        v36 = 2050;
        v37 = v14;
        v38 = 1026;
        v39 = v15;
        v40 = 1026;
        v41 = submersionState;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "update submersion depth state,measurement.depth,%{public}f,submergedDeepThreshold,%{public}f,submersionState.state,%{public}d, previousState,%{public}d", buf, 0x22u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        v17 = qword_10229FE88;
        objc_msgSend(a3, "depth");
        v19 = v18;
        -[CLSubmersionStateMachine deepThreshold](self->_submersionStateMachine, "deepThreshold");
        v21 = v20;
        v22 = objc_msgSend(a3, "state");
        v23 = self->_submersionState;
        v26 = 134349824;
        v27 = v19;
        v28 = 2050;
        v29 = v21;
        v30 = 1026;
        v31 = v22;
        v32 = 1026;
        v33 = v23;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v17, 0, "update submersion depth state,measurement.depth,%{public}f,submergedDeepThreshold,%{public}f,submersionState.state,%{public}d, previousState,%{public}d", &v26, 34);
        v25 = (uint8_t *)v24;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase updateSubmersionStateFromMeasurement:]", "%s\n", v24);
        if (v25 != buf)
          free(v25);
      }
      self->_submersionState = (int64_t)objc_msgSend(a3, "state");
    }
  }
}

- (void)onShallowSubmersion:(double)a3 withStateChanged:(BOOL)a4
{
  if (a4)
    -[CLContextManagerWaterSubmersionBase startSubmersionPowerAssertion](self, "startSubmersionPowerAssertion", a3);
  self->_updatingSurfacePressure = 0;
}

- (void)onDeepSubmersion:(double)a3 withStateChanged:(BOOL)a4
{
  if (a4)
    -[CLContextManagerWaterSubmersionBase startSubmersionPowerAssertion](self, "startSubmersionPowerAssertion");
  if (!self->_updatingHK)
  {
    -[CLContextManagerWaterSubmersionBase startHKCollector:](self, "startHKCollector:", a3);
    self->_updatingHK = 1;
  }
  self->_updatingSurfacePressure = 0;
}

- (void)onNotSubmerged
{
  self->_externalSubmersionState = 1;
  self->_updatingSurfacePressure = 1;
}

- (void)saveCachedSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  const void **ptr;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint8_t *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  int v21;

  ptr = (const void **)a3.__ptr_;
  v4 = sub_1001FD94C();
  sub_10018A4CC(v4, "CLWaterSubmersion_StateTimestamp", *ptr);
  v5 = sub_1001FD94C();
  *(_DWORD *)buf = *((unsigned __int8 *)*ptr + 8);
  sub_10011B4E4(v5, "CLWaterSubmersion_State", buf);
  v6 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 944))(v6);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021677E0);
  v7 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)*ptr;
    v9 = *((unsigned __int8 *)*ptr + 8);
    *(_DWORD *)buf = 134349312;
    v19 = v8;
    v20 = 1026;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "saved submerged state,timestamp,%{public}f,state,%{public}d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v10 = *(_QWORD *)*ptr;
    v11 = *((unsigned __int8 *)*ptr + 8);
    v14 = 134349312;
    v15 = v10;
    v16 = 1026;
    v17 = v11;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "saved submerged state,timestamp,%{public}f,state,%{public}d", &v14, 18);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase saveCachedSubmersionState:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
}

- (void)retrieveCachedSubmersionState
{
  double Current;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  char v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  double v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  const char *v17;
  char *v18;
  const char *v19;
  char *v20;
  int v21;
  double v22;
  int v23;
  double v24;
  __int16 v25;
  int v26;
  _BYTE buf[1638];

  Current = CFAbsoluteTimeGetCurrent();
  v22 = 1.79769313e308;
  v21 = 1;
  v4 = sub_1001FD94C();
  sub_1001FD98C(v4, "CLWaterSubmersion_StateTimestamp", &v22);
  v5 = sub_1001FD94C();
  sub_1001E4B84(v5, "CLWaterSubmersion_State", &v21);
  v23 = 1177075712;
  sub_1018C2254(buf, "MaxSubmersionStateAgeFromRecovery", &v23, 0);
  if (v22 != 1.79769313e308 && Current - v22 < *(float *)&buf[4])
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v8 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      *(double *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v21;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "recovering state on locationd start,timestamp,%{public}f,submersion state,%{public}d", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v23 = 134349312;
      v24 = v22;
      v25 = 1026;
      v26 = v21;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "recovering state on locationd start,timestamp,%{public}f,submersion state,%{public}d", &v23, 18);
      v20 = (char *)v19;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
    v9 = v21;
    -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
    v10 = *(std::__shared_weak_count **)&buf[8];
    *(_BYTE *)(*(_QWORD *)buf + 8) = v9;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
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
    -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
    v14 = *(std::__shared_weak_count **)&buf[8];
    **(double **)buf = v13;
    if (v14)
    {
      v15 = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v7 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "submersion state is too old to be recovered", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      LOWORD(v23) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "submersion state is too old to be recovered", &v23, 2);
      v18 = (char *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
  }
}

- (void)startSubmersionPowerAssertion
{
  CLPowerAssertion *value;
  NSObject *v4;
  CFAbsoluteTime Current;
  uint64_t v6;
  CFAbsoluteTime v7;
  const char *v8;
  uint8_t *v9;
  void *__p[2];
  char v11;
  int v12;
  CFAbsoluteTime v13;
  uint8_t buf[4];
  CFAbsoluteTime v15;

  value = self->_powerAssertionSubmersion.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    sub_1015A2E04(__p, "Altimeter, submersion state client notification power assertion");
    sub_10002B684((uint64_t)value, (uint64_t *)__p);
    if (v11 < 0)
      operator delete(__p[0]);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v4 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      v15 = Current;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "power assertion for depth state change,timestamp,%{public}f,assertionState,1,reason,stateChange", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v6 = qword_10229FE88;
      v7 = CFAbsoluteTimeGetCurrent();
      v12 = 134349056;
      v13 = v7;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 0, "power assertion for depth state change,timestamp,%{public}f,assertionState,1,reason,stateChange", &v12, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase startSubmersionPowerAssertion]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
  -[CLTimer setNextFireDelay:](self->_submersionPowerAssertionTimer, "setNextFireDelay:", 10.0);
}

- (void)notificationAcknowledged:(unint64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  CFAbsoluteTime v9;
  uint8_t buf[4];
  CFAbsoluteTime Current;

  if (a3 == 3 && *((int *)self->_powerAssertionSubmersion.__ptr_.__value_ + 2) >= 1)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v4 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "power assertion for depth state change,timestamp,%{public}f,assertionState,0,reason,clientResponse", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v5 = qword_10229FE88;
      v8 = 134349056;
      v9 = CFAbsoluteTimeGetCurrent();
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 0, "power assertion for depth state change,timestamp,%{public}f,assertionState,0,reason,clientResponse", &v8, 12);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase notificationAcknowledged:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    sub_100E3E6F0((uint64_t)self->_powerAssertionSubmersion.__ptr_.__value_);
  }
}

- (void)onMotionStateMediatorData:(NotificationData *)a3
{
  uint64_t v6;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t *v13;
  uint8_t buf[4];
  CFAbsoluteTime Current;

  if (*((_QWORD *)a3 + 14) == 19)
  {
    v6 = *((_QWORD *)a3 + 2);
    if ((unint64_t)(v6 - 1) < 2)
    {
      self->_inSwimmingWorkout = 0;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v11 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "swimming workout stopped,timestamp,%f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        v12 = qword_10229FE88;
        CFAbsoluteTimeGetCurrent();
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 0, "swimming workout stopped,timestamp,%f");
        goto LABEL_25;
      }
    }
    else if (v6 == 3 || v6 == 0)
    {
      self->_inSwimmingWorkout = 1;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v8 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        Current = CFAbsoluteTimeGetCurrent();
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "swimming workout started,timestamp,%f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        v9 = qword_10229FE88;
        CFAbsoluteTimeGetCurrent();
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "swimming workout started,timestamp,%f");
LABEL_25:
        v13 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionBase onMotionStateMediatorData:]", "%s\n", v10);
        if (v13 != buf)
          free(v13);
      }
    }
  }
}

- (int64_t)submersionState
{
  return self->_submersionState;
}

- (void)setSubmersionState:(int64_t)a3
{
  self->_submersionState = a3;
}

- (BOOL)updatingHK
{
  return self->_updatingHK;
}

- (void)setUpdatingHK:(BOOL)a3
{
  self->_updatingHK = a3;
}

- (BOOL)inSwimmingWorkout
{
  return self->_inSwimmingWorkout;
}

- (void)setInSwimmingWorkout:(BOOL)a3
{
  self->_inSwimmingWorkout = a3;
}

- (int64_t)externalSubmersionState
{
  return self->_externalSubmersionState;
}

- (void)setExternalSubmersionState:(int64_t)a3
{
  self->_externalSubmersionState = a3;
}

- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)aopSubmersionState
{
  CLBarometerCalibrationWaterSubmersion **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion> result;

  cntrl = self->_aopSubmersionState.__cntrl_;
  *v2 = self->_aopSubmersionState.__ptr_;
  v2[1] = (CLBarometerCalibrationWaterSubmersion *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CLBarometerCalibrationWaterSubmersion *)self;
  return result;
}

- (void)setAopSubmersionState:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  sub_100349198(&self->_aopSubmersionState.__ptr_, (uint64_t *)a3.__ptr_);
}

- (BOOL)updatingSurfacePressure
{
  return self->_updatingSurfacePressure;
}

- (void)setUpdatingSurfacePressure:(BOOL)a3
{
  self->_updatingSurfacePressure = a3;
}

- (CLSubmersionDataCollector)hkCollector
{
  return self->_hkCollector;
}

- (void)setHkCollector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CLSubmersionStateMachine)submersionStateMachine
{
  return self->_submersionStateMachine;
}

- (void)setSubmersionStateMachine:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (double)lastHKUpdate
{
  return self->_lastHKUpdate;
}

- (void)setLastHKUpdate:(double)a3
{
  self->_lastHKUpdate = a3;
}

- (double)lastDefaultLevelLogTimestamp
{
  return self->_lastDefaultLevelLogTimestamp;
}

- (void)setLastDefaultLevelLogTimestamp:(double)a3
{
  self->_lastDefaultLevelLogTimestamp = a3;
}

- (CLWaterSubmersionMeasurement)deepestDepthForHK
{
  return self->_deepestDepthForHK;
}

- (void)setDeepestDepthForHK:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (double)timeBetweenHKUpdates
{
  return self->_timeBetweenHKUpdates;
}

- (void)setTimeBetweenHKUpdates:(double)a3
{
  self->_timeBetweenHKUpdates = a3;
}

- (void).cxx_destruct
{
  CLPowerAssertion *value;
  CLPowerAssertion *v4;

  sub_100261F44((uint64_t)&self->_aopSubmersionState);
  value = self->_powerAssertionHK.__ptr_.__value_;
  self->_powerAssertionHK.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CLPowerAssertion *))(*(_QWORD *)value + 8))(value);
  v4 = self->_powerAssertionSubmersion.__ptr_.__value_;
  self->_powerAssertionSubmersion.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(CLPowerAssertion *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  return self;
}

@end
