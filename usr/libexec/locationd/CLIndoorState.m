@implementation CLIndoorState

- (void)clearLocationGroups
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint8_t *v6;
  _QWORD v7[2];
  uint8_t buf[1640];

  if (*(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30))
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_102129DE0);
    v3 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Evicting availability tiles from memory", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_102129DE0);
      LOWORD(v7[0]) = 0;
      v4 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 2, "Evicting availability tiles from memory", v7, 2, v7[0]);
LABEL_19:
      v6 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLIndoorState clearLocationGroups]", "%s\n", v4);
      if (v6 != buf)
        free(v6);
    }
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_102129DE0);
    v5 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Warning Availability tiles already evicted", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_102129DE0);
      LOWORD(v7[0]) = 0;
      v4 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "#Warning Availability tiles already evicted", v7, 2, v7[0]);
      goto LABEL_19;
    }
  }

  *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30) = 0;
}

- (void)setAvailabilityTiles:(id)a3 withZScoreConfidenceInterval:(double)a4
{

  *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30) = a3;
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 78) = a4;
}

- (BOOL)gpsFusionRequested
{
  return self->_lastIndoorError.m_storage.dummy_.data[42];
}

- (void)updatePrefetchParameters:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;

  *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 102) = objc_msgSend(a3, "indoorPrefetchMaxFloorCount");
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 86) = (double)(1000
                                                                                       * objc_msgSend(a3, "indoorPrefetchRadiusKM"));
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118) = (double)(1000
                                                                                        * objc_msgSend(a3, "indoorLocationOfInterestMergeRadiusKM"));
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_102129DE0);
  v5 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 102);
    v7 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 86);
    v8 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118);
    *(_DWORD *)buf = 134349568;
    v33 = v6;
    v34 = 2050;
    v35 = v7;
    v36 = 2050;
    v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Prefetch indoor parameters updated, maxFloors=%{public}lu radiusMeters=%{public}f clusterMergeRadius=%{public}f", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_102129DE0);
    v16 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 102);
    v17 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 86);
    v18 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118);
    v26 = 134349568;
    v27 = v16;
    v28 = 2050;
    v29 = v17;
    v30 = 2050;
    v31 = v18;
    v19 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 1, "Prefetch indoor parameters updated, maxFloors=%{public}lu radiusMeters=%{public}f clusterMergeRadius=%{public}f", &v26, 32);
    sub_100512490("Generic", 1, 0, 2, "-[CLIndoorState updatePrefetchParameters:]", "%s\n", v19);
    if (v19 != (char *)buf)
      free(v19);
  }
  if ((objc_msgSend(a3, "hasRegionalPrefetchMaxFloorCount") & 1) != 0)
  {
    *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110) = objc_msgSend(a3, "regionalPrefetchMaxFloorCount");
    *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94) = (double)(1000
                                                                                         * objc_msgSend(a3, "regionalPrefetchRadiusKM"));
    v9 = (double)(1000 * objc_msgSend(a3, "regionalLocationOfInterestMergeRadiusKM"));
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_102129DE0);
    v10 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#warning No regional prefetch parameters found, falling back to indoor values", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_102129DE0);
      LOWORD(v26) = 0;
      LODWORD(v25) = 2;
      v24 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "#warning No regional prefetch parameters found, falling back to indoor values", &v26, v25);
      sub_100512490("Generic", 1, 0, 2, "-[CLIndoorState updatePrefetchParameters:]", "%s\n", v24);
      if (v24 != (char *)buf)
        free(v24);
    }
    *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110) = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_
                                                                                             + 102);
    *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94) = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_
                                                                                            + 86);
    v9 = *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118);
  }
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 126) = v9;
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_102129DE0);
  v11 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110);
    v13 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94);
    v14 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 126);
    *(_DWORD *)buf = 134349568;
    v33 = v12;
    v34 = 2050;
    v35 = v13;
    v36 = 2050;
    v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Prefetch regional parameters updated, maxFloors=%{public}lu radiusMeters=%{public}f clusterMergeRadius=%{public}f", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_102129DE0);
    v20 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110);
    v21 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94);
    v22 = *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 126);
    v26 = 134349568;
    v27 = v20;
    v28 = 2050;
    v29 = v21;
    v30 = 2050;
    v31 = v22;
    LODWORD(v25) = 32;
    v23 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 1, "Prefetch regional parameters updated, maxFloors=%{public}lu radiusMeters=%{public}f clusterMergeRadius=%{public}f", &v26, v25);
    sub_100512490("Generic", 1, 0, 2, "-[CLIndoorState updatePrefetchParameters:]", "%s\n", v23);
    if (v23 != (char *)buf)
      free(v23);
  }
  v15 = -[CLIndoorState fitnessModeStateMachine](self, "fitnessModeStateMachine");
  +[CLIndoorState getFitnessModeDebounceParamsWithOptionalAvailabilityTile:](CLIndoorState, "getFitnessModeDebounceParamsWithOptionalAvailabilityTile:", a3);
  sub_10001B974((uint64_t)v15, buf);
}

- (NSSet)pipelinedVenues
{
  return *(NSSet **)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 70);
}

- (void)latestPosition
{
  return &self->_latestPosition;
}

- (CLAvailableVenuesStateMachine)availableVenuesState
{
  return *(CLAvailableVenuesStateMachine **)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 142);
}

- (BOOL)locationGroupsLoaded
{
  return *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30) != 0;
}

- (int)state
{
  return *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 54);
}

- (id)locationGroups
{
  return *(id *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30);
}

- (void)fitnessModeStateMachine
{
  return self->_fitnessModeStateMachine.__ptr_.__value_;
}

- (uint64_t)latestNavModeEstimate
{
  return *(_QWORD *)(a1 + 368);
}

- (void)setLatestPosition:(CLLastFix *)a3
{
  _BOOL4 m_initialized;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  m_initialized = self->_latestPosition.m_initialized;
  v5 = *(_OWORD *)&a3->var0.coordinate.longitude;
  v4 = *(_OWORD *)&a3->var0.altitude;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 7) = *(_OWORD *)&a3->var0.suitability;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 23) = v5;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 39) = v4;
  v6 = *(_OWORD *)&a3->var0.timestamp;
  v7 = *(_OWORD *)&a3->var0.lifespan;
  v8 = *(_OWORD *)&a3->var0.course;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 55) = *(_OWORD *)&a3->var0.speed;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 103) = v7;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 87) = v6;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 71) = v8;
  v9 = *(_OWORD *)&a3->var0.referenceFrame;
  v10 = *(_OWORD *)&a3->var0.ellipsoidalAltitude;
  v11 = *(_OWORD *)&a3->var0.rawCourse;
  *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 119) = a3->var0.rawCoordinate;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 167) = v10;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 151) = v9;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 135) = v11;
  if (!m_initialized)
    self->_latestPosition.m_initialized = 1;
}

- (uint64_t)setLatestNavModeEstimate:(uint64_t)a3
{
  *(_QWORD *)(result + 368) = a3;
  *(_DWORD *)(result + 376) = a4;
  *(_BYTE *)(result + 380) = BYTE4(a4);
  return result;
}

- (void)navModeEstimator
{
  return &self->_navModeEstimator;
}

- (BOOL)wifiPowered
{
  return self->_lastIndoorError.m_storage.dummy_.data[39];
}

- (BOOL)isVehicleConnected
{
  return self->_lastIndoorError.m_storage.dummy_.data[47];
}

- (BOOL)isStreamingClientInFitnessSession
{
  return self->_lastIndoorError.m_storage.dummy_.data[46];
}

- (BOOL)isInVehicleNavigation
{
  return self->_lastIndoorError.m_storage.dummy_.data[48];
}

- (BOOL)hasAtLeastOneClientWithCLActivityTypeFitness
{
  return self->_lastIndoorError.m_storage.dummy_.data[45];
}

- (void)setLatestReason:(int)a3
{
  *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 62) = a3;
}

- (void)lastIndoorError
{
  return (char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 6;
}

- (double)availabilityZScoreConfidenceInterval
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 78);
}

- (BOOL)fSpectatingLocation
{
  return self->_lastIndoorError.m_storage.dummy_.data[44];
}

- (void)setFSpectatingLocation:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[44] = a3;
}

- (int)pipelinedSeeded
{
  return *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 50);
}

- (void)setPipelinedSeeded:(int)a3
{
  *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 50) = a3;
}

- (void)setState:(int)a3
{
  *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 54) = a3;
}

- (void)setPipelinedVenues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setPipelinedDidStartLocalizing:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[38] = a3;
}

- (void)setLastIndoorError:(optional<CLIndoorError> *)a3
{
  uint64_t v3;

  if (self->_lastIndoorError.m_storage.dummy_.data[6])
  {
    if (a3->m_initialized)
    {
      v3 = *(_QWORD *)((char *)&a3->m_storage.dummy_.aligner_ + 7);
      *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 22) = *(_DWORD *)((char *)&a3->m_storage.dummy_.aligner_
                                                                                              + 15);
      *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 14) = v3;
    }
    else
    {
      self->_lastIndoorError.m_storage.dummy_.data[6] = 0;
    }
  }
  else if (a3->m_initialized)
  {
    *(_OWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 14) = *(_OWORD *)((char *)&a3->m_storage.dummy_.aligner_
                                                                                            + 7);
    self->_lastIndoorError.m_storage.dummy_.data[6] = 1;
  }
}

- (void)setGpsFusionRequested:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[42] = a3;
}

- (unint64_t)lastARSessionState
{
  return *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 134);
}

- (BOOL)gpsAssistanceRequested
{
  return self->_lastIndoorError.m_storage.dummy_.data[41];
}

- (NSURL)avlTilePathOverrideForTest
{
  return *(NSURL **)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 150);
}

+ (DebounceParameters)getFitnessModeDebounceParamsWithOptionalAvailabilityTile:(SEL)a3
{
  uint64_t v6;
  DebounceParameters *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a4 && (objc_msgSend(a4, "hasMotionActivityDebounceParameters") & 1) != 0)
  {
    if (objc_msgSend(a4, "hasCyclingToNonFitnessSeconds"))
      v6 = objc_msgSend(a4, "cyclingToNonFitnessSeconds");
    else
      v6 = 180;
    if (objc_msgSend(a4, "hasRunningToNonFitnessSeconds"))
      v12 = objc_msgSend(a4, "runningToNonFitnessSeconds");
    else
      v12 = 180;
    if (objc_msgSend(a4, "hasNonFitnessToCyclingSeconds"))
      v13 = objc_msgSend(a4, "nonFitnessToCyclingSeconds");
    else
      v13 = 10;
    if (objc_msgSend(a4, "hasNonFitnessToRunningSeconds"))
      v11 = objc_msgSend(a4, "nonFitnessToRunningSeconds");
    else
      v11 = 10;
    v7 = retstr;
    v8 = v6;
    v9 = v12;
    v10 = v13;
  }
  else
  {
    v7 = retstr;
    v8 = 180;
    v9 = 180;
    v10 = 10;
    v11 = 10;
  }
  return (DebounceParameters *)sub_10022163C(v7, v8, v9, v10, v11);
}

- (CLIndoorState)init
{
  CLIndoorState *v2;
  CLIndoorState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLIndoorState;
  v2 = -[CLIndoorState init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 50) = 0;
    *(_OWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 78) = xmmword_101B97EF0;
    *(_QWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 94) = 0x4085180000000000;
    *(_QWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 102) = 200;
    *(_QWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 110) = 200;
    *(_QWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 118) = 0x40E86A0000000000;
    *(_QWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 126) = 0x4049000000000000;
    *(_QWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 142) = objc_alloc_init((Class)CLAvailableVenuesStateMachine);
    *(_WORD *)((char *)&v3->_lastIndoorError.m_storage.dummy_.aligner_ + 39) = 257;
    +[CLIndoorState getFitnessModeDebounceParamsWithOptionalAvailabilityTile:](CLIndoorState, "getFitnessModeDebounceParamsWithOptionalAvailabilityTile:", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLIndoorState;
  -[CLIndoorState dealloc](&v3, "dealloc");
}

- (void)resetNavModeEstimator
{
  sub_100239828();
}

- (BOOL)pipelinedDidStartLocalizing
{
  return self->_lastIndoorError.m_storage.dummy_.data[38];
}

- (void)setWifiPowered:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[39] = a3;
}

- (BOOL)wifiAssociated
{
  return self->_lastIndoorError.m_storage.dummy_.data[40];
}

- (void)setWifiAssociated:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[40] = a3;
}

- (void)setGpsAssistanceRequested:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[41] = a3;
}

- (BOOL)keybagLocked
{
  return self->_lastIndoorError.m_storage.dummy_.data[43];
}

- (void)setKeybagLocked:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[43] = a3;
}

- (void)setAvailabilityZScoreConfidenceInterval:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 78) = a3;
}

- (unsigned)tilePrefetchPredictionActivityCycleAllowance
{
  return *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 58);
}

- (void)setTilePrefetchPredictionActivityCycleAllowance:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 58) = a3;
}

- (double)indoorPrefetchRadiusMeters
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 86);
}

- (void)setIndoorPrefetchRadiusMeters:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 86) = a3;
}

- (double)regionalPrefetchRadiusMeters
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94);
}

- (void)setRegionalPrefetchRadiusMeters:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94) = a3;
}

- (unint64_t)indoorPrefetchMaxFloorsPerPrefetch
{
  return *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 102);
}

- (void)setIndoorPrefetchMaxFloorsPerPrefetch:(unint64_t)a3
{
  *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 102) = a3;
}

- (unint64_t)regionalPrefetchMaxFloorsPerPrefetch
{
  return *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110);
}

- (void)setRegionalPrefetchMaxFloorsPerPrefetch:(unint64_t)a3
{
  *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110) = a3;
}

- (double)indoorPrefetchClusterMergeRadius
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118);
}

- (void)setIndoorPrefetchClusterMergeRadius:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118) = a3;
}

- (double)regionalPrefetchClusterMergeRadius
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 126);
}

- (void)setRegionalPrefetchClusterMergeRadius:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 126) = a3;
}

- (void)setHasAtLeastOneClientWithCLActivityTypeFitness:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[45] = a3;
}

- (void)setLastARSessionState:(unint64_t)a3
{
  *(_QWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 134) = a3;
}

- (int)latestReason
{
  return *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 62);
}

- (void)setIsStreamingClientInFitnessSession:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[46] = a3;
}

- (void)setIsVehicleConnected:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[47] = a3;
}

- (void)setIsInVehicleNavigation:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[48] = a3;
}

- (optional<std::chrono::time_point<std::chrono::steady_clock,)lastPrefetchTimestamp
{
  retstr->m_initialized = 0;
  if (self[2].m_storage.dummy_.data[29])
  {
    *(_QWORD *)((char *)&retstr->m_storage.dummy_.aligner_ + 7) = *(_QWORD *)((char *)&self[2].m_storage.dummy_.aligner_
                                                                            + 37);
    retstr->m_initialized = 1;
  }
  return self;
}

- (void)setLastPrefetchTimestamp:()optional<std:(std:()std:(1000000000>>>> *)a3 :ratio<1 :chrono::duration<long)long :chrono::time_point<std::chrono::steady_clock
{
  if (self->_lastIndoorError.m_storage.dummy_.data[174])
  {
    if (a3->m_initialized)
      self->_locationGroups = *(NSArray **)((char *)&a3->m_storage.dummy_.aligner_ + 7);
    else
      self->_lastIndoorError.m_storage.dummy_.data[174] = 0;
  }
  else if (a3->m_initialized)
  {
    self->_locationGroups = *(NSArray **)((char *)&a3->m_storage.dummy_.aligner_ + 7);
    self->_lastIndoorError.m_storage.dummy_.data[174] = 1;
  }
}

- (void)setAvailableVenuesState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (void)setAvlTilePathOverrideForTest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  CLIndoorFitnessModeStateMachine *value;

  if (self->_lastIndoorError.m_storage.dummy_.data[174])
    self->_lastIndoorError.m_storage.dummy_.data[174] = 0;
  if (self->_lastIndoorError.m_storage.dummy_.data[6])
    self->_lastIndoorError.m_storage.dummy_.data[6] = 0;
  if (self->_latestPosition.m_initialized)
    self->_latestPosition.m_initialized = 0;
  value = self->_fitnessModeStateMachine.__ptr_.__value_;
  self->_fitnessModeStateMachine.__ptr_.__value_ = 0;
  if (value)
    operator delete();
  sub_1002397F4((uint64_t *)&self->_navModeEstimator);
}

- (id).cxx_construct
{
  sub_100239828();
}

@end
