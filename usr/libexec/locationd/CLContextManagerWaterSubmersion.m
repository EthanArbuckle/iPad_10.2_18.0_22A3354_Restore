@implementation CLContextManagerWaterSubmersion

- (CLContextManagerWaterSubmersion)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  CLContextManagerWaterSubmersion *v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v9;
  const char *v11;
  uint8_t *v12;
  _DWORD v13[4];
  objc_super v14;
  uint8_t buf[4];
  float v16;

  v14.receiver = self;
  v14.super_class = (Class)CLContextManagerWaterSubmersion;
  v6 = -[CLContextManagerWaterSubmersionBase initWithUniverse:delegate:withBuffer:withSourceAggregator:](&v14, "initWithUniverse:delegate:withBuffer:withSourceAggregator:", a3, a4, a5, a6);
  if (v6)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v7 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Water Submersion Context created", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      LOWORD(v13[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "Water Submersion Context created", v13, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    v6->_forcingGPS = 0;
    v13[0] = 1097859072;
    sub_1018C2254(buf, "CalibrationTimeOffset", v13, 0);
    v6->_calibrationTimeOffset = v16;
    -[CLBarometerCalibrationSourceAggregator enableSources:forContext:](v6->super.super._sourceAggregator, "enableSources:forContext:", &off_102220588, v6);
    v6->_lastPressureTimestampSaved = 1.79769313e308;
    v6->_tempEstimator = objc_alloc_init(CLWaterTemperatureEstimator);
    -[CLContextManagerWaterSubmersion retrieveCachedSurfacePressure](v6, "retrieveCachedSurfacePressure");
    -[CLContextManagerWaterSubmersion setUpGPSSubscriptionForSurfaceCal](v6, "setUpGPSSubscriptionForSurfaceCal");
    -[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale](v6, "forceGPSIfSurfaceCalStale");
    -[CLContextManagerWaterSubmersion retrieveCachedSubmersionState](v6, "retrieveCachedSubmersionState");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_100AA57D8, CFSTR("com.apple.locationd.WaterSubmersion.EnableEasySubmersion"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v6, (CFNotificationCallback)sub_100AA57D8, CFSTR("com.apple.locationd.WaterSubmersion.DisableEasySubmersion"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v6;
}

- (void)dealloc
{
  CLPowerAssertion *value;
  objc_super v4;

  self->_tempEstimator = 0;
  -[CLTimer invalidate](self->_forceGPSTimer, "invalidate");

  self->_forceGPSTimer = 0;
  value = self->_powerAssertionGPS.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    self->_powerAssertionGPS.__ptr_.__value_ = 0;
  }
  else
  {
    sub_100E3E6F0((uint64_t)value);
    value = self->_powerAssertionGPS.__ptr_.__value_;
    self->_powerAssertionGPS.__ptr_.__value_ = 0;
    if (!value)
      goto LABEL_6;
  }
  (*(void (**)(CLPowerAssertion *))(*(_QWORD *)value + 8))(value);
LABEL_6:
  v4.receiver = self;
  v4.super_class = (Class)CLContextManagerWaterSubmersion;
  -[CLContextManagerWaterSubmersionBase dealloc](&v4, "dealloc");
}

- (void)clientConnected:(id)a3 withNotification:(unint64_t)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLContextManagerWaterSubmersion;
  -[CLContextManagerWaterSubmersionBase clientConnected:withNotification:](&v6, "clientConnected:withNotification:", a3);
  if (a4 == 3)
    -[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale](self, "forceGPSIfSurfaceCalStale");
}

- (void)setUpGPSSubscriptionForSurfaceCal
{
  sub_1006AA544();
}

- (void)sourceUpdated:(unint64_t)a3
{
  void **p_fDataBuffers;
  __int128 v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  double v17;
  unint64_t v18;
  __int128 v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  CLWaterTemperatureEstimator *tempEstimator;
  double v28;
  float v29;
  float v30;
  CLWaterSubmersionMeasurement *v31;
  uint64_t v32;
  float v33;
  float v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  __int128 v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[48];
  _DWORD v66[4];
  __int128 v67;
  _OWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[4];
  uint64_t v77;
  uint64_t v78;
  uint8_t buf[16];
  uint64_t v80;
  uint64_t v81;

  p_fDataBuffers = &self->super.super.fDataBuffers;
  sub_100211128((uint64_t)v76, (_QWORD *)self->super.super.fDataBuffers + 6);
  sub_100211128((uint64_t)&v72, (_QWORD *)*p_fDataBuffers + 42);
  if (a3 == 5)
  {
    v6 = *(_OWORD *)(*(_QWORD *)(v76[1] + (((unint64_t)(v78 + v77 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (v78 + v77 - 1));
    v71 = v6;
    if (*((_QWORD *)&v6 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    sub_100211128((uint64_t)v68, (_QWORD *)self->super.super.fDataBuffers + 30);
    v9 = *(_OWORD *)(*(_QWORD *)(*((_QWORD *)&v68[0] + 1)
                               + (((unint64_t)(v70 + v69 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (v70 + v69 - 1));
    v67 = v9;
    if (*((_QWORD *)&v9 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    if (v75)
    {
      v12 = (uint64_t *)(*(_QWORD *)(v73 + (((unint64_t)(v75 + v74 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                      + 16 * (v75 + v74 - 1));
      v13 = *v12;
      v14 = (std::__shared_weak_count *)v12[1];
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          v16 = __ldxr(p_shared_owners);
        while (__stxr(v16 + 1, p_shared_owners));
        v17 = *(double *)(v13 + 8);
        do
          v18 = __ldaxr(p_shared_owners);
        while (__stlxr(v18 - 1, p_shared_owners));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      else
      {
        v17 = *(double *)(v13 + 8);
      }
    }
    else
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v24 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "no surface pressure available, using standard sea level", buf, 2u);
      }
      v17 = 101.325;
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        LOWORD(v66[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "no surface pressure available, using standard sea level", v66, 2);
        v26 = (uint8_t *)v25;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion sourceUpdated:]", "%s\n", v25);
        if (v26 != buf)
          free(v26);
      }
    }
    tempEstimator = self->_tempEstimator;
    v28 = *(double *)(v71 + 16);
    v29 = *(double *)(v71 + 24);
    *(float *)buf = v29;
    v30 = v28;
    *(float *)v66 = v30;
    -[CLWaterTemperatureEstimator updateWithTDot:andTempMeasurement:](tempEstimator, "updateWithTDot:andTempMeasurement:", buf, v66);
    v31 = objc_alloc_init(CLWaterSubmersionMeasurement);
    v32 = v67;
    -[CLWaterSubmersionMeasurement setStartAt:](v31, "setStartAt:", *(double *)v67);
    -[CLWaterSubmersionMeasurement setPressure:](v31, "setPressure:", *(double *)(v32 + 16));
    -[CLWaterSubmersionMeasurement setSurfacePressure:](v31, "setSurfacePressure:", v17);
    -[CLWaterTemperatureEstimator waterTempEst](self->_tempEstimator, "waterTempEst");
    -[CLWaterSubmersionMeasurement setTemperature:](v31, "setTemperature:", v33);
    -[CLWaterTemperatureEstimator waterTempUncertainty](self->_tempEstimator, "waterTempUncertainty");
    -[CLWaterSubmersionMeasurement setTemperatureUncertainty:](v31, "setTemperatureUncertainty:", v34);
    objc_msgSend((id)objc_opt_class(self, v35), "calculateDepthFromPressure:withSurfacePressure:", *(double *)(v32 + 16), v17);
    -[CLWaterSubmersionMeasurement setDepth:](v31, "setDepth:");
    -[CLWaterSubmersionMeasurement setState:](v31, "setState:", -[CLContextManagerWaterSubmersionBase submersionState](self, "submersionState"));
    -[CLContextManagerWaterSubmersionBase updateSubmersionStateFromMeasurement:](self, "updateSubmersionStateFromMeasurement:", v31);
    -[CLContextManagerWaterSubmersionBase updateClientsSubmersionMeasurement:](self, "updateClientsSubmersionMeasurement:", v31);

    v36 = (std::__shared_weak_count *)*((_QWORD *)&v67 + 1);
    if (*((_QWORD *)&v67 + 1))
    {
      v37 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 8);
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
    sub_1006F0FB8(v68);
    v39 = (std::__shared_weak_count *)*((_QWORD *)&v71 + 1);
    if (*((_QWORD *)&v71 + 1))
    {
      v40 = (unint64_t *)(*((_QWORD *)&v71 + 1) + 8);
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      goto LABEL_44;
    }
    goto LABEL_83;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    sub_100211128((uint64_t)v65, v76);
    -[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:](self, "updateSurfaceCalWithSource:andPressureQueue:", a3, v65);
    v23 = v65;
    goto LABEL_82;
  }
  if (a3 != 7)
  {
    if (a3 != 8)
      goto LABEL_83;
    sub_100211128((uint64_t)buf, (_QWORD *)self->super.super.fDataBuffers + 48);
    v19 = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)&buf[8] + (((unint64_t)(v81 + v80 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (v81 + v80 - 1));
    v68[0] = v19;
    if (*((_QWORD *)&v19 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
      v64 = v19;
      do
        v22 = __ldxr(v20);
      while (__stxr(v22 + 1, v20));
    }
    else
    {
      v64 = (unint64_t)v19;
    }
    -[CLContextManagerWaterSubmersionBase updateSubmersionStateFromAOPState:](self, "updateSubmersionStateFromAOPState:", &v64);
    v55 = (std::__shared_weak_count *)*((_QWORD *)&v64 + 1);
    if (*((_QWORD *)&v64 + 1))
    {
      v56 = (unint64_t *)(*((_QWORD *)&v64 + 1) + 8);
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
    v58 = (std::__shared_weak_count *)*((_QWORD *)&v68[0] + 1);
    if (*((_QWORD *)&v68[0] + 1))
    {
      v59 = (unint64_t *)(*((_QWORD *)&v68[0] + 1) + 8);
      do
        v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }
    v23 = buf;
LABEL_82:
    sub_1006F0FB8(v23);
    goto LABEL_83;
  }
  v42 = *(_OWORD *)(*(_QWORD *)(v73 + (((unint64_t)(v75 + v74 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (v75 + v74 - 1));
  *(_OWORD *)buf = v42;
  if (*((_QWORD *)&v42 + 1))
  {
    v43 = (unint64_t *)(*((_QWORD *)&v42 + 1) + 8);
    do
      v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
    v63 = v42;
    do
      v45 = __ldxr(v43);
    while (__stxr(v45 + 1, v43));
  }
  else
  {
    v63 = (unint64_t)v42;
  }
  -[CLContextManagerWaterSubmersion saveCachedSurfacePressure:](self, "saveCachedSurfacePressure:", &v63);
  v46 = (std::__shared_weak_count *)*((_QWORD *)&v63 + 1);
  if (*((_QWORD *)&v63 + 1))
  {
    v47 = (unint64_t *)(*((_QWORD *)&v63 + 1) + 8);
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  v61 = *(_QWORD *)buf;
  v62 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v49 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v50 = __ldxr(v49);
    while (__stxr(v50 + 1, v49));
  }
  -[CLContextManagerWaterSubmersion sendSurfacePressureToAOP:](self, "sendSurfacePressureToAOP:", &v61);
  v51 = v62;
  if (v62)
  {
    v52 = (unint64_t *)&v62->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  v39 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v54 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v41 = __ldaxr(v54);
    while (__stlxr(v41 - 1, v54));
LABEL_44:
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
LABEL_83:
  sub_1006F0FB8(&v72);
  sub_1006F0FB8(v76);
}

- (void)updateSurfaceCalWithSource:(unint64_t)a3 andPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>
{
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  const char *v11;
  const char *v12;
  int v13;
  BOOL v14;
  int v15;
  const char *v16;
  const char *v17;
  unint64_t value;
  __int128 v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  float v23;
  float v24;
  char *v25;
  unint64_t *v26;
  CFAbsoluteTime v27;
  NSObject *v28;
  CFAbsoluteTime v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  CLBarometerCalibrationSourceAggregator *sourceAggregator;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  NSObject *v43;
  CFAbsoluteTime Current;
  double v45;
  uint64_t v46;
  CFAbsoluteTime v47;
  double v48;
  const char *v49;
  uint8_t *v50;
  NSObject *v51;
  CFAbsoluteTime v52;
  double v53;
  unint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  CFAbsoluteTime v57;
  double v58;
  const char *v59;
  uint64_t v60;
  CFAbsoluteTime v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint8_t *v66;
  double *v67;
  char *v68;
  std::__shared_weak_count *v69;
  char *v70;
  std::__shared_weak_count *v71;
  _QWORD v72[6];
  char v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  uint64_t v77;
  uint64_t v78;
  int v79;
  CFAbsoluteTime v80;
  __int16 v81;
  CFAbsoluteTime v82;
  __int16 v83;
  double v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  uint64_t v90;
  uint8_t buf[4];
  CFAbsoluteTime v92;
  __int16 v93;
  CFAbsoluteTime v94;
  __int16 v95;
  double v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  uint64_t v102;

  if (a3 >= 9)
    sub_100263950("array::at");
  sub_100211128((uint64_t)v76, (_QWORD *)self->super.super.fDataBuffers + 6 * a3);
  v7 = *(_OWORD *)(*(_QWORD *)(v76[1] + (((unint64_t)(v78 + v77 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v78 + v77 - 1));
  v75 = v7;
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
  v67 = (double *)v7;
  if (*((_QWORD *)&v7 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  *(double *)&v11 = COERCE_DOUBLE("companion update");
  *(double *)&v12 = COERCE_DOUBLE("companionTimestamp");
  if (a3 == 4)
    v13 = 2;
  else
    v13 = 3;
  if (a3 != 4)
  {
    *(double *)&v12 = 0.0;
    *(double *)&v11 = 0.0;
  }
  v14 = a3 == 0;
  if (a3)
    v15 = v13;
  else
    v15 = 0;
  if (a3)
    v16 = v12;
  else
    *(double *)&v16 = COERCE_DOUBLE("locationTimestamp");
  if (v14)
    *(double *)&v17 = COERCE_DOUBLE("leeched location");
  else
    v17 = v11;
  if (!-[CLContextManagerWaterSubmersionBase updatingSurfacePressure](self, "updatingSurfacePressure"))
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v43 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      Current = CFAbsoluteTimeGetCurrent();
      v45 = *v67;
      *(_DWORD *)buf = 134349570;
      v92 = Current;
      v93 = 2082;
      v94 = *(double *)&v16;
      v95 = 2050;
      v96 = v45;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "caching pressure,timestamp,%{public}f,pressureTimestamp,0,pressure,0,%{public}s,%{public}f", buf, 0x20u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_63;
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v46 = qword_10229FE88;
    v47 = CFAbsoluteTimeGetCurrent();
    v48 = *v67;
    v79 = 134349570;
    v80 = v47;
    v81 = 2082;
    v82 = *(double *)&v16;
    v83 = 2050;
    v84 = v48;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v46, 0, "caching pressure,timestamp,%{public}f,pressureTimestamp,0,pressure,0,%{public}s,%{public}f", &v79, 32);
    v50 = (uint8_t *)v49;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]", "%s\n", v49);
LABEL_72:
    if (v50 != buf)
      free(v50);
    goto LABEL_63;
  }
  value = a4->__size_.__value_;
  if (value)
  {
    v19 = (*(_OWORD **)((char *)a4->__map_.__begin_ + (((value + a4->__start_ - 1) >> 5) & 0x7FFFFFFFFFFFFF8)))[(value + LOBYTE(a4->__start_) - 1)];
    v74 = v19;
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v19 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }
    if (vabdd_f64(*v67, *(double *)v19) < 310.0)
    {
      v73 = 0;
      sub_100211128((uint64_t)v72, a4);
      -[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:](self, "calculateFilterSurfaceCal:withSuccess:", v72, &v73);
      v24 = v23;
      sub_1006F0FB8(v72);
      if (v73)
      {
        v25 = (char *)operator new(0x30uLL);
        *((_QWORD *)v25 + 1) = 0;
        v26 = (unint64_t *)(v25 + 8);
        *((_QWORD *)v25 + 2) = 0;
        *(_QWORD *)v25 = off_102167860;
        *(int64x2_t *)(v25 + 24) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        *((_QWORD *)v25 + 5) = 3;
        v70 = v25 + 24;
        v71 = (std::__shared_weak_count *)v25;
        v27 = CFAbsoluteTimeGetCurrent();
        *((_DWORD *)v25 + 10) = v15;
        *((CFAbsoluteTime *)v25 + 3) = v27;
        *((double *)v25 + 4) = v24;
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        v28 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          v29 = CFAbsoluteTimeGetCurrent();
          v30 = *((double *)v25 + 3);
          v31 = *((_QWORD *)v25 + 4);
          v32 = *(_QWORD *)v67;
          *(_DWORD *)buf = 136447490;
          v92 = *(double *)&v17;
          v93 = 2050;
          v94 = v29;
          v95 = 2050;
          v96 = v30;
          v97 = 2050;
          v98 = v31;
          v99 = 2082;
          v100 = v16;
          v101 = 2050;
          v102 = v32;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "caching pressure on %{public}s,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,%{public}s,%{public}f", buf, 0x3Eu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021677E0);
          v60 = qword_10229FE88;
          v61 = CFAbsoluteTimeGetCurrent();
          v62 = *((double *)v25 + 3);
          v63 = *((_QWORD *)v25 + 4);
          v64 = *(_QWORD *)v67;
          v79 = 136447490;
          v80 = *(double *)&v17;
          v81 = 2050;
          v82 = v61;
          v83 = 2050;
          v84 = v62;
          v85 = 2050;
          v86 = v63;
          v87 = 2082;
          v88 = v16;
          v89 = 2050;
          v90 = v64;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v60, 0, "caching pressure on %{public}s,timestamp,%{public}f,pressureTimestamp,%{public}f,pressure,%{public}f,%{public}s,%{public}f", &v79, 62);
          v66 = (uint8_t *)v65;
          sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]", "%s\n", v65);
          if (v66 != buf)
            free(v66);
        }
        sourceAggregator = self->super.super._sourceAggregator;
        v68 = v25 + 24;
        v69 = (std::__shared_weak_count *)v25;
        do
          v34 = __ldxr(v26);
        while (__stxr(v34 + 1, v26));
        -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:](sourceAggregator, "didUpdateSource:withData:", 7, &v68);
        v35 = v69;
        if (v69)
        {
          p_shared_owners = (unint64_t *)&v69->__shared_owners_;
          do
            v37 = __ldaxr(p_shared_owners);
          while (__stlxr(v37 - 1, p_shared_owners));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }
        v38 = v71;
        if (v71)
        {
          v39 = (unint64_t *)&v71->__shared_owners_;
          do
            v40 = __ldaxr(v39);
          while (__stlxr(v40 - 1, v39));
          if (!v40)
          {
            ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
            std::__shared_weak_count::__release_weak(v38);
          }
        }
        v20 = (std::__shared_weak_count *)*((_QWORD *)&v74 + 1);
      }
    }
    if (v20)
    {
      v41 = (unint64_t *)&v20->__shared_owners_;
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
    goto LABEL_63;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021677E0);
  v51 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    v52 = CFAbsoluteTimeGetCurrent();
    v53 = *v67;
    *(_DWORD *)buf = 134349570;
    v92 = v52;
    v93 = 2080;
    v94 = *(double *)&v16;
    v95 = 2050;
    v96 = v53;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "pressure data not available,timestamp,%{public}f,%s,%{public}f", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v56 = qword_10229FE88;
    v57 = CFAbsoluteTimeGetCurrent();
    v58 = *v67;
    v79 = 134349570;
    v80 = v57;
    v81 = 2080;
    v82 = *(double *)&v16;
    v83 = 2050;
    v84 = v58;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v56, 0, "pressure data not available,timestamp,%{public}f,%s,%{public}f", &v79, 32);
    v50 = (uint8_t *)v59;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion updateSurfaceCalWithSource:andPressureQueue:]", "%s\n", v59);
    goto LABEL_72;
  }
LABEL_63:
  if (v8)
  {
    v54 = (unint64_t *)&v8->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  sub_1006F0FB8(v76);
}

- (float)calculateFilterSurfaceCal:()deque<std:(std:(BOOL *)a4 :allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a3 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData> withSuccess:
{
  unint64_t v6;
  void **begin;
  void **end;
  void **v9;
  uint64_t v10;
  unsigned int i;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  double v18;
  std::__shared_weak_count *size;
  _BOOL4 v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  float v26;
  float *v27;
  float *v28;
  float *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  float *v35;
  int v36;
  std::string *v37;
  __int128 v38;
  std::string *v39;
  __int128 v40;
  std::string *v41;
  std::string::size_type v42;
  std::string *v43;
  __int128 v44;
  const std::string::value_type *v45;
  std::string::size_type v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  NSObject *v51;
  CFAbsoluteTime Current;
  double v53;
  uint64_t v54;
  CFAbsoluteTime v55;
  uint64_t v56;
  const char *v57;
  char *v58;
  NSObject *v59;
  CFAbsoluteTime v60;
  uint64_t v61;
  double calibrationTimeOffset;
  double v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  NSObject *v70;
  CFAbsoluteTime v71;
  float v72;
  char v73;
  std::string *v74;
  __int128 v75;
  std::string *v76;
  __int128 v77;
  std::string *v78;
  std::string::size_type v79;
  std::string *v80;
  __int128 v81;
  const std::string::value_type *v82;
  std::string::size_type v83;
  NSObject *v84;
  double v85;
  std::string *v86;
  _BYTE *v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  uint64_t v92;
  CFAbsoluteTime v93;
  const char *v94;
  char *v95;
  uint64_t v96;
  double v97;
  std::string *v98;
  const char *v99;
  char *v100;
  uint64_t v101;
  CFAbsoluteTime v102;
  std::string::size_type v103;
  double v104;
  double v105;
  char *v106;
  double v107;
  double v108;
  BOOL *v109;
  std::string v110;
  std::string v111;
  std::string v112;
  double *v113;
  std::__shared_weak_count *v114;
  double *v115;
  std::__shared_weak_count *v116;
  std::string v117;
  void *__p;
  float *v119;
  float *v120;
  std::string v121;
  _BYTE v122[18];
  _BYTE buf[24];
  _BYTE v124[18];

  __p = 0;
  v119 = 0;
  v120 = 0;
  memset(&v117, 0, sizeof(v117));
  v115 = 0;
  v116 = 0;
  v6 = a3->__start_ + a3->__size_.__value_;
  begin = a3->__map_.__begin_;
  end = a3->__map_.__end_;
  v9 = &begin[v6 >> 8];
  v109 = a4;
  if (end == begin)
    v10 = 0;
  else
    v10 = (uint64_t)*v9 + 16 * v6;
  for (i = 0; ; ++i)
  {
    v12 = end == begin
        ? 0
        : (uint64_t)(*(char **)((char *)begin + ((a3->__start_ >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * a3->__start_);
    if (v10 == v12 || i > 0x12B)
      break;
    v13 = v10;
    if ((void *)v10 == *v9)
      v13 = (uint64_t)*(v9 - 1) + 4096;
    v113 = *(double **)(v13 - 16);
    v14 = *(std::__shared_weak_count **)(v13 - 8);
    v114 = v14;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    if (vabdd_f64(CFAbsoluteTimeGetCurrent(), *v113) > 310.0 && i != 0)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v51 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        Current = CFAbsoluteTimeGetCurrent();
        v53 = *v113;
        *(_DWORD *)buf = 134218496;
        *(CFAbsoluteTime *)&buf[4] = Current;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 0x4073600000000000;
        *(_WORD *)&buf[22] = 2048;
        *(double *)v124 = v53;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "ignoring pressure older than max age,timestamp,%f,maxAge,%f,pressureSampleTimestamp,%f", buf, 0x20u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        v54 = qword_10229FE88;
        v55 = CFAbsoluteTimeGetCurrent();
        v56 = *(_QWORD *)v113;
        LODWORD(v121.__r_.__value_.__l.__data_) = 134218496;
        *(CFAbsoluteTime *)((char *)v121.__r_.__value_.__r.__words + 4) = v55;
        WORD2(v121.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&v121.__r_.__value_.__r.__words[1] + 6) = 0x4073600000000000;
        HIWORD(v121.__r_.__value_.__r.__words[2]) = 2048;
        *(_QWORD *)v122 = v56;
        LODWORD(v107) = 32;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v54, 2, "ignoring pressure older than max age,timestamp,%f,maxAge,%f,pressureSampleTimestamp,%f", COERCE_DOUBLE(&v121), v107, v108);
        v58 = (char *)v57;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]", "%s\n", v57);
        goto LABEL_167;
      }
      goto LABEL_99;
    }
    if (self)
    {
      -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
      if (*(_BYTE *)(*(_QWORD *)buf + 8) == 1)
      {
        v18 = *v113;
        -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
        size = (std::__shared_weak_count *)v121.__r_.__value_.__l.__size_;
        v20 = v18 < *(double *)v121.__r_.__value_.__l.__data_ + self->_calibrationTimeOffset;
        if (v121.__r_.__value_.__l.__size_)
        {
          v21 = (unint64_t *)(v121.__r_.__value_.__l.__size_ + 8);
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
            std::__shared_weak_count::__release_weak(size);
          }
        }
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
    }
    v23 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v24 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    if (v20)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v59 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        v60 = CFAbsoluteTimeGetCurrent();
        -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
        v61 = *(_QWORD *)v121.__r_.__value_.__l.__data_;
        calibrationTimeOffset = self->_calibrationTimeOffset;
        v63 = *v113;
        *(_DWORD *)buf = 134218752;
        *(CFAbsoluteTime *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v61;
        *(_WORD *)&buf[22] = 2048;
        *(double *)v124 = v63;
        *(_WORD *)&v124[8] = 2048;
        *(double *)&v124[10] = calibrationTimeOffset;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "ignoring pressure older than desubmersion,timestamp,%f,desubmersionTimestamp,%f,pressureSampleTimestamp,%f,offset,%f", buf, 0x2Au);
        v64 = (std::__shared_weak_count *)v121.__r_.__value_.__l.__size_;
        if (v121.__r_.__value_.__l.__size_)
        {
          v65 = (unint64_t *)(v121.__r_.__value_.__l.__size_ + 8);
          do
            v66 = __ldaxr(v65);
          while (__stlxr(v66 - 1, v65));
          if (!v66)
          {
            ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
            std::__shared_weak_count::__release_weak(v64);
          }
        }
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        v101 = qword_10229FE88;
        v102 = CFAbsoluteTimeGetCurrent();
        -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
        v103 = *(_QWORD *)v112.__r_.__value_.__l.__data_;
        v104 = self->_calibrationTimeOffset;
        v105 = *v113;
        LODWORD(v121.__r_.__value_.__l.__data_) = 134218752;
        *(CFAbsoluteTime *)((char *)v121.__r_.__value_.__r.__words + 4) = v102;
        WORD2(v121.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&v121.__r_.__value_.__r.__words[1] + 6) = v103;
        HIWORD(v121.__r_.__value_.__r.__words[2]) = 2048;
        *(double *)v122 = v105;
        *(_WORD *)&v122[8] = 2048;
        *(double *)&v122[10] = v104;
        LODWORD(v107) = 42;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v101, 0, "ignoring pressure older than desubmersion,timestamp,%f,desubmersionTimestamp,%f,pressureSampleTimestamp,%f,offset,%f", COERCE_DOUBLE(&v121), v107, v108, *(double *)&v109);
        v58 = v106;
        sub_100261F44((uint64_t)&v112);
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]", "%s\n", v58);
LABEL_167:
        if (v58 != buf)
          free(v58);
      }
LABEL_99:
      v67 = v114;
      if (v114)
      {
        v68 = (unint64_t *)&v114->__shared_owners_;
        do
          v69 = __ldaxr(v68);
        while (__stlxr(v69 - 1, v68));
        if (!v69)
        {
          ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
          std::__shared_weak_count::__release_weak(v67);
        }
      }
      break;
    }
    v26 = v113[1];
    v27 = v119;
    if (v119 >= v120)
    {
      v29 = (float *)__p;
      v30 = ((char *)v119 - (_BYTE *)__p) >> 2;
      v31 = v30 + 1;
      if ((unint64_t)(v30 + 1) >> 62)
        sub_100259694();
      v32 = (char *)v120 - (_BYTE *)__p;
      if (((char *)v120 - (_BYTE *)__p) >> 1 > v31)
        v31 = v32 >> 1;
      if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
        v33 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v33 = v31;
      if (v33)
      {
        v34 = (char *)sub_100260634((uint64_t)&v120, v33);
        v29 = (float *)__p;
        v27 = v119;
      }
      else
      {
        v34 = 0;
      }
      v35 = (float *)&v34[4 * v30];
      *v35 = v26;
      v28 = v35 + 1;
      while (v27 != v29)
      {
        v36 = *((_DWORD *)v27-- - 1);
        *((_DWORD *)v35-- - 1) = v36;
      }
      __p = v35;
      v119 = v28;
      v120 = (float *)&v34[4 * v33];
      if (v29)
        operator delete(v29);
    }
    else
    {
      *v119 = v26;
      v28 = v27 + 1;
    }
    v119 = v28;
    if (!i)
    {
      std::to_string(&v111, *v113);
      v37 = std::string::insert(&v111, 0, "firstTimestamp,");
      v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
      v112.__r_.__value_.__r.__words[2] = v37->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v112.__r_.__value_.__l.__data_ = v38;
      v37->__r_.__value_.__l.__size_ = 0;
      v37->__r_.__value_.__r.__words[2] = 0;
      v37->__r_.__value_.__r.__words[0] = 0;
      v39 = std::string::append(&v112, ",firstPressure,");
      v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
      v121.__r_.__value_.__r.__words[2] = v39->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v121.__r_.__value_.__l.__data_ = v40;
      v39->__r_.__value_.__l.__size_ = 0;
      v39->__r_.__value_.__r.__words[2] = 0;
      v39->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v110, v113[1]);
      if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v41 = &v110;
      else
        v41 = (std::string *)v110.__r_.__value_.__r.__words[0];
      if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v42 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
      else
        v42 = v110.__r_.__value_.__l.__size_;
      v43 = std::string::append(&v121, (const std::string::value_type *)v41, v42);
      v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
      *(_QWORD *)&buf[16] = *((_QWORD *)&v43->__r_.__value_.__l + 2);
      *(_OWORD *)buf = v44;
      v43->__r_.__value_.__l.__size_ = 0;
      v43->__r_.__value_.__r.__words[2] = 0;
      v43->__r_.__value_.__r.__words[0] = 0;
      if (buf[23] >= 0)
        v45 = buf;
      else
        v45 = *(const std::string::value_type **)buf;
      if (buf[23] >= 0)
        v46 = buf[23];
      else
        v46 = *(_QWORD *)&buf[8];
      std::string::append(&v117, v45, v46);
      if ((buf[23] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v110.__r_.__value_.__l.__data_);
      if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v121.__r_.__value_.__l.__data_);
      if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v112.__r_.__value_.__l.__data_);
      if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v111.__r_.__value_.__l.__data_);
    }
    sub_100349198(&v115, (uint64_t *)&v113);
    v47 = v114;
    if (v114)
    {
      v48 = (unint64_t *)&v114->__shared_owners_;
      do
        v49 = __ldaxr(v48);
      while (__stlxr(v49 - 1, v48));
      if (!v49)
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
    }
    if ((void *)v10 == *v9)
    {
      v50 = (uint64_t)*--v9;
      v10 = v50 + 4096;
    }
    v10 -= 16;
    begin = a3->__map_.__begin_;
    end = a3->__map_.__end_;
  }
  if (i > 9)
  {
    std::to_string(&v111, *v115);
    v74 = std::string::insert(&v111, 0, ",lastTimestamp,");
    v75 = *(_OWORD *)&v74->__r_.__value_.__l.__data_;
    v112.__r_.__value_.__r.__words[2] = v74->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v112.__r_.__value_.__l.__data_ = v75;
    v74->__r_.__value_.__l.__size_ = 0;
    v74->__r_.__value_.__r.__words[2] = 0;
    v74->__r_.__value_.__r.__words[0] = 0;
    v76 = std::string::append(&v112, ",lastPressure,");
    v77 = *(_OWORD *)&v76->__r_.__value_.__l.__data_;
    v121.__r_.__value_.__r.__words[2] = v76->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v121.__r_.__value_.__l.__data_ = v77;
    v76->__r_.__value_.__l.__size_ = 0;
    v76->__r_.__value_.__r.__words[2] = 0;
    v76->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v110, v115[1]);
    if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v78 = &v110;
    else
      v78 = (std::string *)v110.__r_.__value_.__r.__words[0];
    if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v79 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
    else
      v79 = v110.__r_.__value_.__l.__size_;
    v80 = std::string::append(&v121, (const std::string::value_type *)v78, v79);
    v81 = *(_OWORD *)&v80->__r_.__value_.__l.__data_;
    *(_QWORD *)&buf[16] = *((_QWORD *)&v80->__r_.__value_.__l + 2);
    *(_OWORD *)buf = v81;
    v80->__r_.__value_.__l.__size_ = 0;
    v80->__r_.__value_.__r.__words[2] = 0;
    v80->__r_.__value_.__r.__words[0] = 0;
    if (buf[23] >= 0)
      v82 = buf;
    else
      v82 = *(const std::string::value_type **)buf;
    if (buf[23] >= 0)
      v83 = buf[23];
    else
      v83 = *(_QWORD *)&buf[8];
    std::string::append(&v117, v82, v83);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v110.__r_.__value_.__l.__data_);
    if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v121.__r_.__value_.__l.__data_);
    if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v112.__r_.__value_.__l.__data_);
    if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v111.__r_.__value_.__l.__data_);
    v72 = sub_100AA7BF8((uint64_t)&__p, 10);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v84 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v85 = CFAbsoluteTimeGetCurrent();
      v86 = &v117;
      if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v86 = (std::string *)v117.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 134349826;
      *(double *)&buf[4] = v85;
      *(_WORD *)&buf[12] = 2050;
      *(double *)&buf[14] = v72;
      *(_WORD *)&buf[22] = 1026;
      *(_DWORD *)v124 = i;
      *(_WORD *)&v124[4] = 2080;
      *(_QWORD *)&v124[6] = v86;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "filtering surface calibration,timestamp,%{public}f,filteredValue,%{public}f,numCalibrations,%{public}d,%s", buf, 0x26u);
    }
    if (!sub_1001BFF7C(115, 2))
    {
      v73 = 1;
      goto LABEL_141;
    }
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v96 = qword_10229FE88;
    v97 = CFAbsoluteTimeGetCurrent();
    v98 = &v117;
    if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v98 = (std::string *)v117.__r_.__value_.__r.__words[0];
    LODWORD(v121.__r_.__value_.__l.__data_) = 134349826;
    *(double *)((char *)v121.__r_.__value_.__r.__words + 4) = v97;
    WORD2(v121.__r_.__value_.__r.__words[1]) = 2050;
    *(double *)((char *)&v121.__r_.__value_.__r.__words[1] + 6) = v72;
    HIWORD(v121.__r_.__value_.__r.__words[2]) = 1026;
    *(_DWORD *)v122 = i;
    *(_WORD *)&v122[4] = 2080;
    *(_QWORD *)&v122[6] = v98;
    LODWORD(v107) = 38;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v96, 0, "filtering surface calibration,timestamp,%{public}f,filteredValue,%{public}f,numCalibrations,%{public}d,%s", &v121, *(_QWORD *)&v107);
    v100 = (char *)v99;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]", "%s\n", v99);
    v87 = v109;
    if (v100 != buf)
      free(v100);
    v73 = 1;
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v70 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v71 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349568;
      *(CFAbsoluteTime *)&buf[4] = v71;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = i;
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = 10;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "too few pressure samples to filter not updating surface cal,timestamp,%{public}f,numSamples,%{public}d,needed,%{public}d", buf, 0x18u);
    }
    v72 = -1.0;
    if (!sub_1001BFF7C(115, 2))
    {
      v73 = 0;
LABEL_141:
      v87 = v109;
      goto LABEL_142;
    }
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v92 = qword_10229FE88;
    v93 = CFAbsoluteTimeGetCurrent();
    LODWORD(v121.__r_.__value_.__l.__data_) = 134349568;
    *(CFAbsoluteTime *)((char *)v121.__r_.__value_.__r.__words + 4) = v93;
    WORD2(v121.__r_.__value_.__r.__words[1]) = 1026;
    *(_DWORD *)((char *)&v121.__r_.__value_.__r.__words[1] + 6) = i;
    WORD1(v121.__r_.__value_.__r.__words[2]) = 1026;
    HIDWORD(v121.__r_.__value_.__r.__words[2]) = 10;
    LODWORD(v107) = 24;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v92, 0, "too few pressure samples to filter not updating surface cal,timestamp,%{public}f,numSamples,%{public}d,needed,%{public}d", &v121, *(_QWORD *)&v107);
    v95 = (char *)v94;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion calculateFilterSurfaceCal:withSuccess:]", "%s\n", v94);
    v87 = v109;
    if (v95 != buf)
      free(v95);
    v73 = 0;
  }
LABEL_142:
  *v87 = v73;
  v88 = v116;
  if (v116)
  {
    v89 = (unint64_t *)&v116->__shared_owners_;
    do
      v90 = __ldaxr(v89);
    while (__stlxr(v90 - 1, v89));
    if (!v90)
    {
      ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
      std::__shared_weak_count::__release_weak(v88);
    }
  }
  if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v117.__r_.__value_.__l.__data_);
  if (__p)
  {
    v119 = (float *)__p;
    operator delete(__p);
  }
  return v72;
}

- (void)sendSurfacePressureToAOP:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3
{
  double v3;
  float v4;
  float v5;
  uint64_t v6;
  double v7;
  float v8;

  v3 = *(double *)(*(_QWORD *)&a3.var0->fTimestamp + 8);
  v4 = **(double **)&a3.var0->fTimestamp;
  v7 = v4;
  v5 = v3;
  v8 = v5;
  v6 = sub_1001FBB04(0);
  (*(void (**)(uint64_t, double *))(*(_QWORD *)(v6 + 112) + 24))(v6 + 112, &v7);
}

- (void)forceGPSIfSurfaceCalStale
{
  float v3;
  __int128 v4;
  __int128 v5;
  unint64_t *v6;
  unint64_t v7;
  double Current;
  double v9;
  double v10;
  CLPowerAssertion *value;
  NSObject *v12;
  double v13;
  CFAbsoluteTime v14;
  unint64_t *v15;
  unint64_t v16;
  CLPowerAssertion *v17;
  NSObject *v18;
  CFAbsoluteTime v19;
  uint64_t v20;
  CFAbsoluteTime v21;
  const char *v22;
  uint8_t *v23;
  uint64_t v24;
  double v25;
  CFAbsoluteTime v26;
  const char *v27;
  uint8_t *v28;
  double v29;
  void *v30[2];
  char v31;
  void *__p[2];
  char v33;
  __int128 v34;
  _QWORD v35[4];
  uint64_t v36;
  uint64_t v37;
  int v38;
  CFAbsoluteTime v39;
  __int16 v40;
  double v41;
  __int16 v42;
  CFAbsoluteTime v43;
  uint8_t buf[4];
  CFAbsoluteTime v45;
  __int16 v46;
  double v47;
  __int16 v48;
  CFAbsoluteTime v49;

  LODWORD(v35[0]) = 1155596288;
  sub_1018C2254(buf, "SurfaceCalStaleTime", v35, 0);
  v3 = *(float *)&v45;
  if (-[CLContextManagerWaterSubmersionBase updatingSurfacePressure](self, "updatingSurfacePressure")
    && !self->_forcingGPS)
  {
    sub_100211128((uint64_t)v35, (_QWORD *)self->super.super.fDataBuffers + 42);
    if (v37)
    {
      v4 = *(_OWORD *)(*(_QWORD *)(v35[1] + (((unint64_t)(v37 + v36 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                     + 16 * (v37 + v36 - 1));
      v34 = v4;
      v5 = v4;
      if (*((_QWORD *)&v4 + 1))
      {
        v6 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
        do
          v7 = __ldxr(v6);
        while (__stxr(v7 + 1, v6));
      }
      Current = CFAbsoluteTimeGetCurrent();
      v9 = v3;
      v10 = vabdd_f64(Current, *(double *)v5);
      if (v10 > v9)
      {
        self->_forcingGPS = 1;
        value = self->_powerAssertionGPS.__ptr_.__value_;
        sub_1015A2E04(__p, "Altimeter, surface calibration power assertion GPS");
        sub_10002B684((uint64_t)value, (uint64_t *)__p);
        if (v33 < 0)
          operator delete(__p[0]);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        v12 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(double *)v5;
          v14 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134218496;
          v45 = v13;
          v46 = 2048;
          v47 = v10;
          v48 = 2048;
          v49 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "surface calibration stale, subscribing to GPS notifications,surfaceCalTimestamp,%f,timeDiff,%f,now,%f", buf, 0x20u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021677E0);
          v24 = qword_10229FE88;
          v25 = *(double *)v5;
          v26 = CFAbsoluteTimeGetCurrent();
          v38 = 134218496;
          v39 = v25;
          v40 = 2048;
          v41 = v10;
          v42 = 2048;
          v43 = v26;
          LODWORD(v29) = 32;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v24, 0, "surface calibration stale, subscribing to GPS notifications,surfaceCalTimestamp,%f,timeDiff,%f,now,%f", COERCE_DOUBLE(&v38), v29, *(double *)&v5);
          v28 = (uint8_t *)v27;
          sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale]", "%s\n", v27);
          if (v28 != buf)
            free(v28);
        }
        objc_msgSend(*((id *)self->_locationControllerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationControllerClient.__ptr_.__value_ + 1), 0, 0);
        -[CLContextManagerWaterSubmersion setTimerForGPSOff](self, "setTimerForGPSOff");
      }
      if (*((_QWORD *)&v5 + 1))
      {
        v15 = (unint64_t *)(*((_QWORD *)&v5 + 1) + 8);
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          (*(void (**)(_QWORD))(**((_QWORD **)&v5 + 1) + 16))(*((_QWORD *)&v5 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v5 + 1));
        }
      }
    }
    else
    {
      self->_forcingGPS = 1;
      v17 = self->_powerAssertionGPS.__ptr_.__value_;
      sub_1015A2E04(v30, "Altimeter, surface calibration power assertion GPS");
      sub_10002B684((uint64_t)v17, (uint64_t *)v30);
      if (v31 < 0)
        operator delete(v30[0]);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v18 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        v19 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 134217984;
        v45 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "no saved surface calibration, subscribing to GPS notifications %f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021677E0);
        v20 = qword_10229FE88;
        v21 = CFAbsoluteTimeGetCurrent();
        v38 = 134217984;
        v39 = v21;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 0, "no saved surface calibration, subscribing to GPS notifications %f", COERCE_DOUBLE(&v38));
        v23 = (uint8_t *)v22;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion forceGPSIfSurfaceCalStale]", "%s\n", v22);
        if (v23 != buf)
          free(v23);
      }
      objc_msgSend(*((id *)self->_locationControllerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationControllerClient.__ptr_.__value_ + 1), 0, 0);
      -[CLContextManagerWaterSubmersion setTimerForGPSOff](self, "setTimerForGPSOff");
    }
    sub_1006F0FB8(v35);
  }
}

- (void)setTimerForGPSOff
{
  -[CLTimer setNextFireDelay:](self->_forceGPSTimer, "setNextFireDelay:", 30.0);
}

- (void)saveCachedSurfacePressure:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationSurfaceCalData>)a3
{
  const void **var0;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double lastPressureTimestampSaved;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint8_t *v15;
  int v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  uint64_t v23;

  var0 = (const void **)a3.var0;
  v5 = sub_1001FD94C();
  sub_10018A4CC(v5, "CLWaterSubmersion_SurfacePressureTimestamp", *var0);
  v6 = sub_1001FD94C();
  sub_10018A4CC(v6, "CLWaterSubmersion_SurfacePressure", (char *)*var0 + 8);
  v7 = sub_1001FD94C();
  *(_DWORD *)buf = *((_DWORD *)*var0 + 4);
  sub_10011B4E4(v7, "CLWaterSubmersion_SurfacePressureSource", buf);
  v8 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v8 + 944))(v8);
  self->_lastPressureTimestampSaved = *(double *)*var0;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021677E0);
  v9 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    lastPressureTimestampSaved = self->_lastPressureTimestampSaved;
    v11 = *((_QWORD *)*var0 + 1);
    *(_DWORD *)buf = 134349312;
    v21 = lastPressureTimestampSaved;
    v22 = 2050;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "saved surface calibration pressure,timestamp,%{public}f,pressure,%{public}f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v12 = self->_lastPressureTimestampSaved;
    v13 = *((_QWORD *)*var0 + 1);
    v16 = 134349312;
    v17 = v12;
    v18 = 2050;
    v19 = v13;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "saved surface calibration pressure,timestamp,%{public}f,pressure,%{public}f", &v16, 22);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion saveCachedSurfacePressure:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
}

- (void)retrieveCachedSurfacePressure
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  NSObject *v8;
  CFAbsoluteTime Current;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  CLBarometerCalibrationSourceAggregator *sourceAggregator;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  CFAbsoluteTime v24;
  const char *v25;
  uint8_t *v26;
  _QWORD *v27;
  std::__shared_weak_count *v28;
  _QWORD *v29;
  std::__shared_weak_count *v30;
  _QWORD *v31;
  std::__shared_weak_count *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  CFAbsoluteTime v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  uint8_t buf[4];
  CFAbsoluteTime v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  int v51;

  v34 = 0x7FEFFFFFFFFFFFFFLL;
  v35 = 0x7FEFFFFFFFFFFFFFLL;
  v33 = 3;
  v3 = sub_1001FD94C();
  sub_1001FD98C(v3, "CLWaterSubmersion_SurfacePressureTimestamp", &v35);
  v4 = sub_1001FD94C();
  sub_1001FD98C(v4, "CLWaterSubmersion_SurfacePressure", &v34);
  v5 = sub_1001FD94C();
  sub_1001E4B84(v5, "CLWaterSubmersion_SurfacePressureSource", &v33);
  v6 = (std::__shared_weak_count *)operator new(0x30uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)v35;
  v6->__vftable = (std::__shared_weak_count_vtbl *)off_102167860;
  v6[1].__shared_weak_owners_ = 3;
  v31 = &v6[1].__vftable;
  v32 = v6;
  LODWORD(v6[1].__shared_weak_owners_) = v33;
  v6[1].__shared_owners_ = v34;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021677E0);
  v8 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134349824;
    v45 = Current;
    v46 = 2050;
    v47 = v35;
    v48 = 2050;
    v49 = v34;
    v50 = 1026;
    v51 = v33;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "recovering surface pressure on locationd start,timestamp,%{public}f,recoveredTimestamp,%{public}f,surface pressure,%{public}f,calibration source,%{public}d", buf, 0x26u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v23 = qword_10229FE88;
    v24 = CFAbsoluteTimeGetCurrent();
    v36 = 134349824;
    v37 = v24;
    v38 = 2050;
    v39 = v35;
    v40 = 2050;
    v41 = v34;
    v42 = 1026;
    v43 = v33;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 0, "recovering surface pressure on locationd start,timestamp,%{public}f,recoveredTimestamp,%{public}f,surface pressure,%{public}f,calibration source,%{public}d", &v36, 38);
    v26 = (uint8_t *)v25;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion retrieveCachedSurfacePressure]", "%s\n", v25);
    if (v26 != buf)
      free(v26);
  }
  v29 = &v6[1].__vftable;
  v30 = v6;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  -[CLContextManagerWaterSubmersion sendSurfacePressureToAOP:](self, "sendSurfacePressureToAOP:", &v29);
  v11 = v30;
  if (v30)
  {
    v12 = (unint64_t *)&v30->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  sourceAggregator = self->super.super._sourceAggregator;
  v27 = v31;
  v28 = v32;
  if (v32)
  {
    v15 = (unint64_t *)&v32->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:](sourceAggregator, "didUpdateSource:withData:", 7, &v27);
  v17 = v28;
  if (v28)
  {
    v18 = (unint64_t *)&v28->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = v32;
  if (v32)
  {
    v21 = (unint64_t *)&v32->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

- (void)retrieveCachedSubmersionState
{
  float v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  double *v11;
  std::__shared_weak_count *v12;
  double v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLContextManagerWaterSubmersion;
  -[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState](&v15, "retrieveCachedSubmersionState");
  v14 = 0;
  -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
  v3 = *v11;
  v13 = v3;
  -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
  LOBYTE(v14) = *(_BYTE *)(v9 + 8);
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (v12)
  {
    v6 = (unint64_t *)&v12->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v8 = sub_1001FBB04(0);
  (*(void (**)(uint64_t, double *))(*(_QWORD *)(v8 + 112) + 32))(v8 + 112, &v13);
}

- (void)onCharger:(BOOL)a3
{
  uint64_t v3;
  NSObject *v4;
  CFAbsoluteTime Current;
  uint64_t v6;
  CFAbsoluteTime v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[2];
  int v11;
  CFAbsoluteTime v12;
  uint8_t buf[4];
  CFAbsoluteTime v14;

  if (a3)
  {
    v10[1] = 1;
    v10[0] = CFAbsoluteTimeGetCurrent();
    v3 = sub_1001FBB04(0);
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)(v3 + 112) + 32))(v3 + 112, v10);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v4 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      v14 = Current;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "detected on charger, sending state to AOP, %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021677E0);
      v6 = qword_10229FE88;
      v7 = CFAbsoluteTimeGetCurrent();
      v11 = 134217984;
      v12 = v7;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 0, "detected on charger, sending state to AOP, %f", COERCE_DOUBLE(&v11));
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion onCharger:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

- (void)onEnableEasySubmersion:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  CFAbsoluteTime v10;
  __int16 v11;
  _BOOL4 v12;
  uint8_t buf[4];
  CFAbsoluteTime Current;
  __int16 v15;
  _BOOL4 v16;

  v3 = a3;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021677E0);
  v4 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    Current = CFAbsoluteTimeGetCurrent();
    v15 = 1024;
    v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received easy submersion notification, sending easy submersion update to AOP,timestamp,%f,enableState,%d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    v6 = qword_10229FE88;
    v9 = 134218240;
    v10 = CFAbsoluteTimeGetCurrent();
    v11 = 1024;
    v12 = v3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 0, "received easy submersion notification, sending easy submersion update to AOP,timestamp,%f,enableState,%d", COERCE_DOUBLE(&v9), 18);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersion onEnableEasySubmersion:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  v5 = sub_1001FBB04(0);
  (*(void (**)(uint64_t, _BOOL8))(*(_QWORD *)(v5 + 112) + 40))(v5 + 112, v3);
}

+ (double)calculateDepthFromPressure:(double)a3 withSurfacePressure:(double)a4
{
  return (a3 - a4) * 1000.0 / 10002.7832;
}

- (void).cxx_destruct
{
  Client *value;
  CLPowerAssertion *v4;

  value = self->_locationControllerClient.__ptr_.__value_;
  self->_locationControllerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_powerAssertionGPS.__ptr_.__value_;
  self->_powerAssertionGPS.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(CLPowerAssertion *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  return self;
}

@end
