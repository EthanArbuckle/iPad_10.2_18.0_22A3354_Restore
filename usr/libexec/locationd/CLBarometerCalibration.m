@implementation CLBarometerCalibration

- (void)onOdometerNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  CFAbsoluteTime Current;
  uint64_t v15;
  int *p_sameElevationCounter;
  int v17;
  int v18;
  int sameElevationCounter;
  uint64_t v20;
  array<CLBarometerCalibrationContextManager *, 10UL> *v21;
  CLBarometerCalibrationContextManager *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;
  CLBarometerCalibrationContextManager *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  char *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _OWORD v56[12];
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  CFAbsoluteTime v67;
  uint64_t v68;
  char v69;
  int v70;
  uint64_t v71;
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;

  if (a3 != 8)
    return;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021681F8);
  v6 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v7 = *((_QWORD *)a4 + 1);
    v8 = *((_DWORD *)a4 + 4);
    v9 = *((_DWORD *)a4 + 5);
    v10 = *((unsigned __int16 *)a4 + 27);
    v11 = *((_DWORD *)a4 + 10);
    *(_DWORD *)buf = 134219008;
    v58 = v7;
    v59 = 1024;
    v60 = v8;
    v61 = 1024;
    v62 = v9;
    v63 = 1024;
    v64 = v10;
    v65 = 1024;
    v66 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "received odometer notification, startTime %f, elevationAscended %u, elevationDescended %u, failure mode %u, source %u", buf, 0x24u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v38 = *((_QWORD *)a4 + 1);
    v39 = *((_DWORD *)a4 + 4);
    v40 = *((_DWORD *)a4 + 5);
    v41 = *((unsigned __int16 *)a4 + 27);
    v42 = *((_DWORD *)a4 + 10);
    v70 = 134219008;
    v71 = v38;
    v72 = 1024;
    v73 = v39;
    v74 = 1024;
    v75 = v40;
    v76 = 1024;
    v77 = v41;
    v78 = 1024;
    v79 = v42;
    v43 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "received odometer notification, startTime %f, elevationAscended %u, elevationDescended %u, failure mode %u, source %u", COERCE_DOUBLE(&v70), 36, (_DWORD)v44, DWORD2(v44), (_DWORD)v45);
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration onOdometerNotification:data:]", "%s\n", v43);
    if (v43 != (char *)buf)
      free(v43);
  }
  v12 = -[CLWaterStateInterface isWaterStateON](self->waterStateInterface, "isWaterStateON");
  if ((sub_100195F08() & v12) == 1)
  {
    v13 = sub_1001FBB04(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 + 112) + 48))(v13 + 112, 1);
    if (self->_logHIDShower)
    {
      sub_1015EB864(buf);
      sub_1016048BC((uint64_t)buf);
      Current = CFAbsoluteTimeGetCurrent();
      v69 |= 1u;
      v67 = Current;
      v15 = v68;
      *(_BYTE *)(v68 + 20) |= 2u;
      *(_BYTE *)(v15 + 16) = 1;
      if (qword_1023118A8 != -1)
        dispatch_once(&qword_1023118A8, &stru_102168218);
      if (qword_1023118B0)
        sub_101888B64(qword_1023118B0, (uint64_t)buf);
      sub_1015EE304((PB::Base *)buf);
    }
  }
  sub_100197040();
  if (!sub_100195F08() || *((_DWORD *)a4 + 10) != 1)
  {
    sub_100197040();
    if (!sub_1000C4240() || *((_DWORD *)a4 + 10))
      return;
    if (self->_prevElevationAscended == *((_DWORD *)a4 + 4) && self->_prevElevationDescended == *((_DWORD *)a4 + 5))
    {
      p_sameElevationCounter = &self->_sameElevationCounter;
      sameElevationCounter = self->_sameElevationCounter;
      if (sameElevationCounter > 9)
        goto LABEL_25;
      *p_sameElevationCounter = sameElevationCounter + 1;
      if (sameElevationCounter == 9)
        return;
    }
    else
    {
      self->_sameElevationCounter = 0;
    }
    v29 = 0;
    self->_prevElevationAscended = *((_DWORD *)a4 + 4);
    self->_prevElevationDescended = *((_DWORD *)a4 + 5);
    p_contextManagers = &self->_contextManagers;
    do
    {
      v31 = p_contextManagers->__elems_[v29];
      v32 = *((_OWORD *)a4 + 9);
      v52 = *((_OWORD *)a4 + 8);
      v53 = v32;
      v33 = *((_OWORD *)a4 + 11);
      v54 = *((_OWORD *)a4 + 10);
      v55 = v33;
      v34 = *((_OWORD *)a4 + 5);
      v48 = *((_OWORD *)a4 + 4);
      v49 = v34;
      v35 = *((_OWORD *)a4 + 7);
      v50 = *((_OWORD *)a4 + 6);
      v51 = v35;
      v36 = *((_OWORD *)a4 + 1);
      v44 = *(_OWORD *)a4;
      v45 = v36;
      v37 = *((_OWORD *)a4 + 3);
      v46 = *((_OWORD *)a4 + 2);
      v47 = v37;
      -[CLBarometerCalibrationContextManager stepCountElevationNotification:](v31, "stepCountElevationNotification:", &v44);
      ++v29;
    }
    while (v29 != 10);
    return;
  }
  self->_isSensorWet = (*((_WORD *)a4 + 27) & 0x1000) != 0;
  sub_1018BF25C(buf, "BarometerWet", (unsigned __int8 *)&self->_isSensorWet, 0);
  self->_isSensorWet = buf[1];
  -[CLBarometerCalibration updateWetState](self, "updateWetState");
  if (self->_prevElevationAscended != *((_DWORD *)a4 + 4) || self->_prevElevationDescended != *((_DWORD *)a4 + 5))
  {
    v18 = 0;
    p_sameElevationCounter = &self->_sameElevationCounter;
    goto LABEL_27;
  }
  p_sameElevationCounter = &self->_sameElevationCounter;
  v17 = self->_sameElevationCounter;
  if (v17 > 9)
  {
LABEL_25:
    *p_sameElevationCounter = 10;
    return;
  }
  v18 = v17 + 1;
LABEL_27:
  *p_sameElevationCounter = v18;
  if (!self->_isSensorWet && v18 <= 9)
  {
    v20 = 0;
    self->_prevElevationAscended = *((_DWORD *)a4 + 4);
    self->_prevElevationDescended = *((_DWORD *)a4 + 5);
    v21 = &self->_contextManagers;
    do
    {
      v22 = v21->__elems_[v20];
      v23 = *((_OWORD *)a4 + 9);
      v56[8] = *((_OWORD *)a4 + 8);
      v56[9] = v23;
      v24 = *((_OWORD *)a4 + 11);
      v56[10] = *((_OWORD *)a4 + 10);
      v56[11] = v24;
      v25 = *((_OWORD *)a4 + 5);
      v56[4] = *((_OWORD *)a4 + 4);
      v56[5] = v25;
      v26 = *((_OWORD *)a4 + 7);
      v56[6] = *((_OWORD *)a4 + 6);
      v56[7] = v26;
      v27 = *((_OWORD *)a4 + 1);
      v56[0] = *(_OWORD *)a4;
      v56[1] = v27;
      v28 = *((_OWORD *)a4 + 3);
      v56[2] = *((_OWORD *)a4 + 2);
      v56[3] = v28;
      -[CLBarometerCalibrationContextManager stepCountElevationNotification:](v22, "stepCountElevationNotification:", v56);
      ++v20;
    }
    while (v20 != 10);
  }
}

- (void)didUpdateDataBuffer:(unint64_t)a3
{
  uint64_t v5;
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v15[4];
  uint64_t v16;
  uint64_t v17;

  v5 = 0;
  p_contextManagers = &self->_contextManagers;
  do
    -[CLBarometerCalibrationContextManager sourceUpdated:](p_contextManagers->__elems_[v5++], "sourceUpdated:", a3);
  while (v5 != 10);
  if (a3 == 1)
  {
    sub_100211128((uint64_t)v15, &self->fDataBuffers.__elems_[1].__map_.__first_);
    v7 = v17;
    v8 = (uint64_t *)(*(_QWORD *)(v15[1] + (((unint64_t)(v17 + v16 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (v17 + v16 - 1));
    v9 = *v8;
    v10 = (std::__shared_weak_count *)v8[1];
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
      v7 = v17;
    }
    if (v7)
      self->_mostRecentFilteredPressure = *(double *)(v9 + 8) * 1000.0;
    if (v10)
    {
      v13 = (unint64_t *)&v10->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    sub_1006F0FB8(v15);
  }
}

- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
  -[CLBarometerCalibrationBiasEstimator updateEstimatedWeatherWithCumulativeAscendingDelta:andDescendingDelta:andIosTimestamp:](self->_biasEstimator, "updateEstimatedWeatherWithCumulativeAscendingDelta:andDescendingDelta:andIosTimestamp:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
}

- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
  -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:](self->_biasEstimator, "updateBiasUncertaintyWithPressure:andTime:andLat:andLon:", a3, a4, a5, a6);
}

- (BOOL)isInVisit
{
  return self->_inVisit;
}

- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
  -[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:](self->_biasEstimator, "updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:", a3, a4, a5);
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_102306A00 != -1)
    dispatch_once(&qword_102306A00, &stru_102168140);
  return (id)qword_1023069F8;
}

- (CLBarometerCalibration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLBarometerCalibration;
  return -[CLBarometerCalibration initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLBarometerCalibrationProtocol, &OBJC_PROTOCOL___CLBarometerCalibrationClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_102306A10 != -1)
    dispatch_once(&qword_102306A10, &stru_102168160);
  return byte_102306A08;
}

+ (BOOL)isNotificationSupported:(unint64_t)a3
{
  int v4;
  unsigned __int8 v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unint64_t v12;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;

  sub_100197040();
  v4 = sub_10075D288();
  sub_100197040();
  if (v4)
    v5 = sub_1000C4240();
  else
    v5 = sub_100761D6C();
  v14 = v5;
  sub_1018BF25C(&v15, "BarometerCalibrationEnableFeature", &v14, 0);
  v6 = v16;
  v14 = 0;
  sub_1018BF25C(&v15, "AbsoluteAltitudeEnabled", &v14, 0);
  v7 = v16;
  v14 = 0;
  sub_1018BF25C(&v15, "AllowWaterSubmersionSimulation", &v14, 0);
  v8 = v16;
  v14 = 0;
  sub_1018BF25C(&v15, "AllowWaterSubmersionOverride", &v14, 0);
  switch(a3)
  {
    case 0uLL:
      v9 = (sub_1001E4BF4() >> 4) & 1;
      if (v6)
        LOBYTE(v10) = v9;
      else
        LOBYTE(v10) = 0;
      break;
    case 1uLL:
      if ((sub_1001E4BF4() & 0x10) == 0)
        goto LABEL_12;
      sub_100197040();
      if ((sub_1000C4240() & 1) != 0)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        sub_100197040();
        v12 = ((unint64_t)sub_1001B7910() >> 51) & 1;
        if (v7)
          LOBYTE(v10) = 1;
        else
          LOBYTE(v10) = v12;
      }
      break;
    case 2uLL:
      v10 = (sub_1001E4BF4() >> 4) & 1;
      break;
    case 3uLL:
      v11 = v16;
      LOBYTE(v10) = sub_100761DF0();
      if (v11 | v8)
        LOBYTE(v10) = 1;
      break;
    default:
LABEL_12:
      LOBYTE(v10) = 0;
      break;
  }
  return v10;
}

- (void)beginService
{
  CLWaterStateInterface *v3;
  CLBarometerCalibrationSourceAggregator *v4;
  uint64_t i;

  v3 = objc_alloc_init(CLWaterStateInterface);
  self->waterStateInterface = v3;
  -[CLWaterStateInterface connect](v3, "connect");
  v4 = -[CLBarometerCalibrationSourceAggregator initWithUniverse:buffers:]([CLBarometerCalibrationSourceAggregator alloc], "initWithUniverse:buffers:", -[CLBarometerCalibration universe](self, "universe"), &self->fDataBuffers);
  self->_sourceAggregator = v4;
  -[CLBarometerCalibrationSourceAggregator setDelegate:](v4, "setDelegate:", self);
  for (i = 0; i != 5; ++i)
    self->_clientSets[i] = objc_opt_new(NSMutableSet);
  *(_OWORD *)self->_contextManagers.__elems_ = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[2] = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[4] = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[6] = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[8] = 0u;
  if (+[CLBarometerCalibration isNotificationSupported:](CLBarometerCalibration, "isNotificationSupported:", 2))
  {
    -[CLBarometerCalibration initAllDayContextManagers](self, "initAllDayContextManagers");
    -[CLBarometerCalibration universe](self, "universe");
    sub_1004FAEDC();
  }
  -[CLBarometerCalibration universe](self, "universe");
  sub_100647FA8();
}

- (void)endService
{
  uint64_t i;

  -[CLBarometerCalibration releaseAllContextManagers](self, "releaseAllContextManagers");
  for (i = 0; i != 5; ++i)

  self->_biasEstimator = 0;
  self->_latestAbsoluteAltitude = 0;
  -[CLTimer invalidate](self->_releaseAltimeterContextTimer, "invalidate");

  self->_releaseAltimeterContextTimer = 0;
  -[CLTimer invalidate](self->_fetchRoutineVisitsTimer, "invalidate");

  self->_fetchRoutineVisitsTimer = 0;
  -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:](self->_routineMonitorProxy, "stopLeechingVisitsForClient:", self);

  -[CLWaterStateInterface disconnect](self->waterStateInterface, "disconnect");
  self->_thresholdManager = 0;
}

- (void)releaseAndClearManager:(id *)a3
{
  if (*a3)
  {
    objc_msgSend(*a3, "cleanup");

    *a3 = 0;
  }
}

- (void)initContextManagersForNotification:(unint64_t)a3
{
  CLBarometerCalibrationContextManager **v3;
  __objc2_class **v4;

  switch(a3)
  {
    case 0uLL:
      v3 = &self->_contextManagers.__elems_[3];
      if (self->_contextManagers.__elems_[3])
        return;
      v4 = off_102125DA0;
      goto LABEL_10;
    case 2uLL:
      v3 = &self->_contextManagers.__elems_[6];
      if (self->_contextManagers.__elems_[6])
        return;
      v4 = off_102125D98;
      goto LABEL_10;
    case 1uLL:
      v3 = &self->_contextManagers.__elems_[5];
      if (!self->_contextManagers.__elems_[5])
      {
        v4 = off_102125D90;
LABEL_10:
        *v3 = (CLBarometerCalibrationContextManager *)objc_msgSend(objc_alloc(*v4), "initWithUniverse:delegate:withBuffer:withSourceAggregator:", -[CLBarometerCalibration universe](self, "universe"), self, &self->fDataBuffers, self->_sourceAggregator);
      }
      break;
  }
}

- (void)releaseContextManagersForNotification:(unint64_t)a3
{
  uint64_t v3;

  if (a3)
  {
    if (a3 != 2)
      return;
    v3 = 6;
  }
  else
  {
    v3 = 3;
  }
  -[CLBarometerCalibration releaseAndClearManager:](self, "releaseAndClearManager:", &self->_contextManagers.__elems_[v3]);
}

- (void)releaseAllContextManagers
{
  uint64_t v3;
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;

  v3 = 0;
  p_contextManagers = &self->_contextManagers;
  do
  {
    -[CLBarometerCalibration releaseAndClearManager:](self, "releaseAndClearManager:", (char *)p_contextManagers + v3);
    v3 += 8;
  }
  while (v3 != 80);
}

- (void)initAllDayContextManagers
{
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;
  CLBarometerCalibrationContextManager **v4;
  CLBarometerCalibrationContextManager *v5;
  __objc2_class **v6;
  int v7;
  int v8;
  CLBarometerCalibrationContextManager *v9;
  unsigned __int8 v10;
  unsigned __int8 v11[3];
  unsigned __int8 v12;
  unsigned __int8 v13[3];

  p_contextManagers = &self->_contextManagers;
  if (!self->_contextManagers.__elems_[6])
    self->_contextManagers.__elems_[6] = (CLBarometerCalibrationContextManager *)-[CLContextManagerBiasEstimationScheduler initWithUniverse:delegate:withBuffer:withSourceAggregator:]([CLContextManagerBiasEstimationScheduler alloc], "initWithUniverse:delegate:withBuffer:withSourceAggregator:", -[CLBarometerCalibration universe](self, "universe"), self, &self->fDataBuffers, self->_sourceAggregator);
  if (!p_contextManagers->__elems_[9])
    p_contextManagers->__elems_[9] = (CLBarometerCalibrationContextManager *)-[CLContextManagerElevationProfile initWithUniverse:delegate:withBuffer:withSourceAggregator:]([CLContextManagerElevationProfile alloc], "initWithUniverse:delegate:withBuffer:withSourceAggregator:", -[CLBarometerCalibration universe](self, "universe"), self, &self->fDataBuffers, self->_sourceAggregator);
  v12 = 0;
  sub_1018BF25C(v13, "AllowWaterSubmersionSimulation", &v12, 0);
  if (v13[1])
  {
    v5 = p_contextManagers->__elems_[8];
    v4 = &p_contextManagers->__elems_[8];
    if (v5)
      return;
    v6 = &off_102125DB0;
    goto LABEL_12;
  }
  v10 = 0;
  sub_1018BF25C(v11, "AllowWaterSubmersionOverride", &v10, 0);
  v7 = v11[1];
  v8 = sub_100761DF0();
  if (v7 || v8)
  {
    v9 = p_contextManagers->__elems_[7];
    v4 = &p_contextManagers->__elems_[7];
    if (!v9)
    {
      v6 = off_102125DA8;
LABEL_12:
      *v4 = (CLBarometerCalibrationContextManager *)objc_msgSend(objc_alloc(*v6), "initWithUniverse:delegate:withBuffer:withSourceAggregator:", -[CLBarometerCalibration universe](self, "universe"), self, &self->fDataBuffers, self->_sourceAggregator);
    }
  }
}

- (void)registerClient:(id)a3 forNotification:(unint64_t)a4
{
  NSMutableSet *v7;
  double Current;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint8_t *v30;
  double v31;
  int v32;
  unint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint8_t buf[4];
  _BYTE v39[34];

  if (+[CLBarometerCalibration isNotificationSupported:](CLBarometerCalibration, "isNotificationSupported:", a4))
  {
    v7 = self->_clientSets[a4];
    -[NSMutableSet addObject:](v7, "addObject:", a3);
    if (-[NSMutableSet count](v7, "count") == (id)1)
      -[CLBarometerCalibration initContextManagersForNotification:](self, "initContextManagersForNotification:", a4);
    if (a4 == 1)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v9 = sub_1001FBB04(0);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v9 + 112) + 16))(v9 + 112, 0);
      -[CLTimer invalidate](self->_releaseAltimeterContextTimer, "invalidate");
      v10 = -[CLBarometerCalibration copyCurrentBias](self, "copyCurrentBias");
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "timestamp");
        if (v12 != 1.79769313e308 && self->_lastAltimeterClientRegisterTime != 1.79769313e308)
        {
          objc_msgSend(v11, "uncertaintyInMeters");
          -[CLBarometerCalibration sendClientRegisterAnalyticsWithCurrentUncertainty:andTime:](self, "sendClientRegisterAnalyticsWithCurrentUncertainty:andTime:");
        }
      }
      self->_lastAltimeterClientRegisterTime = Current;

      -[CLBarometerCalibrationAbsoluteAltitude timestamp](self->_latestAbsoluteAltitude, "timestamp");
      if (v16 != 1.79769313e308)
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021681F8);
        v17 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
        {
          -[CLBarometerCalibrationAbsoluteAltitude altitude](self->_latestAbsoluteAltitude, "altitude");
          v19 = v18;
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](self->_latestAbsoluteAltitude, "timestamp");
          *(_DWORD *)buf = 134218496;
          *(double *)v39 = Current;
          *(_WORD *)&v39[8] = 2048;
          *(_QWORD *)&v39[10] = v19;
          *(_WORD *)&v39[18] = 2048;
          *(_QWORD *)&v39[20] = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Send cached altitude to client,timestamp,%f,altitude,%f,altitudeTimestamp,%f", buf, 0x20u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021681F8);
          v25 = qword_10229FE88;
          -[CLBarometerCalibrationAbsoluteAltitude altitude](self->_latestAbsoluteAltitude, "altitude");
          v27 = v26;
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](self->_latestAbsoluteAltitude, "timestamp");
          v32 = 134218496;
          v33 = *(_QWORD *)&Current;
          v34 = 2048;
          v35 = v27;
          v36 = 2048;
          v37 = v28;
          LODWORD(v31) = 32;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v25, 1, "Send cached altitude to client,timestamp,%f,altitude,%f,altitudeTimestamp,%f", COERCE_DOUBLE(&v32), v31);
          v30 = (uint8_t *)v29;
          sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration registerClient:forNotification:]", "%s\n", v29);
          if (v30 != buf)
            free(v30);
        }
        objc_msgSend(a3, "onAbsoluteAltitudeUpdate:", self->_latestAbsoluteAltitude);
      }
    }
    v21 = 0;
    p_contextManagers = &self->_contextManagers;
    do
      -[CLBarometerCalibrationContextManager clientConnected:withNotification:](p_contextManagers->__elems_[v21++], "clientConnected:withNotification:", a3, a4);
    while (v21 != 10);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v23 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v24 = -[NSMutableSet count](v7, "count");
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)v39 = 0;
      *(_WORD *)&v39[4] = 2082;
      *(_QWORD *)&v39[6] = "";
      *(_WORD *)&v39[14] = 2050;
      *(_QWORD *)&v39[16] = a4;
      *(_WORD *)&v39[24] = 2050;
      *(_QWORD *)&v39[26] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"registerClient\", \"notification\":%{public}ld, \"newCount\":%{public}ld}", buf, 0x26u);
    }
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v13 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v39 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "registerClient: notification %ld is not supported\n", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      v32 = 134217984;
      v33 = a4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "registerClient: notification %ld is not supported\n", &v32);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 0, "-[CLBarometerCalibration registerClient:forNotification:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
  }
}

- (void)unregisterClient:(id)a3 forNotification:(unint64_t)a4
{
  NSMutableSet *v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  id v15;

  v6 = self->_clientSets[a4];
  -[NSMutableSet removeObject:](v6, "removeObject:", a3);
  if (!-[NSMutableSet count](v6, "count"))
  {
    if (a4 == 1)
    {
      v7 = sub_1001FBB04(0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 + 112) + 16))(v7 + 112, 1);
      -[CLBarometerCalibration setAltimeterReleaseTimer](self, "setAltimeterReleaseTimer");
    }
    -[CLBarometerCalibration releaseContextManagersForNotification:](self, "releaseContextManagersForNotification:", a4);
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021681F8);
  v8 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289538;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2050;
    v13 = a4;
    v14 = 2050;
    v15 = -[NSMutableSet count](v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"unregisterClient\", \"notification\":%{public}ld, \"newCount\":%{public}ld}", (uint8_t *)v9, 0x26u);
  }
}

- (void)acknowledgeNotification:(unint64_t)a3
{
  uint64_t v4;
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;

  v4 = 0;
  p_contextManagers = &self->_contextManagers;
  do
    -[CLBarometerCalibrationContextManager notificationAcknowledged:](p_contextManagers->__elems_[v4++], "notificationAcknowledged:", a3);
  while (v4 != 10);
}

- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7
{
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;
  CLBarometerCalibrationContextManager *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  _WORD v18[8];
  uint8_t buf[1640];

  p_contextManagers = &self->_contextManagers;
  v13 = self->_contextManagers.__elems_[9];
  v14 = objc_opt_class(CLContextManagerElevationProfile, a2);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    -[CLBarometerCalibrationContextManager queryElevationsFromDate:toDate:withBatchSize:fromRecordId:withReply:](p_contextManagers->__elems_[9], "queryElevationsFromDate:toDate:withBatchSize:fromRecordId:withReply:", a3, a4, a5, a6, a7);
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v15 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "queryElevationsFromDate,elevation profile context manager does not exist!", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      v18[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "queryElevationsFromDate,elevation profile context manager does not exist!", v18, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 0, "-[CLBarometerCalibration queryElevationsFromDate:toDate:withBatchSize:fromRecordId:withReply:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
  }
}

- (void)registerClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4
{
  float var1;
  float v7;
  CFAbsoluteTime Current;
  double v9;

  var1 = a4.var1;
  v7 = var1;
  -[CLElevationThresholdManager insertClient:withThreshold:](self->_thresholdManager, "insertClient:withThreshold:", a4.var0);
  if (self->_logElevationThresholds)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v9 = Current;
    *(float *)&Current = var1;
    -[CLBarometerCalibration writeThresholdToMsl:withTimestamp:andClientId:active:](self, "writeThresholdToMsl:withTimestamp:andClientId:active:", a3, 1, Current, v9);
  }
}

- (void)unregisterClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4
{
  double var1;
  float v7;
  CFAbsoluteTime Current;
  double v9;

  var1 = a4.var1;
  if (-[CLElevationThresholdManager removeClient:](self->_thresholdManager, "removeClient:", a4.var0))
  {
    if (self->_logElevationThresholds)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v9 = Current;
      v7 = var1;
      *(float *)&Current = v7;
      -[CLBarometerCalibration writeThresholdToMsl:withTimestamp:andClientId:active:](self, "writeThresholdToMsl:withTimestamp:andClientId:active:", a3, 0, Current, v9);
    }
  }
}

- (void)startTrack:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  unsigned int v12;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021681F8);
  v4 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a3, "fStartTime");
    v6[0] = 68289539;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2049;
    v10 = v5;
    v11 = 1025;
    v12 = objc_msgSend(a3, "fType");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLBarometerCalibration track started\", \"time\":\"%{private}f\", \"type\":%{private}d}", (uint8_t *)v6, 0x22u);
  }
}

- (void)stopTrack:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CLBarometerCalibrationSourceAggregator *sourceAggregator;
  id v13;
  id v14;
  uint64_t i;
  NSMutableSet *v16;
  id v17;
  uint64_t v18;
  void *j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[27];
  _BYTE v25[128];
  uint64_t buf;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  unsigned int v32;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021681F8);
  v5 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a3, "fEndTime");
    buf = 68289539;
    v27 = 2082;
    v28 = "";
    v29 = 2049;
    v30 = v6;
    v31 = 1025;
    v32 = objc_msgSend(a3, "fType");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLBarometerCalibration track stopped\", \"time\":\"%{private}f\", \"type\":%{private}d}", (uint8_t *)&buf, 0x22u);
  }
  if (objc_msgSend(a3, "fNotification") == (id)2)
  {
    objc_msgSend(a3, "fStartTime");
    v8 = v7;
    objc_msgSend(a3, "fEndTime");
    v10 = v9;
    objc_msgSend(a3, "fNextTrackStartTime");
    -[CLBarometerCalibration updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:](self, "updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:", v8, v10, v11);
  }
  sourceAggregator = self->_sourceAggregator;
  v13 = objc_msgSend(a3, "fType");
  if (sourceAggregator)
    -[CLBarometerCalibrationSourceAggregator copyDataBuffersForTrack:](sourceAggregator, "copyDataBuffersForTrack:", v13);
  else
    memset(v24, 0, sizeof(v24));
  v14 = sub_100AB3C5C((uint64_t)v24);
  for (i = 24; i != -3; i -= 3)
    sub_1006F0FB8(&v24[i]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v16 = self->_clientSets[(_QWORD)objc_msgSend(a3, "fNotification", 0)];
  v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), "onBarometerCalibrationNotification:track:data:", objc_msgSend(a3, "fNotification"), a3, v14);
      }
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v17);
  }
}

- (void)absoluteAltitudeUpdate:(id)a3
{
  CLBarometerCalibrationAbsoluteAltitude *v5;
  double v6;
  double v7;
  double v8;
  NSMutableSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  CLElevationThresholdManager *thresholdManager;
  double v15;
  float v16;
  double v17;
  double v18;
  uint64_t v19;
  float v20;
  float v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = (CLBarometerCalibrationAbsoluteAltitude *)objc_msgSend(a3, "copy");
  self->_latestAbsoluteAltitude = v5;
  -[CLBarometerCalibrationAbsoluteAltitude altitude](v5, "altitude");
  self->_lastAltitude = v6;
  -[CLBarometerCalibrationAbsoluteAltitude accuracy](self->_latestAbsoluteAltitude, "accuracy");
  self->_lastAltitudeAccuracy = v7;
  -[CLBarometerCalibrationAbsoluteAltitude timestamp](self->_latestAbsoluteAltitude, "timestamp");
  self->_lastAltitudeTime = v8;
  objc_msgSend(a3, "setFilteredPressure:", self->_mostRecentFilteredPressure);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = self->_clientSets[1];
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "onAbsoluteAltitudeUpdate:", a3);
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }
  v20 = -3.4028e38;
  v21 = 3.4028e38;
  thresholdManager = self->_thresholdManager;
  -[CLBarometerCalibrationAbsoluteAltitude altitude](self->_latestAbsoluteAltitude, "altitude");
  v16 = v15;
  -[CLBarometerCalibrationAbsoluteAltitude accuracy](self->_latestAbsoluteAltitude, "accuracy");
  *(float *)&v18 = v17;
  *(float *)&v17 = v16;
  LODWORD(thresholdManager) = -[CLElevationThresholdManager updateWithAltitude:andAccuracy:upperBound:lowerBound:](thresholdManager, "updateWithAltitude:andAccuracy:upperBound:lowerBound:", &v21, &v20, v17, v18);
  -[CLBarometerCalibration alertElevationAlertClientsOnChange](self, "alertElevationAlertClientsOnChange");
  if ((_DWORD)thresholdManager)
  {
    v19 = sub_1001FBB04(0);
    (*(void (**)(uint64_t, float, float))(*(_QWORD *)(v19 + 112) + 80))(v19 + 112, v20, v21);
  }
}

- (void)submersionStateUpdate:(id)a3
{
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_clientSets[3];
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "onSubmersionStateUpdate:", a3);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)submersionMeasurementUpdate:(id)a3
{
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_clientSets[3];
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "onSubmersionMeasurementUpdate:", a3);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)logBuffers
{
  NSMutableString *v3;
  array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>, 9UL> *p_fDataBuffers;
  void **begin;
  unint64_t start;
  void **v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  NSObject *v14;
  id v15;
  unint64_t *v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint8_t *v22;
  NSObject *v23;
  id v24;
  void **v25;
  unint64_t v26;
  unint64_t value;
  void **v28;
  char *v29;
  uint64_t v30;
  _QWORD *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  NSObject *v35;
  id v36;
  unint64_t *v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint8_t *v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint8_t *v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint8_t *v53;
  int v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int128 v58;

  v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("Location: "));
  p_fDataBuffers = &self->fDataBuffers;
  begin = self->fDataBuffers.__elems_[0].__map_.__begin_;
  if (self->fDataBuffers.__elems_[0].__map_.__end_ != begin)
  {
    start = self->fDataBuffers.__elems_[0].__start_;
    v7 = &begin[start >> 8];
    v8 = (char *)*v7 + 16 * start;
    v9 = *(uint64_t *)((char *)begin
                    + (((self->fDataBuffers.__elems_[0].__size_.__value_ + start) >> 5) & 0x7FFFFFFFFFFFFF8))
       + 16 * (LOBYTE(self->fDataBuffers.__elems_[0].__size_.__value_) + start);
    while (v8 != (char *)v9)
    {
      v10 = *(_QWORD **)v8;
      v11 = (std::__shared_weak_count *)*((_QWORD *)v8 + 1);
      *(_QWORD *)&v58 = *(_QWORD *)v8;
      *((_QWORD *)&v58 + 1) = v11;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
      }
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("time,%f,lat,%f,long,%f,"), *v10, v10[1], v10[2]);
      if ((unint64_t)-[NSMutableString length](v3, "length") >= 0x3C1)
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021681F8);
        v14 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
        {
          v15 = -[NSMutableString UTF8String](v3, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v57 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021681F8);
          v19 = qword_10229FE88;
          v20 = -[NSMutableString UTF8String](v3, "UTF8String");
          v54 = 136315138;
          v55 = v20;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "%s", (const char *)&v54);
          v22 = (uint8_t *)v21;
          sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration logBuffers]", "%s\n", v21);
          if (v22 != buf)
            free(v22);
        }
        -[NSMutableString setString:](v3, "setString:", CFSTR("GPS: "));
      }
      if (v11)
      {
        v16 = (unint64_t *)&v11->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      v8 += 16;
      if (v8 - (_BYTE *)*v7 == 4096)
      {
        v18 = (char *)v7[1];
        ++v7;
        v8 = v18;
      }
    }
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021681F8);
  v23 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v24 = -[NSMutableString UTF8String](v3, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v57 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v46 = qword_10229FE88;
    v47 = -[NSMutableString UTF8String](v3, "UTF8String");
    LODWORD(v58) = 136315138;
    *(_QWORD *)((char *)&v58 + 4) = v47;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v46, 2, "%s", (const char *)&v58);
    v49 = (uint8_t *)v48;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration logBuffers]", "%s\n", v48);
    if (v49 != buf)
      free(v49);
  }
  -[NSMutableString setString:](v3, "setString:", CFSTR("Pressure: "));
  v25 = p_fDataBuffers->__elems_[1].__map_.__begin_;
  if (p_fDataBuffers->__elems_[1].__map_.__end_ != v25)
  {
    v26 = p_fDataBuffers->__elems_[1].__start_;
    value = p_fDataBuffers->__elems_[1].__size_.__value_;
    v28 = &v25[v26 >> 8];
    v29 = (char *)*v28 + 16 * v26;
    v30 = *(uint64_t *)((char *)v25 + (((value + v26) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (value + v26);
    while (v29 != (char *)v30)
    {
      v31 = *(_QWORD **)v29;
      v32 = (std::__shared_weak_count *)*((_QWORD *)v29 + 1);
      *(_QWORD *)&v58 = *(_QWORD *)v29;
      *((_QWORD *)&v58 + 1) = v32;
      if (v32)
      {
        v33 = (unint64_t *)&v32->__shared_owners_;
        do
          v34 = __ldxr(v33);
        while (__stxr(v34 + 1, v33));
      }
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("time,%f,pressure,%f,temp,%f,"), *v31, v31[1], v31[2]);
      if ((unint64_t)-[NSMutableString length](v3, "length") >= 0x3C1)
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021681F8);
        v35 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
        {
          v36 = -[NSMutableString UTF8String](v3, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v57 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021681F8);
          v40 = qword_10229FE88;
          v41 = -[NSMutableString UTF8String](v3, "UTF8String");
          v54 = 136315138;
          v55 = v41;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v40, 2, "%s", (const char *)&v54);
          v43 = (uint8_t *)v42;
          sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration logBuffers]", "%s\n", v42);
          if (v43 != buf)
            free(v43);
        }
        -[NSMutableString setString:](v3, "setString:", CFSTR("Pressure: "));
      }
      if (v32)
      {
        v37 = (unint64_t *)&v32->__shared_owners_;
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
      v29 += 16;
      if (v29 - (_BYTE *)*v28 == 4096)
      {
        v39 = (char *)v28[1];
        ++v28;
        v29 = v39;
      }
    }
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021681F8);
  v44 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v45 = -[NSMutableString UTF8String](v3, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v57 = v45;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v50 = qword_10229FE88;
    v51 = -[NSMutableString UTF8String](v3, "UTF8String");
    LODWORD(v58) = 136315138;
    *(_QWORD *)((char *)&v58 + 4) = v51;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v50, 2, "%s", (const char *)&v58);
    v53 = (uint8_t *)v52;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration logBuffers]", "%s\n", v52);
    if (v53 != buf)
      free(v53);
  }
}

- (id)copyCurrentBias
{
  return -[CLBarometerCalibrationBiasEstimator copyCurrentBias](self->_biasEstimator, "copyCurrentBias");
}

- (BOOL)isInOutdoorWorkout:(NotificationData *)a3
{
  int v3;
  BOOL result;
  BOOL v5;
  int v6;
  BOOL v7;
  int v8;

  v3 = *((_DWORD *)a3 + 2);
  result = 1;
  if (v3 <= 19089)
  {
    v7 = v3 > 8;
    v8 = (1 << v3) & 0x150;
    if (v7 || v8 == 0)
      return 0;
  }
  else
  {
    if (v3 > 90602)
    {
      v5 = v3 == 90603;
      v6 = 519150;
    }
    else
    {
      v5 = v3 == 19090;
      v6 = 19150;
    }
    if (!v5 && v3 != v6)
      return 0;
  }
  return result;
}

- (void)onMotionStateObserverNotification:(int)a3 data:(NotificationData *)a4
{
  __int128 v7;
  _BOOL8 v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *v13;
  unsigned int v14;
  NSObject *v15;
  CFAbsoluteTime Current;
  uint64_t v17;
  int v18;
  uint64_t v19;
  const char *v20;
  uint8_t *v21;
  uint64_t v22;
  unsigned int v23;
  const char *v24;
  uint8_t *v25;
  uint64_t v26;
  int v27;
  int v28;
  const char *v29;
  uint8_t *v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  CFAbsoluteTime v38;
  uint64_t v39;
  char v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  _OWORD v47[2];
  int v48;

  if (!a3)
  {
    v7 = *((_OWORD *)a4 + 1);
    v47[0] = *(_OWORD *)a4;
    v47[1] = v7;
    v48 = *((_DWORD *)a4 + 8);
    v8 = -[CLBarometerCalibration isInOutdoorWorkout:](self, "isInOutdoorWorkout:", v47);
    if (v8)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      v9 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v10 = *(_QWORD *)a4;
        v11 = *((_DWORD *)a4 + 2);
        v12 = *((_DWORD *)a4 + 3);
        *(_DWORD *)buf = 134218496;
        v33 = v10;
        v34 = 1024;
        v35 = v11;
        v36 = 1024;
        v37 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "motion state observer updates,time,%f,activityType,%d,predictedWorkoutType,%d", buf, 0x18u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021681F8);
        v26 = *(_QWORD *)a4;
        v27 = *((_DWORD *)a4 + 2);
        v28 = *((_DWORD *)a4 + 3);
        v41 = 134218496;
        v42 = v26;
        v43 = 1024;
        v44 = v27;
        v45 = 1024;
        v46 = v28;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "motion state observer updates,time,%f,activityType,%d,predictedWorkoutType,%d", COERCE_DOUBLE(&v41), 24);
        v30 = (uint8_t *)v29;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration onMotionStateObserverNotification:data:]", "%s\n", v29);
        if (v30 != buf)
          free(v30);
      }
    }
    -[CLBarometerCalibration setInOutdoorWorkout:](self, "setInOutdoorWorkout:", v8);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v13 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[CLBarometerCalibration isInOutdoorWorkout](self, "isInOutdoorWorkout");
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "outdoor workout status updated,inOutdoorWorkout,%d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      v22 = qword_10229FE88;
      v23 = -[CLBarometerCalibration isInOutdoorWorkout](self, "isInOutdoorWorkout");
      v41 = 67109120;
      LODWORD(v42) = v23;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v22, 0, "outdoor workout status updated,inOutdoorWorkout,%d", &v41);
      v25 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration onMotionStateObserverNotification:data:]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
  }
  if (self->_logWorkoutActivity)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v15 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "write workout activity to msl.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      LOWORD(v41) = 0;
      LODWORD(v31) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "write workout activity to msl.", &v41, v31);
      v21 = (uint8_t *)v20;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration onMotionStateObserverNotification:data:]", "%s\n", v20);
      if (v21 != buf)
        free(v21);
    }
    sub_1015EB864(buf);
    sub_101604664((uint64_t)buf);
    Current = CFAbsoluteTimeGetCurrent();
    v40 |= 1u;
    v38 = Current;
    v17 = v39;
    v18 = *((_DWORD *)a4 + 2);
    *(_BYTE *)(v39 + 16) |= 1u;
    *(_DWORD *)(v17 + 8) = v18;
    v19 = v39;
    *(_BYTE *)(v39 + 16) |= 2u;
    *(_DWORD *)(v19 + 12) = a3;
    if (qword_1023118A8 != -1)
      dispatch_once(&qword_1023118A8, &stru_102168218);
    if (qword_1023118B0)
      sub_101888B64(qword_1023118B0, (uint64_t)buf);
    sub_1015EE304((PB::Base *)buf);
  }
}

- (void)onMotionStateMediatorNotification:(int)a3 data:(NotificationData *)a4
{
  uint64_t v8;
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;
  CLBarometerCalibrationContextManager *v10;
  _BYTE __dst[320];

  if (a3 == 2)
  {
    v8 = 0;
    p_contextManagers = &self->_contextManagers;
    do
    {
      v10 = p_contextManagers->__elems_[v8];
      memcpy(__dst, a4, sizeof(__dst));
      -[CLBarometerCalibrationContextManager onMotionStateMediatorData:](v10, "onMotionStateMediatorData:", __dst);
      ++v8;
    }
    while (v8 != 10);
  }
}

- (void)onDaemonStatusNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint8_t *v12;
  double v13;
  _DWORD v14[2];
  __int16 v15;
  CFAbsoluteTime v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  CFAbsoluteTime Current;

  if (a3 == 7 && self->_charging != *((unsigned __int8 *)a4 + 9))
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v6 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *((unsigned __int8 *)a4 + 9);
      *(_DWORD *)buf = 67109376;
      v18 = v7;
      v19 = 2048;
      Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "charging on puck,%d,timestamp,%f", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      v9 = qword_10229FE88;
      v10 = *((unsigned __int8 *)a4 + 9);
      v14[0] = 67109376;
      v14[1] = v10;
      v15 = 2048;
      v16 = CFAbsoluteTimeGetCurrent();
      LODWORD(v13) = 18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "charging on puck,%d,timestamp,%f", v14, v13);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration onDaemonStatusNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    v8 = 0;
    self->_charging = *((_BYTE *)a4 + 9);
    do
      -[CLBarometerCalibrationContextManager onCharger:](self->_contextManagers.__elems_[v8++], "onCharger:", self->_charging);
    while (v8 != 10);
  }
}

- (void)onMobileAssetNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v5;
  void **v6;
  uint64_t v7;
  NSObject *v8;
  void **v9;
  const char *v10;
  uint8_t *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  void *__p[2];
  uint64_t v16;
  int v17;
  void **v18;
  uint8_t buf[4];
  uint64_t v20;
  float v21[407];

  if (a3 == 7)
  {
    __p[0] = 0;
    __p[1] = 0;
    v16 = 0;
    (*(void (**)(NotificationData *, void **))(*(_QWORD *)a4 + 800))(a4, __p);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v5 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v6 = __p;
      if (v16 < 0)
        v6 = (void **)__p[0];
      *(_DWORD *)buf = 136446210;
      v20 = (uint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received config %{public}s", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      v9 = __p;
      if (v16 < 0)
        v9 = (void **)__p[0];
      v17 = 136446210;
      v18 = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "received config %{public}s", &v17, 12);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration onMobileAssetNotification:data:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    if (sub_10011A5AC((uint64_t)a4))
    {
      buf[0] = 1;
      v20 = 0x42C8000045A8C000;
      v21[0] = 0.1;
      sub_1001E48E4((uint64_t)a4, (uint64_t)CFSTR("useShowerDetector"), (BOOL *)buf);
      sub_10052688C((uint64_t)a4, (uint64_t)CFSTR("wetTimeout"), (float *)&v20);
      sub_10052688C((uint64_t)a4, (uint64_t)CFSTR("pressureAmplitude"), (float *)&v20 + 1);
      sub_10052688C((uint64_t)a4, (uint64_t)CFSTR("tDot"), v21);
      sub_100197040();
      if (sub_100195F08())
      {
        v7 = sub_1001FBB04(0);
        (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)(v7 + 112) + 56))(v7 + 112, buf);
      }
    }
    else
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      v8 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to convert config to dictionary", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021681F8);
        LOWORD(v17) = 0;
        LODWORD(v14) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "Failed to convert config to dictionary", &v17, v14);
        v13 = (uint8_t *)v12;
        sub_100512490("Generic", 1, 0, 0, "-[CLBarometerCalibration onMobileAssetNotification:data:]", "%s\n", v12);
        if (v13 != buf)
          free(v13);
      }
    }
    if (SHIBYTE(v16) < 0)
      operator delete(__p[0]);
  }
}

- (void)updateCompanionConnected:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 isCompanionConnected;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  _DWORD v9[4];
  uint8_t buf[4];
  _BOOL4 v11;

  self->_isCompanionConnected = a3;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021681F8);
  v4 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    isCompanionConnected = self->_isCompanionConnected;
    *(_DWORD *)buf = 67109120;
    v11 = isCompanionConnected;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "companion connected updated: %d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v6 = self->_isCompanionConnected;
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "companion connected updated: %d", v9);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration updateCompanionConnected:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  -[CLBarometerCalibration updateWetState](self, "updateWetState");
}

- (void)updateWetState
{
  uint64_t v3;
  array<CLBarometerCalibrationContextManager *, 10UL> *p_contextManagers;
  NSObject *v5;
  unint64_t wetState;
  unint64_t v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[4];
  uint8_t buf[4];
  int v12;

  v3 = 0;
  self->_wetState = self->_isSensorWet;
  p_contextManagers = &self->_contextManagers;
  do
    -[CLBarometerCalibrationContextManager wetStateUpdated:](p_contextManagers->__elems_[v3++], "wetStateUpdated:", self->_wetState);
  while (v3 != 10);
  -[CLBarometerCalibrationSourceAggregator wetStateUpdated:](self->_sourceAggregator, "wetStateUpdated:", self->_wetState);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021681F8);
  v5 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    wetState = self->_wetState;
    *(_DWORD *)buf = 67109120;
    v12 = wetState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "wet state updated to %d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v7 = self->_wetState;
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "wet state updated to %d", v10);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration updateWetState]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
}

- (void)setupAltimeterReleaseTimer
{
  CLTimer *releaseAltimeterContextTimer;
  _QWORD v3[5];

  releaseAltimeterContextTimer = self->_releaseAltimeterContextTimer;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100AB5A80;
  v3[3] = &unk_10212BB58;
  v3[4] = self;
  -[CLTimer setHandler:](releaseAltimeterContextTimer, "setHandler:", v3);
}

- (void)setAltimeterReleaseTimer
{
  -[CLTimer setNextFireDelay:](self->_releaseAltimeterContextTimer, "setNextFireDelay:", 86400.0);
}

- (id)latestAbsoluteAltitude
{
  return self->_latestAbsoluteAltitude;
}

- (void)onVisit:(id)a3
{
  BOOL v5;
  NSObject *v6;
  _BOOL4 inVisit;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _BOOL8 v12;
  CLBarometerCalibrationBiasEstimator *biasEstimator;
  double v14;
  double v15;
  double v16;
  CFAbsoluteTime v17;
  uint64_t v18;
  uint64_t v19;
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
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CFAbsoluteTime v36;
  const char *v37;
  char *v38;
  double v39;
  unint64_t buf;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  CFAbsoluteTime Current;
  CFAbsoluteTime v47;
  uint64_t v48;
  char v49;
  _DWORD v50[2];
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  CFAbsoluteTime v56;

  if (a3)
  {
    if (objc_msgSend(a3, "hasArrivalDate") && !objc_msgSend(a3, "hasDepartureDate"))
    {
      v5 = 1;
      goto LABEL_8;
    }
    if (objc_msgSend(a3, "hasArrivalDate") && objc_msgSend(a3, "hasDepartureDate"))
    {
      v5 = 0;
LABEL_8:
      self->_inVisit = v5;
    }
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021681F8);
  v6 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    inVisit = self->_inVisit;
    objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
    v9 = v8;
    objc_msgSend(objc_msgSend(a3, "departureDate"), "timeIntervalSinceReferenceDate");
    buf = __PAIR64__(inVisit, 67109888);
    v41 = 2048;
    v42 = v9;
    v43 = 2048;
    v44 = v10;
    v45 = 2048;
    Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received visit for altimeter,inVisit,%d,arrivalDate,%f,departureDate,%f,currentTime,%f", (uint8_t *)&buf, 0x26u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v30 = qword_10229FE88;
    v31 = self->_inVisit;
    objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
    v33 = v32;
    objc_msgSend(objc_msgSend(a3, "departureDate"), "timeIntervalSinceReferenceDate");
    v35 = v34;
    v36 = CFAbsoluteTimeGetCurrent();
    v50[0] = 67109888;
    v50[1] = v31;
    v51 = 2048;
    v52 = v33;
    v53 = 2048;
    v54 = v35;
    v55 = 2048;
    v56 = v36;
    LODWORD(v39) = 38;
    _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, v30, 0, "received visit for altimeter,inVisit,%d,arrivalDate,%f,departureDate,%f,currentTime,%f", v50, v39);
    v38 = (char *)v37;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration onVisit:]", "%s\n", v37);
    if (v38 != (char *)&buf)
      free(v38);
  }
  if (self->_inVisit)
  {
    v11 = objc_msgSend(objc_msgSend(a3, "_placeInference"), "_loiIdentifier");
    objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
    -[CLBarometerCalibration fetchLoiFromId:atTimestamp:](self, "fetchLoiFromId:atTimestamp:", v11);
    v12 = self->_inVisit;
  }
  else
  {
    v12 = 0;
  }
  biasEstimator = self->_biasEstimator;
  objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
  v15 = v14;
  objc_msgSend(objc_msgSend(a3, "departureDate"), "timeIntervalSinceReferenceDate");
  -[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:](biasEstimator, "updateVisitState:arrivalTime:departureTime:", v12, v15, v16);
  if (self->_logLois)
  {
    sub_1015EB864(&buf);
    sub_1016058C0((uint64_t)&buf);
    v17 = CFAbsoluteTimeGetCurrent();
    v49 |= 1u;
    v47 = v17;
    v18 = v48;
    objc_msgSend(a3, "coordinate");
    *(_WORD *)(v18 + 92) |= 0x40u;
    *(_QWORD *)(v18 + 56) = v19;
    v20 = v48;
    objc_msgSend(a3, "coordinate");
    *(_WORD *)(v20 + 92) |= 0x20u;
    *(_QWORD *)(v20 + 48) = v21;
    v22 = v48;
    objc_msgSend(objc_msgSend(a3, "departureDate"), "timeIntervalSinceReferenceDate");
    *(_WORD *)(v22 + 92) |= 4u;
    *(_QWORD *)(v22 + 24) = v23;
    v24 = v48;
    objc_msgSend(objc_msgSend(a3, "arrivalDate"), "timeIntervalSinceReferenceDate");
    *(_WORD *)(v24 + 92) |= 1u;
    *(_QWORD *)(v24 + 8) = v25;
    v26 = v48;
    objc_msgSend(a3, "horizontalAccuracy");
    *(_WORD *)(v26 + 92) |= 0x10u;
    *(_QWORD *)(v26 + 40) = v27;
    v28 = v48;
    *(_WORD *)(v48 + 92) |= 0x200u;
    *(_DWORD *)(v28 + 80) = 2;
    v29 = v48;
    *(_WORD *)(v48 + 92) |= 0x400u;
    *(_DWORD *)(v29 + 84) = -1;
    if (qword_1023118A8 != -1)
      dispatch_once(&qword_1023118A8, &stru_102168218);
    if (qword_1023118B0)
      sub_101888B64(qword_1023118B0, (uint64_t)&buf);
    sub_1015EE304((PB::Base *)&buf);
  }
  -[CLBarometerCalibration sendInVisit:](self, "sendInVisit:", self->_inVisit);
}

- (void)announceMostRecentForcedGPS:(double)a3
{
  -[CLBarometerCalibrationBiasEstimator announceMostRecentForcedGPS:](self->_biasEstimator, "announceMostRecentForcedGPS:", a3);
}

- (void)sendClientRegisterAnalyticsWithCurrentUncertainty:(double)a3 andTime:(double)a4
{
  _QWORD v4[7];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AB6150;
  v4[3] = &unk_102168188;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  *(double *)&v4[6] = a4;
  AnalyticsSendEventLazy(CFSTR("com.apple.Motion.Altimeter.RegisterClient"), v4);
}

- (void)fetchVisitStatusAtStart
{
  CLTimer *fetchRoutineVisitsTimer;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;

  if (self->_routineMonitorProxy)
  {
    fetchRoutineVisitsTimer = self->_fetchRoutineVisitsTimer;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100AB658C;
    v5[3] = &unk_10212BB58;
    v5[4] = self;
    -[CLTimer setHandler:](fetchRoutineVisitsTimer, "setHandler:", v5);
    -[CLTimer setNextFireDelay:](self->_fetchRoutineVisitsTimer, "setNextFireDelay:", 10.0);
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v4 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Routine Monitor is not available.\"}", buf, 0x12u);
    }
  }
}

- (BOOL)isIHAAuthorized
{
  uint64_t v2;

  v2 = objc_opt_class(MCProfileConnection, a2);
  if (v2)
    LOBYTE(v2) = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed");
  return v2;
}

- (void)fetchLoiFromId:(id)a3 atTimestamp:(double)a4
{
  CLRoutineMonitorServiceProtocol *routineMonitorProxy;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _QWORD v9[7];
  _WORD v10[8];
  uint8_t buf[1640];

  routineMonitorProxy = self->_routineMonitorProxy;
  if (routineMonitorProxy)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100AB6E48;
    v9[3] = &unk_10214C4E8;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestWithIdentifier:withReply:](routineMonitorProxy, "fetchLocationOfInterestWithIdentifier:withReply:", a3, v9);
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021681F8);
    v6 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Routine Monitor is not supported.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      v10[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "Routine Monitor is not supported.", v10, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration fetchLoiFromId:atTimestamp:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (void)alertElevationAlertClientsOnChange
{
  CLElevationThresholdManager *thresholdManager;
  float *v3;
  double v4;
  _QWORD *v5;
  float v6;
  NSObject *v7;
  int v8;
  float *v9;
  float *v10;
  BOOL v11;
  int v12;
  const char *v13;
  uint8_t *v14;
  const void *v15;
  int v16;
  float *v17;
  _QWORD *v18[2];
  int v19;
  double v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;

  thresholdManager = self->_thresholdManager;
  if (thresholdManager)
  {
    -[CLElevationThresholdManager getElevationThresholdProxyMap](thresholdManager, "getElevationThresholdProxyMap");
    v3 = v17;
    if (v17 == (float *)v18)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    v17 = 0;
    v18[0] = 0;
    v18[1] = 0;
  }
  HIDWORD(v4) = 0;
  v16 = 134218496;
  do
  {
    if (*((_BYTE *)v3 + 56))
    {
      v5 = (_QWORD *)*((_QWORD *)v3 + 6);
      v6 = v3[8];
      *(float *)&v4 = v6;
      objc_msgSend(v5, "onElevationThresold:direction:", *((unsigned __int8 *)v3 + 41), v4);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021681F8);
      v7 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *((unsigned __int8 *)v3 + 41);
        *(_DWORD *)buf = v16;
        v26 = v6;
        v27 = 2048;
        v28 = v5;
        v29 = 1024;
        v30 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "threshold,%f,client,%p,above,%d", buf, 0x1Cu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021681F8);
        v12 = *((unsigned __int8 *)v3 + 41);
        v19 = v16;
        v20 = v6;
        v21 = 2048;
        v22 = v5;
        v23 = 1024;
        v24 = v12;
        LODWORD(v15) = 28;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "threshold,%f,client,%p,above,%d", COERCE_DOUBLE(&v19), v15, v16);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibration alertElevationAlertClientsOnChange]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
    }
    v9 = (float *)*((_QWORD *)v3 + 1);
    if (v9)
    {
      do
      {
        v10 = v9;
        v9 = *(float **)v9;
      }
      while (v9);
    }
    else
    {
      do
      {
        v10 = (float *)*((_QWORD *)v3 + 2);
        v11 = *(_QWORD *)v10 == (_QWORD)v3;
        v3 = v10;
      }
      while (!v11);
    }
    v3 = v10;
  }
  while (v10 != (float *)v18);
LABEL_3:
  sub_100008848((uint64_t)&v17, v18[0]);
}

- (void)sendInVisit:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;

  v3 = a3;
  v4 = sub_1001FBB04(0);
  (*(void (**)(uint64_t, _BOOL8))(*(_QWORD *)(v4 + 112) + 72))(v4 + 112, v3);
}

- (void)writeThresholdToMsl:(float)a3 withTimestamp:(double)a4 andClientId:(id)a5 active:(BOOL)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 __p;
  char v15;
  _QWORD v16[108];
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD v20[10];
  char v21;
  uint64_t v22;

  sub_1004E5E40((uint64_t)&v19);
  std::ostream::operator<<(&v19, a5);
  sub_1015EB864(v16);
  sub_10160459C((uint64_t)v16);
  v18 |= 1u;
  *(double *)&v16[77] = a4;
  v10 = v17;
  *(_BYTE *)(v17 + 32) |= 1u;
  *(double *)(v10 + 16) = a4;
  v11 = v17;
  std::stringbuf::str(&__p, v20);
  sub_100AB85CC(v11, &__p);
  if (v15 < 0)
    operator delete((void *)__p.n128_u64[0]);
  v12 = v17;
  *(_BYTE *)(v17 + 32) |= 2u;
  *(float *)(v12 + 24) = a3;
  v13 = v17;
  *(_BYTE *)(v17 + 32) |= 4u;
  *(_BYTE *)(v13 + 28) = a6;
  if (qword_1023118A8 != -1)
    dispatch_once(&qword_1023118A8, &stru_102168218);
  if (qword_1023118B0)
    sub_101888B64(qword_1023118B0, (uint64_t)v16);
  sub_1015EE304((PB::Base *)v16);
  if (v21 < 0)
    operator delete((void *)v20[8]);
  std::streambuf::~streambuf(v20);
  std::ios::~ios(&v22);
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
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  Client *v7;
  array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>, 9UL> *p_fDataBuffers;
  uint64_t i;

  value = self->fMobileAssetClient.__ptr_.__value_;
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->fStatusClient.__ptr_.__value_;
  self->fStatusClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
  v7 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v7 + 8))(v7, a2);
  p_fDataBuffers = &self->fDataBuffers;
  for (i = 384; i != -48; i -= 48)
    sub_1006F0FB8((array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>, 9UL> *)((char *)p_fDataBuffers + i));
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *((_QWORD *)self + 77) = 0;
  *((_QWORD *)self + 79) = 0;
  *((_QWORD *)self + 80) = 0;
  *((_QWORD *)self + 88) = 0;
  *((_QWORD *)self + 92) = 0;
  return self;
}

@end
