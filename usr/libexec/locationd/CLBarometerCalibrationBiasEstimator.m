@implementation CLBarometerCalibrationBiasEstimator

- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
  double Current;
  double previousCumulativeDeltaIOSTime;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  double weatherEstimateInMeter;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char *v24;
  double v25;
  double v26;
  double v27;
  int v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  uint8_t buf[4];
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;

  Current = CFAbsoluteTimeGetCurrent();
  previousCumulativeDeltaIOSTime = self->_previousCumulativeDeltaIOSTime;
  if (previousCumulativeDeltaIOSTime == 1.79769313e308)
  {
    self->_offSetAscendedDelta = a3;
    self->_offSetDescendedDelta = a4;
    previousCumulativeDeltaIOSTime = a5;
    self->_previousCumulativeDeltaIOSTime = a5;
  }
  if (vabdd_f64(a5, previousCumulativeDeltaIOSTime) > 18.0)
    sub_1008B51D8((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
  sub_1000DBFF8((unsigned __int16 *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, a3 - self->_offSetAscendedDelta, a4 - self->_offSetDescendedDelta, 1000, (int)-[CLBarometerCalibrationContextClient isInVisit](self->_delegate, "isInVisit"), a5);
  self->_weatherEstimateInMeter = *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 79)
                                - *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 82);
  self->_previousCumulativeDeltaIOSTime = a5;
  v27 = 0.0;
  if (-[CLBarometerCalibrationBiasEstimator getLastPressureSample:](self, "getLastPressureSample:", &v27))
  {
    -[CLMeanSeaLevelPressureEstimator minPressure](self->_meanSeaLevelPressureEstimator, "minPressure");
    if (v11 == 1.79769313e308
      || (-[CLMeanSeaLevelPressureEstimator maxPressure](self->_meanSeaLevelPressureEstimator, "maxPressure"),
          v12 == 1.79769313e308))
    {
      -[CLMeanSeaLevelPressureEstimator setMinPressure:](self->_meanSeaLevelPressureEstimator, "setMinPressure:", v27);
      v13 = v27;
LABEL_9:
      -[CLMeanSeaLevelPressureEstimator setMaxPressure:](self->_meanSeaLevelPressureEstimator, "setMaxPressure:", v13);
      goto LABEL_10;
    }
    -[CLMeanSeaLevelPressureEstimator minPressure](self->_meanSeaLevelPressureEstimator, "minPressure");
    if (v18 > v27)
      -[CLMeanSeaLevelPressureEstimator setMinPressure:](self->_meanSeaLevelPressureEstimator, "setMinPressure:");
    -[CLMeanSeaLevelPressureEstimator maxPressure](self->_meanSeaLevelPressureEstimator, "maxPressure");
    v20 = v19;
    v13 = v27;
    if (v20 < v27)
      goto LABEL_9;
  }
LABEL_10:
  if (vabdd_f64(Current, a5) < 10.0 && vabdd_f64(Current, self->_lastTimestampSavedRecovery) > 180.0)
    -[CLBarometerCalibrationBiasEstimator saveBiasInfo](self, "saveBiasInfo");
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v14 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    weatherEstimateInMeter = self->_weatherEstimateInMeter;
    v16 = *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 79)
        - *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 82);
    v17 = self->_previousCumulativeDeltaIOSTime;
    *(_DWORD *)buf = 134219008;
    v39 = weatherEstimateInMeter;
    v40 = 2048;
    v41 = v16;
    v42 = 2048;
    v43 = v17;
    v44 = 2048;
    v45 = (double)a3;
    v46 = 2048;
    v47 = (double)a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "weatherEstimateWithRebase is %f weatherEstimateFromSigElevation is %f timestamp is %f cumulativeAscendingDelta is %f cumulativeDescendingDelta is %f", buf, 0x34u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v21 = self->_weatherEstimateInMeter;
    v22 = *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 79)
        - *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 82);
    v23 = self->_previousCumulativeDeltaIOSTime;
    v28 = 134219008;
    v29 = v21;
    v30 = 2048;
    v31 = v22;
    v32 = 2048;
    v33 = v23;
    v34 = 2048;
    v35 = (double)a3;
    v36 = 2048;
    v37 = (double)a4;
    LODWORD(v25) = 52;
    v24 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "weatherEstimateWithRebase is %f weatherEstimateFromSigElevation is %f timestamp is %f cumulativeAscendingDelta is %f cumulativeDescendingDelta is %f", COERCE_DOUBLE(&v28), v25, v26, v27);
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateEstimatedWeatherWithCumulativeAscendingDelta:andDescendingDelta:andIosTimestamp:]", "%s\n", v24);
    if (v24 != (char *)buf)
      free(v24);
  }
}

- (void)updatePressureUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
  double latitude;
  double v13;
  NSObject *v14;
  double distanceTraveled;
  double pressureUncertainty;
  NSObject *v17;
  double Current;
  NSObject *v19;
  _BOOL4 inVisitStatus;
  double v21;
  float v22;
  BOOL v23;
  double v24;
  double v25;
  NSObject *v26;
  int v27;
  _BOOL4 v28;
  float v29;
  NSObject *v30;
  double biasTimestamp;
  double biasUncertaintyTimestamp;
  double v33;
  char *v34;
  uint64_t v35;
  int v36;
  _BOOL4 v37;
  float v38;
  char *v39;
  double v40;
  double v41;
  double v42;
  char *v43;
  double v44;
  double v45;
  char *v46;
  _BOOL4 v47;
  char *v48;
  double v49;
  _BYTE v50[34];
  double v51;
  __int16 v52;
  double v53;
  uint8_t buf[4];
  _BYTE v55[30];
  double v56;
  __int16 v57;
  double v58;

  if (a5 != 1.79769313e308 && a6 != 1.79769313e308)
  {
    latitude = self->_biasLocation.latitude;
    if (latitude != 1.79769313e308)
    {
      v13 = fabs(sub_100124100(latitude, self->_biasLocation.longitude, a5, a6));
      self->_pressureUncertainty = self->_pressureUncertainty + v13 * 0.00200000009;
      self->_distanceTraveled = v13;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v14 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        distanceTraveled = self->_distanceTraveled;
        pressureUncertainty = self->_pressureUncertainty;
        *(_DWORD *)buf = 134218496;
        *(double *)v55 = distanceTraveled;
        *(_WORD *)&v55[8] = 2048;
        *(double *)&v55[10] = distanceTraveled * 0.00200000009;
        *(_WORD *)&v55[18] = 2048;
        *(double *)&v55[20] = pressureUncertainty;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "updated pressure uncertainty due to distance %f by %f uncertainty now is %f", buf, 0x20u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v44 = self->_distanceTraveled;
        v45 = self->_pressureUncertainty;
        *(_DWORD *)v50 = 134218496;
        *(double *)&v50[4] = v44;
        *(_WORD *)&v50[12] = 2048;
        *(double *)&v50[14] = v44 * 0.00200000009;
        *(_WORD *)&v50[22] = 2048;
        *(double *)&v50[24] = v45;
        LODWORD(v49) = 32;
        v46 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "updated pressure uncertainty due to distance %f by %f uncertainty now is %f", COERCE_DOUBLE(v50), v49);
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v46);
        if (v46 != (char *)buf)
          free(v46);
      }
    }
    self->_biasLocation.latitude = a5;
    self->_biasLocation.longitude = a6;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v17 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)v55 = a5;
      *(_WORD *)&v55[8] = 2048;
      *(double *)&v55[10] = a6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "updated bias location latitude %f longitude %f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      *(_DWORD *)v50 = 134218240;
      *(double *)&v50[4] = a5;
      *(_WORD *)&v50[12] = 2048;
      *(double *)&v50[14] = a6;
      LODWORD(v49) = 22;
      v34 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "updated bias location latitude %f longitude %f", COERCE_DOUBLE(v50), v49);
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v34);
      if (v34 != (char *)buf)
        free(v34);
    }
  }
  if (self->_biasUncertaintyTimestamp < a4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (vabdd_f64(Current, a4) < 10.0)
    {
      self->_inVisitStatus = -[CLBarometerCalibrationContextClient isInVisit](self->_delegate, "isInVisit");
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v19 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        inVisitStatus = self->_inVisitStatus;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v55 = inVisitStatus;
        *(_WORD *)&v55[4] = 2048;
        *(double *)&v55[6] = a4;
        *(_WORD *)&v55[14] = 2048;
        *(double *)&v55[16] = Current;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "updated visit status for bias estimator, %d, step count timestamp, %f, current time, %f", buf, 0x1Cu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v47 = self->_inVisitStatus;
        *(_DWORD *)v50 = 67109632;
        *(_DWORD *)&v50[4] = v47;
        *(_WORD *)&v50[8] = 2048;
        *(double *)&v50[10] = a4;
        *(_WORD *)&v50[18] = 2048;
        *(double *)&v50[20] = Current;
        LODWORD(v49) = 28;
        v48 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "updated visit status for bias estimator, %d, step count timestamp, %f, current time, %f", v50, v49, *(double *)v50);
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v48);
        if (v48 != (char *)buf)
          free(v48);
      }
    }
    if (*((_DWORD *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 154))
      v21 = 0.0277777778;
    else
      v21 = dbl_101BBE640[!self->_inVisitStatus];
    v22 = a3;
    v23 = sub_10024806C(v22, 101320.0) < 3000.0;
    v24 = 0.05;
    if (v23)
      v24 = v21;
    if (a4 - self->_biasUncertaintyTimestamp <= 60.0)
      v25 = v24;
    else
      v25 = 0.0;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v26 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      v27 = *((_DWORD *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 154);
      v28 = self->_inVisitStatus;
      v29 = sub_10024806C(v22, 101320.0);
      *(_DWORD *)buf = 134218752;
      *(double *)v55 = v25;
      *(_WORD *)&v55[8] = 1024;
      *(_DWORD *)&v55[10] = v27;
      *(_WORD *)&v55[14] = 1024;
      *(_DWORD *)&v55[16] = v28;
      *(_WORD *)&v55[20] = 2048;
      *(double *)&v55[22] = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "updated weather drift due to time, %f, sig elev state, %d, inVisit, %d, altitude %f", buf, 0x22u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v35 = qword_10229FE88;
      v36 = *((_DWORD *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 154);
      v37 = self->_inVisitStatus;
      v38 = sub_10024806C(v22, 101320.0);
      *(_DWORD *)v50 = 134218752;
      *(double *)&v50[4] = v25;
      *(_WORD *)&v50[12] = 1024;
      *(_DWORD *)&v50[14] = v36;
      *(_WORD *)&v50[18] = 1024;
      *(_DWORD *)&v50[20] = v37;
      *(_WORD *)&v50[24] = 2048;
      *(double *)&v50[26] = v38;
      v39 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v35, 2, "updated weather drift due to time, %f, sig elev state, %d, inVisit, %d, altitude %f", COERCE_DOUBLE(v50), 34);
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v39);
      if (v39 != (char *)buf)
        free(v39);
    }
    self->_pressureUncertainty = self->_pressureUncertainty + v25 * (a4 - self->_biasUncertaintyTimestamp);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v30 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      biasTimestamp = self->_biasTimestamp;
      biasUncertaintyTimestamp = self->_biasUncertaintyTimestamp;
      v33 = self->_pressureUncertainty;
      *(_DWORD *)buf = 134219008;
      *(double *)v55 = a4;
      *(_WORD *)&v55[8] = 2048;
      *(double *)&v55[10] = biasTimestamp;
      *(_WORD *)&v55[18] = 2048;
      *(double *)&v55[20] = biasUncertaintyTimestamp;
      *(_WORD *)&v55[28] = 2048;
      v56 = v25 * (a4 - biasUncertaintyTimestamp);
      v57 = 2048;
      v58 = v33;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "updated pressure uncertainty due to time: timestamp %f _biasTimestamp %f _biasUncertaintyTimestamp %f by %f uncertainty now is %f", buf, 0x34u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v40 = self->_biasTimestamp;
      v41 = self->_biasUncertaintyTimestamp;
      v42 = self->_pressureUncertainty;
      *(_DWORD *)v50 = 134219008;
      *(double *)&v50[4] = a4;
      *(_WORD *)&v50[12] = 2048;
      *(double *)&v50[14] = v40;
      *(_WORD *)&v50[22] = 2048;
      *(double *)&v50[24] = v41;
      *(_WORD *)&v50[32] = 2048;
      v51 = v25 * (a4 - v41);
      v52 = 2048;
      v53 = v42;
      LODWORD(v49) = 52;
      v43 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "updated pressure uncertainty due to time: timestamp %f _biasTimestamp %f _biasUncertaintyTimestamp %f by %f uncertainty now is %f", COERCE_DOUBLE(v50), v49);
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v43);
      if (v43 != (char *)buf)
        free(v43);
    }
    self->_biasUncertaintyTimestamp = a4;
  }
}

- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
  uint64_t v11;
  double *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t v16;
  float v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  float v22;
  float v23;
  double v24;
  float biasPressure;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  float v30;
  float v31;
  double v32;
  float v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;
  float v38;
  double v39;
  NSObject *v40;
  double biasUncertainty;
  uint64_t v42;
  float v43;
  float v44;
  double v45;
  char *v46;
  uint64_t v47;
  float v48;
  float v49;
  double v50;
  char *v51;
  uint64_t v52;
  float v53;
  double v54;
  char *v55;
  double v56;
  char *v57;
  double v58;
  int v59;
  double v60;
  __int16 v61;
  double v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  uint8_t buf[4];
  _BYTE v68[18];
  __int16 v69;
  double v70;
  __int128 v71;

  if (self->_biasUncertaintyTimestamp == 1.79769313e308)
  {
    sub_100211128((uint64_t)buf, (_QWORD *)self->_dataBuffers + 6);
    if (!*((_QWORD *)&v71 + 1))
    {
      sub_1006F0FB8(buf);
      return;
    }
    v11 = *(_QWORD *)(*(_QWORD *)&v68[4] + (((unint64_t)v71 >> 5) & 0x7FFFFFFFFFFFFF8))
        + 16 * v71;
    v12 = *(double **)v11;
    v13 = *(std::__shared_weak_count **)(v11 + 8);
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      self->_biasUncertaintyTimestamp = *v12;
      self->_biasPressure = v12[1] * 1000.0;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    else
    {
      self->_biasUncertaintyTimestamp = *v12;
      self->_biasPressure = v12[1] * 1000.0;
    }
    sub_1006F0FB8(buf);
  }
  -[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:](self, "updatePressureUncertaintyWithPressure:andTime:andLat:andLon:", a3, a4, a5, a6);
  v17 = a3;
  v18 = sub_100247FB0(v17, 0.0065, 288.15);
  v19 = fabs(self->_pressureUncertainty);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v20 = v19 * v18;
  v21 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v22 = a3;
    v23 = sub_100247FB0(v22, 0.0065, 288.15);
    v24 = fabs(self->_pressureUncertainty);
    *(_DWORD *)buf = 134218752;
    *(double *)v68 = v20;
    *(_WORD *)&v68[8] = 2048;
    *(double *)&v68[10] = v23;
    v69 = 2048;
    v70 = v24;
    LOWORD(v71) = 2048;
    *(double *)((char *)&v71 + 2) = a3;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "term1 %f, dElevationdPresure(pmeas) %f std::abs(_pressureUncertainty) %f pmeas %f", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v42 = qword_10229FE88;
    v43 = a3;
    v44 = sub_100247FB0(v43, 0.0065, 288.15);
    v45 = fabs(self->_pressureUncertainty);
    v59 = 134218752;
    v60 = v20;
    v61 = 2048;
    v62 = v44;
    v63 = 2048;
    v64 = v45;
    v65 = 2048;
    v66 = a3;
    LODWORD(v58) = 42;
    v46 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v42, 2, "term1 %f, dElevationdPresure(pmeas) %f std::abs(_pressureUncertainty) %f pmeas %f", COERCE_DOUBLE(&v59), v58);
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v46);
    if (v46 != (char *)buf)
      free(v46);
  }
  biasPressure = self->_biasPressure;
  v26 = sub_100083204(biasPressure);
  v27 = vabdd_f64(a3, self->_biasPressure);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v28 = v27 * v26;
  v29 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v30 = self->_biasPressure;
    v31 = sub_100083204(v30);
    v32 = vabdd_f64(a3, self->_biasPressure);
    *(_DWORD *)buf = 134218496;
    *(double *)v68 = v28;
    *(_WORD *)&v68[8] = 2048;
    *(double *)&v68[10] = v31;
    v69 = 2048;
    v70 = v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "term2 %f, slopeDiffDElevationDPressure(pbias) %f std::abs(pressure - _biasPressure) %f", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v47 = qword_10229FE88;
    v48 = self->_biasPressure;
    v49 = sub_100083204(v48);
    v50 = vabdd_f64(a3, self->_biasPressure);
    v59 = 134218496;
    v60 = v28;
    v61 = 2048;
    v62 = v49;
    v63 = 2048;
    v64 = v50;
    LODWORD(v58) = 32;
    v51 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v47, 2, "term2 %f, slopeDiffDElevationDPressure(pbias) %f std::abs(pressure - _biasPressure) %f", COERCE_DOUBLE(&v59), v58);
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v51);
    if (v51 != (char *)buf)
      free(v51);
  }
  v33 = a3;
  v34 = sub_100083204(v33);
  v35 = fabs(self->_pressureUncertainty);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v36 = v35 * v34;
  v37 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v38 = sub_100083204(v17);
    v39 = fabs(self->_pressureUncertainty);
    *(_DWORD *)buf = 134218496;
    *(double *)v68 = v36;
    *(_WORD *)&v68[8] = 2048;
    *(double *)&v68[10] = v38;
    v69 = 2048;
    v70 = v39;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "term3 %f, slopeDiffDElevationDPressure(pmeas) %f std::abs(_pressureUncertainty %f", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v52 = qword_10229FE88;
    v53 = sub_100083204(v17);
    v54 = fabs(self->_pressureUncertainty);
    v59 = 134218496;
    v60 = v36;
    v61 = 2048;
    v62 = v53;
    v63 = 2048;
    v64 = v54;
    LODWORD(v58) = 32;
    v55 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v52, 2, "term3 %f, slopeDiffDElevationDPressure(pmeas) %f std::abs(_pressureUncertainty %f", COERCE_DOUBLE(&v59), v58);
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v55);
    if (v55 != (char *)buf)
      free(v55);
  }
  self->_biasUncertainty = fabs(v36) + fabs(v28) + fabs(v20) + self->_biasUncertaintyAtRebase;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v40 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    biasUncertainty = self->_biasUncertainty;
    *(_DWORD *)buf = 134217984;
    *(double *)v68 = biasUncertainty;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "total bias uncertainty %f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v56 = self->_biasUncertainty;
    v59 = 134217984;
    v60 = v56;
    v57 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "total bias uncertainty %f", COERCE_DOUBLE(&v59));
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v57);
    if (v57 != (char *)buf)
      free(v57);
  }
}

- (void)saveBiasInfo
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double *p_bias;
  uint64_t v10;
  uint64_t v11;
  double *p_weatherEstimateInMeter;
  uint64_t v13;
  uint64_t v14;
  double *p_biasPressure;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint8_t *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CFAbsoluteTime Current;
  int v31;
  CFAbsoluteTime v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  double v40;
  __int16 v41;
  uint64_t v42;
  uint8_t buf[4];
  CFAbsoluteTime v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  double v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  double v52;
  __int16 v53;
  uint64_t v54;

  if (self->_biasTimestamp != 1.79769313e308)
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[CLBarometerCalibrationBiasEstimator getAbsoluteAltitudeUncertainty](self, "getAbsoluteAltitudeUncertainty");
    v29 = v3;
    v6 = sub_1008B53F0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v3, v4, v5);
    if (v6 == 1.79769313e308)
      v6 = -800.0;
    v28 = v6;
    v7 = sub_1001FD94C();
    sub_10018A4CC(v7, "CLBarometerCalibration_Timestamp", &Current);
    v8 = sub_1001FD94C();
    p_bias = &self->_bias;
    sub_10018A4CC(v8, "CLBarometerCalibratio_Bias", &self->_bias);
    v10 = sub_1001FD94C();
    sub_10018A4CC(v10, "CLBarometerCalibration_Uncertainty", &v29);
    v11 = sub_1001FD94C();
    p_weatherEstimateInMeter = &self->_weatherEstimateInMeter;
    sub_10018A4CC(v11, "CLBarometerCalibration_Weather", &self->_weatherEstimateInMeter);
    v13 = sub_1001FD94C();
    sub_10018A4CC(v13, "CLBarometerCalibration_SignificantElevation", &v28);
    v14 = sub_1001FD94C();
    p_biasPressure = &self->_biasPressure;
    sub_10018A4CC(v14, "CLBarometerCalibration_BiasPressure", &self->_biasPressure);
    v16 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 944))(v16);
    self->_lastTimestampSavedRecovery = Current;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v17 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)p_bias;
      v19 = *(_QWORD *)p_weatherEstimateInMeter;
      v20 = *(_QWORD *)p_biasPressure;
      *(_DWORD *)buf = 134219264;
      v44 = Current;
      v45 = 2048;
      v46 = v18;
      v47 = 2048;
      v48 = v29;
      v49 = 2048;
      v50 = v19;
      v51 = 2048;
      v52 = v28;
      v53 = 2048;
      v54 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "saving rebase info to cache, timestamp %f, bias, %f, uncertainty, %f, weather estimate, %f, sig elevation, %f, pressure, %f", buf, 0x3Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v21 = *(_QWORD *)p_bias;
      v22 = *(_QWORD *)p_weatherEstimateInMeter;
      v23 = *(_QWORD *)p_biasPressure;
      v31 = 134219264;
      v32 = Current;
      v33 = 2048;
      v34 = v21;
      v35 = 2048;
      v36 = v29;
      v37 = 2048;
      v38 = v22;
      v39 = 2048;
      v40 = v28;
      v41 = 2048;
      v42 = v23;
      LODWORD(v26) = 62;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "saving rebase info to cache, timestamp %f, bias, %f, uncertainty, %f, weather estimate, %f, sig elevation, %f, pressure, %f", COERCE_DOUBLE(&v31), v26, v27, v28, v29, Current);
      v25 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator saveBiasInfo]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
  }
}

- (CLBarometerCalibrationBiasEstimator)initWithUniverse:(id)a3 delegate:(id)a4 buffers:(void *)a5 contextManager:(id)a6
{
  CLBarometerCalibrationBiasEstimator *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLBarometerCalibrationBiasEstimator;
  v9 = -[CLBarometerCalibrationBiasEstimator init](&v11, "init");
  if (v9)
  {
    v9->_delegate = (CLBarometerCalibrationContextClient *)a4;
    v9->_universe = (CLIntersiloUniverse *)a3;
    v9->_dataBuffers = a5;
    *(_OWORD *)&v9->_biasPressure = xmmword_101BBE5F0;
    *(_OWORD *)&v9->_biasUncertaintyTimestamp = xmmword_101BBE600;
    v9->_estimatedMeanSeaLevelPressure = 101325.0;
    *(_OWORD *)&v9->_weatherEstimateInMeter = xmmword_101BBE610;
    *(_OWORD *)&v9->_previousBiasTimestamp = xmmword_101BBE5E0;
    v9->_pressureUncertainty = 0.0;
    v9->_distanceTraveled = 0.0;
    *(_OWORD *)&v9->_distanceSinceLastRebase = xmmword_101BBE620;
    *(_QWORD *)&v9->_offSetAscendedDelta = 0;
    v9->_previousCumulativeDeltaIOSTime = 1.79769313e308;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  self->_delegate = 0;
  self->_universe = 0;
  self->_meanSeaLevelPressureEstimator = 0;
  self->_queriedMeanSeaLevelPressureData = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBarometerCalibrationBiasEstimator;
  -[CLBarometerCalibrationBiasEstimator dealloc](&v3, "dealloc");
}

- (id)copyCurrentBias
{
  CLBarometerCalibrationBiasData *v3;
  double v4;

  v3 = objc_opt_new(CLBarometerCalibrationBiasData);
  -[CLBarometerCalibrationBiasData setTimestamp:](v3, "setTimestamp:", self->_biasTimestamp);
  -[CLBarometerCalibrationBiasData setBiasInMeters:](v3, "setBiasInMeters:", self->_bias);
  if (-[CLMeanSeaLevelPressureEstimator getMeanSeaLevelArrayCount](self->_meanSeaLevelPressureEstimator, "getMeanSeaLevelArrayCount"))
  {
    -[CLBarometerCalibrationBiasEstimator getAbsoluteAltitudeUncertainty](self, "getAbsoluteAltitudeUncertainty");
  }
  else
  {
    v4 = 500.0;
  }
  -[CLBarometerCalibrationBiasData setUncertaintyInMeters:](v3, "setUncertaintyInMeters:", v4);
  -[CLBarometerCalibrationBiasData setEstimatedMeanSeaLevelPressure:](v3, "setEstimatedMeanSeaLevelPressure:", self->_estimatedMeanSeaLevelPressure);
  -[CLBarometerCalibrationBiasData setEstimatedUncertainty:](v3, "setEstimatedUncertainty:", self->_estimatedAbsoluteAltitudeUncertainty);
  -[CLBarometerCalibrationBiasData setWeatherEstimateInMeter:](v3, "setWeatherEstimateInMeter:", *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 79)- *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 82));
  -[CLBarometerCalibrationBiasData setPreviousCumulativeDeltaIOSTime:](v3, "setPreviousCumulativeDeltaIOSTime:", (unint64_t)self->_previousCumulativeDeltaIOSTime);
  -[CLBarometerCalibrationBiasData setStatusInfo:](v3, "setStatusInfo:", 0);
  return v3;
}

- (CLBarometerCalibrationPressureData)getClosestEntryToRefTime:(double)a3 inPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>
{
  void **begin;
  unint64_t start;
  void **v6;
  char *v7;
  uint64_t v8;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  double v17;
  int v19;
  unint64_t *v20;
  unint64_t v21;
  char *v22;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  const char *v28;
  uint8_t *v29;
  __int16 v30[8];
  uint8_t buf[1640];
  CLBarometerCalibrationPressureData result;

  begin = a4->__map_.__begin_;
  if (a4->__map_.__end_ != begin)
  {
    start = a4->__start_;
    v6 = &begin[start >> 8];
    v7 = (char *)*v6 + 16 * start;
    v8 = *(uint64_t *)((char *)begin + (((a4->__size_.__value_ + start) >> 5) & 0x7FFFFFFFFFFFFF8))
       + 16 * (LOBYTE(a4->__size_.__value_) + start);
    if (v7 != (char *)v8)
    {
      v10 = 1.79769313e308;
      *(double *)&v11 = 1.79769313e308;
      v12 = 1.79769313e308;
      while (1)
      {
        v13 = *(_QWORD *)v7;
        v14 = (std::__shared_weak_count *)*((_QWORD *)v7 + 1);
        if (v14)
        {
          p_shared_owners = (unint64_t *)&v14->__shared_owners_;
          do
            v16 = __ldxr(p_shared_owners);
          while (__stxr(v16 + 1, p_shared_owners));
        }
        v17 = vabdd_f64(a3, *(double *)v13);
        if (v17 >= v10 || v17 > 5.0)
        {
          if (v17 > v10)
          {
            v19 = 0;
            if (v14)
              goto LABEL_16;
            goto LABEL_20;
          }
        }
        else
        {
          v11 = *(uint64_t *)(v13 + 8);
          v12 = *(double *)v13;
          v10 = v17;
        }
        v19 = 1;
        if (v14)
        {
LABEL_16:
          v20 = (unint64_t *)&v14->__shared_owners_;
          do
            v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v14->__on_zero_shared)(v14, a2);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
LABEL_20:
        if (v19)
        {
          v7 += 16;
          if (v7 - (_BYTE *)*v6 == 4096)
          {
            v22 = (char *)v6[1];
            ++v6;
            v7 = v22;
          }
          if (v7 != (char *)v8)
            continue;
        }
        if (v10 != 1.79769313e308)
          goto LABEL_33;
        goto LABEL_27;
      }
    }
  }
  *(double *)&v11 = 1.79769313e308;
LABEL_27:
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v23 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "pressure too far from reference data", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v30[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "pressure too far from reference data", v30, 2);
    v29 = (uint8_t *)v28;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator getClosestEntryToRefTime:inPressureQueue:]", "%s\n", v28);
    if (v29 != buf)
      free(v29);
  }
  v12 = 1.79769313e308;
LABEL_33:
  v24 = 1.79769313e308;
  v25 = v12;
  v26 = *(double *)&v11;
  v27 = 1.79769313e308;
  result.var3 = v27;
  result.var2 = v24;
  result.var1 = v26;
  result.var0 = v25;
  return result;
}

- (double)getAbsoluteAltitudeUncertainty
{
  return fmin(self->_biasUncertainty, 500.0);
}

- (double)crossEntropyOfreference:(ReferencePairedWithPressure *)a3
{
  double v5;
  double v6;
  NSObject *v7;
  _BOOL4 inVisitStatus;
  double var1;
  double v10;
  double v11;
  _BOOL4 v13;
  const char *v14;
  uint8_t *v15;
  double v16;
  int v17;
  const char *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  _BOOL4 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  _BOOL4 v32;

  v5 = 1.0;
  v6 = (a3->var0.var0 - a3->var1.var0) * (a3->var0.var0 - a3->var1.var0);
  if (!self->_inVisitStatus)
    v5 = v6 / (v6 + *(double *)&qword_102303740);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v7 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    inVisitStatus = self->_inVisitStatus;
    *(_DWORD *)buf = 136315906;
    v26 = "crossEntropyWeighting";
    v27 = 2048;
    v28 = v5;
    v29 = 2080;
    v30 = "inVisitStatus";
    v31 = 1024;
    v32 = inVisitStatus;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cross entropy weighting,%s,%f,%s,%d", buf, 0x26u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v13 = self->_inVisitStatus;
    v17 = 136315906;
    v18 = "crossEntropyWeighting";
    v19 = 2048;
    v20 = v5;
    v21 = 2080;
    v22 = "inVisitStatus";
    v23 = 1024;
    v24 = v13;
    LODWORD(v16) = 38;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "cross entropy weighting,%s,%f,%s,%d", (const char *)&v17, v16);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator crossEntropyOfreference:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  var1 = a3->var0.var1;
  v10 = log(var1 * 17.0794684);
  v11 = a3->var1.var1;
  return v10 + v5 * ((v6 + var1) / v11 + log(v11 / var1) + -1.0);
}

+ (void)getLocationSampleAltitudeAndUncertainty:(void *)a3 andRefAltitude:(double *)a4 andRefUncertainty:(double *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)a3;
  v6 = 24;
  if (*(double *)(*(_QWORD *)a3 + 120) > 0.0)
    v6 = 112;
  *a4 = *(double *)(v5 + v6);
  v7 = 40;
  if (*(double *)(v5 + 120) > 0.0)
    v7 = 120;
  *a5 = *(double *)(v5 + v7);
}

- (void)cumulateReference:(void *)a3 andRefAltitude:(double)a4 andRefVariance:(double)a5 andBaroElevation:(double)a6 andType:(int)a7
{
  char *v12;
  char *v13;
  char *v14;
  int v15;
  BOOL v16;
  char **v17;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  _OWORD v23[2];
  int v24;
  int v25;

  v25 = a7;
  if (a5 <= 9.0 || a7 != 4)
  {
    v12 = (char *)a3 + 8;
    v13 = (char *)*((_QWORD *)a3 + 1);
    if (!v13)
      goto LABEL_15;
    v14 = (char *)a3 + 8;
    do
    {
      v15 = *((_DWORD *)v13 + 8);
      v16 = v15 < a7;
      if (v15 >= a7)
        v17 = (char **)v13;
      else
        v17 = (char **)(v13 + 8);
      if (!v16)
        v14 = v13;
      v13 = *v17;
    }
    while (*v17);
    if (v14 == v12 || *((_DWORD *)v14 + 8) > a7)
LABEL_15:
      v14 = (char *)a3 + 8;
    if (a5 > 0.0 && v14 == v12)
    {
      v24 = 0;
      memset(v23, 0, sizeof(v23));
      sub_1006F0D64((uint64_t **)a3, &v25, &v25, (uint64_t)v23);
    }
    if (a5 > 0.0)
    {
      v19 = sub_1000B5C9C((uint64_t)a3, &v25);
      *(double *)v19 = *(double *)v19 + a4;
      v20 = sub_1000B5C9C((uint64_t)a3, &v25);
      *((double *)v20 + 1) = *((double *)v20 + 1) + a5;
      v21 = sub_1000B5C9C((uint64_t)a3, &v25);
      *((double *)v21 + 2) = *((double *)v21 + 2) + a6;
      v22 = sub_1000B5C9C((uint64_t)a3, &v25);
      ++*((_DWORD *)v22 + 8);
    }
  }
}

- (BiasEstimatorLocation)centroidOfLocationVector:(const void *)a3
{
  double *v3;
  double *v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  const char *v14;
  uint8_t *v15;
  double v16;
  int v17;
  double v18;
  __int16 v19;
  double v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  double v24;
  BiasEstimatorLocation result;

  v3 = *(double **)a3;
  v4 = (double *)*((_QWORD *)a3 + 1);
  if (*(double **)a3 == v4)
    goto LABEL_14;
  v5 = 0;
  v6 = 0.0;
  v7 = 0.0;
  do
  {
    if (*v3 != 1.79769313e308)
    {
      v8 = v3[1];
      if (v8 != 1.79769313e308)
      {
        v6 = v6 + *v3;
        v7 = v7 + v8;
        ++v5;
      }
    }
    v3 += 2;
  }
  while (v3 != v4);
  if (!v5)
  {
LABEL_14:
    v10 = 1.79769313e308;
    v11 = 1.79769313e308;
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v9 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v22 = v6 / (double)v5;
      v23 = 2048;
      v24 = v7 / (double)v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "new centroid: latitude %f, longitude %f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v10 = v6 / (double)v5;
      v11 = v7 / (double)v5;
      v17 = 134218240;
      v18 = v10;
      v19 = 2048;
      v20 = v11;
      LODWORD(v16) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "new centroid: latitude %f, longitude %f", COERCE_DOUBLE(&v17), v16);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator centroidOfLocationVector:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    else
    {
      v10 = v6 / (double)v5;
      v11 = v7 / (double)v5;
    }
  }
  v12 = v10;
  v13 = v11;
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (BOOL)updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
  void **p_dataBuffers;
  __int128 v10;
  double v11;
  _QWORD *v12;
  double **v13;
  uint64_t v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double *v20;
  unint64_t *v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double *v27;
  double v28;
  double v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  double **v44;
  const char *v45;
  float v46;
  float v47;
  NSObject *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  uint64_t v64;
  double v65;
  double v66;
  uint64_t v67;
  double v68;
  double v69;
  BOOL v70;
  double v71;
  double v72;
  const char *v73;
  double v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint8_t *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint8_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  int v95;
  uint64_t v96;
  double v97;
  double v98;
  uint64_t v99;
  const char *v100;
  uint8_t *v101;
  int v102;
  int v103;
  int v104;
  double v105;
  double v106;
  double v107;
  NSObject *v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  NSObject *v112;
  _BOOL4 inOutdoorWorkoutStatus;
  NSObject *v114;
  CLMeanSeaLevelPressureData *v115;
  double v116;
  double v117;
  double v118;
  double bias;
  double weatherEstimateInMeter;
  double v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  double v127;
  uint64_t v128;
  double v129;
  double v130;
  double v131;
  double v132;
  BOOL v134;
  double v135;
  float v136;
  float v137;
  float v138;
  float biasPressure;
  float v140;
  NSObject *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  double v147;
  double v148;
  double v149;
  NSObject *v150;
  double v151;
  double biasUncertaintyAtRebase;
  double biasUncertainty;
  double v154;
  _BOOL4 v155;
  std::__shared_weak_count *v156;
  unint64_t *v157;
  unint64_t v158;
  _BOOL4 v160;
  const char *v161;
  uint8_t *v162;
  const char *v163;
  uint8_t *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint8_t *v172;
  double v173;
  double v174;
  double v175;
  double v176;
  _BOOL4 v177;
  const char *v178;
  uint8_t *v179;
  uint64_t v180;
  const char *v181;
  const char *v182;
  uint64_t v183;
  const char *v184;
  uint8_t *v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  const char *v193;
  double v194;
  __int128 v195;
  const char *v196;
  double v197;
  const char *v198;
  double v199;
  const char *v200;
  double v201;
  const char *v202;
  double v203;
  const char *v204;
  const char *v205;
  const char *v206;
  double v207;
  unint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  unint64_t v213;
  uint64_t v214;
  int v215;
  const char *v216;
  __int16 v217;
  _BYTE v218[124];
  __int16 v219;
  const char *v220;
  __int16 v221;
  _BYTE v222[34];
  __int16 v223;
  double v224;
  __int16 v225;
  const char *v226;
  __int16 v227;
  double v228;
  __int16 v229;
  const char *v230;
  __int16 v231;
  uint64_t v232;
  uint8_t buf[4];
  const char *v234;
  __int16 v235;
  _BYTE v236[124];
  __int16 v237;
  const char *v238;
  __int16 v239;
  _BYTE v240[34];
  __int16 v241;
  double v242;
  __int16 v243;
  const char *v244;
  __int16 v245;
  double v246;
  __int16 v247;
  const char *v248;
  __int16 v249;
  uint64_t v250;

  p_dataBuffers = &self->_dataBuffers;
  sub_100211128((uint64_t)&v210, (_QWORD *)self->_dataBuffers);
  sub_100211128((uint64_t)&v204, (_QWORD *)*p_dataBuffers + 6);
  v202 = 0;
  v203 = 0.0;
  v11 = 0.0;
  if (v212 == v211
    || (v12 = (_QWORD *)(v211 + 8 * (v213 >> 8)),
        v13 = (double **)(*v12 + 16 * v213),
        v14 = *(_QWORD *)(v211 + (((v214 + v213) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v214 + v213),
        v13 == (double **)v14))
  {
    v102 = 0;
    v103 = 0;
    v104 = 0;
    v105 = 0.0;
    v106 = 0.0;
    v107 = 0.0;
    v192 = 0.0;
    v194 = 0.0;
  }
  else
  {
    v193 = 0;
    v190 = 0.0;
    HIDWORD(v197) = 0;
    v191 = 0.0;
    *(_QWORD *)&v10 = 134219264;
    v195 = v10;
    v188 = 0.0;
    v189 = 0.0;
    v187 = 0.0;
    v192 = 0.0;
    v194 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    do
    {
      v17 = *v13;
      v18 = **v13;
      if (v18 >= a3 && v18 < a4)
      {
        v20 = v13[1];
        v200 = (const char *)*v13;
        v201 = *(double *)&v20;
        if (*(double *)&v20 != 0.0)
        {
          v21 = (unint64_t *)(v20 + 1);
          do
            v22 = __ldxr(v21);
          while (__stxr(v22 + 1, v21));
        }
        if (*((_DWORD *)v17 + 25) == 1)
          HIDWORD(v197) += (*((unsigned __int16 *)v17 + 65) >> 1) & 1;
        if (v206 == v205)
          goto LABEL_34;
        v23 = &v205[8 * (v208 >> 8)];
        v24 = *(_QWORD *)v23 + 16 * v208;
        v25 = *(_QWORD *)&v205[((v209 + v208) >> 5) & 0x7FFFFFFFFFFFFF8] + 16 * (v209 + v208);
        if (v24 == v25)
          goto LABEL_34;
        v26 = 1.79769313e308;
        do
        {
          v27 = *(double **)v24;
          v28 = vabdd_f64(**v13, **(double **)v24);
          if (v28 < v26 && v28 <= 5.0)
          {
            v30 = *(double *)(v24 + 8);
            if (v30 != 0.0)
            {
              v31 = (unint64_t *)(*(_QWORD *)&v30 + 8);
              do
                v32 = __ldxr(v31);
              while (__stxr(v32 + 1, v31));
            }
            v33 = *(std::__shared_weak_count **)&v203;
            v202 = (const char *)v27;
            v203 = v30;
            if (v33)
            {
              p_shared_owners = (unint64_t *)&v33->__shared_owners_;
              do
                v35 = __ldaxr(p_shared_owners);
              while (__stlxr(v35 - 1, p_shared_owners));
              if (!v35)
              {
                ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
                std::__shared_weak_count::__release_weak(v33);
              }
            }
            v26 = v28;
          }
          v24 += 16;
          if (v24 - *(_QWORD *)v23 == 4096)
          {
            v36 = *((_QWORD *)v23 + 1);
            v23 += 8;
            v24 = v36;
          }
        }
        while (v24 != v25);
        if (v26 == 1.79769313e308)
        {
LABEL_34:
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10214F870);
          v37 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
          {
            v38 = *(const char **)*v13;
            v39 = **(_QWORD **)(*(_QWORD *)&v205[(v208 >> 5) & 0x7FFFFFFFFFFFFF8] + 16 * v208);
            v40 = **(_QWORD **)(*(_QWORD *)&v205[((v208 + v209 - 1) >> 5) & 0x7FFFFFFFFFFFFF8]
                              + 16 * (v208 + v209 - 1));
            *(_DWORD *)buf = v195;
            v234 = v38;
            v235 = 2048;
            *(_QWORD *)v236 = v39;
            *(_WORD *)&v236[8] = 2048;
            *(_QWORD *)&v236[10] = v40;
            *(_WORD *)&v236[18] = 2048;
            *(double *)&v236[20] = a3;
            *(_WORD *)&v236[28] = 2048;
            *(double *)&v236[30] = a4;
            *(_WORD *)&v236[38] = 2048;
            *(double *)&v236[40] = a5;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "pressure too far from reference data,locationTime,%f,firstPsTime,%f,lastPsTime,%f,startTime,%f,endTime,%f,nextTrackStartTime,%f", buf, 0x3Eu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_10214F870);
            v75 = *(const char **)*v13;
            v76 = **(_QWORD **)(*(_QWORD *)&v205[(v208 >> 5) & 0x7FFFFFFFFFFFFF8] + 16 * v208);
            v77 = **(_QWORD **)(*(_QWORD *)&v205[((v208 + v209 - 1) >> 5) & 0x7FFFFFFFFFFFFF8]
                              + 16 * (v208 + v209 - 1));
            v215 = v195;
            v216 = v75;
            v217 = 2048;
            *(_QWORD *)v218 = v76;
            *(_WORD *)&v218[8] = 2048;
            *(_QWORD *)&v218[10] = v77;
            *(_WORD *)&v218[18] = 2048;
            *(double *)&v218[20] = a3;
            *(_WORD *)&v218[28] = 2048;
            *(double *)&v218[30] = a4;
            *(_WORD *)&v218[38] = 2048;
            *(double *)&v218[40] = a5;
            LODWORD(v186) = 62;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "pressure too far from reference data,locationTime,%f,firstPsTime,%f,lastPsTime,%f,startTime,%f,endTime,%f,nextTrackStartTime,%f", COERCE_DOUBLE(&v215), v186, v187, v188, v189, v190);
            v79 = (uint8_t *)v78;
            sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v78);
            if (v79 != buf)
              free(v79);
          }
        }
        else
        {
          v45 = v202;
          v46 = *((double *)v202 + 1) * 1000.0;
          v47 = sub_10024806C(v46, 101320.0);
          *(double *)&v198 = -1.0;
          v199 = 1.79769313e308;
          +[CLBarometerCalibrationBiasEstimator getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:](CLBarometerCalibrationBiasEstimator, "getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:", &v200, &v199, &v198);
          if ((*((_DWORD *)v200 + 25) & 0x80000000) == 0 && **v13 < a5)
          {
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_10214F870);
            v48 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
            {
              v49 = *((_DWORD *)v200 + 25);
              v50 = *(_QWORD *)*v13;
              v51 = *(_QWORD *)v45;
              v52 = *((_QWORD *)v200 + 4);
              v54 = *((_QWORD *)v200 + 6);
              v53 = *((_QWORD *)v200 + 7);
              *(_DWORD *)buf = 136319490;
              v234 = "type";
              v235 = 1024;
              *(_DWORD *)v236 = v49;
              *(_WORD *)&v236[4] = 2080;
              *(_QWORD *)&v236[6] = "locTime";
              *(_WORD *)&v236[14] = 2048;
              *(_QWORD *)&v236[16] = v50;
              *(_WORD *)&v236[24] = 2080;
              *(_QWORD *)&v236[26] = "pressureTime";
              *(_WORD *)&v236[34] = 2048;
              *(_QWORD *)&v236[36] = v51;
              *(_WORD *)&v236[44] = 2080;
              *(_QWORD *)&v236[46] = "locationAlt";
              *(_WORD *)&v236[54] = 2048;
              *(double *)&v236[56] = v199;
              *(_WORD *)&v236[64] = 2080;
              *(_QWORD *)&v236[66] = "pressureAlt";
              *(_WORD *)&v236[74] = 2048;
              *(double *)&v236[76] = v47;
              *(_WORD *)&v236[84] = 2080;
              *(_QWORD *)&v236[86] = "locVerticalUnc";
              *(_WORD *)&v236[94] = 2048;
              *(_QWORD *)&v236[96] = v198;
              *(_WORD *)&v236[104] = 2080;
              *(_QWORD *)&v236[106] = "locHorizontalUnc";
              *(_WORD *)&v236[114] = 2048;
              *(_QWORD *)&v236[116] = v52;
              v237 = 2080;
              v238 = "demAlt";
              v239 = 2048;
              *(_QWORD *)v240 = v54;
              *(_WORD *)&v240[8] = 2080;
              *(_QWORD *)&v240[10] = "demVerticalUnc";
              *(_WORD *)&v240[18] = 2048;
              *(_QWORD *)&v240[20] = v53;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0xB2u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_10214F870);
              v80 = *((_DWORD *)v200 + 25);
              v81 = *(_QWORD *)*v13;
              v82 = *(_QWORD *)v45;
              v83 = *((_QWORD *)v200 + 4);
              v85 = *((_QWORD *)v200 + 6);
              v84 = *((_QWORD *)v200 + 7);
              v215 = 136319490;
              v216 = "type";
              v217 = 1024;
              *(_DWORD *)v218 = v80;
              *(_WORD *)&v218[4] = 2080;
              *(_QWORD *)&v218[6] = "locTime";
              *(_WORD *)&v218[14] = 2048;
              *(_QWORD *)&v218[16] = v81;
              *(_WORD *)&v218[24] = 2080;
              *(_QWORD *)&v218[26] = "pressureTime";
              *(_WORD *)&v218[34] = 2048;
              *(_QWORD *)&v218[36] = v82;
              *(_WORD *)&v218[44] = 2080;
              *(_QWORD *)&v218[46] = "locationAlt";
              *(_WORD *)&v218[54] = 2048;
              *(double *)&v218[56] = v199;
              *(_WORD *)&v218[64] = 2080;
              *(_QWORD *)&v218[66] = "pressureAlt";
              *(_WORD *)&v218[74] = 2048;
              *(double *)&v218[76] = v47;
              *(_WORD *)&v218[84] = 2080;
              *(_QWORD *)&v218[86] = "locVerticalUnc";
              *(_WORD *)&v218[94] = 2048;
              *(_QWORD *)&v218[96] = v198;
              *(_WORD *)&v218[104] = 2080;
              *(_QWORD *)&v218[106] = "locHorizontalUnc";
              *(_WORD *)&v218[114] = 2048;
              *(_QWORD *)&v218[116] = v83;
              v219 = 2080;
              v220 = "demAlt";
              v221 = 2048;
              *(_QWORD *)v222 = v85;
              *(_WORD *)&v222[8] = 2080;
              *(_QWORD *)&v222[10] = "demVerticalUnc";
              *(_WORD *)&v222[18] = 2048;
              *(_QWORD *)&v222[20] = v84;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v215, 178, *(const char **)&v187, v188, *(const char **)&v189, v190, *(const char **)&v191, v192, v193, v194, (const char *)v195,
                *((double *)&v195 + 1),
                v196,
                v197,
                v198,
                v199,
                v200,
                v201);
              v87 = (uint8_t *)v86;
              sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v86);
              if (v87 != buf)
                free(v87);
            }
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_10214F870);
            v55 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
            {
              v56 = *((_QWORD *)v200 + 1);
              v57 = *((_QWORD *)v200 + 2);
              v58 = *((_QWORD *)v200 + 8);
              v59 = *((_QWORD *)v200 + 9);
              v60 = *((_QWORD *)v200 + 10);
              v61 = *((_QWORD *)v200 + 11);
              v62 = *((_DWORD *)v200 + 24);
              v63 = *((_DWORD *)v200 + 26);
              v64 = *((_QWORD *)v200 + 3);
              v65 = *((double *)v200 + 5);
              v66 = *((double *)v200 + 14);
              v67 = *((_QWORD *)v200 + 15);
              *(_DWORD *)buf = 136321026;
              v234 = "lat";
              v235 = 2048;
              *(_QWORD *)v236 = v56;
              *(_WORD *)&v236[8] = 2080;
              *(_QWORD *)&v236[10] = "lon";
              *(_WORD *)&v236[18] = 2048;
              *(_QWORD *)&v236[20] = v57;
              *(_WORD *)&v236[28] = 2080;
              *(_QWORD *)&v236[30] = "slope";
              *(_WORD *)&v236[38] = 2048;
              *(_QWORD *)&v236[40] = v58;
              *(_WORD *)&v236[48] = 2080;
              *(_QWORD *)&v236[50] = "maxAbsSlope";
              *(_WORD *)&v236[58] = 2048;
              *(_QWORD *)&v236[60] = v59;
              *(_WORD *)&v236[68] = 2080;
              *(_QWORD *)&v236[70] = "speed";
              *(_WORD *)&v236[78] = 2048;
              *(_QWORD *)&v236[80] = v60;
              *(_WORD *)&v236[88] = 2080;
              *(_QWORD *)&v236[90] = "speedAccuracy";
              *(_WORD *)&v236[98] = 2048;
              *(_QWORD *)&v236[100] = v61;
              *(_WORD *)&v236[108] = 2080;
              *(_QWORD *)&v236[110] = "environment";
              *(_WORD *)&v236[118] = 1024;
              *(_DWORD *)&v236[120] = v62;
              v237 = 2080;
              v238 = "matchQuality";
              v239 = 1024;
              *(_DWORD *)v240 = v63;
              *(_WORD *)&v240[4] = 2080;
              *(_QWORD *)&v240[6] = "altitude";
              *(_WORD *)&v240[14] = 2048;
              *(_QWORD *)&v240[16] = v64;
              *(_WORD *)&v240[24] = 2080;
              *(_QWORD *)&v240[26] = "verticalAccuracy";
              v241 = 2048;
              v242 = v65;
              v243 = 2080;
              v244 = "rawAltitude";
              v245 = 2048;
              v246 = v66;
              v247 = 2080;
              v248 = "rawVerticalAccuracy";
              v249 = 2048;
              v250 = v67;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "unused location data,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0xEAu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_10214F870);
              v88 = *((_QWORD *)v200 + 1);
              v89 = *((_QWORD *)v200 + 2);
              v90 = *((_QWORD *)v200 + 8);
              v91 = *((_QWORD *)v200 + 9);
              v92 = *((_QWORD *)v200 + 10);
              v93 = *((_QWORD *)v200 + 11);
              v94 = *((_DWORD *)v200 + 24);
              v95 = *((_DWORD *)v200 + 26);
              v96 = *((_QWORD *)v200 + 3);
              v97 = *((double *)v200 + 5);
              v98 = *((double *)v200 + 14);
              v99 = *((_QWORD *)v200 + 15);
              v215 = 136321026;
              v216 = "lat";
              v217 = 2048;
              *(_QWORD *)v218 = v88;
              *(_WORD *)&v218[8] = 2080;
              *(_QWORD *)&v218[10] = "lon";
              *(_WORD *)&v218[18] = 2048;
              *(_QWORD *)&v218[20] = v89;
              *(_WORD *)&v218[28] = 2080;
              *(_QWORD *)&v218[30] = "slope";
              *(_WORD *)&v218[38] = 2048;
              *(_QWORD *)&v218[40] = v90;
              *(_WORD *)&v218[48] = 2080;
              *(_QWORD *)&v218[50] = "maxAbsSlope";
              *(_WORD *)&v218[58] = 2048;
              *(_QWORD *)&v218[60] = v91;
              *(_WORD *)&v218[68] = 2080;
              *(_QWORD *)&v218[70] = "speed";
              *(_WORD *)&v218[78] = 2048;
              *(_QWORD *)&v218[80] = v92;
              *(_WORD *)&v218[88] = 2080;
              *(_QWORD *)&v218[90] = "speedAccuracy";
              *(_WORD *)&v218[98] = 2048;
              *(_QWORD *)&v218[100] = v93;
              *(_WORD *)&v218[108] = 2080;
              *(_QWORD *)&v218[110] = "environment";
              *(_WORD *)&v218[118] = 1024;
              *(_DWORD *)&v218[120] = v94;
              v219 = 2080;
              v220 = "matchQuality";
              v221 = 1024;
              *(_DWORD *)v222 = v95;
              *(_WORD *)&v222[4] = 2080;
              *(_QWORD *)&v222[6] = "altitude";
              *(_WORD *)&v222[14] = 2048;
              *(_QWORD *)&v222[16] = v96;
              *(_WORD *)&v222[24] = 2080;
              *(_QWORD *)&v222[26] = "verticalAccuracy";
              v223 = 2048;
              v224 = v97;
              v225 = 2080;
              v226 = "rawAltitude";
              v227 = 2048;
              v228 = v98;
              v229 = 2080;
              v230 = "rawVerticalAccuracy";
              v231 = 2048;
              v232 = v99;
              LODWORD(v186) = 234;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "unused location data,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v215, v186, *(const char **)&v187, v188, *(const char **)&v189, v190, *(const char **)&v191, v192, v193, v194, (const char *)v195,
                *((double *)&v195 + 1),
                v196,
                LODWORD(v197),
                v198,
                LODWORD(v199),
                v200,
                v201,
                v202,
                v203,
                v204,
                *(double *)&v205,
                v206,
                v207);
              v101 = (uint8_t *)v100;
              sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v100);
              if (v101 != buf)
                free(v101);
            }
          }
          v68 = *((double *)v200 + 1);
          if (v68 != 1.79769313e308)
          {
            v69 = *((double *)v200 + 2);
            v70 = v69 == 1.79769313e308;
            v71 = v15 + v68;
            v72 = v16 + v69;
            if (!v70)
            {
              v16 = v72;
              v15 = v71;
            }
            v73 = v193;
            if (!v70)
              v73 = v193 + 1;
            v193 = v73;
          }
          if (*((_DWORD *)v200 + 25) == 1)
          {
            v74 = *((double *)v200 + 7);
            if (v74 > 0.0)
            {
              ++HIDWORD(v190);
              v188 = v188 + v74;
              v189 = v189 + *((double *)v200 + 6);
              v187 = v187 + v199;
              v191 = v191 + v47;
              v192 = v192 + *(double *)&v198;
              v194 = v194 + *((double *)v202 + 1) * 1000.0;
              LODWORD(v190) += *((_WORD *)v200 + 65) & 1;
            }
          }
        }
        v41 = *(std::__shared_weak_count **)&v201;
        if (v201 != 0.0)
        {
          v42 = (unint64_t *)(*(_QWORD *)&v201 + 8);
          do
            v43 = __ldaxr(v42);
          while (__stlxr(v43 - 1, v42));
          if (!v43)
          {
            ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
            std::__shared_weak_count::__release_weak(v41);
          }
        }
      }
      v13 += 2;
      if ((double **)((char *)v13 - *v12) == (double **)4096)
      {
        v44 = (double **)v12[1];
        ++v12;
        v13 = v44;
      }
    }
    while (v13 != (double **)v14);
    if (v193)
    {
      -[CLMeanSeaLevelPressureEstimator setCurrentLatitude:](self->_meanSeaLevelPressureEstimator, "setCurrentLatitude:", v15 / (double)(unint64_t)v193);
      v11 = v191;
      v103 = LODWORD(v190);
      v102 = HIDWORD(v190);
      v106 = v188;
      v105 = v189;
      v107 = v187;
      v104 = HIDWORD(v197);
      -[CLMeanSeaLevelPressureEstimator setCurrentLongitude:](self->_meanSeaLevelPressureEstimator, "setCurrentLongitude:", v16 / (double)(unint64_t)v193);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v108 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        -[CLMeanSeaLevelPressureEstimator currentLatitude](self->_meanSeaLevelPressureEstimator, "currentLatitude");
        v110 = v109;
        -[CLMeanSeaLevelPressureEstimator currentLongitude](self->_meanSeaLevelPressureEstimator, "currentLongitude");
        *(_DWORD *)buf = 134218240;
        v234 = v110;
        v235 = 2048;
        *(_QWORD *)v236 = v111;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "update mean sea level pressure location,lat,%f,lon,%f", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v180 = qword_10229FE88;
        -[CLMeanSeaLevelPressureEstimator currentLatitude](self->_meanSeaLevelPressureEstimator, "currentLatitude");
        v182 = v181;
        -[CLMeanSeaLevelPressureEstimator currentLongitude](self->_meanSeaLevelPressureEstimator, "currentLongitude");
        v215 = 134218240;
        v216 = v182;
        v217 = 2048;
        *(_QWORD *)v218 = v183;
        LODWORD(v186) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v180, 0, "update mean sea level pressure location,lat,%f,lon,%f", COERCE_DOUBLE(&v215), v186);
        v185 = (uint8_t *)v184;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v184);
        if (v185 != buf)
          free(v185);
        v11 = v191;
        v103 = LODWORD(v190);
        v102 = HIDWORD(v190);
        v106 = v188;
        v105 = v189;
        v107 = v187;
        v104 = HIDWORD(v197);
      }
      -[CLMeanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:](self->_meanSeaLevelPressureEstimator, "refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:", a4 + -10800.0, a4);
    }
    else
    {
      v11 = v191;
      v103 = LODWORD(v190);
      v102 = HIDWORD(v190);
      v106 = v188;
      v105 = v189;
      v107 = v187;
      v104 = HIDWORD(v197);
    }
  }
  self->_inOutdoorWorkoutStatus = v104 > 119;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v112 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    inOutdoorWorkoutStatus = self->_inOutdoorWorkoutStatus;
    *(_DWORD *)buf = 136316930;
    v234 = "inOutdoorWorkoutPoint";
    v235 = 1024;
    *(_DWORD *)v236 = v104;
    *(_WORD *)&v236[4] = 2080;
    *(_QWORD *)&v236[6] = "inOutdoorWorkoutStatus";
    *(_WORD *)&v236[14] = 1024;
    *(_DWORD *)&v236[16] = inOutdoorWorkoutStatus;
    *(_WORD *)&v236[20] = 2080;
    *(_QWORD *)&v236[22] = "trackStartTime";
    *(_WORD *)&v236[30] = 2048;
    *(double *)&v236[32] = a3;
    *(_WORD *)&v236[40] = 2080;
    *(_QWORD *)&v236[42] = "trackEndTime";
    *(_WORD *)&v236[50] = 2048;
    *(double *)&v236[52] = a4;
    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "in outdoor workout info,%s,%u,%s,%d,%s,%f,%s,%f", buf, 0x4Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v160 = self->_inOutdoorWorkoutStatus;
    v215 = 136316930;
    v216 = "inOutdoorWorkoutPoint";
    v217 = 1024;
    *(_DWORD *)v218 = v104;
    *(_WORD *)&v218[4] = 2080;
    *(_QWORD *)&v218[6] = "inOutdoorWorkoutStatus";
    *(_WORD *)&v218[14] = 1024;
    *(_DWORD *)&v218[16] = v160;
    *(_WORD *)&v218[20] = 2080;
    *(_QWORD *)&v218[22] = "trackStartTime";
    *(_WORD *)&v218[30] = 2048;
    *(double *)&v218[32] = a3;
    *(_WORD *)&v218[40] = 2080;
    *(_QWORD *)&v218[42] = "trackEndTime";
    *(_WORD *)&v218[50] = 2048;
    *(double *)&v218[52] = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "in outdoor workout info,%s,%u,%s,%d,%s,%f,%s,%f", (const char *)&v215, 74, *(const char **)&v187, LODWORD(v188), *(const char **)&v189, v190, *(const char **)&v191, v192);
    v162 = (uint8_t *)v161;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v161);
    if (v162 != buf)
      free(v162);
  }
  if (!v102)
    goto LABEL_109;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v114 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v234 = "GPSBasedDEMPoints";
    v235 = 1024;
    *(_DWORD *)v236 = v102;
    *(_WORD *)&v236[4] = 2080;
    *(_QWORD *)&v236[6] = "underDEMPoints";
    *(_WORD *)&v236[14] = 1024;
    *(_DWORD *)&v236[16] = v103;
    _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "under Dem or latched high data points check,%s,%d,%s,%d", buf, 0x22u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v215 = 136315906;
    v216 = "GPSBasedDEMPoints";
    v217 = 1024;
    *(_DWORD *)v218 = v102;
    *(_WORD *)&v218[4] = 2080;
    *(_QWORD *)&v218[6] = "underDEMPoints";
    *(_WORD *)&v218[14] = 1024;
    *(_DWORD *)&v218[16] = v103;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "under Dem or latched high data points check,%s,%d,%s,%d", (const char *)&v215, 34, *(const char **)&v187, LODWORD(v188));
    v164 = (uint8_t *)v163;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v163);
    if (v164 != buf)
      free(v164);
  }
  v115 = objc_opt_new(CLMeanSeaLevelPressureData);
  -[CLMeanSeaLevelPressureData setTimestamp:](v115, "setTimestamp:", a4);
  if (v102 != v103)
  {
    v116 = v11 / (double)v102;
    v129 = v105 / (double)v102;
    v130 = v107 / (double)v102;
    v131 = v192 / (double)v102;
    v132 = v116 + self->_bias - self->_weatherEstimateInMeter;
    if (v132 > v129 + 100.0 && v132 > v131 + v130)
    {
      self->_biasUncertaintyAtRebase = v131;
      v135 = v194 / (double)v102;
      self->_bias = v130 - v116;
      self->_biasPressure = v135;
      v136 = v130;
      v137 = v135;
      v138 = sub_1013D36B0(v136, v137);
      self->_estimatedAbsoluteAltitudeUncertainty = v131;
      self->_estimatedMeanSeaLevelPressure = v138;
      biasPressure = self->_biasPressure;
      v140 = v130;
      -[CLMeanSeaLevelPressureData setUncertainty:](v115, "setUncertainty:", v131 * sub_1013D373C(v140, biasPressure));
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v115, "setMeanSeaLevelPressure:", self->_estimatedMeanSeaLevelPressure);
      v127 = v132 - v130;
      v128 = 4294967293;
      goto LABEL_110;
    }

LABEL_109:
    v134 = 0;
    goto LABEL_121;
  }
  v116 = v11 / (double)v103;
  v117 = v105 / (double)v103;
  v118 = v106 / (double)v103;
  bias = self->_bias;
  weatherEstimateInMeter = self->_weatherEstimateInMeter;
  self->_biasUncertaintyAtRebase = v118;
  v121 = v194 / (double)v103;
  self->_bias = v117 - v116;
  self->_biasPressure = v121;
  v122 = v117;
  v123 = v121;
  v124 = sub_1013D36B0(v122, v123);
  self->_estimatedAbsoluteAltitudeUncertainty = v118;
  self->_estimatedMeanSeaLevelPressure = v124;
  v125 = self->_biasPressure;
  v126 = v117;
  -[CLMeanSeaLevelPressureData setUncertainty:](v115, "setUncertainty:", v118 * sub_1013D373C(v126, v125));
  -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v115, "setMeanSeaLevelPressure:", self->_estimatedMeanSeaLevelPressure);
  v127 = v116 + bias - weatherEstimateInMeter - v117;
  v128 = 4294967294;
LABEL_110:
  self->_forceCalibrate = 1;
  -[CLBarometerCalibrationBiasEstimator updateHistoricalMslpArray:](self, "updateHistoricalMslpArray:", v115);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v141 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v115, "meanSeaLevelPressure");
    v143 = v142;
    -[CLMeanSeaLevelPressureData uncertainty](v115, "uncertainty");
    v145 = v144;
    -[CLMeanSeaLevelPressureData timestamp](v115, "timestamp");
    *(_DWORD *)buf = 136317954;
    v234 = "type";
    v235 = 1024;
    *(_DWORD *)v236 = v128;
    *(_WORD *)&v236[4] = 2080;
    *(_QWORD *)&v236[6] = "meanSeaLevelPressure";
    *(_WORD *)&v236[14] = 2048;
    *(_QWORD *)&v236[16] = v143;
    *(_WORD *)&v236[24] = 2080;
    *(_QWORD *)&v236[26] = "uncertainty";
    *(_WORD *)&v236[34] = 2048;
    *(_QWORD *)&v236[36] = v145;
    *(_WORD *)&v236[44] = 2080;
    *(_QWORD *)&v236[46] = "timestamp";
    *(_WORD *)&v236[54] = 2048;
    *(_QWORD *)&v236[56] = v146;
    *(_WORD *)&v236[64] = 2080;
    *(_QWORD *)&v236[66] = "startAt";
    *(_WORD *)&v236[74] = 2048;
    *(double *)&v236[76] = a3;
    *(_WORD *)&v236[84] = 2080;
    *(_QWORD *)&v236[86] = "endAt";
    *(_WORD *)&v236[94] = 2048;
    *(double *)&v236[96] = a4;
    _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x76u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v165 = qword_10229FE88;
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v115, "meanSeaLevelPressure");
    v167 = v166;
    -[CLMeanSeaLevelPressureData uncertainty](v115, "uncertainty");
    v169 = v168;
    -[CLMeanSeaLevelPressureData timestamp](v115, "timestamp");
    v215 = 136317954;
    v216 = "type";
    v217 = 1024;
    *(_DWORD *)v218 = v128;
    *(_WORD *)&v218[4] = 2080;
    *(_QWORD *)&v218[6] = "meanSeaLevelPressure";
    *(_WORD *)&v218[14] = 2048;
    *(_QWORD *)&v218[16] = v167;
    *(_WORD *)&v218[24] = 2080;
    *(_QWORD *)&v218[26] = "uncertainty";
    *(_WORD *)&v218[34] = 2048;
    *(_QWORD *)&v218[36] = v169;
    *(_WORD *)&v218[44] = 2080;
    *(_QWORD *)&v218[46] = "timestamp";
    *(_WORD *)&v218[54] = 2048;
    *(_QWORD *)&v218[56] = v170;
    *(_WORD *)&v218[64] = 2080;
    *(_QWORD *)&v218[66] = "startAt";
    *(_WORD *)&v218[74] = 2048;
    *(double *)&v218[76] = a3;
    *(_WORD *)&v218[84] = 2080;
    *(_QWORD *)&v218[86] = "endAt";
    *(_WORD *)&v218[94] = 2048;
    *(double *)&v218[96] = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v165, 0, "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v215, 118, *(const char **)&v187, v188, *(const char **)&v189, v190, *(const char **)&v191, v192, v193, v194, (const char *)v195,
      *((double *)&v195 + 1));
    v172 = (uint8_t *)v171;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v171);
    if (v172 != buf)
      free(v172);
  }

  self->_biasTimestamp = a4;
  self->_pressureUncertainty = 0.0;
  self->_distanceTraveled = 0.0;
  self->_biasLocation = (BiasEstimatorLocation)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  sub_1008B5798((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
  -[CLBarometerCalibrationBiasEstimator rebaseSignificantElevationWithEndTime:](self, "rebaseSignificantElevationWithEndTime:", a4);
  -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithAbsSigElevation:withCompanion:](self, "updateBiasUncertaintyWithAbsSigElevation:withCompanion:", 0, sub_1008B53F0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v147, v148, v149));
  -[CLBarometerCalibrationBiasEstimator sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource:andCorrection:andDistance:](self, "sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource:andCorrection:andDistance:", 1, self->_inOutdoorWorkoutStatus, v128, v127, self->_biasUncertainty, self->_biasUncertaintyAtRebase, v127, self->_distanceSinceLastRebase);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v150 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    v151 = self->_bias;
    biasUncertaintyAtRebase = self->_biasUncertaintyAtRebase;
    biasUncertainty = self->_biasUncertainty;
    v154 = self->_weatherEstimateInMeter;
    v155 = self->_inOutdoorWorkoutStatus;
    *(_DWORD *)buf = 136320514;
    v234 = "type";
    v235 = 1024;
    *(_DWORD *)v236 = v128;
    *(_WORD *)&v236[4] = 2080;
    *(_QWORD *)&v236[6] = "newBias";
    *(_WORD *)&v236[14] = 2048;
    *(double *)&v236[16] = v151;
    *(_WORD *)&v236[24] = 2080;
    *(_QWORD *)&v236[26] = "newBiasUncertainty";
    *(_WORD *)&v236[34] = 2048;
    *(double *)&v236[36] = biasUncertaintyAtRebase;
    *(_WORD *)&v236[44] = 2080;
    *(_QWORD *)&v236[46] = "oldBaroAltitude";
    *(_WORD *)&v236[54] = 2048;
    *(double *)&v236[56] = v116;
    *(_WORD *)&v236[64] = 2080;
    *(_QWORD *)&v236[66] = "oldRefAltitude";
    *(_WORD *)&v236[74] = 2048;
    *(double *)&v236[76] = v116 + v151;
    *(_WORD *)&v236[84] = 2080;
    *(_QWORD *)&v236[86] = "oldBaroUncertainty";
    *(_WORD *)&v236[94] = 2048;
    *(double *)&v236[96] = biasUncertainty;
    *(_WORD *)&v236[104] = 2080;
    *(_QWORD *)&v236[106] = "oldRefUncertainty";
    *(_WORD *)&v236[114] = 2048;
    *(double *)&v236[116] = biasUncertaintyAtRebase;
    v237 = 2080;
    v238 = "weatherEstimateInMeter";
    v239 = 2048;
    *(double *)v240 = v154;
    *(_WORD *)&v240[8] = 2080;
    *(_QWORD *)&v240[10] = "inOutdoorWorkout";
    *(_WORD *)&v240[18] = 1024;
    *(_DWORD *)&v240[20] = v155;
    *(_WORD *)&v240[24] = 2080;
    *(_QWORD *)&v240[26] = "calculatedFromTrackStartAt";
    v241 = 2048;
    v242 = a3;
    v243 = 2080;
    v244 = "endAt";
    v245 = 2048;
    v246 = a4;
    _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_DEFAULT, "pressure height rebase to,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%f,%s,%f", buf, 0xD6u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v173 = self->_bias;
    v174 = self->_biasUncertaintyAtRebase;
    v175 = self->_biasUncertainty;
    v176 = self->_weatherEstimateInMeter;
    v177 = self->_inOutdoorWorkoutStatus;
    v215 = 136320514;
    v216 = "type";
    v217 = 1024;
    *(_DWORD *)v218 = v128;
    *(_WORD *)&v218[4] = 2080;
    *(_QWORD *)&v218[6] = "newBias";
    *(_WORD *)&v218[14] = 2048;
    *(double *)&v218[16] = v173;
    *(_WORD *)&v218[24] = 2080;
    *(_QWORD *)&v218[26] = "newBiasUncertainty";
    *(_WORD *)&v218[34] = 2048;
    *(double *)&v218[36] = v174;
    *(_WORD *)&v218[44] = 2080;
    *(_QWORD *)&v218[46] = "oldBaroAltitude";
    *(_WORD *)&v218[54] = 2048;
    *(double *)&v218[56] = v116;
    *(_WORD *)&v218[64] = 2080;
    *(_QWORD *)&v218[66] = "oldRefAltitude";
    *(_WORD *)&v218[74] = 2048;
    *(double *)&v218[76] = v116 + v173;
    *(_WORD *)&v218[84] = 2080;
    *(_QWORD *)&v218[86] = "oldBaroUncertainty";
    *(_WORD *)&v218[94] = 2048;
    *(double *)&v218[96] = v175;
    *(_WORD *)&v218[104] = 2080;
    *(_QWORD *)&v218[106] = "oldRefUncertainty";
    *(_WORD *)&v218[114] = 2048;
    *(double *)&v218[116] = v174;
    v219 = 2080;
    v220 = "weatherEstimateInMeter";
    v221 = 2048;
    *(double *)v222 = v176;
    *(_WORD *)&v222[8] = 2080;
    *(_QWORD *)&v222[10] = "inOutdoorWorkout";
    *(_WORD *)&v222[18] = 1024;
    *(_DWORD *)&v222[20] = v177;
    *(_WORD *)&v222[24] = 2080;
    *(_QWORD *)&v222[26] = "calculatedFromTrackStartAt";
    v223 = 2048;
    v224 = a3;
    v225 = 2080;
    v226 = "endAt";
    v227 = 2048;
    v228 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "pressure height rebase to,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%f,%s,%f", (const char *)&v215, 214, *(const char **)&v187, v188, *(const char **)&v189, v190, *(const char **)&v191, v192, v193, v194, (const char *)v195,
      *((double *)&v195 + 1),
      v196,
      v197,
      v198,
      v199,
      v200,
      LODWORD(v201),
      v202,
      v203,
      v204,
      *(double *)&v205);
    v179 = (uint8_t *)v178;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v178);
    if (v179 != buf)
      free(v179);
  }
  self->_forceCalibrate = 0;
  v134 = 1;
LABEL_121:
  v156 = *(std::__shared_weak_count **)&v203;
  if (v203 != 0.0)
  {
    v157 = (unint64_t *)(*(_QWORD *)&v203 + 8);
    do
      v158 = __ldaxr(v157);
    while (__stlxr(v158 - 1, v157));
    if (!v158)
    {
      ((void (*)(std::__shared_weak_count *))v156->__on_zero_shared)(v156);
      std::__shared_weak_count::__release_weak(v156);
    }
  }
  sub_1006F0FB8(&v204);
  sub_1006F0FB8(&v210);
  return v134;
}

- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
  double v5;
  double v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void **p_dataBuffers;
  __int128 v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  __objc2_class *v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  NSObject *isa;
  uint64_t v28;
  uint64_t v29;
  __objc2_class *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double *v35;
  double v36;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  float v49;
  float v50;
  double v51;
  double v52;
  double v53;
  NSObject *v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  NSObject *v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  NSObject *v64;
  unint64_t *v65;
  unint64_t v66;
  uint64_t v67;
  __objc2_class *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint8_t *v72;
  __objc2_class *v73;
  const char *v74;
  uint8_t *v75;
  __objc2_class *v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint8_t *v81;
  __objc2_class *v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  const char *v87;
  uint8_t *v88;
  NSObject *v89;
  const char *v90;
  uint8_t *v91;
  CLMeanSeaLevelPressureData *v92;
  double v93;
  double v94;
  double v95;
  float v96;
  float v97;
  float biasPressure;
  float v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  NSObject *v106;
  double bias;
  double biasUncertaintyAtRebase;
  double biasUncertainty;
  double weatherEstimateInMeter;
  _BOOL4 inOutdoorWorkoutStatus;
  NSObject *v112;
  double v113;
  double v114;
  double biasTimestamp;
  double v116;
  double v117;
  double v118;
  id v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  _BOOL4 v126;
  double v127;
  NSObject *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD *v134;
  double **v135;
  uint64_t v136;
  double v137;
  double *v139;
  unint64_t *v140;
  unint64_t v141;
  _QWORD *v142;
  uint64_t v143;
  uint64_t v144;
  double v145;
  double *v146;
  double v147;
  std::__shared_weak_count *v149;
  unint64_t *v150;
  unint64_t v151;
  std::__shared_weak_count *v152;
  unint64_t *v153;
  unint64_t v154;
  uint64_t v155;
  NSObject *v156;
  const char *v157;
  uint8_t *v158;
  NSObject *v159;
  double v160;
  uint64_t v161;
  std::__shared_weak_count *v162;
  unint64_t *v163;
  unint64_t v164;
  double **v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  char *v169;
  char *v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  unint64_t v174;
  char *v175;
  char *v176;
  char *v177;
  double *v178;
  float v179;
  float v180;
  double v181;
  float v182;
  double v183;
  float v184;
  float v185;
  double *v186;
  double v187;
  double v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint8_t *v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double latitude;
  double v198;
  double v199;
  double *v200;
  double v201;
  uint64_t v202;
  double v203;
  double v204;
  double v205;
  double v206;
  __int128 v207;
  double v208;
  std::__shared_weak_count *v209;
  std::__shared_weak_count **v210;
  BOOL v211;
  std::__shared_weak_count *v212;
  std::__shared_weak_count **v213;
  std::__shared_weak_count *v214;
  std::__shared_weak_count **v215;
  int shared_owners;
  uint64_t *v217;
  NSObject *v218;
  double v219;
  double v220;
  _BOOL4 v221;
  double v222;
  float v223;
  double v224;
  float v225;
  float v226;
  double v227;
  float v228;
  float v229;
  float v230;
  float v231;
  double v232;
  NSObject *v233;
  double estimatedAbsoluteAltitudeUncertainty;
  uint64_t v235;
  uint64_t v236;
  CLMeanSeaLevelPressureData *v237;
  NSObject *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  double v243;
  std::__shared_weak_count *v244;
  unint64_t *v245;
  unint64_t v246;
  double v247;
  float v248;
  double v249;
  double v250;
  double v251;
  double v252;
  NSObject *v253;
  double v254;
  double v255;
  std::__shared_weak_count *v256;
  std::__shared_weak_count *v257;
  double v258;
  double v259;
  double v260;
  _BOOL4 v261;
  double v262;
  double v263;
  std::__shared_weak_count *v264;
  std::__shared_weak_count *v265;
  double v266;
  double v267;
  double v268;
  _BOOL4 v269;
  const char *v270;
  uint8_t *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  const char *v278;
  uint8_t *v279;
  uint64_t v280;
  double v281;
  uint64_t v282;
  const char *v283;
  uint8_t *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  double v290;
  const char *v291;
  uint8_t *v292;
  double v293;
  double v294;
  _BOOL4 v295;
  const char *v296;
  __objc2_class *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  double v302;
  const char *v303;
  uint8_t *v304;
  __objc2_class *v305;
  double v306;
  double v307;
  double v308;
  double v309;
  _BOOL4 v310;
  const char *v311;
  uint8_t *v312;
  __objc2_class *v313;
  double v314;
  double v315;
  double v316;
  const char *v317;
  uint8_t *v318;
  double v319;
  __int128 v320;
  __int128 v321;
  const char *v322;
  double v323;
  const char *v324;
  double v325;
  const char *v326;
  double v327;
  __int128 v328;
  const char *v329;
  double v330;
  double v331;
  double v332;
  int v333;
  BOOL v334;
  _OWORD v335[2];
  uint64_t v336;
  double v337;
  double v338;
  double *v339;
  std::__shared_weak_count *v340;
  _QWORD **v341;
  _QWORD *v342[2];
  double *v343;
  std::__shared_weak_count *v344;
  uint64_t v345;
  double *v346;
  std::__shared_weak_count *v347;
  void *__p;
  char *v349;
  char *v350;
  double v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  unint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  unint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  unint64_t v365;
  uint64_t v366;
  int v367;
  _BYTE v368[64];
  __int16 v369;
  double v370;
  __int16 v371;
  _BYTE v372[28];
  __int16 v373;
  double v374;
  __int16 v375;
  const char *v376;
  __int16 v377;
  uint64_t v378;
  __int16 v379;
  const char *v380;
  __int16 v381;
  uint64_t v382;
  __int16 v383;
  const char *v384;
  __int16 v385;
  uint64_t v386;
  uint8_t buf[4];
  _BYTE v388[64];
  __int16 v389;
  double v390;
  __int16 v391;
  _BYTE v392[28];
  __int16 v393;
  double v394;
  __int16 v395;
  const char *v396;
  __int16 v397;
  uint64_t v398;
  __int16 v399;
  const char *v400;
  __int16 v401;
  uint64_t v402;
  __int16 v403;
  const char *v404;
  __int16 v405;
  uint64_t v406;

  v5 = a4;
  v6 = a3;
  if (a4 - a3 <= 1800.0)
  {
    p_dataBuffers = &self->_dataBuffers;
    sub_100211128((uint64_t)&v362, (_QWORD *)self->_dataBuffers);
    sub_100211128((uint64_t)&v357, (_QWORD *)*p_dataBuffers + 6);
    sub_100211128((uint64_t)&v352, (_QWORD *)self->_dataBuffers + 24);
    v351 = 0.0;
    if (!-[CLBarometerCalibrationBiasEstimator getLastPressureSample:](self, "getLastPressureSample:", &v351))
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v89 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)v388 = v6;
        *(_WORD *)&v388[8] = 2048;
        *(double *)&v388[10] = v5;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "filtered pressure queue is empty,startTime,%f,endTime,%f", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v367 = 134218240;
        *(double *)v368 = v6;
        *(_WORD *)&v368[8] = 2048;
        *(double *)&v368[10] = v5;
        LODWORD(v319) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "filtered pressure queue is empty,startTime,%f,endTime,%f", COERCE_DOUBLE(&v367), v319);
        v91 = (uint8_t *)v90;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v90);
        if (v91 != buf)
          free(v91);
      }
      goto LABEL_260;
    }
    -[CLMeanSeaLevelPressureEstimator setNumberOfTrackEndedBtwRefresh:](self->_meanSeaLevelPressureEstimator, "setNumberOfTrackEndedBtwRefresh:", -[CLMeanSeaLevelPressureEstimator numberOfTrackEndedBtwRefresh](self->_meanSeaLevelPressureEstimator, "numberOfTrackEndedBtwRefresh")+ 1);
    if (-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:](self, "updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:", v6, v5, a5))
    {
LABEL_260:
      sub_1006F0FB8(&v352);
      sub_1006F0FB8(&v357);
      sub_1006F0FB8(&v362);
      return;
    }
    __p = 0;
    v349 = 0;
    v350 = 0;
    v346 = 0;
    v347 = 0;
    *(double *)&v324 = v6;
    v325 = v5;
    if (v354 != v353)
    {
      v14 = (_QWORD *)(v353 + 8 * (v355 >> 8));
      v15 = *v14 + 16 * v355;
      v16 = *(_QWORD *)(v353 + (((v356 + v355) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v356 + v355);
      if (v15 != v16)
      {
        v333 = 0;
        v17 = 0.0;
        v18 = DefaultObserver;
        *(_QWORD *)&v13 = 134218240;
        v328 = v13;
        v327 = 1000.0;
        HIDWORD(v323) = 1204151936;
        *(_QWORD *)&v13 = 134219008;
        v321 = v13;
        *(_QWORD *)&v13 = 136319490;
        v320 = v13;
        v19 = 0.0;
        v330 = 0.0;
        v331 = 0.0;
        v20 = 0.0;
        do
        {
          v21 = *(double **)v15;
          v22 = **(double **)v15;
          if (v22 >= v6 && v22 < v5)
          {
            v24 = *(std::__shared_weak_count **)(v15 + 8);
            v343 = *(double **)v15;
            v344 = v24;
            if (v24)
            {
              p_shared_owners = (unint64_t *)&v24->__shared_owners_;
              do
                v26 = __ldxr(p_shared_owners);
              while (__stxr(v26 + 1, p_shared_owners));
            }
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_10214F870);
            isa = v18[93].isa;
            if (os_log_type_enabled(isa, OS_LOG_TYPE_DEBUG))
            {
              v29 = *(_QWORD *)v21;
              v28 = *((_QWORD *)v21 + 1);
              *(_DWORD *)buf = v328;
              *(_QWORD *)v388 = v28;
              *(_WORD *)&v388[8] = 2048;
              *(_QWORD *)&v388[10] = v29;
              _os_log_impl((void *)&_mh_execute_header, isa, OS_LOG_TYPE_DEBUG, "companion data found,altitude,%f,timestamp,%f", buf, 0x16u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_10214F870);
              v68 = v18[93].isa;
              v70 = *(_QWORD *)v21;
              v69 = *((_QWORD *)v21 + 1);
              v367 = v328;
              *(_QWORD *)v368 = v69;
              *(_WORD *)&v368[8] = 2048;
              *(_QWORD *)&v368[10] = v70;
              LODWORD(v319) = 22;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v68, 2, "companion data found,altitude,%f,timestamp,%f", COERCE_DOUBLE(&v367), v319);
              v72 = (uint8_t *)v71;
              sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v71);
              if (v72 != buf)
                free(v72);
            }
            v30 = v18;
            if (v359 == v358)
              goto LABEL_60;
            v31 = (_QWORD *)(v358 + 8 * (v360 >> 8));
            v32 = *v31 + 16 * v360;
            v33 = *(_QWORD *)(v358 + (((v361 + v360) >> 5) & 0x7FFFFFFFFFFFFF8))
                + 16 * (v361 + v360);
            if (v32 == v33)
              goto LABEL_60;
            v34 = 1.79769313e308;
            do
            {
              v35 = *(double **)v32;
              v36 = vabdd_f64(*v343, **(double **)v32);
              if (v36 < v34 && v36 <= 5.0)
              {
                v38 = *(std::__shared_weak_count **)(v32 + 8);
                if (v38)
                {
                  v39 = (unint64_t *)&v38->__shared_owners_;
                  do
                    v40 = __ldxr(v39);
                  while (__stxr(v40 + 1, v39));
                }
                v41 = v347;
                v346 = v35;
                v347 = v38;
                if (v41)
                {
                  v42 = (unint64_t *)&v41->__shared_owners_;
                  do
                    v43 = __ldaxr(v42);
                  while (__stlxr(v43 - 1, v42));
                  if (!v43)
                  {
                    ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
                    std::__shared_weak_count::__release_weak(v41);
                  }
                }
                v34 = v36;
              }
              v32 += 16;
              if (v32 - *v31 == 4096)
              {
                v44 = v31[1];
                ++v31;
                v32 = v44;
              }
            }
            while (v32 != v33);
            if (v34 == 1.79769313e308)
            {
LABEL_60:
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_10214F870);
              v18 = v30;
              v64 = v30[93].isa;
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "pressure too far from companion data", buf, 2u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE80 != -1)
                  dispatch_once(&qword_10229FE80, &stru_10214F870);
                v73 = v30[93].isa;
                LOWORD(v367) = 0;
                LODWORD(v319) = 2;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v73, 0, "pressure too far from companion data", &v367, *(_QWORD *)&v319);
                v75 = (uint8_t *)v74;
                sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v74);
                if (v75 != buf)
                  free(v75);
              }
            }
            else
            {
              v45 = v17;
              v46 = v19;
              v47 = v343[1];
              v48 = v346[1];
              v49 = v48 * v327;
              v50 = sub_10024806C(v49, *((float *)&v323 + 1));
              v51 = v343[1];
              v18 = v30;
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_10214F870);
              *(double *)&v326 = v20;
              v52 = v50;
              v53 = v51 - v52;
              v54 = v30[93].isa;
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              {
                v55 = *v343;
                v56 = *((_QWORD *)v343 + 1);
                v57 = *(_QWORD *)v346;
                *(_DWORD *)buf = v321;
                *(double *)v388 = v53;
                *(_WORD *)&v388[8] = 2048;
                *(double *)&v388[10] = v55;
                *(_WORD *)&v388[18] = 2048;
                *(_QWORD *)&v388[20] = v56;
                *(_WORD *)&v388[28] = 2048;
                *(_QWORD *)&v388[30] = v57;
                *(_WORD *)&v388[38] = 2048;
                *(double *)&v388[40] = v52;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "individual bias calculated: %f, companion timestamp %f,  companion altitude %f, pressure timestamp %f, pressure altitude %f", buf, 0x34u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE80 != -1)
                  dispatch_once(&qword_10229FE80, &stru_10214F870);
                v76 = v30[93].isa;
                v77 = *v343;
                v78 = *((_QWORD *)v343 + 1);
                v79 = *(_QWORD *)v346;
                v367 = v321;
                *(double *)v368 = v53;
                *(_WORD *)&v368[8] = 2048;
                *(double *)&v368[10] = v77;
                *(_WORD *)&v368[18] = 2048;
                *(_QWORD *)&v368[20] = v78;
                *(_WORD *)&v368[28] = 2048;
                *(_QWORD *)&v368[30] = v79;
                *(_WORD *)&v368[38] = 2048;
                *(double *)&v368[40] = v52;
                LODWORD(v319) = 52;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v76, 2, "individual bias calculated: %f, companion timestamp %f,  companion altitude %f, pressure timestamp %f, pressure altitude %f", COERCE_DOUBLE(&v367), v319, *(double *)&v320, *((double *)&v320 + 1), *(double *)&v321);
                v81 = (uint8_t *)v80;
                sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v80);
                if (v81 != buf)
                  free(v81);
                v18 = v30;
              }
              v58 = v343[2];
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_10214F870);
              v59 = v18[93].isa;
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                v60 = *(_QWORD *)v346;
                v61 = *v343;
                v62 = v343[1];
                v63 = v343[2];
                *(_DWORD *)buf = v320;
                *(_QWORD *)v388 = "type";
                *(_WORD *)&v388[8] = 1024;
                *(_DWORD *)&v388[10] = -1;
                *(_WORD *)&v388[14] = 2080;
                *(_QWORD *)&v388[16] = "locTime";
                *(_WORD *)&v388[24] = 2048;
                *(double *)&v388[26] = v61;
                *(_WORD *)&v388[34] = 2080;
                *(_QWORD *)&v388[36] = "pressureTime";
                *(_WORD *)&v388[44] = 2048;
                *(_QWORD *)&v388[46] = v60;
                *(_WORD *)&v388[54] = 2080;
                *(_QWORD *)&v388[56] = "locationAlt";
                v389 = 2048;
                v390 = v62;
                v391 = 2080;
                *(_QWORD *)v392 = "pressureAlt";
                *(_WORD *)&v392[8] = 2048;
                *(double *)&v392[10] = v52;
                *(_WORD *)&v392[18] = 2080;
                *(_QWORD *)&v392[20] = "locVerticalUnc";
                v393 = 2048;
                v394 = v63;
                v395 = 2080;
                v396 = "locHorizontalUnc";
                v397 = 2048;
                v398 = 0;
                v399 = 2080;
                v400 = "demAlt";
                v401 = 2048;
                v402 = 0;
                v403 = 2080;
                v404 = "demVerticalUnc";
                v405 = 2048;
                v406 = 0;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0xB2u);
              }
              ++v333;
              v330 = v330 + v48 * v327;
              v331 = v331 + v47;
              v19 = v46 + v52;
              v17 = v45 + v53;
              v20 = *(double *)&v326 + v58;
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE80 != -1)
                  dispatch_once(&qword_10229FE80, &stru_10214F870);
                v82 = v30[93].isa;
                v83 = *(_QWORD *)v346;
                v84 = *v343;
                v85 = v343[1];
                v86 = v343[2];
                v367 = v320;
                *(_QWORD *)v368 = "type";
                *(_WORD *)&v368[8] = 1024;
                *(_DWORD *)&v368[10] = -1;
                *(_WORD *)&v368[14] = 2080;
                *(_QWORD *)&v368[16] = "locTime";
                *(_WORD *)&v368[24] = 2048;
                *(double *)&v368[26] = v84;
                *(_WORD *)&v368[34] = 2080;
                *(_QWORD *)&v368[36] = "pressureTime";
                *(_WORD *)&v368[44] = 2048;
                *(_QWORD *)&v368[46] = v83;
                *(_WORD *)&v368[54] = 2080;
                *(_QWORD *)&v368[56] = "locationAlt";
                v369 = 2048;
                v370 = v85;
                v371 = 2080;
                *(_QWORD *)v372 = "pressureAlt";
                *(_WORD *)&v372[8] = 2048;
                *(double *)&v372[10] = v52;
                *(_WORD *)&v372[18] = 2080;
                *(_QWORD *)&v372[20] = "locVerticalUnc";
                v373 = 2048;
                v374 = v86;
                v375 = 2080;
                v376 = "locHorizontalUnc";
                v377 = 2048;
                v378 = 0;
                v379 = 2080;
                v380 = "demAlt";
                v381 = 2048;
                v382 = 0;
                v383 = 2080;
                v384 = "demVerticalUnc";
                v385 = 2048;
                v386 = 0;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v82, 0, "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v367, 178, (const char *)v320, *((double *)&v320 + 1), (const char *)v321, *((double *)&v321 + 1), v322, v323, v324, v325, v326,
                  v327,
                  (const char *)v328,
                  *((double *)&v328 + 1),
                  v329,
                  v330,
                  *(const char **)&v331,
                  v332);
                v88 = (uint8_t *)v87;
                sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v87);
                if (v88 != buf)
                  free(v88);
                v18 = v30;
              }
              v6 = *(double *)&v324;
              v5 = v325;
            }
            if (v344)
            {
              v65 = (unint64_t *)&v344->__shared_owners_;
              do
                v66 = __ldaxr(v65);
              while (__stlxr(v66 - 1, v65));
              if (!v66)
              {
                ((void (*)(std::__shared_weak_count *))v344->__on_zero_shared)(v344);
                std::__shared_weak_count::__release_weak(v344);
              }
            }
          }
          v15 += 16;
          if (v15 - *v14 == 4096)
          {
            v67 = v14[1];
            ++v14;
            v15 = v67;
          }
        }
        while (v15 != v16);
        if (v333)
        {
          v92 = objc_opt_new(CLMeanSeaLevelPressureData);
          v93 = (double)v333;
          self->_biasTimestamp = v5;
          v94 = v330 / (double)v333;
          self->_bias = v17 / (double)v333;
          self->_biasPressure = v94;
          self->_biasUncertaintyAtRebase = v20 / (double)v333;
          v95 = v331 / (double)v333;
          v96 = v95;
          *(float *)&v94 = v94;
          v97 = sub_1013D36B0(v96, *(float *)&v94);
          self->_estimatedAbsoluteAltitudeUncertainty = self->_biasUncertaintyAtRebase;
          self->_estimatedMeanSeaLevelPressure = v97;
          biasPressure = self->_biasPressure;
          v99 = v95;
          -[CLMeanSeaLevelPressureData setUncertainty:](v92, "setUncertainty:", self->_biasUncertaintyAtRebase * sub_1013D373C(v99, biasPressure));
          -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v92, "setMeanSeaLevelPressure:", self->_estimatedMeanSeaLevelPressure);
          -[CLMeanSeaLevelPressureData setTimestamp:](v92, "setTimestamp:", v5);
          self->_companionRebase = 1;
          -[CLBarometerCalibrationBiasEstimator updateHistoricalMslpArray:](self, "updateHistoricalMslpArray:", v92);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10214F870);
          v100 = v18[93].isa;
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v92, "meanSeaLevelPressure");
            v102 = v101;
            -[CLMeanSeaLevelPressureData uncertainty](v92, "uncertainty");
            v104 = v103;
            -[CLMeanSeaLevelPressureData timestamp](v92, "timestamp");
            *(_DWORD *)buf = 136317954;
            *(_QWORD *)v388 = "type";
            *(_WORD *)&v388[8] = 1024;
            *(_DWORD *)&v388[10] = -1;
            *(_WORD *)&v388[14] = 2080;
            *(_QWORD *)&v388[16] = "meanSeaLevelPressure";
            *(_WORD *)&v388[24] = 2048;
            *(_QWORD *)&v388[26] = v102;
            *(_WORD *)&v388[34] = 2080;
            *(_QWORD *)&v388[36] = "uncertainty";
            *(_WORD *)&v388[44] = 2048;
            *(_QWORD *)&v388[46] = v104;
            *(_WORD *)&v388[54] = 2080;
            *(_QWORD *)&v388[56] = "timestamp";
            v389 = 2048;
            v390 = v105;
            v391 = 2080;
            *(_QWORD *)v392 = "startAt";
            *(_WORD *)&v392[8] = 2048;
            *(double *)&v392[10] = v6;
            *(_WORD *)&v392[18] = 2080;
            *(_QWORD *)&v392[20] = "endAt";
            v393 = 2048;
            v394 = v5;
            _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x76u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_10214F870);
            v297 = v18[93].isa;
            -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v92, "meanSeaLevelPressure");
            v299 = v298;
            -[CLMeanSeaLevelPressureData uncertainty](v92, "uncertainty");
            v301 = v300;
            -[CLMeanSeaLevelPressureData timestamp](v92, "timestamp");
            v367 = 136317954;
            *(_QWORD *)v368 = "type";
            *(_WORD *)&v368[8] = 1024;
            *(_DWORD *)&v368[10] = -1;
            *(_WORD *)&v368[14] = 2080;
            *(_QWORD *)&v368[16] = "meanSeaLevelPressure";
            *(_WORD *)&v368[24] = 2048;
            *(_QWORD *)&v368[26] = v299;
            *(_WORD *)&v368[34] = 2080;
            *(_QWORD *)&v368[36] = "uncertainty";
            *(_WORD *)&v368[44] = 2048;
            *(_QWORD *)&v368[46] = v301;
            *(_WORD *)&v368[54] = 2080;
            *(_QWORD *)&v368[56] = "timestamp";
            v369 = 2048;
            v370 = v302;
            v371 = 2080;
            *(_QWORD *)v372 = "startAt";
            *(_WORD *)&v372[8] = 2048;
            *(_QWORD *)&v372[10] = v324;
            *(_WORD *)&v372[18] = 2080;
            *(_QWORD *)&v372[20] = "endAt";
            v373 = 2048;
            v374 = v325;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v297, 0, "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v367, 118, (const char *)v320, *((double *)&v320 + 1), (const char *)v321, *((double *)&v321 + 1), v322, v323, v324, v325, v326,
              v327);
            v304 = (uint8_t *)v303;
            sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v303);
            if (v304 != buf)
              free(v304);
            v6 = *(double *)&v324;
            v5 = v325;
          }

          self->_pressureUncertainty = 0.0;
          self->_distanceTraveled = 0.0;
          self->_biasLocation = (BiasEstimatorLocation)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
          sub_1008B5798((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10214F870);
          v106 = v18[93].isa;
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            bias = self->_bias;
            biasUncertaintyAtRebase = self->_biasUncertaintyAtRebase;
            biasUncertainty = self->_biasUncertainty;
            weatherEstimateInMeter = self->_weatherEstimateInMeter;
            inOutdoorWorkoutStatus = self->_inOutdoorWorkoutStatus;
            *(_DWORD *)buf = 67111680;
            *(_DWORD *)v388 = -1;
            *(_WORD *)&v388[4] = 2048;
            *(double *)&v388[6] = bias;
            *(_WORD *)&v388[14] = 2048;
            *(double *)&v388[16] = biasUncertaintyAtRebase;
            *(_WORD *)&v388[24] = 2048;
            *(double *)&v388[26] = v19 / v93;
            *(_WORD *)&v388[34] = 2048;
            *(double *)&v388[36] = v331 / (double)v333;
            *(_WORD *)&v388[44] = 2048;
            *(double *)&v388[46] = biasUncertainty;
            *(_WORD *)&v388[54] = 2048;
            *(double *)&v388[56] = biasUncertaintyAtRebase;
            v389 = 2048;
            v390 = weatherEstimateInMeter;
            v391 = 1024;
            *(_DWORD *)v392 = inOutdoorWorkoutStatus;
            *(_WORD *)&v392[4] = 2048;
            *(double *)&v392[6] = v6;
            *(_WORD *)&v392[14] = 2048;
            *(double *)&v392[16] = v5;
            _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f", buf, 0x68u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_10214F870);
            v305 = v18[93].isa;
            v306 = self->_bias;
            v307 = self->_biasUncertaintyAtRebase;
            v308 = self->_biasUncertainty;
            v309 = self->_weatherEstimateInMeter;
            v310 = self->_inOutdoorWorkoutStatus;
            v367 = 67111680;
            *(_DWORD *)v368 = -1;
            *(_WORD *)&v368[4] = 2048;
            *(double *)&v368[6] = v306;
            *(_WORD *)&v368[14] = 2048;
            *(double *)&v368[16] = v307;
            *(_WORD *)&v368[24] = 2048;
            *(double *)&v368[26] = v19 / v93;
            *(_WORD *)&v368[34] = 2048;
            *(double *)&v368[36] = v331 / (double)v333;
            *(_WORD *)&v368[44] = 2048;
            *(double *)&v368[46] = v308;
            *(_WORD *)&v368[54] = 2048;
            *(double *)&v368[56] = v307;
            v369 = 2048;
            v370 = v309;
            v371 = 1024;
            *(_DWORD *)v372 = v310;
            *(_WORD *)&v372[4] = 2048;
            *(_QWORD *)&v372[6] = v324;
            *(_WORD *)&v372[14] = 2048;
            *(double *)&v372[16] = v325;
            LODWORD(v319) = 104;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v305, 0, "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f", &v367, v319, *(double *)&v320, *((double *)&v320 + 1), *(double *)&v321, *((double *)&v321 + 1), *(double *)&v322, v323, (_DWORD)v324,
              v325,
              *(double *)&v326);
            v312 = (uint8_t *)v311;
            sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v311);
            if (v312 != buf)
              free(v312);
            v5 = v325;
          }
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10214F870);
          v112 = v18[93].isa;
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
          {
            v113 = self->_bias;
            v114 = self->_biasPressure;
            biasTimestamp = self->_biasTimestamp;
            *(_DWORD *)buf = v321;
            *(double *)v388 = v113;
            *(_WORD *)&v388[8] = 2048;
            *(double *)&v388[10] = v19 / v93;
            *(_WORD *)&v388[18] = 2048;
            *(double *)&v388[20] = v331 / (double)v333;
            *(_WORD *)&v388[28] = 2048;
            *(double *)&v388[30] = v114;
            *(_WORD *)&v388[38] = 2048;
            *(double *)&v388[40] = biasTimestamp;
            _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "new bias calculated from companion is %f, average baroAlt %f, average companion alt %f, average pressure %f, timestamp %f", buf, 0x34u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_10214F870);
            v313 = v18[93].isa;
            v314 = self->_bias;
            v315 = self->_biasPressure;
            v316 = self->_biasTimestamp;
            v367 = v321;
            *(double *)v368 = v314;
            *(_WORD *)&v368[8] = 2048;
            *(double *)&v368[10] = v19 / v93;
            *(_WORD *)&v368[18] = 2048;
            *(double *)&v368[20] = v331 / (double)v333;
            *(_WORD *)&v368[28] = 2048;
            *(double *)&v368[30] = v315;
            *(_WORD *)&v368[38] = 2048;
            *(double *)&v368[40] = v316;
            LODWORD(v319) = 52;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v313, 0, "new bias calculated from companion is %f, average baroAlt %f, average companion alt %f, average pressure %f, timestamp %f", COERCE_DOUBLE(&v367), v319, *(double *)&v320, *((double *)&v320 + 1), *(double *)&v321);
            v318 = (uint8_t *)v317;
            sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v317);
            if (v318 != buf)
              free(v318);
            v5 = v325;
          }
          -[CLBarometerCalibrationBiasEstimator rebaseSignificantElevationWithEndTime:](self, "rebaseSignificantElevationWithEndTime:", v5);
          -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithAbsSigElevation:withCompanion:](self, "updateBiasUncertaintyWithAbsSigElevation:withCompanion:", 1, sub_1008B53F0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v116, v117, v118));
          v119 = -[CLBarometerCalibrationContextClient latestAbsoluteAltitude](self->_delegate, "latestAbsoluteAltitude");
          v120 = v119;
          if (v119)
          {
            objc_msgSend(v119, "timestamp");
            if (v121 != 1.79769313e308)
            {
              objc_msgSend(v120, "altitude");
              v123 = v122;
              v124 = self->_biasUncertainty;
              v125 = self->_biasUncertaintyAtRebase;
              v126 = self->_inOutdoorWorkoutStatus;
              objc_msgSend(v120, "altitude");
              -[CLBarometerCalibrationBiasEstimator sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource:andCorrection:andDistance:](self, "sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource:andCorrection:andDistance:", 0, v126, 0xFFFFFFFFLL, v123 - v95, v124, v125, v127 - v95, self->_distanceSinceLastRebase);
            }
          }
          self->_companionRebase = 0;
LABEL_253:
          v244 = v347;
          if (v347)
          {
            v245 = (unint64_t *)&v347->__shared_owners_;
            do
              v246 = __ldaxr(v245);
            while (__stlxr(v246 - 1, v245));
            if (!v246)
            {
              ((void (*)(std::__shared_weak_count *))v244->__on_zero_shared)(v244);
              std::__shared_weak_count::__release_weak(v244);
            }
          }
          if (__p)
          {
            v349 = (char *)__p;
            operator delete(__p);
          }
          goto LABEL_260;
        }
      }
    }
    v344 = 0;
    v345 = 0;
    v342[1] = 0;
    v343 = (double *)&v344;
    v341 = v342;
    v342[0] = 0;

    self->_queriedMeanSeaLevelPressureData = (CLMeanSeaLevelPressureData *)-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure](self->_meanSeaLevelPressureEstimator, "getEstimatedMeanSeaLevelPressure");
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v128 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_queriedMeanSeaLevelPressureData, "meanSeaLevelPressure");
      v130 = v129;
      -[CLMeanSeaLevelPressureData uncertainty](self->_queriedMeanSeaLevelPressureData, "uncertainty");
      v132 = v131;
      -[CLMeanSeaLevelPressureData timestamp](self->_queriedMeanSeaLevelPressureData, "timestamp");
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)v388 = "meanSeaLevelPressure";
      *(_WORD *)&v388[8] = 2048;
      *(_QWORD *)&v388[10] = v130;
      *(_WORD *)&v388[18] = 2080;
      *(_QWORD *)&v388[20] = "uncertainty";
      *(_WORD *)&v388[28] = 2048;
      *(_QWORD *)&v388[30] = v132;
      *(_WORD *)&v388[38] = 2080;
      *(_QWORD *)&v388[40] = "timestamp";
      *(_WORD *)&v388[48] = 2048;
      *(_QWORD *)&v388[50] = v133;
      _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "query mean sea level pressure,%s,%f,%s,%f,%s,%f", buf, 0x3Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v272 = qword_10229FE88;
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_queriedMeanSeaLevelPressureData, "meanSeaLevelPressure");
      v274 = v273;
      -[CLMeanSeaLevelPressureData uncertainty](self->_queriedMeanSeaLevelPressureData, "uncertainty");
      v276 = v275;
      -[CLMeanSeaLevelPressureData timestamp](self->_queriedMeanSeaLevelPressureData, "timestamp");
      v367 = 136316418;
      *(_QWORD *)v368 = "meanSeaLevelPressure";
      *(_WORD *)&v368[8] = 2048;
      *(_QWORD *)&v368[10] = v274;
      *(_WORD *)&v368[18] = 2080;
      *(_QWORD *)&v368[20] = "uncertainty";
      *(_WORD *)&v368[28] = 2048;
      *(_QWORD *)&v368[30] = v276;
      *(_WORD *)&v368[38] = 2080;
      *(_QWORD *)&v368[40] = "timestamp";
      *(_WORD *)&v368[48] = 2048;
      *(_QWORD *)&v368[50] = v277;
      LODWORD(v319) = 62;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v272, 0, "query mean sea level pressure,%s,%f,%s,%f,%s,%f", (const char *)&v367, v319, (const char *)v320, *((double *)&v320 + 1), (const char *)v321, *((double *)&v321 + 1));
      v279 = (uint8_t *)v278;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v278);
      if (v279 != buf)
        free(v279);
      v6 = *(double *)&v324;
      v5 = v325;
    }
    if (v364 == v363
      || (v134 = (_QWORD *)(v363 + 8 * (v365 >> 8)),
          v135 = (double **)(*v134 + 16 * v365),
          v136 = *(_QWORD *)(v363 + (((v366 + v365) >> 5) & 0x7FFFFFFFFFFFFF8))
               + 16 * (v366 + v365),
          v135 == (double **)v136))
    {
      v334 = 0;
    }
    else
    {
      v334 = 0;
      do
      {
        v137 = **v135;
        if (v137 >= v6 && v137 < v5)
        {
          v139 = v135[1];
          v339 = *v135;
          v340 = (std::__shared_weak_count *)v139;
          if (v139)
          {
            v140 = (unint64_t *)(v139 + 1);
            do
              v141 = __ldxr(v140);
            while (__stxr(v141 + 1, v140));
          }
          v337 = -1.0;
          v338 = 1.79769313e308;
          +[CLBarometerCalibrationBiasEstimator getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:](CLBarometerCalibrationBiasEstimator, "getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:", &v339, &v338, &v337);
          if (v337 <= 0.0 && v339[7] <= 0.0)
          {
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_10214F870);
            v159 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
            {
              v160 = *v339;
              v161 = *((_QWORD *)v339 + 6);
              *(_DWORD *)buf = 134218496;
              *(double *)v388 = v160;
              *(_WORD *)&v388[8] = 2048;
              *(double *)&v388[10] = v338;
              *(_WORD *)&v388[18] = 2048;
              *(_QWORD *)&v388[20] = v161;
              _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_INFO, "individual bias error: reference Uncertainty < 0 and no DEMS, location timestamp %f, location altitude %f, location DEMS %f", buf, 0x20u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_10214F870);
              v189 = *(_QWORD *)v339;
              v190 = *((_QWORD *)v339 + 6);
              v367 = 134218496;
              *(_QWORD *)v368 = v189;
              *(_WORD *)&v368[8] = 2048;
              *(double *)&v368[10] = v338;
              *(_WORD *)&v368[18] = 2048;
              *(_QWORD *)&v368[20] = v190;
              LODWORD(v319) = 32;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "individual bias error: reference Uncertainty < 0 and no DEMS, location timestamp %f, location altitude %f, location DEMS %f", COERCE_DOUBLE(&v367), v319, *(double *)&v320);
              v192 = (uint8_t *)v191;
              sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v191);
              if (v192 != buf)
                free(v192);
              v6 = *(double *)&v324;
              v5 = v325;
            }
          }
          else
          {
            if (v359 == v358)
              goto LABEL_159;
            v142 = (_QWORD *)(v358 + 8 * (v360 >> 8));
            v143 = *v142 + 16 * v360;
            v144 = *(_QWORD *)(v358 + (((v361 + v360) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v361 + v360);
            if (v143 == v144)
              goto LABEL_159;
            v145 = 1.79769313e308;
            do
            {
              v146 = *(double **)v143;
              v147 = vabdd_f64(**v135, **(double **)v143);
              if (v147 < v145 && v147 <= 5.0)
              {
                v149 = *(std::__shared_weak_count **)(v143 + 8);
                if (v149)
                {
                  v150 = (unint64_t *)&v149->__shared_owners_;
                  do
                    v151 = __ldxr(v150);
                  while (__stxr(v151 + 1, v150));
                }
                v152 = v347;
                v346 = v146;
                v347 = v149;
                if (v152)
                {
                  v153 = (unint64_t *)&v152->__shared_owners_;
                  do
                    v154 = __ldaxr(v153);
                  while (__stlxr(v154 - 1, v153));
                  if (!v154)
                  {
                    ((void (*)(std::__shared_weak_count *))v152->__on_zero_shared)(v152);
                    std::__shared_weak_count::__release_weak(v152);
                  }
                }
                v145 = v147;
              }
              v143 += 16;
              if (v143 - *v142 == 4096)
              {
                v155 = v142[1];
                ++v142;
                v143 = v155;
              }
            }
            while (v143 != v144);
            if (v145 == 1.79769313e308)
            {
LABEL_159:
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_10214F870);
              v156 = qword_10229FE88;
              if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "pressure too far from reference data", buf, 2u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE80 != -1)
                  dispatch_once(&qword_10229FE80, &stru_10214F870);
                LOWORD(v367) = 0;
                LODWORD(v319) = 2;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "pressure too far from reference data", &v367, *(_QWORD *)&v319);
                v158 = (uint8_t *)v157;
                sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v157);
                if (v158 != buf)
                  free(v158);
              }
            }
            else
            {
              v167 = *((_QWORD *)v339 + 1);
              v166 = *((_QWORD *)v339 + 2);
              v168 = v349;
              if (v349 >= v350)
              {
                v170 = (char *)__p;
                v171 = (v349 - (_BYTE *)__p) >> 4;
                v172 = v171 + 1;
                if ((unint64_t)(v171 + 1) >> 60)
                  sub_100259694();
                v173 = v350 - (_BYTE *)__p;
                if ((v350 - (_BYTE *)__p) >> 3 > v172)
                  v172 = v173 >> 3;
                if ((unint64_t)v173 >= 0x7FFFFFFFFFFFFFF0)
                  v174 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v174 = v172;
                if (v174)
                {
                  v175 = (char *)sub_10028E224((uint64_t)&v350, v174);
                  v170 = (char *)__p;
                  v168 = v349;
                }
                else
                {
                  v175 = 0;
                }
                v176 = &v175[16 * v171];
                *(_QWORD *)v176 = v167;
                *((_QWORD *)v176 + 1) = v166;
                v177 = v176;
                if (v168 != v170)
                {
                  do
                  {
                    *((_OWORD *)v177 - 1) = *((_OWORD *)v168 - 1);
                    v177 -= 16;
                    v168 -= 16;
                  }
                  while (v168 != v170);
                  v170 = (char *)__p;
                }
                v169 = v176 + 16;
                __p = v177;
                v349 = v176 + 16;
                v350 = &v175[16 * v174];
                if (v170)
                  operator delete(v170);
              }
              else
              {
                *(_QWORD *)v349 = v167;
                *((_QWORD *)v168 + 1) = v166;
                v169 = v168 + 16;
              }
              v349 = v169;
              v178 = v346;
              v179 = v346[1] * 1000.0;
              v180 = sub_10024806C(v179, 101320.0);
              v181 = v178[1];
              -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_queriedMeanSeaLevelPressureData, "meanSeaLevelPressure");
              v182 = v181 * 1000.0;
              v184 = v183;
              v185 = sub_10024806C(v182, v184);
              v186 = v339;
              v187 = v339[7];
              v334 = v187 > 0.0;
              if (!self->_inOutdoorWorkoutStatus || (*((_WORD *)v339 + 65) & 2) != 0)
              {
                v188 = v180;
                if ((*((_DWORD *)v339 + 25) & 0x80000000) == 0)
                {
                  -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:](self, "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:", &v343, v338, v337, v188);
                  -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:](self, "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:", &v341, *((unsigned int *)v339 + 25), v338, v337, v185);
                  v186 = v339;
                  v187 = v339[7];
                }
                if (v187 > 0.0)
                {
                  -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:](self, "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:", &v343, 14, v186[6]);
                  -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:](self, "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:", &v341, 14, v339[6], v339[7], v185);
                }
              }
            }
          }
          v162 = v340;
          if (v340)
          {
            v163 = (unint64_t *)&v340->__shared_owners_;
            do
              v164 = __ldaxr(v163);
            while (__stlxr(v164 - 1, v163));
            if (!v164)
            {
              ((void (*)(std::__shared_weak_count *))v162->__on_zero_shared)(v162);
              std::__shared_weak_count::__release_weak(v162);
            }
          }
        }
        v135 += 2;
        if ((double **)((char *)v135 - *v134) == (double **)4096)
        {
          v165 = (double **)v134[1];
          ++v134;
          v135 = v165;
        }
      }
      while (v135 != (double **)v136);
    }
    if (v345)
    {
      -[CLBarometerCalibrationBiasEstimator centroidOfLocationVector:](self, "centroidOfLocationVector:", &__p);
      v195 = v194;
      v196 = v193;
      if (v194 != 1.79769313e308)
      {
        latitude = self->_biasLocation.latitude;
        if (latitude != 1.79769313e308)
          self->_distanceSinceLastRebase = fabs(sub_100124100(latitude, self->_biasLocation.longitude, v195, v193));
      }
      -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:](self, "updateBiasUncertaintyWithPressure:andTime:andLat:andLon:", v351, 0.0, v195, v196);
      -[CLBarometerCalibrationBiasEstimator getAbsoluteAltitudeUncertainty](self, "getAbsoluteAltitudeUncertainty");
      v199 = v198;
      v200 = v343;
      if (v343 == (double *)&v344)
      {
        v202 = 0;
      }
      else
      {
        v201 = log(v198 * (v198 * 17.0794684));
        v202 = 0;
        do
        {
          v203 = (double)*((int *)v200 + 18);
          v204 = v200[6] * v200[6] / v203 / v203;
          v200[5] = v200[5] / v203;
          v200[6] = v204;
          v205 = v200[7] / v203;
          v200[7] = v205;
          v206 = v205 + self->_bias;
          v200[7] = v206;
          v200[7] = v206 - self->_weatherEstimateInMeter;
          v200[8] = v199 * v199;
          v336 = *((_QWORD *)v200 + 9);
          v207 = *(_OWORD *)(v200 + 7);
          v335[0] = *(_OWORD *)(v200 + 5);
          v335[1] = v207;
          -[CLBarometerCalibrationBiasEstimator crossEntropyOfreference:](self, "crossEntropyOfreference:", v335);
          if (v201 >= v208)
          {
            v202 = *((unsigned int *)v200 + 8);
            v201 = v208;
          }
          v209 = (std::__shared_weak_count *)*((_QWORD *)v200 + 1);
          if (v209)
          {
            do
            {
              v210 = (std::__shared_weak_count **)v209;
              v209 = (std::__shared_weak_count *)v209->__vftable;
            }
            while (v209);
          }
          else
          {
            do
            {
              v210 = (std::__shared_weak_count **)*((_QWORD *)v200 + 2);
              v211 = *v210 == (std::__shared_weak_count *)v200;
              v200 = (double *)v210;
            }
            while (!v211);
          }
          v200 = (double *)v210;
        }
        while (v210 != &v344);
      }
      v212 = v344;
      if (!v344)
        goto LABEL_235;
      v213 = &v344;
      do
      {
        v214 = v212;
        v215 = v213;
        shared_owners = v212[1].__shared_owners_;
        v217 = &v212->__shared_owners_;
        if (shared_owners >= (int)v202)
        {
          v217 = (uint64_t *)v214;
          v213 = (std::__shared_weak_count **)v214;
        }
        v212 = (std::__shared_weak_count *)*v217;
      }
      while (v212);
      if (v213 == &v344)
        goto LABEL_235;
      if (shared_owners < (int)v202)
        v214 = (std::__shared_weak_count *)v215;
      if ((int)v202 >= SLODWORD(v214[1].__shared_owners_))
      {
        v247 = self->_bias;
        v248 = *((double *)v213 + 7) + self->_weatherEstimateInMeter - v247;
        self->_biasPressure = sub_1013D3670(v248, 101320.0);
        v249 = self->_bias
             + *((double *)v213 + 8)
             * (*((double *)v213 + 5) - *((double *)v213 + 7))
             / (*((double *)v213 + 8) + *((double *)v213 + 6));
        self->_bias = v249 - self->_weatherEstimateInMeter;
        self->_biasUncertaintyAtRebase = sqrt(*((double *)v213 + 8)* *((double *)v213 + 6)/ (*((double *)v213 + 8) + *((double *)v213 + 6)));
        self->_pressureUncertainty = 0.0;
        self->_distanceTraveled = 0.0;
        self->_biasTimestamp = v5;
        sub_1008B5798((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
        -[CLBarometerCalibrationBiasEstimator rebaseSignificantElevationWithEndTime:](self, "rebaseSignificantElevationWithEndTime:", v5);
        -[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithAbsSigElevation:withCompanion:](self, "updateBiasUncertaintyWithAbsSigElevation:withCompanion:", 0, sub_1008B53F0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v250, v251, v252));
        -[CLBarometerCalibrationBiasEstimator sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource:andCorrection:andDistance:](self, "sendRebaseAnalyticsWithAltitudeError:andUncertainty:andRefUncertainty:andDemAvailable:andWorkout:andReferenceSource:andCorrection:andDistance:", v334, self->_inOutdoorWorkoutStatus, v202, *((double *)v213 + 5) - *((double *)v213 + 7), sqrt(*((double *)v213 + 8)), sqrt(*((double *)v213 + 6)), v249 - v247, self->_distanceSinceLastRebase);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v253 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          v254 = self->_bias;
          v255 = self->_biasUncertaintyAtRebase;
          v256 = v213[7];
          v257 = v213[5];
          v258 = sqrt(*((double *)v213 + 8));
          v259 = *((double *)v213 + 6);
          v260 = self->_weatherEstimateInMeter;
          v261 = self->_inOutdoorWorkoutStatus;
          *(_DWORD *)buf = 67111680;
          *(_DWORD *)v388 = v202;
          *(_WORD *)&v388[4] = 2048;
          *(double *)&v388[6] = v254;
          *(_WORD *)&v388[14] = 2048;
          *(double *)&v388[16] = v255;
          *(_WORD *)&v388[24] = 2048;
          *(_QWORD *)&v388[26] = v256;
          *(_WORD *)&v388[34] = 2048;
          *(_QWORD *)&v388[36] = v257;
          *(_WORD *)&v388[44] = 2048;
          *(double *)&v388[46] = v258;
          *(_WORD *)&v388[54] = 2048;
          *(_QWORD *)&v388[56] = sqrt(v259);
          v389 = 2048;
          v390 = v260;
          v391 = 1024;
          *(_DWORD *)v392 = v261;
          *(_WORD *)&v392[4] = 2048;
          *(double *)&v392[6] = v6;
          *(_WORD *)&v392[14] = 2048;
          *(double *)&v392[16] = v5;
          _os_log_impl((void *)&_mh_execute_header, v253, OS_LOG_TYPE_DEFAULT, "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f", buf, 0x68u);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_240;
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v262 = self->_bias;
        v263 = self->_biasUncertaintyAtRebase;
        v264 = v213[7];
        v265 = v213[5];
        v266 = sqrt(*((double *)v213 + 8));
        v267 = *((double *)v213 + 6);
        v268 = self->_weatherEstimateInMeter;
        v269 = self->_inOutdoorWorkoutStatus;
        v367 = 67111680;
        *(_DWORD *)v368 = v202;
        *(_WORD *)&v368[4] = 2048;
        *(double *)&v368[6] = v262;
        *(_WORD *)&v368[14] = 2048;
        *(double *)&v368[16] = v263;
        *(_WORD *)&v368[24] = 2048;
        *(_QWORD *)&v368[26] = v264;
        *(_WORD *)&v368[34] = 2048;
        *(_QWORD *)&v368[36] = v265;
        *(_WORD *)&v368[44] = 2048;
        *(double *)&v368[46] = v266;
        *(_WORD *)&v368[54] = 2048;
        *(_QWORD *)&v368[56] = sqrt(v267);
        v369 = 2048;
        v370 = v268;
        v371 = 1024;
        *(_DWORD *)v372 = v269;
        *(_WORD *)&v372[4] = 2048;
        *(_QWORD *)&v372[6] = v324;
        *(_WORD *)&v372[14] = 2048;
        *(double *)&v372[16] = v325;
        LODWORD(v319) = 104;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f", &v367, v319, *(double *)&v320, *((double *)&v320 + 1), *(double *)&v321, *((double *)&v321 + 1), *(double *)&v322, v323, (_DWORD)v324, v325,
          *(double *)&v326);
        v271 = (uint8_t *)v270;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v270);
      }
      else
      {
LABEL_235:
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v218 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          v219 = self->_bias;
          v220 = self->_weatherEstimateInMeter;
          v221 = self->_inOutdoorWorkoutStatus;
          *(_DWORD *)buf = 67111680;
          *(_DWORD *)v388 = v202;
          *(_WORD *)&v388[4] = 2048;
          *(double *)&v388[6] = v219;
          *(_WORD *)&v388[14] = 2048;
          *(double *)&v388[16] = v199;
          *(_WORD *)&v388[24] = 2048;
          *(_QWORD *)&v388[26] = 0xBFF0000000000000;
          *(_WORD *)&v388[34] = 2048;
          *(_QWORD *)&v388[36] = 0xBFF0000000000000;
          *(_WORD *)&v388[44] = 2048;
          *(_QWORD *)&v388[46] = 0xBFF0000000000000;
          *(_WORD *)&v388[54] = 2048;
          *(_QWORD *)&v388[56] = 0xBFF0000000000000;
          v389 = 2048;
          v390 = v220;
          v391 = 1024;
          *(_DWORD *)v392 = v221;
          *(_WORD *)&v392[4] = 2048;
          *(double *)&v392[6] = v6;
          *(_WORD *)&v392[14] = 2048;
          *(double *)&v392[16] = v5;
          _os_log_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_DEFAULT, "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f", buf, 0x68u);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_240;
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v293 = self->_bias;
        v294 = self->_weatherEstimateInMeter;
        v295 = self->_inOutdoorWorkoutStatus;
        v367 = 67111680;
        *(_DWORD *)v368 = v202;
        *(_WORD *)&v368[4] = 2048;
        *(double *)&v368[6] = v293;
        *(_WORD *)&v368[14] = 2048;
        *(double *)&v368[16] = v199;
        *(_WORD *)&v368[24] = 2048;
        *(_QWORD *)&v368[26] = 0xBFF0000000000000;
        *(_WORD *)&v368[34] = 2048;
        *(_QWORD *)&v368[36] = 0xBFF0000000000000;
        *(_WORD *)&v368[44] = 2048;
        *(_QWORD *)&v368[46] = 0xBFF0000000000000;
        *(_WORD *)&v368[54] = 2048;
        *(_QWORD *)&v368[56] = 0xBFF0000000000000;
        v369 = 2048;
        v370 = v294;
        v371 = 1024;
        *(_DWORD *)v372 = v295;
        *(_WORD *)&v372[4] = 2048;
        *(_QWORD *)&v372[6] = v324;
        *(_WORD *)&v372[14] = 2048;
        *(double *)&v372[16] = v325;
        LODWORD(v319) = 104;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f", &v367, v319, *(double *)&v320, *((double *)&v320 + 1), *(double *)&v321, *((double *)&v321 + 1), *(double *)&v322, v323, (_DWORD)v324, v325,
          *(double *)&v326);
        v271 = (uint8_t *)v296;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v296);
      }
      if (v271 != buf)
        free(v271);
      v6 = *(double *)&v324;
      v5 = v325;
    }
LABEL_240:
    v222 = v351;
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_queriedMeanSeaLevelPressureData, "meanSeaLevelPressure");
    v223 = v222;
    v225 = v224;
    v226 = sub_10024806C(v223, v225);
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_queriedMeanSeaLevelPressureData, "meanSeaLevelPressure");
    self->_estimatedMeanSeaLevelPressure = v227;
    v228 = v351;
    v229 = v227;
    sub_1013D36F0(v228, v229);
    v231 = v230;
    -[CLMeanSeaLevelPressureData uncertainty](self->_queriedMeanSeaLevelPressureData, "uncertainty");
    self->_estimatedAbsoluteAltitudeUncertainty = v232 * v231;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v233 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      -[CLMeanSeaLevelPressureData uncertainty](self->_queriedMeanSeaLevelPressureData, "uncertainty");
      estimatedAbsoluteAltitudeUncertainty = self->_estimatedAbsoluteAltitudeUncertainty;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)v388 = "estimatedMslpUncertainty";
      *(_WORD *)&v388[8] = 2048;
      *(_QWORD *)&v388[10] = v235;
      *(_WORD *)&v388[18] = 2080;
      *(_QWORD *)&v388[20] = "estimatedAbsoluteAltitudeUncertainty";
      *(_WORD *)&v388[28] = 2048;
      *(double *)&v388[30] = estimatedAbsoluteAltitudeUncertainty;
      _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_DEFAULT, "mslp uncertainty to altitude uncertainty,%s,%f,%s,%f", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v280 = qword_10229FE88;
      -[CLMeanSeaLevelPressureData uncertainty](self->_queriedMeanSeaLevelPressureData, "uncertainty");
      v281 = self->_estimatedAbsoluteAltitudeUncertainty;
      v367 = 136315906;
      *(_QWORD *)v368 = "estimatedMslpUncertainty";
      *(_WORD *)&v368[8] = 2048;
      *(_QWORD *)&v368[10] = v282;
      *(_WORD *)&v368[18] = 2080;
      *(_QWORD *)&v368[20] = "estimatedAbsoluteAltitudeUncertainty";
      *(_WORD *)&v368[28] = 2048;
      *(double *)&v368[30] = v281;
      LODWORD(v319) = 42;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v280, 0, "mslp uncertainty to altitude uncertainty,%s,%f,%s,%f", (const char *)&v367, v319, (const char *)v320, *((double *)&v320 + 1));
      v284 = (uint8_t *)v283;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v283);
      if (v284 != buf)
        free(v284);
      v6 = *(double *)&v324;
      v5 = v325;
    }
    v236 = -[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:](self, "selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:", &v341, v226, v6, v5);
    v237 = objc_opt_new(CLMeanSeaLevelPressureData);
    -[CLMeanSeaLevelPressureData setTimestamp:](v237, "setTimestamp:", v5);
    -[CLBarometerCalibrationBiasEstimator computeMeanSeaLevelPressureWithRebasingLocationData:referenceMap:andLocationType:](self, "computeMeanSeaLevelPressureWithRebasingLocationData:referenceMap:andLocationType:", v237, &v341, v236);
    if ((_DWORD)v236)
      -[CLBarometerCalibrationBiasEstimator updateHistoricalMslpArray:](self, "updateHistoricalMslpArray:", v237);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v238 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v237, "meanSeaLevelPressure");
      v240 = v239;
      -[CLMeanSeaLevelPressureData uncertainty](v237, "uncertainty");
      v242 = v241;
      -[CLMeanSeaLevelPressureData timestamp](v237, "timestamp");
      *(_DWORD *)buf = 136317954;
      *(_QWORD *)v388 = "type";
      *(_WORD *)&v388[8] = 1024;
      *(_DWORD *)&v388[10] = v236;
      *(_WORD *)&v388[14] = 2080;
      *(_QWORD *)&v388[16] = "meanSeaLevelPressure";
      *(_WORD *)&v388[24] = 2048;
      *(_QWORD *)&v388[26] = v240;
      *(_WORD *)&v388[34] = 2080;
      *(_QWORD *)&v388[36] = "uncertainty";
      *(_WORD *)&v388[44] = 2048;
      *(_QWORD *)&v388[46] = v242;
      *(_WORD *)&v388[54] = 2080;
      *(_QWORD *)&v388[56] = "timestamp";
      v389 = 2048;
      v390 = v243;
      v391 = 2080;
      *(_QWORD *)v392 = "startAt";
      *(_WORD *)&v392[8] = 2048;
      *(double *)&v392[10] = v6;
      *(_WORD *)&v392[18] = 2080;
      *(_QWORD *)&v392[20] = "endAt";
      v393 = 2048;
      v394 = v5;
      _os_log_impl((void *)&_mh_execute_header, v238, OS_LOG_TYPE_DEFAULT, "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x76u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v285 = qword_10229FE88;
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v237, "meanSeaLevelPressure");
      v287 = v286;
      -[CLMeanSeaLevelPressureData uncertainty](v237, "uncertainty");
      v289 = v288;
      -[CLMeanSeaLevelPressureData timestamp](v237, "timestamp");
      v367 = 136317954;
      *(_QWORD *)v368 = "type";
      *(_WORD *)&v368[8] = 1024;
      *(_DWORD *)&v368[10] = v236;
      *(_WORD *)&v368[14] = 2080;
      *(_QWORD *)&v368[16] = "meanSeaLevelPressure";
      *(_WORD *)&v368[24] = 2048;
      *(_QWORD *)&v368[26] = v287;
      *(_WORD *)&v368[34] = 2080;
      *(_QWORD *)&v368[36] = "uncertainty";
      *(_WORD *)&v368[44] = 2048;
      *(_QWORD *)&v368[46] = v289;
      *(_WORD *)&v368[54] = 2080;
      *(_QWORD *)&v368[56] = "timestamp";
      v369 = 2048;
      v370 = v290;
      v371 = 2080;
      *(_QWORD *)v372 = "startAt";
      *(_WORD *)&v372[8] = 2048;
      *(_QWORD *)&v372[10] = v324;
      *(_WORD *)&v372[18] = 2080;
      *(_QWORD *)&v372[20] = "endAt";
      v373 = 2048;
      v374 = v325;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v285, 0, "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v367, 118, (const char *)v320, *((double *)&v320 + 1), (const char *)v321, *((double *)&v321 + 1), v322, v323, v324, v325, v326,
        v327);
      v292 = (uint8_t *)v291;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v291);
      if (v292 != buf)
        free(v292);
    }

    sub_100008848((uint64_t)&v341, v342[0]);
    sub_100008848((uint64_t)&v343, v344);
    goto LABEL_253;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v7 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)v388 = v6;
    *(_WORD *)&v388[8] = 2048;
    *(double *)&v388[10] = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "track is too old, don't rebase,startTime,%f,endTime,%f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v367 = 134218240;
    *(double *)v368 = v6;
    *(_WORD *)&v368[8] = 2048;
    *(double *)&v368[10] = v5;
    LODWORD(v319) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "track is too old, don't rebase,startTime,%f,endTime,%f", COERCE_DOUBLE(&v367), v319);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
}

- (void)updateHistoricalMslpArray:(id)a3
{
  BOOL v5;
  NSObject *v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint8_t *v23;
  double v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;

  v5 = *(_WORD *)&self->_inOutdoorWorkoutStatus || self->_loiRebase || self->_forceCalibrate;
  if (self->_forceCalibrate)
    -[CLMeanSeaLevelPressureEstimator cleanHistoricalMslpArrayForForceRebase:](self->_meanSeaLevelPressureEstimator, "cleanHistoricalMslpArrayForForceRebase:", a3);
  if (v5 || !-[CLMeanSeaLevelPressureEstimator inVisitStatus](self->_meanSeaLevelPressureEstimator, "inVisitStatus"))
  {
    if (-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:](self->_meanSeaLevelPressureEstimator, "updateHistoricalMslpArray:from:", a3, 0))
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v6 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "timestamp");
        v8 = v7;
        objc_msgSend(a3, "meanSeaLevelPressure");
        v10 = v9;
        objc_msgSend(a3, "uncertainty");
        v12 = v11;
        objc_msgSend(a3, "pressureMeasurement");
        *(_DWORD *)buf = 134218752;
        v34 = v8;
        v35 = 2048;
        v36 = v10;
        v37 = 2048;
        v38 = v12;
        v39 = 2048;
        v40 = v13;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "mslp from ap,timestamp,%f,mslp,%f,uncertainty,%f,pressureMeasurement,%f", buf, 0x2Au);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v14 = qword_10229FE88;
        objc_msgSend(a3, "timestamp");
        v16 = v15;
        objc_msgSend(a3, "meanSeaLevelPressure");
        v18 = v17;
        objc_msgSend(a3, "uncertainty");
        v20 = v19;
        objc_msgSend(a3, "pressureMeasurement");
        v25 = 134218752;
        v26 = v16;
        v27 = 2048;
        v28 = v18;
        v29 = 2048;
        v30 = v20;
        v31 = 2048;
        v32 = v21;
        LODWORD(v24) = 42;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 0, "mslp from ap,timestamp,%f,mslp,%f,uncertainty,%f,pressureMeasurement,%f", COERCE_DOUBLE(&v25), v24);
        v23 = (uint8_t *)v22;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateHistoricalMslpArray:]", "%s\n", v22);
        if (v23 != buf)
          free(v23);
      }
      -[CLMeanSeaLevelPressureEstimator setNumberOfRebaseBtwRefresh:](self->_meanSeaLevelPressureEstimator, "setNumberOfRebaseBtwRefresh:", -[CLMeanSeaLevelPressureEstimator numberOfRebaseBtwRefresh](self->_meanSeaLevelPressureEstimator, "numberOfRebaseBtwRefresh")+ 1);
      self->_lastRebaseTimestamp = CFAbsoluteTimeGetCurrent();
    }
  }
  else
  {
    -[CLMeanSeaLevelPressureEstimator updateInVisitRebasedMslp:](self->_meanSeaLevelPressureEstimator, "updateInVisitRebasedMslp:", a3);
  }
}

- (void)computeMeanSeaLevelPressureWithRebasingLocationData:(id)a3 referenceMap:(void *)a4 andLocationType:(int)a5
{
  char *v6;
  char *v7;
  char *v8;
  double *v10;
  int v11;
  BOOL v12;
  char **v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;

  if (!a5)
  {
    objc_msgSend(a3, "setMeanSeaLevelPressure:", a3, a4, 1.0);
    v14 = -1.0;
LABEL_15:
    objc_msgSend(a3, "setUncertainty:", v14);
    return;
  }
  v8 = (char *)*((_QWORD *)a4 + 1);
  v6 = (char *)a4 + 8;
  v7 = v8;
  if (v8)
  {
    v10 = (double *)v6;
    do
    {
      v11 = *((_DWORD *)v7 + 8);
      v12 = v11 < a5;
      if (v11 >= a5)
        v13 = (char **)v7;
      else
        v13 = (char **)(v7 + 8);
      if (!v12)
        v10 = (double *)v7;
      v7 = *v13;
    }
    while (*v13);
    if (v10 != (double *)v6 && *((_DWORD *)v10 + 8) <= a5)
    {
      v15 = v10[7];
      v16 = v10[8];
      v17 = v10[5];
      v18 = v10[6];
      v19 = (v15 * v18 + v16 * v17) / (v16 + v18);
      v20 = v15;
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_queriedMeanSeaLevelPressureData, "meanSeaLevelPressure");
      v22 = v21;
      v23 = sub_1013D3670(v20, v22);
      self->_estimatedAbsoluteAltitudeUncertainty = sqrt(v16 * v18 / (v16 + v18));
      v24 = v19;
      self->_estimatedMeanSeaLevelPressure = sub_1013D36B0(v24, v23);
      *(float *)&v16 = v17;
      objc_msgSend(a3, "setMeanSeaLevelPressure:", sub_1013D36B0(*(float *)&v16, v23));
      v25 = v17;
      v14 = sqrt(v18) * sub_1013D373C(v25, v23);
      goto LABEL_15;
    }
  }
}

- (int)selectReferenceWithReference:(void *)a3 withBaroElevation:(double)a4 betweenStartTime:(double)a5 andEndTime:(double)a6
{
  double v10;
  NSObject *v11;
  double estimatedAbsoluteAltitudeUncertainty;
  __int128 v13;
  uint64_t **v14;
  uint64_t *v15;
  double v16;
  double v17;
  __int128 v18;
  double v19;
  double v20;
  NSObject *v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  uint64_t *v27;
  uint64_t *v28;
  BOOL v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint8_t *v36;
  NormalDistribution *end;
  NormalDistribution *begin;
  double v39;
  int *v40;
  __int128 v41;
  double v42;
  double v43;
  double v44;
  NSObject *v45;
  uint64_t v46;
  int *v47;
  int v48;
  BOOL v49;
  uint64_t *v50;
  uint64_t *v51;
  int v52;
  __int128 v53;
  const char *v54;
  uint8_t *v55;
  double v57;
  const char *v58;
  uint8_t *v59;
  const char *v60;
  __int128 v61;
  __int128 v62;
  double v63;
  const char *v64;
  uint64_t **v65;
  NormalDistribution v66;
  __int128 v67;
  const char *v68;
  double v69;
  NormalDistribution v70;
  __int128 v71;
  const char *v72;
  _OWORD v73[2];
  uint64_t v74;
  int v75;
  int v76;
  const char *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  double v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  unint64_t v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  unint64_t v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  double v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  double v99;
  __int16 v100;
  const char *v101;
  __int16 v102;
  double v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  double v107;
  uint8_t buf[4];
  const char *v109;
  __int16 v110;
  int v111;
  __int16 v112;
  const char *v113;
  __int16 v114;
  double v115;
  __int16 v116;
  const char *v117;
  __int16 v118;
  unint64_t v119;
  __int16 v120;
  const char *v121;
  __int16 v122;
  unint64_t v123;
  __int16 v124;
  const char *v125;
  __int16 v126;
  double v127;
  __int16 v128;
  const char *v129;
  __int16 v130;
  double v131;
  __int16 v132;
  const char *v133;
  __int16 v134;
  double v135;
  __int16 v136;
  const char *v137;
  __int16 v138;
  double v139;

  v75 = 0;
  self->_loiRebase = 0;
  v65 = (uint64_t **)a3;
  if (*((_QWORD *)a3 + 2))
  {
    v10 = log(self->_estimatedAbsoluteAltitudeUncertainty * (self->_estimatedAbsoluteAltitudeUncertainty * 17.0794684));
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v11 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      estimatedAbsoluteAltitudeUncertainty = self->_estimatedAbsoluteAltitudeUncertainty;
      *(_DWORD *)buf = 136318978;
      v109 = "type";
      v110 = 1024;
      v111 = 0;
      v112 = 2080;
      v113 = "crossEntropy";
      v114 = 2048;
      v115 = v10;
      v116 = 2080;
      v117 = "fromBaroAlt";
      v118 = 2048;
      v119 = 0xBFF0000000000000;
      v120 = 2080;
      v121 = "fromRefAlt";
      v122 = 2048;
      v123 = 0xBFF0000000000000;
      v124 = 2080;
      v125 = "baroUncertainty";
      v126 = 2048;
      v127 = estimatedAbsoluteAltitudeUncertainty;
      v128 = 2080;
      v129 = "refUncertainty";
      v130 = 2048;
      v131 = -1.0;
      v132 = 2080;
      v133 = "trackStartTime";
      v134 = 2048;
      v135 = a5;
      v136 = 2080;
      v137 = "trackEndTime";
      v138 = 2048;
      v139 = a6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x9Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v57 = self->_estimatedAbsoluteAltitudeUncertainty;
      v76 = 136318978;
      v77 = "type";
      v78 = 1024;
      v79 = 0;
      v80 = 2080;
      v81 = "crossEntropy";
      v82 = 2048;
      v83 = v10;
      v84 = 2080;
      v85 = "fromBaroAlt";
      v86 = 2048;
      v87 = 0xBFF0000000000000;
      v88 = 2080;
      v89 = "fromRefAlt";
      v90 = 2048;
      v91 = 0xBFF0000000000000;
      v92 = 2080;
      v93 = "baroUncertainty";
      v94 = 2048;
      v95 = v57;
      v96 = 2080;
      v97 = "refUncertainty";
      v98 = 2048;
      v99 = -1.0;
      v100 = 2080;
      v101 = "trackStartTime";
      v102 = 2048;
      v103 = a5;
      v104 = 2080;
      v105 = "trackEndTime";
      v106 = 2048;
      v107 = a6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v76, 158, v60, v63, v64, *(double *)&v65, *(const char **)&v66.var0, v66.var1, (const char *)v67, *((double *)&v67 + 1), v68,
        v69,
        *(const char **)&v70.var0,
        v70.var1,
        (const char *)v71,
        *((double *)&v71 + 1));
      v59 = (uint8_t *)v58;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:]", "%s\n", v58);
      if (v59 != buf)
        free(v59);
    }
    v14 = v65 + 1;
    v15 = *v65;
    if (*v65 != (uint64_t *)(v65 + 1))
    {
      *(_QWORD *)&v13 = 136318978;
      v61 = v13;
      do
      {
        v16 = (double)*((int *)v15 + 18);
        v17 = *((double *)v15 + 6) * *((double *)v15 + 6) / v16 / v16;
        *((double *)v15 + 5) = *((double *)v15 + 5) / v16;
        *((double *)v15 + 6) = v17;
        *((double *)v15 + 7) = *((double *)v15 + 7) / v16;
        *((double *)v15 + 8) = self->_estimatedAbsoluteAltitudeUncertainty * self->_estimatedAbsoluteAltitudeUncertainty;
        v74 = v15[9];
        v18 = *(_OWORD *)(v15 + 7);
        v73[0] = *(_OWORD *)(v15 + 5);
        v73[1] = v18;
        -[CLBarometerCalibrationBiasEstimator crossEntropyOfreference:](self, "crossEntropyOfreference:", v73);
        v20 = v19;
        if (v10 >= v19)
        {
          v75 = *((_DWORD *)v15 + 8);
          v10 = v19;
        }
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v21 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *((_DWORD *)v15 + 8);
          v23 = v15[7];
          v24 = v15[5];
          v25 = sqrt(*((double *)v15 + 8));
          v26 = *((double *)v15 + 6);
          *(_DWORD *)buf = v61;
          v109 = "type";
          v110 = 1024;
          v111 = v22;
          v112 = 2080;
          v113 = "crossEntropy";
          v114 = 2048;
          v115 = v20;
          v116 = 2080;
          v117 = "fromBaroAlt";
          v118 = 2048;
          v119 = v23;
          v120 = 2080;
          v121 = "fromRefAlt";
          v122 = 2048;
          v123 = v24;
          v124 = 2080;
          v125 = "baroUncertainty";
          v126 = 2048;
          v127 = v25;
          v128 = 2080;
          v129 = "refUncertainty";
          v130 = 2048;
          v131 = sqrt(v26);
          v132 = 2080;
          v133 = "trackStartTime";
          v134 = 2048;
          v135 = a5;
          v136 = 2080;
          v137 = "trackEndTime";
          v138 = 2048;
          v139 = a6;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x9Eu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10214F870);
          v30 = *((_DWORD *)v15 + 8);
          v31 = v15[7];
          v32 = v15[5];
          v33 = sqrt(*((double *)v15 + 8));
          v34 = *((double *)v15 + 6);
          v76 = v61;
          v77 = "type";
          v78 = 1024;
          v79 = v30;
          v80 = 2080;
          v81 = "crossEntropy";
          v82 = 2048;
          v83 = v20;
          v84 = 2080;
          v85 = "fromBaroAlt";
          v86 = 2048;
          v87 = v31;
          v88 = 2080;
          v89 = "fromRefAlt";
          v90 = 2048;
          v91 = v32;
          v92 = 2080;
          v93 = "baroUncertainty";
          v94 = 2048;
          v95 = v33;
          v96 = 2080;
          v97 = "refUncertainty";
          v98 = 2048;
          v99 = sqrt(v34);
          v100 = 2080;
          v101 = "trackStartTime";
          v102 = 2048;
          v103 = a5;
          v104 = 2080;
          v105 = "trackEndTime";
          v106 = 2048;
          v107 = a6;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v76, 158, (const char *)v61, *((double *)&v61 + 1), v64, *(double *)&v65, *(const char **)&v66.var0, v66.var1, (const char *)v67, *((double *)&v67 + 1), v68,
            v69,
            *(const char **)&v70.var0,
            v70.var1,
            (const char *)v71,
            *((double *)&v71 + 1));
          v36 = (uint8_t *)v35;
          sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:]", "%s\n", v35);
          if (v36 != buf)
            free(v36);
        }
        v27 = (uint64_t *)v15[1];
        if (v27)
        {
          do
          {
            v28 = v27;
            v27 = (uint64_t *)*v27;
          }
          while (v27);
        }
        else
        {
          do
          {
            v28 = (uint64_t *)v15[2];
            v29 = *v28 == (_QWORD)v15;
            v15 = v28;
          }
          while (!v29);
        }
        v15 = v28;
      }
      while (v28 != (uint64_t *)v14);
    }
  }
  if (-[CLMeanSeaLevelPressureEstimator inVisitStatus](self->_meanSeaLevelPressureEstimator, "inVisitStatus"))
  {
    begin = self->_loiVisitAltitudes.__begin_;
    end = self->_loiVisitAltitudes.__end_;
    if (end != begin)
    {
      v39 = log(self->_estimatedAbsoluteAltitudeUncertainty * (self->_estimatedAbsoluteAltitudeUncertainty * 17.0794684));
      v40 = (int *)(v65 + 1);
      *(_QWORD *)&v41 = 136318978;
      v62 = v41;
      do
      {
        v70 = *begin;
        v42 = self->_estimatedAbsoluteAltitudeUncertainty * self->_estimatedAbsoluteAltitudeUncertainty;
        *(double *)&v71 = a4;
        *((double *)&v71 + 1) = v42;
        LODWORD(v72) = 1;
        v68 = v72;
        v66 = v70;
        v67 = v71;
        -[CLBarometerCalibrationBiasEstimator crossEntropyOfreference:](self, "crossEntropyOfreference:", &v66);
        v44 = v43;
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v45 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v62;
          v109 = "type";
          v110 = 1024;
          v111 = 13;
          v112 = 2080;
          v113 = "crossEntropy";
          v114 = 2048;
          v115 = v44;
          v116 = 2080;
          v117 = "fromBaroAlt";
          v118 = 2048;
          v119 = v71;
          v120 = 2080;
          v121 = "fromRefAlt";
          v122 = 2048;
          v123 = *(_QWORD *)&v70.var0;
          v124 = 2080;
          v125 = "baroUncertainty";
          v126 = 2048;
          v127 = sqrt(*((double *)&v71 + 1));
          v128 = 2080;
          v129 = "refUncertainty";
          v130 = 2048;
          v131 = sqrt(v70.var1);
          v132 = 2080;
          v133 = "trackStartTime";
          v134 = 2048;
          v135 = a5;
          v136 = 2080;
          v137 = "trackEndTime";
          v138 = 2048;
          v139 = a6;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x9Eu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10214F870);
          v76 = v62;
          v77 = "type";
          v78 = 1024;
          v79 = 13;
          v80 = 2080;
          v81 = "crossEntropy";
          v82 = 2048;
          v83 = v44;
          v84 = 2080;
          v85 = "fromBaroAlt";
          v86 = 2048;
          v87 = v71;
          v88 = 2080;
          v89 = "fromRefAlt";
          v90 = 2048;
          v91 = *(_QWORD *)&v70.var0;
          v92 = 2080;
          v93 = "baroUncertainty";
          v94 = 2048;
          v95 = sqrt(*((double *)&v71 + 1));
          v96 = 2080;
          v97 = "refUncertainty";
          v98 = 2048;
          v99 = sqrt(v70.var1);
          v100 = 2080;
          v101 = "trackStartTime";
          v102 = 2048;
          v103 = a5;
          v104 = 2080;
          v105 = "trackEndTime";
          v106 = 2048;
          v107 = a6;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v76, 158, (const char *)v62, *((double *)&v62 + 1), v64, *(double *)&v65, *(const char **)&v66.var0, v66.var1, (const char *)v67, *((double *)&v67 + 1), v68,
            v69,
            *(const char **)&v70.var0,
            v70.var1,
            (const char *)v71,
            *((double *)&v71 + 1));
          v55 = (uint8_t *)v54;
          sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:]", "%s\n", v54);
          if (v55 != buf)
            free(v55);
        }
        if (v39 >= v44)
        {
          v75 = 13;
          v46 = *(_QWORD *)v40;
          if (!*(_QWORD *)v40)
            goto LABEL_46;
          v47 = v40;
          do
          {
            v48 = *(_DWORD *)(v46 + 32);
            v49 = v48 < 13;
            if (v48 >= 13)
              v50 = (uint64_t *)v46;
            else
              v50 = (uint64_t *)(v46 + 8);
            if (!v49)
              v47 = (int *)v46;
            v46 = *v50;
          }
          while (*v50);
          if (v47 != v40 && v47[8] < 14)
          {
            v51 = sub_1000B5C9C((uint64_t)v65, &v75);
            v52 = (int)v72;
            v53 = v71;
            *(NormalDistribution *)v51 = v70;
            *((_OWORD *)v51 + 1) = v53;
            *((_DWORD *)v51 + 8) = v52;
          }
          else
          {
LABEL_46:
            sub_1006F0D64(v65, &v75, &v75, (uint64_t)&v70);
          }
          self->_loiRebase = 1;
          v39 = v44;
        }
        ++begin;
      }
      while (begin != end);
    }
  }
  return v75;
}

- (void)updateBiasUncertaintyWithAbsSigElevation:(double)a3 withCompanion:(BOOL)a4
{
  _BOOL4 v4;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  float v11;
  float v12;
  double v13;
  double bias;
  double v15;
  NSObject *v16;
  double biasUncertaintyAtRebase;
  double v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  double v21;
  const char *v22;
  uint8_t *v23;
  __int128 v24;
  const char *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  double v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  double v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  double v52;

  v4 = a4;
  sub_100211128((uint64_t)&v25, (_QWORD *)self->_dataBuffers + 6);
  v7 = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)&v26 + (((unint64_t)(v28 + v27 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v28 + v27 - 1));
  v24 = v7;
  v8 = *(std::__shared_weak_count **)(*(_QWORD *)(*(_QWORD *)&v26
                                                + (((unint64_t)(v28 + v27 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v28 + v27 - 1)
                                    + 8);
  if (*((_QWORD *)&v7 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = *(double *)(v7 + 8) * 1000.0;
  v12 = sub_10024806C(v11, 101320.0);
  if (a3 != 1.79769313e308)
  {
    v13 = v12;
    bias = self->_bias;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v15 = bias + v13;
    v16 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      biasUncertaintyAtRebase = self->_biasUncertaintyAtRebase;
      *(_DWORD *)buf = 136316418;
      v42 = "takeMaxForPhone";
      v43 = 1024;
      v44 = v4;
      v45 = 2080;
      v46 = "bayesianInferenceResult";
      v47 = 2048;
      v48 = biasUncertaintyAtRebase;
      v49 = 2080;
      v50 = "diffOfAbsSigElevationAndAbsAltitude";
      v51 = 2048;
      v52 = vabdd_f64(a3, v15);
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "re-initialize bias uncertainty with,%s,%d,%s,%f,%s,%f", buf, 0x3Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v21 = self->_biasUncertaintyAtRebase;
      v29 = 136316418;
      v30 = "takeMaxForPhone";
      v31 = 1024;
      v32 = v4;
      v33 = 2080;
      v34 = "bayesianInferenceResult";
      v35 = 2048;
      v36 = v21;
      v37 = 2080;
      v38 = "diffOfAbsSigElevationAndAbsAltitude";
      v39 = 2048;
      v40 = vabdd_f64(a3, v15);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "re-initialize bias uncertainty with,%s,%d,%s,%f,%s,%f", (const char *)&v29, 58, (const char *)v24, *((double *)&v24 + 1), v25, v26);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithAbsSigElevation:withCompanion:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
    v18 = vabdd_f64(a3, v15);
    if (v4)
    {
      if (self->_biasUncertaintyAtRebase >= v18)
        v18 = self->_biasUncertaintyAtRebase;
    }
    else
    {
      v18 = v18 + self->_biasUncertaintyAtRebase;
    }
    self->_biasUncertaintyAtRebase = v18;
  }
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  sub_1006F0FB8(&v25);
}

- (void)rebaseSignificantElevationWithEndTime:(double)a3
{
  float v5;
  float v6;
  double v7;
  double v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  double v12;
  double v13;
  int v14;
  const char *v15;
  __int16 v16;
  double v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  double v21;

  if ((-[CLBarometerCalibrationContextClient isInVisit](self->_delegate, "isInVisit") & 1) == 0)
  {
    v13 = 0.0;
    if (-[CLBarometerCalibrationBiasEstimator getLastPressureSample:](self, "getLastPressureSample:", &v13))
    {
      v5 = v13;
      v6 = sub_10024806C(v5, 101320.0);
      sub_1008B5430((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, self->_bias + v6, self->_bias, v7, v8);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v9 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "endTrackTime";
        v20 = 2048;
        v21 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "significant elevation rebase: %s,%f", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v14 = 136315394;
        v15 = "endTrackTime";
        v16 = 2048;
        v17 = a3;
        LODWORD(v12) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "significant elevation rebase: %s,%f", (const char *)&v14, v12);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator rebaseSignificantElevationWithEndTime:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
    }
  }
}

- (BOOL)getLastPressureSample:(double *)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t v10;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t v14;

  sub_100211128((uint64_t)v12, (_QWORD *)self->_dataBuffers + 6);
  v4 = v14;
  if (v14)
  {
    v5 = (uint64_t *)(*(_QWORD *)(v12[1] + (((unint64_t)(v14 + v13 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (v14 + v13 - 1));
    v6 = *v5;
    v7 = (std::__shared_weak_count *)v5[1];
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
      *a3 = *(double *)(v6 + 8) * 1000.0;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    else
    {
      *a3 = *(double *)(v6 + 8) * 1000.0;
    }
  }
  sub_1006F0FB8(v12);
  return v4 != 0;
}

- (void)updateLoiInfo:(const void *)a3
{
  CFAbsoluteTime Current;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint8_t *v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  double v22;
  uint64_t v23;
  int v24;
  CFAbsoluteTime v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint8_t buf[4];
  CFAbsoluteTime v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;

  Current = CFAbsoluteTimeGetCurrent();
  if (-[CLMeanSeaLevelPressureEstimator inVisitStatus](self->_meanSeaLevelPressureEstimator, "inVisitStatus"))
  {
    v6 = *(char **)a3;
    v7 = *((_QWORD *)a3 + 1);
    if (v7 == *(_QWORD *)a3)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v19 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v31 = Current;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "receive visit in bias estimator with no loi,timestamp,%f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v24 = 134217984;
        v25 = Current;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "receive visit in bias estimator with no loi,timestamp,%f", COERCE_DOUBLE(&v24));
        v21 = (uint8_t *)v20;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateLoiInfo:]", "%s\n", v20);
        if (v21 != buf)
          free(v21);
      }
    }
    else
    {
      if (self->_enableLoiRebase && &self->_loiVisitAltitudes != a3)
      {
        sub_1002F3538((char *)&self->_loiVisitAltitudes, v6, v7, (v7 - *(_QWORD *)a3) >> 4);
        v6 = *(char **)a3;
        v7 = *((_QWORD *)a3 + 1);
      }
      if ((char *)v7 != v6)
      {
        v8 = 0;
        v9 = 0;
        v23 = 134218496;
        do
        {
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10214F870);
          v10 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
          {
            v11 = (uint64_t *)(*(_QWORD *)a3 + v8);
            v13 = *v11;
            v12 = v11[1];
            *(_DWORD *)buf = v23;
            v31 = Current;
            v32 = 2048;
            v33 = v13;
            v34 = 2048;
            v35 = v12;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "receive visit loi in bias estimator,timestamp,%f,loiAltitude,%f,loiVerticalVariance,%f", buf, 0x20u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_10214F870);
            v14 = (uint64_t *)(*(_QWORD *)a3 + v8);
            v16 = *v14;
            v15 = v14[1];
            v24 = v23;
            v25 = Current;
            v26 = 2048;
            v27 = v16;
            v28 = 2048;
            v29 = v15;
            LODWORD(v22) = 32;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "receive visit loi in bias estimator,timestamp,%f,loiAltitude,%f,loiVerticalVariance,%f", COERCE_DOUBLE(&v24), v22, *(double *)&v23);
            v18 = (uint8_t *)v17;
            sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateLoiInfo:]", "%s\n", v17);
            if (v18 != buf)
              free(v18);
          }
          ++v9;
          v8 += 16;
        }
        while (v9 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
      }
    }
  }
}

- (void)sendVisitExitWifiImprovementAnalyticsEventWithDuration:(double)a3 uncertaintyAtVisitEntry:(double)a4 uncertaintyAtVisitExit:(double)a5 timeDiffBtwArrivalAndLastRebase:(double)a6
{
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  double v13;
  void **v14;
  uint64_t v15;
  NSDictionary *(*v16)(double *);
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10214F870);
  v10 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v31 = a3;
    v32 = 2048;
    v33 = a4;
    v34 = 2048;
    v35 = a5;
    v36 = 2048;
    v37 = a6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sent visit exit information to CoreAnalytics,visitDuration,%f,arrivalUncertainty,%f,exitUncertainty,%f,timeDiffBtwArrivalAndLastRebase,%f", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v22 = 134218752;
    v23 = a3;
    v24 = 2048;
    v25 = a4;
    v26 = 2048;
    v27 = a5;
    v28 = 2048;
    v29 = a6;
    LODWORD(v13) = 42;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "sent visit exit information to CoreAnalytics,visitDuration,%f,arrivalUncertainty,%f,exitUncertainty,%f,timeDiffBtwArrivalAndLastRebase,%f", COERCE_DOUBLE(&v22), v13, *(double *)&v14, *(double *)&v15);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator sendVisitExitWifiImprovementAnalyticsEventWithDuration:uncertaintyAtVisitEntry:uncertaintyAtVisitExit:timeDiffBtwArrivalAndLastRebase:]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1006EE150;
  v17 = &unk_10214F7E8;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  AnalyticsSendEventLazy(CFSTR("com.apple.Motion.Altimeter.VisitExitWifiZImprovement"), &v14);
}

- (void)updateVisitState:(BOOL)a3 arrivalTime:(double)a4 departureTime:(double)a5
{
  _BOOL8 v7;
  CFAbsoluteTime Current;
  CLMeanSeaLevelPressureEstimator *meanSeaLevelPressureEstimator;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  double uncertaintyAtVisitEntry;
  double visitArrivalTimestamp;
  double timeDiffBtwVisitEntryAndLastRebase;
  double v22;
  double v23;
  double v24;
  const char *v25;
  uint8_t *v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  const char *v31;
  uint8_t *v32;
  NSObject *v33;
  double v34;
  double v35;
  double v36;
  const char *v37;
  uint8_t *v38;
  double v39;
  const char *v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint8_t *v45;
  double v46;
  int v47;
  _BYTE v48[34];
  uint8_t buf[4];
  _BYTE v50[34];

  v7 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  if (-[CLMeanSeaLevelPressureEstimator inVisitStatus](self->_meanSeaLevelPressureEstimator, "inVisitStatus") != v7)
  {
    meanSeaLevelPressureEstimator = self->_meanSeaLevelPressureEstimator;
    if (v7)
    {
      -[CLMeanSeaLevelPressureEstimator setCumulativeStartTime:](meanSeaLevelPressureEstimator, "setCumulativeStartTime:", 1.79769313e308);
    }
    else
    {
      -[CLMeanSeaLevelPressureEstimator setFirstRefreshAfterVisit:](meanSeaLevelPressureEstimator, "setFirstRefreshAfterVisit:", 1);
      -[CLMeanSeaLevelPressureEstimator resetInVisitRebasedMslp](self->_meanSeaLevelPressureEstimator, "resetInVisitRebasedMslp");
      -[CLMeanSeaLevelPressureEstimator setExitVisitTimestamp:](self->_meanSeaLevelPressureEstimator, "setExitVisitTimestamp:", a5);
      self->_loiVisitAltitudes.__end_ = self->_loiVisitAltitudes.__begin_;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v11 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        -[CLMeanSeaLevelPressureEstimator exitVisitTimestamp](self->_meanSeaLevelPressureEstimator, "exitVisitTimestamp");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v50 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "received exit visit,timestamp,%f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v42 = qword_10229FE88;
        -[CLMeanSeaLevelPressureEstimator exitVisitTimestamp](self->_meanSeaLevelPressureEstimator, "exitVisitTimestamp");
        v47 = 134217984;
        *(_QWORD *)v48 = v43;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v42, 0, "received exit visit,timestamp,%f", COERCE_DOUBLE(&v47));
        v45 = (uint8_t *)v44;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v44);
        if (v45 != buf)
          free(v45);
      }
    }
    -[CLMeanSeaLevelPressureEstimator setInVisitStatus:](self->_meanSeaLevelPressureEstimator, "setInVisitStatus:", v7);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v13 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v50 = v7;
      *(_WORD *)&v50[4] = 2048;
      *(CFAbsoluteTime *)&v50[6] = Current;
      *(_WORD *)&v50[14] = 2048;
      *(double *)&v50[16] = a4;
      *(_WORD *)&v50[24] = 2048;
      *(double *)&v50[26] = a5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "visit state changed,visitState,%d,timestamp,%f,arrival,%f,departure,%f", buf, 0x26u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      *(_WORD *)&v48[4] = 2048;
      *(CFAbsoluteTime *)&v48[6] = Current;
      *(_WORD *)&v48[14] = 2048;
      *(double *)&v48[16] = a4;
      *(_WORD *)&v48[24] = 2048;
      *(double *)&v48[26] = a5;
      LODWORD(v46) = 38;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "visit state changed,visitState,%d,timestamp,%f,arrival,%f,departure,%f", &v47, v46, COERCE_DOUBLE(__PAIR64__(v7, 67109888)), *(double *)&v48[4]);
      v38 = (uint8_t *)v37;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v37);
      if (v38 != buf)
        free(v38);
    }
    -[CLMeanSeaLevelPressureEstimator saveInVisitStateToPlist](self->_meanSeaLevelPressureEstimator, "saveInVisitStateToPlist");
  }
  v14 = -[CLBarometerCalibrationContextClient latestAbsoluteAltitude](self->_delegate, "latestAbsoluteAltitude");
  v15 = v14;
  if (v7)
  {
    self->_lastVisitEntryTime = Current;
    if (v14)
    {
      objc_msgSend(v14, "timestamp");
      if (v16 != 1.79769313e308 && self->_lastRebaseTimestamp != 1.79769313e308)
      {
        objc_msgSend(v15, "accuracy");
        self->_uncertaintyAtVisitEntry = v17;
        self->_timeDiffBtwVisitEntryAndLastRebase = Current - self->_lastRebaseTimestamp;
        self->_visitArrivalTimestamp = Current;
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v18 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          uncertaintyAtVisitEntry = self->_uncertaintyAtVisitEntry;
          timeDiffBtwVisitEntryAndLastRebase = self->_timeDiffBtwVisitEntryAndLastRebase;
          visitArrivalTimestamp = self->_visitArrivalTimestamp;
          *(_DWORD *)buf = 134218496;
          *(double *)v50 = uncertaintyAtVisitEntry;
          *(_WORD *)&v50[8] = 2048;
          *(double *)&v50[10] = visitArrivalTimestamp;
          *(_WORD *)&v50[18] = 2048;
          *(double *)&v50[20] = timeDiffBtwVisitEntryAndLastRebase;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "record coreAnalytics event data,uncertaintyAtVisitEntry,%f,visitArrivalTimestamp,%f,timeDiffBtwVisitEntryAndLastRebase,%f", buf, 0x20u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10214F870);
          v22 = self->_uncertaintyAtVisitEntry;
          v24 = self->_timeDiffBtwVisitEntryAndLastRebase;
          v23 = self->_visitArrivalTimestamp;
          v47 = 134218496;
          *(double *)v48 = v22;
          *(_WORD *)&v48[8] = 2048;
          *(double *)&v48[10] = v23;
          *(_WORD *)&v48[18] = 2048;
          *(double *)&v48[20] = v24;
          LODWORD(v46) = 32;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "record coreAnalytics event data,uncertaintyAtVisitEntry,%f,visitArrivalTimestamp,%f,timeDiffBtwVisitEntryAndLastRebase,%f", COERCE_DOUBLE(&v47), v46);
          v26 = (uint8_t *)v25;
          sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v25);
          if (v26 != buf)
            free(v26);
        }
      }
    }
  }
  else
  {
    if (!v14
      || (objc_msgSend(v14, "timestamp"), v27 == 1.79769313e308)
      || (v28 = self->_visitArrivalTimestamp, v28 == 1.79769313e308))
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v33 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        v34 = self->_visitArrivalTimestamp;
        *(_DWORD *)buf = 134217984;
        *(double *)v50 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "fail to send visit exit event to CA,visitArrivalTimestamp,%f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v39 = self->_visitArrivalTimestamp;
        v47 = 134217984;
        *(double *)v48 = v39;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "fail to send visit exit event to CA,visitArrivalTimestamp,%f", COERCE_DOUBLE(&v47));
        v41 = (uint8_t *)v40;
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v40);
        if (v41 != buf)
          free(v41);
      }
    }
    else
    {
      v29 = Current - v28;
      if (Current - v28 >= 0.0)
      {
        v35 = self->_uncertaintyAtVisitEntry;
        objc_msgSend(v15, "accuracy");
        -[CLBarometerCalibrationBiasEstimator sendVisitExitWifiImprovementAnalyticsEventWithDuration:uncertaintyAtVisitEntry:uncertaintyAtVisitExit:timeDiffBtwArrivalAndLastRebase:](self, "sendVisitExitWifiImprovementAnalyticsEventWithDuration:uncertaintyAtVisitEntry:uncertaintyAtVisitExit:timeDiffBtwArrivalAndLastRebase:", v29 / 60.0, v35, v36, self->_timeDiffBtwVisitEntryAndLastRebase / 60.0);
      }
      else
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10214F870);
        v30 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "visit exit timestamp is earlier than visit entry timestamp.", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10214F870);
          LOWORD(v47) = 0;
          LODWORD(v46) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "visit exit timestamp is earlier than visit entry timestamp.", &v47, *(_QWORD *)&v46);
          v32 = (uint8_t *)v31;
          sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v31);
          if (v32 != buf)
            free(v32);
        }
      }
      if (a4 > 0.0)
        -[CLBarometerCalibrationBiasEstimator sendVisitExitAnalyticsWithDuration:andRebaseEvent:andUncertaintyAtEntry:](self, "sendVisitExitAnalyticsWithDuration:andRebaseEvent:andUncertaintyAtEntry:", &self->_firstRebaseEventInVisit, (a5 - a4) / 60.0, self->_uncertaintyAtVisitEntry);
    }
    self->_visitArrivalTimestamp = 1.79769313e308;
  }
}

- (void)sendRebaseAnalyticsWithAltitudeError:(double)a3 andUncertainty:(double)a4 andRefUncertainty:(double)a5 andDemAvailable:(BOOL)a6 andWorkout:(BOOL)a7 andReferenceSource:(int)a8 andCorrection:(double)a9 andDistance:(double)a10
{
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  BOOL v29;
  _QWORD v30[5];
  _BYTE v31[201];
  __int128 v32;
  __int16 v33;
  std::string v34;
  std::string v35;
  std::string v36;
  std::string v37;
  std::string v38;
  std::string v39;
  std::string v40;
  std::string v41;
  void *v42;
  void *v43;
  uint64_t v44;
  std::string v45;
  void *v46;
  void *v47;
  uint64_t v48;
  std::string v49;
  void *v50;
  void *v51;
  uint64_t v52;
  std::string v53;
  void *v54;
  void *v55;
  uint64_t v56;
  std::string __src;
  void *v58;
  void *v59;
  uint64_t v60;
  std::string v61;
  void *__p;
  void *v63;
  uint64_t v64;
  std::string v65;
  void *v66;
  void *v67;
  uint64_t v68;
  std::string v69;
  void *v70;
  void *v71;
  uint64_t v72;
  std::string v73;

  v18 = a3;
  v19 = fabsf(v18);
  v71 = 0;
  v72 = 0;
  v70 = 0;
  sub_10027205C(&v70, (const void *)qword_102303760, qword_102303768, (qword_102303768 - qword_102303760) >> 2);
  sub_10041CAFC((uint64_t)&v70, &v73, v19);
  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }
  v67 = 0;
  v68 = 0;
  v66 = 0;
  sub_10027205C(&v66, (const void *)qword_102303748, qword_102303750, (qword_102303750 - qword_102303748) >> 2);
  v20 = a5;
  sub_10041CAFC((uint64_t)&v66, &v69, v20);
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
  v64 = 0;
  __p = 0;
  v63 = 0;
  sub_10027205C(&__p, (const void *)qword_102303748, qword_102303750, (qword_102303750 - qword_102303748) >> 2);
  v21 = a4;
  sub_10041CAFC((uint64_t)&__p, &v65, v21);
  if (__p)
  {
    v63 = __p;
    operator delete(__p);
  }
  v60 = 0;
  v58 = 0;
  v59 = 0;
  sub_10027205C(&v58, (const void *)qword_102303760, qword_102303768, (qword_102303768 - qword_102303760) >> 2);
  v22 = a9;
  sub_10041CAFC((uint64_t)&v58, &v61, fabsf(v22));
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  if (self->_previousBiasTimestamp == 1.79769313e308)
  {
    v23 = CFAbsoluteTimeGetCurrent() - self->_locationdStartTime;
    v24 = fabsf(v23);
  }
  else
  {
    v24 = -1.0;
  }
  v56 = 0;
  v54 = 0;
  v55 = 0;
  sub_10027205C(&v54, (const void *)qword_102303778, qword_102303780, (qword_102303780 - qword_102303778) >> 2);
  sub_10041CAFC((uint64_t)&v54, &__src, v24);
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
  v25 = -1.0;
  if (self->_previousBiasTimestamp != 1.79769313e308)
  {
    v26 = CFAbsoluteTimeGetCurrent() - self->_previousBiasTimestamp;
    v25 = fabsf(v26);
  }
  v52 = 0;
  v50 = 0;
  v51 = 0;
  sub_10027205C(&v50, (const void *)qword_102303790, qword_102303798, (qword_102303798 - qword_102303790) >> 2);
  sub_10041CAFC((uint64_t)&v50, &v53, v25);
  if (v50)
  {
    v51 = v50;
    operator delete(v50);
  }
  if (self->_lastVisitEntryTime == 1.79769313e308)
    v27 = -1.0;
  else
    v27 = vabdd_f64(CFAbsoluteTimeGetCurrent(), self->_lastVisitEntryTime) / 60.0;
  v48 = 0;
  v46 = 0;
  v47 = 0;
  sub_10027205C(&v46, (const void *)qword_1023037A8, qword_1023037B0, (qword_1023037B0 - qword_1023037A8) >> 2);
  sub_10041CAFC((uint64_t)&v46, &v49, v27);
  if (v46)
  {
    v47 = v46;
    operator delete(v46);
  }
  v43 = 0;
  v44 = 0;
  v42 = 0;
  sub_10027205C(&v42, (const void *)qword_1023037C0, qword_1023037C8, (qword_1023037C8 - qword_1023037C0) >> 2);
  v28 = a10;
  sub_10041CAFC((uint64_t)&v42, &v45, v28);
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
  *(float32x2_t *)&v32 = vcvt_f32_f64((float64x2_t)self->_biasLocation);
  BYTE8(v32) = -[CLBarometerCalibrationContextClient isInVisit](self->_delegate, "isInVisit");
  BYTE9(v32) = a6;
  v29 = self->_lastForcedGpsTime != 1.79769313e308 && CFAbsoluteTimeGetCurrent() - self->_lastForcedGpsTime < 546.0;
  BYTE10(v32) = v29;
  HIDWORD(v32) = a8;
  LOBYTE(v33) = a7;
  HIBYTE(v33) = self->_previousBiasTimestamp == 1.79769313e308;
  if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
    sub_100115CE4(&v34, v73.__r_.__value_.__l.__data_, v73.__r_.__value_.__l.__size_);
  else
    v34 = v73;
  if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0)
    sub_100115CE4(&v35, __src.__r_.__value_.__l.__data_, __src.__r_.__value_.__l.__size_);
  else
    v35 = __src;
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    sub_100115CE4(&v36, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
  else
    v36 = v69;
  if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
    sub_100115CE4(&v37, v65.__r_.__value_.__l.__data_, v65.__r_.__value_.__l.__size_);
  else
    v37 = v65;
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    sub_100115CE4(&v38, v49.__r_.__value_.__l.__data_, v49.__r_.__value_.__l.__size_);
  else
    v38 = v49;
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    sub_100115CE4(&v39, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
  else
    v39 = v53;
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
    sub_100115CE4(&v40, v61.__r_.__value_.__l.__data_, v61.__r_.__value_.__l.__size_);
  else
    v40 = v61;
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    sub_100115CE4(&v41, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
  else
    v41 = v45;
  if (self->_lastVisitEntryTime != 1.79769313e308)
  {
    *(_OWORD *)&self->_firstRebaseEventInVisit.latitude = v32;
    *(_WORD *)&self->_firstRebaseEventInVisit.inOutdoorWorkout = v33;
    std::string::operator=((std::string *)&self->_firstRebaseEventInVisit.altitudeError_binned, &v34);
    std::string::operator=((std::string *)&self->_firstRebaseEventInVisit.altitudeError_binned.__r_.var0, &v35);
    std::string::operator=((std::string *)&self->_anon_160[8], &v36);
    std::string::operator=((std::string *)&self->_anon_160[32], &v37);
    std::string::operator=((std::string *)&self->_anon_160[56], &v38);
    std::string::operator=((std::string *)&self->_anon_160[80], &v39);
    std::string::operator=((std::string *)&self->_anon_160[104], &v40);
    std::string::operator=((std::string *)&self->_anon_160[128], &v41);
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3321888768;
  v30[2] = sub_1006EF3F4;
  v30[3] = &unk_10214F810;
  sub_1006F05B0((uint64_t)v31, &v32);
  v30[4] = self;
  AnalyticsSendEventLazy(CFSTR("com.apple.Motion.Altimeter.Rebase_Test"), v30);
  self->_previousBiasTimestamp = self->_biasTimestamp;
  self->_lastVisitEntryTime = 1.79769313e308;
  self->_distanceSinceLastRebase = -1.0;
  sub_1006F082C((uint64_t)v31);
  sub_1006F082C((uint64_t)&v32);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v49.__r_.__value_.__l.__data_);
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v53.__r_.__value_.__l.__data_);
  if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__src.__r_.__value_.__l.__data_);
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v61.__r_.__value_.__l.__data_);
  if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v65.__r_.__value_.__l.__data_);
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v69.__r_.__value_.__l.__data_);
  if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v73.__r_.__value_.__l.__data_);
}

- (void)sendVisitExitAnalyticsWithDuration:(double)a3 andRebaseEvent:(void *)a4 andUncertaintyAtEntry:(double)a5
{
  float v7;
  float v8;
  __int128 v9;
  __int16 v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[4];
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *__p;
  char v34;
  int rebaseSource;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;

  v7 = a3;
  v56 = 0;
  v57 = 0;
  v55 = 0;
  sub_10027205C(&v55, (const void *)qword_1023037D8, qword_1023037E0, (qword_1023037E0 - qword_1023037D8) >> 2);
  sub_10041CAFC((uint64_t)&v55, &v58, v7);
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  v51 = 0;
  v52 = 0;
  v50 = 0;
  sub_10027205C(&v50, (const void *)qword_102303748, qword_102303750, (qword_102303750 - qword_102303748) >> 2);
  v8 = a5;
  sub_10041CAFC((uint64_t)&v50, &v53, v8);
  if (v50)
  {
    v51 = v50;
    operator delete(v50);
  }
  rebaseSource = self->_firstRebaseEventInVisit.rebaseSource;
  if (SHIBYTE(v54) < 0)
  {
    sub_100115CE4(&v36, (void *)v53, *((unint64_t *)&v53 + 1));
  }
  else
  {
    v36 = v53;
    v37 = v54;
  }
  if ((char)self->_anon_160[55] < 0)
  {
    sub_100115CE4(&v38, *(void **)&self->_anon_160[32], *(_QWORD *)&self->_anon_160[40]);
  }
  else
  {
    v38 = *(_OWORD *)&self->_anon_160[32];
    v39 = *(_QWORD *)&self->_anon_160[48];
  }
  if (SHIBYTE(v59) < 0)
  {
    sub_100115CE4(&v40, (void *)v58, *((unint64_t *)&v58 + 1));
  }
  else
  {
    v40 = v58;
    v41 = v59;
  }
  if ((char)self->_anon_160[79] < 0)
  {
    sub_100115CE4(&v42, *(void **)&self->_anon_160[56], *(_QWORD *)&self->_anon_160[64]);
  }
  else
  {
    v42 = *(_OWORD *)&self->_anon_160[56];
    v43 = *(_QWORD *)&self->_anon_160[72];
  }
  if (*((char *)&self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_100115CE4(&v44, self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1.__data_, self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    v44 = *(_OWORD *)self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var0.__data_;
    v45 = *((_QWORD *)&self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1 + 2);
  }
  if ((char)self->_anon_160[31] < 0)
  {
    sub_100115CE4(&v46, *(void **)&self->_anon_160[8], *(_QWORD *)&self->_anon_160[16]);
  }
  else
  {
    v46 = *(_OWORD *)&self->_anon_160[8];
    v47 = *(_QWORD *)&self->_anon_160[24];
  }
  if ((char)self->_anon_160[127] < 0)
  {
    sub_100115CE4(&v48, *(void **)&self->_anon_160[104], *(_QWORD *)&self->_anon_160[112]);
  }
  else
  {
    v48 = *(_OWORD *)&self->_anon_160[104];
    v49 = *(_QWORD *)&self->_anon_160[120];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3321888768;
  v19[2] = sub_1006EFD04;
  v19[3] = &unk_10214F840;
  sub_1006F08CC((uint64_t)&v20, (uint64_t)&rebaseSource);
  AnalyticsSendEventLazy(CFSTR("com.apple.Motion.Altimeter.VisitExit"), v19);
  *(_DWORD *)((char *)&v9 + 7) = 0;
  *(_QWORD *)&v9 = 0;
  HIDWORD(v9) = -10;
  v10 = 0;
  sub_1015A2E04(v11, "NULL");
  sub_1015A2E04(v12, "NULL");
  sub_1015A2E04(v13, "NULL");
  sub_1015A2E04(v14, "NULL");
  sub_1015A2E04(v15, "NULL");
  sub_1015A2E04(v16, "NULL");
  sub_1015A2E04(v17, "NULL");
  sub_1015A2E04(v18, "NULL");
  sub_1006EFEBC((uint64_t)&self->_firstRebaseEventInVisit, &v9);
  sub_1006F082C((uint64_t)&v9);
  if (v34 < 0)
    operator delete(__p);
  if (v32 < 0)
    operator delete(v31);
  if (v30 < 0)
    operator delete(v29);
  if (v28 < 0)
    operator delete(v27);
  if (v26 < 0)
    operator delete(v25);
  if (v24 < 0)
    operator delete(v23);
  if (v22 < 0)
    operator delete(v21);
  if (SHIBYTE(v49) < 0)
    operator delete((void *)v48);
  if (SHIBYTE(v47) < 0)
    operator delete((void *)v46);
  if (SHIBYTE(v45) < 0)
    operator delete((void *)v44);
  if (SHIBYTE(v43) < 0)
    operator delete((void *)v42);
  if (SHIBYTE(v41) < 0)
    operator delete((void *)v40);
  if (SHIBYTE(v39) < 0)
    operator delete((void *)v38);
  if (SHIBYTE(v37) < 0)
    operator delete((void *)v36);
  if (SHIBYTE(v54) < 0)
    operator delete((void *)v53);
  if (SHIBYTE(v59) < 0)
    operator delete((void *)v58);
}

- (void)announceMostRecentForcedGPS:(double)a3
{
  self->_lastForcedGpsTime = a3;
}

- (void)retrieveBiasInfo
{
  double Current;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  double biasPressure;
  double v17;
  const char *v18;
  NSObject *v19;
  uint8_t *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  int v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint8_t buf[4];
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;

  Current = CFAbsoluteTimeGetCurrent();
  v25 = 1.79769313e308;
  v26 = 1.79769313e308;
  v23 = 0.0;
  *(double *)&v24 = 1.79769313e308;
  *(double *)&v21 = 101325.0;
  v22 = -800.0;
  v4 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 936))(v4);
  v5 = sub_1001FD94C();
  sub_1001FD98C(v5, "CLBarometerCalibration_Timestamp", &v26);
  v6 = sub_1001FD94C();
  sub_1001FD98C(v6, "CLBarometerCalibratio_Bias", &v25);
  v7 = sub_1001FD94C();
  sub_1001FD98C(v7, "CLBarometerCalibration_Uncertainty", &v24);
  v8 = sub_1001FD94C();
  sub_1001FD98C(v8, "CLBarometerCalibration_Weather", &v23);
  v9 = sub_1001FD94C();
  sub_1001FD98C(v9, "CLBarometerCalibration_SignificantElevation", &v22);
  v10 = sub_1001FD94C();
  sub_1001FD98C(v10, "CLBarometerCalibration_BiasPressure", &v21);
  v11 = v26;
  if (v26 == 1.79769313e308 || Current - v26 >= self->_maxBiasAgeFromRecovery || (v12 = v25, v25 == 1.79769313e308))
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v19 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "state is too old to be recovered", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      LOWORD(v27) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "state is too old to be recovered");
      goto LABEL_23;
    }
  }
  else
  {
    self->_biasTimestamp = v26;
    v13 = *(double *)&v21;
    self->_bias = v12;
    self->_biasPressure = v13;
    v14 = *(double *)&v24;
    self->_biasUncertaintyTimestamp = v11;
    self->_biasUncertaintyAtRebase = v14;
    self->_biasUncertainty = v14;
    sub_1008B5C7C((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v23);
    if (v22 != -800.0)
      sub_1008B5C88((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v22);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10214F870);
    v15 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      biasPressure = self->_biasPressure;
      *(_DWORD *)buf = 134219264;
      v40 = v26;
      v41 = 2048;
      v42 = v25;
      v43 = 2048;
      v44 = v24;
      v45 = 2048;
      v46 = v23;
      v47 = 2048;
      v48 = v22;
      v49 = 2048;
      v50 = biasPressure;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "recovering from locationd crash, timestamp %f, bias, %f, uncertainty, %f, weather, %f, sig elev, %f, pressure, %f", buf, 0x3Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10214F870);
      v17 = self->_biasPressure;
      v27 = 134219264;
      v28 = v26;
      v29 = 2048;
      v30 = v25;
      v31 = 2048;
      v32 = v24;
      v33 = 2048;
      v34 = v23;
      v35 = 2048;
      v36 = v22;
      v37 = 2048;
      v38 = v17;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "recovering from locationd crash, timestamp %f, bias, %f, uncertainty, %f, weather, %f, sig elev, %f, pressure, %f");
LABEL_23:
      v20 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator retrieveBiasInfo]", "%s\n", v18);
      if (v20 != buf)
        free(v20);
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

- (void).cxx_destruct
{
  NormalDistribution *begin;
  uint64_t v4;
  unique_ptr<CLSignificantElevationEstimator, std::default_delete<CLSignificantElevationEstimator>> *p_fSignificantElevationEstimatorRebase;
  CLSignificantElevationEstimator *value;

  sub_1006F082C((uint64_t)&self->_firstRebaseEventInVisit);
  begin = self->_loiVisitAltitudes.__begin_;
  if (begin)
  {
    self->_loiVisitAltitudes.__end_ = begin;
    operator delete(begin);
  }
  value = self->_fSignificantElevationEstimatorRebase.__ptr_.__value_;
  p_fSignificantElevationEstimatorRebase = &self->_fSignificantElevationEstimatorRebase;
  v4 = (uint64_t)value;
  p_fSignificantElevationEstimatorRebase->__ptr_.__value_ = 0;
  if (value)
    sub_1006F0D1C((uint64_t)p_fSignificantElevationEstimatorRebase, v4);
}

- (id).cxx_construct
{
  self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ = 0;
  self->_biasLocation = (BiasEstimatorLocation)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->_loiVisitAltitudes.__end_ = 0;
  self->_loiVisitAltitudes.__end_cap_.__value_ = 0;
  self->_loiVisitAltitudes.__begin_ = 0;
  sub_1006F0B80((uint64_t)&self->_firstRebaseEventInVisit);
  return self;
}

@end
