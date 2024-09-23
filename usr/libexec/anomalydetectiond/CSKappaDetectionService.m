@implementation CSKappaDetectionService

- (void)start
{
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 canCollectData;
  NSObject *v8;
  CSMSLDataRecording *mslRecording;
  int detectionEvent;
  NSObject *v11;
  CSMSLDataRecording *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  unsigned __int16 v17;
  BOOL v18;
  NSObject *v19;
  _BOOL4 shouldFeedAccessoryGPS;
  NSUUID *companionUUIDPreSession;
  int v22;
  id v23;

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v3 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "start", (uint8_t *)&v22, 2u);
  }
  v4 = -[CSPower createPowerAssertion:](self->_powerAssertion, "createPowerAssertion:", CFSTR("AOP Trigger"));
  if (self->_uuid)
  {
    -[CSKappaDetectionService updateCompanion](self, "updateCompanion");
    -[CSKappaDetectionService sendCompanionUUID:](self, "sendCompanionUUID:", self->_uuid);
    self->_triggerTime = 0.0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
    self->_canCollectData = objc_msgSend(v5, "isAuthorizedToCollectData");

    if (qword_100387330 == -1)
      goto LABEL_7;
  }
  else
  {
    sub_100289AD0(v4);
    __break(1u);
  }
  dispatch_once(&qword_100387330, &stru_100363A20);
LABEL_7:
  v6 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    canCollectData = self->_canCollectData;
    v22 = 67109120;
    LODWORD(v23) = canCollectData;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "can collect data %d", (uint8_t *)&v22, 8u);
  }
  if (!self->_canCollectData)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v8 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "device cannot collect data", (uint8_t *)&v22, 2u);
    }
    mslRecording = self->_mslRecording;
    self->_mslRecording = 0;

  }
  detectionEvent = self->_detectionEvent;
  self->_detectionEvent = detectionEvent + 1;
  if (detectionEvent >= 1)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v11 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "multiple detection events cannot be recorded", (uint8_t *)&v22, 2u);
    }
    v12 = self->_mslRecording;
    self->_mslRecording = 0;

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  v14 = objc_msgSend(v13, "getSystemHardware");
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v15 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134349056;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "start hw = %{public}lu", (uint8_t *)&v22, 0xCu);
  }
  -[CSMSLDataRecording updateMetadata:](self->_mslRecording, "updateMetadata:", &off_10036DD70);
  -[CSKappaDetectionService initSession](self, "initSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v17 = (unsigned __int16)objc_msgSend(v16, "getBooleanDefault:", CFSTR("KappaShouldFeedAccessoryGPS"));
  if ((v17 & 0xFF00) != 0)
    v18 = v17;
  else
    v18 = 1;
  self->_shouldFeedAccessoryGPS = v18;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v19 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    shouldFeedAccessoryGPS = self->_shouldFeedAccessoryGPS;
    v22 = 67109120;
    LODWORD(v23) = shouldFeedAccessoryGPS;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "should feed accessory gps %d", (uint8_t *)&v22, 8u);
  }
  companionUUIDPreSession = self->_companionUUIDPreSession;
  if (companionUUIDPreSession)
    objc_storeStrong((id *)&self->_companionUUID, companionUUIDPreSession);
  self->_inSession = 1;
  -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 0, 0);

}

- (void)updateKappaSessionClients:(int)a3 data:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v7 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "updateKappaSessionClients type: %d", (uint8_t *)v8, 8u);
  }
  -[CSPower onKappaSessionUpdate:data:](self->_powerAssertion, "onKappaSessionUpdate:data:", v4, v6);
  -[CSKappaCoreAnalytics onKappaSessionUpdate:data:](self->_coreAnalytics, "onKappaSessionUpdate:data:", v4, v6);

}

- (CSKappaDetectionService)initWithSilo:(id)a3 vendor:(id)a4 aopService:(void *)a5 sosStateMachine:(id)a6
{
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  CSMSLDataRecording *mslRecording;
  CSConnectionServer *v17;
  CSConnectionServer *kappaConnectionServer;
  CSCompanionServiceProtocol *v19;
  CSCompanionServiceProtocol *companionProxy;
  CSPower *v21;
  CSPower *powerAssertion;
  CSKappaCoreAnalytics *v23;
  CSKappaCoreAnalytics *coreAnalytics;
  unsigned int v25;
  unsigned int v26;
  id v27;
  void *v28;
  CSKappaDetectionService *v29;
  _QWORD *v30;
  id idleState;
  CSKappaDetectionService *v32;
  _QWORD *v33;
  id readingState;
  CSKappaDetectionService *v35;
  _QWORD *v36;
  id waitForPOIState;
  CSKappaDetectionService *v38;
  _QWORD *v39;
  id waitForSOSState;
  CSHSMObjc *v41;
  id v42;
  CSHSMObjc *v43;
  CSHSMObjc *hsm;
  CLTimer *v45;
  CLTimer *triggerTimer;
  CSKappaDetectionService *v47;
  NSUUID *companionUUIDPreSession;
  uint64_t v49;
  GEOMapService *geoMapSvc;
  NSObject *v51;
  CSKappaDetectionService *v52;
  CSKappaDetectionService *v53;
  void *v55;
  void *v56;
  _QWORD v57[4];
  CSKappaDetectionService *v58;
  _QWORD v59[4];
  CSKappaDetectionService *v60;
  _QWORD v61[4];
  CSKappaDetectionService *v62;
  _QWORD v63[4];
  CSKappaDetectionService *v64;
  _QWORD v65[4];
  CSKappaDetectionService *v66;
  id location;
  uint8_t buf[8];

  v9 = a3;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_initWeak(&location, self);
  if (qword_100387330 != -1)
    goto LABEL_17;
  while (1)
  {
    v15 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "beginService", buf, 2u);
    }
    objc_storeStrong((id *)&self->_silo, v9);
    objc_storeStrong((id *)&self->_vendor, a4);
    objc_storeStrong((id *)&self->_silo, v9);
    mslRecording = self->_mslRecording;
    self->_mslRecording = 0;

    self->_detectionEvent = 0;
    objc_storeStrong((id *)&self->_sosSM, a6);
    a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "proxyForService:", CFSTR("CSInjectionService")));
    v17 = (CSConnectionServer *)objc_msgSend(objc_alloc((Class)objc_msgSend(a6, "syncgetClassForName:", CFSTR("CSKappaConnectionServer"))), "initWithDispatchSilo:andDelegate:", self->_silo, self);
    kappaConnectionServer = self->_kappaConnectionServer;
    self->_kappaConnectionServer = v17;

    v19 = (CSCompanionServiceProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "proxyForService:", CFSTR("CSCompanionService")));
    companionProxy = self->_companionProxy;
    self->_companionProxy = v19;

    -[CSCompanionServiceProtocol registerDelegate:inSilo:](self->_companionProxy, "registerDelegate:inSilo:", self, self->_silo);
    -[CSCompanionServiceProtocol registerClient:](self->_companionProxy, "registerClient:", self);
    v21 = (CSPower *)objc_claimAutoreleasedReturnValue(+[CSPower sharedInstance](CSPower, "sharedInstance"));
    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = v21;

    v23 = -[CSKappaCoreAnalytics initWithSilo:vendor:aopService:]([CSKappaCoreAnalytics alloc], "initWithSilo:vendor:aopService:", self->_silo, v12, a5);
    coreAnalytics = self->_coreAnalytics;
    self->_coreAnalytics = v23;

    v9 = (id)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
    self->_isLoggingDevice = objc_msgSend(v9, "isKappaLoggingDevice");
    v25 = objc_msgSend(v9, "isKappaDetectionDevice");
    self->_isDetectionDevice = v25;
    v26 = self->_isLoggingDevice ? v25 : 0;
    if (v26 != 1)
      break;
    sub_100289C18(buf);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 375, "-[CSKappaDetectionService initWithSilo:vendor:aopService:sosStateMachine:]");
    __break(1u);
LABEL_17:
    dispatch_once(&qword_100387330, &stru_100363A20);
  }
  v27 = v11;
  v28 = a5;
  v55 = v27;
  v56 = v13;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10027BE4C;
  v65[3] = &unk_1003610D0;
  v29 = self;
  v66 = v29;
  v30 = objc_retainBlock(v65);
  idleState = v29->_idleState;
  v29->_idleState = v30;

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10027BEB0;
  v63[3] = &unk_1003610D0;
  v32 = v29;
  v64 = v32;
  v33 = objc_retainBlock(v63);
  readingState = v32->_readingState;
  v32->_readingState = v33;

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10027C030;
  v61[3] = &unk_1003610D0;
  v35 = v32;
  v62 = v35;
  v36 = objc_retainBlock(v61);
  waitForPOIState = v35->_waitForPOIState;
  v35->_waitForPOIState = v36;

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10027C28C;
  v59[3] = &unk_1003610D0;
  v38 = v35;
  v60 = v38;
  v39 = objc_retainBlock(v59);
  waitForSOSState = v38->_waitForSOSState;
  v38->_waitForSOSState = v39;

  v41 = [CSHSMObjc alloc];
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v42 = (id)qword_100387338;
  v43 = -[CSHSMObjc initWithCategory:state:](v41, "initWithCategory:state:", v42, v29->_idleState);
  hsm = v38->_hsm;
  v38->_hsm = v43;

  v45 = (CLTimer *)-[CLSilo newTimer](self->_silo, "newTimer");
  triggerTimer = v38->_triggerTimer;
  v38->_triggerTimer = v45;

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10027C510;
  v57[3] = &unk_10034B158;
  v47 = v38;
  v58 = v47;
  -[CLTimer setHandler:](v38->_triggerTimer, "setHandler:", v57);
  companionUUIDPreSession = v47->_companionUUIDPreSession;
  v47->_companionUUIDPreSession = 0;

  v47->_inSession = 0;
  v47->_forceFeatureBitmap = 0;
  v47->_savedForceState[5] = -1;
  v47->_savedForceState[9] = -1;
  v49 = objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  geoMapSvc = v47->_geoMapSvc;
  v47->_geoMapSvc = (GEOMapService *)v49;

  if (!v47->_geoMapSvc)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v51 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "unable to get geo map service", buf, 2u);
    }
  }
  v47->_aop = v28;
  v52 = v58;
  v53 = v47;

  objc_destroyWeak(&location);
  return v53;
}

- (void)queryIfNearAmusementPark
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  double v20;
  double v21;
  uint64_t v22;
  uint8_t buf[4];
  double v24;

  if (self->_poiGpsSample)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
    objc_msgSend(v3, "doubleForKey:", CFSTR("CSRollerCoasterProxyPOIRadius"));
    v5 = v4;

    if (v5 == 0.0)
      v5 = 100.0;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v6 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "querying for radius %{public}f", buf, 0xCu);
    }
    v7 = *((float *)-[CSSPUGps c_struct](self->_poiGpsSample, "c_struct") + 4);
    v8 = *((float *)-[CSSPUGps c_struct](self->_poiGpsSample, "c_struct") + 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
    v22 = GEOSpatialPlaceLookupCategoryAmusementParkRide;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v11 = v7;
    v12 = v8;
    v13 = objc_msgSend(objc_alloc((Class)GEOSpatialPlaceLookupParameters), "initWithCoordinate:radius:categories:maxResultCount:", v10, 10, v11, v12, v5);
    objc_msgSend(v9, "addObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapService ticketForSpatialPlaceLookupParameters:traits:](self->_geoMapSvc, "ticketForSpatialPlaceLookupParameters:traits:", v9, 0));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10027C8E8;
    v18[3] = &unk_1003639E0;
    v18[4] = self;
    v15 = v9;
    v19 = v15;
    v20 = v11;
    v21 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CLSilo queue](self->_silo, "queue"));
    objc_msgSend(v14, "submitWithHandler:queue:", v18, v16);

  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v17 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "no gps sample to resolve LOI", buf, 2u);
    }
    self->_POIResolutionComplete = 0;
    -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 6, 0);
  }
}

- (void)escalateCrashDecision
{
  CLKappaAlgFlowController *value;
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  char v14;
  CSMSLDataRecording *mslRecording;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _BOOL4 canCollectData;
  _BOOL4 companionConnected;
  double fractionalAudio;
  int triggerPathBitmap;
  _BOOL4 isCrashDetected;
  _BOOL4 isRolloverCrashDetected;
  _BOOL4 isHighSpeedCrashDetected;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  double v34;
  double v35;
  int v36;
  int v37;
  double v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  int v47;
  _BOOL4 isAirbagDetectedOverWindow;
  _BOOL4 possibleRollerCoaster;
  int v50;
  void *v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  uint64_t v62;
  std::__shared_weak_count *v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  _BOOL4 v69;
  __int16 v70;
  _BOOL4 v71;
  __int16 v72;
  double v73;
  __int16 v74;
  int v75;
  __int16 v76;
  _BOOL4 v77;
  __int16 v78;
  _BOOL4 v79;
  __int16 v80;
  _BOOL4 v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  __int16 v92;
  int v93;
  __int16 v94;
  int v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  __int16 v100;
  int v101;
  __int16 v102;
  int v103;
  __int16 v104;
  double v105;
  __int16 v106;
  int v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;
  __int16 v114;
  double v115;
  __int16 v116;
  double v117;
  __int16 v118;
  double v119;
  __int16 v120;
  double v121;
  __int16 v122;
  int v123;
  __int16 v124;
  _BOOL4 v125;
  __int16 v126;
  _BOOL4 v127;
  __int16 v128;
  int v129;
  const __CFString *v130;
  void *v131;

  value = self->fFlowControl.__ptr_.__value_;
  v5 = *((_QWORD *)value + 50);
  v4 = (std::__shared_weak_count *)*((_QWORD *)value + 51);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v62 = v5;
  v63 = v4;
  sub_10003B4AC((uint64_t)&v62, &v64);
  v8 = v63;
  if (v63)
  {
    v9 = (unint64_t *)&v63->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v64 + 152))(&v58);
  sub_100032864((uint64_t)&v58, &v60);
  v11 = v59;
  if (v59)
  {
    v12 = (unint64_t *)&v59->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = *(_BYTE *)(v60 + 120);
  mslRecording = self->_mslRecording;
  v130 = CFSTR("highSensitivityBitmap");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v60 + 412)));
  v131 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1));
  -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v17);

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v18 = (id)qword_100387338;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
    canCollectData = self->_canCollectData;
    companionConnected = self->_companionConnected;
    fractionalAudio = self->_fractionalAudio;
    triggerPathBitmap = self->_triggerPathBitmap;
    isCrashDetected = self->_isCrashDetected;
    isRolloverCrashDetected = self->_isRolloverCrashDetected;
    isHighSpeedCrashDetected = self->_isHighSpeedCrashDetected;
    v27 = *(_DWORD *)(v60 + 216);
    v28 = *(_DWORD *)(v60 + 220);
    v29 = *(_DWORD *)(v60 + 224);
    v30 = *(_DWORD *)(v60 + 228);
    v32 = *(_DWORD *)(v60 + 232);
    v31 = *(_DWORD *)(v60 + 236);
    v33 = *(_DWORD *)(v60 + 280);
    v34 = *(float *)(v60 + 284);
    v35 = *(float *)(v60 + 288);
    v36 = *(unsigned __int8 *)(v60 + 297);
    v37 = *(_DWORD *)(v60 + 300);
    v38 = *(float *)(v60 + 304);
    v39 = *(unsigned __int8 *)(v60 + 308);
    v40 = *(_QWORD *)(v60 + 312);
    v41 = *(_DWORD *)(v60 + 320);
    v42 = *(_DWORD *)(v60 + 324);
    v43 = *(float *)(v60 + 328);
    v44 = *(float *)(v60 + 332);
    v45 = *(float *)(v60 + 336);
    v46 = *(float *)(v60 + 340);
    v47 = *(_DWORD *)(v60 + 344);
    isAirbagDetectedOverWindow = self->_isAirbagDetectedOverWindow;
    possibleRollerCoaster = self->_possibleRollerCoaster;
    v50 = *(_DWORD *)(v60 + 292);
    *(_DWORD *)buf = 138551298;
    v67 = v19;
    v68 = 1026;
    v69 = canCollectData;
    v70 = 1026;
    v71 = companionConnected;
    v72 = 2050;
    v73 = fractionalAudio;
    v74 = 1026;
    v75 = triggerPathBitmap;
    v76 = 1026;
    v77 = isCrashDetected;
    v78 = 1026;
    v79 = isRolloverCrashDetected;
    v80 = 1026;
    v81 = isHighSpeedCrashDetected;
    v82 = 1026;
    v83 = v27;
    v84 = 1026;
    v85 = v28;
    v86 = 1026;
    v87 = v29;
    v88 = 1026;
    v89 = v30;
    v90 = 1026;
    v91 = v32;
    v92 = 1026;
    v93 = v31;
    v94 = 1026;
    v95 = v33;
    v96 = 2050;
    v97 = v34;
    v98 = 2050;
    v99 = v35;
    v100 = 1026;
    v101 = v36;
    v102 = 1026;
    v103 = v37;
    v104 = 2050;
    v105 = v38;
    v106 = 1026;
    v107 = v39;
    v108 = 2050;
    v109 = v40;
    v110 = 1026;
    v111 = v41;
    v112 = 1026;
    v113 = v42;
    v114 = 2050;
    v115 = v43;
    v116 = 2050;
    v117 = v44;
    v118 = 2050;
    v119 = v45;
    v120 = 2050;
    v121 = v46;
    v122 = 1026;
    v123 = v47;
    v124 = 1026;
    v125 = isAirbagDetectedOverWindow;
    v126 = 1026;
    v127 = possibleRollerCoaster;
    v128 = 1026;
    v129 = v50;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Crash context: %{public}@ %{public}d %{public}d %{public}0.3f %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}0.3f %{public}0.3f %{public}d %{public}d %{public}0.3f %{public}d %{public}llu %{public}d %{public}d %{public}0.3f %{public}0.3f %{public}0.3f %{public}0.3f %{public}d %{public}d %{public}d %{public}d ", buf, 0xEAu);

  }
  self->_SOSInProgress = 1;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
  +[CSFeedbackAssistant showFeedbackAssistantSurveyWithUUID:](CSFeedbackAssistant, "showFeedbackAssistantSurveyWithUUID:", v51);

  -[CSSafetySOSStateMachine feedDetectionDecision:uuid:forMode:](self->_sosSM, "feedDetectionDecision:uuid:forMode:", v14 & 1, self->_uuid, 1);
  -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 1, 0);
  v52 = v61;
  if (v61)
  {
    v53 = (unint64_t *)&v61->__shared_owners_;
    do
      v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
  v55 = v65;
  if (v65)
  {
    v56 = (unint64_t *)&v65->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
}

- (void)evaluateCrashWithPOI
{
  NSObject *v3;
  _BOOL4 POIResolutionComplete;
  _BOOL4 isNearAmusementParkPOI;
  CLKappaAlgFlowController *value;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  _BOOL4 canCollectData;
  _BOOL4 companionConnected;
  double fractionalAudio;
  int triggerPathBitmap;
  _BOOL4 isCrashDetected;
  _BOOL4 isRolloverCrashDetected;
  _BOOL4 isHighSpeedCrashDetected;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  double v33;
  double v34;
  int v35;
  int v36;
  double v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  _BOOL4 isAirbagDetectedOverWindow;
  _BOOL4 possibleRollerCoaster;
  int v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  NSObject *v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  uint8_t buf[4];
  _BYTE v66[10];
  _BOOL4 v67;
  __int16 v68;
  _BOOL4 v69;
  __int16 v70;
  double v71;
  __int16 v72;
  int v73;
  __int16 v74;
  _BOOL4 v75;
  __int16 v76;
  _BOOL4 v77;
  __int16 v78;
  _BOOL4 v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  __int16 v92;
  int v93;
  __int16 v94;
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  int v99;
  __int16 v100;
  int v101;
  __int16 v102;
  double v103;
  __int16 v104;
  int v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  int v109;
  __int16 v110;
  int v111;
  __int16 v112;
  double v113;
  __int16 v114;
  double v115;
  __int16 v116;
  double v117;
  __int16 v118;
  double v119;
  __int16 v120;
  int v121;
  __int16 v122;
  _BOOL4 v123;
  __int16 v124;
  _BOOL4 v125;
  __int16 v126;
  int v127;

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v3 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    POIResolutionComplete = self->_POIResolutionComplete;
    isNearAmusementParkPOI = self->_isNearAmusementParkPOI;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v66 = POIResolutionComplete;
    *(_WORD *)&v66[4] = 1024;
    *(_DWORD *)&v66[6] = isNearAmusementParkPOI;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "evaluate crash with POI resolved %d poi %d", buf, 0xEu);
  }
  if (self->_POIResolutionComplete && self->_isNearAmusementParkPOI)
  {
    value = self->fFlowControl.__ptr_.__value_;
    v8 = *((_QWORD *)value + 50);
    v7 = (std::__shared_weak_count *)*((_QWORD *)value + 51);
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v61 = v8;
    v62 = v7;
    sub_10003B4AC((uint64_t)&v61, &v63);
    v11 = v62;
    if (v62)
    {
      v12 = (unint64_t *)&v62->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v63 + 152))(&v57);
    sub_100032864((uint64_t)&v57, &v59);
    v14 = v58;
    if (v58)
    {
      v15 = (unint64_t *)&v58->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v17 = (id)qword_100387338;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
      canCollectData = self->_canCollectData;
      companionConnected = self->_companionConnected;
      fractionalAudio = self->_fractionalAudio;
      triggerPathBitmap = self->_triggerPathBitmap;
      isCrashDetected = self->_isCrashDetected;
      isRolloverCrashDetected = self->_isRolloverCrashDetected;
      isHighSpeedCrashDetected = self->_isHighSpeedCrashDetected;
      v26 = *(_DWORD *)(v59 + 216);
      v27 = *(_DWORD *)(v59 + 220);
      v28 = *(_DWORD *)(v59 + 224);
      v29 = *(_DWORD *)(v59 + 228);
      v31 = *(_DWORD *)(v59 + 232);
      v30 = *(_DWORD *)(v59 + 236);
      v32 = *(_DWORD *)(v59 + 280);
      v33 = *(float *)(v59 + 284);
      v34 = *(float *)(v59 + 288);
      v35 = *(unsigned __int8 *)(v59 + 297);
      v36 = *(_DWORD *)(v59 + 300);
      v37 = *(float *)(v59 + 304);
      v38 = *(unsigned __int8 *)(v59 + 308);
      v39 = *(_QWORD *)(v59 + 312);
      v40 = *(_DWORD *)(v59 + 320);
      v41 = *(_DWORD *)(v59 + 324);
      v42 = *(float *)(v59 + 328);
      v43 = *(float *)(v59 + 332);
      v44 = *(float *)(v59 + 336);
      v45 = *(float *)(v59 + 340);
      v46 = *(_DWORD *)(v59 + 344);
      isAirbagDetectedOverWindow = self->_isAirbagDetectedOverWindow;
      possibleRollerCoaster = self->_possibleRollerCoaster;
      v49 = *(_DWORD *)(v59 + 292);
      *(_DWORD *)buf = 138551298;
      *(_QWORD *)v66 = v18;
      *(_WORD *)&v66[8] = 1026;
      v67 = canCollectData;
      v68 = 1026;
      v69 = companionConnected;
      v70 = 2050;
      v71 = fractionalAudio;
      v72 = 1026;
      v73 = triggerPathBitmap;
      v74 = 1026;
      v75 = isCrashDetected;
      v76 = 1026;
      v77 = isRolloverCrashDetected;
      v78 = 1026;
      v79 = isHighSpeedCrashDetected;
      v80 = 1026;
      v81 = v26;
      v82 = 1026;
      v83 = v27;
      v84 = 1026;
      v85 = v28;
      v86 = 1026;
      v87 = v29;
      v88 = 1026;
      v89 = v31;
      v90 = 1026;
      v91 = v30;
      v92 = 1026;
      v93 = v32;
      v94 = 2050;
      v95 = v33;
      v96 = 2050;
      v97 = v34;
      v98 = 1026;
      v99 = v35;
      v100 = 1026;
      v101 = v36;
      v102 = 2050;
      v103 = v37;
      v104 = 1026;
      v105 = v38;
      v106 = 2050;
      v107 = v39;
      v108 = 1026;
      v109 = v40;
      v110 = 1026;
      v111 = v41;
      v112 = 2050;
      v113 = v42;
      v114 = 2050;
      v115 = v43;
      v116 = 2050;
      v117 = v44;
      v118 = 2050;
      v119 = v45;
      v120 = 1026;
      v121 = v46;
      v122 = 1026;
      v123 = isAirbagDetectedOverWindow;
      v124 = 1026;
      v125 = possibleRollerCoaster;
      v126 = 1026;
      v127 = v49;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Non escalated crash context: %{public}@ %{public}d %{public}d %{public}0.3f %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}0.3f %{public}0.3f %{public}d %{public}d %{public}0.3f %{public}d %{public}llu %{public}d %{public}d %{public}0.3f %{public}0.3f %{public}0.3f %{public}0.3f %{public}d %{public}d %{public}d %{public}d ", buf, 0xEAu);

    }
    -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 3, 0);
    v50 = v60;
    if (v60)
    {
      v51 = (unint64_t *)&v60->__shared_owners_;
      do
        v52 = __ldaxr(v51);
      while (__stlxr(v52 - 1, v51));
      if (!v52)
      {
        ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
        std::__shared_weak_count::__release_weak(v50);
      }
    }
    v53 = v64;
    if (v64)
    {
      v54 = (unint64_t *)&v64->__shared_owners_;
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
  }
  else
  {
    -[CSKappaDetectionService escalateCrashDecision](self, "escalateCrashDecision");
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v56 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "sos active", buf, 2u);
    }
    -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 4, 0);
  }
}

- (void)updateCompanion
{
  NSObject *v3;
  NSUUID *uuid;
  CSCompanionServiceProtocol *companionProxy;
  void *v6;
  __int128 v7;

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v3 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    LODWORD(v7) = 138543362;
    *(_QWORD *)((char *)&v7 + 4) = uuid;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Forward trigger UUID %{public}@ to companion", (uint8_t *)&v7, 0xCu);
  }
  v7 = 0uLL;
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", &v7);
  companionProxy = self->_companionProxy;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 16));
  -[CSCompanionServiceProtocol sendData:type:](companionProxy, "sendData:type:", v6, 1);

}

- (void)sendCompanionUUID:(id)a3
{
  id v4;
  const CompanionUUID *v5;
  id v6;
  void *v7;
  std::string __p;

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString")));
  sub_100007088(&__p, (char *)objc_msgSend(v4, "UTF8String"));

  v6 = KappaCompanion::serializeCompanionUUID(&__p, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v7, 203);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)receiveCompanionUUID:(id)a3
{
  KappaCompanion::deserializeCompanionUUID((KappaCompanion *)a3, (const NSData *)a2);
}

- (void)forceCompanionTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  __int128 *v6;
  __int128 v7;
  CSCompanionServiceProtocol *companionProxy;
  void *v9;
  double triggerTime;
  __int128 v11;
  __int128 v12;

  v4 = a3;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v5 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
  {
    LOWORD(triggerTime) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "forcing companion to trigger", (uint8_t *)&triggerTime, 2u);
  }
  triggerTime = self->_triggerTime;
  v6 = (__int128 *)objc_msgSend(v4, "c_struct", *(_QWORD *)&triggerTime);
  v7 = *v6;
  v12 = v6[1];
  v11 = v7;
  companionProxy = self->_companionProxy;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &triggerTime, 40));
  -[CSCompanionServiceProtocol sendData:type:](companionProxy, "sendData:type:", v9, 3);

}

- (void)companionConnectedAck:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  CSArmedSeconds *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _BYTE v16[12];
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint8_t buf[4];
  signed int v24;
  char v25[20];
  int v26;
  int KappaToken;
  unsigned int v28;

  v3 = *(_QWORD *)&a3;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v5 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "request response from companion %d", buf, 8u);
  }
  if ((v3 - 4) < 2 || (v3 - 101) < 2)
  {
    *(_DWORD *)buf = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
    v24 = objc_msgSend(v6, "getSystemHardware");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getSystemModel")));
    strncpy(v25, (const char *)objc_msgSend(v7, "UTF8String"), 0x14uLL);

    if (objc_msgSend(v6, "isKappaLoggingDevice"))
    {
      v26 = 0;
    }
    else if (objc_msgSend(v6, "isKappaDetectionDevice"))
    {
      v26 = 1;
    }
    else
    {
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v9 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "invalid kappa device detected", v16, 2u);
      }
    }
    KappaToken = getKappaToken(0);
    v10 = objc_alloc_init(CSArmedSeconds);
    if (self->_isLoggingDevice)
    {
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v11 = qword_100387338;
      if (!os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
        goto LABEL_34;
      *(_WORD *)v16 = 0;
      v12 = "query armed state not supported";
    }
    else
    {
      if ((CSAOPSvc::getArmedState((id *)self->_aop, v10) & 1) != 0)
      {
        v28 = -[CSArmedSeconds isArmed](v10, "isArmed");
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v13 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v16 = 67109120;
          *(_DWORD *)&v16[4] = v28;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "queried isArmed:%d", v16, 8u);
        }
        goto LABEL_35;
      }
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v11 = qword_100387338;
      if (!os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
      {
LABEL_34:
        v28 = -1;
LABEL_35:
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v14 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v16 = 134218754;
          *(_QWORD *)&v16[4] = v24;
          v17 = 2080;
          v18 = v25;
          v19 = 1024;
          v20 = v26;
          v21 = 1024;
          v22 = KappaToken;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "sending device info %lu %s %d %d", v16, 0x22u);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 40, *(_QWORD *)v16));
        -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v15, v3);

        return;
      }
      *(_WORD *)v16 = 0;
      v12 = "query get armed state failed";
    }
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, v16, 2u);
    goto LABEL_34;
  }
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v8 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "invalid opcode", buf, 2u);
  }
}

- (void)companionConnectedAckHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  CSMSLDataRecording *mslRecording;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CLKappaAlgFlowController *value;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  uint8_t v34[4];
  uint64_t v35;
  __int16 v36;
  __int128 *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  unsigned int v43;
  int v44;
  __int128 v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  uint8_t buf[4];
  int v50;
  __int128 v51;
  int v52;
  uint64_t v53;
  unsigned int v54;

  v10 = a4;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v11 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "companionConnectedAckHandler", buf, 2u);
  }
  *(_DWORD *)buf = 1;
  objc_msgSend(v10, "getBytes:length:", buf, 40);
  if (self->_inSession)
  {
    if (*(int *)buf >= 1)
    {
      v45 = v51;
      v8 = v50;
      v7 = v53;
      v44 = v50;
      v46 = v52;
      v47 = v53;
      v6 = HIDWORD(v53);
      v5 = v54;
      v48 = v54;
    }
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v13 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 134350082;
      v35 = v8;
      v36 = 2082;
      v37 = &v45;
      v38 = 1026;
      v39 = v7;
      v40 = 1026;
      v41 = v6;
      v42 = 1026;
      v43 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "received companion device info %{public}lu %{public}s %{public}d %{public}d %{public}d", v34, 0x28u);
    }
    mslRecording = self->_mslRecording;
    v33[0] = &__kCFBooleanTrue;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v45, CFSTR("companionConnected"), CFSTR("companionDeviceModel")));
    v33[1] = v15;
    v32[2] = CFSTR("companionDeviceType");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v47));
    v33[2] = v16;
    v32[3] = CFSTR("companionTokenCount");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v47)));
    v33[3] = v17;
    v32[4] = CFSTR("companionArmedStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v48));
    v33[4] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 5));
    -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v19);

    self->_companionDeviceType = v47;
    -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 10, 0);
    value = self->fFlowControl.__ptr_.__value_;
    v21 = *((_QWORD *)value + 38);
    v22 = (std::__shared_weak_count *)*((_QWORD *)value + 39);
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v24 = __ldxr(p_shared_owners);
      while (__stxr(v24 + 1, p_shared_owners));
      value = self->fFlowControl.__ptr_.__value_;
    }
    *(_BYTE *)(v21 + 90) = 1;
    v25 = *((_QWORD *)value + 40);
    v26 = (std::__shared_weak_count *)*((_QWORD *)value + 41);
    if (v26)
    {
      v27 = (unint64_t *)&v26->__shared_owners_;
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
      *(_BYTE *)(v25 + 81) = 1;
      self->_companionConnected = 1;
      do
        v29 = __ldaxr(v27);
      while (__stlxr(v29 - 1, v27));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    else
    {
      *(_BYTE *)(v25 + 81) = 1;
      self->_companionConnected = 1;
    }
    if (v22)
    {
      v30 = (unint64_t *)&v22->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v12 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "companion out of sync, session not in progress", v34, 2u);
    }
  }

}

- (void)companionDecidedToUploadHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v6;
  NSObject *v7;
  CSMSLDataRecording *mslRecording;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  CSStudiesServerUploadOutOfBandMetadata *v13;
  void *v14;
  CSStudiesServerUploadOutOfBandMetadata *v15;
  void *v16;
  const __CFString *v17;
  uint8_t buf[8];
  uint64_t v19;

  v6 = a4;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v7 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Companion decided to upload", buf, 2u);
  }
  if (objc_msgSend(v6, "length") == (id)16)
  {
    mslRecording = self->_mslRecording;
    if (mslRecording)
    {
      -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", &off_10036DD98);
    }
    else
    {
      *(_QWORD *)buf = 0;
      v19 = 0;
      v10 = objc_retainAutorelease(v6);
      memcpy(buf, objc_msgSend(v10, "bytes"), (size_t)objc_msgSend(v10, "length"));
      v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", buf);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

      v13 = [CSStudiesServerUploadOutOfBandMetadata alloc];
      v16 = v12;
      v17 = CFSTR("companionUploaded");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v15 = -[CSStudiesServerUploadOutOfBandMetadata initWithLookingBack:keyValuePairs:](v13, "initWithLookingBack:keyValuePairs:", v14, 300.0);

      -[CSStudiesServerUploader addOutOfBandMetadata:error:](self->_uploader, "addOutOfBandMetadata:error:", v15, 0);
    }
  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v9 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "incorrect number of bytes for uuid", buf, 2u);
    }
  }

}

- (void)triggered:(id)a3
{
  id v4;
  _QWORD *v5;
  NSObject *v6;
  int triggerPathBitmap;
  NSObject *v8;
  unint64_t triggerAOPTime;
  int triggerAOPArmedSec;
  _BOOL4 triggerAOPHasBTCarplay;
  NSObject *v12;
  double companionTriggerTime;
  double v14;
  void *v15;
  void *v16;
  CSMSLDataRecording *mslRecording;
  void *v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  double v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;

  v4 = a3;
  -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 1, 0);
  v5 = objc_msgSend(v4, "c_struct");
  self->_triggerPathBitmap |= *((_BYTE *)objc_msgSend(v4, "c_struct") + 1);
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v6 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
  {
    triggerPathBitmap = self->_triggerPathBitmap;
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = triggerPathBitmap;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_triggerPathBitmap %x", buf, 8u);
  }
  if (self->_triggerTime == 0.0)
  {
    self->_triggerTime = CFAbsoluteTimeGetCurrent();
    self->_triggerAOPTime = *((_QWORD *)objc_msgSend(v4, "c_struct") + 1);
    self->_triggerAOPArmedSec = *((_WORD *)objc_msgSend(v4, "c_struct") + 1);
    self->_triggerAOPHasBTCarplay = *((_BYTE *)objc_msgSend(v4, "c_struct") + 28) == 1;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v8 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      triggerAOPTime = self->_triggerAOPTime;
      triggerAOPArmedSec = self->_triggerAOPArmedSec;
      triggerAOPHasBTCarplay = self->_triggerAOPHasBTCarplay;
      *(_DWORD *)buf = 134218496;
      v24 = *(double *)&triggerAOPTime;
      v25 = 1024;
      v26 = triggerAOPArmedSec;
      v27 = 1024;
      v28 = triggerAOPHasBTCarplay;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "logging trigger %llu %d %d", buf, 0x18u);
    }
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v12 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      companionTriggerTime = self->_companionTriggerTime;
      *(_DWORD *)buf = 134217984;
      v24 = companionTriggerTime;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "_companionTriggerTime %f", buf, 0xCu);
    }
    v14 = self->_companionTriggerTime;
    if (v14 != 0.0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_triggerTime - v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));

      mslRecording = self->_mslRecording;
      v21 = CFSTR("deltaTrigger");
      v22 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v18);

    }
    -[CSKappaDetectionService companionConnectedAck:](self, "companionConnectedAck:", 101);
    -[CSKappaDetectionService sendDeviceInfoProtobuf](self, "sendDeviceInfoProtobuf");
  }
  if ((*((_BYTE *)objc_msgSend(v4, "c_struct") + 1) & 0xB) != 0)
  {
    -[CSKappaDetectionService forceCompanionTrigger:](self, "forceCompanionTrigger:", v4);
    -[CSKappaDetectionService sendForceTriggerProtobuf:](self, "sendForceTriggerProtobuf:", v4);
  }
  -[CSSafetySOSStateMachine feedPotentialEventWithTimestamp:forMode:](self->_sosSM, "feedPotentialEventWithTimestamp:forMode:", v5[1], 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(v4, "c_struct"), 112));
  -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 2, v19);

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v20 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "(re)start the flow controller", buf, 2u);
  }
  CLKappaAlgFlowController::start(self->fFlowControl.__ptr_.__value_, *((_QWORD *)objc_msgSend(v4, "c_struct") + 1));

}

- (void)sendDeviceInfoProtobuf
{
  void *v3;
  unsigned int v4;
  id v5;
  char *v6;
  int v7;
  NSObject *v8;
  CSArmedClients *v9;
  NSObject *v10;
  const CompanionDeviceInfo *v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *__p;
  char v16;
  int v17;
  int v18;
  int KappaToken;
  int MartyToken;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  v4 = objc_msgSend(v3, "getSystemHardware");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSystemModel")));
  v6 = (char *)objc_msgSend(v5, "UTF8String");

  if ((objc_msgSend(v3, "isKappaLoggingDevice") & 1) != 0)
  {
    v7 = 0;
  }
  else if ((objc_msgSend(v3, "isKappaDetectionDevice") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_100363A40);
    v8 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "invalid kappa device type detected", (uint8_t *)&v14, 2u);
    }
    v7 = -1;
  }
  v9 = objc_alloc_init(CSArmedClients);
  if ((CSAOPSvc::getArmedClients((id *)self->_aop, v9) & 1) == 0)
  {
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_100363A40);
    v10 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to get armed clients state", (uint8_t *)&v14, 2u);
    }
  }
  v14 = v4;
  sub_100007088(&__p, v6);
  v17 = v7;
  v18 = 0;
  KappaToken = getKappaToken(0);
  MartyToken = getMartyToken(0);
  v21 = -[CSArmedClients kappaArmedSeconds](v9, "kappaArmedSeconds");
  v22 = -[CSArmedClients martyArmedSecondsLocal](v9, "martyArmedSecondsLocal");
  v23 = -[CSArmedClients enableMode](v9, "enableMode");
  v12 = KappaCompanion::serializeDeviceInfo((KappaCompanion *)&v14, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v13, 201);

  if (v16 < 0)
    operator delete(__p);

}

- (void)sendForceTriggerProtobuf:(id)a3
{
  id v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  const CompanionTrigger *v11;
  id v12;
  void *v13;
  CFAbsoluteTime Current;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = a3;
  if (!v4)
  {
    sub_100289D20(&Current);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 1000, "-[CSKappaDetectionService sendForceTriggerProtobuf:]");
    __break(1u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v5 = (__int128 *)objc_msgSend(v4, "c_struct");
  v6 = *v5;
  v7 = v5[1];
  v17 = v5[2];
  v16 = v7;
  v15 = v6;
  v8 = v5[3];
  v9 = v5[4];
  v10 = v5[5];
  v21 = v5[6];
  v20 = v10;
  v19 = v9;
  v18 = v8;
  v12 = KappaCompanion::serializeTrigger((float16x4_t *)&Current, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v13, 202);

}

- (void)receiveForceTriggerProtobuf:(id)a3
{
  CompanionTrigger *v4;
  CompanionTrigger *value;
  CompanionTrigger *v6;
  _QWORD v7[2];

  KappaCompanion::deserializeTrigger((KappaCompanion *)a3, (const NSData *)a2);
  v4 = (CompanionTrigger *)v7[0];
  v7[0] = 0;
  value = self->_kappaCompanionTrigger.__ptr_.__value_;
  self->_kappaCompanionTrigger.__ptr_.__value_ = v4;
  if (value)
    operator delete();
  v6 = self->_kappaCompanionTrigger.__ptr_.__value_;
  if ((*((_BYTE *)v6 + 9) & 4) == 0)
  {
    LOWORD(v7[0]) = 1027;
    BYTE2(v7[0]) = 0;
    v7[1] = *((_QWORD *)v6 + 2);
    CSAOPSvc::sendCommand((CSAOPSvc *)self->_aop, (const unsigned __int8 *)v7, 0x10u);
  }
}

- (void)receiveDeviceInfoProtobuf:(id)a3
{
  KappaCompanion::deserializeDeviceInfo((KappaCompanion *)a3, (const NSData *)a2);
}

- (int64_t)getMaxTriggerSessionInSecondsDefault
{
  void *v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MaxSessionTimeInSeconds")));
  if (v3)
  {
    v4 = (uint64_t)objc_msgSend(v2, "integerForKey:", CFSTR("MaxSessionTimeInSeconds"));
    if (v4 >= 600)
      v5 = 600;
    else
      v5 = v4;
  }
  else
  {
    v5 = 120;
  }

  return v5;
}

- (void)initFlowController
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;

  v2 = -[CSKappaDetectionService getMaxTriggerSessionInSecondsDefault](self, "getMaxTriggerSessionInSecondsDefault");
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v3 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "configuring flow controller to have a max session of %llu seconds", (uint8_t *)&v4, 0xCu);
  }
  operator new();
}

- (void)initSession
{
  CSKappaDetectionService *v2;
  NSUUID *companionUUID;
  void *v4;

  v2 = self;
  -[CSKappaDetectionService initFlowController](self, "initFlowController");
  v2->_SOSInProgress = 0;
  v2->_gpsCount = 0;
  v2->_epochTimestamp = 0;
  v2->_epochNumber = 0;
  v2->_companionDeviceType = -1;
  companionUUID = v2->_companionUUID;
  v2->_companionUUID = 0;

  *(_WORD *)&v2->_samplingBitmap = 0;
  v2->_lastEpochTime = 0.0;
  v2->_fractionalAudio = -1.0;
  v2->_tellCompanionToUpload = 0;
  v2->_companionConnected = 0;
  -[CLTimer setNextFireDelay:interval:](v2->_triggerTimer, "setNextFireDelay:interval:", 600.0, 1.79769313e308);
  *(_QWORD *)&v2->_sessionDetails.trigger_bitmap = 0;
  v2 = (CSKappaDetectionService *)((char *)v2 + 252);
  HIDWORD(v2[-1]._kappaConnectionServer) = -1082130432;
  v2->_uuid = 0;
  v2->_companionUUIDPreSession = 0;
  LODWORD(v2->_companionUUID) = 0;
  *(int32x2_t *)((char *)&v2->_companionUUID + 4) = vdup_n_s32(0x447A0000u);
  *(CompanionUUID **)((char *)&v2->_kappaCompanionUUID.__ptr_.__value_ + 4) = (CompanionUUID *)0x3E8447A0000;
  *(_OWORD *)((char *)&v2->_sosSM + 4) = 0u;
  *(_OWORD *)((char *)&v2->_idleState + 4) = 0u;
  *(_OWORD *)((char *)&v2->_waitForSOSState + 4) = 0u;
  *(_OWORD *)((char *)&v2->fFlowControl.__ptr_.__value_ + 4) = 0u;
  *(_OWORD *)((char *)&v2->_sosTimer + 4) = 0u;
  *(_OWORD *)(&v2->_epochNumber + 1) = 0u;
  *(int *)((char *)&v2->_sessionDetails.maxDeltaVXYBiggestImpact + 1) = 0;
  HIDWORD(v2[-1]._kappaCompanionTrigger.__ptr_.__value_) = 256;
  v4 = *(void **)&v2[-1]._detectionEvent;
  *(_QWORD *)&v2[-1]._detectionEvent = 0;

  *(&v2[-1]._triggerPathBitmap + 2) = 0;
}

- (void)evaluatePossibleCrashDetectorDecision
{
  uint64_t v2;
  char v3;
  void **p_vtable;
  CLKappaAlgFlowController *value;
  CLKappaAlgFlowController *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  _BYTE *v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  BOOL v23;
  NSObject *v24;
  unsigned int v25;
  int v26;
  BOOL v27;
  NSObject *v28;
  _BOOL4 triggerAOPHasBTCarplay;
  int triggerAOPArmedSec;
  _BOOL4 isAirbagDetectedOverWindow;
  _BOOL4 possibleRollerCoaster;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  _BYTE v50[10];
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  _BOOL4 v54;

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_100289E28(0, a2);
LABEL_62:
    __break(1u);
LABEL_63:
    dispatch_once(&qword_100387330, &stru_100363A20);
    goto LABEL_17;
  }
  if ((CLKappaAlgFlowController::isKappaInferencesAlgSevereCrashEnabled(value) & 1) == 0)
  {
    sub_100289F70();
    goto LABEL_62;
  }
  v7 = self->fFlowControl.__ptr_.__value_;
  v9 = *((_QWORD *)v7 + 50);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v7 + 51);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v43 = v9;
  v44 = v8;
  sub_10003B4AC((uint64_t)&v43, &v45);
  v12 = v44;
  if (v44)
  {
    v13 = (unint64_t *)&v44->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v45 + 152))(&v39);
  sub_100032864((uint64_t)&v39, &v41);
  v15 = v40;
  if (v40)
  {
    v16 = (unint64_t *)&v40->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v2 = *(_QWORD *)(v41 + 104);
  v3 = *(_BYTE *)(v41 + 120);
  p_vtable = &OBJC_METACLASS___CSHSMObjc.vtable;
  if (qword_100387330 != -1)
    goto LABEL_63;
LABEL_17:
  v18 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    v48 = v3 & 1;
    v49 = 2050;
    *(_QWORD *)v50 = v2;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[SC] de %{public}d, timestamp %{public}llu", buf, 0x12u);
  }
  v19 = (_BYTE *)v41;
  self->_isCrashDetected |= *(_BYTE *)(v41 + 136);
  self->_isRolloverCrashDetected |= v19[137];
  self->_isHighSpeedCrashDetected |= v19[138];
  self->_isAirbagDetectedOverWindow |= v19[348];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  if (objc_msgSend(v20, "BOOLForKey:", CFSTR("CSRollerCoasterProxyForceBT")))
  {
    if (p_vtable[102] != (void *)-1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v21 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "forcing bt/carplay", buf, 2u);
    }
    self->_triggerAOPHasBTCarplay = 1;
  }
  v22 = objc_msgSend(v20, "BOOLForKey:", CFSTR("CSRollerCoasterProxyForceAirbag"));
  v23 = v22;
  if (v22)
  {
    if (p_vtable[102] != (void *)-1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v24 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "forcing airbag", buf, 2u);
    }
    self->_isAirbagDetectedOverWindow = v23;
  }
  if (!*(_BYTE *)(v41 + 120)
    || (objc_msgSend(v20, "BOOLForKey:", CFSTR("CSRollerCoasterProxyDeescalationDisabled")) & 1) != 0
    || self->_checkForPOI)
  {
    goto LABEL_66;
  }
  v25 = objc_msgSend(v20, "integerForKey:", CFSTR("CSRollerCoasterProxyArmedSecThreshold"));
  if (v25)
    v26 = v25;
  else
    v26 = 60;
  v27 = self->_possibleRollerCoaster & ~self->_triggerAOPHasBTCarplay & (v26 > self->_triggerAOPArmedSec);
  if (self->_isAirbagDetectedOverWindow)
    v27 = 0;
  self->_possibleRollerCoaster = v27;
  if (p_vtable[102] != (void *)-1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v28 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    triggerAOPHasBTCarplay = self->_triggerAOPHasBTCarplay;
    triggerAOPArmedSec = self->_triggerAOPArmedSec;
    isAirbagDetectedOverWindow = self->_isAirbagDetectedOverWindow;
    possibleRollerCoaster = self->_possibleRollerCoaster;
    *(_DWORD *)buf = 67241216;
    v48 = triggerAOPHasBTCarplay;
    v49 = 1026;
    *(_DWORD *)v50 = triggerAOPArmedSec;
    *(_WORD *)&v50[4] = 1026;
    *(_DWORD *)&v50[6] = v26;
    v51 = 1026;
    v52 = isAirbagDetectedOverWindow;
    v53 = 1026;
    v54 = possibleRollerCoaster;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "bt/carplay %{public}d armed %{public}d %{public}d airbag %{public}d proxy %{public}d", buf, 0x20u);
  }
  if (!self->_possibleRollerCoaster)
  {
LABEL_66:
    if (*(_BYTE *)(v41 + 120) && !self->_SOSInProgress && !self->_checkForPOI)
      -[CSKappaDetectionService escalateCrashDecision](self, "escalateCrashDecision");
  }
  else
  {
    self->_checkForPOI = 1;
    -[CSKappaDetectionService queryIfNearAmusementPark](self, "queryIfNearAmusementPark");
    -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 5, 0);
  }

  v33 = v42;
  if (v42)
  {
    v34 = (unint64_t *)&v42->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v36 = v46;
  if (v46)
  {
    v37 = (unint64_t *)&v46->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
}

- (shared_ptr<CLKappaEstimatesAlgCrash>)getCrashBlock
{
  _QWORD *v2;
  CLKappaAlgFlowController *value;
  _QWORD *v5;
  uint64_t isKappaEstimatesAlgCrashEnabled;
  __shared_weak_count *v7;
  CLKappaAlgFlowController *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  CSKappaDetectionService *v13;
  SEL v14;
  shared_ptr<CLKappaEstimatesAlgCrash> result;

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    isKappaEstimatesAlgCrashEnabled = sub_10028A0B8(0, a2);
    goto LABEL_8;
  }
  v5 = v2;
  isKappaEstimatesAlgCrashEnabled = CLKappaAlgFlowController::isKappaEstimatesAlgCrashEnabled(value);
  if ((isKappaEstimatesAlgCrashEnabled & 1) == 0)
  {
LABEL_8:
    v13 = (CSKappaDetectionService *)sub_10028A1F8(isKappaEstimatesAlgCrashEnabled);
    -[CSKappaDetectionService getFractionalAudio](v13, v14);
    goto LABEL_9;
  }
  v8 = self->fFlowControl.__ptr_.__value_;
  v10 = *((_QWORD *)v8 + 38);
  v9 = *((_QWORD *)v8 + 39);
  *v5 = v10;
  v5[1] = v9;
  if (v9)
  {
    v11 = (unint64_t *)(v9 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
LABEL_9:
  result.var1 = v7;
  result.var0 = (CLKappaEstimatesAlgCrash *)isKappaEstimatesAlgCrashEnabled;
  return result;
}

- (float)getFractionalAudio
{
  float FractionalAudioAndLog;
  unint64_t *p_shared_owners;
  unint64_t v4;
  CLKappaEstimatesAlgCrash *v6;
  std::__shared_weak_count *v7;

  -[CSKappaDetectionService getCrashBlock](self, "getCrashBlock");
  FractionalAudioAndLog = CLKappaEstimatesAlgCrash::getFractionalAudioAndLog(v6);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return FractionalAudioAndLog;
}

- (void)updateFractionalAudioMetadata
{
  float v3;
  CSMSLDataRecording *mslRecording;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  -[CSKappaDetectionService getFractionalAudio](self, "getFractionalAudio");
  self->_fractionalAudio = v3;
  mslRecording = self->_mslRecording;
  v8 = CFSTR("fractionalAudioAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v7);

}

- (void)sendLocalAudioToWatch
{
  void **p_vtable;
  double v3;
  CLKappaAlgFlowController *value;
  CLKappaAlgFlowController *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  CFAbsoluteTime Current;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  CSCompanionServiceProtocol *companionProxy;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double v33;
  double v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint8_t buf[4];
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_10028A338(0, a2);
LABEL_35:
    __break(1u);
LABEL_36:
    dispatch_once(&qword_100387330, &stru_100363A20);
    goto LABEL_12;
  }
  if ((CLKappaAlgFlowController::isKappaFeaturesAlgLocalAudioEnabled(value) & 1) == 0)
  {
    sub_10028A480();
    goto LABEL_35;
  }
  v6 = self->fFlowControl.__ptr_.__value_;
  v7 = *((_QWORD *)v6 + 14);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v6 + 15);
  v39 = v7;
  v40 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v7 + 152))(&v35);
  sub_10023E020((uint64_t)&v35, &v37);
  v11 = v36;
  if (v36)
  {
    v12 = (unint64_t *)&v36->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = *(_OWORD *)(v37 + 120);
  v30 = *(_OWORD *)(v37 + 104);
  v31 = v14;
  v32 = *(_OWORD *)(v37 + 136);
  v33 = *(double *)(v37 + 152);
  v15 = *(_OWORD *)(v37 + 88);
  v28 = *(_OWORD *)(v37 + 72);
  v29 = v15;
  Current = CFAbsoluteTimeGetCurrent();
  *(_QWORD *)&v28 = self->_epochTimestamp;
  *((CFAbsoluteTime *)&v31 + 1) = Current;
  v32 = *(_OWORD *)&self->_lastEpochTime;
  v3 = *(double *)&self->_triggerAOPTime;
  v34 = v3;
  p_vtable = &OBJC_METACLASS___CSHSMObjc.vtable;
  if (qword_100387330 != -1)
    goto LABEL_36;
LABEL_12:
  v17 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    v42 = v33;
    v43 = 2050;
    v44 = v3;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sending local audio results to companion %{public}llu %{public}llu", buf, 0x16u);
  }
  if (p_vtable[102] != (void *)-1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v18 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134351104;
    v42 = *((float *)&v28 + 2);
    v43 = 2050;
    v44 = *((float *)&v28 + 3);
    v45 = 2050;
    v46 = *(float *)&v29;
    v47 = 2050;
    v48 = *((float *)&v29 + 1);
    v49 = 1026;
    v50 = BYTE8(v29);
    v51 = 1026;
    v52 = BYTE9(v29);
    v53 = 1026;
    v54 = BYTE10(v29);
    v55 = 1026;
    v56 = BYTE11(v29);
    v57 = 1026;
    v58 = BYTE13(v29);
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sent local audio results (all): %{public}f %{public}f %{public}f %{public}f %{public}d %{public}d %{public}d %{public}d %{public}d", buf, 0x48u);
  }
  if (p_vtable[102] != (void *)-1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v19 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134351104;
    v42 = *((float *)&v28 + 2);
    v43 = 2050;
    v44 = *(float *)&v30;
    v45 = 2050;
    v46 = *((float *)&v30 + 1);
    v47 = 2050;
    v48 = *((float *)&v30 + 2);
    v49 = 1026;
    v50 = BYTE12(v30);
    v51 = 1026;
    v52 = BYTE13(v30);
    v53 = 1026;
    v54 = BYTE14(v30);
    v55 = 1026;
    v56 = HIBYTE(v30);
    v57 = 1026;
    v58 = BYTE1(v31);
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "sent [LA] results (roll): %{public}f %{public}f %{public}f %{public}f %{public}d %{public}d %{public}d %{public}d %{public}d", buf, 0x48u);
  }
  companionProxy = self->_companionProxy;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v28, 96));
  -[CSCompanionServiceProtocol sendData:type:](companionProxy, "sendData:type:", v21, 2);

  v22 = v38;
  if (v38)
  {
    v23 = (unint64_t *)&v38->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = v40;
  if (v40)
  {
    v26 = (unint64_t *)&v40->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
}

- (void)evaluateSamplingAlgFeatures
{
  CLKappaAlgFlowController *value;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  CLKappaAlgFlowController *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  CLKappaAlgFlowController *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  int v25;
  unint64_t *v26;
  unint64_t v27;
  CLKappaAlgFlowController *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  uint64_t v65;
  std::__shared_weak_count *v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  uint64_t v69;
  std::__shared_weak_count *v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  uint64_t v75;
  std::__shared_weak_count *v76;

  value = self->fFlowControl.__ptr_.__value_;
  v4 = *((_QWORD *)value + 16);
  v5 = (std::__shared_weak_count *)*((_QWORD *)value + 17);
  v75 = v4;
  v76 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v4 + 152))(&v71);
  sub_10001DDDC((uint64_t)&v71, &v73);
  v8 = v72;
  if (v72)
  {
    v9 = (unint64_t *)&v72->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (*(_BYTE *)(v73 + 80) || (self->_forceFeatureBitmap & 1) != 0)
    self->_algFeatureBitmap |= 1u;
  v11 = self->fFlowControl.__ptr_.__value_;
  v12 = *((_QWORD *)v11 + 8);
  v13 = (std::__shared_weak_count *)*((_QWORD *)v11 + 9);
  v69 = v12;
  v70 = v13;
  if (v13)
  {
    v14 = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v12 + 152))(&v65);
  sub_100277E70((uint64_t)&v65, &v67);
  v16 = v66;
  if (v66)
  {
    v17 = (unint64_t *)&v66->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if (*(_BYTE *)(v67 + 40) || (self->_forceFeatureBitmap & 2) != 0)
    self->_algFeatureBitmap |= 2u;
  v19 = self->fFlowControl.__ptr_.__value_;
  v20 = *((_QWORD *)v19 + 6);
  v21 = (std::__shared_weak_count *)*((_QWORD *)v19 + 7);
  v63 = v20;
  v64 = v21;
  if (v21)
  {
    v22 = (unint64_t *)&v21->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v20 + 312))(&v61);
  v24 = v62;
  v25 = *(unsigned __int8 *)(v61 + 8);
  if (!v62)
    goto LABEL_30;
  v26 = (unint64_t *)&v62->__shared_owners_;
  do
    v27 = __ldaxr(v26);
  while (__stlxr(v27 - 1, v26));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
    if (v25)
      goto LABEL_34;
  }
  else
  {
LABEL_30:
    if (v25)
    {
LABEL_34:
      self->_algFeatureBitmap |= 4u;
      goto LABEL_35;
    }
  }
  if ((self->_forceFeatureBitmap & 4) != 0)
    goto LABEL_34;
LABEL_35:
  v28 = self->fFlowControl.__ptr_.__value_;
  v29 = *((_QWORD *)v28 + 40);
  v30 = (std::__shared_weak_count *)*((_QWORD *)v28 + 41);
  v61 = v29;
  v62 = v30;
  if (v30)
  {
    v31 = (unint64_t *)&v30->__shared_owners_;
    do
      v32 = __ldxr(v31);
    while (__stxr(v32 + 1, v31));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v29 + 152))(&v57);
  sub_10024D3B8((uint64_t)&v57, &v59);
  v33 = v58;
  if (v58)
  {
    v34 = (unint64_t *)&v58->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  if (*(_BYTE *)(v59 + 316) && *(_BYTE *)(v59 + 296) || (self->_forceFeatureBitmap & 8) != 0)
    self->_algFeatureBitmap |= 8u;
  v36 = v60;
  if (v60)
  {
    v37 = (unint64_t *)&v60->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  v39 = v62;
  if (v62)
  {
    v40 = (unint64_t *)&v62->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  v42 = v64;
  if (v64)
  {
    v43 = (unint64_t *)&v64->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  v45 = v68;
  if (v68)
  {
    v46 = (unint64_t *)&v68->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  v48 = v70;
  if (v70)
  {
    v49 = (unint64_t *)&v70->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  v51 = v74;
  if (v74)
  {
    v52 = (unint64_t *)&v74->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  v54 = v76;
  if (v76)
  {
    v55 = (unint64_t *)&v76->__shared_owners_;
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
}

- (void)populateSessionDetails
{
  CLKappaAlgFlowController *value;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  CLKappaAlgFlowController *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  CLKappaAlgFlowController *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  CLKappaAlgFlowController *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  char v35;
  CLKappaAlgFlowController *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  CLKappaAlgFlowController *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t v54;
  float v55;
  float v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  std::__shared_weak_count *v87;
  unint64_t *v88;
  unint64_t v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  _Unwind_Exception *v93;
  uint64_t v94;
  std::__shared_weak_count *v95;
  uint64_t v96;
  std::__shared_weak_count *v97;
  uint64_t v98;
  std::__shared_weak_count *v99;
  uint64_t v100;
  std::__shared_weak_count *v101;
  uint64_t v102;
  std::__shared_weak_count *v103;
  uint64_t v104;
  std::__shared_weak_count *v105;
  uint64_t v106;
  std::__shared_weak_count *v107;
  uint64_t v108;
  std::__shared_weak_count *v109;
  uint64_t v110;
  std::__shared_weak_count *v111;
  uint64_t v112;
  std::__shared_weak_count *v113;
  uint64_t v114;
  std::__shared_weak_count *v115;
  uint64_t v116;
  std::__shared_weak_count *v117;
  uint64_t v118;
  std::__shared_weak_count *v119;
  uint64_t v120;
  std::__shared_weak_count *v121;
  uint64_t v122;
  std::__shared_weak_count *v123;
  uint64_t v124;
  std::__shared_weak_count *v125;
  uint64_t v126;
  std::__shared_weak_count *v127;
  uint64_t v128;
  std::__shared_weak_count *v129;

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    v93 = (_Unwind_Exception *)sub_10028A5C8();
    sub_10000A718((uint64_t)&v98);
    sub_10000A718((uint64_t)&v102);
    sub_10000A718((uint64_t)&v104);
    sub_10000A718((uint64_t)&v108);
    sub_10000A718((uint64_t)&v110);
    sub_10000A718((uint64_t)&v114);
    sub_10000A718((uint64_t)&v116);
    sub_10000A718((uint64_t)&v120);
    sub_10000A718((uint64_t)&v122);
    sub_10000A718((uint64_t)&v126);
    sub_10000A718((uint64_t)&v128);
    _Unwind_Resume(v93);
  }
  v4 = *((_QWORD *)value + 40);
  v5 = (std::__shared_weak_count *)*((_QWORD *)value + 41);
  v128 = v4;
  v129 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v4 + 152))(&v124);
  sub_10024D3B8((uint64_t)&v124, &v126);
  v8 = v125;
  if (v125)
  {
    v9 = (unint64_t *)&v125->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (*(_BYTE *)(v126 + 272))
    ++self->_sessionDetails.numRolloverCrashes;
  v11 = self->fFlowControl.__ptr_.__value_;
  v12 = *((_QWORD *)v11 + 14);
  v13 = (std::__shared_weak_count *)*((_QWORD *)v11 + 15);
  v122 = v12;
  v123 = v13;
  if (v13)
  {
    v14 = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v12 + 152))(&v118);
  sub_10023E020((uint64_t)&v118, &v120);
  v16 = v119;
  if (v119)
  {
    v17 = (unint64_t *)&v119->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if (*(_BYTE *)(v120 + 101) || (self->_forceFeatureBitmap & 0x10) != 0)
    self->_algFeatureBitmap |= 0x10u;
  v19 = self->fFlowControl.__ptr_.__value_;
  v20 = *((_QWORD *)v19 + 38);
  v21 = (std::__shared_weak_count *)*((_QWORD *)v19 + 39);
  v116 = v20;
  v117 = v21;
  if (v21)
  {
    v22 = (unint64_t *)&v21->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v20 + 152))(&v112);
  sub_1002707B0((uint64_t)&v112, &v114);
  v24 = v113;
  if (v113)
  {
    v25 = (unint64_t *)&v113->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (*(_BYTE *)(v114 + 176))
    ++self->_sessionDetails.numPlanarCrashes;
  v27 = self->fFlowControl.__ptr_.__value_;
  v28 = *((_QWORD *)v27 + 42);
  v29 = (std::__shared_weak_count *)*((_QWORD *)v27 + 43);
  v110 = v28;
  v111 = v29;
  if (v29)
  {
    v30 = (unint64_t *)&v29->__shared_owners_;
    do
      v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v28 + 152))(&v106);
  sub_10023CBA8((uint64_t)&v106, &v108);
  v32 = v107;
  if (v107)
  {
    v33 = (unint64_t *)&v107->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  v35 = *(_BYTE *)(v108 + 32);
  if (v35)
  {
    if (self->_sessionDetails.latchedHighSpeedCrash)
      goto LABEL_45;
    ++self->_sessionDetails.numHighSpeedCrashes;
    v35 = 1;
  }
  self->_sessionDetails.latchedHighSpeedCrash = v35;
LABEL_45:
  v36 = self->fFlowControl.__ptr_.__value_;
  v37 = *((_QWORD *)v36 + 50);
  v38 = (std::__shared_weak_count *)*((_QWORD *)v36 + 51);
  v104 = v37;
  v105 = v38;
  if (v38)
  {
    v39 = (unint64_t *)&v38->__shared_owners_;
    do
      v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v37 + 152))(&v100);
  sub_100032864((uint64_t)&v100, &v102);
  v41 = v101;
  if (v101)
  {
    v42 = (unint64_t *)&v101->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  v44 = v102;
  v45 = *(_QWORD *)(v102 + 112);
  if (v45)
    self->_sessionDetails.crashTimestamp = v45;
  if (*(_BYTE *)(v44 + 120))
  {
    ++self->_sessionDetails.numSevereCrashes;
    self->_sessionDetails.severeCrashAOPTimestamp = *(_QWORD *)(v44 + 104);
  }
  *(_OWORD *)&self->_sessionDetails.numDeescalationStatic = *(_OWORD *)(v44 + 156);
  *(_OWORD *)&self->_sessionDetails.numDeescalationAutocorrelation = *(_OWORD *)(v44 + 172);
  *(_OWORD *)&self->_sessionDetails.numDeescalationUsha = *(_OWORD *)(v44 + 188);
  *(_QWORD *)&self->_sessionDetails.numDeescalationMAP = *(_QWORD *)(v44 + 204);
  v46 = self->fFlowControl.__ptr_.__value_;
  v47 = *((_QWORD *)v46 + 16);
  v48 = (std::__shared_weak_count *)*((_QWORD *)v46 + 17);
  v98 = v47;
  v99 = v48;
  if (v48)
  {
    v49 = (unint64_t *)&v48->__shared_owners_;
    do
      v50 = __ldxr(v49);
    while (__stxr(v50 + 1, v49));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v47 + 152))(&v94);
  sub_10001DDDC((uint64_t)&v94, &v96);
  v51 = v95;
  if (v95)
  {
    v52 = (unint64_t *)&v95->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  v54 = v96;
  v55 = *(float *)(v96 + 176);
  if (v55 > (float)self->_sessionDetails.maxDeltaVXYBiggestImpact)
    self->_sessionDetails.maxDeltaVXYBiggestImpact = (int)v55;
  v56 = *(float *)(v54 + 168);
  if (v56 > (float)self->_sessionDetails.maxDeltaVXYOverEpoch)
    self->_sessionDetails.maxDeltaVXYOverEpoch = (int)v56;
  v57 = v97;
  if (v97)
  {
    v58 = (unint64_t *)&v97->__shared_owners_;
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  v60 = v99;
  if (v99)
  {
    v61 = (unint64_t *)&v99->__shared_owners_;
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  v63 = v103;
  if (v103)
  {
    v64 = (unint64_t *)&v103->__shared_owners_;
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
  v66 = v105;
  if (v105)
  {
    v67 = (unint64_t *)&v105->__shared_owners_;
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
  v69 = v109;
  if (v109)
  {
    v70 = (unint64_t *)&v109->__shared_owners_;
    do
      v71 = __ldaxr(v70);
    while (__stlxr(v71 - 1, v70));
    if (!v71)
    {
      ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
      std::__shared_weak_count::__release_weak(v69);
    }
  }
  v72 = v111;
  if (v111)
  {
    v73 = (unint64_t *)&v111->__shared_owners_;
    do
      v74 = __ldaxr(v73);
    while (__stlxr(v74 - 1, v73));
    if (!v74)
    {
      ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
      std::__shared_weak_count::__release_weak(v72);
    }
  }
  v75 = v115;
  if (v115)
  {
    v76 = (unint64_t *)&v115->__shared_owners_;
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    if (!v77)
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
    }
  }
  v78 = v117;
  if (v117)
  {
    v79 = (unint64_t *)&v117->__shared_owners_;
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  v81 = v121;
  if (v121)
  {
    v82 = (unint64_t *)&v121->__shared_owners_;
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 - 1, v82));
    if (!v83)
    {
      ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
      std::__shared_weak_count::__release_weak(v81);
    }
  }
  v84 = v123;
  if (v123)
  {
    v85 = (unint64_t *)&v123->__shared_owners_;
    do
      v86 = __ldaxr(v85);
    while (__stlxr(v86 - 1, v85));
    if (!v86)
    {
      ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
      std::__shared_weak_count::__release_weak(v84);
    }
  }
  v87 = v127;
  if (v127)
  {
    v88 = (unint64_t *)&v127->__shared_owners_;
    do
      v89 = __ldaxr(v88);
    while (__stlxr(v89 - 1, v88));
    if (!v89)
    {
      ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
      std::__shared_weak_count::__release_weak(v87);
    }
  }
  v90 = v129;
  if (v129)
  {
    v91 = (unint64_t *)&v129->__shared_owners_;
    do
      v92 = __ldaxr(v91);
    while (__stlxr(v92 - 1, v91));
    if (!v92)
    {
      ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
      std::__shared_weak_count::__release_weak(v90);
    }
  }
}

- (void)onCloseEpoch:(unint64_t)a3 epochNumber:(int)a4
{
  uint64_t v4;
  unint64_t v7;
  NSObject *v8;
  int epochNumber;
  unint64_t epochTimestamp;
  _DWORD v11[2];
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;

  v4 = *(_QWORD *)&a4;
  v7 = +[CSTimeManager SPU_estimate_current_timestamp](CSTimeManager, "SPU_estimate_current_timestamp");
  self->_epochTimestamp = a3;
  self->_epochNumber = v4;
  self->_lastEpochTime = CFAbsoluteTimeGetCurrent();
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v8 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    epochNumber = self->_epochNumber;
    epochTimestamp = self->_epochTimestamp;
    v11[0] = 67240704;
    v11[1] = epochNumber;
    v12 = 2050;
    v13 = epochTimestamp;
    v14 = 2050;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "close epoch %{public}d aop timestamp %{public}llu, %{public}llu", (uint8_t *)v11, 0x1Cu);
  }
  if (self->_isDetectionDevice)
  {
    -[CSKappaDetectionService evaluatePossibleCrashDetectorDecision](self, "evaluatePossibleCrashDetectorDecision");
    -[CSKappaDetectionService evaluateSamplingAlgFeatures](self, "evaluateSamplingAlgFeatures");
    -[CSKappaDetectionService populateSessionDetails](self, "populateSessionDetails");
    -[CSKappaDetectionService updateFractionalAudioMetadata](self, "updateFractionalAudioMetadata");
  }
  -[CSKappaDetectionService sendLocalAudioToWatch](self, "sendLocalAudioToWatch");
  -[CSKappaDetectionService sendRemoteSampleToCompanion:epochTs:epochNumber:](self, "sendRemoteSampleToCompanion:epochTs:epochNumber:", v7, a3, v4);
}

- (void)sendRemoteSampleToCompanion:(unint64_t)a3 epochTs:(unint64_t)a4 epochNumber:(int)a5
{
  CLKappaAlgFlowController *value;
  id v10;
  void *v11;
  int8x16_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;

  value = self->fFlowControl.__ptr_.__value_;
  if (value)
  {
    CLKappaAlgFlowController::createRemoteSample(value, (uint64_t)&v12);
    if (v15)
    {
      v12.i32[2] = a5;
      v13 = a3;
      v14 = a4;
      v10 = sub_100018418(&v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v11, 401);

    }
  }
}

- (void)stop:(unint64_t)a3
{
  int v3;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  CLKappaAlgFlowController *value;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 SOSInProgress;
  NSObject *v21;
  NSObject *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  id v29;
  CLTimer *v30;
  CLTimer *sosTimer;
  void *v32;
  id v33;
  NSObject *v34;
  _QWORD v35[6];
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint8_t buf[8];
  std::__shared_weak_count *v39;
  uint8_t v40[4];
  int v41;
  __int16 v42;
  int v43;
  uint8_t v44[8];
  std::__shared_weak_count *v45;

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v6 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stop the aop service", buf, 2u);
  }
  CSAOPSvc::suppressTriggers((CSAOPSvc *)self->_aop, 1);
  CSAOPSvc::stopDetection((uint64_t)self->_aop);
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v7 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "finalizing the session", buf, 2u);
  }
  v8 = -[CSKappaDetectionService stopSession](self, "stopSession");
  if (self->_detectionEvent >= 2)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v9 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "subsequent detection events cannot take tokens or update metadata", buf, 2u);
    }
    goto LABEL_53;
  }
  value = self->fFlowControl.__ptr_.__value_;
  if (value)
  {
    v11 = *((_QWORD *)value + 50);
    v12 = (std::__shared_weak_count *)*((_QWORD *)value + 51);
    *(_QWORD *)buf = v11;
    v39 = v12;
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v11 + 152))(&v36);
    sub_100032864((uint64_t)&v36, v44);
    v15 = v37;
    if (v37)
    {
      v16 = (unint64_t *)&v37->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v3 = *(unsigned __int8 *)(*(_QWORD *)v44 + 129);
    self->_deescalationBitmap = *(_DWORD *)(*(_QWORD *)v44 + 424);
    LODWORD(v7) = getKappaToken(0);
    if (qword_100387330 == -1)
      goto LABEL_24;
  }
  else
  {
    sub_10028A710(v8);
    __break(1u);
  }
  dispatch_once(&qword_100387330, &stru_100363A20);
LABEL_24:
  v18 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v40 = 67109120;
    v41 = (int)v7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "tokenCnt = %d", v40, 8u);
  }
  if (self->_SOSInProgress | v3)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v19 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      SOSInProgress = self->_SOSInProgress;
      *(_DWORD *)v40 = 67109376;
      v41 = SOSInProgress;
      v42 = 1024;
      v43 = v3;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "crash detected %d suppressed %d", v40, 0xEu);
    }
  }
  else if ((int)v7 < 1)
  {
    if (!(_DWORD)v7)
    {
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v22 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "forcefully stopping aop collection", v40, 2u);
      }
      CSAOPSvc::forceStopCollection((CSAOPSvc *)self->_aop);
    }
  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v21 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "acquiring kappa token", v40, 2u);
    }
    getKappaToken(1);
  }
  v23 = v45;
  if (v45)
  {
    v24 = (unint64_t *)&v45->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = v39;
  if (v39)
  {
    v27 = (unint64_t *)&v39->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
LABEL_53:
  v29 = objc_initWeak((id *)buf, self);
  v30 = (CLTimer *)-[CLSilo newTimer](self->_silo, "newTimer");
  sosTimer = self->_sosTimer;
  self->_sosTimer = v30;

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10028168C;
  v35[3] = &unk_100355B30;
  v35[4] = self;
  v35[5] = a3;
  -[CLTimer setHandler:](self->_sosTimer, "setHandler:", v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v33 = objc_msgSend(v32, "integerForKey:", CFSTR("SOSTimeoutExpiration"));

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v34 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v44 = 67109120;
    *(_DWORD *)&v44[4] = (_DWORD)v33;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "setting sos timer expiration %d", v44, 8u);
  }
  -[CLTimer setNextFireDelay:interval:](self->_sosTimer, "setNextFireDelay:interval:", (double)(uint64_t)v33, 1.79769313e308);

  objc_destroyWeak((id *)buf);
}

- (void)saveForceState:(int)a3 withValue:(int)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (a3 < 0x18)
  {
    self->_savedForceState[a3] = a4;
  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v4 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "value not in range", v5, 2u);
    }
  }
}

- (void)forceCrashDetector:(int)a3 withValue:(int)a4
{
  std::__shared_weak_count *v4;
  CLKappaAlgFlowController *value;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  NSObject *v9;
  const char *v10;
  unint64_t *v11;
  unint64_t v12;
  uint8_t buf[8];

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_10028A858();
    goto LABEL_55;
  }
  v6 = *((_QWORD *)value + 38);
  v4 = (std::__shared_weak_count *)*((_QWORD *)value + 39);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  if (!v6)
  {
LABEL_55:
    sub_10028A9A0(buf, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 1574, "-[CSKappaDetectionService forceCrashDetector:withValue:]");
    __break(1u);
LABEL_56:
    dispatch_once(&qword_100387330, &stru_100363A20);
LABEL_14:
    v9 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "value must be 0/1";
LABEL_36:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v10, buf, 2u);
      if (!v4)
        return;
    }
    else
    {
LABEL_46:
      if (!v4)
        return;
    }
LABEL_47:
    v11 = (unint64_t *)&v4->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    return;
  }
  switch(a3)
  {
    case 0:
      if (a4 < 2)
      {
        sub_100281B8C(v6, a4 != 0);
      }
      else
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v10 = "value must be 0/1";
          goto LABEL_36;
        }
      }
      goto LABEL_46;
    case 1:
      if (a4 < 2)
      {
        sub_100281C60(v6, a4 != 0);
      }
      else
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v10 = "value must be 0/1";
          goto LABEL_36;
        }
      }
      goto LABEL_46;
    case 2:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v10 = "value must be 0/1";
          goto LABEL_36;
        }
        goto LABEL_46;
      }
      sub_100281D34(v6, a4 != 0);
      if (v4)
        goto LABEL_47;
      return;
    case 3:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v10 = "value must be 0/1";
          goto LABEL_36;
        }
        goto LABEL_46;
      }
      sub_100281E08(v6, a4 != 0);
      if (v4)
        goto LABEL_47;
      return;
    case 4:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          goto LABEL_56;
        goto LABEL_14;
      }
      sub_100281EDC(v6, a4 != 0);
      if (v4)
        goto LABEL_47;
      return;
    case 5:
      if ((a4 - 4) <= 0xFFFFFFFA)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v10 = "value not in range";
          goto LABEL_36;
        }
        goto LABEL_46;
      }
      sub_100281FB0(v6, a4);
      if (v4)
        goto LABEL_47;
      break;
    default:
      goto LABEL_46;
  }
}

- (void)forceHighSpeedCrashDetector:(int)a3 withValue:(int)a4
{
  std::__shared_weak_count *v4;
  CLKappaAlgFlowController *value;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  NSObject *v9;
  unint64_t *v10;
  unint64_t v11;
  uint8_t buf[8];

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_10028AAA8();
    goto LABEL_56;
  }
  v6 = *((_QWORD *)value + 42);
  v4 = (std::__shared_weak_count *)*((_QWORD *)value + 43);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  if (!v6)
  {
LABEL_56:
    sub_10028ABF0(buf, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 1608, "-[CSKappaDetectionService forceHighSpeedCrashDetector:withValue:]");
    __break(1u);
LABEL_57:
    dispatch_once(&qword_100387330, &stru_100363A20);
LABEL_14:
    v9 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
LABEL_36:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "value must be 0/1", buf, 2u);
      if (!v4)
        return;
    }
    else
    {
LABEL_47:
      if (!v4)
        return;
    }
LABEL_48:
    v10 = (unint64_t *)&v4->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    return;
  }
  switch(a3)
  {
    case 10:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
        goto LABEL_47;
      }
      sub_10028245C(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      return;
    case 11:
      if (a4 < 2)
      {
        sub_100282530(v6, a4 != 0);
      }
      else
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
      }
      goto LABEL_47;
    case 12:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
        goto LABEL_47;
      }
      sub_100282604(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      return;
    case 13:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
        goto LABEL_47;
      }
      sub_1002826D8(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      return;
    case 14:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          goto LABEL_57;
        goto LABEL_14;
      }
      sub_1002827AC(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      return;
    case 15:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
        goto LABEL_47;
      }
      sub_100282880(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      break;
    default:
      goto LABEL_47;
  }
}

- (void)forceRolloverCrashDetector:(int)a3 withValue:(int)a4
{
  std::__shared_weak_count *v4;
  CLKappaAlgFlowController *value;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  NSObject *v9;
  const char *v10;
  unint64_t *v11;
  unint64_t v12;
  uint8_t buf[8];

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_10028ACF8();
    goto LABEL_42;
  }
  v6 = *((_QWORD *)value + 40);
  v4 = (std::__shared_weak_count *)*((_QWORD *)value + 41);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  if (!v6)
  {
LABEL_42:
    sub_10028AE40(buf, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 1642, "-[CSKappaDetectionService forceRolloverCrashDetector:withValue:]");
    __break(1u);
LABEL_43:
    dispatch_once(&qword_100387330, &stru_100363A20);
LABEL_14:
    v9 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "value must be 0/1";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v10, buf, 2u);
      if (!v4)
        return;
    }
    else
    {
LABEL_33:
      if (!v4)
        return;
    }
LABEL_34:
    v11 = (unint64_t *)&v4->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    return;
  }
  switch(a3)
  {
    case 6:
      if (a4 < 2)
      {
        sub_100282C3C(v6, a4 != 0);
      }
      else
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v10 = "value must be 0/1";
          goto LABEL_26;
        }
      }
      goto LABEL_33;
    case 7:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v10 = "value must be 0/1";
          goto LABEL_26;
        }
        goto LABEL_33;
      }
      sub_100282D10(v6, a4 != 0);
      if (v4)
        goto LABEL_34;
      return;
    case 8:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          goto LABEL_43;
        goto LABEL_14;
      }
      sub_100282DE4(v6, a4 != 0);
      if (v4)
        goto LABEL_34;
      return;
    case 9:
      if ((a4 - 3) <= 0xFFFFFFFB)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v10 = "value not in range";
          goto LABEL_26;
        }
        goto LABEL_33;
      }
      sub_100282EB8(v6, a4);
      if (v4)
        goto LABEL_34;
      break;
    default:
      goto LABEL_33;
  }
}

- (void)forceSevereCrashDetector:(int)a3 withValue:(int)a4
{
  std::__shared_weak_count *v4;
  CLKappaAlgFlowController *value;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  NSObject *v9;
  unint64_t *v10;
  unint64_t v11;
  uint8_t buf[8];

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_10028AF48();
    goto LABEL_56;
  }
  v6 = *((_QWORD *)value + 50);
  v4 = (std::__shared_weak_count *)*((_QWORD *)value + 51);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  if (!v6)
  {
LABEL_56:
    sub_10028B090(buf, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 1669, "-[CSKappaDetectionService forceSevereCrashDetector:withValue:]");
    __break(1u);
LABEL_57:
    dispatch_once(&qword_100387330, &stru_100363A20);
LABEL_14:
    v9 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
LABEL_36:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "value must be 0/1", buf, 2u);
      if (!v4)
        return;
    }
    else
    {
LABEL_47:
      if (!v4)
        return;
    }
LABEL_48:
    v10 = (unint64_t *)&v4->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    return;
  }
  switch(a3)
  {
    case 16:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
        goto LABEL_47;
      }
      sub_10028336C(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      return;
    case 17:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
        goto LABEL_47;
      }
      sub_100283444(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      return;
    case 18:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          goto LABEL_57;
        goto LABEL_14;
      }
      sub_10028351C(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      return;
    case 19:
      if (a4 < 2)
      {
        sub_1002835F4(v6, a4 != 0);
      }
      else
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
      }
      goto LABEL_47;
    case 20:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
        goto LABEL_47;
      }
      sub_1002836CC(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      return;
    case 23:
      if (a4 >= 2)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v9 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_36;
        }
        goto LABEL_47;
      }
      sub_1002837A4(v6, a4 != 0);
      if (v4)
        goto LABEL_48;
      break;
    default:
      goto LABEL_47;
  }
}

- (void)forceParticipatingInEscalation:(int)a3 withValue:(int)a4
{
  CLKappaAlgFlowController *value;
  NSObject *v5;
  uint8_t v6[16];

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_10028B198(0, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
LABEL_10:
    dispatch_once(&qword_100387330, &stru_100363A20);
    goto LABEL_5;
  }
  if (a3 != 22)
    return;
  if (a4 < 2)
  {
    sub_100283938((uint64_t)value, a4 != 0);
    return;
  }
  if (qword_100387330 != -1)
    goto LABEL_10;
LABEL_5:
  v5 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "value must be 0/1", v6, 2u);
  }
}

- (void)forceSamplingBits:(int)a3 withValue:(int)a4
{
  self->_forceFeatureBitmap = a4;
}

- (void)forceBehavior:(int)a3 withValue:(int)a4
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      -[CSKappaDetectionService forceCrashDetector:withValue:](self, "forceCrashDetector:withValue:");
      break;
    case 6:
    case 7:
    case 8:
    case 9:
      -[CSKappaDetectionService forceRolloverCrashDetector:withValue:](self, "forceRolloverCrashDetector:withValue:");
      break;
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      -[CSKappaDetectionService forceHighSpeedCrashDetector:withValue:](self, "forceHighSpeedCrashDetector:withValue:");
      break;
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 23:
      -[CSKappaDetectionService forceSevereCrashDetector:withValue:](self, "forceSevereCrashDetector:withValue:");
      break;
    case 21:
      -[CSKappaDetectionService forceSamplingBits:withValue:](self, "forceSamplingBits:withValue:");
      break;
    case 22:
      -[CSKappaDetectionService forceParticipatingInEscalation:withValue:](self, "forceParticipatingInEscalation:withValue:");
      break;
    default:
      return;
  }
}

- (BOOL)coinflip:(double)a3
{
  NSObject *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  int v12;
  double v13;
  __int16 v14;
  double v15;

  if (a3 >= 0.0 && a3 <= 1.0)
  {
    v7 = drand48();
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v8 = v7 * 100.0;
    v9 = a3 * 100.0;
    v10 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      v12 = 134218240;
      v13 = v8;
      v14 = 2048;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "coin flip = %f, rbound = %f", (uint8_t *)&v12, 0x16u);
    }
    LOBYTE(v6) = v8 <= v9 && v8 >= 0.0;
  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v5 = qword_100387338;
    v6 = os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO);
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "invalid rate specified", (uint8_t *)&v12, 2u);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (float)querySamplingRate:(id)a3 withDefault:(float)a4
{
  id v5;
  void *v6;
  void *v7;
  float v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));
  if (v7)
  {
    objc_msgSend(v6, "floatForKey:", v5);
    a4 = v8;
  }

  return a4;
}

- (float)querySamplingBin:(id)a3 atIndex:(int)a4 withDefault:(float)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  float v15;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("%lu"), a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v10));
  if (v11)
  {
    LODWORD(v13) = 1120403456;
    LODWORD(v12) = 0;
    *(float *)&v14 = a5;
    objc_msgSend(v8, "algorithmThresholdNumber:inArrayForKey:withMinValue:maxValue:defaultValue:", v9, CFSTR("CurDetectionPhoneDetectionWatchAcceptanceRateBitmap"), v12, v13, v14);
    a5 = v15;
  }

  return a5;
}

- (void)printSamplingDefaults
{
  NSObject *v3;
  double v4;
  float v5;
  uint64_t v6;
  NSObject *v7;
  double v8;
  float v9;
  NSObject *v10;
  double v11;
  float v12;
  NSObject *v13;
  double v14;
  float v15;
  NSObject *v16;
  double v17;
  float v18;
  uint8_t buf[4];
  double v20[2];

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v3 = (id)qword_100387338;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(v4) = -1.0;
    -[CSKappaDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("CurPairedLoggingAndDetectionAcceptanceRate"), v4);
    *(_DWORD *)buf = 134217984;
    v20[0] = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "curation rate 2: %f", buf, 0xCu);
  }

  v6 = 0;
  do
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v7 = (id)qword_100387338;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(v8) = -1.0;
      -[CSKappaDetectionService querySamplingBin:atIndex:withDefault:](self, "querySamplingBin:atIndex:withDefault:", CFSTR("CurDetectionPhoneDetectionWatchAcceptanceRateBitmap"), v6, v8);
      *(_DWORD *)buf = 67109376;
      LODWORD(v20[0]) = v6;
      WORD2(v20[0]) = 2048;
      *(double *)((char *)v20 + 6) = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "curation bitmap %d: %f", buf, 0x12u);
    }

    v6 = (v6 + 1);
  }
  while ((_DWORD)v6 != 32);
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v10 = (id)qword_100387338;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(v11) = -1.0;
    -[CSKappaDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("PerfDetectionPhoneDetectionWatchAcceptanceRate"), v11);
    *(_DWORD *)buf = 134217984;
    v20[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "performance sampling rate 1 %f", buf, 0xCu);
  }

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v13 = (id)qword_100387338;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(v14) = -1.0;
    -[CSKappaDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("PerfLoggingPhoneDetectionWatchAcceptanceRate"), v14);
    *(_DWORD *)buf = 134217984;
    v20[0] = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "performance sampling rate 2 %f", buf, 0xCu);
  }

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v16 = (id)qword_100387338;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LODWORD(v17) = -1.0;
    -[CSKappaDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("PerfDetectionPhoneAcceptanceRate"), v17);
    *(_DWORD *)buf = 134217984;
    v20[0] = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "performance sampling rate 3 %f", buf, 0xCu);
  }

}

- (BOOL)curationSampling
{
  NSObject *v3;
  BOOL v4;
  CLKappaAlgFlowController *value;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  double v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  double v16;
  float v17;
  NSObject *v18;
  double v19;
  float v20;
  float v21;
  NSObject *v22;
  int algFeatureBitmap;
  double v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  uint8_t buf[4];
  _QWORD v38[2];

  if (self->_SOSInProgress)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v3 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "curation sampling coinflip 1 1.0", buf, 2u);
    }
    self->_samplingBitmap |= 1u;
    return 1;
  }
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_10028B2D8();
    __break(1u);
LABEL_51:
    dispatch_once(&qword_100387330, &stru_100363A20);
LABEL_19:
    v15 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "false positive (previous escalations) 1.0", buf, 2u);
    }
LABEL_38:
    self->_samplingBitmap |= 1u;
    v4 = 1;
    goto LABEL_40;
  }
  v7 = *((_QWORD *)value + 50);
  v8 = (std::__shared_weak_count *)*((_QWORD *)value + 51);
  v35 = v7;
  v36 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v7 + 152))(&v31);
  sub_100032864((uint64_t)&v31, &v33);
  v12 = v32;
  if (v32)
  {
    v13 = (unint64_t *)&v32->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (*(_BYTE *)(v33 + 129))
  {
    if (qword_100387330 == -1)
      goto LABEL_19;
    goto LABEL_51;
  }
  LODWORD(v11) = 1041865114;
  -[CSKappaDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("CurPairedLoggingAndDetectionAcceptanceRate"), v11);
  v17 = *(float *)&v16;
  if (!self->_isLoggingDevice || self->_companionDeviceType != 1)
  {
    if (!self->_isDetectionDevice)
      goto LABEL_39;
    if (self->_companionDeviceType)
      goto LABEL_37;
  }
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v18 = qword_100387338;
  v19 = v17;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)v38 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "curation sampling coinflip 2 %f", buf, 0xCu);
  }
  if (-[CSKappaDetectionService coinflip:](self, "coinflip:", v19))
    goto LABEL_38;
  if (self->_isDetectionDevice)
  {
LABEL_37:
    if (self->_companionDeviceType == 1)
    {
      LODWORD(v16) = dword_1002EDF90[self->_algFeatureBitmap];
      -[CSKappaDetectionService querySamplingBin:atIndex:withDefault:](self, "querySamplingBin:atIndex:withDefault:", CFSTR("CurDetectionPhoneDetectionWatchAcceptanceRateBitmap"), v16);
      v21 = v20;
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v22 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
      {
        algFeatureBitmap = self->_algFeatureBitmap;
        v24 = v21;
        *(_DWORD *)buf = 67109376;
        LODWORD(v38[0]) = algFeatureBitmap;
        WORD2(v38[0]) = 2048;
        *(double *)((char *)v38 + 6) = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "curation sampling coinflip 3 alg rate for %d is %f", buf, 0x12u);
      }
      else
      {
        v24 = v21;
      }
      if (-[CSKappaDetectionService coinflip:](self, "coinflip:", v24))
        goto LABEL_38;
    }
  }
LABEL_39:
  v4 = 0;
LABEL_40:
  v25 = v34;
  if (v34)
  {
    v26 = (unint64_t *)&v34->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v36;
  if (v36)
  {
    v29 = (unint64_t *)&v36->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  return v4;
}

- (BOOL)performanceSampling
{
  double v2;
  double v4;
  float v5;
  NSObject *v6;
  double v7;
  double v8;
  float v9;
  NSObject *v10;
  double v11;
  float v12;
  float v13;
  NSObject *v14;
  double v15;
  _BOOL4 v16;
  int v18;
  double v19;

  LODWORD(v2) = 1041865114;
  -[CSKappaDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("PerfDetectionPhoneDetectionWatchAcceptanceRate"), v2);
  if (self->_isDetectionDevice && self->_companionDeviceType == 1)
  {
    v5 = *(float *)&v4;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v6 = qword_100387338;
    v7 = v5;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      v18 = 134217984;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "performance sampling coinflip 1 %f", (uint8_t *)&v18, 0xCu);
    }
    if (-[CSKappaDetectionService coinflip:](self, "coinflip:", v7))
      goto LABEL_23;
  }
  LODWORD(v4) = 1041865114;
  -[CSKappaDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("PerfLoggingPhoneDetectionWatchAcceptanceRate"), v4);
  if (self->_isLoggingDevice && self->_companionDeviceType == 1)
  {
    v9 = *(float *)&v8;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v10 = qword_100387338;
    v11 = v9;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      v18 = 134217984;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "performance sampling coinflip 2 %f", (uint8_t *)&v18, 0xCu);
    }
    if (-[CSKappaDetectionService coinflip:](self, "coinflip:", v11))
      goto LABEL_23;
  }
  LODWORD(v8) = 1041865114;
  -[CSKappaDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("PerfDetectionPhoneAcceptanceRate"), v8);
  if (self->_isDetectionDevice && (self->_companionDeviceType + 1) <= 1)
  {
    v13 = v12;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v14 = qword_100387338;
    v15 = v13;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      v18 = 134217984;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "performance sampling coinflip 3 %f", (uint8_t *)&v18, 0xCu);
    }
    v16 = -[CSKappaDetectionService coinflip:](self, "coinflip:", v15);
    if (v16)
    {
LABEL_23:
      self->_samplingBitmap |= 2u;
      LOBYTE(v16) = 1;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }
  return v16;
}

- (BOOL)shouldUploadRecording
{
  unsigned __int8 v3;

  v3 = -[CSKappaDetectionService curationSampling](self, "curationSampling");
  return v3 | -[CSKappaDetectionService performanceSampling](self, "performanceSampling");
}

- (void)notifyCompanionOfUploadedCompanionUUID
{
  CSCompanionServiceProtocol *companionProxy;
  void *v4;
  _QWORD v5[2];

  v5[0] = 0;
  v5[1] = 0;
  -[NSUUID getUUIDBytes:](self->_companionUUID, "getUUIDBytes:", v5);
  companionProxy = self->_companionProxy;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v5, 16));
  -[CSCompanionServiceProtocol sendData:type:](companionProxy, "sendData:type:", v4, 7);

}

- (void)resetSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  CLKappaAlgFlowController *value;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  CSMSLDataRecording *mslRecording;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CSMSLDataRecording *v25;
  void *v26;
  CSMSLDataRecording *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int samplingBitmap;
  unsigned int v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSUUID *companionUUID;
  CSMSLDataRecording *v37;
  void *v38;
  _UNKNOWN **v39;
  void *v40;
  void *v41;
  NSUUID *companionUUIDPreSession;
  CompanionUUID *v43;
  CLKappaAlgFlowController *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  void *v51;
  unsigned int v52;
  id v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  uint8_t buf[8];
  std::__shared_weak_count *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  uint8_t v62[4];
  int v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  _QWORD v68[8];
  _QWORD v69[8];

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v3 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "resetSession", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v53 = objc_msgSend(v4, "integerForKey:", CFSTR("ServerConfigVersion"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v52 = objc_msgSend(v5, "BOOLForKey:", CFSTR("UploadSerialNumberInMetadata"));

  value = self->fFlowControl.__ptr_.__value_;
  v7 = *((_QWORD *)value + 50);
  v8 = (std::__shared_weak_count *)*((_QWORD *)value + 51);
  *(_QWORD *)buf = v7;
  v59 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v7 + 152))(&v54);
  sub_100032864((uint64_t)&v54, &v56);
  v11 = v55;
  if (v55)
  {
    v12 = (unint64_t *)&v55->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  mslRecording = self->_mslRecording;
  v68[0] = CFSTR("configServerVersionNumber");
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v53));
  v69[0] = v51;
  v68[1] = CFSTR("curationAlgBitmap");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_algFeatureBitmap));
  v69[1] = v15;
  v68[2] = CFSTR("severeCrashDetectorDecision");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_sessionDetails.numSevereCrashes > 0));
  v69[2] = v16;
  v68[3] = CFSTR("severeCrashTimestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_sessionDetails.severeCrashAOPTimestamp));
  v69[3] = v17;
  v68[4] = CFSTR("algsEndTimestamp");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_sessionDetails.algsEndTimestamp));
  v69[4] = v18;
  v68[5] = CFSTR("deescalationPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", self->_deescalationBitmap));
  v69[5] = v19;
  v68[6] = CFSTR("escalationCandidateSuppressed");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(v56 + 129)));
  v69[6] = v20;
  v68[7] = CFSTR("crashTimestamp");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_sessionDetails.crashTimestamp));
  v69[7] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 8));
  -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v22);

  if (v52)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getSerialNumber"));

    v25 = self->_mslRecording;
    v66 = CFSTR("serialNumber");
    v67 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
    -[CSMSLDataRecording updateMetadata:](v25, "updateMetadata:", v26);

  }
  if (self->_checkForPOI)
  {
    v27 = self->_mslRecording;
    v64 = CFSTR("LOIHint");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isNearAmusementParkPOI));
    v65 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
    -[CSMSLDataRecording updateMetadata:](v27, "updateMetadata:", v29);

  }
  self->_deescalationBitmap = 0;
  self->_sessionDetails.serverConfigVersion = (float)(uint64_t)v53;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v30 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
  {
    samplingBitmap = self->_samplingBitmap;
    *(_DWORD *)v62 = 67240192;
    v63 = samplingBitmap;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "sampling bitmap %{public}d", v62, 8u);
  }
  if (self->_canCollectData)
  {
    v32 = -[CSKappaDetectionService shouldUploadRecording](self, "shouldUploadRecording");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSMSLDataRecording metadata](self->_mslRecording, "metadata"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("shouldUploadIndependentlyOfSOS")));

    if (v34)
      v32 = objc_msgSend(v34, "isEqual:", &off_10036C3A8);
    if (self->_companionUUID && ((v32 & 1) != 0 || self->_tellCompanionToUpload))
    {
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v35 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v62 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Notifying companion of UUID for upload", v62, 2u);
      }
      -[CSKappaDetectionService notifyCompanionOfUploadedCompanionUUID](self, "notifyCompanionOfUploadedCompanionUUID");
      companionUUID = self->_companionUUID;
      self->_companionUUID = 0;

    }
    v37 = self->_mslRecording;
    v60[0] = CFSTR("samplingBitmap");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_samplingBitmap));
    v39 = &off_10036C3A8;
    v60[1] = CFSTR("shouldUploadIndependentlyOfSOS");
    v61[0] = v38;
    if (!v32)
      v39 = &off_10036C3C0;
    v61[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 2));
    -[CSMSLDataRecording updateMetadata:](v37, "updateMetadata:", v40);

    -[CSMSLDataRecording dumpMetadata](self->_mslRecording, "dumpMetadata");
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &self->_sessionDetails, 144));
  -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 9, v41);

  self->_companionTriggerTime = 0.0;
  self->_inSession = 0;
  companionUUIDPreSession = self->_companionUUIDPreSession;
  self->_companionUUIDPreSession = 0;

  v43 = self->_kappaCompanionUUID.__ptr_.__value_;
  self->_kappaCompanionUUID.__ptr_.__value_ = 0;
  if (v43)
    sub_100011294((uint64_t)&self->_kappaCompanionUUID, (uint64_t)v43);
  -[CLTimer setNextFireDelay:interval:](self->_triggerTimer, "setNextFireDelay:interval:", 1.79769313e308, 1.79769313e308);
  v44 = self->fFlowControl.__ptr_.__value_;
  self->fFlowControl.__ptr_.__value_ = 0;
  if (v44)
    (*(void (**)(CLKappaAlgFlowController *))(*(_QWORD *)v44 + 8))(v44);
  CSAOPSvc::suppressTriggers((CSAOPSvc *)self->_aop, 0);
  v45 = v57;
  if (v57)
  {
    v46 = (unint64_t *)&v57->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  v48 = v59;
  if (v59)
  {
    v49 = (unint64_t *)&v59->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
}

- (void)stopSession
{
  NSObject *v3;
  NSUUID *companionUUID;
  CSMSLDataRecording *v5;
  void *v6;
  CSMSLDataRecording *mslRecording;
  void *v8;
  void *v9;
  CSMSLDataRecording *v10;
  NSMutableDictionary *v11;
  CLKappaAlgFlowController *value;
  void *v13;
  unsigned __int8 v14;
  uint8_t v15[8];
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  NSUUID *v21;

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v3 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop session", v15, 2u);
  }
  companionUUID = self->_companionUUID;
  if (companionUUID
    && (v5 = self->_mslRecording,
        v20 = CFSTR("companionUUID"),
        v21 = companionUUID,
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1)), -[CSMSLDataRecording updateMetadata:](v5, "updateMetadata:", v6), v6, self->_companionUUID))
  {
    mslRecording = self->_mslRecording;
    v16 = CFSTR("collectionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
    v17 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v9);
  }
  else
  {
    v10 = self->_mslRecording;
    v18 = CFSTR("collectionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
    v19 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    -[CSMSLDataRecording updateMetadata:](v10, "updateMetadata:", v9);
  }

  self->_sessionDetails.trigger_bitmap = self->_triggerPathBitmap;
  v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  value = self->fFlowControl.__ptr_.__value_;
  if (value)
  {
    CLKappaAlgFlowController::finalizeAlgBlocks(value);
    CLKappaAlgFlowController::fetchAlgBlocksMeta(self->fFlowControl.__ptr_.__value_, v11);
  }
  -[CSMSLDataRecording updateMetadata:](self->_mslRecording, "updateMetadata:", v11);
  if (self->_canCollectData)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
    v14 = objc_msgSend(v13, "isAuthorizedToCollectData");

    if ((v14 & 1) == 0)
      self->_canCollectData = 0;
  }
  -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 3, 0);

}

- (BOOL)isIdle
{
  return -[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_idleState);
}

- (void)finishAnomalyEvent
{
  self->_detectionEvent = 0;
}

- (void)setRecording:(id)a3 withUUID:(id)a4
{
  void **p_vtable;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  uint8_t buf[8];
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  v8 = a3;
  v9 = a4;
  if (self->_hsm)
  {
    p_vtable = &OBJC_METACLASS___CSHSMObjc.vtable;
    if (qword_100387330 == -1)
      goto LABEL_3;
  }
  else
  {
    sub_10028B420(buf);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2068, "-[CSKappaDetectionService setRecording:withUUID:]");
    __break(1u);
  }
  dispatch_once(&qword_100387330, &stru_100363A20);
LABEL_3:
  v10 = (id)qword_100387338;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v8;
    v12 = -[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_idleState);
    v13 = -[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_readingState);
    v14 = -[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_waitForSOSState);
    v15 = -[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_waitForPOIState);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v12;
    v18 = 1024;
    v19 = v13;
    v20 = 1024;
    v21 = v14;
    v22 = 1024;
    v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "set recording state %d %d %d %d", buf, 0x1Au);
    v8 = v11;
    p_vtable = &OBJC_METACLASS___CSHSMObjc.vtable;
  }

  if (-[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_idleState))
  {
    objc_storeStrong((id *)&self->_mslRecording, a3);
    objc_storeStrong((id *)&self->_uuid, a4);
  }
  else
  {
    if (p_vtable[102] != (void *)-1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v16 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "recording details may only be set in idle", buf, 2u);
    }
  }

}

- (void)setUploader:(id)a3
{
  objc_storeStrong((id *)&self->_uploader, a3);
}

- (void)dumpSample:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  float v8;
  float v9;
  double v10;
  const char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  float v15;
  float v16;
  double v17;
  uint64_t v18;
  id v19;
  void *v20;
  float v21;
  float v22;
  double v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  float v44;
  float v45;
  float v46;
  double v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  int v52;
  int v53;
  float v54;
  int v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  double v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  double v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  int v74;
  id v75;
  __int16 v76;
  _BYTE v77[10];
  _BYTE v78[10];
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  double v83;
  __int16 v84;
  double v85;
  __int16 v86;
  double v87;

  v3 = a3;
  v4 = objc_opt_class(CSSPUAccel800);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v6 = (id)qword_100387338;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v7 = *(void **)objc_msgSend(v5, "c_struct");
    v8 = *((float *)objc_msgSend(v5, "c_struct") + 2);
    v9 = *((float *)objc_msgSend(v5, "c_struct") + 3);
    v10 = *((float *)objc_msgSend(v5, "c_struct") + 4);
    v74 = 134218752;
    v75 = v7;
    v76 = 2048;
    *(double *)v77 = v8;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v9;
    *(_WORD *)&v78[8] = 2048;
    v79 = v10;
    v11 = "accel800 %llu x %.7f y %.7f z %.7f\n";
    goto LABEL_16;
  }
  v12 = objc_opt_class(CSSPUHgAccel);
  if ((objc_opt_isKindOfClass(v3, v12) & 1) != 0)
  {
    v13 = v3;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v6 = (id)qword_100387338;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v14 = *(void **)objc_msgSend(v13, "c_struct");
    v15 = *((float *)objc_msgSend(v13, "c_struct") + 2);
    v16 = *((float *)objc_msgSend(v13, "c_struct") + 3);
    v17 = *((float *)objc_msgSend(v13, "c_struct") + 4);
    v74 = 134218752;
    v75 = v14;
    v76 = 2048;
    *(double *)v77 = v15;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v16;
    *(_WORD *)&v78[8] = 2048;
    v79 = v17;
    v11 = "hgaccel %llu x %.7f y %.7f z %.7f\n";
    goto LABEL_16;
  }
  v18 = objc_opt_class(CSSPUAccel);
  if ((objc_opt_isKindOfClass(v3, v18) & 1) != 0)
  {
    v19 = v3;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v6 = (id)qword_100387338;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v20 = *(void **)objc_msgSend(v19, "c_struct");
    v21 = *((float *)objc_msgSend(v19, "c_struct") + 2);
    v22 = *((float *)objc_msgSend(v19, "c_struct") + 3);
    v23 = *((float *)objc_msgSend(v19, "c_struct") + 4);
    v74 = 134218752;
    v75 = v20;
    v76 = 2048;
    *(double *)v77 = v21;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v22;
    *(_WORD *)&v78[8] = 2048;
    v79 = v23;
    v11 = "accel %llu x %.7f y %.7f z %.7f\n";
LABEL_16:
    v24 = v6;
    v25 = 42;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v74, v25);
    goto LABEL_18;
  }
  v26 = objc_opt_class(CSSPUKappaTrigger);
  if ((objc_opt_isKindOfClass(v3, v26) & 1) != 0)
  {
    v27 = v3;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v6 = (id)qword_100387338;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v28 = (void *)*((_QWORD *)objc_msgSend(v27, "c_struct") + 1);
    v74 = 134217984;
    v75 = v28;
    v11 = "trigger %llu\n";
    v24 = v6;
    v25 = 12;
    goto LABEL_17;
  }
  v29 = objc_opt_class(CSSPUDM);
  if ((objc_opt_isKindOfClass(v3, v29) & 1) != 0)
  {
    v30 = v3;
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v6 = (id)qword_100387338;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v31 = *(void **)((char *)objc_msgSend(v30, "c_struct") + 42);
    v32 = *(float *)objc_msgSend(v30, "c_struct");
    v33 = *((float *)objc_msgSend(v30, "c_struct") + 1);
    v34 = *((float *)objc_msgSend(v30, "c_struct") + 2);
    v35 = *((float *)objc_msgSend(v30, "c_struct") + 3);
    v36 = *((float *)objc_msgSend(v30, "c_struct") + 4);
    v37 = *((float *)objc_msgSend(v30, "c_struct") + 5);
    v38 = *((float *)objc_msgSend(v30, "c_struct") + 6);
    v74 = 134219776;
    v75 = v31;
    v76 = 2048;
    *(double *)v77 = v32;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v33;
    *(_WORD *)&v78[8] = 2048;
    v79 = v34;
    v80 = 2048;
    v81 = v35;
    v82 = 2048;
    v83 = v36;
    v84 = 2048;
    v85 = v37;
    v86 = 2048;
    v87 = v38;
    v11 = "dm6 %llu %.7f %.7f %.7f %.7f %.7f %.7f %.7f\n";
    v24 = v6;
    v25 = 82;
    goto LABEL_17;
  }
  v39 = objc_opt_class(CSSPUGps);
  if ((objc_opt_isKindOfClass(v3, v39) & 1) != 0)
  {
    v40 = v3;
    v41 = sub_10027B738();
    v6 = objc_claimAutoreleasedReturnValue(v41);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v42 = (void *)*((_QWORD *)objc_msgSend(v40, "c_struct") + 5);
    v43 = *((_QWORD *)objc_msgSend(v40, "c_struct") + 8);
    v44 = *(float *)objc_msgSend(v40, "c_struct");
    v45 = *((float *)objc_msgSend(v40, "c_struct") + 1);
    v46 = *((float *)objc_msgSend(v40, "c_struct") + 2);
    v47 = *((float *)objc_msgSend(v40, "c_struct") + 3);
    v74 = 134219264;
    v75 = v42;
    v76 = 2048;
    *(_QWORD *)v77 = v43;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v44;
    *(_WORD *)&v78[8] = 2048;
    v79 = v45;
    v80 = 2048;
    v81 = v46;
    v82 = 2048;
    v83 = v47;
    v11 = "gps %llu %f %.7f %.7f %.7f %.7f\n";
    v24 = v6;
    v25 = 62;
    goto LABEL_17;
  }
  v48 = objc_opt_class(CSSPUSteps);
  if ((objc_opt_isKindOfClass(v3, v48) & 1) != 0)
  {
    v49 = v3;
    v50 = sub_10027B738();
    v6 = objc_claimAutoreleasedReturnValue(v50);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v51 = *(void **)objc_msgSend(v49, "c_struct");
    v52 = *((_DWORD *)objc_msgSend(v49, "c_struct") + 2);
    v53 = *((_DWORD *)objc_msgSend(v49, "c_struct") + 3);
    v54 = *((float *)objc_msgSend(v49, "c_struct") + 4);
    v55 = *((unsigned __int8 *)objc_msgSend(v49, "c_struct") + 20);
    v74 = 134219008;
    v75 = v51;
    v76 = 1024;
    *(_DWORD *)v77 = v52;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v53;
    *(_WORD *)v78 = 2048;
    *(double *)&v78[2] = v54;
    LOWORD(v79) = 1024;
    *(_DWORD *)((char *)&v79 + 2) = v55;
    v11 = "steps %llu %d %d %.7f %d\n";
    v24 = v6;
    v25 = 40;
    goto LABEL_17;
  }
  v56 = objc_opt_class(CSSPUSpl);
  if ((objc_opt_isKindOfClass(v3, v56) & 1) != 0)
  {
    v57 = v3;
    v58 = sub_10027B738();
    v6 = objc_claimAutoreleasedReturnValue(v58);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v59 = *(void **)objc_msgSend(v57, "c_struct");
    v60 = *((float *)objc_msgSend(v57, "c_struct") + 2);
    v74 = 134218240;
    v75 = v59;
    v76 = 2048;
    *(double *)v77 = v60;
    v11 = "SPL %llu %f\n";
    goto LABEL_42;
  }
  v61 = objc_opt_class(CSSPUPressure);
  if ((objc_opt_isKindOfClass(v3, v61) & 1) != 0)
  {
    v62 = v3;
    v63 = sub_10027B738();
    v6 = objc_claimAutoreleasedReturnValue(v63);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v64 = *(void **)objc_msgSend(v62, "c_struct");
    v65 = *((float *)objc_msgSend(v62, "c_struct") + 2);
    v74 = 134218240;
    v75 = v64;
    v76 = 2048;
    *(double *)v77 = v65;
    v11 = "pressure %llu %f\n";
    goto LABEL_42;
  }
  v66 = objc_opt_class(CSSignificantUserInteraction);
  if ((objc_opt_isKindOfClass(v3, v66) & 1) != 0)
  {
    v67 = v3;
    v68 = sub_10027B738();
    v6 = objc_claimAutoreleasedReturnValue(v68);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v74 = 134218240;
    v75 = objc_msgSend(v67, "timestamp");
    v76 = 1024;
    *(_DWORD *)v77 = objc_msgSend(v67, "type");
    v11 = "SUI %llu %u\n";
    v24 = v6;
    v25 = 18;
    goto LABEL_17;
  }
  v69 = objc_opt_class(CSSPURoadInfo);
  if ((objc_opt_isKindOfClass(v3, v69) & 1) == 0)
    goto LABEL_19;
  v70 = v3;
  v71 = sub_10027B738();
  v6 = objc_claimAutoreleasedReturnValue(v71);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v72 = *(void **)objc_msgSend(v70, "c_struct");
    v73 = *((_QWORD *)objc_msgSend(v70, "c_struct") + 1);
    v74 = 134218240;
    v75 = v72;
    v76 = 2048;
    *(_QWORD *)v77 = v73;
    v11 = "roads %llu %f\n";
LABEL_42:
    v24 = v6;
    v25 = 22;
    goto LABEL_17;
  }
LABEL_18:

LABEL_19:
}

- (void)sosActivated
{
  NSObject *v3;
  _BOOL4 inSession;
  CSMSLDataRecording *mslRecording;
  CSMSLDataRecording *v6;
  CSStudiesServerUploadOutOfBandMetadata *v7;
  _DWORD v8[2];
  __int16 v9;
  CSMSLDataRecording *v10;

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v3 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    inSession = self->_inSession;
    mslRecording = self->_mslRecording;
    v8[0] = 67109376;
    v8[1] = inSession;
    v9 = 2048;
    v10 = mslRecording;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sosActivated _inSession %d _mslRecording %p", (uint8_t *)v8, 0x12u);
  }
  if (self->_inSession && (v6 = self->_mslRecording) != 0)
  {
    -[CSMSLDataRecording updateMetadata:](v6, "updateMetadata:", &off_10036DDC0);
  }
  else
  {
    v7 = -[CSStudiesServerUploadOutOfBandMetadata initWithLookingBack:keyValuePairs:]([CSStudiesServerUploadOutOfBandMetadata alloc], "initWithLookingBack:keyValuePairs:", &off_10036DDE8, 900.0);
    -[CSStudiesServerUploader addOutOfBandMetadata:error:](self->_uploader, "addOutOfBandMetadata:error:", v7, 0);

  }
  self->_tellCompanionToUpload = 1;
}

- (void)feedAccel800:(id)a3
{
  CSSPUAccel800 *v4;
  CSSPUAccel800 *v5;
  id v6;

  v4 = (CSSPUAccel800 *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedFastAccel(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028B528(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2188, "-[CSKappaDetectionService feedAccel800:]");
    __break(1u);
  }
}

- (void)feedHgAccel:(id)a3
{
  CSSPUHgAccel *v4;
  CSSPUHgAccel *v5;
  id v6;

  v4 = (CSSPUHgAccel *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedHgAccel(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028B630(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2196, "-[CSKappaDetectionService feedHgAccel:]");
    __break(1u);
  }
}

- (void)feedAccel:(id)a3
{
  id v3;
  CSKappaDetectionService *v4;
  SEL v5;
  id v6;

  v3 = a3;
  if (v3)
  {

  }
  else
  {
    v4 = (CSKappaDetectionService *)sub_10028B738();
    -[CSKappaDetectionService feedDeviceMotion:](v4, v5, v6);
  }
}

- (void)feedDeviceMotion:(id)a3
{
  CSSPUDM *v4;
  CSSPUDM *v5;
  id v6;

  v4 = (CSSPUDM *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedDM(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028B880(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2214, "-[CSKappaDetectionService feedDeviceMotion:]");
    __break(1u);
  }
}

- (void)feedGPS:(id)a3
{
  CSSPUGps *v5;
  CSSPUGps *v6;
  double Current;
  int v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint8_t buf[2];
  __int16 v14;
  id v15;

  v5 = (CSSPUGps *)a3;
  v6 = v5;
  if (!v5)
  {
    sub_10028B988(&v15);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2223, "-[CSKappaDetectionService feedGPS:]");
    __break(1u);
    goto LABEL_20;
  }
  if (*((_DWORD *)-[CSSPUGps c_struct](v5, "c_struct") + 15) != 3)
  {
LABEL_5:
    if (!self->_gpsCount)
    {
      Current = CFAbsoluteTimeGetCurrent();
      LODWORD(Current) = sunElevationDeg(Current, *((float *)-[CSSPUGps c_struct](v6, "c_struct") + 4), *((float *)-[CSSPUGps c_struct](v6, "c_struct") + 5));
      v8 = *((unsigned __int8 *)-[CSSPUGps c_struct](v6, "c_struct") + 32);
      self->_sessionDetails.sunElevation = *(float *)&Current;
      self->_sessionDetails.signalEnvironment = v8;
      ++self->_gpsCount;
    }
    if (CSAOPSvc::isRecording((CSAOPSvc *)self->_aop))
    {
      v9 = self->_gpsCount + 1;
      self->_gpsCount = v9;
      self->_sessionDetails.gpsCount = v9;
    }
    objc_storeStrong((id *)&self->_poiGpsSample, a3);
    CLKappaAlgFlowController::feedGPS(self->fFlowControl.__ptr_.__value_, v6);
    goto LABEL_10;
  }
  if (!self->_shouldFeedAccessoryGPS)
  {
    if (qword_100387330 == -1)
    {
LABEL_12:
      v10 = qword_100387338;
      if (!os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      v14 = 0;
      v11 = "ignoring gps accessory";
      v12 = (uint8_t *)&v14;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v11, v12, 2u);
      goto LABEL_10;
    }
LABEL_20:
    dispatch_once(&qword_100387330, &stru_100363A20);
    goto LABEL_12;
  }
  if (self->_triggerAOPHasBTCarplay)
    goto LABEL_5;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v10 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    v11 = "ignoring gps accessory when btHint=0";
    v12 = buf;
    goto LABEL_18;
  }
LABEL_10:

}

- (void)feedSteps:(id)a3
{
  CSSPUSteps *v4;
  CSSPUSteps *v5;
  id v6;

  v4 = (CSSPUSteps *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedSteps(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028BA90(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2276, "-[CSKappaDetectionService feedSteps:]");
    __break(1u);
  }
}

- (void)feedKappaTrigger:(id)a3
{
  CSSPUKappaTrigger *v4;
  CSSPUKappaTrigger *v5;
  id v6;

  v4 = (CSSPUKappaTrigger *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedTrigger(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028BB98(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2285, "-[CSKappaDetectionService feedKappaTrigger:]");
    __break(1u);
  }
}

- (void)feedMag:(id)a3
{
  id v3;
  CSKappaDetectionService *v4;
  SEL v5;
  id v6;

  v3 = a3;
  if (v3)
  {

  }
  else
  {
    v4 = (CSKappaDetectionService *)sub_10028BCA0();
    -[CSKappaDetectionService feedPressure:](v4, v5, v6);
  }
}

- (void)feedPressure:(id)a3
{
  CSSPUPressure *v4;
  CSSPUPressure *v5;
  id v6;

  v4 = (CSSPUPressure *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedPressure(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028BDE8(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2301, "-[CSKappaDetectionService feedPressure:]");
    __break(1u);
  }
}

- (void)feedSoundPressureLevel:(id)a3
{
  CSSPUSpl *v4;
  CSSPUSpl *v5;
  id v6;

  v4 = (CSSPUSpl *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedAudioRms(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028BEF0(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2310, "-[CSKappaDetectionService feedSoundPressureLevel:]");
    __break(1u);
  }
}

- (void)feedTrustedAudioResult:(id)a3
{
  CSSPUTrustedAudioResult *v4;
  CSSPUTrustedAudioResult *v5;
  id v6;

  v4 = (CSSPUTrustedAudioResult *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedTrustedAudioResult(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028BFF8(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2319, "-[CSKappaDetectionService feedTrustedAudioResult:]");
    __break(1u);
  }
}

- (void)feedSignificantUserInteraction:(id)a3
{
  id v3;
  CSKappaDetectionService *v4;
  SEL v5;
  id v6;

  v3 = a3;
  if (v3)
  {

  }
  else
  {
    v4 = (CSKappaDetectionService *)sub_10028C100();
    -[CSKappaDetectionService feedRoads:](v4, v5, v6);
  }
}

- (void)feedRoads:(id)a3
{
  CSSPURoadInfo *v4;
  CSSPURoadInfo *v5;
  id v6;

  v4 = (CSSPURoadInfo *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedRoads(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028C248(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2335, "-[CSKappaDetectionService feedRoads:]");
    __break(1u);
  }
}

- (void)feedHertzSample:(id)a3
{
  CSSPUHertzSample *v4;
  CSSPUHertzSample *v5;
  id v6;

  v4 = (CSSPUHertzSample *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedHertzSample(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028C350(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2343, "-[CSKappaDetectionService feedHertzSample:]");
    __break(1u);
  }
}

- (void)feedCompanionStatus:(id)a3
{
  CSCompanionStatus *v4;
  CSCompanionStatus *v5;
  id v6;

  v4 = (CSCompanionStatus *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedCompanionStatus(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028C458(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2351, "-[CSKappaDetectionService feedCompanionStatus:]");
    __break(1u);
  }
}

- (void)feedRemoteSample:(id)a3
{
  CSRemoteSample *v4;
  CSRemoteSample *v5;
  id v6;

  v4 = (CSRemoteSample *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedRemoteSample(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10028C560(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2359, "-[CSKappaDetectionService feedRemoteSample:]");
    __break(1u);
  }
}

- (void)consumeSampleArray:(id)a3
{
  id v4;
  unint64_t i;
  CLKappaAlgFlowController *value;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
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
  id v27;
  NSObject *v28;
  _BYTE buf[24];

  v4 = a3;
  for (i = 0; (unint64_t)objc_msgSend(v4, "count") > i; ++i)
  {
    value = self->fFlowControl.__ptr_.__value_;
    if (!value)
    {
      sub_10028C668(buf);

      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2368, "-[CSKappaDetectionService consumeSampleArray:]");
      __break(1u);
LABEL_51:
      dispatch_once(&qword_100387330, &stru_100363A20);
LABEL_47:
      v28 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "stop consuming samples", buf, 2u);
      }
      break;
    }
    if (!*((_BYTE *)value + 8))
    {
      if (qword_100387330 == -1)
        goto LABEL_47;
      goto LABEL_51;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", i));
    v8 = objc_opt_class(CSSPUAccel800);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      -[CSKappaDetectionService feedAccel800:](self, "feedAccel800:", v9);
LABEL_31:

      goto LABEL_32;
    }
    v10 = objc_opt_class(CSSPUAccel);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      v9 = v7;
      -[CSKappaDetectionService feedAccel:](self, "feedAccel:", v9);
      goto LABEL_31;
    }
    v11 = objc_opt_class(CSSPUHgAccel);
    if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
    {
      v9 = v7;
      -[CSKappaDetectionService feedHgAccel:](self, "feedHgAccel:", v9);
      goto LABEL_31;
    }
    v12 = objc_opt_class(CSSPUKappaTrigger);
    if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
    {
      v9 = v7;
      if ((char)-[NSObject meta](v9, "meta") < 0)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v15 = (id)qword_100387338;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = -[NSObject timestamp](v9, "timestamp");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "ignoring stop trigger from aop %llu", buf, 0xCu);
        }

      }
      else
      {
        -[CSKappaDetectionService feedKappaTrigger:](self, "feedKappaTrigger:", v9);
      }
      goto LABEL_31;
    }
    v13 = objc_opt_class(CSSPUDM);
    if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
    {
      v9 = v7;
      -[CSKappaDetectionService feedDeviceMotion:](self, "feedDeviceMotion:", v9);
      goto LABEL_31;
    }
    v14 = objc_opt_class(CSSPUGps);
    if ((objc_opt_isKindOfClass(v7, v14) & 1) != 0)
    {
      v9 = v7;
      -[CSKappaDetectionService feedGPS:](self, "feedGPS:", v9);
      goto LABEL_31;
    }
    v17 = objc_opt_class(CSSPUSteps);
    if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
    {
      v9 = v7;
      -[CSKappaDetectionService feedSteps:](self, "feedSteps:", v9);
      goto LABEL_31;
    }
    v18 = objc_opt_class(CSSPUSpl);
    if ((objc_opt_isKindOfClass(v7, v18) & 1) != 0)
    {
      v9 = v7;
      -[CSKappaDetectionService feedSoundPressureLevel:](self, "feedSoundPressureLevel:", v9);
      goto LABEL_31;
    }
    v19 = objc_opt_class(CSSPUTrustedAudioResult);
    if ((objc_opt_isKindOfClass(v7, v19) & 1) != 0)
    {
      v9 = v7;
      -[CSKappaDetectionService feedTrustedAudioResult:](self, "feedTrustedAudioResult:", v9);
      goto LABEL_31;
    }
    v20 = objc_opt_class(CSSPUPressure);
    if ((objc_opt_isKindOfClass(v7, v20) & 1) != 0)
    {
      v9 = v7;
      -[CSKappaDetectionService feedPressure:](self, "feedPressure:", v9);
      goto LABEL_31;
    }
    v21 = objc_opt_class(CSSignificantUserInteraction);
    if ((objc_opt_isKindOfClass(v7, v21) & 1) != 0)
    {
      -[CSKappaDetectionService feedSignificantUserInteraction:](self, "feedSignificantUserInteraction:", v7);
    }
    else
    {
      v22 = objc_opt_class(CSSPURoadInfo);
      if ((objc_opt_isKindOfClass(v7, v22) & 1) != 0)
      {
        v9 = v7;
        -[CSKappaDetectionService feedRoads:](self, "feedRoads:", v9);
        goto LABEL_31;
      }
      v23 = objc_opt_class(CSSPUHertzSample);
      if ((objc_opt_isKindOfClass(v7, v23) & 1) != 0)
      {
        v9 = v7;
        -[CSKappaDetectionService feedHertzSample:](self, "feedHertzSample:", v9);
        goto LABEL_31;
      }
      v24 = objc_opt_class(CSCompanionStatus);
      if ((objc_opt_isKindOfClass(v7, v24) & 1) != 0)
      {
        v9 = v7;
        -[CSKappaDetectionService feedCompanionStatus:](self, "feedCompanionStatus:", v9);
        goto LABEL_31;
      }
      v25 = objc_opt_class(CSRemoteSample);
      if ((objc_opt_isKindOfClass(v7, v25) & 1) != 0)
      {
        v9 = v7;
        -[CSKappaDetectionService feedRemoteSample:](self, "feedRemoteSample:", v9);
        goto LABEL_31;
      }
      v26 = objc_opt_class(CSSPUMag);
      if ((objc_opt_isKindOfClass(v7, v26) & 1) == 0)
      {
        v27 = sub_10027B738();
        v9 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CSKappaDetectionService ignoring %@", buf, 0xCu);
        }
        goto LABEL_31;
      }
    }
LABEL_32:

  }
}

- (void)feedSortedSamples:(id)a3
{
  -[CSKappaDetectionService consumeSampleArray:](self, "consumeSampleArray:", a3);
}

- (void)feedLocationManagerResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  float v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a3;
  v5 = v4;
  if (self->_mslRecording)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    objc_msgSend(v6, "coordinate");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    objc_msgSend(v9, "coordinate");
    v11 = v10;

    *(float *)&v8 = v8;
    self->_sessionDetails.coarseLat = *(float *)&v8;
    self->_sessionDetails.coarseLong = v11;
  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v12 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "coarse location cannot be stored: IS=0 or IS=1 and not the first session in the recording", v13, 2u);
    }
  }

}

- (void)companionConnectedAckHandler_Deprecated:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  NSObject *v16;
  unsigned int v17;
  uint64_t v18;
  CSMSLDataRecording *mslRecording;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  CSMSLDataRecording *v24;
  void *v25;
  void *v26;
  void *v27;
  CLKappaAlgFlowController *value;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];
  _QWORD v44[3];
  uint8_t buf[4];
  _BYTE v46[10];
  _BYTE *v47;
  __int16 v48;
  unsigned int v49;
  int __dst;
  _BYTE v51[20];
  unsigned int v52;
  unsigned int v53;
  int v54;

  v6 = a4;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v7 = (id)qword_100387338;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v46 = objc_msgSend(v6, "length");
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = 36;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "companionConnectedAckHandler %d %d", buf, 0xEu);
  }

  if ((unint64_t)objc_msgSend(v6, "length") < 0x25)
  {
    if (self->_inSession)
    {
      v15 = objc_retainAutorelease(v6);
      memcpy(&__dst, objc_msgSend(v15, "bytes"), (size_t)objc_msgSend(v15, "length"));
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v16 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349570;
        *(_QWORD *)v46 = __dst;
        *(_WORD *)&v46[8] = 2082;
        v47 = v51;
        v48 = 1026;
        v49 = v52;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "received companion device info %{public}lu %{public}s %{public}d", buf, 0x1Cu);
      }
      if (v54 < 1)
        v17 = -1;
      else
        v17 = 1;
      if (v54)
        v18 = v17;
      else
        v18 = 0;
      mslRecording = self->_mslRecording;
      v44[0] = &__kCFBooleanTrue;
      v43[0] = CFSTR("companionConnected");
      v43[1] = CFSTR("companionDeviceModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v51));
      v44[1] = v20;
      v43[2] = CFSTR("companionDeviceType");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v52));
      v44[2] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 3));
      -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v22);

      if ((_companionCompatibility & 0xFFFFFFFD) == 1)
      {
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v23 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67240448;
          *(_DWORD *)v46 = v53;
          *(_WORD *)&v46[4] = 1026;
          *(_DWORD *)&v46[6] = v54;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "received companion device info %{public}d %{public}d", buf, 0xEu);
        }
        v24 = self->_mslRecording;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v53, CFSTR("companionTokenCount")));
        v41[1] = CFSTR("companionArmedStatus");
        v42[0] = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v18));
        v42[1] = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));
        -[CSMSLDataRecording updateMetadata:](v24, "updateMetadata:", v27);

      }
      self->_companionDeviceType = v52;
      -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 10, 0);
      value = self->fFlowControl.__ptr_.__value_;
      v29 = *((_QWORD *)value + 38);
      v30 = (std::__shared_weak_count *)*((_QWORD *)value + 39);
      if (v30)
      {
        p_shared_owners = (unint64_t *)&v30->__shared_owners_;
        do
          v32 = __ldxr(p_shared_owners);
        while (__stxr(v32 + 1, p_shared_owners));
        value = self->fFlowControl.__ptr_.__value_;
      }
      *(_BYTE *)(v29 + 90) = 1;
      v33 = *((_QWORD *)value + 40);
      v34 = (std::__shared_weak_count *)*((_QWORD *)value + 41);
      if (v34)
      {
        v35 = (unint64_t *)&v34->__shared_owners_;
        do
          v36 = __ldxr(v35);
        while (__stxr(v36 + 1, v35));
        *(_BYTE *)(v33 + 81) = 1;
        self->_companionConnected = 1;
        do
          v37 = __ldaxr(v35);
        while (__stlxr(v37 - 1, v35));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      else
      {
        *(_BYTE *)(v33 + 81) = 1;
        self->_companionConnected = 1;
      }
      if (v30)
      {
        v39 = (unint64_t *)&v30->__shared_owners_;
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
    }
    else
    {
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v38 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v12 = "companion out of sync, session not in progress";
        v13 = v38;
        v14 = 2;
        goto LABEL_50;
      }
    }
  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v8 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "incorrect number of bytes for device info", buf, 2u);
    }
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v9 = (id)qword_100387338;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(v6, "length");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v46 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "data length %lu", buf, 0xCu);
    }

    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v11 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v46 = 36;
      v12 = "result length %lu";
      v13 = v11;
      v14 = 12;
LABEL_50:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v12, buf, v14);
    }
  }

}

- (void)connectionCreated:(id)a3 withMessage:(id)a4
{
  -[CSKappaDetectionService messageReceived:fromConnection:](self, "messageReceived:fromConnection:", a4, a3);
}

- (void)messageReceived:(id)a3 fromConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  CLConnectionMessage *v23;
  void *v24;
  unsigned int v25;
  NSObject *v26;
  CLConnectionMessage *v27;
  uint64_t Dictionary;
  void *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  void *v47;
  double v48;
  double v49;
  CSPower *powerAssertion;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  id v54;
  _BYTE buf[18];
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;

  v6 = a3;
  v7 = a4;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v8 = (id)qword_100387338;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    v56 = 2114;
    v57 = v7;
    v58 = 2114;
    v59 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"messageReceived\", \"connection\":%{public, location:escape_only}@, \"name\":%{public, location:escape_only}@}", buf, 0x26u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.anomalydetectiond.kappa.message.test"));

  if (v11)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v12 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "testMessageReceived", buf, 2u);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.anomalydetectiond.kappa.ttr.test"));

    if (!v14)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.anomalydetectiond.kappa.command"));

      if (v22)
      {
        if (v6)
        {
          objc_msgSend(v6, "message");
          v23 = *(CLConnectionMessage **)buf;
        }
        else
        {
          v23 = 0;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
        }
        Dictionary = CLConnectionMessage::getDictionary(v23);
        v29 = (void *)objc_claimAutoreleasedReturnValue(Dictionary);
        v30 = *(std::__shared_weak_count **)&buf[8];
        if (*(_QWORD *)&buf[8])
        {
          v31 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CSKappaCommandKey")));
        if (!v33
          || (v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CSKappaValueKey"))),
              v35 = v34 == 0,
              v34,
              v33,
              v35))
        {
          if (qword_100387330 != -1)
            dispatch_once(&qword_100387330, &stru_100363A20);
          v42 = qword_100387338;
          if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "invalid command", buf, 2u);
          }
        }
        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CSKappaCommandKey")));
          v37 = objc_msgSend(v36, "intValue");

          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CSKappaValueKey")));
          v39 = objc_msgSend(v38, "intValue");

          if (qword_100387330 != -1)
            dispatch_once(&qword_100387330, &stru_100363A20);
          v40 = qword_100387338;
          if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = (_DWORD)v37;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = (_DWORD)v39;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "cmd = %d val = %d", buf, 0xEu);
          }
          -[CSKappaDetectionService saveForceState:withValue:](self, "saveForceState:withValue:", v37, v39);
          if (v6)
          {
            objc_msgSend(v6, "message");
            v41 = *(_QWORD *)buf;
          }
          else
          {
            v41 = 0;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
          }
          CLConnectionMessage::sendReply(v41, &__kCFBooleanTrue);
          v51 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v52 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v53 = __ldaxr(v52);
            while (__stlxr(v53 - 1, v52));
            if (!v53)
            {
              ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
              std::__shared_weak_count::__release_weak(v51);
            }
          }
        }
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.anomalydetectiond.kappa.powerassertion.test"));

        if (!v25)
          goto LABEL_68;
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v26 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "testPowerAssertionReceived", buf, 2u);
        }
        if (v6)
        {
          objc_msgSend(v6, "message");
          v27 = *(CLConnectionMessage **)buf;
        }
        else
        {
          v27 = 0;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
        }
        v43 = CLConnectionMessage::getDictionary(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v44 = *(std::__shared_weak_count **)&buf[8];
        if (*(_QWORD *)&buf[8])
        {
          v45 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
          do
            v46 = __ldaxr(v45);
          while (__stlxr(v46 - 1, v45));
          if (!v46)
          {
            ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
            std::__shared_weak_count::__release_weak(v44);
          }
        }
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("testPowerAssertionCmd")));
        objc_msgSend(v47, "doubleValue");
        v49 = v48;

        powerAssertion = self->_powerAssertion;
        if (v49 <= 0.0)
          -[CSPower releasePowerAssertion](powerAssertion, "releasePowerAssertion");
        else
          -[CSPower createPowerAssertion:](powerAssertion, "createPowerAssertion:", CFSTR("anomalyctl"));
      }

      goto LABEL_68;
    }
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v15 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "testTTRReceived", buf, 2u);
    }
    v16 = atomic_load((unsigned __int8 *)&qword_100389398);
    if ((v16 & 1) == 0 && __cxa_guard_acquire(&qword_100389398))
    {
      qword_100389390 = -[CSKappaTap2RadarConfiguration initWithAllowOnBattery:checkIntervalInSeconds:coolDownPeriodInSeconds:]([CSKappaTap2RadarConfiguration alloc], "initWithAllowOnBattery:checkIntervalInSeconds:coolDownPeriodInSeconds:", 1, XPC_ACTIVITY_INTERVAL_1_MIN, 0);
      __cxa_guard_release(&qword_100389398);
    }
    if (qword_1003893A8 != -1)
      dispatch_once(&qword_1003893A8, &stru_100363A00);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));

    v54 = 0;
    objc_msgSend((id)qword_1003893A0, "enqueueTTRWithTriggerUUID:error:", v18, &v54);
    v19 = v54;
    if (v19)
    {
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v20 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Error enqueuing for TTR test: %@", buf, 0xCu);
      }
    }

  }
LABEL_68:

}

- (void)onCompanionTestTrigger:(double)a3
{
  NSObject *v5;
  void *v6;
  CSCompanionServiceProtocol *companionProxy;
  void *v8;
  uint8_t buf[4];
  double v10;

  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v5 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "onCompanionTestTrigger: timestamp: %f", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("test message data %f"), *(_QWORD *)&a3));
  companionProxy = self->_companionProxy;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
  -[CSCompanionServiceProtocol sendData:type:](companionProxy, "sendData:type:", v8, 0);

}

- (void)kappaSessionCompanionHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v6;
  NSUUID *v7;
  NSUUID *companionUUID;
  uint64_t v9;
  NSUUID *v10;
  const char *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  NSUUID *v18;
  NSUUID *companionUUIDPreSession;
  NSUUID *v20;
  _BYTE buf[24];

  v6 = a4;
  if (self->_inSession)
  {
    if (self->_canCollectData)
      goto LABEL_3;
LABEL_11:
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v14 = qword_100387338;
    if (!os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v11 = "ignoring companion UUID since collection is not allowed";
    v15 = v14;
    v16 = OS_LOG_TYPE_DEBUG;
    v17 = 2;
    goto LABEL_21;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
  v13 = objc_msgSend(v12, "isAuthorizedToCollectData");

  if ((v13 & 1) == 0)
    goto LABEL_11;
LABEL_3:
  if ((unint64_t)objc_msgSend(v6, "length") > 0xF)
  {
    if (self->_inSession)
    {
      if (self->_companionUUID)
        goto LABEL_22;
      v7 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v6), "bytes"));
      companionUUID = self->_companionUUID;
      self->_companionUUID = v7;

      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v9 = qword_100387338;
      if (!os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v10 = self->_companionUUID;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      v11 = "Companion trigger session UUID %{public}@";
    }
    else
    {
      if (self->_companionUUIDPreSession)
        goto LABEL_22;
      v18 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v6), "bytes"));
      companionUUIDPreSession = self->_companionUUIDPreSession;
      self->_companionUUIDPreSession = v18;

      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v9 = qword_100387338;
      if (!os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v20 = self->_companionUUIDPreSession;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      v11 = "Companion trigger session UUID %{public}@";
    }
    v15 = v9;
    v16 = OS_LOG_TYPE_DEFAULT;
    v17 = 12;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v15, v16, v11, buf, v17);
LABEL_22:

    return;
  }
  sub_10028C770(buf);

  abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2650, "-[CSKappaDetectionService kappaSessionCompanionHandler:data:receivedTimestamp:]");
  __break(1u);
}

- (void)companionTriggerHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v6;
  id v7;
  int v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[8];
  id __dst;
  unsigned __int8 v14;
  uint8_t v15[4];
  int v16;
  uint64_t v17;

  v6 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") <= 0x27)
  {
    sub_10028C878(&__dst);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSKappaDetectionService.mm", 2740, "-[CSKappaDetectionService companionTriggerHandler:data:receivedTimestamp:]");
    __break(1u);
  }
  v7 = objc_retainAutorelease(v6);
  memcpy(&__dst, objc_msgSend(v7, "bytes"), (size_t)objc_msgSend(v7, "length"));
  v8 = v14;
  if ((v14 & 4) != 0)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v11 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v15 = 67109120;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "not setting companion trigger time path %d", v15, 8u);
    }
  }
  else
  {
    *(_WORD *)v15 = 1027;
    v15[2] = 0;
    v17 = 0;
    CSAOPSvc::sendCommand((CSAOPSvc *)self->_aop, v15, 0x10u);
    v9 = *(double *)&__dst;
    if (*(double *)&__dst == 0.0)
    {
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v10 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "companion message trigger time of zero will leak wall-clock time", buf, 2u);
      }
    }
    self->_companionTriggerTime = v9;
  }

}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  double v19;

  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v10 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109890;
    v13[1] = a3;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v8;
    v18 = 2048;
    v19 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "onCompanionMessage: type: %d, msg: %@ data: %@, receivedTimestamp: %f", (uint8_t *)v13, 0x26u);
  }
  if (self->_isLoggingDevice || self->_isDetectionDevice)
  {
    if (a3 > 100)
    {
      if (a3 <= 200)
      {
        if (a3 == 101)
        {
          v12 = 102;
LABEL_29:
          -[CSKappaDetectionService companionConnectedAck:](self, "companionConnectedAck:", v12);
        }
        else if (a3 == 102)
        {
          -[CSKappaDetectionService companionConnectedAckHandler:data:receivedTimestamp:](self, "companionConnectedAckHandler:data:receivedTimestamp:", 102, v8, a5);
        }
      }
      else
      {
        switch(a3)
        {
          case 201:
            -[CSKappaDetectionService receiveDeviceInfoProtobuf:](self, "receiveDeviceInfoProtobuf:", v8);
            break;
          case 202:
            -[CSKappaDetectionService receiveForceTriggerProtobuf:](self, "receiveForceTriggerProtobuf:", v8);
            break;
          case 203:
            -[CSKappaDetectionService receiveCompanionUUID:](self, "receiveCompanionUUID:", v8);
            break;
        }
      }
    }
    else
    {
      switch(a3)
      {
        case 1:
          -[CSKappaDetectionService kappaSessionCompanionHandler:data:receivedTimestamp:](self, "kappaSessionCompanionHandler:data:receivedTimestamp:", 1, v8, a5);
          break;
        case 3:
          -[CSKappaDetectionService companionTriggerHandler:data:receivedTimestamp:](self, "companionTriggerHandler:data:receivedTimestamp:", 3, v8, a5);
          break;
        case 4:
          v12 = 5;
          goto LABEL_29;
        case 5:
          -[CSKappaDetectionService companionConnectedAckHandler_Deprecated:data:receivedTimestamp:](self, "companionConnectedAckHandler_Deprecated:data:receivedTimestamp:", 5, v8, a5);
          break;
        case 7:
          -[CSKappaDetectionService companionDecidedToUploadHandler:data:receivedTimestamp:](self, "companionDecidedToUploadHandler:data:receivedTimestamp:", 7, v8, a5);
          break;
        default:
          break;
      }
    }
  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v11 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ignore companion messages", (uint8_t *)v13, 2u);
    }
  }

}

- (void)onCompanionStatusUpdate:(BOOL)a3 pairedDevice:(id)a4 updatedTimestamp:(double)a5
{
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  _BYTE v16[14];
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;

  v6 = a3;
  v7 = a4;
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v8 = qword_100387338;
  if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
  {
    v15 = 67109376;
    *(_DWORD *)v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(double *)&v16[6] = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onCompanionStatusUpdate: isConnected: %d, updatedTimestamp: %f", (uint8_t *)&v15, 0x12u);
  }
  if (qword_100387330 != -1)
    dispatch_once(&qword_100387330, &stru_100363A20);
  v9 = (id)qword_100387338;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name")));
    v11 = objc_msgSend(v10, "UTF8String");
    v12 = objc_msgSend(v7, "isNearby");
    v13 = objc_msgSend(v7, "isDefaultPairedDevice");
    v14 = objc_msgSend(v7, "isConnected");
    v15 = 136315906;
    *(_QWORD *)v16 = v11;
    *(_WORD *)&v16[8] = 1024;
    *(_DWORD *)&v16[10] = v12;
    v17 = 1024;
    v18 = v13;
    v19 = 1024;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Paired device info: name %s, isNearby %d, isDefaultPairedDevice %d, isConnected %d", (uint8_t *)&v15, 0x1Eu);

  }
}

- (void)didReceiveSOSAck:(int64_t)a3 forMode:(unsigned __int8)a4
{
  NSObject *v6;
  NSObject *v7;
  _BOOL4 SOSInProgress;
  NSObject *v9;
  void *v10;
  int64_t v11;
  uint8_t buf[4];
  int64_t v13;

  v11 = a3;
  if (a4 == 1)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v6 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "didReceiveSOSAck response:%ld", buf, 0xCu);
    }
    if ((unint64_t)a3 <= 6)
    {
      if (((1 << a3) & 0x65) != 0)
      {
        self->_SOSInProgress = 1;
        if (qword_100387330 != -1)
          dispatch_once(&qword_100387330, &stru_100363A20);
        v7 = qword_100387338;
        if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_INFO))
        {
          SOSInProgress = self->_SOSInProgress;
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = SOSInProgress;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didReceiveSOSAck setting _SOSInProgress to %d", buf, 8u);
        }
        -[CSPower releasePowerAssertion](self->_powerAssertion, "releasePowerAssertion");
      }
      else
      {
        -[CSMSLDataRecording updateMetadata:](self->_mslRecording, "updateMetadata:", &off_10036DE10);
        -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 7, 0);
      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v11, 8));
    -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 4, v10);

  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v9 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "sos status ack invalid mode", buf, 2u);
    }
  }
}

- (void)didReceiveSOSStatusUpdate:(id)a3 forMode:(unsigned __int8)a4
{
  int v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  _UNKNOWN **v16;
  void *v17;
  NSObject *v18;
  CSMSLDataRecording *mslRecording;
  void *v20;
  void *v21;
  CSMSLDataRecording *v22;
  void *v23;
  void *v24;
  CSMSLDataRecording *v25;
  void *v26;
  void *v27;
  _BOOL4 SOSInProgress;
  unsigned int v29;
  NSObject *v30;
  char v31;
  char v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  _BYTE v40[10];
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  unsigned int v45;

  v4 = a4;
  v6 = a3;
  if (v4 == 1)
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v7 = (id)qword_100387338;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sosStatus"));
      v9 = objc_msgSend(v8, "flowState");
      v10 = objc_msgSend(v6, "isKappaFlow");
      v11 = objc_msgSend(v6, "isKappaFlowActive");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sosStatus"));
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)v40 = v9;
      *(_WORD *)&v40[8] = 1024;
      v41 = v10;
      v42 = 1024;
      v43 = v11;
      v44 = 1024;
      v45 = objc_msgSend(v12, "isPairedDeviceStatus");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "didReceiveSOSStatusUpdate state:%ld, isKappaFlow:%d, isKappaFlowActive:%d isFromPaired:%d", buf, 0x1Eu);

    }
    if ((objc_msgSend(v6, "isKappaFlow") & 1) == 0)
    {
      if (qword_100387330 != -1)
        dispatch_once(&qword_100387330, &stru_100363A20);
      v13 = qword_100387338;
      if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Received non-Kappa flow state from SOS SM (should never happen)", buf, 2u);
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sosStatus"));
    v15 = objc_msgSend(v14, "isPairedDeviceStatus");

    v32 = v15 ^ 1;
    switch((unint64_t)objc_msgSend(v6, "sosKappaState"))
    {
      case 1uLL:
        if (v32)
          v16 = &off_10036DE38;
        else
          v16 = &off_10036DE60;
        -[CSMSLDataRecording updateMetadata:](self->_mslRecording, "updateMetadata:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v32, 1));
        -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 5, v17);
        goto LABEL_23;
      case 3uLL:
        mslRecording = self->_mslRecording;
        v37 = CFSTR("userResponse");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "sosKappaState")));
        v38 = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
        -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v21);

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v32, 1));
        -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 7, v17);
        goto LABEL_23;
      case 4uLL:
        v22 = self->_mslRecording;
        v35 = CFSTR("userResponse");
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "sosKappaState")));
        v36 = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
        -[CSMSLDataRecording updateMetadata:](v22, "updateMetadata:", v24);

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v32, 1));
        -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 8, v17);
        goto LABEL_23;
      case 6uLL:
        v25 = self->_mslRecording;
        v33 = CFSTR("userResponse");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "sosKappaState")));
        v34 = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
        -[CSMSLDataRecording updateMetadata:](v25, "updateMetadata:", v27);

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v32, 1));
        -[CSKappaDetectionService updateKappaSessionClients:data:](self, "updateKappaSessionClients:data:", 6, v17);
LABEL_23:

        break;
      default:
        break;
    }
    SOSInProgress = self->_SOSInProgress;
    v29 = objc_msgSend(v6, "isKappaFlowActive");
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v30 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v40 = SOSInProgress;
      *(_WORD *)&v40[4] = 1024;
      *(_DWORD *)&v40[6] = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "_SOSInProgress prev %d, current %d", buf, 0xEu);
    }
    if (SOSInProgress)
      v31 = v29;
    else
      v31 = 1;
    if ((v31 & 1) == 0)
      -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 7, 0);
  }
  else
  {
    if (qword_100387330 != -1)
      dispatch_once(&qword_100387330, &stru_100363A20);
    v18 = qword_100387338;
    if (os_log_type_enabled((os_log_t)qword_100387338, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "sos status update for invalid mode", buf, 2u);
    }
  }

}

- (id)userInfoUploader
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100289720;
  v5[3] = &unk_1003610F8;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (CSMSLDataRecording)mslRecording
{
  return self->_mslRecording;
}

- (void)setMslRecording:(id)a3
{
  objc_storeStrong((id *)&self->_mslRecording, a3);
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (CSCompanionServiceProtocol)companionProxy
{
  return self->_companionProxy;
}

- (CSConnectionServer)kappaConnectionServer
{
  return self->_kappaConnectionServer;
}

- (int)delayBufferSize
{
  return self->_delayBufferSize;
}

- (void)setDelayBufferSize:(int)a3
{
  self->_delayBufferSize = a3;
}

- (BOOL)simulated
{
  return self->_simulated;
}

- (void)setSimulated:(BOOL)a3
{
  self->_simulated = a3;
}

- (BOOL)simulatedAuthorized
{
  return self->_simulatedAuthorized;
}

- (void)setSimulatedAuthorized:(BOOL)a3
{
  self->_simulatedAuthorized = a3;
}

- (void).cxx_destruct
{
  CompanionTrigger *value;
  CompanionDeviceInfo *v4;
  CLKappaAlgFlowController *v5;
  CompanionUUID *v6;

  objc_storeStrong((id *)&self->_kappaConnectionServer, 0);
  objc_storeStrong((id *)&self->_companionProxy, 0);
  value = self->_kappaCompanionTrigger.__ptr_.__value_;
  self->_kappaCompanionTrigger.__ptr_.__value_ = 0;
  if (value)
    operator delete();
  v4 = self->_kappaCompanion.__ptr_.__value_;
  self->_kappaCompanion.__ptr_.__value_ = 0;
  if (v4)
    sub_10026C4A8((uint64_t)&self->_kappaCompanion, (uint64_t)v4);
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_silo, 0);
  objc_storeStrong((id *)&self->_coreAnalytics, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
  objc_storeStrong((id *)&self->_mslRecording, 0);
  objc_storeStrong((id *)&self->_poiGpsSample, 0);
  objc_storeStrong((id *)&self->_geoMapSvc, 0);
  objc_storeStrong((id *)&self->_biomeUnlockSink, 0);
  objc_storeStrong((id *)&self->_biomeAppLaunchSink, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_sosTimer, 0);
  objc_storeStrong((id *)&self->_triggerTimer, 0);
  v5 = self->fFlowControl.__ptr_.__value_;
  self->fFlowControl.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(CLKappaAlgFlowController *))(*(_QWORD *)v5 + 8))(v5);
  objc_storeStrong(&self->_waitForPOIState, 0);
  objc_storeStrong(&self->_waitForSOSState, 0);
  objc_storeStrong(&self->_readingState, 0);
  objc_storeStrong(&self->_idleState, 0);
  objc_storeStrong((id *)&self->_hsm, 0);
  objc_storeStrong((id *)&self->_sosSM, 0);
  v6 = self->_kappaCompanionUUID.__ptr_.__value_;
  self->_kappaCompanionUUID.__ptr_.__value_ = 0;
  if (v6)
    sub_100011294((uint64_t)&self->_kappaCompanionUUID, (uint64_t)v6);
  objc_storeStrong((id *)&self->_companionUUID, 0);
  objc_storeStrong((id *)&self->_companionUUIDPreSession, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_DWORD *)self + 62) = -1082130432;
  *((_BYTE *)self + 252) = 0;
  *((_QWORD *)self + 32) = 0;
  *(_OWORD *)((char *)self + 264) = 0u;
  *((int32x2_t *)self + 35) = vdup_n_s32(0x447A0000u);
  *((_QWORD *)self + 36) = 0x3E8447A0000;
  *((_DWORD *)self + 90) = 0;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 341) = 0u;
  *((_QWORD *)self + 46) = 0;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  return self;
}

@end
