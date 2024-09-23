@implementation VLFSessionAnalyticsCapturer

- (VLFSessionAnalyticsCapturer)init
{
  VLFSessionAnalyticsCapturer *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  VLFSessionAnalyticsCapturer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VLFSessionAnalyticsCapturer;
  v2 = -[VLFSessionAnalyticsCapturer init](&v8, "init");
  if (v2)
  {
    v3 = geo_dispatch_queue_create_with_qos("VLFSessionAnalyticsCapturer", 17);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)sessionStartedWithEntryPoint:(int64_t)a3
{
  double Current;
  double v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;

  Current = GEOMachAbsoluteTimeGetCurrent(self, a2);
  v6 = (double)((unint64_t)(CFAbsoluteTimeGetCurrent() * 3600.0) / 0xE10);
  v7 = GEOGetMonotonicTime();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));

  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100403E7C;
  v12[3] = &unk_1011B5388;
  v14 = Current;
  v15 = v7;
  v16 = v6;
  v12[4] = self;
  v13 = v9;
  v17 = a3;
  v11 = v9;
  dispatch_async(queue, v12);

}

- (void)sessionEndedWithResult:(int64_t)a3 initializationFailureDetails:(id)a4 arFailureTypes:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  double Current;
  void *v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  double v22;
  int64_t v23;

  v8 = a4;
  v9 = a5;
  Current = GEOMachAbsoluteTimeGetCurrent(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastLocation"));

  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100403FE8;
  v18[3] = &unk_1011B53B0;
  v22 = Current;
  v18[4] = self;
  v19 = v13;
  v23 = a3;
  v20 = v8;
  v21 = v9;
  v15 = v9;
  v16 = v8;
  v17 = v13;
  dispatch_async(queue, v18);

}

- (void)recordAttempt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  VLFSessionAnalyticsCapturer *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation"));

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100404110;
  block[3] = &unk_1011AD238;
  v11 = v4;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v4;
  dispatch_async(queue, block);

}

- (void)recordGeoTrackingStatusIfNecessary:(id)a3
{
  ARGeoTrackingStatus *v5;
  ARGeoTrackingStatus *v6;
  ARGeoTrackingStatus **p_lastGeoTrackingStatus;
  id v8;
  id v9;
  double v10;
  NSObject *queue;
  _QWORD block[5];
  ARGeoTrackingStatus *v13;
  double v14;

  v5 = (ARGeoTrackingStatus *)a3;
  v6 = v5;
  p_lastGeoTrackingStatus = &self->_lastGeoTrackingStatus;
  if (self->_lastGeoTrackingStatus != v5)
  {
    v8 = -[ARGeoTrackingStatus state](v5, "state");
    if (v8 == (id)-[ARGeoTrackingStatus state](*p_lastGeoTrackingStatus, "state")
      && (v9 = -[ARGeoTrackingStatus stateReason](v6, "stateReason"),
          v9 == (id)-[ARGeoTrackingStatus stateReason](*p_lastGeoTrackingStatus, "stateReason")))
    {
      objc_storeStrong((id *)&self->_lastGeoTrackingStatus, a3);
    }
    else
    {
      objc_storeStrong((id *)&self->_lastGeoTrackingStatus, a3);
      v10 = GEOGetMonotonicTime();
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100404360;
      block[3] = &unk_1011B15B0;
      block[4] = self;
      v14 = v10;
      v13 = v6;
      dispatch_async(queue, block);

    }
  }

}

- (void)recordPocketState:(int64_t)a3
{
  double v5;
  NSObject *queue;
  _QWORD block[7];

  if (self->_lastPocketState != a3)
  {
    self->_lastPocketState = a3;
    v5 = GEOGetMonotonicTime();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004044A8;
    block[3] = &unk_1011AED30;
    block[4] = self;
    *(double *)&block[5] = v5;
    block[6] = a3;
    dispatch_async(queue, block);
  }
}

- (void)_submitAnalytics
{
  const char *label;
  const char *v4;
  BOOL v5;
  double endTime;
  double startTime;
  id v8;
  void *v9;
  uint64_t entryPoint_low;
  CLLocation *v11;
  unsigned int v12;
  int v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  double v22;
  id v23;
  id v24;
  double v25;
  double v26;
  id v27;
  VLLocalizationCrowdsourcingDetails *lastCrowdsourcingDetails;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  id v33;
  const char *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  NSMutableArray *localizationDetails;
  uint64_t result_low;
  NSMutableArray *arStates;
  NSMutableArray *deviceOrientations;
  GEOVLFInitializationFailureDetails *initializationFailureDetails;
  GEOVLFARFailureTypes *arFailureTypes;
  id v45;
  NSObject *v46;
  const char *v47;
  id v48;
  NSObject *v49;
  void *v50;
  _BYTE buf[24];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;

  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v45 = sub_1004318FC();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "-[VLFSessionAnalyticsCapturer _submitAnalytics]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "VLFSessionAnalyticsCapturer.m";
        *(_WORD *)&buf[22] = 1024;
        v52 = 274;
        v53 = 2080;
        v54 = "_queue";
        v55 = 2080;
        v56 = v47;
        v57 = 2080;
        v58 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }

      if (sub_100A70734())
      {
        v48 = sub_1004318FC();
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  startTime = self->_startTime;
  endTime = self->_endTime;
  v8 = objc_alloc_init((Class)GEOVLFEntryPoint);
  v9 = v8;
  if ((unint64_t)(self->_entryPoint - 1) < 4)
    entryPoint_low = LODWORD(self->_entryPoint);
  else
    entryPoint_low = 0;
  objc_msgSend(v8, "setAccessPoint:", entryPoint_low);
  v11 = self->_originalLocation;
  v12 = -[CLLocation positionContextState](v11, "positionContextState");
  if (v12 > 2)
  {
    v13 = 0;
    v14 = 3;
  }
  else
  {
    v13 = dword_100E370D8[v12];
    v14 = 7;
  }
  -[CLLocation probabilityPositionContextStateIndoor](v11, "probabilityPositionContextStateIndoor");
  v16 = v15;
  -[CLLocation probabilityPositionContextStateOutdoor](v11, "probabilityPositionContextStateOutdoor");
  v18 = v17;

  if (self->_result == 4)
  {
    v21 = objc_alloc_init((Class)GEOVLFCorrection);
    -[CLLocation distanceFromLocation:](self->_finalLocation, "distanceFromLocation:", self->_originalLocation);
    v19 = objc_msgSend(v21, "setLocationCorrectionMagnitude:", v22);
  }
  else
  {
    v21 = 0;
  }
  if (self->_originalLocation)
  {
    v23 = objc_alloc_init((Class)GEOVLFLocation);
    v24 = objc_alloc((Class)GEOLatLng);
    -[CLLocation coordinate](self->_originalLocation, "coordinate");
    v26 = v25;
    -[CLLocation coordinate](self->_originalLocation, "coordinate");
    v27 = objc_msgSend(v24, "initWithLatitude:longitude:", v26);
    objc_msgSend(v23, "setLocation:", v27);

  }
  else
  {
    v23 = 0;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsSupported(v19, v20) & 1) == 0)
  {
    v33 = sub_100404A5C();
    v30 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_WORD *)buf = 0;
    v34 = "Not capturing VL Crowdsourcing details because the feature is disabled";
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
    goto LABEL_35;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsAllowed() & 1) == 0)
  {
    v35 = sub_100404A5C();
    v30 = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_WORD *)buf = 0;
    v34 = "Not capturing VL Crowdsourcing details because the feature is not supported for the current device posture";
    goto LABEL_34;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsEnabled() & 1) == 0)
  {
    v36 = sub_100404A5C();
    v30 = objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_WORD *)buf = 0;
    v34 = "Not capturing VL Crowdsourcing details because the user has not given permission";
    goto LABEL_34;
  }
  lastCrowdsourcingDetails = self->_lastCrowdsourcingDetails;
  v29 = sub_100404A5C();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (!lastCrowdsourcingDetails)
  {
    if (v31)
    {
      *(_WORD *)buf = 0;
      v34 = "Not capturing VL Crowdsourcing details because we did not receive any";
      goto LABEL_34;
    }
LABEL_35:

    v32 = 0;
    goto LABEL_36;
  }
  if (v31)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Capturing VL Crowdsourcing details", buf, 2u);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[GEOVLFCrowdsourcingDetails _vl_createWithVLCrowdsourcingDetails:](GEOVLFCrowdsourcingDetails, "_vl_createWithVLCrowdsourcingDetails:", self->_lastCrowdsourcingDetails));
LABEL_36:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", ((endTime - startTime) * 1000.0)));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTimeRoundedToHour));
  localizationDetails = self->_localizationDetails;
  if ((unint64_t)(self->_result - 1) < 4)
    result_low = LODWORD(self->_result);
  else
    result_low = 0;
  arStates = self->_arStates;
  deviceOrientations = self->_deviceOrientations;
  initializationFailureDetails = self->_initializationFailureDetails;
  arFailureTypes = self->_arFailureTypes;
  *(_QWORD *)buf = v16;
  *(_QWORD *)&buf[8] = v18;
  *(_DWORD *)&buf[16] = v13;
  buf[20] = v14;
  *(_WORD *)&buf[21] = 0;
  buf[23] = 0;
  +[GEOAPPortal captureVlfUsageWithEntryPoint:sessionTimeMs:timeRoundedToHour:localizationDetails:finalState:postFusionCorrection:initialPositionContextClassification:initialLocation:initializationFailureDetails:arStates:deviceOrientations:crowdsourcingDetails:arFailureTypes:](GEOAPPortal, "captureVlfUsageWithEntryPoint:sessionTimeMs:timeRoundedToHour:localizationDetails:finalState:postFusionCorrection:initialPositionContextClassification:initialLocation:initializationFailureDetails:arStates:deviceOrientations:crowdsourcingDetails:arFailureTypes:", v9, v37, v38, localizationDetails, result_low, v21, buf, v23, initializationFailureDetails, arStates, deviceOrientations, v32, arFailureTypes);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCrowdsourcingDetails, 0);
  objc_storeStrong((id *)&self->_deviceOrientations, 0);
  objc_storeStrong((id *)&self->_arStates, 0);
  objc_storeStrong((id *)&self->_lastGeoTrackingStatus, 0);
  objc_storeStrong((id *)&self->_arFailureTypes, 0);
  objc_storeStrong((id *)&self->_initializationFailureDetails, 0);
  objc_storeStrong((id *)&self->_finalLocation, 0);
  objc_storeStrong((id *)&self->_originalLocation, 0);
  objc_storeStrong((id *)&self->_localizationDetails, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
