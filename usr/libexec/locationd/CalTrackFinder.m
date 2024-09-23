@implementation CalTrackFinder

- (CalTrackFinder)init
{
  char *v2;
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  objc_super v8;
  uint8_t buf[1640];

  v8.receiver = self;
  v8.super_class = (Class)CalTrackFinder;
  v2 = -[CalTrackFinder init](&v8, "init");
  if (v2)
  {
    *((_QWORD *)v2 + 3) = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 5);
    *((_QWORD *)v2 + 4) = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2048);
    *((_QWORD *)v2 + 5) = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2048);
    *((_QWORD *)v2 + 6) = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1024);
    *((_DWORD *)v2 + 2) = 0;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *((_QWORD *)v2 + 13) = 0;
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
    v3 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "initialize", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "initialize", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder init]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
  return (CalTrackFinder *)v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalTrackFinder;
  -[CalTrackFinder dealloc](&v3, "dealloc");
}

- (void)stop
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
  v3 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CloseTrack,Stop", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,Stop", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder stop]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
}

- (void)updateGpsLocationBuffer:(id)a3 gpsSource:(int)a4
{
  uint64_t v4;
  NSObject *v7;
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
  uint64_t v22;
  double v23;
  NSObject *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint8_t *v43;
  uint64_t v44;
  unsigned int v45;
  const char *v46;
  uint8_t *v47;
  uint64_t v48;
  int v49;
  const char *v50;
  __int16 v51;
  _BYTE v52[14];
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  int v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  _BYTE v72[14];
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  int v88;

  v4 = *(_QWORD *)&a4;
  if (qword_1022A02F0 != -1)
    dispatch_once(&qword_1022A02F0, &stru_10219C600);
  v7 = qword_1022A02F8;
  if (os_log_type_enabled((os_log_t)qword_1022A02F8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a3, "coordinate");
    v9 = v8;
    objc_msgSend(a3, "coordinate");
    v11 = v10;
    objc_msgSend(a3, "horizontalAccuracy");
    v13 = v12;
    objc_msgSend(a3, "speed");
    v15 = v14;
    objc_msgSend(a3, "course");
    v17 = v16;
    objc_msgSend(a3, "altitude");
    v19 = v18;
    objc_msgSend(a3, "verticalAccuracy");
    v21 = v20;
    objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 136317698;
    v70 = "CL-GPS-UnfilteredMultipleSources";
    v71 = 1024;
    *(_DWORD *)v72 = 1;
    *(_WORD *)&v72[4] = 2048;
    *(_QWORD *)&v72[6] = v9;
    v73 = 2048;
    v74 = v11;
    v75 = 2048;
    v76 = v13;
    v77 = 2048;
    v78 = v15;
    v79 = 2048;
    v80 = v17;
    v81 = 2048;
    v82 = v19;
    v83 = 2048;
    v84 = v21;
    v85 = 2048;
    v86 = v22;
    v87 = 1024;
    v88 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestamp,%0.3f,Source,%d", buf, 0x68u);
  }
  if (sub_1001BFF7C(117, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02F0 != -1)
      dispatch_once(&qword_1022A02F0, &stru_10219C600);
    v26 = qword_1022A02F8;
    objc_msgSend(a3, "coordinate");
    v28 = v27;
    objc_msgSend(a3, "coordinate");
    v30 = v29;
    objc_msgSend(a3, "horizontalAccuracy");
    v32 = v31;
    objc_msgSend(a3, "speed");
    v34 = v33;
    objc_msgSend(a3, "course");
    v36 = v35;
    objc_msgSend(a3, "altitude");
    v38 = v37;
    objc_msgSend(a3, "verticalAccuracy");
    v40 = v39;
    objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceReferenceDate");
    v49 = 136317698;
    v50 = "CL-GPS-UnfilteredMultipleSources";
    v51 = 1024;
    *(_DWORD *)v52 = 1;
    *(_WORD *)&v52[4] = 2048;
    *(_QWORD *)&v52[6] = v28;
    v53 = 2048;
    v54 = v30;
    v55 = 2048;
    v56 = v32;
    v57 = 2048;
    v58 = v34;
    v59 = 2048;
    v60 = v36;
    v61 = 2048;
    v62 = v38;
    v63 = 2048;
    v64 = v40;
    v65 = 2048;
    v66 = v41;
    v67 = 1024;
    v68 = v4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v26, 2, "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestamp,%0.3f,Source,%d", (const char *)&v49, 104);
    v43 = (uint8_t *)v42;
    sub_100512490("LOCATION", 1, 0, 2, "-[CalTrackFinder updateGpsLocationBuffer:gpsSource:]", "%s\n", v42);
    if (v43 != buf)
      free(v43);
  }
  if (!-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count")
    || (objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "lastObject"), "timestamp")), v23 >= 0.01))
  {
    -[CalTrackFinder setTimeEndGpsLocationSegment:](self, "setTimeEndGpsLocationSegment:", objc_msgSend(a3, "timestamp"));
    if (-[CalTrackFinder gpsSource](self, "gpsSource") != (_DWORD)v4)
    {
      if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count"))
        -[NSMutableArray removeAllObjects](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "removeAllObjects");
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v24 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        v25 = -[CalTrackFinder gpsSource](self, "gpsSource");
        *(_DWORD *)buf = 134218240;
        v70 = (const char *)v25;
        v71 = 2048;
        *(_QWORD *)v72 = v4;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsSourceChange,GpsSourceOld,%ld,GpsSourceNew,%ld", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
        v44 = qword_10229FCD8;
        v45 = -[CalTrackFinder gpsSource](self, "gpsSource");
        v49 = 134218240;
        v50 = (const char *)v45;
        v51 = 2048;
        *(_QWORD *)v52 = v4;
        LODWORD(v48) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v44, 2, "CloseTrack,GpsSourceChange,GpsSourceOld,%ld,GpsSourceNew,%ld", &v49, v48);
        v47 = (uint8_t *)v46;
        sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder updateGpsLocationBuffer:gpsSource:]", "%s\n", v46);
        if (v47 != buf)
          free(v47);
      }
      -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
    }
    -[CalTrackFinder setGpsSource:](self, "setGpsSource:", v4);
    if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count") == (id)5)
      -[NSMutableArray removeObjectAtIndex:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "removeObjectAtIndex:", 0);
    if (!-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count"))
      -[CalTrackFinder setTimeStartGpsLocationSegment:](self, "setTimeStartGpsLocationSegment:", objc_msgSend(a3, "timestamp"));
    -[NSMutableArray addObject:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "addObject:", a3);
    -[CalTrackFinder _closeTrackCheckGpsLocation](self, "_closeTrackCheckGpsLocation");
    if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count") == (id)5)
      -[CalTrackFinder _updateGpsLocationBufferFiltered:](self, "_updateGpsLocationBufferFiltered:", -[CalTrackFinder _filterGpsLocationBuffer](self, "_filterGpsLocationBuffer"));
  }
}

- (void)_updateGpsLocationBufferFiltered:(id)a3
{
  double v5;

  if (!-[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count")
    || (objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "lastObject"), "timestamp")), v5 >= 0.01))
  {
    -[NSMutableArray addObject:](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "addObject:", a3);
    -[CalTrackFinder _closeTrackCheckGpsLocationFiltered](self, "_closeTrackCheckGpsLocationFiltered");
  }
}

- (void)updateGpsOdometerBuffer:(CLOdometerEntry *)a3
{
  NSMutableArray *v5;
  NSDate *v6;
  double v7;
  CMGpsOdometerEntry *v8;
  __int128 v9;
  CLOdometerTrackProximityInfo trackProximityInfo;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CMGpsOdometerEntry *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  _OWORD v19[12];
  int v20;
  NSDate *v21;
  uint8_t buf[4];
  NSDate *v23;

  v5 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
  objc_sync_enter(v5);
  if (-[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count")
    && (v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->startTime), -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"), "date")), v7 < 0.01))
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
    v16 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Suppressing duplicate GPS Odometer Entry from CalTrack %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v20 = 138412290;
      v21 = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 1, "Suppressing duplicate GPS Odometer Entry from CalTrack %@", &v20, 12);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder updateGpsOdometerBuffer:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    objc_sync_exit(v5);
  }
  else
  {
    v8 = [CMGpsOdometerEntry alloc];
    v9 = *(_OWORD *)&a3->slope;
    v19[8] = *(_OWORD *)&a3->gpsCourseRadians;
    v19[9] = v9;
    trackProximityInfo = a3->trackProximityInfo;
    v19[10] = *(_OWORD *)&a3->batchedLocationFixType;
    v19[11] = trackProximityInfo;
    v11 = *(_OWORD *)&a3->quality;
    v19[4] = *(_OWORD *)&a3->timestampGps;
    v19[5] = v11;
    v12 = *(_OWORD *)&a3->smoothedGPSAltitude;
    v19[6] = *(_OWORD *)&a3->groundAltitude;
    v19[7] = v12;
    v13 = *(_OWORD *)&a3->accuracy;
    v19[0] = *(_OWORD *)&a3->startTime;
    v19[1] = v13;
    v14 = *(_OWORD *)&a3->odometer;
    v19[2] = *(_OWORD *)&a3->speed;
    v19[3] = v14;
    v15 = -[CMGpsOdometerEntry initWithOdometerEntry:](v8, "initWithOdometerEntry:", v19);
    -[NSMutableArray addObject:](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "addObject:", v15);

    objc_sync_exit(v5);
    -[CalTrackFinder _closeTrackCheckGpsOdometer](self, "_closeTrackCheckGpsOdometer");
  }
}

- (void)updatePedometerBuffer:(CLExtendedStepCountEntry *)a3
{
  double v5;
  CMPedometerEntry *v6;
  CMPedometerEntry *v7;
  _BYTE v8[320];

  if (a3->addition.firstStepTime >= 0.01 && a3->addition.lastStepTime >= 0.01)
  {
    if (!-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count")
      || (-[NSDate timeIntervalSinceDate:](+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->base.startTime), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"), "date")), v5 >= 0.01))
    {
      v6 = [CMPedometerEntry alloc];
      memcpy(v8, a3, sizeof(v8));
      v7 = -[CMPedometerEntry initWithStepEntry:](v6, "initWithStepEntry:", v8);
      -[NSMutableArray addObject:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "addObject:", v7);

      -[CalTrackFinder _closeTrackCheckPedometer](self, "_closeTrackCheckPedometer");
    }
  }
}

- (id)_filterGpsLocationBuffer
{
  id v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint8_t *v56;
  int v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
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
  unsigned int v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  unsigned int v100;
  _QWORD v101[5];
  _QWORD v102[5];

  v3 = -[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "objectAtIndexedSubscript:", 2);
  for (i = 0; i != 5; ++i)
  {
    objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "objectAtIndexedSubscript:", i), "coordinate");
    v102[i] = v5;
    objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "objectAtIndexedSubscript:", i), "coordinate");
    v101[i] = v6;
  }
  -[CalTrackFinder _extremaRemovedMean:](self, "_extremaRemovedMean:", v102);
  v8 = v7;
  -[CalTrackFinder _extremaRemovedMean:](self, "_extremaRemovedMean:", v101);
  v10 = v9;
  v11 = objc_alloc((Class)CLLocation);
  objc_msgSend(v3, "altitude");
  v13 = v12;
  objc_msgSend(v3, "horizontalAccuracy");
  v15 = v14;
  objc_msgSend(v3, "verticalAccuracy");
  v17 = v16;
  objc_msgSend(v3, "course");
  v19 = v18;
  objc_msgSend(v3, "speed");
  v21 = objc_msgSend(v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", objc_msgSend(v3, "timestamp"), v8, v10, v13, v15, v17, v19, v20);
  if (qword_1022A02F0 != -1)
    dispatch_once(&qword_1022A02F0, &stru_10219C600);
  v22 = qword_1022A02F8;
  if (os_log_type_enabled((os_log_t)qword_1022A02F8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v21, "coordinate");
    v24 = v23;
    objc_msgSend(v21, "coordinate");
    v26 = v25;
    objc_msgSend(v21, "horizontalAccuracy");
    v28 = v27;
    objc_msgSend(v21, "speed");
    v30 = v29;
    objc_msgSend(v21, "course");
    v32 = v31;
    objc_msgSend(v21, "altitude");
    v34 = v33;
    objc_msgSend(v21, "verticalAccuracy");
    v36 = v35;
    objc_msgSend(objc_msgSend(v21, "timestamp"), "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 136317698;
    v80 = "CL-GPS-Filtered";
    v81 = 1024;
    v82 = 1;
    v83 = 2048;
    v84 = v24;
    v85 = 2048;
    v86 = v26;
    v87 = 2048;
    v88 = v28;
    v89 = 2048;
    v90 = v30;
    v91 = 2048;
    v92 = v32;
    v93 = 2048;
    v94 = v34;
    v95 = 2048;
    v96 = v36;
    v97 = 2048;
    v98 = v37;
    v99 = 1024;
    v100 = -[CalTrackFinder gpsSource](self, "gpsSource");
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestamp,%0.3f,Source,%d", buf, 0x68u);
  }
  if (sub_1001BFF7C(117, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02F0 != -1)
      dispatch_once(&qword_1022A02F0, &stru_10219C600);
    v39 = qword_1022A02F8;
    objc_msgSend(v21, "coordinate");
    v41 = v40;
    objc_msgSend(v21, "coordinate");
    v43 = v42;
    objc_msgSend(v21, "horizontalAccuracy");
    v45 = v44;
    objc_msgSend(v21, "speed");
    v47 = v46;
    objc_msgSend(v21, "course");
    v49 = v48;
    objc_msgSend(v21, "altitude");
    v51 = v50;
    objc_msgSend(v21, "verticalAccuracy");
    v53 = v52;
    objc_msgSend(objc_msgSend(v21, "timestamp"), "timeIntervalSinceReferenceDate");
    v57 = 136317698;
    v58 = "CL-GPS-Filtered";
    v59 = 1024;
    v60 = 1;
    v61 = 2048;
    v62 = v41;
    v63 = 2048;
    v64 = v43;
    v65 = 2048;
    v66 = v45;
    v67 = 2048;
    v68 = v47;
    v69 = 2048;
    v70 = v49;
    v71 = 2048;
    v72 = v51;
    v73 = 2048;
    v74 = v53;
    v75 = 2048;
    v76 = v54;
    v77 = 1024;
    v78 = -[CalTrackFinder gpsSource](self, "gpsSource");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v39, 2, "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestamp,%0.3f,Source,%d", (const char *)&v57, 104);
    v56 = (uint8_t *)v55;
    sub_100512490("LOCATION", 1, 0, 2, "-[CalTrackFinder _filterGpsLocationBuffer]", "%s\n", v55);
    if (v56 != buf)
      free(v56);
  }
  return v21;
}

- (double)_extremaRemovedMean:(double)a3[5]
{
  uint64_t v3;
  int v4;
  int v5;
  double v6;
  uint64_t v7;
  double v8;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = a3[v3];
    if (v6 >= a3[v5])
      v5 = v3;
    if (v6 < a3[v4])
      v4 = v3;
    ++v3;
  }
  while (v3 != 5);
  v7 = 0;
  a3[v5] = 0.0;
  a3[v4] = 0.0;
  v8 = 0.0;
  do
    v8 = v8 + a3[v7++];
  while (v7 != 5);
  return v8 / 3.0;
}

- (void)_calculateTimeStartEndDistanceGpsPed
{
  NSArray *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  NSArray *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSEnumerator *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  NSMutableArray *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *k;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
  double v51;
  double v52;
  double v53;
  id v54;
  uint64_t v55;
  void *m;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  NSArray *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];

  -[CalTrackFinder setTimeStart:](self, "setTimeStart:", 0);
  -[CalTrackFinder setTimeEnd:](self, "setTimeEnd:", 0);
  -[CalTrackFinder setDistanceGps:](self, "setDistanceGps:", 0.0);
  -[CalTrackFinder setDistanceRawPed:](self, "setDistanceRawPed:", 0.0);
  -[CalTrackFinder setSteps:](self, "setSteps:", 0.0);
  v3 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"));
  if (-[NSArray count](v3, "count"))
  {
    v4 = objc_msgSend(-[NSArray firstObject](v3, "firstObject"), "firstStepTime");
    v5 = objc_msgSend(-[NSArray lastObject](v3, "lastObject"), "lastStepTime");
    if (v4)
    {
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v4, "timeIntervalSinceReferenceDate");
        v8 = v7;
        objc_msgSend(v6, "timeIntervalSinceReferenceDate");
        if (v8 < v9)
        {
          v10 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"));
          if (-[NSArray count](v10, "count"))
          {
            v91 = 0u;
            v92 = 0u;
            v89 = 0u;
            v90 = 0u;
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
            if (v11)
            {
              v12 = *(_QWORD *)v90;
              while (2)
              {
                for (i = 0; i != v11; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v90 != v12)
                    objc_enumerationMutation(v10);
                  v14 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(objc_msgSend(v14, "timestamp"), "timeIntervalSinceReferenceDate");
                  v16 = v15;
                  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
                  if (v16 >= v17)
                  {
                    objc_msgSend(objc_msgSend(v14, "timestamp"), "timeIntervalSinceReferenceDate");
                    v19 = v18;
                    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
                    if (v19 <= v20)
                    {
                      v11 = objc_msgSend(v14, "timestamp");
                      goto LABEL_17;
                    }
                  }
                }
                v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
                if (v11)
                  continue;
                break;
              }
            }
LABEL_17:
            v87 = 0u;
            v88 = 0u;
            v85 = 0u;
            v86 = 0u;
            v21 = -[NSArray reverseObjectEnumerator](v10, "reverseObjectEnumerator");
            v22 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v86;
              v76 = v3;
              while (2)
              {
                for (j = 0; j != v23; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v86 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)j);
                  objc_msgSend(objc_msgSend(v26, "timestamp"), "timeIntervalSinceReferenceDate");
                  v28 = v27;
                  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
                  if (v28 >= v29)
                  {
                    objc_msgSend(objc_msgSend(v26, "timestamp"), "timeIntervalSinceReferenceDate");
                    v31 = v30;
                    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
                    if (v31 <= v32)
                    {
                      v33 = objc_msgSend(v26, "timestamp");
                      if (v11)
                      {
                        v34 = v33;
                        if (v33)
                        {
                          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
                          v36 = v35;
                          objc_msgSend(v34, "timeIntervalSinceReferenceDate");
                          if (v36 < v37)
                          {
                            v38 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2048);
                            v81 = 0u;
                            v82 = 0u;
                            v83 = 0u;
                            v84 = 0u;
                            v39 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
                            if (v39)
                            {
                              v40 = v39;
                              v41 = *(_QWORD *)v82;
                              do
                              {
                                for (k = 0; k != v40; k = (char *)k + 1)
                                {
                                  if (*(_QWORD *)v82 != v41)
                                    objc_enumerationMutation(v10);
                                  v43 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)k);
                                  objc_msgSend(objc_msgSend(v43, "timestamp"), "timeIntervalSinceReferenceDate");
                                  v45 = v44;
                                  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
                                  if (v45 >= v46)
                                  {
                                    objc_msgSend(objc_msgSend(v43, "timestamp"), "timeIntervalSinceReferenceDate");
                                    v48 = v47;
                                    objc_msgSend(v34, "timeIntervalSinceReferenceDate");
                                    if (v48 <= v49)
                                      -[NSMutableArray addObject:](v38, "addObject:", v43);
                                  }
                                }
                                v40 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
                              }
                              while (v40);
                            }
                            if ((unint64_t)-[NSMutableArray count](v38, "count") >= 2)
                            {
                              +[CLPolygonSimplifier simplifiedLength:threshold:](CLPolygonSimplifier, "simplifiedLength:threshold:", v38, 6.7);
                              -[CalTrackFinder setDistanceGps:](self, "setDistanceGps:");
                              -[CalTrackFinder setTimeStart:](self, "setTimeStart:", v11);
                              -[CalTrackFinder setTimeEnd:](self, "setTimeEnd:", v34);
                              v79 = 0u;
                              v80 = 0u;
                              v77 = 0u;
                              v78 = 0u;
                              v50 = -[NSArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
                              v51 = 0.0;
                              v52 = 0.0;
                              v53 = 0.0;
                              if (v50)
                              {
                                v54 = v50;
                                v55 = *(_QWORD *)v78;
                                do
                                {
                                  for (m = 0; m != v54; m = (char *)m + 1)
                                  {
                                    if (*(_QWORD *)v78 != v55)
                                      objc_enumerationMutation(v76);
                                    v57 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)m);
                                    objc_msgSend(objc_msgSend(v57, "firstStepTime"), "timeIntervalSinceReferenceDate");
                                    v59 = v58;
                                    -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeStart](self, "timeStart"), "timeIntervalSinceReferenceDate");
                                    if (v59 >= v60)
                                    {
                                      objc_msgSend(objc_msgSend(v57, "lastStepTime"), "timeIntervalSinceReferenceDate");
                                      v62 = v61;
                                      -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeEnd](self, "timeEnd"), "timeIntervalSinceReferenceDate");
                                      if (v62 <= v63)
                                      {
                                        objc_msgSend(v57, "speedCurrent");
                                        v65 = v64;
                                        objc_msgSend(v57, "deltaActiveTime");
                                        v51 = v51 + v65 * v66;
                                        objc_msgSend(v57, "deltaActiveTime");
                                        v52 = v52 + v67;
                                        objc_msgSend(v57, "stepCadenceCurrent");
                                        v69 = v68;
                                        objc_msgSend(v57, "deltaActiveTime");
                                        v53 = v53 + v69 * v70;
                                      }
                                    }
                                  }
                                  v54 = -[NSArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
                                }
                                while (v54);
                              }
                              -[NSDate timeIntervalSinceDate:](-[CalTrackFinder timeEnd](self, "timeEnd"), "timeIntervalSinceDate:", -[CalTrackFinder timeStart](self, "timeStart"));
                              if (v52 <= 0.01)
                                v72 = 0.0;
                              else
                                v72 = v51 / v52;
                              v73 = v72 * v71;
                              if (v52 <= 0.01)
                                v74 = 0.0;
                              else
                                v74 = v53 / v52;
                              -[CalTrackFinder setDistanceRawPed:](self, "setDistanceRawPed:", v73);
                              -[NSDate timeIntervalSinceDate:](-[CalTrackFinder timeEnd](self, "timeEnd"), "timeIntervalSinceDate:", -[CalTrackFinder timeStart](self, "timeStart"));
                              -[CalTrackFinder setSteps:](self, "setSteps:", v74 * v75);
                            }
                          }
                        }
                      }
                      return;
                    }
                  }
                }
                v23 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
                if (v23)
                  continue;
                break;
              }
            }
          }
        }
      }
    }
  }
}

- (void)_closeTrackCheckGpsLocation
{
  double v3;
  double v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  double v9;
  uint8_t buf[4];
  double v11;

  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count") >= 2)
  {
    objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "lastObject"), "timestamp"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count") - 2), "timestamp"));
    v4 = v3;
    if (v3 > 2.5)
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v5 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsLocationEntryTimeOut,TimeSinceLastEntry,%0.2f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
        v8 = 134217984;
        v9 = v4;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,GpsLocationEntryTimeOut,TimeSinceLastEntry,%0.2f", COERCE_DOUBLE(&v8));
        v7 = (uint8_t *)v6;
        sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsLocation]", "%s\n", v6);
        if (v7 != buf)
          free(v7);
      }
      -[NSMutableArray removeAllObjects](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "removeAllObjects");
      -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
    }
  }
}

- (void)_closeTrackCheckGpsLocationFiltered
{
  double v3;
  double v4;
  NSObject *v5;
  const char *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  uint8_t *v14;
  _DWORD v15[4];
  uint8_t buf[4];
  double v17;

  if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count"))
  {
    objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "lastObject"), "horizontalAccuracy");
    v4 = v3;
    if (v3 > 24.0)
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v5 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsFilteredHorizontalAccuracyOutOfBounds,HorizontalAccuracy,%0.2f", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_29;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,GpsFilteredHorizontalAccuracyOutOfBounds,HorizontalAccuracy,%0.2f");
LABEL_35:
      v14 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsLocationFiltered]", "%s\n", v6);
      if (v14 != buf)
        free(v14);
LABEL_29:
      -[NSMutableArray removeLastObject](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "removeLastObject");
      goto LABEL_30;
    }
  }
  if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count"))
  {
    objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "lastObject"), "speed");
    v8 = v7;
    if (v7 <= 0.0 || v7 > 13.0)
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v13 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsFilteredSpeedOutOfBounds,Speed,%0.2f", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_29;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,GpsFilteredSpeedOutOfBounds,Speed,%0.2f");
      goto LABEL_35;
    }
  }
  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count") < 0x800)return;
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
  v9 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = -[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CloseTrack,NumSamplesMaxGpsFilteredLocation,NumSamples,%d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
    v10 = qword_10229FCD8;
    v15[0] = 67109120;
    v15[1] = -[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 2, "CloseTrack,NumSamplesMaxGpsFilteredLocation,NumSamples,%d", v15);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsLocationFiltered]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
LABEL_30:
  -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
}

- (void)_closeTrackCheckGpsOdometer
{
  NSMutableArray *v3;
  double v4;
  double v5;
  NSObject *v6;
  NSMutableArray *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  int v25;
  double v26;
  uint8_t buf[4];
  double v28;

  v3 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
  objc_sync_enter(v3);
  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count") < 2|| (objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"), "date"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count")- 2), "date")), v5 = v4, v4 <= 2.5))
  {
    objc_sync_exit(v3);
    v7 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
    objc_sync_enter(v7);
    objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"), "date"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray firstObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "firstObject"), "date"));
    if (v8 <= 15.0
      || (objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"), "dist"), v10 = v9, objc_msgSend(-[NSMutableArray firstObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "firstObject"), "dist"), v12 = v10 - v11, v12 <= 200.0))
    {
      objc_sync_exit(v7);
      v7 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
      objc_sync_enter(v7);
      objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"), "date"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray firstObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "firstObject"), "date"));
      v15 = v14;
      if (v14 <= 500.0)
      {
        objc_sync_exit(v7);
        v7 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
        objc_sync_enter(v7);
        if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count") < 0x800)
        {
          objc_sync_exit(v7);
          return;
        }
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
        v17 = qword_10229FCD8;
        if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v28) = -[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count");
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "CloseTrack,NumSamplesMaxGpsOdometer,NumSamples,%d", buf, 8u);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_30;
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
        v23 = qword_10229FCD8;
        v25 = 67109120;
        LODWORD(v26) = -[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count");
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 2, "CloseTrack,NumSamplesMaxGpsOdometer,NumSamples,%d", &v25);
        v19 = (uint8_t *)v24;
        sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v24);
        if (v19 == buf)
        {
LABEL_30:
          objc_sync_exit(v7);
          -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
          return;
        }
      }
      else
      {
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
        v16 = qword_10229FCD8;
        if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v28 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "CloseTrack,TimeSpanMax,Timespan,%0.2f", buf, 0xCu);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_30;
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
        v25 = 134217984;
        v26 = v15;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,TimeSpanMax,Timespan,%0.2f", COERCE_DOUBLE(&v25));
        v19 = (uint8_t *)v18;
        sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v18);
        if (v19 == buf)
          goto LABEL_30;
      }
    }
    else
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v13 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CloseTrack,DistanceGpsRoughMax,DistanceGpsRough,%0.2f", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_30;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v25 = 134217984;
      v26 = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,DistanceGpsRoughMax,DistanceGpsRough,%0.2f", COERCE_DOUBLE(&v25));
      v19 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v22);
      if (v19 == buf)
        goto LABEL_30;
    }
    free(v19);
    goto LABEL_30;
  }
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
  v6 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsOdometerEntryTimeOut,TimeSinceLastEntry,%0.2f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
    v25 = 134217984;
    v26 = v5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,GpsOdometerEntryTimeOut,TimeSinceLastEntry,%0.2f", COERCE_DOUBLE(&v25));
    v21 = (uint8_t *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
  -[NSMutableArray removeLastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "removeLastObject");
  objc_sync_exit(v3);
  -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
}

- (void)_closeTrackCheckPedometer
{
  double v3;
  double v4;
  NSObject *v5;
  unsigned int v6;
  NSObject *v7;
  const char *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  double v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  uint8_t *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;

  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") >= 2)
  {
    objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"), "date"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") - 2), "date"));
    v4 = v3;
    if (v3 > 3.84)
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v5 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CloseTrack,PedometerEntryTimeOut,TimeSinceLastEntry,%0.2f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
        LODWORD(v25) = 134217984;
        *(double *)((char *)&v25 + 4) = v4;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,PedometerEntryTimeOut,TimeSinceLastEntry,%0.2f", COERCE_DOUBLE(&v25));
        v23 = (uint8_t *)v22;
        sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckPedometer]", "%s\n", v22);
        if (v23 != buf)
          free(v23);
      }
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      goto LABEL_57;
    }
  }
  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") >= 2)
  {
    v6 = objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"), "deltaSteps");
    if (!(v6
         + objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count")- 2), "deltaSteps")))
    {
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v7 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CloseTrack,NoStepsForTwoPedometerEntries", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_57;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      LOWORD(v25) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,NoStepsForTwoPedometerEntries", &v25, 2, v25, v26, v27);
      goto LABEL_66;
    }
  }
  if (-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count"))
  {
    objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"), "speedCurrent");
    if (v9 <= 0.0)
    {
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v21 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "CloseTrack,PedometerSpeedCurrentZero", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_57;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,PedometerSpeedCurrentZero");
      goto LABEL_66;
    }
  }
  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") >= 2)
  {
    objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"), "speedCurrent");
    v11 = v10;
    objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") - 2), "speedCurrent");
    v13 = v12;
    v14 = 0.0;
    if (v12 > 0.01)
      v14 = (v11 - v12) / v12;
    if (fabs(v14) > 0.1)
    {
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v15 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        v29 = v13;
        v30 = 2048;
        v31 = v11;
        v32 = 2048;
        v33 = v14 * 100.0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CloseTrack,PedometerSpeedCurrentJump,SpeedCurrentPrev,%0.2f,SpeedCurrent,%0.2f,SpeedCurrentJumpPercent,%0.2f", buf, 0x20u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_57;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,PedometerSpeedCurrentJump,SpeedCurrentPrev,%0.2f,SpeedCurrent,%0.2f,SpeedCurrentJumpPercent,%0.2f");
      goto LABEL_66;
    }
  }
  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") >= 2)
  {
    objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"), "pedometerArmConstrainedState");
    v17 = (int)v16;
    if ((int)v16)
    {
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v18 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v29) = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CloseTrack,PedometerArmConstrainedState,%d", buf, 8u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_57;
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,PedometerArmConstrainedState,%d", &v25);
      goto LABEL_66;
    }
  }
  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") < 0x400)
    return;
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
  v19 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = -[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count");
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CloseTrack,NumSamplesMaxPedometer,NumSamples,%d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
    v20 = qword_10229FCD8;
    -[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 2, "CloseTrack,NumSamplesMaxPedometer,NumSamples,%d", &v25);
LABEL_66:
    v24 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckPedometer]", "%s\n", v8);
    if (v24 != buf)
      free(v24);
  }
LABEL_57:
  -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
}

- (void)_closeCurrentTrack
{
  unint64_t v3;
  NSObject *v4;
  CalibrationTrack *v5;
  NSDate *v6;
  NSDate *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CalibrationTrack *v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  double v22;
  uint64_t v23;
  double v24;
  const char *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSMutableArray *v32;
  id v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  double v37;
  void *i;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  uint8_t *v50;
  NSObject *v51;
  void (**v52)(id, id);
  const char *v53;
  uint8_t *v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  const char *v61;
  uint8_t *v62;
  const char *v63;
  uint8_t *v64;
  double v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  int v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  uint8_t buf[4];
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;

  *(double *)&v3 = COERCE_DOUBLE((id)-[CalTrackFinder _removeAdditionalInconsistentSpeedPedometerEntries](self, "_removeAdditionalInconsistentSpeedPedometerEntries"));
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
  v4 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v78 = *(double *)&v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CloseTrack,NumAdditionalPedometerEntriesRemoved,%ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
    v71 = 134217984;
    v72 = *(double *)&v3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,NumAdditionalPedometerEntriesRemoved,%ld", &v71);
    v54 = (uint8_t *)v53;
    sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v53);
    if (v54 != buf)
      free(v54);
  }
  -[CalTrackFinder _calculateTimeStartEndDistanceGpsPed](self, "_calculateTimeStartEndDistanceGpsPed");
  v5 = [CalibrationTrack alloc];
  v6 = -[CalTrackFinder timeStart](self, "timeStart");
  v7 = -[CalTrackFinder timeEnd](self, "timeEnd");
  -[CalTrackFinder distanceGps](self, "distanceGps");
  v9 = v8;
  -[CalTrackFinder distanceRawPed](self, "distanceRawPed");
  v11 = v10;
  -[CalTrackFinder steps](self, "steps");
  v13 = -[CalibrationTrack initWithStart:stop:distanceGps:distanceRawPed:steps:gpsSource:](v5, "initWithStart:stop:distanceGps:distanceRawPed:steps:gpsSource:", v6, v7, -[CalTrackFinder gpsSource](self, "gpsSource"), v9, v11, v12);
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
  v14 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeStartGpsLocationSegment](self, "timeStartGpsLocationSegment"), "timeIntervalSinceReferenceDate");
    v16 = v15;
    -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeEndGpsLocationSegment](self, "timeEndGpsLocationSegment"), "timeIntervalSinceReferenceDate");
    v18 = v17;
    v19 = COERCE_DOUBLE(objc_msgSend(-[CalibrationTrack description](v13, "description"), "UTF8String"));
    *(_DWORD *)buf = 134218498;
    v78 = v16;
    v79 = 2048;
    v80 = v18;
    v81 = 2080;
    v82 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "CloseTrack,TrackMetrics,TimeStartGpsLocationSegment,%0.2f,TimeEndGpsLocationSegment,%0.2f,%s", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
    v55 = qword_10229FCD8;
    -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeStartGpsLocationSegment](self, "timeStartGpsLocationSegment"), "timeIntervalSinceReferenceDate");
    v57 = v56;
    -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeEndGpsLocationSegment](self, "timeEndGpsLocationSegment"), "timeIntervalSinceReferenceDate");
    v59 = v58;
    v60 = COERCE_DOUBLE(objc_msgSend(-[CalibrationTrack description](v13, "description"), "UTF8String"));
    v71 = 134218498;
    v72 = v57;
    v73 = 2048;
    v74 = v59;
    v75 = 2080;
    v76 = v60;
    LODWORD(v65) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v55, 2, "CloseTrack,TrackMetrics,TimeStartGpsLocationSegment,%0.2f,TimeEndGpsLocationSegment,%0.2f,%s", COERCE_DOUBLE(&v71), v65, (const char *)v66);
    v62 = (uint8_t *)v61;
    sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v61);
    if (v62 != buf)
      free(v62);
  }
  -[CalTrackFinder distanceGps](self, "distanceGps");
  if (v20 >= 100.0)
  {
    -[CalTrackFinder distanceGps](self, "distanceGps");
    v27 = v26;
    -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeEnd](self, "timeEnd"), "timeIntervalSinceReferenceDate");
    v29 = v28;
    -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeStart](self, "timeStart"), "timeIntervalSinceReferenceDate");
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v31 = v27 / (v29 - v30);
    v32 = -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered");
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v33)
    {
      v34 = v33;
      v35 = 0;
      v36 = *(_QWORD *)v67;
      v37 = 0.0;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(_QWORD *)v67 != v36)
            objc_enumerationMutation(v32);
          v39 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
          objc_msgSend(objc_msgSend(v39, "timestamp"), "timeIntervalSinceReferenceDate");
          v41 = v40;
          -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeStart](self, "timeStart"), "timeIntervalSinceReferenceDate");
          if (v41 >= v42)
          {
            objc_msgSend(objc_msgSend(v39, "timestamp"), "timeIntervalSinceReferenceDate");
            v44 = v43;
            -[NSDate timeIntervalSinceReferenceDate](-[CalTrackFinder timeEnd](self, "timeEnd"), "timeIntervalSinceReferenceDate");
            if (v44 <= v45)
            {
              objc_msgSend(v39, "speed");
              v37 = v37 + v46;
              ++v35;
            }
          }
        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v34);
      if (v35)
        v47 = v37 / (double)v35;
      else
        v47 = 0.0;
    }
    else
    {
      v47 = 0.0;
    }
    v48 = 1.0;
    if (v31 > 0.0)
      v48 = (v47 - v31) / v31;
    if (fabs(v48) <= 0.2)
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v51 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "CloseTrack,Success", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
        LOWORD(v71) = 0;
        LODWORD(v65) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseTrack,Success", &v71, *(_QWORD *)&v65);
        v64 = (uint8_t *)v63;
        sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v63);
        if (v64 != buf)
          free(v64);
      }
      if (-[CalTrackFinder calTrackHandler](self, "calTrackHandler"))
      {
        v52 = -[CalTrackFinder calTrackHandler](self, "calTrackHandler");
        v52[2](v52, v13);
      }
    }
    else
    {
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v49 = qword_10229FCD8;
      if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        v78 = v47;
        v79 = 2048;
        v80 = v31;
        v81 = 2048;
        v82 = v48;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "CloseCurrentTrack,Fail,GpsSpeedDiscrepancyDetected,SpeedGpsRawMean,%0.2f,GpsDistanceOverTime,%0.2f,SpeedErrorPercent,%0.2f", buf, 0x20u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FCD0 != -1)
          dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
        v71 = 134218496;
        v72 = v47;
        v73 = 2048;
        v74 = v31;
        v75 = 2048;
        v76 = v48;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "CloseCurrentTrack,Fail,GpsSpeedDiscrepancyDetected,SpeedGpsRawMean,%0.2f,GpsDistanceOverTime,%0.2f,SpeedErrorPercent,%0.2f");
        goto LABEL_45;
      }
    }
  }
  else
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
    v21 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      -[CalTrackFinder distanceGps](self, "distanceGps");
      *(_DWORD *)buf = 134217984;
      v78 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "CloseTrack,Fail,DistanceGpsNotSufficient,DistanceGps,%0.2f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10219C5E0);
      v23 = qword_10229FCD8;
      -[CalTrackFinder distanceGps](self, "distanceGps");
      v71 = 134217984;
      v72 = v24;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 2, "CloseTrack,Fail,DistanceGpsNotSufficient,DistanceGps,%0.2f");
LABEL_45:
      v50 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v25);
      if (v50 != buf)
        free(v50);
    }
  }
  -[CalTrackFinder _clearBuffers](self, "_clearBuffers");
}

- (unint64_t)_removeAdditionalInconsistentSpeedPedometerEntries
{
  uint64_t v3;
  unint64_t i;
  id v5;
  char *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = -1;
  for (i = 1; ; ++i)
  {
    v5 = (unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") <= 8
       ? -[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count")
       : (id)8;
    if ((unint64_t)v5 <= i - 1)
      break;
    v6 = (char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") + v3;
    objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "objectAtIndexedSubscript:", v6), "speedCurrent");
    v7 = 1.0;
    if (v8 > 0.01)
    {
      objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "objectAtIndexedSubscript:", v6), "speedInstant");
      v10 = v9;
      objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "objectAtIndexedSubscript:", v6), "speedCurrent");
      v12 = v10 - v11;
      objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "objectAtIndexedSubscript:", v6), "speedCurrent");
      v7 = v12 / v13;
    }
    if (fabs(v7) < 0.1)
      break;
    -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
    --v3;
  }
  if (-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count"))
    -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
  else
    --i;
  if (-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count"))
  {
    ++i;
    -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
  }
  return i;
}

- (void)_clearBuffers
{
  NSMutableArray *v3;

  if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count"))
    -[NSMutableArray removeAllObjects](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "removeAllObjects");
  v3 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
  objc_sync_enter(v3);
  if (-[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count"))
    -[NSMutableArray removeAllObjects](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "removeAllObjects");
  objc_sync_exit(v3);
  if (-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count"))
    -[NSMutableArray removeAllObjects](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeAllObjects");
}

- (id)calTrackHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCalTrackHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)gpsLocationBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGpsLocationBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)gpsLocationBufferFiltered
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGpsLocationBufferFiltered:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)gpsOdometerBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGpsOdometerBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)pedometerBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPedometerBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)timeStart
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimeStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)timeEnd
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimeEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)timeStartGpsLocationSegment
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTimeStartGpsLocationSegment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)timeEndGpsLocationSegment
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTimeEndGpsLocationSegment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (double)distanceGps
{
  return self->_distanceGps;
}

- (void)setDistanceGps:(double)a3
{
  self->_distanceGps = a3;
}

- (double)distanceRawPed
{
  return self->_distanceRawPed;
}

- (void)setDistanceRawPed:(double)a3
{
  self->_distanceRawPed = a3;
}

- (double)steps
{
  return self->_steps;
}

- (void)setSteps:(double)a3
{
  self->_steps = a3;
}

- (int)gpsSource
{
  return self->_gpsSource;
}

- (void)setGpsSource:(int)a3
{
  self->_gpsSource = a3;
}

@end
