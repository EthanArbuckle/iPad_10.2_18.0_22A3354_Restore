@implementation CSSafetySOSStateMachine

- (CSSafetySOSStateMachine)initWithSilo:(id)a3 vendor:(id)a4 client:(id)a5 aopService:(void *)a6
{
  NSObject *v10;
  CSCompanionServiceProtocol *v11;
  CSCompanionServiceProtocol *companion;
  id v13;
  CLTimer *v14;
  CLTimer *timer;
  CSSafetySOSStateMachine *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  CSKappaTap2Radar *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  CSKappaTap2Radar *v29;
  CSKappaTap2Radar *ttr;
  CSKappaTap2Radar *v31;
  CSKappaTap2Radar *v32;
  NSObject *v33;
  CSSafetySOSStateMachine *v34;
  _QWORD *v35;
  id idleState;
  id *p_idleState;
  CSSafetySOSStateMachine *v38;
  _QWORD *v39;
  id potentialCrashState;
  CSSafetySOSStateMachine *v41;
  _QWORD *v42;
  id crashStagingState;
  CSSafetySOSStateMachine *v44;
  _QWORD *v45;
  id notifyingCompanionState;
  id *p_notifyingCompanionState;
  CSSafetySOSStateMachine *v48;
  _QWORD *v49;
  id crashProcessingState;
  uint64_t v51;
  NSUserDefaults *defaults;
  void *v53;
  unsigned int v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  double v61;
  NSObject *v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double localDecisionTimestamp;
  NSObject *v69;
  double v70;
  id v71;
  void *v72;
  NSUUID *v73;
  NSUUID *localTriggerUUID;
  id v75;
  void *v76;
  void *v77;
  NSUUID *v78;
  NSUUID *companionTriggerUUID;
  NSObject *v80;
  CFAbsoluteTime Current;
  NSObject *v82;
  _BOOL4 sendUnprocessedCrash;
  double v84;
  NSUUID *v85;
  NSUUID *v86;
  CSHSMObjc *v87;
  id v88;
  id *v89;
  CSHSMObjc *v90;
  CSHSMObjc *hsm;
  CSSafetySOSStateMachine *v92;
  void *v94;
  unsigned int v95;
  id v96;
  id v97;
  id v98;
  _QWORD v99[4];
  CSSafetySOSStateMachine *v100;
  _QWORD v101[4];
  CSSafetySOSStateMachine *v102;
  _QWORD v103[4];
  CSSafetySOSStateMachine *v104;
  _QWORD v105[4];
  CSSafetySOSStateMachine *v106;
  _QWORD v107[4];
  CSSafetySOSStateMachine *v108;
  id v109;
  _QWORD v110[4];
  CSSafetySOSStateMachine *v111;
  id location;
  uint8_t buf[4];
  _BYTE v114[10];
  CFAbsoluteTime v115;
  NSUUID *v116;
  __int16 v117;
  double v118;
  __int16 v119;
  NSUUID *v120;

  v98 = a3;
  v97 = a4;
  v96 = a5;
  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v10 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "beginService SM", buf, 2u);
  }
  self->_valid = 1;
  objc_storeStrong((id *)&self->_client, a5);
  objc_storeStrong((id *)&self->_vendor, a4);
  self->_aopSvc = a6;
  v11 = (CSCompanionServiceProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "proxyForService:", CFSTR("CSCompanionService")));
  companion = self->_companion;
  self->_companion = v11;

  -[CSCompanionServiceProtocol registerDelegate:inSilo:](self->_companion, "registerDelegate:inSilo:", self, v98);
  -[CSCompanionServiceProtocol registerClient:](self->_companion, "registerClient:", self);
  v13 = objc_initWeak(&location, self);
  v14 = (CLTimer *)objc_msgSend(v98, "newTimer");
  timer = self->_timer;
  self->_timer = v14;

  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_1002734D4;
  v110[3] = &unk_10034B158;
  v16 = self;
  v111 = v16;
  -[CLTimer setHandler:](self->_timer, "setHandler:", v110);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SOSKappaManager sharedInstance](SOSKappaManager, "sharedInstance"));
  objc_msgSend(v17, "addObserver:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  v19 = objc_msgSend(v18, "isInternalInstall");

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = NSTemporaryDirectory();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("kappaTTRSpooler")));
    objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v23, 1, 0, 0);

    v24 = [CSKappaTap2Radar alloc];
    v25 = NSTemporaryDirectory();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingPathComponent:", CFSTR("kappaTTRSpooler")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[CSKappaTap2RadarConfiguration tap2RadarUserConfiguration](CSKappaTap2RadarConfiguration, "tap2RadarUserConfiguration"));
    v29 = -[CSKappaTap2Radar initWithSpoolerFolder:andConfiguration:](v24, "initWithSpoolerFolder:andConfiguration:", v27, v28);
    ttr = v16->_ttr;
    v16->_ttr = v29;

    v31 = v16->_ttr;
    v109 = 0;
    -[CSKappaTap2Radar startMonitoringWithError:](v31, "startMonitoringWithError:", &v109);
    v32 = (CSKappaTap2Radar *)v109;
    if (v32)
    {
      if (qword_100387450 != -1)
        dispatch_once(&qword_100387450, &stru_100361F80);
      v33 = qword_100387458;
      if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v114 = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Error starting TTR monitoring: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v32 = v16->_ttr;
    v16->_ttr = 0;
  }

  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = sub_100273574;
  v107[3] = &unk_1003610D0;
  v34 = v16;
  v108 = v34;
  v35 = objc_retainBlock(v107);
  p_idleState = &v34->_idleState;
  idleState = v34->_idleState;
  v34->_idleState = v35;

  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_1002735E8;
  v105[3] = &unk_1003610D0;
  v38 = v34;
  v106 = v38;
  v39 = objc_retainBlock(v105);
  potentialCrashState = v38->_potentialCrashState;
  v38->_potentialCrashState = v39;

  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472;
  v103[2] = sub_100273684;
  v103[3] = &unk_1003610D0;
  v41 = v38;
  v104 = v41;
  v42 = objc_retainBlock(v103);
  crashStagingState = v41->_crashStagingState;
  v41->_crashStagingState = v42;

  v101[0] = _NSConcreteStackBlock;
  v101[1] = 3221225472;
  v101[2] = sub_1002738F4;
  v101[3] = &unk_1003610D0;
  v44 = v41;
  v102 = v44;
  v45 = objc_retainBlock(v101);
  p_notifyingCompanionState = &v44->_notifyingCompanionState;
  notifyingCompanionState = v44->_notifyingCompanionState;
  v44->_notifyingCompanionState = v45;

  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_10027398C;
  v99[3] = &unk_1003610D0;
  v48 = v44;
  v100 = v48;
  v49 = objc_retainBlock(v99);
  crashProcessingState = v48->_crashProcessingState;
  v48->_crashProcessingState = v49;

  v51 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  defaults = v48->_defaults;
  v48->_defaults = (NSUserDefaults *)v51;

  -[NSUserDefaults removeObjectForKey:](v48->_defaults, "removeObjectForKey:", kSOSEventKey);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v54 = objc_msgSend(v53, "BOOLForKey:", CFSTR("ActiveKappaDecision"));

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v95 = objc_msgSend(v55, "BOOLForKey:", CFSTR("WaitingForSOSAck"));

  v56 = objc_alloc((Class)NSUUID);
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKey:", CFSTR("KappaSOSUUID")));
  v59 = objc_msgSend(v56, "initWithUUIDString:", v58);

  if ((v54 & 1) != 0)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[SOSKappaManager currentSOSStatus](SOSKappaManager, "currentSOSStatus"));
    v61 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "uuid")));

    if (qword_100387450 != -1)
      dispatch_once(&qword_100387450, &stru_100361F80);
    v62 = qword_100387458;
    if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v114 = v59;
      *(_WORD *)&v114[8] = 2112;
      v115 = v61;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "Start - SOS UUID: lastReceivedSOSUUID: %@, currentSOSUUID: %@", buf, 0x16u);
    }
    if (objc_msgSend(*(id *)&v61, "isEqual:", v59))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
      objc_msgSend(v63, "doubleForKey:", CFSTR("KappaLocalTimestamp"));
      v48->_localDecisionTimestamp = v64;

      v65 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
      objc_msgSend(v65, "doubleForKey:", CFSTR("KappaExpirationTimestamp"));
      v67 = v66;

      localDecisionTimestamp = v48->_localDecisionTimestamp;
      if (localDecisionTimestamp >= CFAbsoluteTimeGetCurrent() || CFAbsoluteTimeGetCurrent() >= v67)
      {
        if (qword_100387450 != -1)
          dispatch_once(&qword_100387450, &stru_100361F80);
        v80 = (id)qword_100387458;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          Current = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134218240;
          *(double *)v114 = v67;
          *(_WORD *)&v114[8] = 2048;
          v115 = Current;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "Recovered expired crash, discarding. expirationTime:%f, currentTime:%f", buf, 0x16u);
        }

        -[CSSafetySOSStateMachine resetAllPersistedValues](v48, "resetAllPersistedValues");
      }
      else
      {
        if (qword_100387450 != -1)
          dispatch_once(&qword_100387450, &stru_100361F80);
        v69 = qword_100387458;
        if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_INFO))
        {
          v70 = v48->_localDecisionTimestamp;
          *(_DWORD *)buf = 134217984;
          *(double *)v114 = v70;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "Recovered valid crash, crashDecisionTimestamp:%f", buf, 0xCu);
        }
        v48->_sendUnprocessedCrash = 1;
        v48->_localShouldSend = 1;
        v71 = objc_alloc((Class)NSUUID);
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "objectForKey:", CFSTR("KappaLocalUUID")));
        v73 = (NSUUID *)objc_msgSend(v71, "initWithUUIDString:", v72);
        localTriggerUUID = v48->_localTriggerUUID;
        v48->_localTriggerUUID = v73;

        v75 = objc_alloc((Class)NSUUID);
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKey:", CFSTR("KappaCompanionUUID")));
        v78 = (NSUUID *)objc_msgSend(v75, "initWithUUIDString:", v77);
        companionTriggerUUID = v48->_companionTriggerUUID;
        v48->_companionTriggerUUID = v78;

        -[CSSafetySOSStateMachineClientProtocol didInitWithUnprocessedCrash:withCompanionUUID:](self->_client, "didInitWithUnprocessedCrash:withCompanionUUID:", v48->_localTriggerUUID, v48->_companionTriggerUUID);
      }
    }

  }
  else
  {
    v48->_sendUnprocessedCrash = 0;
  }
  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v82 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    sendUnprocessedCrash = v48->_sendUnprocessedCrash;
    v85 = v48->_companionTriggerUUID;
    v84 = v48->_localDecisionTimestamp;
    v86 = v48->_localTriggerUUID;
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v114 = v54;
    *(_WORD *)&v114[4] = 1024;
    *(_DWORD *)&v114[6] = v95;
    LOWORD(v115) = 1024;
    *(_DWORD *)((char *)&v115 + 2) = sendUnprocessedCrash;
    HIWORD(v115) = 2112;
    v116 = v86;
    v117 = 2048;
    v118 = v84;
    v119 = 2112;
    v120 = v85;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "activeKappaDecision:%d, waitingForSOSAck:%d, _sendUnprocessedCrash:%d, localUUID:%@, localDecisionTimestamp:%f, companionUUID:%@", buf, 0x32u);
  }
  v87 = [CSHSMObjc alloc];
  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v88 = (id)qword_100387458;
  if (v48->_sendUnprocessedCrash)
    v89 = p_notifyingCompanionState;
  else
    v89 = p_idleState;
  v90 = -[CSHSMObjc initWithCategory:state:](v87, "initWithCategory:state:", v88, *v89);
  hsm = v48->_hsm;
  v48->_hsm = v90;

  v92 = v48;
  objc_destroyWeak(&location);

  return v92;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SOSKappaManager sharedInstance](SOSKappaManager, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSSafetySOSStateMachine;
  -[CSSafetySOSStateMachine dealloc](&v4, "dealloc");
}

- (void)startTimer:(double)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v5 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "startTimer", v6, 2u);
  }
  -[CLTimer setNextFireDelay:interval:](self->_timer, "setNextFireDelay:interval:", a3, 1.79769313e308);
}

- (void)stopTimer
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v3 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "stopTimer", v4, 2u);
  }
  -[CLTimer setNextFireDelay:interval:](self->_timer, "setNextFireDelay:interval:", 1.79769313e308, 1.79769313e308);
}

- (void)updateLocalUUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSUUID *localTriggerUUID;
  id v10;
  void *v11;
  NSUUID *v12;
  NSUUID *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double localDecisionTimestamp;
  NSUserDefaults *defaults;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  NSUUID *v25;

  v4 = a3;
  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v5 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    v22 = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "updateLocalUUID with %@", (uint8_t *)&v22, 0xCu);
  }
  if (self->_localTriggerUUID)
  {
    if (qword_100387450 != -1)
      dispatch_once(&qword_100387450, &stru_100361F80);
    v6 = qword_100387458;
    if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Overwriting previous UUID", (uint8_t *)&v22, 2u);
    }
  }
  if (!v4)
  {
    if (qword_100387450 != -1)
      dispatch_once(&qword_100387450, &stru_100361F80);
    v7 = qword_100387458;
    if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "UUID is nil in updateLocalUUID", (uint8_t *)&v22, 2u);
    }
  }
  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v8 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    localTriggerUUID = self->_localTriggerUUID;
    v22 = 138412546;
    v23 = v4;
    v24 = 2112;
    v25 = localTriggerUUID;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "UUID new: %@ prev: %@", (uint8_t *)&v22, 0x16u);
  }
  v10 = objc_alloc((Class)NSUUID);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v12 = (NSUUID *)objc_msgSend(v10, "initWithUUIDString:", v11);
  v13 = self->_localTriggerUUID;
  self->_localTriggerUUID = v12;

  self->_localDecisionTimestamp = CFAbsoluteTimeGetCurrent();
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("KappaExpirationPeriod")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  objc_msgSend(v16, "doubleForKey:", CFSTR("KappaExpirationPeriod"));
  v18 = v17;

  localDecisionTimestamp = self->_localDecisionTimestamp;
  if (!v15)
    v18 = 3600.0;
  defaults = self->_defaults;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_localTriggerUUID, "UUIDString"));
  -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v21, CFSTR("KappaLocalUUID"));

  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("KappaLocalTimestamp"), self->_localDecisionTimestamp);
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("KappaExpirationTimestamp"), v18 + localDecisionTimestamp);

}

- (void)updateCompanionUUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSUUID *companionTriggerUUID;
  id v10;
  void *v11;
  NSUUID *v12;
  NSUUID *v13;
  NSUUID **p_companionTriggerUUID;
  NSUserDefaults *defaults;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  NSUUID *v20;

  v4 = a3;
  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v5 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "updateCompanionUUID with %@", (uint8_t *)&v17, 0xCu);
  }
  if (self->_companionTriggerUUID)
  {
    if (qword_100387450 != -1)
      dispatch_once(&qword_100387450, &stru_100361F80);
    v6 = qword_100387458;
    if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Overwriting previous companion UUID", (uint8_t *)&v17, 2u);
    }
  }
  if (!v4)
  {
    if (qword_100387450 != -1)
      dispatch_once(&qword_100387450, &stru_100361F80);
    v7 = qword_100387458;
    if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Companion UUID is nil in updateCompanionUUID", (uint8_t *)&v17, 2u);
    }
  }
  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v8 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    companionTriggerUUID = self->_companionTriggerUUID;
    v17 = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = companionTriggerUUID;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CompanionUUID new: %@ prev: %@", (uint8_t *)&v17, 0x16u);
  }
  v10 = objc_alloc((Class)NSUUID);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v12 = (NSUUID *)objc_msgSend(v10, "initWithUUIDString:", v11);
  p_companionTriggerUUID = &self->_companionTriggerUUID;
  v13 = self->_companionTriggerUUID;
  self->_companionTriggerUUID = v12;

  defaults = self->_defaults;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](*p_companionTriggerUUID, "UUIDString"));
  -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v16, CFSTR("KappaCompanionUUID"));

}

- (void)notifySOSDaemon
{
  NSUserDefaults **p_defaults;
  void *v4;
  double v5;
  void *v6;
  _Unwind_Exception *v7;
  _QWORD v8[5];
  id v9;
  id location;

  p_defaults = &self->_defaults;
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1, CFSTR("WaitingForSOSAck"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](*p_defaults, "objectForKey:", CFSTR("SimulateCrashProbability")));

  if (v4)
  {
    -[NSUserDefaults doubleForKey:](*p_defaults, "doubleForKey:", CFSTR("SimulateCrashProbability"));
    if (drand48() < v5)
    {
      v7 = (_Unwind_Exception *)sub_100275364((id *)p_defaults);
      objc_destroyWeak((id *)v4);

      objc_destroyWeak(&location);
      _Unwind_Resume(v7);
    }
  }
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SOSKappaManager sharedInstance](SOSKappaManager, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002745E4;
  v8[3] = &unk_100361F60;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v6, "triggerKappaWithCompletion:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)notifyCompanionOfSafetyEventType:(int)a3
{
  NSObject *v4;
  id v6;
  void *v7;
  int v8[2];

  if ((a3 - 3) > 0xFFFFFFFD)
  {
    v8[0] = a3;
    v6 = sub_100018158(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CSCompanionServiceProtocol sendData:type:](self->_companion, "sendData:type:", v7, 400);

  }
  else
  {
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_100361FA0);
    v4 = qword_100387388;
    if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_FAULT))
    {
      v8[0] = 67109120;
      v8[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "invalid mode %d", (uint8_t *)v8, 8u);
    }
  }
}

- (BOOL)notifySOStoAOP
{
  unsigned __int8 v3;

  v3 = 6;
  CSAOPSvc::sendCommand((CSAOPSvc *)self->_aopSvc, &v3, 1u);
  return 1;
}

- (void)feedCompanionDetected
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v3 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "feedCompanionDetected", v4, 2u);
  }
  -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 4, 0);
}

- (void)feedDetectionDecision:(BOOL)a3 uuid:(id)a4 forMode:(unsigned __int8)a5
{
  int v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  unsigned __int8 mode;
  NSObject *v11;
  NSUserDefaults *defaults;
  void *v13;
  void *v14;
  void *v15;
  CSHSMObjc *hsm;
  uint64_t v17;
  _QWORD v18[2];

  v5 = a5;
  v6 = a3;
  v8 = a4;
  if (self->_mode != v5)
  {
    if (qword_100387450 != -1)
      dispatch_once(&qword_100387450, &stru_100361F80);
    v9 = qword_100387458;
    if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_FAULT))
    {
      mode = self->_mode;
      LODWORD(v17) = 16777728;
      BYTE4(v17) = mode;
      *(_WORD *)((char *)&v17 + 5) = 256;
      HIBYTE(v17) = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "SOS mode switch detected %hhu -> %hhu", (uint8_t *)&v17, 8u);
    }
    self->_mode = v5;
  }
  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v11 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v17) = 67109378;
    HIDWORD(v17) = v6;
    LOWORD(v18[0]) = 2112;
    *(_QWORD *)((char *)v18 + 2) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "feedDetectionDecision: decision: %d uuid: %@", (uint8_t *)&v17, 0x12u);
  }
  v17 = 0;
  v18[0] = 0;
  objc_msgSend(v8, "getUUIDBytes:", &v17);
  defaults = self->_defaults;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SOSKappaManager currentSOSStatus](SOSKappaManager, "currentSOSStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
  -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v15, CFSTR("KappaSOSUUID"));

  hsm = self->_hsm;
  if (v6)
    -[CSHSMObjc signal:data:](hsm, "signal:data:", 2, &v17);
  else
    -[CSHSMObjc signal:data:](hsm, "signal:data:", 3, 0);

}

- (void)feedPotentialEventWithTimestamp:(unint64_t)a3 forMode:(unsigned __int8)a4
{
  -[CSSafetySOSStateMachine feedPotentialEventWithTimestamp:forMode:martyIsBicycle:](self, "feedPotentialEventWithTimestamp:forMode:martyIsBicycle:", a3, a4, 0);
}

- (void)feedPotentialEventWithTimestamp:(unint64_t)a3 forMode:(unsigned __int8)a4 martyIsBicycle:(BOOL)a5
{
  NSObject *v9;
  int v10;
  unint64_t v11;

  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v9 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "feedPotentialEventWithTimestamp: timestamp %llu", (uint8_t *)&v10, 0xCu);
  }
  self->_mode = a4;
  self->_martyIsBicycle = a5;
  -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 1, 0);
}

- (void)resetAllPersistedValues
{
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("KappaLocalUUID"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("KappaLocalTimestamp"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("KappaExpirationTimestamp"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("KappaExpirationPeriod"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("KappaCompanionUUID"));
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 0, CFSTR("ActiveKappaDecision"));
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 0, CFSTR("WaitingForSOSAck"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("KappaSOSUUID"));
}

- (void)clearAll
{
  NSObject *v3;
  SOSKappaStatus *sosStatus;
  NSUUID *localTriggerUUID;
  NSUUID *companionTriggerUUID;
  uint8_t v7[16];

  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v3 = qword_100387458;
  if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "clearAll", v7, 2u);
  }
  sosStatus = self->_sosStatus;
  self->_sosStatus = 0;

  localTriggerUUID = self->_localTriggerUUID;
  self->_localTriggerUUID = 0;

  companionTriggerUUID = self->_companionTriggerUUID;
  self->_companionTriggerUUID = 0;
  self->_localDecisionTimestamp = 0.0;

  self->_localShouldSend = 0;
  self->_sendUnprocessedCrash = 0;
  -[CSSafetySOSStateMachine resetAllPersistedValues](self, "resetAllPersistedValues");
  -[CSSafetySOSStateMachine stopTimer](self, "stopTimer");
}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  void *v7;
  unsigned int v8;
  id v9;
  id v10;

  v10 = a4;
  if ((a3 - 305) < 2 || a3 == 6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
    v8 = objc_msgSend(v7, "firstOrThirdPartyEnabled");

    if (v8)
    {
      v9 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v10), "bytes"));
      -[CSSafetySOSStateMachine updateCompanionUUID:](self, "updateCompanionUUID:", v9);

      -[CSSafetySOSStateMachine feedCompanionDetected](self, "feedCompanionDetected");
    }
  }

}

- (void)updatedSOSKappaStatus:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  unsigned int v16;

  v5 = a3;
  if (qword_100387450 != -1)
    dispatch_once(&qword_100387450, &stru_100361F80);
  v6 = (id)qword_100387458;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sosStatus"));
    v11 = 134218496;
    v12 = objc_msgSend(v7, "flowState");
    v13 = 1024;
    v14 = objc_msgSend(v5, "isKappaFlow");
    v15 = 1024;
    v16 = objc_msgSend(v5, "isKappaFlowActive");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "updatedSOSSafetyStatus state:%ld, isKappaFlow:%d, isKappaFlowActive:%d", (uint8_t *)&v11, 0x18u);

  }
  if ((objc_msgSend(v5, "isKappaFlow") & 1) != 0)
  {
    objc_storeStrong((id *)&self->_sosStatus, a3);
    if (objc_msgSend(v5, "isKappaFlowActive"))
      v8 = 7;
    else
      v8 = 8;
    -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", v8, 0);
    if (objc_msgSend(v5, "sosKappaState") == (id)1)
    {
      if (qword_100387450 != -1)
        dispatch_once(&qword_100387450, &stru_100361F80);
      v9 = qword_100387458;
      if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "updatedSOSSafetyStatus received alert and notifying AOP", (uint8_t *)&v11, 2u);
      }
      -[CSSafetySOSStateMachine notifySOStoAOP](self, "notifySOStoAOP");
    }
  }
  else
  {
    if (qword_100387450 != -1)
      dispatch_once(&qword_100387450, &stru_100361F80);
    v10 = qword_100387458;
    if (os_log_type_enabled((os_log_t)qword_100387458, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Received non-Kappa flow state, ignoring", (uint8_t *)&v11, 2u);
    }
  }

}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttr, 0);
  objc_storeStrong((id *)&self->_sosStatus, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_companionTriggerUUID, 0);
  objc_storeStrong((id *)&self->_localTriggerUUID, 0);
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong(&self->_crashProcessingState, 0);
  objc_storeStrong(&self->_notifyingCompanionState, 0);
  objc_storeStrong(&self->_crashStagingState, 0);
  objc_storeStrong(&self->_potentialCrashState, 0);
  objc_storeStrong(&self->_idleState, 0);
  objc_storeStrong((id *)&self->_hsm, 0);
  objc_storeStrong((id *)&self->_vendor, 0);
}

@end
