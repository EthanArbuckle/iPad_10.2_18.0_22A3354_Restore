@implementation CLContextManagerAbsoluteAltimeter

- (CLContextManagerAbsoluteAltimeter)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  CLContextManagerAbsoluteAltimeter *v6;
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  objc_super v11;
  int v12;
  uint8_t buf[1640];

  v11.receiver = self;
  v11.super_class = (Class)CLContextManagerAbsoluteAltimeter;
  v6 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:](&v11, "initWithUniverse:delegate:withBuffer:withSourceAggregator:", a3, a4, a5, a6);
  if (v6)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v7 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Absolute Altimeter Context created", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      LOWORD(v12) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "Absolute Altimeter Context created", &v12, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    -[CLBarometerCalibrationSourceAggregator enableSources:forContext:](v6->super._sourceAggregator, "enableSources:forContext:", &off_102220708, v6);
    sub_1006AA544();
  }
  return 0;
}

- (void)setupTimers
{
  CLTimer *v3;
  CLTimer *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](self->super._universe, "silo"), "newTimer");
  self->_forceWifiTimer = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100DEE3D8;
  v6[3] = &unk_10212BB58;
  v6[4] = self;
  -[CLTimer setHandler:](v3, "setHandler:", v6);
  v4 = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](self->super._universe, "silo"), "newTimer");
  self->_forceGPSTimer = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100DEE5A8;
  v5[3] = &unk_10212BB58;
  v5[4] = self;
  -[CLTimer setHandler:](v4, "setHandler:", v5);
}

- (void)teardownTimers
{
  -[CLTimer invalidate](self->_forceWifiTimer, "invalidate");

  self->_forceWifiTimer = 0;
  -[CLTimer invalidate](self->_forceGPSTimer, "invalidate");

  self->_forceGPSTimer = 0;
}

- (void)releasePowerAssertions
{
  CLPowerAssertion *value;
  CLPowerAssertion *v4;

  value = self->_powerAssertionWifi.__ptr_.__value_;
  if (*((int *)value + 2) <= 0)
  {
    self->_powerAssertionWifi.__ptr_.__value_ = 0;
    goto LABEL_5;
  }
  sub_100E3E6F0((uint64_t)value);
  value = self->_powerAssertionWifi.__ptr_.__value_;
  self->_powerAssertionWifi.__ptr_.__value_ = 0;
  if (value)
LABEL_5:
    (*(void (**)(CLPowerAssertion *))(*(_QWORD *)value + 8))(value);
  v4 = self->_powerAssertionGPS.__ptr_.__value_;
  if (*((int *)v4 + 2) <= 0)
  {
    self->_powerAssertionGPS.__ptr_.__value_ = 0;
    goto LABEL_10;
  }
  sub_100E3E6F0((uint64_t)v4);
  v4 = self->_powerAssertionGPS.__ptr_.__value_;
  self->_powerAssertionGPS.__ptr_.__value_ = 0;
  if (v4)
LABEL_10:
    (*(void (**)(CLPowerAssertion *))(*(_QWORD *)v4 + 8))(v4);
}

- (void)dealloc
{
  objc_super v3;

  -[CLBarometerCalibrationSourceAggregator disableSources:forContext:](self->super._sourceAggregator, "disableSources:forContext:", &off_102220708, self);
  -[CLContextManagerAbsoluteAltimeter teardownTimers](self, "teardownTimers");
  -[CLContextManagerAbsoluteAltimeter releasePowerAssertions](self, "releasePowerAssertions");
  v3.receiver = self;
  v3.super_class = (Class)CLContextManagerAbsoluteAltimeter;
  -[CLBarometerCalibrationContextManager dealloc](&v3, "dealloc");
}

- (void)sourceUpdated:(unint64_t)a3
{
  CLBarometerCalibrationAbsoluteAltitude *v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t currentStatusInfo;
  double lastAltitudeSentTimestamp;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
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
  int v32;
  __int16 v33;
  double v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  double v44;

  if (a3)
  {
    if (a3 == 4)
    {
      if (self->_currentWetState == 1)
        -[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromCompanion](self, "calculateAndSendAltitudeFromCompanion");
    }
    else if (a3 == 5)
    {
      if (self->_currentWetState == 1)
      {
        if (self->_currentStatusInfo - 1 >= 2)
        {
          v4 = objc_opt_new(CLBarometerCalibrationAbsoluteAltitude);
          -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v4, "setTimestamp:", CFAbsoluteTimeGetCurrent());
          -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v4, "setAltitude:", 0.0);
          -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", 1.79769313e308);
          -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v4, "setAccuracy:");
          -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v4, "setPrecision:", 5.0);
          -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v4, "setStatusInfo:", 1);
          -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:](self->super._delegate, "absoluteAltitudeUpdate:", v4);
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](v4, "timestamp");
          self->_lastAltitudeSentTimestamp = v5;
          self->_currentStatusInfo = -[CLBarometerCalibrationAbsoluteAltitude statusInfo](v4, "statusInfo");
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021887A0);
          v6 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
          {
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v4, "altitude");
            v8 = v7;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v4, "accuracy");
            v10 = v9;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v4, "precision");
            currentStatusInfo = self->_currentStatusInfo;
            lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219008;
            v36 = v8;
            v37 = 2048;
            v38 = v10;
            v39 = 2048;
            v40 = v13;
            v41 = 1024;
            v42 = currentStatusInfo;
            v43 = 2048;
            v44 = lastAltitudeSentTimestamp;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source timestamp %f this should be one shot", buf, 0x30u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_1021887A0);
            v14 = qword_10229FE88;
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v4, "altitude");
            v16 = v15;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v4, "accuracy");
            v18 = v17;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v4, "precision");
            v19 = self->_currentStatusInfo;
            v20 = self->_lastAltitudeSentTimestamp;
            v25 = 134219008;
            v26 = v16;
            v27 = 2048;
            v28 = v18;
            v29 = 2048;
            v30 = v21;
            v31 = 1024;
            v32 = v19;
            v33 = 2048;
            v34 = v20;
            LODWORD(v24) = 48;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 1, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source timestamp %f this should be one shot", COERCE_DOUBLE(&v25), v24);
            v23 = (uint8_t *)v22;
            sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter sourceUpdated:]", "%s\n", v22);
            if (v23 != buf)
              free(v23);
          }

        }
      }
      else
      {
        -[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro](self, "calculateAndSendAltitudeFromBaro");
      }
    }
  }
  else
  {
    if (self->_currentWetState == 1 || self->_uncalibratedState)
      -[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation](self, "calculateAndSendAltitudeFromLocation");
    -[CLContextManagerAbsoluteAltimeter forceGPSIfUnderground](self, "forceGPSIfUnderground");
  }
}

- (void)forceGPSIfUnderground
{
  id v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double Current;
  __int128 v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CLPowerAssertion *value;
  NSObject *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  const char *v37;
  uint8_t *v38;
  double v39;
  int v40;
  void *__p[2];
  char v42;
  __int128 v43;
  int v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  int v49;
  __int16 v50;
  double v51;
  int v52;
  _BYTE v53[18];
  uint64_t v54;
  uint64_t v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  int v61;
  __int16 v62;
  double v63;

  v3 = -[CLBarometerCalibrationContextClient latestAbsoluteAltitude](self->super._delegate, "latestAbsoluteAltitude");
  objc_msgSend(v3, "timestamp");
  if (v4 != 1.79769313e308)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v5 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "timestamp");
      v7 = v6;
      objc_msgSend(v3, "altitude");
      *(_DWORD *)buf = 134218240;
      v57 = v7;
      v58 = 2048;
      v59 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "checking if DEM underground, latest alt timestamp %f, latest abs alt %f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v27 = qword_10229FE88;
      objc_msgSend(v3, "timestamp");
      v29 = v28;
      objc_msgSend(v3, "altitude");
      v52 = 134218240;
      *(_QWORD *)v53 = v29;
      *(_WORD *)&v53[8] = 2048;
      *(_QWORD *)&v53[10] = v30;
      LODWORD(v39) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v27, 2, "checking if DEM underground, latest alt timestamp %f, latest abs alt %f", COERCE_DOUBLE(&v52), v39);
      v32 = (uint8_t *)v31;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceGPSIfUnderground]", "%s\n", v31);
      if (v32 != buf)
        free(v32);
    }
    Current = CFAbsoluteTimeGetCurrent();
    sub_100211128((uint64_t)&v52, (_QWORD *)self->super.fDataBuffers);
    v10 = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)&v53[4] + (((unint64_t)(v55 + v54 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (v55 + v54 - 1));
    v43 = v10;
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
    if (*((_QWORD *)&v10 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    v14 = v10;
    if (*(double *)(v10 + 56) > 0.0)
    {
      v15 = *(double *)v10;
      objc_msgSend(v3, "timestamp");
      if (vabdd_f64(v15, v16) < 5.0)
      {
        objc_msgSend(v3, "altitude");
        v17 = *(double *)(v14 + 48);
        if (v18 > v17 + -20.0)
          self->_userUnderground = 0;
        objc_msgSend(v3, "altitude");
        if (v17 - v19 > 20.0 && !self->_userUnderground)
        {
          self->_userUnderground = 1;
          if (*(_DWORD *)(v14 + 100) != 1 && !self->_GPSInProgress)
          {
            value = self->_powerAssertionGPS.__ptr_.__value_;
            sub_1015A2E04(__p, "Altimeter, power assertion GPS underground");
            sub_10002B684((uint64_t)value, (uint64_t *)__p);
            if (v42 < 0)
              operator delete(__p[0]);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_1021887A0);
            v21 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v3, "altitude");
              v22 = *(_QWORD *)(v14 + 48);
              v23 = *(_DWORD *)(v14 + 100);
              *(_DWORD *)buf = 134218752;
              v57 = v24;
              v58 = 2048;
              v59 = v22;
              v60 = 1024;
              v61 = v23;
              v62 = 2048;
              v63 = Current;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "forcing GPS, detected underground, altitude %f, DEM %f, DEM source %d, time, %f", buf, 0x26u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_1021887A0);
              v33 = qword_10229FE88;
              objc_msgSend(v3, "altitude");
              v34 = *(_QWORD *)(v14 + 48);
              v35 = *(_DWORD *)(v14 + 100);
              v44 = 134218752;
              v45 = v36;
              v46 = 2048;
              v47 = v34;
              v48 = 1024;
              v49 = v35;
              v50 = 2048;
              v51 = Current;
              LODWORD(v39) = 38;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v33, 0, "forcing GPS, detected underground, altitude %f, DEM %f, DEM source %d, time, %f", COERCE_DOUBLE(&v44), v39, v40, *(double *)__p);
              v38 = (uint8_t *)v37;
              sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceGPSIfUnderground]", "%s\n", v37);
              if (v38 != buf)
                free(v38);
            }
            objc_msgSend(*((id *)self->_locationControllerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationControllerClient.__ptr_.__value_ + 1), 0, 0);
            self->_lastForcedGPSTime = Current;
            self->_GPSInProgress = 1;
            -[CLContextManagerAbsoluteAltimeter setTimerForGPSOff](self, "setTimerForGPSOff");
            -[CLBarometerCalibrationContextClient announceMostRecentForcedGPS:](self->super._delegate, "announceMostRecentForcedGPS:", self->_lastForcedGPSTime);
          }
        }
      }
    }
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v26 = __ldaxr(p_shared_owners);
      while (__stlxr(v26 - 1, p_shared_owners));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    sub_1006F0FB8(&v52);
  }
}

- (void)calculateAndSendAltitudeFromCompanion
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  CLBarometerCalibrationAbsoluteAltitude *v7;
  double lastAltitudeSentTimestamp;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t currentStatusInfo;
  double v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  uint64_t v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  uint64_t v36;
  const char *v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  double v45;
  uint64_t v46;
  const char *v47;
  uint8_t *v48;
  double v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  double v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  double v79;

  sub_100211128((uint64_t)&v52, (_QWORD *)self->super.fDataBuffers + 24);
  v3 = *(_OWORD *)(*(_QWORD *)(v53 + (((unint64_t)(v55 + v54 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v55 + v54 - 1));
  v50 = v3;
  v51 = v3;
  v4 = *(std::__shared_weak_count **)(*(_QWORD *)(v53 + (((unint64_t)(v55 + v54 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v55 + v54 - 1)
                                    + 8);
  if (*((_QWORD *)&v3 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v3 + 1) + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = objc_opt_new(CLBarometerCalibrationAbsoluteAltitude);
  -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v7, "setTimestamp:", *(double *)v50);
  -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v7, "setAltitude:", *(double *)(v50 + 8));
  -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", *(double *)(v50 + 16));
  -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v7, "setAccuracy:");
  -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v7, "setPrecision:", 100.0);
  -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v7, "setStatusInfo:", 2);
  lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
  -[CLBarometerCalibrationAbsoluteAltitude timestamp](v7, "timestamp");
  if (lastAltitudeSentTimestamp != v9)
  {
    -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:](self->super._delegate, "absoluteAltitudeUpdate:", v7);
    -[CLBarometerCalibrationAbsoluteAltitude timestamp](v7, "timestamp");
    self->_lastAltitudeSentTimestamp = v10;
    self->_currentStatusInfo = 2;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v11 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
    {
      -[CLBarometerCalibrationAbsoluteAltitude altitude](v7, "altitude");
      v13 = v12;
      -[CLBarometerCalibrationAbsoluteAltitude accuracy](v7, "accuracy");
      v15 = v14;
      -[CLBarometerCalibrationAbsoluteAltitude precision](v7, "precision");
      currentStatusInfo = self->_currentStatusInfo;
      v17 = self->_lastAltitudeSentTimestamp;
      *(_DWORD *)buf = 134219264;
      v69 = v13;
      v70 = 2048;
      v71 = v15;
      v72 = 2048;
      v73 = v18;
      v74 = 1024;
      v75 = currentStatusInfo;
      v76 = 1024;
      v77 = 5;
      v78 = 2048;
      v79 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v29 = qword_10229FE88;
      -[CLBarometerCalibrationAbsoluteAltitude altitude](v7, "altitude");
      v31 = v30;
      -[CLBarometerCalibrationAbsoluteAltitude accuracy](v7, "accuracy");
      v33 = v32;
      -[CLBarometerCalibrationAbsoluteAltitude precision](v7, "precision");
      v34 = self->_currentStatusInfo;
      v35 = self->_lastAltitudeSentTimestamp;
      v56 = 134219264;
      v57 = v31;
      v58 = 2048;
      v59 = v33;
      v60 = 2048;
      v61 = v36;
      v62 = 1024;
      v63 = v34;
      v64 = 1024;
      v65 = 5;
      v66 = 2048;
      v67 = v35;
      LODWORD(v49) = 54;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v29, 1, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v56), v49, *(double *)&v50, DWORD2(v50), (_DWORD)v51, *((double *)&v51 + 1));
      v38 = (uint8_t *)v37;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromCompanion]", "%s\n", v37);
      if (v38 != buf)
        free(v38);
    }
    if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v19 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v7, "altitude");
        v21 = v20;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v7, "accuracy");
        v23 = v22;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v7, "precision");
        v24 = self->_currentStatusInfo;
        v25 = self->_lastAltitudeSentTimestamp;
        *(_DWORD *)buf = 134219264;
        v69 = v21;
        v70 = 2048;
        v71 = v23;
        v72 = 2048;
        v73 = v26;
        v74 = 1024;
        v75 = v24;
        v76 = 1024;
        v77 = 5;
        v78 = 2048;
        v79 = v25;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        v39 = qword_10229FE88;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v7, "altitude");
        v41 = v40;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v7, "accuracy");
        v43 = v42;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v7, "precision");
        v44 = self->_currentStatusInfo;
        v45 = self->_lastAltitudeSentTimestamp;
        v56 = 134219264;
        v57 = v41;
        v58 = 2048;
        v59 = v43;
        v60 = 2048;
        v61 = v46;
        v62 = 1024;
        v63 = v44;
        v64 = 1024;
        v65 = 5;
        v66 = 2048;
        v67 = v45;
        LODWORD(v49) = 54;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v39, 0, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v56), v49, *(double *)&v50, DWORD2(v50), (_DWORD)v51, *((double *)&v51 + 1));
        v48 = (uint8_t *)v47;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromCompanion]", "%s\n", v47);
        if (v48 != buf)
          free(v48);
      }
      self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
    }
  }

  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  sub_1006F0FB8(&v52);
}

- (void)calculateAndSendAltitudeFromLocation
{
  __int128 v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  CLBarometerCalibrationAbsoluteAltitude *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  double v30;
  uint64_t v31;
  double lastAltitudeSentTimestamp;
  double v33;
  double v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t currentStatusInfo;
  double v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  double v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  double v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  double v87;
  uint64_t v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  double v101;
  uint64_t v102;
  const char *v103;
  uint8_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  double v111;
  uint64_t v112;
  const char *v113;
  uint8_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  double v121;
  uint64_t v122;
  const char *v123;
  uint8_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  double v131;
  uint64_t v132;
  const char *v133;
  uint8_t *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  double v141;
  uint64_t v142;
  const char *v143;
  uint8_t *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  double v151;
  uint64_t v152;
  const char *v153;
  uint8_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  double v161;
  uint64_t v162;
  const char *v163;
  uint8_t *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  double v171;
  uint64_t v172;
  const char *v173;
  uint8_t *v174;
  double v175;
  __int128 v176;
  double v177;
  double v178;
  __int128 v179;
  __int128 v180;
  _QWORD v181[4];
  uint64_t v182;
  uint64_t v183;
  int v184;
  uint64_t v185;
  __int16 v186;
  uint64_t v187;
  __int16 v188;
  uint64_t v189;
  __int16 v190;
  int v191;
  __int16 v192;
  int v193;
  __int16 v194;
  double v195;
  uint8_t buf[4];
  uint64_t v197;
  __int16 v198;
  uint64_t v199;
  __int16 v200;
  uint64_t v201;
  __int16 v202;
  int v203;
  __int16 v204;
  int v205;
  __int16 v206;
  double v207;

  sub_100211128((uint64_t)v181, (_QWORD *)self->super.fDataBuffers);
  v3 = *(_OWORD *)(*(_QWORD *)(v181[1] + (((unint64_t)(v183 + v182 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v183 + v182 - 1));
  v180 = v3;
  v176 = v3;
  if (*((_QWORD *)&v3 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v3 + 1) + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    v179 = v3;
    do
      v6 = __ldxr(v4);
    while (__stxr(v6 + 1, v4));
  }
  else
  {
    v179 = (unint64_t)v3;
  }
  v177 = -1.0;
  v178 = 1.79769313e308;
  +[CLBarometerCalibrationBiasEstimator getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:](CLBarometerCalibrationBiasEstimator, "getLocationSampleAltitudeAndUncertainty:andRefAltitude:andRefUncertainty:", &v179, &v178, &v177);
  v7 = -[CLBarometerCalibrationContextClient inOutdoorWorkout](self->super._delegate, "inOutdoorWorkout");
  v8 = *(_DWORD *)(v176 + 100);
  if (!v7)
  {
    if (v8 == 1)
    {
      if (*(double *)(v176 + 56) <= 0.0 || vabdd_f64(*(double *)(v176 + 24), *(double *)(v176 + 48)) > 10.0)
        goto LABEL_87;
      v12 = objc_opt_new(CLBarometerCalibrationAbsoluteAltitude);
      -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v12, "setTimestamp:", *(double *)v176);
      -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v12, "setAltitude:", *(double *)(v176 + 48));
      -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", vabdd_f64(*(double *)(v176 + 24), *(double *)(v176 + 48)));
      -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v12, "setAccuracy:");
      -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v12, "setPrecision:", 5.0);
      -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v12, "setStatusInfo:", 2);
      lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
      -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
      if (lastAltitudeSentTimestamp != v33)
      {
        -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:](self->super._delegate, "absoluteAltitudeUpdate:", v12);
        -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
        self->_lastAltitudeSentTimestamp = v34;
        self->_currentStatusInfo = 2;
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        v35 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
        {
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
          v37 = v36;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
          v39 = v38;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
          currentStatusInfo = self->_currentStatusInfo;
          v41 = self->_lastAltitudeSentTimestamp;
          *(_DWORD *)buf = 134219264;
          v197 = v37;
          v198 = 2048;
          v199 = v39;
          v200 = 2048;
          v201 = v42;
          v202 = 1024;
          v203 = currentStatusInfo;
          v204 = 1024;
          v205 = 2;
          v206 = 2048;
          v207 = v41;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021887A0);
          v135 = qword_10229FE88;
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
          v137 = v136;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
          v139 = v138;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
          v140 = self->_currentStatusInfo;
          v141 = self->_lastAltitudeSentTimestamp;
          v184 = 134219264;
          v185 = v137;
          v186 = 2048;
          v187 = v139;
          v188 = 2048;
          v189 = v142;
          v190 = 1024;
          v191 = v140;
          v192 = 1024;
          v193 = 2;
          v194 = 2048;
          v195 = v141;
          LODWORD(v175) = 54;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v135, 1, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v184), v175, *(double *)&v176, DWORD2(v176), LODWORD(v177), v178);
          v144 = (uint8_t *)v143;
          sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v143);
          if (v144 != buf)
            free(v144);
        }
        if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
        {
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021887A0);
          v43 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
          {
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            v45 = v44;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            v47 = v46;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            v48 = self->_currentStatusInfo;
            v49 = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219264;
            v197 = v45;
            v198 = 2048;
            v199 = v47;
            v200 = 2048;
            v201 = v50;
            v202 = 1024;
            v203 = v48;
            v204 = 1024;
            v205 = 2;
            v206 = 2048;
            v207 = v49;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_1021887A0);
            v165 = qword_10229FE88;
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            v167 = v166;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            v169 = v168;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            v170 = self->_currentStatusInfo;
            v171 = self->_lastAltitudeSentTimestamp;
            v184 = 134219264;
            v185 = v167;
            v186 = 2048;
            v187 = v169;
            v188 = 2048;
            v189 = v172;
            v190 = 1024;
            v191 = v170;
            v192 = 1024;
            v193 = 2;
            v194 = 2048;
            v195 = v171;
            LODWORD(v175) = 54;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v165, 0, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v184), v175, *(double *)&v176, DWORD2(v176), LODWORD(v177), v178);
            v174 = (uint8_t *)v173;
            sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v173);
            if (v174 != buf)
              free(v174);
          }
          self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
        }
      }
    }
    else
    {
      if (v8 != 11 && v8 != 4)
        goto LABEL_87;
      if (*(double *)(v176 + 56) > 0.0 && v177 > 0.0 && vabdd_f64(v178, *(double *)(v176 + 48)) <= 10.0)
      {
        v12 = objc_opt_new(CLBarometerCalibrationAbsoluteAltitude);
        -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v12, "setTimestamp:", *(double *)v176);
        -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v12, "setAltitude:", *(double *)(v176 + 48));
        -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", vabdd_f64(*(double *)(v176 + 24), *(double *)(v176 + 48)));
        -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v12, "setAccuracy:");
        -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v12, "setPrecision:", 5.0);
        -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v12, "setStatusInfo:", 2);
        v51 = self->_lastAltitudeSentTimestamp;
        -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
        if (v51 != v52)
        {
          -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:](self->super._delegate, "absoluteAltitudeUpdate:", v12);
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
          self->_lastAltitudeSentTimestamp = v53;
          self->_currentStatusInfo = 2;
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021887A0);
          v54 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
          {
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            v56 = v55;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            v58 = v57;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            v59 = self->_currentStatusInfo;
            v60 = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219264;
            v197 = v56;
            v198 = 2048;
            v199 = v58;
            v200 = 2048;
            v201 = v61;
            v202 = 1024;
            v203 = v59;
            v204 = 1024;
            v205 = 3;
            v206 = 2048;
            v207 = v60;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_1021887A0);
            v105 = qword_10229FE88;
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            v107 = v106;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            v109 = v108;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            v110 = self->_currentStatusInfo;
            v111 = self->_lastAltitudeSentTimestamp;
            v184 = 134219264;
            v185 = v107;
            v186 = 2048;
            v187 = v109;
            v188 = 2048;
            v189 = v112;
            v190 = 1024;
            v191 = v110;
            v192 = 1024;
            v193 = 3;
            v194 = 2048;
            v195 = v111;
            LODWORD(v175) = 54;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v105, 1, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v184), v175, *(double *)&v176, DWORD2(v176), LODWORD(v177), v178);
            v114 = (uint8_t *)v113;
            sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v113);
            if (v114 != buf)
              free(v114);
          }
          if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
          {
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_1021887A0);
            v62 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
            {
              -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
              v64 = v63;
              -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
              v66 = v65;
              -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
              v67 = self->_currentStatusInfo;
              v68 = self->_lastAltitudeSentTimestamp;
              *(_DWORD *)buf = 134219264;
              v197 = v64;
              v198 = 2048;
              v199 = v66;
              v200 = 2048;
              v201 = v69;
              v202 = 1024;
              v203 = v67;
              v204 = 1024;
              v205 = 3;
              v206 = 2048;
              v207 = v68;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_1021887A0);
              v145 = qword_10229FE88;
              -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
              v147 = v146;
              -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
              v149 = v148;
              -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
              v150 = self->_currentStatusInfo;
              v151 = self->_lastAltitudeSentTimestamp;
              v184 = 134219264;
              v185 = v147;
              v186 = 2048;
              v187 = v149;
              v188 = 2048;
              v189 = v152;
              v190 = 1024;
              v191 = v150;
              v192 = 1024;
              v193 = 3;
              v194 = 2048;
              v195 = v151;
              LODWORD(v175) = 54;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v145, 0, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v184), v175, *(double *)&v176, DWORD2(v176), LODWORD(v177), v178);
              v154 = (uint8_t *)v153;
              sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v153);
              if (v154 != buf)
                free(v154);
            }
            self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
          }
        }
      }
      else
      {
        if (v177 <= 0.0)
          goto LABEL_87;
        v12 = objc_opt_new(CLBarometerCalibrationAbsoluteAltitude);
        -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v12, "setTimestamp:", *(double *)v176);
        -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v12, "setAltitude:", *(double *)(v176 + 24));
        -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", *(double *)(v176 + 40));
        -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v12, "setAccuracy:");
        -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v12, "setPrecision:", 5.0);
        -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v12, "setStatusInfo:", 2);
        v13 = self->_lastAltitudeSentTimestamp;
        -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
        if (v13 != v14)
        {
          -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:](self->super._delegate, "absoluteAltitudeUpdate:", v12);
          -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
          self->_lastAltitudeSentTimestamp = v15;
          self->_currentStatusInfo = 2;
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021887A0);
          v16 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
          {
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            v18 = v17;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            v20 = v19;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            v21 = self->_currentStatusInfo;
            v22 = self->_lastAltitudeSentTimestamp;
            *(_DWORD *)buf = 134219264;
            v197 = v18;
            v198 = 2048;
            v199 = v20;
            v200 = 2048;
            v201 = v23;
            v202 = 1024;
            v203 = v21;
            v204 = 1024;
            v205 = 4;
            v206 = 2048;
            v207 = v22;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_1021887A0);
            v95 = qword_10229FE88;
            -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
            v97 = v96;
            -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
            v99 = v98;
            -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
            v100 = self->_currentStatusInfo;
            v101 = self->_lastAltitudeSentTimestamp;
            v184 = 134219264;
            v185 = v97;
            v186 = 2048;
            v187 = v99;
            v188 = 2048;
            v189 = v102;
            v190 = 1024;
            v191 = v100;
            v192 = 1024;
            v193 = 4;
            v194 = 2048;
            v195 = v101;
            LODWORD(v175) = 54;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v95, 1, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v184), v175, *(double *)&v176, DWORD2(v176), LODWORD(v177), v178);
            v104 = (uint8_t *)v103;
            sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v103);
            if (v104 != buf)
              free(v104);
          }
          if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
          {
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_1021887A0);
            v24 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
            {
              -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
              v26 = v25;
              -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
              v28 = v27;
              -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
              v29 = self->_currentStatusInfo;
              v30 = self->_lastAltitudeSentTimestamp;
              *(_DWORD *)buf = 134219264;
              v197 = v26;
              v198 = 2048;
              v199 = v28;
              v200 = 2048;
              v201 = v31;
              v202 = 1024;
              v203 = v29;
              v204 = 1024;
              v205 = 4;
              v206 = 2048;
              v207 = v30;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_1021887A0);
              v125 = qword_10229FE88;
              -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
              v127 = v126;
              -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
              v129 = v128;
              -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
              v130 = self->_currentStatusInfo;
              v131 = self->_lastAltitudeSentTimestamp;
              v184 = 134219264;
              v185 = v127;
              v186 = 2048;
              v187 = v129;
              v188 = 2048;
              v189 = v132;
              v190 = 1024;
              v191 = v130;
              v192 = 1024;
              v193 = 4;
              v194 = 2048;
              v195 = v131;
              LODWORD(v175) = 54;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v125, 0, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v184), v175, *(double *)&v176, DWORD2(v176), LODWORD(v177), v178);
              v134 = (uint8_t *)v133;
              sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v133);
              if (v134 != buf)
                free(v134);
            }
            self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
          }
        }
      }
    }
LABEL_86:

    goto LABEL_87;
  }
  if (v8 == 1 && *(double *)(v176 + 56) > 0.0 && v177 > 0.0 && vabdd_f64(v178, *(double *)(v176 + 48)) <= 10.0)
  {
    v12 = objc_opt_new(CLBarometerCalibrationAbsoluteAltitude);
    -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v12, "setTimestamp:", *(double *)v176);
    -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v12, "setAltitude:", *(double *)(v176 + 48));
    -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", vabdd_f64(*(double *)(v176 + 24), *(double *)(v176 + 48)));
    -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v12, "setAccuracy:");
    -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v12, "setPrecision:", 5.0);
    -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v12, "setStatusInfo:", 2);
    v70 = self->_lastAltitudeSentTimestamp;
    -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
    if (v70 != v71)
    {
      -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:](self->super._delegate, "absoluteAltitudeUpdate:", v12);
      -[CLBarometerCalibrationAbsoluteAltitude timestamp](v12, "timestamp");
      self->_lastAltitudeSentTimestamp = v72;
      self->_currentStatusInfo = 2;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v73 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
      {
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
        v75 = v74;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
        v77 = v76;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
        v78 = self->_currentStatusInfo;
        v79 = self->_lastAltitudeSentTimestamp;
        *(_DWORD *)buf = 134219264;
        v197 = v75;
        v198 = 2048;
        v199 = v77;
        v200 = 2048;
        v201 = v80;
        v202 = 1024;
        v203 = v78;
        v204 = 1024;
        v205 = 1;
        v206 = 2048;
        v207 = v79;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        v115 = qword_10229FE88;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
        v117 = v116;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
        v119 = v118;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
        v120 = self->_currentStatusInfo;
        v121 = self->_lastAltitudeSentTimestamp;
        v184 = 134219264;
        v185 = v117;
        v186 = 2048;
        v187 = v119;
        v188 = 2048;
        v189 = v122;
        v190 = 1024;
        v191 = v120;
        v192 = 1024;
        v193 = 1;
        v194 = 2048;
        v195 = v121;
        LODWORD(v175) = 54;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v115, 1, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v184), v175, *(double *)&v176, DWORD2(v176), LODWORD(v177), v178);
        v124 = (uint8_t *)v123;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v123);
        if (v124 != buf)
          free(v124);
      }
      if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        v81 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
          v83 = v82;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
          v85 = v84;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
          v86 = self->_currentStatusInfo;
          v87 = self->_lastAltitudeSentTimestamp;
          *(_DWORD *)buf = 134219264;
          v197 = v83;
          v198 = 2048;
          v199 = v85;
          v200 = 2048;
          v201 = v88;
          v202 = 1024;
          v203 = v86;
          v204 = 1024;
          v205 = 1;
          v206 = 2048;
          v207 = v87;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", buf, 0x36u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021887A0);
          v155 = qword_10229FE88;
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v12, "altitude");
          v157 = v156;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v12, "accuracy");
          v159 = v158;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v12, "precision");
          v160 = self->_currentStatusInfo;
          v161 = self->_lastAltitudeSentTimestamp;
          v184 = 134219264;
          v185 = v157;
          v186 = 2048;
          v187 = v159;
          v188 = 2048;
          v189 = v162;
          v190 = 1024;
          v191 = v160;
          v192 = 1024;
          v193 = 1;
          v194 = 2048;
          v195 = v161;
          LODWORD(v175) = 54;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v155, 0, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp %f", COERCE_DOUBLE(&v184), v175, *(double *)&v176, DWORD2(v176), LODWORD(v177), v178);
          v164 = (uint8_t *)v163;
          sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v163);
          if (v164 != buf)
            free(v164);
        }
        self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
      }
    }
    goto LABEL_86;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021887A0);
  v9 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GPS too far from DEM, not updating altitude", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    LOWORD(v184) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "GPS too far from DEM, not updating altitude", &v184, 2);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromLocation]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
LABEL_87:
  v89 = (std::__shared_weak_count *)*((_QWORD *)&v179 + 1);
  if (*((_QWORD *)&v179 + 1))
  {
    v90 = (unint64_t *)(*((_QWORD *)&v179 + 1) + 8);
    do
      v91 = __ldaxr(v90);
    while (__stlxr(v91 - 1, v90));
    if (!v91)
    {
      ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
      std::__shared_weak_count::__release_weak(v89);
    }
  }
  v92 = (std::__shared_weak_count *)*((_QWORD *)&v180 + 1);
  if (*((_QWORD *)&v180 + 1))
  {
    v93 = (unint64_t *)(*((_QWORD *)&v180 + 1) + 8);
    do
      v94 = __ldaxr(v93);
    while (__stlxr(v94 - 1, v93));
    if (!v94)
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
    }
  }
  sub_1006F0FB8(v181);
}

- (BOOL)shouldEnableWifiAtTime:(double)a3
{
  return vabdd_f64(a3, self->_lastForcedWifiTime) > 900.0 && !self->_GPSInProgress && !self->_wifiInProgress;
}

- (BOOL)shouldEnableGPSAtTime:(double)a3
{
  return vabdd_f64(a3, self->_lastForcedGPSTime) > 1860.0 && !self->_GPSInProgress && !self->_wifiInProgress;
}

- (void)setTimerForWifiOff
{
  -[CLTimer setNextFireDelay:](self->_forceWifiTimer, "setNextFireDelay:", 10.0);
}

- (void)setTimerForGPSOff
{
  -[CLTimer setNextFireDelay:](self->_forceGPSTimer, "setNextFireDelay:", 30.0);
}

- (void)forceLocationAtTime:(double)a3
{
  CLPowerAssertion *value;
  NSObject *v6;
  CLPowerAssertion *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 isCompanionConnected;
  _BOOL4 doesCompanionHavePressureSensor;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  const char *v18;
  uint8_t *v19;
  void *v20[2];
  char v21;
  void *__p[2];
  char v23;
  int v24;
  _BYTE v25[10];
  uint8_t buf[4];
  _QWORD v27[204];

  if (self->_isCompanionConnected && self->_doesCompanionHavePressureSensor && !self->_currentWetState)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v9 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      isCompanionConnected = self->_isCompanionConnected;
      doesCompanionHavePressureSensor = self->_doesCompanionHavePressureSensor;
      *(_DWORD *)buf = 67109376;
      LODWORD(v27[0]) = isCompanionConnected;
      WORD2(v27[0]) = 1024;
      *(_DWORD *)((char *)v27 + 6) = doesCompanionHavePressureSensor;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "will not force Wifi/GPS, phone connected %d, phone has pressure %d, and sensor is dry", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v16 = self->_isCompanionConnected;
      v17 = self->_doesCompanionHavePressureSensor;
      v24 = 67109376;
      *(_DWORD *)v25 = v16;
      *(_WORD *)&v25[4] = 1024;
      *(_DWORD *)&v25[6] = v17;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "will not force Wifi/GPS, phone connected %d, phone has pressure %d, and sensor is dry", &v24, 14);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
  }
  else if (-[CLContextManagerAbsoluteAltimeter shouldEnableWifiAtTime:](self, "shouldEnableWifiAtTime:", a3))
  {
    value = self->_powerAssertionWifi.__ptr_.__value_;
    sub_1015A2E04(__p, "Altimeter, power assertion Wifi");
    sub_10002B684((uint64_t)value, (uint64_t *)__p);
    if (v23 < 0)
      operator delete(__p[0]);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v6 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v27 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "subscribing to Wifi notifications %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v24 = 134217984;
      *(double *)v25 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "subscribing to Wifi notifications %f", COERCE_DOUBLE(&v24));
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    objc_msgSend(*((id *)self->_locationControllerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationControllerClient.__ptr_.__value_ + 1), 1, 0);
    self->_lastForcedWifiTime = a3;
    self->_wifiInProgress = 1;
    -[CLContextManagerAbsoluteAltimeter setTimerForWifiOff](self, "setTimerForWifiOff");
  }
  else if (-[CLContextManagerAbsoluteAltimeter shouldEnableGPSAtTime:](self, "shouldEnableGPSAtTime:", a3))
  {
    v7 = self->_powerAssertionGPS.__ptr_.__value_;
    sub_1015A2E04(v20, "Altimeter, power assertion GPS");
    sub_10002B684((uint64_t)v7, (uint64_t *)v20);
    if (v21 < 0)
      operator delete(v20[0]);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v8 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v27 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "subscribing to GPS notifications %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v24 = 134217984;
      *(double *)v25 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "subscribing to GPS notifications %f", COERCE_DOUBLE(&v24));
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter forceLocationAtTime:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    objc_msgSend(*((id *)self->_locationControllerClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationControllerClient.__ptr_.__value_ + 1), 0, 0);
    self->_lastForcedGPSTime = a3;
    self->_GPSInProgress = 1;
    -[CLContextManagerAbsoluteAltimeter setTimerForGPSOff](self, "setTimerForGPSOff");
    -[CLBarometerCalibrationContextClient announceMostRecentForcedGPS:](self->super._delegate, "announceMostRecentForcedGPS:", self->_lastForcedGPSTime);
  }
}

- (double)capAccuracy:(double)result
{
  if (result > 500.0)
    return 500.0;
  return result;
}

- (void)filteredElevation:(double *)a3 absAltUncertainty:(double *)a4 withTimestamp:(double *)a5
{
  __int128 v9;
  unint64_t *v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  double v27;
  double v28;
  double v29;
  float v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  double *v34;
  double *v35;
  NSObject *v36;
  double v37;
  double v38;
  double v39;
  unint64_t *v40;
  unint64_t v41;
  const char *v42;
  char *v43;
  const char *v44;
  char *v45;
  double v46;
  double *v47;
  double *v48;
  std::__shared_weak_count *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  int v55;
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  _BYTE buf[22];
  __int16 v62;
  double v63;

  *a3 = 1.79769313e308;
  *a5 = 1.79769313e308;
  *a4 = 1.79769313e308;
  sub_100211128((uint64_t)&v50, (_QWORD *)self->super.fDataBuffers + 30);
  v9 = *(_OWORD *)(*(_QWORD *)(v51 + (((v54 + v53 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v54 + v53 - 1));
  v49 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = *(double *)(v9 + 16);
  v13 = *(double *)(v9 + 24);
  v14 = *(double *)v9;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021887A0);
  v15 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "latest KF,pressure,%f,absAltUnc,%f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v55 = 134218240;
    v56 = v12;
    v57 = 2048;
    v58 = v13;
    LODWORD(v46) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "latest KF,pressure,%f,absAltUnc,%f", COERCE_DOUBLE(&v55), v46);
    v43 = (char *)v42;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter filteredElevation:absAltUncertainty:withTimestamp:]", "%s\n", v42);
    if (v43 != buf)
      free(v43);
  }
  if (v12 * 1000.0 >= 100.0 && v52 != v51)
  {
    v16 = (_QWORD *)(v51 + 8 * (v53 >> 8));
    v17 = *v16 + 16 * v53;
    v18 = *(_QWORD *)(v51 + (((v54 + v53) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v54 + v53);
    if (v17 != v18)
    {
      v48 = a4;
      v19 = 0;
      v20 = 0.0;
      v21 = 0.0;
      v22 = 0.0;
      do
      {
        v23 = *(double **)v17;
        v24 = *(std::__shared_weak_count **)(v17 + 8);
        *(_QWORD *)buf = *(_QWORD *)v17;
        *(_QWORD *)&buf[8] = v24;
        if (v24)
        {
          p_shared_owners = (unint64_t *)&v24->__shared_owners_;
          do
            v26 = __ldxr(p_shared_owners);
          while (__stxr(v26 + 1, p_shared_owners));
        }
        v27 = v23[2] * 1000.0;
        if (v27 > 100.0)
        {
          v28 = *v23;
          if (*v23 >= v14 + -1.0)
          {
            if (self->_useAOPAltimeter)
            {
              v29 = v23[1];
            }
            else
            {
              v30 = v27;
              v29 = sub_10024806C(v30, 101320.0);
              v28 = *v23;
            }
            v20 = v20 + v29;
            v22 = v22 + v28;
            v21 = v21 + v23[3];
            ++v19;
          }
        }
        if (v24)
        {
          v31 = (unint64_t *)&v24->__shared_owners_;
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
        }
        v17 += 16;
        if (v17 - *v16 == 4096)
        {
          v33 = v16[1];
          ++v16;
          v17 = v33;
        }
      }
      while (v17 != v18);
      v35 = a5;
      v34 = v48;
      if (v19 >= 1 && v20 < 3.40282347e38)
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        v36 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          *(double *)&buf[4] = v20 / (double)v19;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v22 / (double)v19;
          v62 = 2048;
          v63 = v21 / (double)v19;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "average KF,elevation,%f,averageTimestamp,%f,aveAbsAltUnc,%f", buf, 0x20u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021887A0);
          v37 = v20 / (double)v19;
          v38 = v22 / (double)v19;
          v55 = 134218496;
          v56 = v37;
          v57 = 2048;
          v58 = v38;
          v39 = v21 / (double)v19;
          v59 = 2048;
          v60 = v39;
          LODWORD(v46) = 32;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "average KF,elevation,%f,averageTimestamp,%f,aveAbsAltUnc,%f", COERCE_DOUBLE(&v55), v46, *(double *)&a5);
          v45 = (char *)v44;
          sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter filteredElevation:absAltUncertainty:withTimestamp:]", "%s\n", v44);
          if (v45 != buf)
            free(v45);
          v35 = v47;
          v34 = v48;
        }
        else
        {
          v37 = v20 / (double)v19;
          v38 = v22 / (double)v19;
          v39 = v21 / (double)v19;
        }
        *a3 = v37;
        *v35 = v38;
        *v34 = v39;
      }
    }
  }
  if (v49)
  {
    v40 = (unint64_t *)&v49->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  sub_1006F0FB8(&v50);
}

- (void)wetStateUpdated:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  _DWORD v11[4];
  uint8_t buf[4];
  int v13;

  if (self->_currentWetState != a3)
  {
    self->_currentWetState = a3;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v5 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "absolute altimeter wet state updated to %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v11[0] = 67109120;
      v11[1] = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "absolute altimeter wet state updated to %d", v11);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter wetStateUpdated:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    if (a3 == 1)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v6 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "absolute altimeter: watch wet, forcing location", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        LOWORD(v11[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "absolute altimeter: watch wet, forcing location", v11, 2);
        v10 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter wetStateUpdated:]", "%s\n", v9);
        if (v10 != buf)
          free(v10);
      }
      self->_lastForcedWifiTime = 1.79769313e308;
      self->_lastForcedGPSTime = 1.79769313e308;
      -[CLContextManagerAbsoluteAltimeter forceLocationAtTime:](self, "forceLocationAtTime:", CFAbsoluteTimeGetCurrent());
    }
  }
}

- (void)calculateAndSendAltitudeFromBaro
{
  double Current;
  id v4;
  double v5;
  NSObject *v6;
  double v7;
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  double v12;
  double *v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CLBarometerCalibrationAbsoluteAltitude *v24;
  double v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  double v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint8_t *v32;
  double lastAltitudeSentTimestamp;
  double v34;
  char v35;
  char v36;
  double v37;
  NSObject *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  NSObject *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  NSObject *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  unint64_t *p_shared_owners;
  unint64_t v68;
  uint64_t v69;
  double v70;
  const char *v71;
  uint8_t *v72;
  uint64_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  const char *v82;
  uint8_t *v83;
  uint64_t v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  double v92;
  uint64_t v93;
  const char *v94;
  uint8_t *v95;
  uint64_t v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  uint64_t v103;
  double v104;
  uint64_t v105;
  const char *v106;
  uint8_t *v107;
  double v108;
  double v109;
  uint64_t v110;
  double v111;
  __int128 v112;
  double v113;
  _QWORD v114[4];
  uint64_t v115;
  uint64_t v116;
  double v117;
  double v118;
  double v119;
  int v120;
  double v121;
  __int16 v122;
  double v123;
  __int16 v124;
  double v125;
  __int16 v126;
  _BYTE v127[10];
  __int16 v128;
  double v129;
  __int16 v130;
  uint64_t v131;
  uint8_t buf[4];
  double v133;
  __int16 v134;
  double v135;
  __int16 v136;
  double v137;
  __int16 v138;
  _BYTE v139[10];
  __int16 v140;
  double v141;
  __int16 v142;
  uint64_t v143;

  Current = CFAbsoluteTimeGetCurrent();
  v4 = -[CLBarometerCalibrationContextClient copyCurrentBias](self->super._delegate, "copyCurrentBias");
  objc_msgSend(v4, "timestamp");
  if (vabdd_f64(Current, v5) > 900.0)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v6 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "timestamp");
      *(_DWORD *)buf = 134217984;
      v133 = vabdd_f64(Current, v7);
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "bias age is %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v69 = qword_10229FE88;
      objc_msgSend(v4, "timestamp");
      v120 = 134217984;
      v121 = vabdd_f64(Current, v70);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v69, 2, "bias age is %f", COERCE_DOUBLE(&v120));
      v72 = (uint8_t *)v71;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v71);
      if (v72 != buf)
        free(v72);
    }
    -[CLContextManagerAbsoluteAltimeter forceLocationAtTime:](self, "forceLocationAtTime:", Current);
  }
  v118 = 0.0;
  v119 = 0.0;
  v117 = 0.0;
  -[CLContextManagerAbsoluteAltimeter filteredElevation:absAltUncertainty:withTimestamp:](self, "filteredElevation:absAltUncertainty:withTimestamp:", &v119, &v118, &v117);
  sub_100211128((uint64_t)v114, (_QWORD *)self->super.fDataBuffers + 6);
  v8 = *(_OWORD *)(*(_QWORD *)(v114[1] + (((unint64_t)(v116 + v115 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v116 + v115 - 1));
  v112 = v8;
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = v119;
  if (v119 == 1.79769313e308)
  {
    v13 = (double *)v8;
    v14 = *(double *)(v8 + 8) * 1000.0;
    v15 = sub_10024806C(v14, 101320.0);
    objc_msgSend(v4, "biasInMeters");
    v17 = v16;
    objc_msgSend(v4, "weatherEstimateInMeter");
    v119 = v17 + v15 - v18;
    v117 = *v13;
  }
  else
  {
    v19 = 0.0;
    v20 = v119;
    if (!self->_useAOPAltimeter)
    {
      objc_msgSend(v4, "biasInMeters", 0.0, v119);
      v22 = v21;
      objc_msgSend(v4, "weatherEstimateInMeter");
      v19 = v22 - v23;
      v20 = v119;
    }
    v119 = v19 + v20;
  }
  v24 = objc_opt_new(CLBarometerCalibrationAbsoluteAltitude);
  -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", v118);
  v111 = v25;
  if (-[CLBarometerCalibrationContextClient inOutdoorWorkout](self->super._delegate, "inOutdoorWorkout"))
    -[CLContextManagerAbsoluteAltimeter chooseUncertaintyDuringWorkout:withAltitude:atTime:](self, "chooseUncertaintyDuringWorkout:withAltitude:atTime:", &v111, v119, v117);
  v26 = -[CLBarometerCalibrationContextClient isInVisit](self->super._delegate, "isInVisit");
  if (v111 > 25.0)
    v27 = v26;
  else
    v27 = 0;
  if ((v27 & 1) != 0 || v111 == 500.0)
  {
    self->_uncalibratedState = 1;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v30 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v133 = v119;
      v134 = 2048;
      v135 = v111;
      v136 = 2048;
      v137 = v117;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "switch to wet behavior due to large uncertainty,alt2,%f,alt2Unc,%f,timestamp,%f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v120 = 134218496;
      v121 = v119;
      v122 = 2048;
      v123 = v111;
      v124 = 2048;
      v125 = v117;
      LODWORD(v108) = 32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "switch to wet behavior due to large uncertainty,alt2,%f,alt2Unc,%f,timestamp,%f", COERCE_DOUBLE(&v120), v108, v109);
      v32 = (uint8_t *)v31;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v31);
      if (v32 != buf)
        free(v32);
    }
  }
  else
  {
    self->_uncalibratedState = 0;
    -[CLBarometerCalibrationAbsoluteAltitude setTimestamp:](v24, "setTimestamp:", v117);
    -[CLBarometerCalibrationAbsoluteAltitude setAltitude:](v24, "setAltitude:", v119);
    -[CLBarometerCalibrationAbsoluteAltitude setAccuracy:](v24, "setAccuracy:", v111);
    -[CLBarometerCalibrationAbsoluteAltitude setPrecision:](v24, "setPrecision:", 0.5);
    objc_msgSend(v4, "timestamp");
    if (v28 == 1.79769313e308)
      v29 = 1;
    else
      v29 = (uint64_t)objc_msgSend(v4, "statusInfo");
    -[CLBarometerCalibrationAbsoluteAltitude setStatusInfo:](v24, "setStatusInfo:", v29);
    lastAltitudeSentTimestamp = self->_lastAltitudeSentTimestamp;
    -[CLBarometerCalibrationAbsoluteAltitude timestamp](v24, "timestamp");
    if (lastAltitudeSentTimestamp != v34)
    {
      sub_100197040();
      v35 = sub_100195F08();
      if (v12 == 1.79769313e308)
        v36 = v35;
      else
        v36 = 0;
      if ((v36 & 1) == 0)
        -[CLBarometerCalibrationContextClient absoluteAltitudeUpdate:](self->super._delegate, "absoluteAltitudeUpdate:", v24);
      -[CLBarometerCalibrationAbsoluteAltitude timestamp](v24, "timestamp");
      self->_lastAltitudeSentTimestamp = v37;
      v110 = 144;
      self->_currentStatusInfo = -[CLBarometerCalibrationAbsoluteAltitude statusInfo](v24, "statusInfo");
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v38 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
      {
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        v40 = v39;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        v42 = v41;
        objc_msgSend(v4, "weatherEstimateInMeter");
        v44 = v43;
        objc_msgSend(v4, "weatherEstimateInMeter");
        v45 = self->_lastAltitudeSentTimestamp;
        *(_DWORD *)buf = 134218752;
        v133 = v40;
        v134 = 2048;
        v135 = v42 + v44;
        v136 = 2048;
        v137 = v46;
        v138 = 2048;
        *(double *)v139 = v45;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "absolute altitude corrected %f, absolute altitude before correction %f, weather %f, timestamp %f", buf, 0x2Au);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        v73 = qword_10229FE88;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        v75 = v74;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        v77 = v76;
        objc_msgSend(v4, "weatherEstimateInMeter");
        v79 = v78;
        objc_msgSend(v4, "weatherEstimateInMeter");
        v80 = self->_lastAltitudeSentTimestamp;
        v120 = 134218752;
        v121 = v75;
        v122 = 2048;
        v123 = v77 + v79;
        v124 = 2048;
        v125 = v81;
        v126 = 2048;
        *(double *)v127 = v80;
        LODWORD(v108) = 42;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v73, 1, "absolute altitude corrected %f, absolute altitude before correction %f, weather %f, timestamp %f", COERCE_DOUBLE(&v120), v108, COERCE_DOUBLE(144), v111);
        v83 = (uint8_t *)v82;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v82);
        if (v83 != buf)
          free(v83);
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v47 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
      {
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        v49 = v48;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v24, "accuracy");
        v51 = v50;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v24, "precision");
        v53 = v52;
        v54 = *(uint64_t *)((char *)&self->super.super.isa + v110);
        v55 = self->_lastAltitudeSentTimestamp;
        objc_msgSend(v4, "uncertaintyInMeters");
        *(_DWORD *)buf = 134219520;
        v133 = v49;
        v134 = 2048;
        v135 = v51;
        v136 = 2048;
        v137 = v53;
        v138 = 1024;
        *(_DWORD *)v139 = v54;
        *(_WORD *)&v139[4] = 1024;
        *(_DWORD *)&v139[6] = 0;
        v140 = 2048;
        v141 = v55;
        v142 = 2048;
        v143 = v56;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, %f, bias uncertainty, %f", buf, 0x40u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        v84 = qword_10229FE88;
        -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
        v86 = v85;
        -[CLBarometerCalibrationAbsoluteAltitude accuracy](v24, "accuracy");
        v88 = v87;
        -[CLBarometerCalibrationAbsoluteAltitude precision](v24, "precision");
        v90 = v89;
        v91 = *(uint64_t *)((char *)&self->super.super.isa + v110);
        v92 = self->_lastAltitudeSentTimestamp;
        objc_msgSend(v4, "uncertaintyInMeters");
        v120 = 134219520;
        v121 = v86;
        v122 = 2048;
        v123 = v88;
        v124 = 2048;
        v125 = v90;
        v126 = 1024;
        *(_DWORD *)v127 = v91;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = 0;
        v128 = 2048;
        v129 = v92;
        v130 = 2048;
        v131 = v93;
        LODWORD(v108) = 64;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v84, 1, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, %f, bias uncertainty, %f", COERCE_DOUBLE(&v120), v108, *(double *)&v110, LODWORD(v111), (_DWORD)v112, *((double *)&v112 + 1), v113);
        v95 = (uint8_t *)v94;
        sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v94);
        if (v95 != buf)
          free(v95);
      }
      if (vabdd_f64(self->_lastDefaultLevelLogTimestamp, CFAbsoluteTimeGetCurrent()) > 30.0)
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        v57 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
          v59 = v58;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v24, "accuracy");
          v61 = v60;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v24, "precision");
          v63 = v62;
          v64 = *(uint64_t *)((char *)&self->super.super.isa + v110);
          v65 = self->_lastAltitudeSentTimestamp;
          objc_msgSend(v4, "uncertaintyInMeters");
          *(_DWORD *)buf = 134219520;
          v133 = v59;
          v134 = 2048;
          v135 = v61;
          v136 = 2048;
          v137 = v63;
          v138 = 1024;
          *(_DWORD *)v139 = v64;
          *(_WORD *)&v139[4] = 1024;
          *(_DWORD *)&v139[6] = 0;
          v140 = 2048;
          v141 = v65;
          v142 = 2048;
          v143 = v66;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, %f, bias uncertainty, %f", buf, 0x40u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021887A0);
          v96 = qword_10229FE88;
          -[CLBarometerCalibrationAbsoluteAltitude altitude](v24, "altitude");
          v98 = v97;
          -[CLBarometerCalibrationAbsoluteAltitude accuracy](v24, "accuracy");
          v100 = v99;
          -[CLBarometerCalibrationAbsoluteAltitude precision](v24, "precision");
          v102 = v101;
          v103 = *(uint64_t *)((char *)&self->super.super.isa + v110);
          v104 = self->_lastAltitudeSentTimestamp;
          objc_msgSend(v4, "uncertaintyInMeters");
          v120 = 134219520;
          v121 = v98;
          v122 = 2048;
          v123 = v100;
          v124 = 2048;
          v125 = v102;
          v126 = 1024;
          *(_DWORD *)v127 = v103;
          *(_WORD *)&v127[4] = 1024;
          *(_DWORD *)&v127[6] = 0;
          v128 = 2048;
          v129 = v104;
          v130 = 2048;
          v131 = v105;
          LODWORD(v108) = 64;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v96, 0, "absolute altitude sent to clients %f, accuracy %f, precision %f, status %d, altitude source %d, timestamp, %f, bias uncertainty, %f", COERCE_DOUBLE(&v120), v108, *(double *)&v110, LODWORD(v111), (_DWORD)v112, *((double *)&v112 + 1), v113);
          v107 = (uint8_t *)v106;
          sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter calculateAndSendAltitudeFromBaro]", "%s\n", v106);
          if (v107 != buf)
            free(v107);
        }
        self->_lastDefaultLevelLogTimestamp = CFAbsoluteTimeGetCurrent();
      }
    }
  }

  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v68 = __ldaxr(p_shared_owners);
    while (__stlxr(v68 - 1, p_shared_owners));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  sub_1006F0FB8(v114);
}

- (void)chooseUncertaintyDuringWorkout:(double *)a3 withAltitude:(double)a4 atTime:(double)a5
{
  double v9;
  __int128 v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  double v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint8_t *v30;
  double v31;
  __int128 v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  int v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  double v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  double v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  double v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  uint64_t v62;
  uint8_t buf[4];
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  double v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  double v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  double v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  uint64_t v86;

  v9 = *a3;
  if (*a3 > 14.9)
    v9 = 14.9;
  *a3 = v9;
  sub_100211128((uint64_t)&v33, (_QWORD *)self->super.fDataBuffers);
  if (v38 == 0.0)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v24 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v64 = a5;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "in outdoor workout: location buffer empty, pressure timestamp, %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v39 = 134217984;
      v40 = a5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "in outdoor workout: location buffer empty, pressure timestamp, %f", COERCE_DOUBLE(&v39));
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter chooseUncertaintyDuringWorkout:withAltitude:atTime:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
  }
  else
  {
    v10 = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)&v34
                                + (((unint64_t)&v37[*(_QWORD *)&v38 - 1] >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (LOBYTE(v38) + (_BYTE)v37 - 1));
    v32 = v10;
    v11 = *(std::__shared_weak_count **)(*(_QWORD *)(*(_QWORD *)&v34
                                                   + (((unint64_t)&v37[*(_QWORD *)&v38 - 1] >> 5) & 0x7FFFFFFFFFFFFF8))
                                       + 16 * (LOBYTE(v38) + (_BYTE)v37 - 1)
                                       + 8);
    if (*((_QWORD *)&v10 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    v14 = (uint64_t *)v10;
    if (*(double *)(v10 + 56) > 0.0 && *(_DWORD *)(v10 + 100) == 1 && vabdd_f64(a5, *(double *)v10) < 5.0)
    {
      v15 = 24;
      if (*(double *)(v10 + 120) > 0.0)
        v15 = 112;
      v16 = *(double *)(v10 + v15);
      v17 = vabdd_f64(a4, v16);
      if (v17 > 15.0)
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021887A0);
        v18 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          v19 = v14[6];
          v20 = *v14;
          *(_DWORD *)buf = 136317954;
          v64 = COERCE_DOUBLE("discrepancy");
          v65 = 2048;
          v66 = v17;
          v67 = 2080;
          v68 = "gpsAltitude";
          v69 = 2048;
          v70 = v16;
          v71 = 2080;
          v72 = "demAltitude";
          v73 = 2048;
          v74 = v19;
          v75 = 2080;
          v76 = "currentAbsoluteAltitude";
          v77 = 2048;
          v78 = a4;
          v79 = 2080;
          v80 = "pressureTimestamp";
          v81 = 2048;
          v82 = a5;
          v83 = 2080;
          v84 = "gpsTimestamp";
          v85 = 2048;
          v86 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "discrepancy between GPS and altitude in workout,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x7Au);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021887A0);
          v27 = v14[6];
          v28 = *v14;
          v39 = 136317954;
          v40 = COERCE_DOUBLE("discrepancy");
          v41 = 2048;
          v42 = v17;
          v43 = 2080;
          v44 = "gpsAltitude";
          v45 = 2048;
          v46 = v16;
          v47 = 2080;
          v48 = "demAltitude";
          v49 = 2048;
          v50 = v27;
          v51 = 2080;
          v52 = "currentAbsoluteAltitude";
          v53 = 2048;
          v54 = a4;
          v55 = 2080;
          v56 = "pressureTimestamp";
          v57 = 2048;
          v58 = a5;
          v59 = 2080;
          v60 = "gpsTimestamp";
          v61 = 2048;
          v62 = v28;
          LODWORD(v31) = 122;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "discrepancy between GPS and altitude in workout,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v39, v31, (const char *)v32, *((double *)&v32 + 1), v33, v34, v35, v36, v37, v38);
          v30 = (uint8_t *)v29;
          sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter chooseUncertaintyDuringWorkout:withAltitude:atTime:]", "%s\n", v29);
          if (v30 != buf)
            free(v30);
        }
        -[CLContextManagerAbsoluteAltimeter capAccuracy:](self, "capAccuracy:", v17);
        *(_QWORD *)a3 = v21;
      }
    }
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v23 = __ldaxr(p_shared_owners);
      while (__stlxr(v23 - 1, p_shared_owners));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  sub_1006F0FB8(&v33);
}

- (void)onCompanionConnectionNotification:(int)a3 data:(_BYTE *)a4
{
  int v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  const char *v14;
  uint8_t *v15;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;

  if (a3 == 6)
  {
    *(_BYTE *)(a1 + 82) = *a4;
    v5 = a4[16];
    *(_BYTE *)(a1 + 83) = v5;
    v6 = *(void **)(a1 + 16);
    if (v5)
      v7 = *(_BYTE *)(a1 + 82) == 0;
    else
      v7 = 1;
    v8 = !v7;
    objc_msgSend(v6, "updateCompanionConnected:", v8);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021887A0);
    v9 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(unsigned __int8 *)(a1 + 82);
      v11 = *(unsigned __int8 *)(a1 + 83);
      *(_DWORD *)buf = 67109376;
      v20 = v10;
      v21 = 1024;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received phone connection updates, is phone connected %d, does phone have pressure sensor %d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021887A0);
      v12 = *(unsigned __int8 *)(a1 + 82);
      v13 = *(unsigned __int8 *)(a1 + 83);
      v16[0] = 67109376;
      v16[1] = v12;
      v17 = 1024;
      v18 = v13;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "received phone connection updates, is phone connected %d, does phone have pressure sensor %d", v16, 14);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerAbsoluteAltimeter onCompanionConnectionNotification:data:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
  }
}

- (void).cxx_destruct
{
  Client *value;
  CLPowerAssertion *v4;
  CLPowerAssertion *v5;
  Client *v6;

  value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_powerAssertionGPS.__ptr_.__value_;
  self->_powerAssertionGPS.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(CLPowerAssertion *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->_powerAssertionWifi.__ptr_.__value_;
  self->_powerAssertionWifi.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(CLPowerAssertion *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = self->_locationControllerClient.__ptr_.__value_;
  self->_locationControllerClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  return self;
}

@end
