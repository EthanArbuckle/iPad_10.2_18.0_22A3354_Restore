@implementation CLContextManagerBiasEstimationScheduler

- (uint64_t)stepCountElevationNotification:(uint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    v6 = *(double *)(a3 + 8);
    objc_msgSend(v5, "fStartTime");
    v8 = v6 - v7;
    *(double *)(a1 + 80) = v8;
    v9 = *(double *)(a1 + 88);
    if (v9 > 0.0 && v8 >= v9)
      objc_msgSend((id)a1, "sendTrackAndScheduleNextTick:", *(double *)(a3 + 8));
  }
  sub_100211128((uint64_t)&v19, (_QWORD *)(*(_QWORD *)(a1 + 24) + 48));
  if (v22)
  {
    v11 = *(_OWORD *)(*(_QWORD *)(v20 + (((unint64_t)(v22 + v21 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (v22 + v21 - 1));
    v12 = *(std::__shared_weak_count **)(*(_QWORD *)(v20
                                                   + (((unint64_t)(v22 + v21 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                                       + 16 * (v22 + v21 - 1)
                                       + 8);
    if (*((_QWORD *)&v11 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    objc_msgSend(*(id *)(a1 + 16), "updateEstimatedWeatherWithCumulativeAscendingDelta:andDescendingDelta:andIosTimestamp:", *(unsigned int *)(a3 + 16), *(unsigned int *)(a3 + 20), *(double *)(a3 + 8), v11, v11);
    objc_msgSend(*(id *)(a1 + 16), "updateBiasUncertaintyWithPressure:andTime:andLat:andLon:", *(double *)(v18 + 8) * 1000.0, *(double *)(a3 + 8), 1.79769313e308, 1.79769313e308);
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  return sub_1006F0FB8(&v19);
}

- (void)sourceUpdated:(unint64_t)currentSource
{
  _QWORD *v5;
  double v6;
  NSObject *v7;
  CLBarometerCalibrationTrack *v8;
  double v9;
  double v10;
  char *v11;
  int v12;
  double v13;
  __int16 v14;
  int v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  int v19;

  if (-[CLContextManagerBiasEstimationScheduler shouldStartNewTrack:](self, "shouldStartNewTrack:"))
  {
    self->_currentSource = currentSource;
    if (!self->_currentTrack)
    {
      if (currentSource >= 9)
        sub_100263950("array::at");
      v5 = (char *)self->super.fDataBuffers + 48 * currentSource;
      v6 = **(double **)(*(_QWORD *)(v5[1] + (((unint64_t)(v5[5] + v5[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*((_BYTE *)v5 + 40) + *((_BYTE *)v5 + 32) - 1));
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102199968);
      v7 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v17 = v6;
        v18 = 1024;
        v19 = currentSource;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "New reference data, starting track, TrackStartTime %f, reference type %d", buf, 0x12u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102199968);
        v12 = 134218240;
        v13 = v6;
        v14 = 1024;
        v15 = currentSource;
        v11 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "New reference data, starting track, TrackStartTime %f, reference type %d", COERCE_DOUBLE(&v12), 18);
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler sourceUpdated:]", "%s\n", v11);
        if (v11 != (char *)buf)
          free(v11);
      }
      -[CLBarometerCalibrationSourceAggregator enableSources:forContext:](self->super._sourceAggregator, "enableSources:forContext:", &off_102220A08, self);
      v8 = -[CLBarometerCalibrationTrack initWithContextType:forNotification:startTime:]([CLBarometerCalibrationTrack alloc], "initWithContextType:forNotification:startTime:", 6, 2, v6);
      self->_currentTrack = v8;
      -[CLBarometerCalibrationTrack fStartTime](v8, "fStartTime");
      self->_lastTrackEndTime = v9 + -0.1;
      currentSource = self->_currentSource;
    }
    -[CLContextManagerBiasEstimationScheduler getTrackLengthSecondsForSource:](self, "getTrackLengthSecondsForSource:", currentSource);
    self->_waitPeriodSeconds = v10;
  }
}

- (BOOL)shouldStartNewTrack:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (double)getTrackLengthSecondsForSource:(unint64_t)a3
{
  unint64_t v4;
  unint64_t *v5;

  v4 = a3;
  v5 = &v4;
  return *((double *)sub_10006221C((uint64_t **)&self->_trackLengthSecondsForSource, &v4, (uint64_t)&unk_101B9EB60, (uint64_t **)&v5)+ 5);
}

- (CLContextManagerBiasEstimationScheduler)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  CLContextManagerBiasEstimationScheduler *v6;
  CLContextManagerBiasEstimationScheduler *v7;
  double v8;
  NSObject *v9;
  double biasEstimationTrackDataBufferSizeSeconds;
  const char *v12;
  uint8_t *v13;
  _DWORD v14[4];
  objc_super v15;
  uint8_t buf[16];

  v15.receiver = self;
  v15.super_class = (Class)CLContextManagerBiasEstimationScheduler;
  v6 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:](&v15, "initWithUniverse:delegate:withBuffer:withSourceAggregator:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    v6->_currentTrack = 0;
    -[CLBarometerCalibrationSourceAggregator enableSources:forContext:](v6->super._sourceAggregator, "enableSources:forContext:", &off_1022209F0, v6);
    v14[0] = 180;
    sub_1004AD1D8(buf, "BarometerCalibrationBiasEstimationTrackPeriod", v14, 0);
    v8 = (double)*(int *)&buf[4];
    v7->_biasEstimationTrackPeriodSeconds = (double)*(int *)&buf[4];
    v7->_biasEstimationTrackDataBufferSizeSeconds = v8 + v8;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102199968);
    v9 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Bias Scheduler Context created", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102199968);
      LOWORD(v14[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "Bias Scheduler Context created", v14, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    v7->_waitPeriodSeconds = -1.0;
    v7->_currentSource = 9;
    biasEstimationTrackDataBufferSizeSeconds = v7->_biasEstimationTrackDataBufferSizeSeconds;
    *(_QWORD *)buf = 0;
    *(double *)&buf[8] = biasEstimationTrackDataBufferSizeSeconds;
    sub_1010152F0((uint64_t **)&v7->_trackLengthSecondsForSource, (unint64_t *)buf, (uint64_t *)buf);
    *(_OWORD *)buf = xmmword_101C3ADB0;
    sub_1010152F0((uint64_t **)&v7->_trackLengthSecondsForSource, (unint64_t *)buf, (uint64_t *)buf);
    v7->_lastWetStateTimestamp = 1.79769313e308;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CLBarometerCalibrationSourceAggregator disableSources:forContext:](self->super._sourceAggregator, "disableSources:forContext:", &off_1022209F0, self);
  -[CLBarometerCalibrationSourceAggregator disableSources:forContext:](self->super._sourceAggregator, "disableSources:forContext:", &off_102220A08, self);
  v3.receiver = self;
  v3.super_class = (Class)CLContextManagerBiasEstimationScheduler;
  -[CLBarometerCalibrationContextManager dealloc](&v3, "dealloc");
}

- (void)sendTrackAndScheduleNextTick:(double)a3
{
  double lastTrackEndTime;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  NSObject *v9;
  double waitPeriodSeconds;
  double v11;
  double v12;
  double lastWetStateTimestamp;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;
  __int16 v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double v33;
  NSObject *v34;
  double v35;
  const char *v36;
  uint8_t *v37;
  uint64_t v38;
  uint8_t *v39;
  double v40;
  _BYTE v41[22];
  uint8_t buf[4];
  _BYTE v43[38];
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;

  -[CLBarometerCalibrationTrack setFEndTime:](self->_currentTrack, "setFEndTime:", a3);
  lastTrackEndTime = self->_lastTrackEndTime;
  -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
  v6 = v5;
  v7 = self->_lastTrackEndTime;
  -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
  if (-[CLContextManagerBiasEstimationScheduler isRefDataAvailableBetweenStartTime:andEndTime:](self, "isRefDataAvailableBetweenStartTime:andEndTime:", v7, v8))
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102199968);
    v9 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      waitPeriodSeconds = self->_waitPeriodSeconds;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v43 = "WaitPeriodInSeconds";
      *(_WORD *)&v43[8] = 2048;
      *(double *)&v43[10] = waitPeriodSeconds;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calibration track wait period,%s %f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102199968);
      v35 = self->_waitPeriodSeconds;
      *(_DWORD *)v41 = 136315394;
      *(_QWORD *)&v41[4] = "WaitPeriodInSeconds";
      *(_WORD *)&v41[12] = 2048;
      *(double *)&v41[14] = v35;
      LODWORD(v40) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "Calibration track wait period,%s %f", v41, v40);
      v37 = (uint8_t *)v36;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler sendTrackAndScheduleNextTick:]", "%s\n", v36);
      if (v37 != buf)
        free(v37);
    }
    -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
    v12 = v11 + self->_waitPeriodSeconds * -50.0 / 100.0;
    -[CLBarometerCalibrationTrack setFNextTrackStartTime:](self->_currentTrack, "setFNextTrackStartTime:", v12);
    lastWetStateTimestamp = self->_lastWetStateTimestamp;
    -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
    if (lastWetStateTimestamp >= v14
      && (v15 = self->_lastWetStateTimestamp,
          -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime"),
          v15 <= v16))
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102199968);
      v28 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
        v30 = v29;
        -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
        v31 = self->_lastWetStateTimestamp;
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)v43 = v30;
        *(_WORD *)&v43[8] = 2048;
        *(_QWORD *)&v43[10] = v32;
        *(_WORD *)&v43[18] = 2048;
        *(double *)&v43[20] = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Calibration track with start time %f, end time %f will not be submitted because device was wet at %f", buf, 0x20u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_27;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102199968);
      v38 = qword_10229FE88;
      -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
      -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v38, 0, "Calibration track with start time %f, end time %f will not be submitted because device was wet at %f");
    }
    else
    {
      -[CLBarometerCalibrationContextClient startTrack:](self->super._delegate, "startTrack:", self->_currentTrack);
      -[CLBarometerCalibrationContextClient stopTrack:](self->super._delegate, "stopTrack:", self->_currentTrack);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102199968);
      v17 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
        v19 = v18;
        -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
        v21 = v20;
        -[CLBarometerCalibrationTrack fNextTrackStartTime](self->_currentTrack, "fNextTrackStartTime");
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)v43 = "startTime";
        *(_WORD *)&v43[8] = 2048;
        *(_QWORD *)&v43[10] = v19;
        *(_WORD *)&v43[18] = 2080;
        *(_QWORD *)&v43[20] = "endTime";
        *(_WORD *)&v43[28] = 2048;
        *(_QWORD *)&v43[30] = v21;
        v44 = 2080;
        v45 = "nextStartTime";
        v46 = 2048;
        v47 = v22;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Calibration track submitted with,%s,%f,%s,%f,%s,%f", buf, 0x3Eu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_27;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102199968);
      v23 = qword_10229FE88;
      -[CLBarometerCalibrationTrack fStartTime](self->_currentTrack, "fStartTime");
      v25 = v24;
      -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
      -[CLBarometerCalibrationTrack fNextTrackStartTime](self->_currentTrack, "fNextTrackStartTime");
      *(_DWORD *)v41 = 136316418;
      *(_QWORD *)&v41[4] = "startTime";
      *(_WORD *)&v41[12] = 2048;
      *(_WORD *)&v41[14] = v25;
      LODWORD(v40) = 62;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 0, "Calibration track submitted with,%s,%f,%s,%f,%s,%f", v41, *(_QWORD *)&v40, *(_OWORD *)v41);
    }
    v39 = (uint8_t *)v26;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler sendTrackAndScheduleNextTick:]", "%s\n", v26);
    if (v39 != buf)
      free(v39);
LABEL_27:
    -[CLBarometerCalibrationTrack fEndTime](self->_currentTrack, "fEndTime");
    self->_lastTrackEndTime = v33;

    self->_currentTrack = -[CLBarometerCalibrationTrack initWithContextType:forNotification:startTime:]([CLBarometerCalibrationTrack alloc], "initWithContextType:forNotification:startTime:", 6, 2, v12);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102199968);
    v34 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)v43 = 0;
      *(_WORD *)&v43[4] = 2082;
      *(_QWORD *)&v43[6] = "";
      *(_WORD *)&v43[14] = 2050;
      *(double *)&v43[16] = v12;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Starting new track\", \"TrackStartTime_s\":\"%{public}.09f\"}", buf, 0x1Cu);
    }
    return;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102199968);
  v27 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)v43 = 0;
    *(_WORD *)&v43[4] = 2082;
    *(_QWORD *)&v43[6] = "";
    *(_WORD *)&v43[14] = 2050;
    *(double *)&v43[16] = lastTrackEndTime;
    *(_WORD *)&v43[24] = 2050;
    *(_QWORD *)&v43[26] = v6;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"No new data, don't start a new track between\", \"TrackStartTime_s\":\"%{public}.09f\", \"TrackStopTime_s\":\"%{public}.09f\"}", buf, 0x26u);
  }

  self->_currentTrack = 0;
  self->_waitPeriodSeconds = -1.0;
  -[CLBarometerCalibrationSourceAggregator disableSources:forContext:](self->super._sourceAggregator, "disableSources:forContext:", &off_102220A08, self);
}

- (BOOL)isRefDataAvailableBetweenStartTime:(double)a3 andEndTime:(double)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  double v20;
  BOOL v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v25;
  BOOL result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = objc_msgSend(&off_1022209F0, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v7)
    return 0;
  v8 = *(_QWORD *)v33;
  do
  {
    v9 = 0;
    while (2)
    {
      if (*(_QWORD *)v33 != v8)
        objc_enumerationMutation(&off_1022209F0);
      v10 = (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v9), "integerValue");
      if (v10 >= 9)
        sub_100263950("array::at");
      sub_100211128((uint64_t)&v27, (_QWORD *)self->super.fDataBuffers + 6 * v10);
      v11 = v28;
      v12 = v29;
      v13 = (_QWORD *)(v28 + 8 * (v30 >> 8));
      if (v29 == v28)
        v14 = 0;
      else
        v14 = *v13 + 16 * v30;
      while (1)
      {
        v15 = v12 == v11
            ? 0
            : *(_QWORD *)(v11 + (((v31 + v30) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v31 + v30);
        if (v14 == v15)
          break;
        v16 = *(double **)v14;
        v17 = *(std::__shared_weak_count **)(v14 + 8);
        if (v17)
        {
          p_shared_owners = (unint64_t *)&v17->__shared_owners_;
          do
            v19 = __ldxr(p_shared_owners);
          while (__stxr(v19 + 1, p_shared_owners));
          v20 = *v16;
          v21 = *v16 >= a3;
          v22 = v20 < a4 && v21;
          do
            v23 = __ldaxr(p_shared_owners);
          while (__stlxr(v23 - 1, p_shared_owners));
          if (v22)
          {
            if (!v23)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
LABEL_36:
            sub_1006F0FB8(&v27);
            return 1;
          }
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
        }
        else if (*v16 >= a3 && *v16 < a4)
        {
          goto LABEL_36;
        }
        v14 += 16;
        if (v14 - *v13 == 4096)
        {
          v25 = v13[1];
          ++v13;
          v14 = v25;
        }
        v11 = v28;
        v12 = v29;
      }
      sub_1006F0FB8(&v27);
      if ((id)++v9 != v7)
        continue;
      break;
    }
    v7 = objc_msgSend(&off_1022209F0, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    result = 0;
  }
  while (v7);
  return result;
}

- (void)wetStateUpdated:(unint64_t)a3
{
  NSObject *v4;
  double lastWetStateTimestamp;
  double v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  double v10;
  uint8_t buf[4];
  double v12;

  if (a3 == 1)
  {
    self->_lastWetStateTimestamp = CFAbsoluteTimeGetCurrent();
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102199968);
    v4 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      lastWetStateTimestamp = self->_lastWetStateTimestamp;
      *(_DWORD *)buf = 134217984;
      v12 = lastWetStateTimestamp;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "biasEstimationScheduler, lastWetTimestamp updated to %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102199968);
      v6 = self->_lastWetStateTimestamp;
      v9 = 134217984;
      v10 = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "biasEstimationScheduler, lastWetTimestamp updated to %f", COERCE_DOUBLE(&v9));
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler wetStateUpdated:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (void).cxx_destruct
{
  sub_100008848((uint64_t)&self->_trackLengthSecondsForSource, (_QWORD *)self->_trackLengthSecondsForSource.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  return self;
}

@end
