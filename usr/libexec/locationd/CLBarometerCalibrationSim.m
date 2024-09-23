@implementation CLBarometerCalibrationSim

- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
  -[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:](self->_biasEstimator, "updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:", a3, a4, a5);
}

- (CLBarometerCalibrationSim)initWithAOPAltimeter:(void *)a3
{
  CLBarometerCalibrationSim *v4;
  CLBarometerCalibrationSim *v5;
  CLBarometerCalibrationSourceAggregator *v6;
  CLBarometerCalibrationContextManager *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v12;
  uint8_t *v13;
  __int16 v14[8];
  objc_super v15;
  uint8_t buf[1640];

  v15.receiver = self;
  v15.super_class = (Class)CLBarometerCalibrationSim;
  v4 = -[CLBarometerCalibrationSim init](&v15, "init");
  v5 = v4;
  if (v4)
  {
    v4->_aopAltimeter = a3;
    v6 = -[CLBarometerCalibrationSourceAggregator initWithUniverse:buffers:]([CLBarometerCalibrationSourceAggregator alloc], "initWithUniverse:buffers:", 0, &v4->fDataBuffers);
    v5->_sourceAggregator = v6;
    -[CLBarometerCalibrationSourceAggregator setDelegate:](v6, "setDelegate:", v5);
    *(_OWORD *)&v5->_contextManagers.__elems_[6] = 0u;
    *(_OWORD *)&v5->_contextManagers.__elems_[8] = 0u;
    *(_OWORD *)&v5->_contextManagers.__elems_[2] = 0u;
    *(_OWORD *)&v5->_contextManagers.__elems_[4] = 0u;
    *(_OWORD *)v5->_contextManagers.__elems_ = 0u;
    -[CLBarometerCalibrationSim initContextManagersForNotification:](v5, "initContextManagersForNotification:", 2);
    -[CLBarometerCalibrationSim initContextManagersForNotification:](v5, "initContextManagersForNotification:", 1);
    v5->_latestAbsoluteAltitude = objc_opt_new(CLBarometerCalibrationAbsoluteAltitude);
    *(_QWORD *)&v5->_prevElevationAscended = 0;
    v5->_lastAltitudeTime = 1.79769313e308;
    *(int64x2_t *)&v5->_lastAltitude = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v5->_inOutdoorWorkout = 0;
    *(_WORD *)&v5->_currentUnderDEM = 0;
    v5->_sameElevationCounter = 0;
    v5->_fCurrentPressureCalibration = 101.5;
    v5->_fWetState = 0;
    v5->_thresholdManager = objc_alloc_init(CLElevationThresholdManager);
    v7 = v5->_contextManagers.__elems_[9];
    v9 = objc_opt_class(CLContextManagerElevationProfile, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v5->_elevationProfileContextManager = (CLContextManagerElevationProfile *)v5->_contextManagers.__elems_[9];
      v5->_biasEstimator = -[CLBarometerCalibrationBiasEstimator initWithUniverse:delegate:buffers:contextManager:]([CLBarometerCalibrationBiasEstimator alloc], "initWithUniverse:delegate:buffers:contextManager:", 0, v5, &v5->fDataBuffers, v5->_elevationProfileContextManager);
    }
    else
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
      v10 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "elevation profile context manager does not exist!", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
        v14[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "elevation profile context manager does not exist!", v14, 2);
        v13 = (uint8_t *)v12;
        sub_100512490("Generic", 1, 0, 0, "-[CLBarometerCalibrationSim initWithAOPAltimeter:]", "%s\n", v12);
        if (v13 != buf)
          free(v13);
      }
    }
  }
  return v5;
}

- (void)feedPressureData:(const Sample *)a3 andTempDerivative:(float)a4 andWetState:(BOOL)a5
{
  char *v9;
  unint64_t *v10;
  int64x2_t v11;
  CLBarometerCalibrationSourceAggregator *sourceAggregator;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  char *v20;
  std::__shared_weak_count *v21;
  char *v22;
  std::__shared_weak_count *v23;

  v9 = (char *)operator new(0x38uLL);
  *((_QWORD *)v9 + 1) = 0;
  v10 = (unint64_t *)(v9 + 8);
  *((_QWORD *)v9 + 2) = 0;
  *(_QWORD *)v9 = off_1021A5AE0;
  v11 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(v9 + 24) = v11;
  *(int64x2_t *)(v9 + 40) = v11;
  v22 = v9 + 24;
  v23 = (std::__shared_weak_count *)v9;
  *((CFAbsoluteTime *)v9 + 3) = CFAbsoluteTimeGetCurrent();
  *((float64x2_t *)v9 + 2) = vcvtq_f64_f32(*(float32x2_t *)&a3->var1.var0);
  *((double *)v9 + 6) = a4;
  self->_fWetState = a5;
  sourceAggregator = self->_sourceAggregator;
  v20 = v9 + 24;
  v21 = (std::__shared_weak_count *)v9;
  do
    v13 = __ldxr(v10);
  while (__stxr(v13 + 1, v10));
  -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:](sourceAggregator, "didUpdateSource:withData:", 1, &v20);
  v14 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

- (void)feedPressureKF:(const CMKFFilteredPressureSample *)a3
{
  char *v5;
  unint64_t *v6;
  int64x2_t v7;
  int8x16_t v8;
  CLBarometerCalibrationSourceAggregator *sourceAggregator;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char *v17;
  std::__shared_weak_count *v18;
  char *v19;
  std::__shared_weak_count *v20;

  v5 = (char *)operator new(0x38uLL);
  *((_QWORD *)v5 + 1) = 0;
  v6 = (unint64_t *)(v5 + 8);
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = off_1021A5B30;
  v7 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(v5 + 24) = v7;
  *(int64x2_t *)(v5 + 40) = v7;
  v19 = v5 + 24;
  v20 = (std::__shared_weak_count *)v5;
  *((CFAbsoluteTime *)v5 + 3) = CFAbsoluteTimeGetCurrent();
  v8 = (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&a3->var2);
  *((int8x16_t *)v5 + 2) = vextq_s8(v8, v8, 8uLL);
  *((double *)v5 + 6) = a3->var4;
  sourceAggregator = self->_sourceAggregator;
  v17 = v5 + 24;
  v18 = (std::__shared_weak_count *)v5;
  do
    v10 = __ldxr(v6);
  while (__stxr(v10 + 1, v6));
  -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:](sourceAggregator, "didUpdateSource:withData:", 5, &v17);
  v11 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v20;
  if (v20)
  {
    v15 = (unint64_t *)&v20->__shared_owners_;
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

- (void)feedCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
  int sameElevationCounter;
  uint64_t v9;
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;
  CLBarometerCalibrationContextManager *v11;
  _QWORD v12[2];
  unsigned int v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  if (*(_QWORD *)&self->_prevElevationAscended != __PAIR64__(a4, a3))
  {
    self->_sameElevationCounter = 0;
LABEL_5:
    v9 = 0;
    self->_prevElevationAscended = a3;
    self->_prevElevationDescended = a4;
    p_contextManagers = &self->_contextManagers;
    do
    {
      v11 = p_contextManagers->__elems_[v9];
      *(double *)&v12[1] = a5;
      v13 = a3;
      v14 = a4;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[CLBarometerCalibrationContextManager stepCountElevationNotification:](v11, "stepCountElevationNotification:", v12);
      ++v9;
    }
    while (v9 != 10);
    return;
  }
  sameElevationCounter = self->_sameElevationCounter;
  if (sameElevationCounter >= 10)
  {
    self->_sameElevationCounter = 10;
    return;
  }
  self->_sameElevationCounter = sameElevationCounter + 1;
  if (sameElevationCounter != 9)
    goto LABEL_5;
}

- (void)feedLocationData:(uint64_t)a3 data:(uint64_t)a4
{
  unsigned __int8 v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  double v16;
  uint64_t v17;
  int v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  char v27;
  double v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  int v32;
  void *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  int v42;
  const char *v43;
  uint8_t *v44;
  int v45;
  const char *v46;
  uint8_t *v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  _BYTE v52[688];
  std::__shared_weak_count *v53;
  std::__shared_weak_count *v54;
  void *__p;
  char v56;
  std::__shared_weak_count *v57;
  id v58;
  int v59;
  int v60;
  uint8_t buf[4];
  int v62;

  sub_10011D234((uint64_t)v52, a4);
  v6 = +[CLBarometerCalibrationSourceAggregator isLocationUsefulForCalibration:](CLBarometerCalibrationSourceAggregator, "isLocationUsefulForCalibration:", v52);

  v7 = v57;
  if (v57)
  {
    p_shared_owners = (unint64_t *)&v57->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v56 < 0)
    operator delete(__p);
  v10 = v54;
  if (v54)
  {
    v11 = (unint64_t *)&v54->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v53;
  if (!v53)
    goto LABEL_17;
  v14 = (unint64_t *)&v53->__shared_owners_;
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if ((v6 & 1) == 0)
      return;
  }
  else
  {
LABEL_17:
    if ((v6 & 1) == 0)
      return;
  }
  sub_1008141FC(&v50);
  v16 = *(double *)(a4 + 76);
  v17 = v50;
  *(double *)v50 = v16;
  *(_OWORD *)(v17 + 8) = *(_OWORD *)(a4 + 4);
  *(int8x16_t *)(v17 + 24) = vextq_s8(*(int8x16_t *)(a4 + 20), *(int8x16_t *)(a4 + 20), 8uLL);
  *(_QWORD *)(v17 + 40) = *(_QWORD *)(a4 + 36);
  v18 = *(_DWORD *)(a4 + 96);
  *(_DWORD *)(v17 + 100) = v18;
  *(_DWORD *)(v17 + 96) = *(_DWORD *)(a4 + 140);
  *(_DWORD *)(v17 + 104) = *(_DWORD *)(a4 + 216);
  *(_QWORD *)(v17 + 48) = *(_QWORD *)(a4 + 536);
  v19 = *(double *)(a4 + 544);
  *(double *)(v17 + 56) = v19;
  *(_OWORD *)(v17 + 64) = *(_OWORD *)(a4 + 520);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(a4 + 44);
  *(_OWORD *)(v17 + 112) = *(_OWORD *)(a4 + 704);
  *(_BYTE *)(v17 + 128) = 0;
  if (v18 == 1 && v19 > 0.0)
  {
    objc_msgSend(*(id *)(a1 + 536), "timestamp");
    if (vabdd_f64(v16, v20) < 5.0)
    {
      v21 = v50;
      if (*(_BYTE *)(a1 + 632))
        *(_WORD *)(v50 + 130) |= 2u;
      if (*(_DWORD *)(v21 + 104) == 2)
        *(_WORD *)(v21 + 130) |= 4u;
      objc_msgSend(*(id *)(a1 + 536), "accuracy");
      v23 = *(double *)(v50 + 48);
      v24 = v22 + 20.0 + *(double *)(v50 + 56);
      v25 = *(void **)(a1 + 536);
      if (*(_BYTE *)(a1 + 576))
      {
        objc_msgSend(v25, "altitude");
        if (v23 - v26 < v24 + -3.0)
        {
          v27 = 0;
LABEL_33:
          *(_BYTE *)(a1 + 576) = v27;
        }
      }
      else
      {
        objc_msgSend(v25, "altitude");
        if (v23 - v28 > v24)
        {
          v27 = 1;
          goto LABEL_33;
        }
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
      v29 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v30 = *(unsigned __int16 *)(v50 + 130);
        *(_DWORD *)buf = 67109120;
        v62 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "good DEM data: location altitude state is %u", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
        v45 = *(unsigned __int16 *)(v50 + 130);
        v59 = 67109120;
        v60 = v45;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "good DEM data: location altitude state is %u", &v59);
        v47 = (uint8_t *)v46;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim feedLocationData:data:]", "%s\n", v46);
        if (v47 != buf)
          free(v47);
      }
      goto LABEL_39;
    }
  }
  *(_BYTE *)(a1 + 576) = 0;
LABEL_39:
  if (*(_BYTE *)(a1 + 576))
    *(_WORD *)(v50 + 130) |= 1u;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
  v31 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
  {
    v32 = *(unsigned __int16 *)(v50 + 130);
    *(_DWORD *)buf = 67109120;
    v62 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "location altitude state %u", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
    v42 = *(unsigned __int16 *)(v50 + 130);
    v59 = 67109120;
    v60 = v42;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "location altitude state %u", &v59);
    v44 = (uint8_t *)v43;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim feedLocationData:data:]", "%s\n", v43);
    if (v44 != buf)
      free(v44);
  }
  v33 = *(void **)(a1 + 520);
  v48 = v50;
  v49 = v51;
  if (v51)
  {
    v34 = (unint64_t *)&v51->__shared_owners_;
    do
      v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
  }
  objc_msgSend(v33, "didUpdateSource:withData:", 0, &v48);
  v36 = v49;
  if (v49)
  {
    v37 = (unint64_t *)&v49->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  v39 = v51;
  if (v51)
  {
    v40 = (unint64_t *)&v51->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
}

- (void)feedPrefilteredLocationData:(uint64_t)a3 data:(uint64_t)a4
{
  unsigned __int8 v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD *v16;
  void *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _QWORD *v26;
  std::__shared_weak_count *v27;
  _QWORD *v28;
  std::__shared_weak_count *v29;
  _BYTE v30[688];
  std::__shared_weak_count *v31;
  std::__shared_weak_count *v32;
  void *__p;
  char v34;
  std::__shared_weak_count *v35;
  id v36;

  sub_10011D234((uint64_t)v30, a4);
  v6 = +[CLBarometerCalibrationSourceAggregator isLocationUsefulForCalibration:](CLBarometerCalibrationSourceAggregator, "isLocationUsefulForCalibration:", v30);

  v7 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v34 < 0)
    operator delete(__p);
  v10 = v32;
  if (v32)
  {
    v11 = (unint64_t *)&v32->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v31;
  if (!v31)
    goto LABEL_17;
  v14 = (unint64_t *)&v31->__shared_owners_;
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if ((v6 & 1) == 0)
      return;
  }
  else
  {
LABEL_17:
    if ((v6 & 1) == 0)
      return;
  }
  sub_1008141FC(&v28);
  v16 = v28;
  *v28 = *(_QWORD *)(a4 + 76);
  *(_OWORD *)(v16 + 1) = *(_OWORD *)(a4 + 4);
  *(int8x16_t *)(v16 + 3) = vextq_s8(*(int8x16_t *)(a4 + 20), *(int8x16_t *)(a4 + 20), 8uLL);
  v16[5] = *(_QWORD *)(a4 + 36);
  *((_DWORD *)v16 + 25) = *(_DWORD *)(a4 + 96);
  *((_DWORD *)v16 + 24) = *(_DWORD *)(a4 + 140);
  *((_DWORD *)v16 + 26) = *(_DWORD *)(a4 + 216);
  *((_OWORD *)v16 + 3) = *(_OWORD *)(a4 + 536);
  *((_OWORD *)v16 + 4) = *(_OWORD *)(a4 + 520);
  *((_OWORD *)v16 + 5) = *(_OWORD *)(a4 + 44);
  *((_OWORD *)v16 + 7) = *(_OWORD *)(a4 + 704);
  *((_BYTE *)v16 + 128) = 1;
  v17 = *(void **)(a1 + 520);
  v26 = v16;
  v27 = v29;
  if (v29)
  {
    v18 = (unint64_t *)&v29->__shared_owners_;
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  objc_msgSend(v17, "didUpdateSource:withData:", 6, &v26);
  v20 = v27;
  if (v27)
  {
    v21 = (unint64_t *)&v27->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = v29;
  if (v29)
  {
    v24 = (unint64_t *)&v29->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
}

- (void)didUpdateDataBuffer:(unint64_t)a3
{
  uint64_t v4;
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;

  v4 = 0;
  p_contextManagers = &self->_contextManagers;
  do
    -[CLBarometerCalibrationContextManager sourceUpdated:](p_contextManagers->__elems_[v4++], "sourceUpdated:", a3);
  while (v4 != 10);
}

- (void)stopTrack:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (objc_msgSend(a3, "fNotification") == (id)2)
  {
    objc_msgSend(a3, "fStartTime");
    v6 = v5;
    objc_msgSend(a3, "fEndTime");
    v8 = v7;
    objc_msgSend(a3, "fNextTrackStartTime");
    -[CLBarometerCalibrationSim updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:](self, "updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:", v6, v8, v9);
  }
}

- (void)absoluteAltitudeUpdate:(id)a3
{
  CLBarometerCalibrationAbsoluteAltitude *v5;
  CLElevationThresholdManager *thresholdManager;
  double v7;
  float v8;
  double v9;
  double v10;
  int v11;
  int v12;

  v5 = (CLBarometerCalibrationAbsoluteAltitude *)objc_msgSend(a3, "copy");
  self->_latestAbsoluteAltitude = v5;
  v11 = -8388609;
  v12 = 2139095039;
  thresholdManager = self->_thresholdManager;
  -[CLBarometerCalibrationAbsoluteAltitude altitude](v5, "altitude");
  v8 = v7;
  -[CLBarometerCalibrationAbsoluteAltitude accuracy](self->_latestAbsoluteAltitude, "accuracy");
  *(float *)&v10 = v9;
  *(float *)&v9 = v8;
  -[CLElevationThresholdManager updateWithAltitude:andAccuracy:upperBound:lowerBound:](thresholdManager, "updateWithAltitude:andAccuracy:upperBound:lowerBound:", &v12, &v11, v9, v10);
  -[CLBarometerCalibrationSim alertElevationAlertClientsOnChange](self, "alertElevationAlertClientsOnChange");
}

- (id)copyCurrentBias
{
  return -[CLBarometerCalibrationBiasEstimator copyCurrentBias](self->_biasEstimator, "copyCurrentBias");
}

- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
  -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:](self->_biasEstimator, "updateBiasUncertaintyWithPressure:andTime:andLat:andLon:", a3, a4, a5, a6);
}

- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
  -[CLBarometerCalibrationBiasEstimator updateEstimatedWeatherWithCumulativeAscendingDelta:andDescendingDelta:andIosTimestamp:](self->_biasEstimator, "updateEstimatedWeatherWithCumulativeAscendingDelta:andDescendingDelta:andIosTimestamp:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
}

- (void)initContextManagersForNotification:(unint64_t)a3
{
  CLBarometerCalibrationContextManager **v4;
  __objc2_class **v5;

  if (a3 == 1)
  {
    if (self->_contextManagers.__elems_[5])
      goto LABEL_8;
    v4 = &self->_contextManagers.__elems_[5];
    v5 = off_102125D90;
  }
  else
  {
    if (a3 != 2 || self->_contextManagers.__elems_[6])
      goto LABEL_8;
    v4 = &self->_contextManagers.__elems_[6];
    v5 = off_102125D98;
  }
  *v4 = (CLBarometerCalibrationContextManager *)objc_msgSend(objc_alloc(*v5), "initWithUniverse:delegate:withBuffer:withSourceAggregator:", 0, self, &self->fDataBuffers, self->_sourceAggregator);
LABEL_8:
  if (!self->_contextManagers.__elems_[7])
    self->_contextManagers.__elems_[7] = (CLBarometerCalibrationContextManager *)-[CLContextManagerWaterSubmersion initWithUniverse:delegate:withBuffer:withSourceAggregator:]([CLContextManagerWaterSubmersion alloc], "initWithUniverse:delegate:withBuffer:withSourceAggregator:", 0, self, &self->fDataBuffers, self->_sourceAggregator);
}

- (void)releaseContextManagersForNotification:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 2)
  {
    v3 = 488;
  }
  else
  {
    if (a3 != 1)
      return;
    v3 = 480;
  }
  -[CLBarometerCalibrationSim releaseAndClearManager:](self, "releaseAndClearManager:", (char *)self + v3);
}

- (void)releaseAndClearManager:(id *)a3
{
  if (*a3)
  {
    objc_msgSend(*a3, "cleanup");

    *a3 = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CLBarometerCalibrationSim releaseContextManagersForNotification:](self, "releaseContextManagersForNotification:", 2);
  -[CLBarometerCalibrationSim releaseContextManagersForNotification:](self, "releaseContextManagersForNotification:", 1);

  self->_biasEstimator = 0;
  self->_latestAbsoluteAltitude = 0;

  self->_thresholdManager = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBarometerCalibrationSim;
  -[CLBarometerCalibrationSim dealloc](&v3, "dealloc");
}

- (BOOL)inOutdoorWorkout
{
  return self->_inOutdoorWorkout;
}

- (BOOL)isInOutdoorWorkout:(int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if (a3 <= 19089)
  {
    if (a3 > 8 || ((1 << a3) & 0x150) == 0)
      return 0;
  }
  else
  {
    if (a3 > 90602)
    {
      if (a3 == 90603)
        return result;
      v4 = 519150;
    }
    else
    {
      if (a3 == 19090)
        return result;
      v4 = 19150;
    }
    if (a3 != v4)
      return 0;
  }
  return result;
}

- (void)onMotionStateObserverNotification:(int)a3 activityType:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  _BOOL4 inOutdoorWorkout;
  const char *v12;
  uint8_t *v13;
  _BOOL4 v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint8_t *v18;
  int v19;
  _BOOL4 v20;
  uint8_t buf[4];
  _BOOL4 v22;

  v4 = *(_QWORD *)&a4;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
  v7 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received workout activity.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
    LOWORD(v19) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "received workout activity.", &v19, 2);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim onMotionStateObserverNotification:activityType:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  if (!a3)
  {
    if (-[CLBarometerCalibrationSim isInOutdoorWorkout:](self, "isInOutdoorWorkout:", v4))
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
      v8 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v22 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "motion state observer updates,activityType,%d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
        v19 = 67109120;
        v20 = v4;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "motion state observer updates,activityType,%d", &v19);
        v18 = (uint8_t *)v17;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim onMotionStateObserverNotification:activityType:]", "%s\n", v17);
        if (v18 != buf)
          free(v18);
      }
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
    self->_inOutdoorWorkout = v9;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
    v10 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      inOutdoorWorkout = self->_inOutdoorWorkout;
      *(_DWORD *)buf = 67109120;
      v22 = inOutdoorWorkout;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "outdoor workout status updated,inOutdoorWorkout,%d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
      v14 = self->_inOutdoorWorkout;
      v19 = 67109120;
      v20 = v14;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "outdoor workout status updated,inOutdoorWorkout,%d", &v19);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim onMotionStateObserverNotification:activityType:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
}

- (void)feedEnclosureMaterial:(unint64_t)a3
{
  CLBarometerCalibrationContextManager *v3;

  v3 = self->_contextManagers.__elems_[7];
  if (v3)
    -[CLBarometerCalibrationContextManager feedEnclosureMaterial:](v3, "feedEnclosureMaterial:", a3);
}

- (BOOL)feedLoiData:(RoutineVisit *)a3
{
  NSDate *v6;
  NSDate *v7;
  BOOL v8;
  NSObject *v9;
  _BOOL4 inVisit;
  _BOOL4 v11;
  const char *v12;
  uint8_t *v13;
  _DWORD v14[4];
  uint8_t buf[4];
  _BOOL4 v16;

  if (a3->var2 == 0.0 && a3->var3 == 0.0)
    return 0;
  v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->var0);
  v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->var1);
  if ((-[NSDate isEqual:](v6, "isEqual:", +[NSDate distantPast](NSDate, "distantPast")) & 1) != 0
    || (-[NSDate isEqual:](v7, "isEqual:", +[NSDate distantFuture](NSDate, "distantFuture")) & 1) == 0)
  {
    if ((-[NSDate isEqual:](v6, "isEqual:", +[NSDate distantPast](NSDate, "distantPast")) & 1) != 0
      || (-[NSDate isEqual:](v7, "isEqual:", +[NSDate distantFuture](NSDate, "distantFuture")) & 1) != 0)
    {
      goto LABEL_11;
    }
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  self->_inVisit = v8;
LABEL_11:
  if ((-[NSDate isEqual:](v6, "isEqual:", +[NSDate distantPast](NSDate, "distantPast")) & 1) == 0
    && a3->var1 == 0.0)
  {
    self->_inVisit = 1;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
  v9 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    inVisit = self->_inVisit;
    *(_DWORD *)buf = 67109120;
    v16 = inVisit;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received visit for altimeter, inVisit, %d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021A5AB0);
    v11 = self->_inVisit;
    v14[0] = 67109120;
    v14[1] = v11;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "received visit for altimeter, inVisit, %d", v14);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim feedLoiData:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  -[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:](self->_biasEstimator, "updateVisitState:arrivalTime:departureTime:", self->_inVisit, a3->var0, a3->var1);
  return self->_inVisit;
}

- (void)feedLoiAltitude:()vector<CLBarometerCalibration_Types:(std::allocator<CLBarometerCalibration_Types::NormalDistribution>> *)a3 :NormalDistribution
{
  -[CLBarometerCalibrationBiasEstimator updateLoiInfo:](self->_biasEstimator, "updateLoiInfo:", a3);
}

- (BOOL)isInVisit
{
  return self->_inVisit;
}

- (id)latestAbsoluteAltitude
{
  return self->_latestAbsoluteAltitude;
}

- (void)announceMostRecentForcedGPS:(double)a3
{
  -[CLBarometerCalibrationBiasEstimator announceMostRecentForcedGPS:](self->_biasEstimator, "announceMostRecentForcedGPS:", a3);
}

- (void)surfacePressureCalibrationAtTime:(double)a3 andPressure:(double)a4 andLocation:(BOOL)a5
{
  _BOOL4 v5;
  char *v8;
  unint64_t *v9;
  CFAbsoluteTime Current;
  float v11;
  CLBarometerCalibrationSourceAggregator *sourceAggregator;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  char *v20;
  std::__shared_weak_count *v21;
  char *v22;
  std::__shared_weak_count *v23;

  v5 = a5;
  v8 = (char *)operator new(0x30uLL);
  *((_QWORD *)v8 + 1) = 0;
  v9 = (unint64_t *)(v8 + 8);
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = off_102167860;
  *(int64x2_t *)(v8 + 24) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *((_QWORD *)v8 + 5) = 3;
  v22 = v8 + 24;
  v23 = (std::__shared_weak_count *)v8;
  Current = CFAbsoluteTimeGetCurrent();
  *((_DWORD *)v8 + 10) = !v5;
  *((CFAbsoluteTime *)v8 + 3) = Current;
  *((double *)v8 + 4) = a4;
  if (vabdd_f64(self->_fCurrentPressureCalibration, a4) >= 3.0 || !self->_fWetState)
  {
    v11 = a4;
    self->_fCurrentPressureCalibration = v11;
    sourceAggregator = self->_sourceAggregator;
    v20 = v8 + 24;
    v21 = (std::__shared_weak_count *)v8;
    do
      v13 = __ldxr(v9);
    while (__stxr(v13 + 1, v9));
    -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:](sourceAggregator, "didUpdateSource:withData:", 7, &v20);
    v14 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

- (float)getSurfacePressure
{
  return self->_fCurrentPressureCalibration;
}

- (void)feedSubmersionState:(unsigned __int8)a3
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  CLBarometerCalibrationSourceAggregator *sourceAggregator;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD *v15;
  std::__shared_weak_count *v16;
  _QWORD *v17;
  std::__shared_weak_count *v18;

  v5 = (std::__shared_weak_count *)operator new(0x28uLL);
  v5->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)off_102167810;
  v5[1].__vftable = (std::__shared_weak_count_vtbl *)0x7FEFFFFFFFFFFFFFLL;
  v5[1].__shared_owners_ = 0;
  v17 = &v5[1].__vftable;
  v18 = v5;
  *(CFAbsoluteTime *)&v5[1].__vftable = CFAbsoluteTimeGetCurrent();
  LOBYTE(v5[1].__shared_owners_) = a3;
  sourceAggregator = self->_sourceAggregator;
  v15 = &v5[1].__vftable;
  v16 = v5;
  do
    v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
  -[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:](sourceAggregator, "didUpdateSource:withData:", 8, &v15);
  v9 = v16;
  if (v16)
  {
    v10 = (unint64_t *)&v16->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
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

- (BOOL)isInOutdoorWorkout
{
  return self->_inOutdoorWorkout;
}

- (void)setInOutdoorWorkout:(BOOL)a3
{
  self->_inOutdoorWorkout = a3;
}

- (double)getLastAltitude
{
  return self->_lastAltitude;
}

- (void)setLastAltitude:(double)a3
{
  self->_lastAltitude = a3;
}

- (double)getLastAltitudeAccuracy
{
  return self->_lastAltitudeAccuracy;
}

- (void)setLastAltitudeAccuracy:(double)a3
{
  self->_lastAltitudeAccuracy = a3;
}

- (double)getLastAltitudeTime
{
  return self->_lastAltitudeTime;
}

- (void)setLastAltitudeTime:(double)a3
{
  self->_lastAltitudeTime = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 392; i != -40; i -= 48)
    sub_1006F0FB8((Class *)((char *)&self->super.isa + i));
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_QWORD *)((char *)self + 588) = 0xFF7FFFFF7F7FFFFFLL;
  return self;
}

@end
