@implementation CLCountryTracker

- (void)handleNewLocation:(id)a3
{
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  double v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint8_t buf[8];
  __int128 v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  CLOSTransaction *v20;

  objc_msgSend(a3, "coordinate");
  v6 = v5;
  objc_msgSend(a3, "coordinate");
  v8 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v6, v7);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(a3, "altitude");
    objc_msgSend(v9, "setAltitude:", (int)v10);
    objc_msgSend(a3, "horizontalAccuracy");
    objc_msgSend(v9, "setHorizontalAccuracy:");
    objc_msgSend(a3, "verticalAccuracy");
    objc_msgSend(v9, "setVerticalAccuracy:");
    v11 = objc_msgSend(a3, "referenceFrame");
    if (v11 == 1)
      v12 = 1;
    else
      v12 = 2 * (v11 == 2);
    objc_msgSend(v9, "setReferenceFrame:", v12);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v17 = buf;
    *((_QWORD *)&v17 + 1) = 0x3052000000;
    v18 = sub_100206D5C;
    v19 = sub_100207B14;
    v20 = 0;
    v20 = -[CLOSTransaction initWithDescription:]([CLOSTransaction alloc], "initWithDescription:", "com.apple.locationd.CountryTracker.fetchCountries");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1007AD22C;
    v15[3] = &unk_1021533C8;
    v15[4] = self;
    v15[5] = buf;
    +[GEOGeographicMetadataRequester fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:](GEOGeographicMetadataRequester, "fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:", v9, objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo"), "queue"), v15);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v13 = qword_1022A0188;
    if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v17) = 2082;
      *(_QWORD *)((char *)&v17 + 2) = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"failed to allocate a GEOLocation object?\"}", buf, 0x12u);
      if (qword_1022A0180 != -1)
        dispatch_once(&qword_1022A0180, &stru_1021533E8);
    }
    v14 = qword_1022A0188;
    if (os_signpost_enabled((os_log_t)qword_1022A0188))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v17) = 2082;
      *(_QWORD *)((char *)&v17 + 2) = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to allocate a GEOLocation object?", "{\"msg%{public}.0s\":\"failed to allocate a GEOLocation object?\"}", buf, 0x12u);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
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
  int v16;
  CLTimer *fLocationRequestTimer;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  char *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[12];
  uint8_t buf[64];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[2];
  int v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  int v78;
  uint8_t v79[80];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[28];

  v5 = objc_msgSend(a4, "firstObject", a3);
  if (-[CLCountryTracker locationIsUsable:](self, "locationIsUsable:", v5))
  {
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v6 = qword_1022A0188;
    if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "coordinate");
      v8 = v7;
      objc_msgSend(v5, "coordinate");
      v10 = v9;
      objc_msgSend(v5, "horizontalAccuracy");
      v12 = v11;
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSince1970");
      v14 = v13;
      if (v5)
      {
        objc_msgSend(v5, "clientLocation");
        v15 = *((_QWORD *)&v80 + 1);
        objc_msgSend(v5, "clientLocation");
        v16 = DWORD1(v56);
      }
      else
      {
        v16 = 0;
        v15 = 0;
        v82 = 0u;
        memset(v83, 0, sizeof(v83));
        v80 = 0u;
        v81 = 0u;
        memset(v79, 0, sizeof(v79));
        *(_OWORD *)&v60[-4] = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v51 = 0u;
      }
      *(_DWORD *)buf = 134284801;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2049;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v12;
      *(_WORD *)&buf[32] = 2048;
      *(_QWORD *)&buf[34] = v14;
      *(_WORD *)&buf[42] = 2048;
      *(_QWORD *)&buf[44] = v15;
      *(_WORD *)&buf[52] = 1024;
      *(_DWORD *)&buf[54] = v16;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Got a usable location <%{private}+.8lf,%{private}+.8lf>, acc %.2f, timestamp %.2f, lifespan %.2f, confidence %d", buf, 0x3Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(v79, 0x65CuLL);
      if (qword_1022A0180 != -1)
        dispatch_once(&qword_1022A0180, &stru_1021533E8);
      v39 = qword_1022A0188;
      objc_msgSend(v5, "coordinate");
      v41 = v40;
      objc_msgSend(v5, "coordinate");
      v43 = v42;
      objc_msgSend(v5, "horizontalAccuracy");
      v45 = v44;
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSince1970");
      v47 = v46;
      if (v5)
      {
        objc_msgSend(v5, "clientLocation");
        v48 = *((_QWORD *)&v56 + 1);
        objc_msgSend(v5, "clientLocation");
        v49 = DWORD1(v63);
      }
      else
      {
        v49 = 0;
        *(_OWORD *)&v60[-4] = 0u;
        v48 = 0;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v51 = 0u;
        v65 = 0u;
        memset(v66, 0, 28);
        v63 = 0u;
        v64 = 0u;
        v62 = 0u;
        memset(buf, 0, sizeof(buf));
      }
      v67 = 134284801;
      v68 = v41;
      v69 = 2049;
      v70 = v43;
      v71 = 2048;
      v72 = v45;
      v73 = 2048;
      v74 = v47;
      v75 = 2048;
      v76 = v48;
      v77 = 1024;
      v78 = v49;
      v50 = (char *)_os_log_send_and_compose_impl(2, 0, v79, 1628, &_mh_execute_header, v39, 1, "Got a usable location <%{private}+.8lf,%{private}+.8lf>, acc %.2f, timestamp %.2f, lifespan %.2f, confidence %d", &v67, 58, v51, v52, v53, v54, v55, v56, v57, v58, v59,
                      *(_QWORD *)v60,
                      *(_DWORD *)&v60[8],
                      *(_QWORD *)buf,
                      *(_QWORD *)&buf[8],
                      *(_QWORD *)&buf[16],
                      *(_QWORD *)&buf[24],
                      *(_OWORD *)&buf[32],
                      *(_QWORD *)&buf[48],
                      *(_QWORD *)&buf[56],
                      v62,
                      (_QWORD)v63,
                      *((_QWORD *)&v63 + 1),
                      v64,
                      v65,
                      v66[0],
                      *(_QWORD *)&v66[1],
                      *((_QWORD *)&v66[1] + 1));
      sub_100512490("Generic", 1, 0, 2, "-[CLCountryTracker locationManager:didUpdateLocations:]", "%s\n", v50);
      if (v50 != (char *)v79)
        free(v50);
    }
    fLocationRequestTimer = self->fLocationRequestTimer;
    -[CLCountryTracker timeToRequestCheapActiveLocation](self, "timeToRequestCheapActiveLocation");
    -[CLTimer setNextFireDelay:](fLocationRequestTimer, "setNextFireDelay:");
    if (!self->fAtLeastOneValidLocation)
      goto LABEL_23;
    -[CLCountryTracker calculateDistance:b:](self, "calculateDistance:b:", v5, -[CLCountryTracker previousLocation](self, "previousLocation"));
    v19 = v18;
    objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSince1970");
    v21 = v20;
    -[NSDate timeIntervalSince1970](-[CLLocation timestamp](-[CLCountryTracker previousLocation](self, "previousLocation"), "timestamp"), "timeIntervalSince1970");
    v23 = v22;
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v24 = vabdd_f64(v21, v23);
    v25 = qword_1022A0188;
    if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO))
    {
      -[CLCountryTracker debounceTime](self, "debounceTime");
      v27 = v26;
      -[CLCountryTracker stalenessTime](self, "stalenessTime");
      v29 = v28;
      -[CLLocation coordinate](-[CLCountryTracker previousLocation](self, "previousLocation"), "coordinate");
      v31 = v30;
      -[CLLocation coordinate](-[CLCountryTracker previousLocation](self, "previousLocation"), "coordinate");
      *(_DWORD *)v79 = 68290563;
      *(_DWORD *)&v79[4] = 0;
      *(_WORD *)&v79[8] = 2082;
      *(_QWORD *)&v79[10] = "";
      *(_WORD *)&v79[18] = 2050;
      *(double *)&v79[20] = v19;
      *(_WORD *)&v79[28] = 2050;
      *(double *)&v79[30] = v24;
      *(_WORD *)&v79[38] = 2050;
      *(_QWORD *)&v79[40] = v27;
      *(_WORD *)&v79[48] = 2050;
      *(_QWORD *)&v79[50] = v29;
      *(_WORD *)&v79[58] = 2049;
      *(_QWORD *)&v79[60] = v31;
      *(_WORD *)&v79[68] = 2049;
      *(_QWORD *)&v79[70] = v32;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"computed deltas\", \"deltaR\":\"%{public}f\", \"deltaT\":\"%{public}f\", \"debounceTime\":\"%{public}f\", \"staleTime\":\"%{public}f\", \"prevLat\":\"%{private}f\", \"prevLon\":\"%{private}f\"}", v79, 0x4Eu);
    }
    if (!self->fAtLeastOneValidLocation)
    {
LABEL_23:
      if (qword_1022A0180 != -1)
        dispatch_once(&qword_1022A0180, &stru_1021533E8);
      v38 = qword_1022A0188;
      if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v79 = 68289026;
        *(_DWORD *)&v79[4] = 0;
        *(_WORD *)&v79[8] = 2082;
        *(_QWORD *)&v79[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"first valid location since start!\"}", v79, 0x12u);
      }
      -[CLCountryTracker requestLocationWithDesiredAccuracy:](self, "requestLocationWithDesiredAccuracy:", kCLLocationAccuracyBystander);
      -[CLTimer setNextFireDelay:](self->fActiveLocationDeregisterTimer, "setNextFireDelay:", 1.79769313e308);
      goto LABEL_28;
    }
    -[CLCountryTracker minimumMoveDistance](self, "minimumMoveDistance");
    if (v19 > v33 && (-[CLCountryTracker debounceTime](self, "debounceTime"), v24 >= v34))
    {
      if (qword_1022A0180 != -1)
        dispatch_once(&qword_1022A0180, &stru_1021533E8);
      v36 = qword_1022A0188;
      if (!os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO))
        goto LABEL_28;
      *(_DWORD *)v79 = 68289026;
      *(_DWORD *)&v79[4] = 0;
      *(_WORD *)&v79[8] = 2082;
      *(_QWORD *)&v79[10] = "";
      v37 = "{\"msg%{public}.0s\":\"accepting location because we've moved enough and we're past the debounce time\"}";
    }
    else
    {
      -[CLCountryTracker stalenessTime](self, "stalenessTime");
      if (v24 < v35)
        return;
      if (qword_1022A0180 != -1)
        dispatch_once(&qword_1022A0180, &stru_1021533E8);
      v36 = qword_1022A0188;
      if (!os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO))
        goto LABEL_28;
      *(_DWORD *)v79 = 68289026;
      *(_DWORD *)&v79[4] = 0;
      *(_WORD *)&v79[8] = 2082;
      *(_QWORD *)&v79[10] = "";
      v37 = "{\"msg%{public}.0s\":\"accepting location because it's been long enough without an update\"}";
    }
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v37, v79, 0x12u);
LABEL_28:
    -[CLCountryTracker handleNewLocation:](self, "handleNewLocation:", v5);

    self->_previousLocation = 0;
    self->_previousLocation = (CLLocation *)v5;
    self->fAtLeastOneValidLocation = 1;
    -[CLTimer setNextFireDelay:](self->fLocationUnknownTimeoutTimer, "setNextFireDelay:", 1.79769313e308);
  }
}

- (CLLocation)previousLocation
{
  return self->_previousLocation;
}

- (double)stalenessTime
{
  return self->_stalenessTime;
}

- (double)timeToRequestCheapActiveLocation
{
  return self->_timeToRequestCheapActiveLocation;
}

- (double)minimumMoveDistance
{
  return self->_minimumMoveDistance;
}

- (BOOL)locationIsUsable:(id)a3
{
  double v5;
  uint64_t v6;
  _BOOL4 v7;
  const char *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  NSObject *v20;
  uint32_t v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  _DWORD v32[2];
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint8_t buf[48];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[28];

  objc_msgSend(a3, "horizontalAccuracy");
  if (v5 >= 0.0)
  {
    objc_msgSend(a3, "coordinate");
    v10 = v9;
    objc_msgSend(a3, "coordinate");
    if (sub_10011CE88(v10, v11))
    {
      objc_msgSend(a3, "speed");
      v13 = v12;
      -[CLCountryTracker maximumCountryLocationChangeSpeed](self, "maximumCountryLocationChangeSpeed");
      if (v13 <= v14)
      {
        objc_msgSend(a3, "horizontalAccuracy");
        v23 = v22;
        -[CLCountryTracker maximumCountryLocationChangeAccuracy](self, "maximumCountryLocationChangeAccuracy");
        if (v23 <= v24)
        {
          if (a3)
          {
            objc_msgSend(a3, "clientLocation");
            v28 = DWORD1(v40);
          }
          else
          {
            v28 = 0;
            v42 = 0u;
            memset(v43, 0, sizeof(v43));
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            memset(buf, 0, sizeof(buf));
          }
          if (v28 >= -[CLCountryTracker minimumConfidence](self, "minimumConfidence"))
          {
            if (objc_msgSend(objc_msgSend(a3, "sourceInformation"), "isSimulatedBySoftware")
              && !-[CLCountryTracker allowSimulatedLocations](self, "allowSimulatedLocations"))
            {
              if (qword_1022A0180 != -1)
                dispatch_once(&qword_1022A0180, &stru_1021533E8);
              v6 = qword_1022A0188;
              v7 = os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO);
              if (v7)
              {
                *(_DWORD *)buf = 68289026;
                *(_DWORD *)&buf[4] = 0;
                *(_WORD *)&buf[8] = 2082;
                *(_QWORD *)&buf[10] = "";
                v8 = "{\"msg%{public}.0s\":\"location is simulated, rejecting\"}";
                goto LABEL_16;
              }
            }
            else
            {
              LOBYTE(v7) = 1;
            }
          }
          else
          {
            if (qword_1022A0180 != -1)
              dispatch_once(&qword_1022A0180, &stru_1021533E8);
            v29 = qword_1022A0188;
            v7 = os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO);
            if (v7)
            {
              if (a3)
              {
                objc_msgSend(a3, "clientLocation");
                v30 = DWORD1(v40);
              }
              else
              {
                v30 = 0;
                v42 = 0u;
                memset(v43, 0, sizeof(v43));
                v40 = 0u;
                v41 = 0u;
                v38 = 0u;
                v39 = 0u;
                memset(buf, 0, sizeof(buf));
              }
              v32[0] = 68289282;
              v32[1] = 0;
              v33 = 2082;
              v34 = "";
              v35 = 1026;
              v36 = v30;
              v8 = "{\"msg%{public}.0s\":\"location confidence too low, discarding\", \"confidence\":%{public}d}";
              v19 = (uint8_t *)v32;
              v20 = v29;
              v21 = 24;
              goto LABEL_23;
            }
          }
          return v7;
        }
        if (qword_1022A0180 != -1)
          dispatch_once(&qword_1022A0180, &stru_1021533E8);
        v15 = qword_1022A0188;
        v7 = os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO);
        if (!v7)
          return v7;
        objc_msgSend(a3, "horizontalAccuracy");
        v26 = v25;
        -[CLCountryTracker maximumCountryLocationChangeAccuracy](self, "maximumCountryLocationChangeAccuracy");
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(_QWORD *)&buf[20] = v26;
        *(_WORD *)&buf[28] = 2050;
        *(_QWORD *)&buf[30] = v27;
        v8 = "{\"msg%{public}.0s\":\"location accuracy too low, discarding\", \"accuracy\":\"%{public}f\", \"limit\":\"%{public}f\"}";
      }
      else
      {
        if (qword_1022A0180 != -1)
          dispatch_once(&qword_1022A0180, &stru_1021533E8);
        v15 = qword_1022A0188;
        v7 = os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO);
        if (!v7)
          return v7;
        objc_msgSend(a3, "speed");
        v17 = v16;
        -[CLCountryTracker maximumCountryLocationChangeSpeed](self, "maximumCountryLocationChangeSpeed");
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(_QWORD *)&buf[20] = v17;
        *(_WORD *)&buf[28] = 2050;
        *(_QWORD *)&buf[30] = v18;
        v8 = "{\"msg%{public}.0s\":\"location speed too high, discarding\", \"speed\":\"%{public}f\", \"limit\":\"%{public}f\"}";
      }
      v19 = buf;
      v20 = v15;
      v21 = 38;
      goto LABEL_23;
    }
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v6 = qword_1022A0188;
    v7 = os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO);
    if (v7)
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      v8 = "{\"msg%{public}.0s\":\"location not valid: bad coordinate\"}";
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v6 = qword_1022A0188;
    v7 = os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO);
    if (v7)
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      v8 = "{\"msg%{public}.0s\":\"location not valid: horizontalAccuracy less than zero\"}";
LABEL_16:
      v19 = buf;
      v20 = v6;
      v21 = 18;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v8, v19, v21);
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (int)minimumConfidence
{
  return self->_minimumConfidence;
}

- (double)maximumCountryLocationChangeSpeed
{
  return self->_maximumCountryLocationChangeSpeed;
}

- (double)maximumCountryLocationChangeAccuracy
{
  return self->_maximumCountryLocationChangeAccuracy;
}

- (double)debounceTime
{
  return self->_debounceTime;
}

- (double)calculateDistance:(id)a3 b:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  _OWORD v34[8];
  _OWORD v35[2];
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _OWORD v43[2];
  _BYTE buf[32];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[94];

  if (qword_1022A0180 != -1)
    dispatch_once(&qword_1022A0180, &stru_1021533E8);
  v7 = qword_1022A0188;
  if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a3, "coordinate");
    v9 = v8;
    objc_msgSend(a3, "coordinate");
    v11 = v10;
    objc_msgSend(a4, "coordinate");
    v13 = v12;
    objc_msgSend(a4, "coordinate");
    *(_DWORD *)buf = 134284289;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2049;
    *(_QWORD *)&buf[24] = v13;
    LOWORD(v45) = 2049;
    *(_QWORD *)((char *)&v45 + 2) = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "computing distance between points at <%{private}+.8lf,%{private}+.8lf> and <%{private}+.8lf,%{private}+.8lf>", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v16 = qword_1022A0188;
    objc_msgSend(a3, "coordinate");
    v18 = v17;
    objc_msgSend(a3, "coordinate");
    v20 = v19;
    objc_msgSend(a4, "coordinate");
    v22 = v21;
    objc_msgSend(a4, "coordinate");
    LODWORD(v36[0]) = 134284289;
    *(_QWORD *)((char *)v36 + 4) = v18;
    WORD6(v36[0]) = 2049;
    *(_QWORD *)((char *)v36 + 14) = v20;
    WORD3(v36[1]) = 2049;
    *((_QWORD *)&v36[1] + 1) = v22;
    LOWORD(v37) = 2049;
    *(_QWORD *)((char *)&v37 + 2) = v23;
    v24 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v16, 2, "computing distance between points at <%{private}+.8lf,%{private}+.8lf> and <%{private}+.8lf,%{private}+.8lf>", v36, 42);
    sub_100512490("Generic", 1, 0, 2, "-[CLCountryTracker calculateDistance:b:]", "%s\n", v24);
    if (v24 != buf)
      free(v24);
  }
  if (a3)
  {
    objc_msgSend(a3, "clientLocation");
  }
  else
  {
    v42 = 0u;
    memset(v43, 0, 28);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    memset(v36, 0, sizeof(v36));
  }
  v49 = v41;
  v50 = v42;
  v51[0] = v43[0];
  *(_OWORD *)((char *)v51 + 12) = *(_OWORD *)((char *)v43 + 12);
  v45 = v37;
  v46 = v38;
  v47 = v39;
  v48 = v40;
  *(_OWORD *)buf = v36[0];
  *(_OWORD *)&buf[16] = v36[1];
  if (a4)
  {
    objc_msgSend(a4, "clientLocation");
  }
  else
  {
    v32 = 0u;
    memset(v33, 0, 28);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
  }
  v34[6] = v31;
  v34[7] = v32;
  v35[0] = v33[0];
  *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)v33 + 12);
  v34[2] = v27;
  v34[3] = v28;
  v34[4] = v29;
  v34[5] = v30;
  v34[0] = v25;
  v34[1] = v26;
  sub_10011E258(&self->fDistanceCalc.fM, (uint64_t)buf, (uint64_t)v34);
  return result;
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
  if (qword_102304940 != -1)
    dispatch_once(&qword_102304940, &stru_102153338);
  return (id)qword_102304938;
}

- (CLCountryTracker)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCountryTracker;
  return -[CLCountryTracker initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLCountryTrackerProtocol, &OBJC_PROTOCOL___CLCountryTrackerClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
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
  _QWORD v20[5];
  uint8_t buf[8];
  _WORD v22[6];
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;

  self->fAtLeastOneValidLocation = 0;
  self->fAtLeastOneAuthDetermination = 0;
  self->_previousLocation = 0;
  self->fLocationUnknownTimeoutTimer = 0;
  self->_previousCountryCodeTimeStamp = -1.0;
  self->_previousDisputedState = 0;
  -[CLCountryTracker setSettings:](self, "setSettings:", objc_msgSend(objc_alloc((Class)CLSettingsMirror), "initInUniverse:", -[CLCountryTracker universe](self, "universe")));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1007AC36C;
  v20[3] = &unk_102153360;
  v20[4] = self;
  -[CLSettingsMirror setSettingsChangeHandler:](-[CLCountryTracker settings](self, "settings"), "setSettingsChangeHandler:", v20);
  -[CLCountryTracker refreshSettings](self, "refreshSettings");
  if (qword_1022A0180 != -1)
    dispatch_once(&qword_1022A0180, &stru_1021533E8);
  v3 = qword_1022A0188;
  if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[CLCountryTracker skipUpdatingRegulatoryDomain](self, "skipUpdatingRegulatoryDomain");
    v5 = -[CLCountryTracker allowSimulatedLocations](self, "allowSimulatedLocations");
    v6 = -[CLCountryTracker minimumConfidence](self, "minimumConfidence");
    -[CLCountryTracker maximumCountryLocationChangeSpeed](self, "maximumCountryLocationChangeSpeed");
    v8 = v7;
    -[CLCountryTracker maximumCountryLocationChangeAccuracy](self, "maximumCountryLocationChangeAccuracy");
    v10 = v9;
    -[CLCountryTracker minimumMoveDistance](self, "minimumMoveDistance");
    v12 = v11;
    -[CLCountryTracker debounceTime](self, "debounceTime");
    v14 = v13;
    -[CLCountryTracker stalenessTime](self, "stalenessTime");
    v16 = v15;
    -[CLCountryTracker timeToUnknown](self, "timeToUnknown");
    v18 = v17;
    -[CLCountryTracker timeToActiveGiveup](self, "timeToActiveGiveup");
    *(_DWORD *)buf = 68291586;
    v22[0] = 2082;
    *(_DWORD *)&buf[4] = 0;
    *(_QWORD *)&v22[1] = "";
    v22[5] = 1026;
    v23 = v4;
    v24 = 1026;
    v25 = v5;
    v26 = 1026;
    v27 = v6;
    v28 = 2050;
    v29 = v8;
    v30 = 2050;
    v31 = v10;
    v32 = 2050;
    v33 = v12;
    v34 = 2050;
    v35 = v14;
    v36 = 2050;
    v37 = v16;
    v38 = 2050;
    v39 = v18;
    v40 = 2050;
    v41 = v19;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"settings initialized\", \"SkipUpdatingRegulatoryDomain\":%{public}hhd, \"AllowSimulatedLocations\":%{public}hhd, \"CountryLocationMinimumConfidence\":%{public}d, \"MaximumCountryLocationChangeSpeed\":\"%{public}f\", \"MaximumCountryLocationChangeAccuracy\":\"%{public}f\", \"MinimumMoveDistance\":\"%{public}f\", \"CountryLocationDebounceTime\":\"%{public}f\", \"CountryLocationStalenessTime\":\"%{public}f\", \"TimeToCountryUnknown\":\"%{public}f\", \"TimeToCountryCheapLocation\":\"%{public}f\"}", buf, 0x6Au);
  }
  self->_locManager = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/CountryTracker.bundle"), self, objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo"), "queue"));
  self->_authStatus = 0;
  -[CLCountryTracker universe](self, "universe");
  sub_1001B6A0C();
}

- (void)endService
{
  NSObject *v3;
  Client *value;
  uint64_t v5;
  _QWORD v6[5];
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;

  if (qword_1022A0180 != -1)
    dispatch_once(&qword_1022A0180, &stru_1021533E8);
  v3 = qword_1022A0188;
  if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"shutting down...\"}", buf, 0x12u);
  }
  -[CLCountryTracker requestLocationWithDesiredAccuracy:](self, "requestLocationWithDesiredAccuracy:", kCLLocationAccuracyBystander);
  value = self->fClientManagerClient.__ptr_.__value_;
  self->fClientManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007ACA6C;
  v6[3] = &unk_10212BB58;
  v6[4] = -[CLCountryTracker locManager](self, "locManager");
  objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "silo"), "async:", v6);
  -[CLCountryTracker setLocManager:](self, "setLocManager:", 0);
  if (objc_opt_class(RDStatusShareWrapper, v5))
  {

    self->fShareListener = 0;
  }
  -[CLTimer invalidate](self->fLocationRequestTimer, "invalidate");

  self->fLocationRequestTimer = 0;
  -[CLTimer invalidate](self->fLocationUnknownTimeoutTimer, "invalidate");

  self->fLocationUnknownTimeoutTimer = 0;
  -[CLTimer invalidate](self->fActiveLocationDeregisterTimer, "invalidate");

  self->fActiveLocationDeregisterTimer = 0;
}

- (void)refreshSettings
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  _DWORD v30[2];
  __int16 v31;
  const char *v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  unsigned int v56;

  -[CLSettingsMirror doubleForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "doubleForKey:defaultValue:", CFSTR("MaximumCountryLocationChangeSpeed"), 125.0);
  self->_maximumCountryLocationChangeSpeed = v3;
  -[CLSettingsMirror doubleForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "doubleForKey:defaultValue:", CFSTR("MaximumCountryLocationChangeAccuracy"), 1000.0);
  self->_maximumCountryLocationChangeAccuracy = v4;
  -[CLSettingsMirror doubleForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "doubleForKey:defaultValue:", CFSTR("MinimumMoveDistance"), 5000.0);
  self->_minimumMoveDistance = v5;
  -[CLSettingsMirror doubleForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "doubleForKey:defaultValue:", CFSTR("CountryLocationDebounceTime"), 180.0);
  self->_debounceTime = v6;
  -[CLSettingsMirror doubleForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "doubleForKey:defaultValue:", CFSTR("CountryLocationStalenessTime"), 600.0);
  self->_stalenessTime = v7;
  -[CLSettingsMirror doubleForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "doubleForKey:defaultValue:", CFSTR("TimeToCountryUnknown"), 3600.0);
  self->_timeToUnknown = v8;
  -[CLSettingsMirror doubleForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "doubleForKey:defaultValue:", CFSTR("TimeToCountryCheapLocation"), 10.0);
  self->_timeToActiveGiveup = v9;
  self->_minimumConfidence = -[CLSettingsMirror intForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "intForKey:defaultValue:", CFSTR("CountryLocationMinimumConfidence"), 33);
  self->_skipUpdatingRegulatoryDomain = -[CLSettingsMirror BOOLForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "BOOLForKey:defaultValue:", CFSTR("SkipUpdatingRegulatoryDomain"), 0);
  self->_allowSimulatedLocations = -[CLSettingsMirror BOOLForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "BOOLForKey:defaultValue:", CFSTR("AllowSimulatedLocations"), 0);
  self->_countryCodeDebounceInterval = -[CLSettingsMirror intForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "intForKey:defaultValue:", CFSTR("CountryDebounceInterval"), 10800);
  -[CLSettingsMirror doubleForKey:defaultValue:](-[CLCountryTracker settings](self, "settings"), "doubleForKey:defaultValue:", CFSTR("TimeToRequestCheapActiveLocation"), 1800.0);
  self->_timeToRequestCheapActiveLocation = v10;
  if (qword_1022A0180 != -1)
    dispatch_once(&qword_1022A0180, &stru_1021533E8);
  v11 = qword_1022A0188;
  if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[CLCountryTracker skipUpdatingRegulatoryDomain](self, "skipUpdatingRegulatoryDomain");
    v13 = -[CLCountryTracker allowSimulatedLocations](self, "allowSimulatedLocations");
    v14 = -[CLCountryTracker minimumConfidence](self, "minimumConfidence");
    -[CLCountryTracker maximumCountryLocationChangeSpeed](self, "maximumCountryLocationChangeSpeed");
    v16 = v15;
    -[CLCountryTracker maximumCountryLocationChangeAccuracy](self, "maximumCountryLocationChangeAccuracy");
    v18 = v17;
    -[CLCountryTracker minimumMoveDistance](self, "minimumMoveDistance");
    v20 = v19;
    -[CLCountryTracker debounceTime](self, "debounceTime");
    v22 = v21;
    -[CLCountryTracker stalenessTime](self, "stalenessTime");
    v24 = v23;
    -[CLCountryTracker timeToUnknown](self, "timeToUnknown");
    v26 = v25;
    -[CLCountryTracker timeToActiveGiveup](self, "timeToActiveGiveup");
    v28 = v27;
    -[CLCountryTracker timeToRequestCheapActiveLocation](self, "timeToRequestCheapActiveLocation");
    v30[0] = 68292098;
    v30[1] = 0;
    v31 = 2082;
    v32 = "";
    v33 = 1026;
    v34 = v12;
    v35 = 1026;
    v36 = v13;
    v37 = 1026;
    v38 = v14;
    v39 = 2050;
    v40 = v16;
    v41 = 2050;
    v42 = v18;
    v43 = 2050;
    v44 = v20;
    v45 = 2050;
    v46 = v22;
    v47 = 2050;
    v48 = v24;
    v49 = 2050;
    v50 = v26;
    v51 = 2050;
    v52 = v28;
    v53 = 2050;
    v54 = v29;
    v55 = 1026;
    v56 = -[CLCountryTracker countryCodeDebounceInterval](self, "countryCodeDebounceInterval");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"settings updated\", \"SkipUpdatingRegulatoryDomain\":%{public}hhd, \"AllowSimulatedLocations\":%{public}hhd, \"CountryLocationMinimumConfidence\":%{public}d, \"MaximumCountryLocationChangeSpeed\":\"%{public}f\", \"MaximumCountryLocationChangeAccuracy\":\"%{public}f\", \"MinimumMoveDistance\":\"%{public}f\", \"CountryLocationDebounceTime\":\"%{public}f\", \"CountryLocationStalenessTime\":\"%{public}f\", \"TimeToCountryUnknown\":\"%{public}f\", \"TimeToCountryCheapLocation\":\"%{public}f\", \"TimeToRequestCheapActiveLocation\":\"%{public}f\", \"CountryDebounceInterval\":%{public}d}", (uint8_t *)v30, 0x7Au);
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  self->fAtLeastOneAuthDetermination = 1;
  -[CLCountryTracker setAuthStatus:](self, "setAuthStatus:", objc_msgSend(a3, "authorizationStatus"));
  if (qword_1022A0180 != -1)
    dispatch_once(&qword_1022A0180, &stru_1021533E8);
  v4 = qword_1022A0188;
  if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
  {
    -[CLCountryTracker authStatus](self, "authStatus");
    v5[0] = 68289282;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2050;
    v9 = -[CLCountryTracker authStatus](self, "authStatus");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"authorization status changed\", \"status\":%{public, location:CLAuthorizationStatus}lld}", (uint8_t *)v5, 0x1Cu);
  }
  -[CLCountryTracker checkLocationServicesStatus](self, "checkLocationServicesStatus");
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  NSObject *v6;
  CLTimer *fLocationUnknownTimeoutTimer;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  if (qword_1022A0180 != -1)
    dispatch_once(&qword_1022A0180, &stru_1021533E8);
  v6 = qword_1022A0188;
  if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2082;
    v12 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Got location unavailable\", \"error\":%{public, location:escape_only}s}", (uint8_t *)v8, 0x1Cu);
  }
  if (self->fAtLeastOneValidLocation)
  {
    fLocationUnknownTimeoutTimer = self->fLocationUnknownTimeoutTimer;
    -[CLCountryTracker timeToUnknown](self, "timeToUnknown");
    -[CLTimer setNextFireDelay:](fLocationUnknownTimeoutTimer, "setNextFireDelay:");
  }
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)sendUpdateToRDIfAllowed:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (&_RDUpdateCountryCodeInfoFromLocation)
  {
    if (-[CLCountryTracker skipUpdatingRegulatoryDomain](self, "skipUpdatingRegulatoryDomain"))
    {
      if (qword_1022A0180 != -1)
        dispatch_once(&qword_1022A0180, &stru_1021533E8);
      v4 = qword_1022A0188;
      if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_INFO))
      {
        v5[0] = 68289026;
        v5[1] = 0;
        v6 = 2082;
        v7 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"skipping country code update because of setting\"}", (uint8_t *)v5, 0x12u);
      }
    }
    else
    {
      RDUpdateCountryCodeInfoFromLocation(a3);
    }
  }
}

- (BOOL)countriesAreUnchanged:(id)a3
{
  BOOL result;
  NSArray *v6;
  id v7;
  id v8;
  unsigned __int8 v9;

  if (!((unint64_t)a3 | (unint64_t)-[CLCountryTracker previousCountries](self, "previousCountries")))
    return 1;
  v6 = -[CLCountryTracker previousCountries](self, "previousCountries");
  result = 0;
  if (a3)
  {
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", -[CLCountryTracker previousCountries](self, "previousCountries"));
      v8 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", a3);
      v9 = objc_msgSend(v7, "isEqualToSet:", v8);

      return v9;
    }
  }
  return result;
}

- (void)updateLocationUnknown
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0180 != -1)
    dispatch_once(&qword_1022A0180, &stru_1021533E8);
  v3 = qword_1022A0188;
  if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"setting country code from location to be unknown\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLCountryTracker sendUpdateToRDIfAllowed:](self, "sendUpdateToRDIfAllowed:", 0);
}

- (void)onLocationUnknownTimer
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0180 != -1)
    dispatch_once(&qword_1022A0180, &stru_1021533E8);
  v3 = qword_1022A0188;
  if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"no known location received beyond the time limit\"}", (uint8_t *)v4, 0x12u);
  }
  self->fAtLeastOneValidLocation = 0;

  self->_previousLocation = 0;
  self->_previousCountries = 0;
  -[CLCountryTracker updateLocationUnknown](self, "updateLocationUnknown");
  -[CLTimer setNextFireDelay:](self->fLocationUnknownTimeoutTimer, "setNextFireDelay:", 1.79769313e308);
}

- (void)requestLocationWithDesiredAccuracy:(double)a3
{
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (kCLLocationAccuracyBystander == a3)
  {
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v9 = qword_1022A0188;
    if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 68289026;
      *(_WORD *)v11 = 2082;
      *(_QWORD *)&v11[2] = "";
      v6 = "{\"msg%{public}.0s\":\"registering for bystander location updates\"}";
      v7 = v9;
      v8 = 18;
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v5 = qword_1022A0188;
    if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 68289282;
      *(_WORD *)v11 = 2082;
      *(_QWORD *)&v11[2] = "";
      *(_WORD *)&v11[10] = 2050;
      *(double *)&v11[12] = a3;
      v6 = "{\"msg%{public}.0s\":\"registering for active location updates\", \"accuracy\":\"%{public}f\"}";
      v7 = v5;
      v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  -[CLLocationManager setDesiredAccuracy:](self->_locManager, "setDesiredAccuracy:", a3, v10, *(_OWORD *)v11, *(_QWORD *)&v11[16]);
}

- (void)checkLocationServicesStatus
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (sub_10019CFA0() != 1)
  {
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v3 = qword_1022A0188;
    if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      v5 = 2082;
      v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"location services are disabled, stopping updates\"}", (uint8_t *)v4, 0x12u);
    }
    goto LABEL_9;
  }
  if (self->fAtLeastOneAuthDetermination && -[CLCountryTracker authStatus](self, "authStatus") != 3)
  {
LABEL_9:
    -[CLCountryTracker updateLocationUnknown](self, "updateLocationUnknown");
    -[CLCountryTracker requestLocationWithDesiredAccuracy:](self, "requestLocationWithDesiredAccuracy:", kCLLocationAccuracyBystander);
    self->fAtLeastOneValidLocation = 0;

    self->_previousLocation = 0;
    self->_previousCountries = 0;
  }
}

- (void)onManagerNotification:(const int *)a3 data:(const void *)a4
{
  NSObject *v5;
  id v6;
  uint64_t *v7;
  const char *v8;
  uint8_t *v9;
  _WORD v10[8];
  uint8_t buf[1640];

  if (*a3 == 4)
  {
    -[CLCountryTracker checkLocationServicesStatus](self, "checkLocationServicesStatus");
  }
  else if (!*a3)
  {
    if (qword_1022A0180 != -1)
      dispatch_once(&qword_1022A0180, &stru_1021533E8);
    v5 = qword_1022A0188;
    if (os_log_type_enabled((os_log_t)qword_1022A0188, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Warning location status reset; removing all clients",
        buf,
        2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0180 != -1)
        dispatch_once(&qword_1022A0180, &stru_1021533E8);
      v10[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0188, 0, "#Warning location status reset; removing all clients",
        v10,
        2);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLCountryTracker onManagerNotification:data:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }

    self->_previousLocation = 0;
    -[CLCountryTracker updateLocationUnknown](self, "updateLocationUnknown");
    v6 = objc_msgSend(objc_msgSend(-[CLCountryTracker universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLClientManager"));
    if (byte_102304937 >= 0)
      v7 = &qword_102304920;
    else
      v7 = (uint64_t *)qword_102304920;
    objc_msgSend(v6, "resetNotificationConsumedForIdentifier:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
  }
}

- (CLSettingsMirror)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (void)setMinimumConfidence:(int)a3
{
  self->_minimumConfidence = a3;
}

- (void)setMaximumCountryLocationChangeSpeed:(double)a3
{
  self->_maximumCountryLocationChangeSpeed = a3;
}

- (void)setMaximumCountryLocationChangeAccuracy:(double)a3
{
  self->_maximumCountryLocationChangeAccuracy = a3;
}

- (void)setMinimumMoveDistance:(double)a3
{
  self->_minimumMoveDistance = a3;
}

- (void)setDebounceTime:(double)a3
{
  self->_debounceTime = a3;
}

- (void)setStalenessTime:(double)a3
{
  self->_stalenessTime = a3;
}

- (double)timeToUnknown
{
  return self->_timeToUnknown;
}

- (void)setTimeToUnknown:(double)a3
{
  self->_timeToUnknown = a3;
}

- (double)timeToActiveGiveup
{
  return self->_timeToActiveGiveup;
}

- (void)setTimeToActiveGiveup:(double)a3
{
  self->_timeToActiveGiveup = a3;
}

- (BOOL)skipUpdatingRegulatoryDomain
{
  return self->_skipUpdatingRegulatoryDomain;
}

- (void)setSkipUpdatingRegulatoryDomain:(BOOL)a3
{
  self->_skipUpdatingRegulatoryDomain = a3;
}

- (BOOL)allowSimulatedLocations
{
  return self->_allowSimulatedLocations;
}

- (void)setAllowSimulatedLocations:(BOOL)a3
{
  self->_allowSimulatedLocations = a3;
}

- (int)countryCodeDebounceInterval
{
  return self->_countryCodeDebounceInterval;
}

- (void)setCountryCodeDebounceInterval:(int)a3
{
  self->_countryCodeDebounceInterval = a3;
}

- (void)setTimeToRequestCheapActiveLocation:(double)a3
{
  self->_timeToRequestCheapActiveLocation = a3;
}

- (CLLocationManager)locManager
{
  return self->_locManager;
}

- (void)setLocManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (void)setPreviousLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSArray)previousCountries
{
  return self->_previousCountries;
}

- (void)setPreviousCountries:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (BOOL)previousDisputedState
{
  return self->_previousDisputedState;
}

- (void)setPreviousDisputedState:(BOOL)a3
{
  self->_previousDisputedState = a3;
}

- (double)previousCountryCodeTimeStamp
{
  return self->_previousCountryCodeTimeStamp;
}

- (void)setPreviousCountryCodeTimeStamp:(double)a3
{
  self->_previousCountryCodeTimeStamp = a3;
}

- (int)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(int)a3
{
  self->_authStatus = a3;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->fClientManagerClient.__ptr_.__value_;
  self->fClientManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  sub_1002433B8((uint64_t)&self->fDistanceCalc);
  self->fClientManagerClient.__ptr_.__value_ = 0;
  return self;
}

@end
