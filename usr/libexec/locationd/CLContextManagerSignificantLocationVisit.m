@implementation CLContextManagerSignificantLocationVisit

- (void)sourceUpdated:(unint64_t)a3
{
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  double *v8;
  double v9;
  double v10;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  double v17;
  double v18;
  NSObject *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  NSObject *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;

  if (a3 != 1 || !self->_duringVisit)
    return;
  sub_100211128((uint64_t)&v36, (_QWORD *)self->super.fDataBuffers + 6);
  v4 = *(_OWORD *)(*(_QWORD *)(v37 + (((unint64_t)(v39 + v38 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v39 + v38 - 1));
  v35 = v4;
  v5 = *(std::__shared_weak_count **)(*(_QWORD *)(v37 + (((unint64_t)(v39 + v38 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v39 + v38 - 1)
                                    + 8);
  if (*((_QWORD *)&v4 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = (double *)v4;
  v9 = *(double *)v4;
  if (*(double *)v4 <= 0.0)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102197C10);
    v16 = qword_10229FE88;
    if (!os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      goto LABEL_50;
    v18 = *v8;
    v17 = v8[1];
    *(_DWORD *)buf = 68289539;
    v41 = 0;
    v42 = 2082;
    v43 = "";
    v44 = 2049;
    v45 = v17;
    v46 = 2050;
    v47 = v18;
    v13 = "{\"msg%{public}.0s\":\"received invalid pressure / time from source aggregator\", \"pressure\":\"%{private}5f\"
          ", \"time_s\":\"%{public}.09f\"}";
    v14 = v16;
    v15 = 38;
  }
  else
  {
    v10 = *(double *)(v4 + 8);
    if (v9 == 1.79769313e308 || v10 == 1.79769313e308)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102197C10);
      v12 = qword_10229FE88;
      if (!os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
        goto LABEL_50;
      *(_DWORD *)buf = 68289026;
      v41 = 0;
      v42 = 2082;
      v43 = "";
      v13 = "{\"msg%{public}.0s\":\"received DBL_MAX pressure / TIME from source aggregator\"}";
    }
    else
    {
      *(float *)&v10 = v10;
      if (!-[CLContextManagerSignificantLocationVisit shouldTriggerFloorTransitionHarvest:atTime:](self, "shouldTriggerFloorTransitionHarvest:atTime:", v10, v35))goto LABEL_50;
      if (self->useSanctionedPolygons
        && (-[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation"),
            !+[CLContextManagerSignificantLocationVisit isInsideSanctionedFloorTransitionPolygon:](CLContextManagerSignificantLocationVisit, "isInsideSanctionedFloorTransitionPolygon:")))
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102197C10);
        v12 = qword_10229FE88;
        if (!os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
          goto LABEL_50;
        *(_DWORD *)buf = 68289026;
        v41 = 0;
        v42 = 2082;
        v43 = "";
        v13 = "{\"msg%{public}.0s\":\"floor transition is not inside sanctioned polygons\"}";
      }
      else
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102197C10);
        v20 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289026;
          v41 = 0;
          v42 = 2082;
          v43 = "";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"trigger floor transition harvest\"}", buf, 0x12u);
        }
        if (-[CLContextManagerSignificantLocationVisit shouldSubmit:calibrationType:](self, "shouldSubmit:calibrationType:", -1, 4))
        {
          v21 = *v8;
          -[CLContextManagerSignificantLocationVisit timeUserGetCloseToVisitLocation](self, "timeUserGetCloseToVisitLocation");
          v23 = v22;
          v24 = v21 + -600.0;
          if (v22 >= 0.0)
          {
            if (v22 > v24)
            {
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_102197C10);
              v26 = qword_10229FE88;
              if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 68289538;
                v41 = 0;
                v42 = 2082;
                v43 = "";
                v44 = 2050;
                v45 = v24;
                v46 = 2050;
                v47 = v23;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"truncate period before user moved into close radius of the visit\", \"defaultStartTimestamp_s\":\"%{public}.09f\", \"timeUserBecomesCloseToSLV_s\":\"%{public}.09f\"}", buf, 0x26u);
              }
              v24 = v23;
            }
          }
          else
          {
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_102197C10);
            v25 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68289026;
              v41 = 0;
              v42 = 2082;
              v43 = "";
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"no locations indicating user moved into close radius of the visit\"}", buf, 0x12u);
            }
          }
          v27 = *v8;
          -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
          v29 = v28;
          v31 = v30;
          -[CLContextManagerSignificantLocationVisit currentVisitHorizontalUncertainty](self, "currentVisitHorizontalUncertainty");
          -[CLContextManagerSignificantLocationVisit sendTrackFrom:to:location:horrUnc:type:](self, "sendTrackFrom:to:location:horrUnc:type:", 4, v24, v27, v29, v31, v32);
          sub_100932B84((uint64_t)&self->_floorTransitionDetector);
          goto LABEL_50;
        }
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102197C10);
        v12 = qword_10229FE88;
        if (!os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
          goto LABEL_50;
        *(_DWORD *)buf = 68289026;
        v41 = 0;
        v42 = 2082;
        v43 = "";
        v13 = "{\"msg%{public}.0s\":\"number of submissions exceeded for floor transition traces, submission denied\"}";
      }
    }
    v14 = v12;
    v15 = 18;
  }
  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, v13, buf, v15);
LABEL_50:
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v34 = __ldaxr(p_shared_owners);
    while (__stlxr(v34 - 1, p_shared_owners));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  sub_1006F0FB8(&v36);
}

- (CLContextManagerSignificantLocationVisit)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  CLContextManagerSignificantLocationVisit *v6;
  CLContextManagerSignificantLocationVisit *v7;
  CLRoutineMonitorServiceProtocol *v8;
  NSObject *v9;
  NSObject *v10;
  unsigned __int8 v12;
  objc_super v13;
  uint8_t buf[32];
  __int128 v15;
  __int128 v16;

  v13.receiver = self;
  v13.super_class = (Class)CLContextManagerSignificantLocationVisit;
  v6 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:](&v13, "initWithUniverse:delegate:withBuffer:withSourceAggregator:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    v8 = (CLRoutineMonitorServiceProtocol *)objc_msgSend(-[CLIntersiloUniverse vendor](v6->super._universe, "vendor"), "proxyForService:", CFSTR("CLRoutineMonitor"));
    v7->_routineMonitorProxy = v8;
    if (v8)
    {
      -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v8, "registerDelegate:inSilo:", v7, -[CLIntersiloUniverse silo](v7->super._universe, "silo"));
      -[CLRoutineMonitorServiceProtocol setDelegateEntityName:](v7->_routineMonitorProxy, "setDelegateEntityName:", "CLBarometerCalibration");
      -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:](v7->_routineMonitorProxy, "startLeechingVisitsForClient:", v7);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102197C10);
      v9 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SignificantLocationVisit notification enabled\"}", buf, 0x12u);
      }
      v7->_valid = 1;
      v7->_duringVisit = 0;
      v7->lastSLVUpdateTimestamp = CFAbsoluteTimeGetCurrent();
      v7->lastFloorTransitionUpdateTimestamp = CFAbsoluteTimeGetCurrent();
      v7->numWorkSubmissions = 0;
      v7->numUnknownSubmissions = 0;
      sub_100197040();
      v12 = sub_10075D288() ^ 1;
      sub_1018BF25C(buf, "BarometerCalibrationEnableSanctionedPolygons", &v12, 0);
      v7->useSanctionedPolygons = buf[1];
      -[CLContextManagerSignificantLocationVisit startBuffering](v7, "startBuffering");
      v15 = 0u;
      v16 = 0u;
      memset(buf, 0, sizeof(buf));
      sub_100FC9580(&v7->_floorTransitionDetector.fBuffer.__map_.__first_, buf);
      *(_OWORD *)&v7->_floorTransitionDetector.fInTransition = v16;
      sub_1004A4854(buf);
    }
    else
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102197C10);
      v10 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SignificantLocationVisit notification disabled\"}", buf, 0x12u);
      }
      v7->_valid = 0;
      v7->_duringVisit = 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLContextManagerSignificantLocationVisit;
  -[CLBarometerCalibrationContextManager dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:](self->_routineMonitorProxy, "stopLeechingVisitsForClient:", self);
  -[CLContextManagerSignificantLocationVisit stopBuffering](self, "stopBuffering");
}

- (void)startBuffering
{
  -[CLBarometerCalibrationSourceAggregator enableSources:forContext:](self->super._sourceAggregator, "enableSources:forContext:", &off_1022208D0, self);
}

- (void)stopBuffering
{
  -[CLBarometerCalibrationSourceAggregator disableSources:forContext:](self->super._sourceAggregator, "disableSources:forContext:", &off_1022208D0, self);
}

- (void)onVisit:(id)a3
{
  id v5;
  double v6;
  double v7;
  id v8;
  CLRoutineMonitorServiceProtocol *routineMonitorProxy;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;

  if (-[CLContextManagerSignificantLocationVisit isEntry:](self, "isEntry:"))
  {
    self->_duringVisit = 1;
    objc_msgSend(a3, "coordinate");
    -[CLContextManagerSignificantLocationVisit setCurrentVisitLocation:](self, "setCurrentVisitLocation:");
    objc_msgSend(a3, "horizontalAccuracy");
    -[CLContextManagerSignificantLocationVisit setCurrentVisitHorizontalUncertainty:](self, "setCurrentVisitHorizontalUncertainty:");
  }
  else if (-[CLContextManagerSignificantLocationVisit isDeparture:](self, "isDeparture:", a3))
  {
    self->_duringVisit = 0;
  }
  if (!self->useSanctionedPolygons)
    goto LABEL_8;
  objc_msgSend(a3, "coordinate");
  if (+[CLContextManagerSignificantLocationVisit isInsideSanctionedPolygon:](CLContextManagerSignificantLocationVisit, "isInsideSanctionedPolygon:"))
  {
    -[CLContextManagerSignificantLocationVisit startBuffering](self, "startBuffering");
LABEL_8:
    v5 = objc_alloc((Class)CLLocation);
    objc_msgSend(a3, "coordinate");
    v7 = v6;
    objc_msgSend(a3, "coordinate");
    v8 = objc_msgSend(v5, "initWithLatitude:longitude:", v7);
    routineMonitorProxy = self->_routineMonitorProxy;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100FC803C;
    v11[3] = &unk_10212BBD0;
    v11[4] = self;
    v11[5] = a3;
    -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestAtLocation:withReply:](routineMonitorProxy, "fetchLocationOfInterestAtLocation:withReply:", v8, v11);

    return;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v10 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"received visit not inside sanctioned polygons\"}", buf, 0x12u);
  }
}

- (BOOL)isEntry:(id)a3
{
  unsigned int v4;

  if (a3)
  {
    v4 = objc_msgSend(a3, "hasArrivalDate");
    if (v4)
      LOBYTE(v4) = objc_msgSend(a3, "hasDepartureDate") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isDeparture:(id)a3
{
  if (a3 && objc_msgSend(a3, "hasArrivalDate"))
    return objc_msgSend(a3, "hasDepartureDate");
  else
    return 0;
}

- (BOOL)shouldSubmit:(int64_t)a3 calibrationType:(unint64_t)a4
{
  NSObject *v7;
  int numWorkSubmissions;
  int numUnknownSubmissions;
  double Current;
  double v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  NSObject *v15;
  _BOOL4 v16;
  double v17;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  _BYTE v24[10];
  _BYTE v25[10];
  __int16 v26;
  unint64_t v27;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v7 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    numWorkSubmissions = self->numWorkSubmissions;
    numUnknownSubmissions = self->numUnknownSubmissions;
    v19 = 68290050;
    v21 = 2082;
    v20 = 0;
    v22 = "";
    v23 = 1026;
    *(_DWORD *)v24 = numWorkSubmissions;
    *(_WORD *)&v24[4] = 1026;
    *(_DWORD *)&v24[6] = numUnknownSubmissions;
    *(_WORD *)v25 = 2050;
    *(_QWORD *)&v25[2] = a3;
    v26 = 2050;
    v27 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"number of submissions so far. \", \"numWorkSubmissions\":%{public}d, \"numUnknownSubmissions\":%{public}d, \"loiType\":%{public}ld, \"calibrationType\":%{public}ld}", (uint8_t *)&v19, 0x32u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  if (a4 == 4)
    goto LABEL_22;
  if (a4 == 3)
  {
    v11 = self->lastSLVUpdateTimestamp + 86400.0;
    if (Current >= v11)
    {
      if (Current > v11)
      {
        do
        {
          v17 = v11;
          v11 = v11 + 86400.0;
        }
        while (Current > v11);
        self->lastSLVUpdateTimestamp = v17;
      }
      self->numWorkSubmissions = 0;
      self->numUnknownSubmissions = 0;
      goto LABEL_22;
    }
    if (a3 == -1)
    {
      v12 = 73;
      v13 = self->numUnknownSubmissions;
      v14 = *((_DWORD *)sub_100FC2FA0() + 1);
    }
    else
    {
      if (a3 != 1)
        goto LABEL_23;
      v12 = 72;
      v13 = self->numWorkSubmissions;
      v14 = *((_DWORD *)sub_100FC2FA0() + 2);
    }
    if (v14 > v13)
    {
      ++*((_BYTE *)&self->super.super.isa + v12);
LABEL_22:
      LOBYTE(v16) = 1;
      return v16;
    }
LABEL_23:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v15 = qword_10229FE88;
  v16 = os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    v19 = 68289538;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2050;
    *(_QWORD *)v24 = a3;
    *(_WORD *)&v24[8] = 2050;
    *(_QWORD *)v25 = a4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Warning,Requested unsupported harvest type\", \"loiType\":%{public}ld, \"calibrationType\":%{public}ld}", (uint8_t *)&v19, 0x26u);
    goto LABEL_23;
  }
  return v16;
}

- (void)sendTrackFrom:(double)a3 to:(double)a4 location:(CLLocationCoordinate2D)a5 horrUnc:(double)a6 type:(unint64_t)a7
{
  double longitude;
  double latitude;
  NSObject *v14;
  CLBarometerCalibrationTrack *v15;
  _DWORD v16[2];
  __int16 v17;
  const char *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;

  longitude = a5.longitude;
  latitude = a5.latitude;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v14 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 68289539;
    v16[1] = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2049;
    v20 = a3;
    v21 = 2049;
    v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Sending track to buffer\", \"start_s\":\"%{private}.09f\", \"end_s\":\"%{private}.09f\"}", (uint8_t *)v16, 0x26u);
  }
  v15 = objc_opt_new(CLBarometerCalibrationTrack);
  -[CLBarometerCalibrationTrack setFNotification:](v15, "setFNotification:", 0);
  -[CLBarometerCalibrationTrack setFType:](v15, "setFType:", a7);
  -[CLBarometerCalibrationTrack setFStartTime:](v15, "setFStartTime:", a3);
  -[CLBarometerCalibrationTrack setFEndTime:](v15, "setFEndTime:", a4);
  -[CLBarometerCalibrationTrack setFLocationCoordinates:](v15, "setFLocationCoordinates:", latitude, longitude);
  -[CLBarometerCalibrationTrack setFLocationHorizontalUncertainty:](v15, "setFLocationHorizontalUncertainty:", a6);
  -[CLBarometerCalibrationContextClient startTrack:](self->super._delegate, "startTrack:", v15);
  -[CLBarometerCalibrationContextClient stopTrack:](self->super._delegate, "stopTrack:", v15);
}

- (BOOL)hasPressureChangeFrom:(double)a3 to:(double)a4
{
  _QWORD *fDataBuffers;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  double v11;
  float v12;
  float v13;
  double *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _DWORD v24[2];
  __int16 v25;
  const char *v26;
  __int16 v27;
  double v28;

  fDataBuffers = self->super.fDataBuffers;
  v5 = fDataBuffers[7];
  if (fDataBuffers[8] == v5
    || (v6 = fDataBuffers[10],
        v7 = (_QWORD *)(v5 + 8 * (v6 >> 8)),
        v8 = *v7 + 16 * v6,
        v9 = *(_QWORD *)(v5 + (((fDataBuffers[11] + v6) >> 5) & 0x7FFFFFFFFFFFFF8))
           + 16 * (*((_BYTE *)fDataBuffers + 88) + v6),
        v8 == v9))
  {
    v13 = 3.4028e38;
    v12 = 1.1755e-38;
  }
  else
  {
    v11 = a3;
    v12 = 1.1755e-38;
    v13 = 3.4028e38;
    do
    {
      v14 = *(double **)v8;
      v15 = *(std::__shared_weak_count **)(v8 + 8);
      if (v15)
      {
        p_shared_owners = (unint64_t *)&v15->__shared_owners_;
        do
          v17 = __ldxr(p_shared_owners);
        while (__stxr(v17 + 1, p_shared_owners));
      }
      a3 = *v14;
      if (*v14 > v11 && a3 < a4)
      {
        a3 = v14[1];
        if (a3 < v13)
          v13 = a3;
        if (a3 > v12)
          v12 = a3;
      }
      if (v15)
      {
        v19 = (unint64_t *)&v15->__shared_owners_;
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *, SEL, __n128))v15->__on_zero_shared)(v15, a2, *(__n128 *)&a3);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      v8 += 16;
      if (v8 - *v7 == 4096)
      {
        v21 = v7[1];
        ++v7;
        v8 = v21;
      }
    }
    while (v8 != v9);
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v22 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v24[0] = 68289283;
    v24[1] = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2049;
    v28 = (float)(v12 - v13);
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"pressure range check\", \"pressure change\":\"%{private}.6f\"}", (uint8_t *)v24, 0x1Cu);
  }
  return v12 > (float)(v13 + 0.005);
}

- (double)timeUserGetCloseToVisitLocation
{
  double v2;
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD *fDataBuffers;
  uint64_t v12;
  double v13;
  unint64_t v14;
  _QWORD *v15;
  double **v16;
  uint64_t v17;
  char v18;
  double *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unint64_t *v36;
  unint64_t v37;
  double **v38;
  NSObject *v39;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v4 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
    v6 = v5;
    -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
    *(_DWORD *)buf = 68289539;
    v42 = 0;
    v43 = 2082;
    v44 = "";
    v45 = 2049;
    v46 = v6;
    v47 = 2049;
    v48 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"checking distance to visit\", \"visitLat\":\"%{private}7f\", \"visitLon\":\"%{private}7f\"}", buf, 0x26u);
  }
  -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
  v9 = v8;
  -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
  if (sub_10011CE88(v9, v10))
  {
    fDataBuffers = self->super.fDataBuffers;
    v12 = fDataBuffers[1];
    v13 = -1.0;
    if (fDataBuffers[2] != v12)
    {
      v14 = fDataBuffers[4];
      v15 = (_QWORD *)(v12 + 8 * (v14 >> 8));
      v16 = (double **)(*v15 + 16 * v14);
      v17 = *(_QWORD *)(v12 + (((fDataBuffers[5] + v14) >> 5) & 0x7FFFFFFFFFFFFF8))
          + 16 * (*((_BYTE *)fDataBuffers + 40) + v14);
      if (v16 != (double **)v17)
      {
        v18 = 0;
        while (1)
        {
          v19 = *v16;
          v20 = (std::__shared_weak_count *)v16[1];
          if (v20)
          {
            p_shared_owners = (unint64_t *)&v20->__shared_owners_;
            do
              v22 = __ldxr(p_shared_owners);
            while (__stxr(v22 + 1, p_shared_owners));
          }
          if (v19)
          {
            v23 = 0;
            v24 = v19[4];
            if (v24 > 0.0 && v24 < 66.0)
            {
              v25 = v19[1];
              v26 = v19[2];
              -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
              v28 = v27;
              -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
              v30 = sub_100124100(v25, v26, v28, v29);
              if (v30 <= 400.0)
              {
                if ((v18 & (v30 < 400.0)) == 1)
                {
                  v2 = *v19;
                  v18 = 1;
                  v23 = 1;
                }
                else
                {
                  v23 = 0;
                }
              }
              else
              {
                if (qword_10229FE80 != -1)
                  dispatch_once(&qword_10229FE80, &stru_102197C10);
                v31 = qword_10229FE88;
                if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
                {
                  v32 = *v19;
                  v33 = *((_QWORD *)v19 + 1);
                  v34 = *((_QWORD *)v19 + 2);
                  *(_DWORD *)buf = 68290051;
                  v42 = 0;
                  v43 = 2082;
                  v44 = "";
                  v45 = 2050;
                  v46 = v32;
                  v47 = 2050;
                  v48 = v30;
                  v49 = 2049;
                  v50 = v33;
                  v51 = 2049;
                  v52 = v34;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"faraway location encountered\", \"time_s\":\"%{public}.09f\", \"distance\":\"%{public}.2f\", \"locLat\":\"%{private}7f\", \"locLon\":\"%{private}7f\"}", buf, 0x3Au);
                }
                v23 = 7;
                v18 = 1;
              }
            }
          }
          else
          {
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_102197C10);
            v35 = qword_10229FE88;
            if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68289026;
              v42 = 0;
              v43 = 2082;
              v44 = "";
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"no location recorded\"}", buf, 0x12u);
            }
            v23 = 6;
          }
          if (!v20)
            goto LABEL_30;
          v36 = (unint64_t *)&v20->__shared_owners_;
          do
            v37 = __ldaxr(v36);
          while (__stlxr(v37 - 1, v36));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
            if (!v23)
              goto LABEL_32;
          }
          else
          {
LABEL_30:
            if (!v23)
              goto LABEL_32;
          }
          if (v23 != 7)
          {
            if (v23 == 6)
              return -1.0;
            else
              return v2;
          }
LABEL_32:
          v16 += 2;
          if ((double **)((char *)v16 - *v15) == (double **)4096)
          {
            v38 = (double **)v15[1];
            ++v15;
            v16 = v38;
          }
          if (v16 == (double **)v17)
            return -1.0;
        }
      }
    }
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102197C10);
    v39 = qword_10229FE88;
    v13 = -1.0;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v42 = 0;
      v43 = 2082;
      v44 = "";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Warning,invalid visit location, abort distance check\"}", buf, 0x12u);
    }
  }
  return v13;
}

- (BOOL)shouldTriggerFloorTransitionHarvest:(float)a3 atTime:(double)a4
{
  NSObject *v7;
  CLFloorTransitionDetector *p_floorTransitionDetector;
  double v9;
  double v11;
  NSObject *v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v7 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v13 = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2049;
    v18 = a3;
    v19 = 2050;
    v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"received floor transition detection request\", \"pressure\":\"%{private}5f\", \"time_s\":\"%{public}.09f\"}", (uint8_t *)&v13, 0x26u);
  }
  p_floorTransitionDetector = &self->_floorTransitionDetector;
  sub_1009327A0((uint64_t)p_floorTransitionDetector, a3, a4);
  v9 = sub_100932B7C((uint64_t)p_floorTransitionDetector);
  if (v9 == 0.0)
    return 0;
  v11 = v9;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v12 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v13 = 68289283;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2049;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"floor transition detected\", \"transition time_s\":\"%{private}.09f\"}", (uint8_t *)&v13, 0x1Cu);
  }
  return a4 - v11 <= 600.0 && a4 - v11 >= 180.0;
}

+ (BOOL)isInsideSanctionedPolygon:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  NSObject *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v9;
  _BYTE v10[10];
  __int16 v11;
  CLLocationDegrees v12;
  __int16 v13;
  CLLocationDegrees v14;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v5 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v9 = 68289539;
    *(_WORD *)v10 = 2082;
    *(_QWORD *)&v10[2] = "";
    v11 = 2049;
    v12 = latitude;
    v13 = 2049;
    v14 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"received request to resolve whether the following location is inside sanctioned polygons: \", \"lat\":\"%{private}6f\", \"lon\":\"%{private}6f\"}", (uint8_t *)&v9, 0x26u);
  }
  v9 = *(_QWORD *)&longitude;
  *(CLLocationDegrees *)v10 = latitude;
  v6 = &qword_102309660;
  v7 = 7600;
  while (!sub_100DA41C4((double *)v6 + 3, (double *)&v9) || (sub_100DA4068((__int128 **)v6, (__int128 *)&v9) & 1) == 0)
  {
    v6 += 10;
    v7 -= 80;
    if (!v7)
      return 0;
  }
  return 1;
}

+ (BOOL)isInsideSanctionedFloorTransitionPolygon:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  NSObject *v5;
  unint64_t v6;
  uint64_t v8;
  _BYTE v9[10];
  __int16 v10;
  CLLocationDegrees v11;
  __int16 v12;
  CLLocationDegrees v13;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102197C10);
  v5 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    v8 = 68289539;
    *(_WORD *)v9 = 2082;
    *(_QWORD *)&v9[2] = "";
    v10 = 2049;
    v11 = latitude;
    v12 = 2049;
    v13 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"received request to resolve whether the following location is inside sanctioned floor transition polygons: \", \"lat\":\"%{private}6f\", \"lon\":\"%{private}6f\"}", (uint8_t *)&v8, 0x26u);
  }
  v8 = *(_QWORD *)&longitude;
  *(CLLocationDegrees *)v9 = latitude;
  v6 = 0x1FFFFFFFFFFFFF60uLL;
  while (!sub_100DA41C4((double *)&qword_10230B3F8[v6 + 166], (double *)&v8)
       || (sub_100DA4068((__int128 **)&qword_10230B3F8[v6 + 163], (__int128 *)&v8) & 1) == 0)
  {
    v6 += 10;
    if (!(v6 * 8))
      return 0;
  }
  return 1;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)duringVisit
{
  return self->_duringVisit;
}

- (void)setDuringVisit:(BOOL)a3
{
  self->_duringVisit = a3;
}

- (CLLocationCoordinate2D)currentVisitLocation
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_currentVisitLocation.latitude;
  longitude = self->_currentVisitLocation.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCurrentVisitLocation:(CLLocationCoordinate2D)a3
{
  self->_currentVisitLocation = a3;
}

- (double)currentVisitHorizontalUncertainty
{
  return self->_currentVisitHorizontalUncertainty;
}

- (void)setCurrentVisitHorizontalUncertainty:(double)a3
{
  self->_currentVisitHorizontalUncertainty = a3;
}

- (void).cxx_destruct
{
  sub_1004A4854(&self->_floorTransitionDetector.fBuffer.__map_.__first_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 17) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_WORD *)self + 64) = 0;
  return self;
}

@end
