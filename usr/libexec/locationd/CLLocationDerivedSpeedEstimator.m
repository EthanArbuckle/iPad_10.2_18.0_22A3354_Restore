@implementation CLLocationDerivedSpeedEstimator

- (BOOL)_feedLocation:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  unsigned int v10;
  uint64_t v11;
  uint8_t *v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint8_t *v18;
  double v19;
  float v20;
  double v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  unsigned int v25;
  double v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  unsigned int v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  unsigned int v45;
  double v46;
  NSObject *v47;
  unsigned int v48;
  uint64_t v49;
  NSObject *v50;
  double v51;
  NSObject *v52;
  int numConsecutiveVehicularSpeedObservations;
  double lastElapsedTime;
  int v55;
  NSObject *v56;
  unsigned int v57;
  NSObject *v58;
  unsigned int v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unsigned int v63;
  char *v64;
  uint8_t *v65;
  uint64_t v66;
  unsigned int v67;
  id v68;
  char *v69;
  char *v70;
  uint64_t v71;
  unsigned int v72;
  char *v73;
  double v74;
  char *v75;
  uint64_t v76;
  char *v77;
  const char *v79;
  _BYTE v80[28];
  __int16 v81;
  double v82;
  uint8_t buf[4];
  _BYTE v84[38];
  __int16 v85;
  double v86;
  __int16 v87;
  unsigned int v88;

  if (qword_10229FCB0 != -1)
    dispatch_once(&qword_10229FCB0, &stru_102148B58);
  v5 = qword_10229FCB8;
  if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v84 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VEHICULAR: leeched location, %s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v60 = qword_10229FCB8;
    *(_DWORD *)v80 = 136315138;
    *(_QWORD *)&v80[4] = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    v61 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v60, 2, "VEHICULAR: leeched location, %s", v80);
    sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v61);
    if (v61 != (char *)buf)
      free(v61);
  }
  if (objc_msgSend(a3, "type") == 1)
    self->_hintsAvailable |= 2uLL;
  if (objc_msgSend(a3, "type") == 4)
    self->_hintsAvailable |= 8uLL;
  if (objc_msgSend(a3, "type") == 4)
  {
    if (-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc")
      && objc_msgSend(objc_msgSend(objc_msgSend(a3, "timestamp"), "earlierDate:", -[CLLocation timestamp](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "timestamp")), "isEqualToDate:", objc_msgSend(a3, "timestamp")))
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v6 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "VEHICULAR: location timestamp out of order", buf, 2u);
      }
      v7 = sub_1001BFF7C(115, 2);
      if (v7)
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCB0 != -1)
          dispatch_once(&qword_10229FCB0, &stru_102148B58);
        v8 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: location timestamp out of order");
LABEL_29:
        v12 = (uint8_t *)v8;
        sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v8);
        if (v12 != buf)
          free(v12);
        goto LABEL_75;
      }
      return v7;
    }
    objc_msgSend(a3, "horizontalAccuracy");
    if (v13 > 150.0)
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v14 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "horizontalAccuracy");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v84 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "VEHICULAR: disqualified leeched location, horizontal accuracy, %f", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_74;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v16 = qword_10229FCB8;
      objc_msgSend(a3, "horizontalAccuracy");
      v17 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v16, 0, "VEHICULAR: disqualified leeched location, horizontal accuracy, %f");
LABEL_40:
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v17);
      if (v18 == buf)
        goto LABEL_74;
      goto LABEL_52;
    }
    objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceNow");
    *(float *)&v19 = v19;
    v20 = fabsf(*(float *)&v19);
    if (v20 > 180.0)
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v21 = v20;
      v22 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v84 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "VEHICULAR: disqualified leeched location, age, %f", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_74;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v23 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: disqualified leeched location, age, %f");
LABEL_51:
      v18 = (uint8_t *)v23;
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v23);
      if (v18 == buf)
      {
LABEL_74:
        -[CLLocationDerivedSpeedEstimator _invalidateSpeedEstimate](self, "_invalidateSpeedEstimate");
LABEL_75:
        LOBYTE(v7) = 0;
        return v7;
      }
LABEL_52:
      free(v18);
      goto LABEL_74;
    }
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v24 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(a3, "type");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v84 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "VEHICULAR: qualified leeched location, type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v62 = qword_10229FCB8;
      v63 = objc_msgSend(a3, "type");
      *(_DWORD *)v80 = 67109120;
      *(_DWORD *)&v80[4] = v63;
      v64 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v62, 0, "VEHICULAR: qualified leeched location, type, %d", v80);
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v64);
      if (v64 != (char *)buf)
        free(v64);
    }
    if (!-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"))
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v29 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "VEHICULAR: first qualifying location", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_73;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v28 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: first qualifying location");
      goto LABEL_148;
    }
    objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceDate:", -[CLLocation timestamp](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "timestamp"));
    if (v26 > 240.0)
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v27 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v84 = 0x406E000000000000;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "VEHICULAR: renew previous location older than age of %f seconds", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_73;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v28 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: renew previous location older than age of %f seconds");
LABEL_148:
      v65 = (uint8_t *)v28;
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v28);
      if (v65 != buf)
        free(v65);
LABEL_73:
      -[CLLocationDerivedSpeedEstimator setPrevLoc:](self, "setPrevLoc:", a3);
      goto LABEL_74;
    }
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v30 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEBUG))
    {
      v31 = -[CLLocation type](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "type");
      v32 = objc_msgSend(-[CLLocation description](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "description"), "UTF8String");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v84 = v31;
      *(_WORD *)&v84[4] = 2080;
      *(_QWORD *)&v84[6] = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "VEHICULAR: previous location, type, %d, %s", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v66 = qword_10229FCB8;
      v67 = -[CLLocation type](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "type");
      v68 = objc_msgSend(-[CLLocation description](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "description"), "UTF8String");
      *(_DWORD *)v80 = 67109378;
      *(_DWORD *)&v80[4] = v67;
      *(_WORD *)&v80[8] = 2080;
      *(_QWORD *)&v80[10] = v68;
      LODWORD(v79) = 18;
      v69 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v66, 2, "VEHICULAR: previous location, type, %d, %s", v80, v79);
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v69);
      if (v69 != (char *)buf)
        free(v69);
    }
    -[CLLocation distanceFromLocation:](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "distanceFromLocation:", a3);
    v34 = v33;
    -[NSDate timeIntervalSinceDate:](-[CLLocation timestamp](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "timestamp"), "timeIntervalSinceDate:", objc_msgSend(a3, "timestamp"));
    v36 = v35;
    -[CLLocation horizontalAccuracy](-[CLLocationDerivedSpeedEstimator prevLoc](self, "prevLoc"), "horizontalAccuracy");
    v38 = v37 * v37;
    objc_msgSend(a3, "horizontalAccuracy");
    v40 = sqrt(v38 + v39 * v39);
    if (v34 <= v40)
      v41 = 0.0;
    else
      v41 = v34 - v40;
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v42 = fabs(v36);
    v43 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)v84 = v34;
      *(_WORD *)&v84[8] = 2048;
      *(double *)&v84[10] = v42;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "VEHICULAR: distanceMoved, %f, elapsedTime, %f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      *(_DWORD *)v80 = 134218240;
      *(double *)&v80[4] = v34;
      *(_WORD *)&v80[12] = 2048;
      *(double *)&v80[14] = v42;
      LODWORD(v79) = 22;
      v70 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 2, "VEHICULAR: distanceMoved, %f, elapsedTime, %f", COERCE_DOUBLE(v80), *(double *)&v79);
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v70);
      if (v70 != (char *)buf)
        free(v70);
    }
    if (v42 <= 60.0)
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v50 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v84 = 0x404E000000000000;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "VEHICULAR: drop leeched location within %f sec", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_74;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v23 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: drop leeched location within %f sec");
      goto LABEL_51;
    }
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v44 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(a3, "type");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v84 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "VEHICULAR: accept qualified leeched location, type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v71 = qword_10229FCB8;
      v72 = objc_msgSend(a3, "type");
      *(_DWORD *)v80 = 67109120;
      *(_DWORD *)&v80[4] = v72;
      v73 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v71, 0, "VEHICULAR: accept qualified leeched location, type, %d", v80);
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v73);
      if (v73 != (char *)buf)
        free(v73);
    }
    if (v36 == 0.0)
    {
      -[CLLocationDerivedSpeedEstimator _invalidateSpeedEstimate](self, "_invalidateSpeedEstimate");
      -[CLLocationDerivedSpeedEstimator setPrevLoc:](self, "setPrevLoc:", a3);
      goto LABEL_75;
    }
    v46 = v41 / v42;
    if (v46 > 45.0)
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v47 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        v48 = objc_msgSend(a3, "type");
        *(_DWORD *)buf = 134219264;
        *(double *)v84 = v46;
        *(_WORD *)&v84[8] = 2048;
        *(double *)&v84[10] = v34 / v42;
        *(_WORD *)&v84[18] = 2048;
        *(double *)&v84[20] = v40 / v42;
        *(_WORD *)&v84[28] = 2048;
        *(double *)&v84[30] = v34;
        v85 = 2048;
        v86 = v42;
        v87 = 1024;
        v88 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "VEHICULAR: outlier, conservativeSpeed, %f, effectiveSpeed, %f, speedUncertainty, %f, distanceMoved, %f, elapsedTime, %f, type, %d", buf, 0x3Au);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_74;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v49 = qword_10229FCB8;
      objc_msgSend(a3, "type");
      v17 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v49, 0, "VEHICULAR: outlier, conservativeSpeed, %f, effectiveSpeed, %f, speedUncertainty, %f, distanceMoved, %f, elapsedTime, %f, type, %d", v80);
      goto LABEL_40;
    }
    objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceReferenceDate");
    -[CLLocationDerivedSpeedEstimator setCurrentEstimate:](self, "setCurrentEstimate:", v34 / v42, v51, v40 / v42);
    if (v46 <= 6.7)
    {
      self->_numConsecutiveVehicularSpeedObservations = 0;
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v58 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        v59 = objc_msgSend(a3, "type");
        *(_DWORD *)buf = 134219264;
        *(double *)v84 = v46;
        *(_WORD *)&v84[8] = 2048;
        *(double *)&v84[10] = v34 / v42;
        *(_WORD *)&v84[18] = 2048;
        *(double *)&v84[20] = v40 / v42;
        *(_WORD *)&v84[28] = 2048;
        *(double *)&v84[30] = v34;
        v85 = 2048;
        v86 = v42;
        v87 = 1024;
        v88 = v59;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "VEHICULAR: conservativeSpeed, %f, effectiveSpeed, %f, speedUncertainty, %f, distanceMoved, %f, elapsedTime, %f, type, %d", buf, 0x3Au);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_135;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 == -1)
        goto LABEL_167;
    }
    else
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v52 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        numConsecutiveVehicularSpeedObservations = self->_numConsecutiveVehicularSpeedObservations;
        lastElapsedTime = self->_lastElapsedTime;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v84 = numConsecutiveVehicularSpeedObservations;
        *(_WORD *)&v84[4] = 2048;
        *(double *)&v84[6] = v42;
        *(_WORD *)&v84[14] = 2048;
        *(double *)&v84[16] = lastElapsedTime;
        *(_WORD *)&v84[24] = 2048;
        *(double *)&v84[26] = v42 - lastElapsedTime;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "VEHICULAR: vehicular speed detected, consecutive observations, %d, elapsedTime, %f, lastElapsedTime, %f, delta, %f", buf, 0x26u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCB0 != -1)
          dispatch_once(&qword_10229FCB0, &stru_102148B58);
        v74 = self->_lastElapsedTime;
        *(_QWORD *)v80 = __PAIR64__(self->_numConsecutiveVehicularSpeedObservations, 67109888);
        *(_WORD *)&v80[8] = 2048;
        *(double *)&v80[10] = v42;
        *(_WORD *)&v80[18] = 2048;
        *(double *)&v80[20] = v74;
        v81 = 2048;
        v82 = v42 - v74;
        LODWORD(v79) = 38;
        v75 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: vehicular speed detected, consecutive observations, %d, elapsedTime, %f, lastElapsedTime, %f, delta, %f", v80, *(double *)&v79, *(double *)v80, *(double *)&v80[8]);
        sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v75);
        if (v75 != (char *)buf)
          free(v75);
      }
      v55 = self->_numConsecutiveVehicularSpeedObservations;
      if (v55 <= 0)
      {
        self->_numConsecutiveVehicularSpeedObservations = v55 + 1;
        self->_lastElapsedTime = v42;
        self->_lastDistanceMoved = v34;
        -[CLLocationDerivedSpeedEstimator _invalidateSpeedEstimate](self, "_invalidateSpeedEstimate");
        -[CLTimer setNextFireDelay:](-[CLLocationDerivedSpeedEstimator scanTimer](self, "scanTimer"), "setNextFireDelay:", 15.0);
        goto LABEL_75;
      }
      if (v42 - self->_lastElapsedTime < 15.0)
        goto LABEL_74;
      -[CLTimer setNextFireDelay:](-[CLLocationDerivedSpeedEstimator scanTimer](self, "scanTimer"), "setNextFireDelay:", 1.79769313e308);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v56 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        v57 = objc_msgSend(a3, "type");
        *(_DWORD *)buf = 134219264;
        *(double *)v84 = v46;
        *(_WORD *)&v84[8] = 2048;
        *(double *)&v84[10] = v34 / v42;
        *(_WORD *)&v84[18] = 2048;
        *(double *)&v84[20] = v40 / v42;
        *(_WORD *)&v84[28] = 2048;
        *(double *)&v84[30] = v34;
        v85 = 2048;
        v86 = v42;
        v87 = 1024;
        v88 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "VEHICULAR: conservativeSpeed, %f, effectiveSpeed, %f, speedUncertainty, %f, distanceMoved, %f, elapsedTime, %f, type, %d", buf, 0x3Au);
      }
      if (!sub_1001BFF7C(115, 2))
      {
LABEL_135:
        -[CLLocationDerivedSpeedEstimator setPrevLoc:](self, "setPrevLoc:", a3);
        LOBYTE(v7) = 1;
        return v7;
      }
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 == -1)
      {
LABEL_167:
        v76 = qword_10229FCB8;
        objc_msgSend(a3, "type");
        v77 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v76, 0, "VEHICULAR: conservativeSpeed, %f, effectiveSpeed, %f, speedUncertainty, %f, distanceMoved, %f, elapsedTime, %f, type, %d", v80);
        sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _feedLocation:]", "%s\n", v77);
        if (v77 != (char *)buf)
          free(v77);
        goto LABEL_135;
      }
    }
    dispatch_once(&qword_10229FCB0, &stru_102148B58);
    goto LABEL_167;
  }
  if (qword_10229FCB0 != -1)
    dispatch_once(&qword_10229FCB0, &stru_102148B58);
  v9 = qword_10229FCB8;
  if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(a3, "type");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v84 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "VEHICULAR: disqualified leeched location, type, %d", buf, 8u);
  }
  v7 = sub_1001BFF7C(115, 2);
  if (v7)
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v11 = qword_10229FCB8;
    objc_msgSend(a3, "type");
    v8 = (const char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 1, "VEHICULAR: disqualified leeched location, type, %d", v80);
    goto LABEL_29;
  }
  return v7;
}

- (CLLocation)prevLoc
{
  return self->_prevLoc;
}

- (void)setCurrentEstimate:(id)a3
{
  self->_currentEstimate = ($9E02BBE4D008A67F6CE59182E6F5D717)a3;
}

- (void)_invalidateSpeedEstimate
{
  -[CLLocationDerivedSpeedEstimator setCurrentEstimate:](self, "setCurrentEstimate:", -1.0, -1.0, -1.0);
}

- (BOOL)feedLocation:(const CLDaemonLocation *)a3
{
  id v5;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  id v10;
  _OWORD v12[8];
  _OWORD v13[2];

  v5 = objc_alloc((Class)CLLocation);
  rawCoordinate = a3->rawCoordinate;
  v12[6] = *(_OWORD *)&a3->lifespan;
  v12[7] = rawCoordinate;
  v13[0] = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)&a3->integrity;
  v7 = *(_OWORD *)&a3->speed;
  v12[2] = *(_OWORD *)&a3->altitude;
  v12[3] = v7;
  v8 = *(_OWORD *)&a3->timestamp;
  v12[4] = *(_OWORD *)&a3->course;
  v12[5] = v8;
  v9 = *(_OWORD *)&a3->coordinate.longitude;
  v12[0] = *(_OWORD *)&a3->suitability;
  v12[1] = v9;
  v10 = objc_msgSend(v5, "initWithClientLocation:", v12);
  LOBYTE(self) = -[CLLocationDerivedSpeedEstimator _feedLocation:](self, "_feedLocation:", v10);

  return (char)self;
}

- (void)setPrevLoc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

+ (BOOL)isSupported
{
  uint64_t v3;
  void *v5;

  if ((objc_msgSend((id)objc_opt_class(a1, a2), "isSupportedForDerivedSpeedEstimate") & 1) != 0)
    return 1;
  v5 = (void *)objc_opt_class(a1, v3);
  return _objc_msgSend(v5, "isSupportedForAnalytics");
}

+ (BOOL)isSupportedForAnalytics
{
  if ((objc_msgSend((id)objc_opt_class(a1, a2), "isSupportedForDerivedSpeedEstimate") & 1) != 0)
    return 1;
  sub_100197040();
  return sub_100195F08();
}

+ (BOOL)isSupportedForDerivedSpeedEstimate
{
  uint64_t v2;

  sub_100197040();
  LODWORD(v2) = sub_1000C4240();
  if ((_DWORD)v2)
    return ((unint64_t)sub_1001B7910() >> 35) & 1;
  return v2;
}

- (CLLocationDerivedSpeedEstimator)init
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLLocationDerivedSpeedEstimator.mm"), 148, CFSTR("Use -initWithSilo:"));

  return 0;
}

- (id)initInUniverse:(id)a3
{
  CLLocationDerivedSpeedEstimator *v5;
  CLLocationDerivedSpeedEstimator *v6;
  CLSilo *v7;
  BOOL *p_showActivityVehicular;
  BOOL *p_showActivityVehicularMounted;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  CLTimer *v24;
  _BOOL4 v26;
  _BOOL4 v27;
  const char *v28;
  char *v29;
  const char *v30;
  _QWORD v31[5];
  objc_super v32;
  int v33;
  const char *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  _BOOL4 v40;
  _BYTE buf[18];
  __int16 v42;
  const char *v43;
  __int16 v44;
  _BOOL4 v45;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLLocationDerivedSpeedEstimator.mm"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("universe"));
  if ((objc_msgSend((id)objc_opt_class(self, a2), "isSupported") & 1) != 0)
  {
    v32.receiver = self;
    v32.super_class = (Class)CLLocationDerivedSpeedEstimator;
    v5 = -[CLLocationDerivedSpeedEstimator init](&v32, "init");
    v6 = v5;
    if (v5)
    {
      v5->_valid = 1;
      v5->_universe = (CLIntersiloUniverse *)a3;
      v7 = (CLSilo *)objc_msgSend(a3, "silo");
      *(_WORD *)&v6->_showActivityVehicular = 0;
      p_showActivityVehicular = &v6->_showActivityVehicular;
      v6->_vehicleStateProxy = 0;
      v6->_silo = v7;
      sub_100197040();
      p_showActivityVehicularMounted = &v6->_showActivityVehicularMounted;
      if (sub_10075D288())
      {
        sub_1001E4804(buf);
        sub_1001E4874(*(uint64_t *)buf, "ShowActivityVehicular", &v6->_showActivityVehicular);
        v10 = *(std::__shared_weak_count **)&buf[8];
        if (*(_QWORD *)&buf[8])
        {
          v11 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
          do
            v12 = __ldaxr(v11);
          while (__stlxr(v12 - 1, v11));
          if (!v12)
          {
            ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
            std::__shared_weak_count::__release_weak(v10);
          }
        }
        sub_1001E4804(buf);
        sub_1001E4874(*(uint64_t *)buf, "ShowActivityVehicularMounted", &v6->_showActivityVehicularMounted);
        v13 = *(std::__shared_weak_count **)&buf[8];
        if (*(_QWORD *)&buf[8])
        {
          v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
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
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v16 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_INFO))
      {
        v17 = *p_showActivityVehicular;
        v18 = *p_showActivityVehicularMounted;
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "ShowActivityVehicular";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v17;
        v42 = 2080;
        v43 = "ShowActivityVehicularMounted";
        v44 = 1024;
        v45 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s, %d, %s, %d", buf, 0x22u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCB0 != -1)
          dispatch_once(&qword_10229FCB0, &stru_102148B58);
        v26 = *p_showActivityVehicular;
        v27 = *p_showActivityVehicularMounted;
        v33 = 136315906;
        v34 = "ShowActivityVehicular";
        v35 = 1024;
        v36 = v26;
        v37 = 2080;
        v38 = "ShowActivityVehicularMounted";
        v39 = 1024;
        v40 = v27;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 1, "%s, %d, %s, %d", (const char *)&v33, 34, v30, LODWORD(v31[0]));
        v29 = (char *)v28;
        sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator initInUniverse:]", "%s\n", v28);
        if (v29 != buf)
          free(v29);
      }
      v6->_statusBarAssertion = 0;
      v6->_vehicularHints = 0;
      *(_WORD *)&v6->_visualIndicatorActive = 0;
      v6->_motionVehicular = 0;
      v6->_prevLoc = 0;
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)&v6->_currentEstimate.speed = _Q0;
      v6->_currentEstimate.uncertainty = -1.0;
      v6->_prevVehicularHints = 0;
      v6->_hintsAvailable = 21;
      *(_OWORD *)&v6->_vehicularStartTime = 0u;
      *(_OWORD *)&v6->_vehicularLastBTHintTime = 0u;
      *(_OWORD *)&v6->_accelDetectionLatency = _Q0;
      *(_OWORD *)&v6->_basebandDetectionLatency = _Q0;
      *(_OWORD *)&v6->_btDetectionLatency = _Q0;
      *(_OWORD *)&v6->_vehicularDurationExitFromNoHints = _Q0;
      v6->_vehicularDurationLastBTHintFromLastMotionHint = -1.0;
      v6->_sequentialVehicularIndex = 0;
      *(_QWORD *)&v6->_numMotionExitsWithBT = 0;
      v6->_numConsecutiveVehicularSpeedObservations = 0;
      v6->_wsbClientStartTime = 0;
      v6->_lastElapsedTime = 0.0;
      v6->_lastDistanceMoved = 0.0;
      -[CLLocationDerivedSpeedEstimator registerForNotifications](v6, "registerForNotifications");
      v24 = (CLTimer *)-[CLSilo newTimer](v6->_silo, "newTimer");
      v6->_scanTimer = v24;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100619FA0;
      v31[3] = &unk_10212BB58;
      v31[4] = v6;
      -[CLTimer setHandler:](v24, "setHandler:", v31);
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)registerForNotifications
{
  sub_1001B7DEC();
}

- (void)startWsbClient
{
  int v2;
  __int16 v3;
  const char *v4;

  if (!self->_wsbClientStartTime)
  {
    v2 = 3600;
    v3 = 257;
    v4 = "dndwd";
    sub_10061DCC4();
  }
}

- (void)stopWsbClient
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (self->_wsbClientStartTime)
  {
    objc_msgSend(*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_wifiServiceClient.__ptr_.__value_ + 1), 12);

    self->_wsbClientStartTime = 0;
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v3 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopWsbClient", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "stopWsbClient", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator stopWsbClient]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
}

- (void)updateWsbClient:(BOOL)a3
{
  if (a3)
    -[CLLocationDerivedSpeedEstimator stopWsbClient](self, "stopWsbClient");
  else
    -[CLLocationDerivedSpeedEstimator startWsbClient](self, "startWsbClient");
}

- (void)unregisterForNotifications
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;

  value = self->_wifiServiceClient.__ptr_.__value_;
  if (value)
  {
    self->_wifiServiceClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
    v4 = self->_wifiServiceClient.__ptr_.__value_;
    self->_wifiServiceClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
  v5 = self->_motionStateClient.__ptr_.__value_;
  if (v5)
  {
    self->_motionStateClient.__ptr_.__value_ = 0;
    (*(void (**)(Client *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
    v6 = self->_motionStateClient.__ptr_.__value_;
    self->_motionStateClient.__ptr_.__value_ = 0;
    if (v6)
      (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  }
  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }
}

- (void)invalidate
{
  -[CLLocationDerivedSpeedEstimator unregisterForNotifications](self, "unregisterForNotifications");
  -[CLLocationDerivedSpeedEstimator _invalidateSpeedEstimate](self, "_invalidateSpeedEstimate");
}

- (void)dealloc
{
  objc_super v3;

  -[CLLocationDerivedSpeedEstimator clearStatusBarColorAndText](self, "clearStatusBarColorAndText");
  -[CLLocationDerivedSpeedEstimator invalidate](self, "invalidate");
  -[CLTimer invalidate](self->_scanTimer, "invalidate");

  self->_scanTimer = 0;
  self->_prevLoc = 0;

  self->_silo = 0;
  self->_universe = 0;

  self->_vehicleStateProxy = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLLocationDerivedSpeedEstimator;
  -[CLLocationDerivedSpeedEstimator dealloc](&v3, "dealloc");
}

- (void)_onScanTimer
{
  NSObject *v3;
  double Current;
  id v5;
  const char *v6;
  uint8_t *v7;
  uint64_t v8;
  char v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;
  void *__p[2];
  char v19;
  _WORD v20[8];
  uint8_t buf[8];
  char v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];
  __int128 v29;
  uint64_t v30;

  if (qword_10229FCB0 != -1)
    dispatch_once(&qword_10229FCB0, &stru_102148B58);
  v3 = qword_10229FCB8;
  if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "VEHICULAR: start extra scan", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v20[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: start extra scan", v20, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator _onScanTimer]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  Current = CFAbsoluteTimeGetCurrent();
  sub_1015A2E04(__p, "speedestimator");
  sub_100225558((uint64_t)buf, 4, 1, (__int128 *)__p, Current);
  if (v19 < 0)
    operator delete(__p[0]);
  v5 = objc_msgSend(-[CLIntersiloUniverse vendor](self->_universe, "vendor"), "proxyForService:", CFSTR("CLWifiLocationProvider"));
  v8 = *(_QWORD *)buf;
  v9 = v22;
  if (SHIBYTE(v24) < 0)
  {
    sub_100115CE4(&v10, (void *)v23, *((unint64_t *)&v23 + 1));
  }
  else
  {
    v10 = v23;
    v11 = v24;
  }
  v13 = v26;
  v14 = v27;
  v15[0] = v28[0];
  *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)((char *)v28 + 12);
  v12 = v25;
  if (SHIBYTE(v30) < 0)
  {
    sub_100115CE4(&v16, (void *)v29, *((unint64_t *)&v29 + 1));
  }
  else
  {
    v16 = v29;
    v17 = v30;
  }
  objc_msgSend(v5, "requestLocationUpdateWithParameters:", sub_10061AB3C((uint64_t)&v8));
  if (SHIBYTE(v17) < 0)
    operator delete((void *)v16);
  if (SHIBYTE(v11) < 0)
    operator delete((void *)v10);
  if (SHIBYTE(v30) < 0)
    operator delete((void *)v29);
  if (SHIBYTE(v24) < 0)
    operator delete((void *)v23);
}

- (void)handleVehicularStateChanged
{
  CLVehicleStateNotifierProtocol *vehicleStateProxy;
  _QWORD v3[5];

  if (!self->_showActivityVehicularMounted)
  {
    vehicleStateProxy = self->_vehicleStateProxy;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10061ACE8;
    v3[3] = &unk_102148AC0;
    v3[4] = self;
    -[CLVehicleStateNotifierProtocol fetchVehicularDndStateAndHintsWithReply:](vehicleStateProxy, "fetchVehicularDndStateAndHintsWithReply:", v3);
  }
}

- (void)handleMotionStateNotification:(NotificationData *)a3
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  int type;
  uint64_t v13;
  int confidence;
  int isMounted;
  int v16;
  double vehicularStartTime;
  double v18;
  int v19;
  double v20;
  double v21;
  int v22;
  double vehicularLastBTHintTime;
  double v24;
  double v25;
  double v26;
  double v27;
  double vehicularLastMotionHintTime;
  double v30;
  NSObject *v31;
  double v32;
  int sequentialVehicularIndex;
  CLVehicleStateNotifierProtocol *vehicleStateProxy;
  double v35;
  double v36;
  char v37;
  unint64_t v38;
  unint64_t vehicularHints;
  unint64_t v40;
  NSObject *v41;
  double vehicularLastNoHintsTime;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  NSObject *v46;
  _BOOL4 seenNonVehicularState;
  NSObject *v52;
  int v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  const char *v60;
  uint8_t *v61;
  const char *v62;
  uint8_t *v63;
  double v64;
  int v65;
  const char *v66;
  uint8_t *v67;
  _BOOL4 v68;
  const char *v69;
  uint8_t *v70;
  double v71;
  const char *v72;
  uint8_t *v73;
  uint64_t v74;
  int v75;
  int v76;
  double v77;
  _QWORD v78[5];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  CLMotionActivity v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  int v93;
  double v94;
  __int16 v95;
  int v96;
  __int16 v97;
  int v98;
  __int16 v99;
  int v100;
  __int16 v101;
  uint64_t v102;
  uint8_t buf[4];
  double v104;
  __int16 v105;
  int v106;
  __int16 v107;
  int v108;
  __int16 v109;
  int v110;
  __int16 v111;
  uint64_t v112;

  v7 = *((_OWORD *)a3 + 7);
  v90 = *((_OWORD *)a3 + 6);
  v91 = v7;
  v92 = *((_QWORD *)a3 + 16);
  v8 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&v88.isStanding = *((_OWORD *)a3 + 2);
  *(_OWORD *)&v88.isVehicleConnected = v8;
  v9 = *((_OWORD *)a3 + 5);
  *(_OWORD *)&v88.vehicleType = *((_OWORD *)a3 + 4);
  v89 = v9;
  v10 = *((_OWORD *)a3 + 1);
  *(_OWORD *)&v88.type = *(_OWORD *)a3;
  *(_OWORD *)&v88.mountedConfidence = v10;
  if (qword_10229FCB0 != -1)
    dispatch_once(&qword_10229FCB0, &stru_102148B58);
  v11 = qword_10229FCB8;
  if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_INFO))
  {
    type = v88.type;
    v13 = CLMotionActivity::activityTypeToString(v88.type);
    confidence = v88.confidence;
    isMounted = CLMotionActivity::isMounted(&v88);
    *(_DWORD *)buf = 136316162;
    v104 = *(double *)&v13;
    v105 = 1024;
    v106 = type;
    v107 = 1024;
    v108 = confidence;
    v109 = 1024;
    v110 = isMounted;
    v111 = 2048;
    v112 = v89;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "MotionState, %s, type, %d, conf, %d, mounted, %d, startTime, %f", buf, 0x28u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v55 = qword_10229FCB8;
    v56 = CLMotionActivity::activityTypeToString(v88.type);
    v57 = v88.type;
    v58 = v88.confidence;
    v59 = CLMotionActivity::isMounted(&v88);
    v93 = 136316162;
    v94 = *(double *)&v56;
    v95 = 1024;
    v96 = v57;
    v97 = 1024;
    v98 = v58;
    v99 = 1024;
    v100 = v59;
    v101 = 2048;
    v102 = v89;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v55, 1, "MotionState, %s, type, %d, conf, %d, mounted, %d, startTime, %f", (const char *)&v93, 40, v75, v76, v77);
    v61 = (uint8_t *)v60;
    sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v60);
    if (v61 != buf)
      free(v61);
  }
  v16 = CLMotionActivity::isInVehicle(&v88);
  vehicularStartTime = self->_vehicularStartTime;
  if (v16)
  {
    if (vehicularStartTime == 0.0)
    {
      v18 = *(double *)&v89;
      *(_QWORD *)&self->_vehicularStartTime = v89;
      if (vabdd_f64(v18, (double)self->_lastSeenVehicularTime) >= 180.0)
        v19 = 0;
      else
        v19 = self->_sequentialVehicularIndex + 1;
      self->_sequentialVehicularIndex = v19;
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v31 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        v32 = self->_vehicularStartTime;
        sequentialVehicularIndex = self->_sequentialVehicularIndex;
        *(_DWORD *)buf = 134218240;
        v104 = v32;
        v105 = 1024;
        v106 = sequentialVehicularIndex;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "VEHICULAR: vehicularStartTime, %f, seq, %d", buf, 0x12u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCB0 != -1)
          dispatch_once(&qword_10229FCB0, &stru_102148B58);
        v64 = self->_vehicularStartTime;
        v65 = self->_sequentialVehicularIndex;
        v93 = 134218240;
        v94 = v64;
        v95 = 1024;
        v96 = v65;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: vehicularStartTime, %f, seq, %d", COERCE_DOUBLE(&v93), 18);
        v67 = (uint8_t *)v66;
        sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v66);
        if (v67 != buf)
          free(v67);
      }
      v78[1] = 3221225472;
      v84 = v89;
      v85 = v90;
      v86 = v91;
      v80 = *(_OWORD *)&v88.mountedConfidence;
      v81 = *(_OWORD *)&v88.isStanding;
      v82 = *(_OWORD *)&v88.isVehicleConnected;
      v83 = *(_OWORD *)&v88.vehicleType;
      vehicleStateProxy = self->_vehicleStateProxy;
      v78[0] = _NSConcreteStackBlock;
      v78[2] = sub_10061B7C4;
      v78[3] = &unk_102148AE8;
      v87 = v92;
      v79 = *(_OWORD *)&v88.type;
      v78[4] = self;
      -[CLVehicleStateNotifierProtocol fetchVehicularFalsePositiveSuppressionStatusWithReply:](vehicleStateProxy, "fetchVehicularFalsePositiveSuppressionStatusWithReply:", v78);
      vehicularStartTime = self->_vehicularStartTime;
    }
    v35 = *(double *)&v89;
    v36 = *(double *)&v89 - vehicularStartTime;
    v37 = v90;
    if ((v90 & 1) != 0)
    {
      vehicularHints = self->_vehicularHints;
      if ((vehicularHints & 1) == 0)
        self->_accelDetectionLatency = v36;
      self->_vehicularHints = vehicularHints | 1;
      v38 = 1;
      if ((v37 & 2) == 0)
      {
LABEL_42:
        if ((v37 & 4) != 0)
        {
          v43 = self->_vehicularHints;
          if ((v43 & 4) == 0)
            self->_basebandDetectionLatency = v36;
          self->_vehicularHints = v43 | 4;
          v38 |= 4uLL;
          if ((v37 & 8) == 0)
          {
LABEL_44:
            if ((v37 & 0x10) == 0)
              goto LABEL_45;
            goto LABEL_61;
          }
        }
        else if ((v37 & 8) == 0)
        {
          goto LABEL_44;
        }
        v44 = self->_vehicularHints;
        if ((v44 & 8) == 0)
          self->_wifiDetectionLatency = v36;
        self->_vehicularHints = v44 | 8;
        v38 |= 8uLL;
        if ((v37 & 0x10) == 0)
        {
LABEL_45:
          if ((self->_prevVehicularHints & 0x10) != 0)
            self->_vehicularLastBTHintTime = v35;
          if (!v38)
          {
            if (self->_vehicularLastNoHintsTime == 0.0)
            {
              self->_vehicularLastNoHintsTime = v35;
              if (qword_10229FCB0 != -1)
                dispatch_once(&qword_10229FCB0, &stru_102148B58);
              v41 = qword_10229FCB8;
              if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_INFO))
              {
                vehicularLastNoHintsTime = self->_vehicularLastNoHintsTime;
                *(_DWORD *)buf = 134217984;
                v104 = vehicularLastNoHintsTime;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "VEHICULAR: vehicularLastNoHintsTime, %f", buf, 0xCu);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FCB0 != -1)
                  dispatch_once(&qword_10229FCB0, &stru_102148B58);
                v71 = self->_vehicularLastNoHintsTime;
                v93 = 134217984;
                v94 = v71;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 1, "VEHICULAR: vehicularLastNoHintsTime, %f", COERCE_DOUBLE(&v93));
                v73 = (uint8_t *)v72;
                sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v72);
                if (v73 != buf)
                  free(v73);
              }
            }
            v38 = 0;
            goto LABEL_65;
          }
LABEL_64:
          self->_vehicularLastNoHintsTime = 0.0;
LABEL_65:
          self->_prevVehicularHints = v38;
          goto LABEL_77;
        }
LABEL_61:
        v45 = self->_vehicularHints;
        if ((v45 & 0x10) == 0)
          self->_btDetectionLatency = v36;
        self->_vehicularHints = v45 | 0x10;
        v38 |= 0x10uLL;
        goto LABEL_64;
      }
    }
    else if ((self->_prevVehicularHints & 1) != 0
           && (*(_QWORD *)&self->_vehicularLastMotionHintTime = v89, (v37 & 0x10) != 0))
    {
      v38 = 0;
      ++self->_numMotionExitsWithBT;
      if ((v37 & 2) == 0)
        goto LABEL_42;
    }
    else
    {
      v38 = 0;
      if ((v37 & 2) == 0)
        goto LABEL_42;
    }
    v40 = self->_vehicularHints;
    if ((v40 & 2) == 0)
      self->_gpsDetectionLatency = v36;
    self->_vehicularHints = v40 | 2;
    v38 |= 2uLL;
    goto LABEL_42;
  }
  if (vehicularStartTime > 0.0)
  {
    v20 = *(double *)&v89;
    v21 = *(double *)&v89 - vehicularStartTime;
    v22 = (int)*(double *)&v89;
    v24 = self->_vehicularLastNoHintsTime;
    vehicularLastBTHintTime = self->_vehicularLastBTHintTime;
    v25 = *(double *)&v89 - v24;
    _ZF = v24 == 0.0;
    v26 = -1.0;
    if (_ZF)
      v25 = -1.0;
    self->_vehicularDuration = v21;
    self->_vehicularDurationExitFromNoHints = v25;
    self->_lastSeenVehicularTime = v22;
    v27 = v20 - vehicularLastBTHintTime;
    if (vehicularLastBTHintTime == 0.0)
      v27 = -1.0;
    self->_vehicularDurationExitFromLastBTHint = v27;
    if (vehicularLastBTHintTime != 0.0)
    {
      vehicularLastMotionHintTime = self->_vehicularLastMotionHintTime;
      _ZF = vehicularLastBTHintTime <= vehicularLastMotionHintTime || vehicularLastMotionHintTime == 0.0;
      v30 = vehicularLastBTHintTime - vehicularLastMotionHintTime;
      v26 = -1.0;
      if (!_ZF)
        v26 = v30;
    }
    self->_vehicularDurationLastBTHintFromLastMotionHint = v26;
    if (self->_seenNonVehicularState)
    {
      -[CLLocationDerivedSpeedEstimator logLatencyMetricsInternal](self, "logLatencyMetricsInternal");
      -[CLLocationDerivedSpeedEstimator submitLatencyMetrics](self, "submitLatencyMetrics");
    }
    else
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v46 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        seenNonVehicularState = self->_seenNonVehicularState;
        *(_DWORD *)buf = 67109120;
        LODWORD(v104) = seenNonVehicularState;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "VEHICULAR: skipping LatencyMetrics, seenNonVehicularState, %d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCB0 != -1)
          dispatch_once(&qword_10229FCB0, &stru_102148B58);
        v68 = self->_seenNonVehicularState;
        v93 = 67109120;
        LODWORD(v94) = v68;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: skipping LatencyMetrics, seenNonVehicularState, %d", &v93);
        v70 = (uint8_t *)v69;
        sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v69);
        if (v70 != buf)
          free(v70);
      }
    }
    self->_vehicularHints = 0;
    self->_prevVehicularHints = 0;
    *(_OWORD *)&self->_vehicularStartTime = 0u;
    *(_OWORD *)&self->_vehicularLastBTHintTime = 0u;
    self->_numMotionExitsWithBT = 0;
    self->_hintsAvailable = 21;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&self->_accelDetectionLatency = _Q0;
    *(_OWORD *)&self->_basebandDetectionLatency = _Q0;
    *(_OWORD *)&self->_btDetectionLatency = _Q0;
    *(_OWORD *)&self->_vehicularDurationExitFromNoHints = _Q0;
    self->_vehicularDurationLastBTHintFromLastMotionHint = -1.0;
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v52 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "VEHICULAR: reset vehicular latency measures", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      LOWORD(v93) = 0;
      LODWORD(v74) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 1, "VEHICULAR: reset vehicular latency measures", &v93, v74);
      v63 = (uint8_t *)v62;
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator handleMotionStateNotification:]", "%s\n", v62);
      if (v63 != buf)
        free(v63);
    }
  }
  self->_seenNonVehicularState = 1;
LABEL_77:
  if (self->_showActivityVehicularMounted)
  {
    v53 = CLMotionActivity::isInVehicle(&v88);
    if (v53)
      LOBYTE(v53) = CLMotionActivity::isMounted(&v88);
    self->_motionVehicular = v53;
    -[CLLocationDerivedSpeedEstimator updateStatusBarLabel](self, "updateStatusBarLabel");
  }
  else if (self->_showActivityVehicular && self->_visualIndicatorActive)
  {
    v54 = self->_vehicularHints;
    -[SBSStatusBarStyleOverridesAssertion setStatusString:](self->_statusBarAssertion, "setStatusString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("In-Vehicle(Motion:%d,GPS:%d,BB:%d,WiFi:%d,BT:%d,M:%d)"), v54 & 1, (v54 >> 1) & 1, (v54 >> 2) & 1, (v54 >> 3) & 1, (v54 >> 4) & 1, CLMotionActivity::isMounted(&v88)));
  }
}

- (void)onWifiServiceNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v5;
  double v6;
  uint8_t *v7;
  uint8_t *v8;
  NSObject *v11;
  int v12;
  _BOOL8 v13;
  NSObject *v14;
  double v15;
  uint8_t *v16;
  int v17;
  const char *v18;
  uint8_t *v19;
  int v20;
  int v21;
  uint8_t buf[4];
  int v23;

  if (a3 == 6)
  {
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v11 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *((unsigned __int8 *)a4 + 96);
      if (*((_BYTE *)a4 + 96))
        v12 = *((_DWORD *)a4 + 12) > 0;
      *(_DWORD *)buf = 67109120;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "VEHICULAR: wifi associated state, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v17 = *((unsigned __int8 *)a4 + 96);
      if (*((_BYTE *)a4 + 96))
        v17 = *((_DWORD *)a4 + 12) > 0;
      v20 = 67109120;
      v21 = v17;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: wifi associated state, %d", &v20);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator onWifiServiceNotification:data:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    if (*((_BYTE *)a4 + 96))
      v13 = *((_DWORD *)a4 + 12) > 0;
    else
      v13 = 0;
    -[CLLocationDerivedSpeedEstimator updateWsbClient:](self, "updateWsbClient:", v13);
  }
  else if (a3 == 12)
  {
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v5 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v23 = 12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "VEHICULAR: notification ScanCache received %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v20 = 67109120;
      v21 = 12;
      v6 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: notification ScanCache received %d", &v20);
      v8 = v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator onWifiServiceNotification:data:]", "%s\n", v6);
LABEL_28:
      if (v8 != buf)
        free(v8);
    }
  }
  else
  {
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v14 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "VEHICULAR: received unhandled WifiService notification %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v20 = 67109120;
      v21 = a3;
      v15 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 16, "VEHICULAR: received unhandled WifiService notification %d", &v20);
      v8 = v16;
      sub_100512490("Generic", 1, 0, 0, "-[CLLocationDerivedSpeedEstimator onWifiServiceNotification:data:]", "%s\n", v15);
      goto LABEL_28;
    }
  }
}

- (void)onMotionStateNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _DWORD v11[4];
  uint8_t buf[4];
  int v13;

  if (a3 == 4)
  {
    -[CLLocationDerivedSpeedEstimator handleMotionStateNotification:](self, "handleMotionStateNotification:", a4);
  }
  else
  {
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v8 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "VEHICULAR: received unhandled notification %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v11[0] = 67109120;
      v11[1] = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 16, "VEHICULAR: received unhandled notification %d", v11);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLLocationDerivedSpeedEstimator onMotionStateNotification:data:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
}

- (void)updateStatusBarLabel
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint8_t *v6;
  int v7;
  id v8;
  uint8_t buf[4];
  id v10;

  if (self->_motionVehicular)
  {
    if (self->_visualIndicatorActive)
    {
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v3 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v10 = objc_msgSend(CFSTR("Apple Internal: In-Vehicle"), "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "update status bar label, %s", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCB0 != -1)
          dispatch_once(&qword_10229FCB0, &stru_102148B58);
        v4 = qword_10229FCB8;
        v7 = 136315138;
        v8 = objc_msgSend(CFSTR("Apple Internal: In-Vehicle"), "UTF8String");
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v4, 1, "update status bar label, %s", (const char *)&v7);
        v6 = (uint8_t *)v5;
        sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator updateStatusBarLabel]", "%s\n", v5);
        if (v6 != buf)
          free(v6);
      }
      -[SBSStatusBarStyleOverridesAssertion setStatusString:](self->_statusBarAssertion, "setStatusString:", CFSTR("Apple Internal: In-Vehicle"));
    }
    else
    {
      -[CLLocationDerivedSpeedEstimator setStatusBarWithLabel:](self, "setStatusBarWithLabel:", CFSTR("Apple Internal: In-Vehicle"));
    }
  }
  else if (self->_visualIndicatorActive)
  {
    -[CLLocationDerivedSpeedEstimator clearStatusBarColorAndText](self, "clearStatusBarColorAndText");
  }
}

- (void)setStatusBarWithLabel:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  SBSStatusBarStyleOverridesAssertion *v7;
  SBSStatusBarStyleOverridesAssertion *statusBarAssertion;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;

  if (!self->_visualIndicatorActive)
  {
    if (self->_showActivityVehicularMounted)
      v5 = 0x8000;
    else
      v5 = 4;
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v6 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = objc_msgSend(a3, "UTF8String");
      v20 = 2048;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "set status bar label, %s, style, %llu", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v9 = qword_10229FCB8;
      v14 = 136315394;
      v15 = objc_msgSend(a3, "UTF8String");
      v16 = 2048;
      v17 = v5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 1, "set status bar label, %s, style, %llu", (const char *)&v14, 22);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator setStatusBarWithLabel:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    self->_visualIndicatorActive = 1;
    v7 = +[SBSStatusBarStyleOverridesAssertion assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:](SBSStatusBarStyleOverridesAssertion, "assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", v5, getpid(), 1, 1);
    self->_statusBarAssertion = v7;
    -[SBSStatusBarStyleOverridesAssertion setStatusString:](v7, "setStatusString:", a3);
    statusBarAssertion = self->_statusBarAssertion;
    v12[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10061C3C0;
    v13[3] = &unk_102142CC0;
    v13[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10061C5DC;
    v12[3] = &unk_10212BB58;
    -[SBSStatusBarStyleOverridesAssertion acquireWithHandler:invalidationHandler:](statusBarAssertion, "acquireWithHandler:invalidationHandler:", v13, v12);
  }
}

- (void)clearStatusBarColorAndText
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  self->_visualIndicatorActive = 0;
  -[SBSStatusBarStyleOverridesAssertion invalidate](self->_statusBarAssertion, "invalidate");

  self->_statusBarAssertion = 0;
  if (qword_10229FCB0 != -1)
    dispatch_once(&qword_10229FCB0, &stru_102148B58);
  v3 = qword_10229FCB8;
  if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "clear status bar label", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 1, "clear status bar label", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator clearStatusBarColorAndText]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)logLatencyMetricsInternal
{
  int v3;
  NSObject *v4;
  double accelDetectionLatency;
  double gpsDetectionLatency;
  double basebandDetectionLatency;
  double wifiDetectionLatency;
  double vehicularDurationExitFromNoHints;
  double vehicularDurationExitFromLastBTHint;
  double vehicularDurationLastBTHintFromLastMotionHint;
  int numMotionExitsWithBT;
  int sequentialVehicularIndex;
  double vehicularDuration;
  double btDetectionLatency;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  int v24;
  double v25;
  double v26;
  const char *v27;
  uint8_t *v28;
  double v29;
  double v30;
  void **v31;
  uint64_t v32;
  id (*v33)(uint64_t, void *);
  void *v34;
  CLLocationDerivedSpeedEstimator *v35;
  int v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  double v57;
  __int16 v58;
  int v59;
  uint8_t buf[4];
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  double v81;
  __int16 v82;
  int v83;

  sub_100197040();
  if (sub_10075D288())
  {
    v31 = _NSConcreteStackBlock;
    v32 = 3221225472;
    v33 = sub_10061CC80;
    v34 = &unk_102148B38;
    v35 = self;
    v3 = off_1022A3680((uint64_t)CFSTR("212"), (uint64_t)CFSTR("VehicleConnection_NOT_A_CRASH"), 0, 0, (uint64_t)&v31);
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v4 = qword_10229FCB8;
    if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
    {
      accelDetectionLatency = self->_accelDetectionLatency;
      gpsDetectionLatency = self->_gpsDetectionLatency;
      basebandDetectionLatency = self->_basebandDetectionLatency;
      wifiDetectionLatency = self->_wifiDetectionLatency;
      vehicularDurationExitFromNoHints = self->_vehicularDurationExitFromNoHints;
      vehicularDurationExitFromLastBTHint = self->_vehicularDurationExitFromLastBTHint;
      vehicularDurationLastBTHintFromLastMotionHint = self->_vehicularDurationLastBTHintFromLastMotionHint;
      numMotionExitsWithBT = self->_numMotionExitsWithBT;
      sequentialVehicularIndex = self->_sequentialVehicularIndex;
      btDetectionLatency = self->_btDetectionLatency;
      vehicularDuration = self->_vehicularDuration;
      *(_DWORD *)buf = 134220800;
      v61 = accelDetectionLatency;
      v62 = 2048;
      v63 = gpsDetectionLatency;
      v64 = 2048;
      v65 = basebandDetectionLatency;
      v66 = 2048;
      v67 = wifiDetectionLatency;
      v68 = 2048;
      v69 = btDetectionLatency;
      v70 = 2048;
      v71 = vehicularDurationExitFromNoHints;
      v72 = 2048;
      v73 = vehicularDurationExitFromLastBTHint;
      v74 = 2048;
      v75 = vehicularDurationLastBTHintFromLastMotionHint;
      v76 = 1024;
      v77 = numMotionExitsWithBT;
      v78 = 1024;
      v79 = sequentialVehicularIndex;
      v80 = 2048;
      v81 = vehicularDuration;
      v82 = 1024;
      v83 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "VEHICULAR: logLatencyMetricsInternal, accel, %f, gps, %f, bb, %f, wifi, %f, bt, %f, exitFromNoHints, %f, exitFromLastBTHint, %f, BTHintFromLastMotionHintDuration, %f, motionExitsWithBTCount, %d, sequentialVehicularIndex, %d, duration, %f, success, %d", buf, 0x6Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v16 = self->_accelDetectionLatency;
      v17 = self->_gpsDetectionLatency;
      v18 = self->_basebandDetectionLatency;
      v19 = self->_wifiDetectionLatency;
      v20 = self->_vehicularDurationExitFromNoHints;
      v21 = self->_vehicularDurationExitFromLastBTHint;
      v22 = self->_vehicularDurationLastBTHintFromLastMotionHint;
      v23 = self->_numMotionExitsWithBT;
      v24 = self->_sequentialVehicularIndex;
      v26 = self->_btDetectionLatency;
      v25 = self->_vehicularDuration;
      v36 = 134220800;
      v37 = v16;
      v38 = 2048;
      v39 = v17;
      v40 = 2048;
      v41 = v18;
      v42 = 2048;
      v43 = v19;
      v44 = 2048;
      v45 = v26;
      v46 = 2048;
      v47 = v20;
      v48 = 2048;
      v49 = v21;
      v50 = 2048;
      v51 = v22;
      v52 = 1024;
      v53 = v23;
      v54 = 1024;
      v55 = v24;
      v56 = 2048;
      v57 = v25;
      v58 = 1024;
      v59 = v3;
      LODWORD(v29) = 110;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: logLatencyMetricsInternal, accel, %f, gps, %f, bb, %f, wifi, %f, bt, %f, exitFromNoHints, %f, exitFromLastBTHint, %f, BTHintFromLastMotionHintDuration, %f, motionExitsWithBTCount, %d, sequentialVehicularIndex, %d, duration, %f, success, %d", COERCE_DOUBLE(&v36), v29, v30, *(double *)&v31, *(double *)&v32, *(double *)&v33, *(double *)&v34, *(double *)&v35);
      v28 = (uint8_t *)v27;
      sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator logLatencyMetricsInternal]", "%s\n", v27);
      if (v28 != buf)
        free(v28);
    }
  }
}

- (void)submitFalseDetectionMetricsWithType:(unint64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  _UNKNOWN **v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  unint64_t v13;
  uint8_t buf[4];
  unint64_t v15;

  if (qword_10229FCB0 != -1)
    dispatch_once(&qword_10229FCB0, &stru_102148B58);
  v4 = qword_10229FCB8;
  if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "VEHICULAR: false positive detected, hint, %lu", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v12 = 134217984;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: false positive detected, hint, %lu", &v12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator submitFalseDetectionMetricsWithType:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  AnalyticsSendEvent(CFSTR("com.apple.carexperience.falseDetection.all"), &off_10221FAE8);
  switch(a3)
  {
    case 1uLL:
      v5 = CFSTR("com.apple.carexperience.falseDetection.accel");
      v6 = &off_10221FB10;
      goto LABEL_18;
    case 2uLL:
      v5 = CFSTR("com.apple.carexperience.falseDetection.gps");
      v6 = &off_10221FB38;
      goto LABEL_18;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      if (qword_10229FCB0 != -1)
        dispatch_once(&qword_10229FCB0, &stru_102148B58);
      v7 = qword_10229FCB8;
      if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v15) = 6488064;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "VEHICULAR: submit baseband false detection metric, id, %u", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCB0 != -1)
          dispatch_once(&qword_10229FCB0, &stru_102148B58);
        v12 = 67109120;
        LODWORD(v13) = 6488064;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCB8, 0, "VEHICULAR: submit baseband false detection metric, id, %u", &v12);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator submitFalseDetectionMetricsWithType:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
      AWDPostSimpleMetric(6488064);
      v5 = CFSTR("com.apple.carexperience.falseDetection.baseband");
      v6 = &off_10221FB60;
      goto LABEL_18;
    case 8uLL:
      v5 = CFSTR("com.apple.carexperience.falseDetection.wifi");
      v6 = &off_10221FB88;
      goto LABEL_18;
    default:
      if (a3 != 16)
        return;
      v5 = CFSTR("com.apple.carexperience.falseDetection.bt");
      v6 = &off_10221FBB0;
LABEL_18:
      AnalyticsSendEvent(v5, v6);
      return;
  }
}

- (void)submitLatencyMetrics
{
  id v3;
  unint64_t vehicularHints;
  double accelDetectionLatency;
  double wifiDetectionLatency;
  double v7;
  double basebandDetectionLatency;
  double gpsDetectionLatency;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  id v79;
  __int16 v80;
  id v81;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_vehicularDuration), CFSTR("duration"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_hintsAvailable), CFSTR("hintsAvailable"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_vehicularHints), CFSTR("hintsDetected"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sequentialVehicularIndex), CFSTR("sequentialVehicularIndex"));
  if (self->_vehicularDurationExitFromNoHints >= 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("durationExitFromNoHints"));
  vehicularHints = self->_vehicularHints;
  if ((vehicularHints & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_accelDetectionLatency), CFSTR("accel"));
    accelDetectionLatency = self->_accelDetectionLatency;
    vehicularHints = self->_vehicularHints;
  }
  else
  {
    accelDetectionLatency = 1.79769313e308;
  }
  wifiDetectionLatency = accelDetectionLatency;
  if ((vehicularHints & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_wifiDetectionLatency), CFSTR("wifi"));
    if (self->_wifiDetectionLatency >= accelDetectionLatency)
      wifiDetectionLatency = accelDetectionLatency;
    else
      wifiDetectionLatency = self->_wifiDetectionLatency;
    vehicularHints = self->_vehicularHints;
  }
  if ((vehicularHints & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_basebandDetectionLatency), CFSTR("baseband"));
    basebandDetectionLatency = self->_basebandDetectionLatency;
    if (basebandDetectionLatency < accelDetectionLatency)
      accelDetectionLatency = self->_basebandDetectionLatency;
    if (basebandDetectionLatency >= wifiDetectionLatency)
      v7 = wifiDetectionLatency;
    else
      v7 = self->_basebandDetectionLatency;
    vehicularHints = self->_vehicularHints;
  }
  else
  {
    v7 = wifiDetectionLatency;
  }
  gpsDetectionLatency = v7;
  if ((vehicularHints & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_gpsDetectionLatency), CFSTR("gps"));
    if (self->_gpsDetectionLatency >= v7)
      gpsDetectionLatency = v7;
    else
      gpsDetectionLatency = self->_gpsDetectionLatency;
    vehicularHints = self->_vehicularHints;
  }
  if ((vehicularHints & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_btDetectionLatency), CFSTR("bt"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numMotionExitsWithBT), CFSTR("countMotionExitsWithBT"));
    if (self->_vehicularDurationExitFromLastBTHint >= 0.0)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("durationExitFromLastBTHint"));
    if (self->_vehicularDurationLastBTHintFromLastMotionHint >= 0.0)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("durationBTHintFromLastMotionHint"));
  }
  if (wifiDetectionLatency < 1.79769313e308)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", wifiDetectionLatency), CFSTR("accelWifi"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", accelDetectionLatency), CFSTR("accelBaseband"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7), CFSTR("accelWifiBaseband"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", gpsDetectionLatency), CFSTR("accelWifiBasebandGPS"));
  }
  AnalyticsSendEvent(CFSTR("com.apple.carexperience.detectionLatency"), v3);
  if (qword_10229FCB0 != -1)
    dispatch_once(&qword_10229FCB0, &stru_102148B58);
  v10 = qword_10229FCB8;
  if (os_log_type_enabled((os_log_t)qword_10229FCB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138416386;
    v49 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accel"));
    v50 = 2112;
    v51 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gps"));
    v52 = 2112;
    v53 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("baseband"));
    v54 = 2112;
    v55 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wifi"));
    v56 = 2112;
    v57 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bt"));
    v58 = 2112;
    v59 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accelWifi"));
    v60 = 2112;
    v61 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accelBaseband"));
    v62 = 2112;
    v63 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accelWifiBaseband"));
    v64 = 2112;
    v65 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accelWifiBasebandGPS"));
    v66 = 2112;
    v67 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("durationExitFromNoHints"));
    v68 = 2112;
    v69 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("durationExitFromLastBTHint"));
    v70 = 2112;
    v71 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("durationBTHintFromLastMotionHint"));
    v72 = 2112;
    v73 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("countMotionExitsWithBT"));
    v74 = 2112;
    v75 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sequentialVehicularIndex"));
    v76 = 2112;
    v77 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duration"));
    v78 = 2112;
    v79 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hintsAvailable"));
    v80 = 2112;
    v81 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hintsDetected"));
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "VEHICULAR: submitLatencyMetrics, accel, %@, gps, %@, baseband, %@, wifi, %@, bt, %@, accelWifi, %@, accelBaseband, %@, accelWifiBaseband, %@, accelWifiBasebandGPS, %@, exitFromNoHints, %@, durationExitFromLastBTHint, %@, durationBTHintFromLastMotionHint, %@, countMotionExitsWithBT, %@, sequentialVehicularIndex, %@, duration, %@, hintsAvailable, %@, hintsDetected, %@", buf, 0xACu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCB0 != -1)
      dispatch_once(&qword_10229FCB0, &stru_102148B58);
    v13 = qword_10229FCB8;
    v14 = 138416386;
    v15 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accel"));
    v16 = 2112;
    v17 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gps"));
    v18 = 2112;
    v19 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("baseband"));
    v20 = 2112;
    v21 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wifi"));
    v22 = 2112;
    v23 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bt"));
    v24 = 2112;
    v25 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accelWifi"));
    v26 = 2112;
    v27 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accelBaseband"));
    v28 = 2112;
    v29 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accelWifiBaseband"));
    v30 = 2112;
    v31 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accelWifiBasebandGPS"));
    v32 = 2112;
    v33 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("durationExitFromNoHints"));
    v34 = 2112;
    v35 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("durationExitFromLastBTHint"));
    v36 = 2112;
    v37 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("durationBTHintFromLastMotionHint"));
    v38 = 2112;
    v39 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("countMotionExitsWithBT"));
    v40 = 2112;
    v41 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sequentialVehicularIndex"));
    v42 = 2112;
    v43 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duration"));
    v44 = 2112;
    v45 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hintsAvailable"));
    v46 = 2112;
    v47 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hintsDetected"));
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 0, "VEHICULAR: submitLatencyMetrics, accel, %@, gps, %@, baseband, %@, wifi, %@, bt, %@, accelWifi, %@, accelBaseband, %@, accelWifiBaseband, %@, accelWifiBasebandGPS, %@, exitFromNoHints, %@, durationExitFromLastBTHint, %@, durationBTHintFromLastMotionHint, %@, countMotionExitsWithBT, %@, sequentialVehicularIndex, %@, duration, %@, hintsAvailable, %@, hintsDetected, %@", &v14, 172);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLLocationDerivedSpeedEstimator submitLatencyMetrics]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }

}

- ($1AB5FA073B851C12C2339EC22442E995)currentEstimate
{
  double speed;
  double timestamp;
  double uncertainty;
  $1AB5FA073B851C12C2339EC22442E995 result;

  speed = self->_currentEstimate.speed;
  timestamp = self->_currentEstimate.timestamp;
  uncertainty = self->_currentEstimate.uncertainty;
  result.var2 = uncertainty;
  result.var1 = timestamp;
  result.var0 = speed;
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLTimer)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;

  value = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
