@implementation CSKappaCoreAnalytics

- (void)uploadUserInfoWithHandler:(id)a3
{
  void (**v4)(id, BOOL, NSDictionary *);
  _BOOL4 isSessionActive;
  NSDictionary *cachedUploadedResults;
  NSObject *dispatchQueue;
  void (**v8)(id, BOOL, NSDictionary *);
  _QWORD v9[4];
  void (**v10)(id, BOOL, NSDictionary *);
  id v11;
  _QWORD v12[4];
  void (**v13)(id, BOOL, NSDictionary *);
  id v14;
  id location;
  _QWORD block[5];

  v4 = (void (**)(id, BOOL, NSDictionary *))a3;
  +[CSCoreAnalyticsUtils getSecondsSinceReboot](CSCoreAnalyticsUtils, "getSecondsSinceReboot");
  isSessionActive = self->_isSessionActive;
  if (self->_isSessionActive)
  {
    if (v4)
    {
      cachedUploadedResults = 0;
LABEL_8:
      v4[2](v4, !isSessionActive, cachedUploadedResults);
    }
  }
  else if (+[CSCoreAnalyticsUtils shouldAttemptCoreAnalyticsUploadWithInterval:persistentKey:](CSCoreAnalyticsUtils, "shouldAttemptCoreAnalyticsUploadWithInterval:persistentKey:", CFSTR("CSKappaCoreAnalyticsLastSuccessfulUpload"), (double)self->_userInfoCadence))
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D438;
    block[3] = &unk_10034B158;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002D514;
    v12[3] = &unk_10034B1A8;
    objc_copyWeak(&v14, &location);
    v8 = v4;
    v13 = v8;
    -[CLTimer setHandler:](self->_queryCompanionTimer, "setHandler:", v12);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002D7D4;
    v9[3] = &unk_10034B1F8;
    objc_copyWeak(&v11, &location);
    v10 = v8;
    -[CSKappaCoreAnalytics queryCompanion:completion:](self, "queryCompanion:completion:", 1, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    cachedUploadedResults = self->_cachedUploadedResults;
    goto LABEL_8;
  }

}

- (CSKappaCoreAnalytics)initWithSilo:(id)a3 vendor:(id)a4 aopService:(void *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *dispatchQueue;
  NSUserDefaults *v13;
  NSUserDefaults *defaults;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *queryCompletions;
  CSCompanionServiceProtocol *v19;
  CSCompanionServiceProtocol *companion;
  void *v21;
  void *v22;
  NSObject *v23;
  CLTimer *v24;
  CLTimer *queryCompanionTimer;
  void *v26;
  uint8_t v28[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v10 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "initWithSilo", buf, 2u);
  }
  self->_valid = 1;
  objc_storeStrong((id *)&self->_vendor, a4);
  self->_aopSvc = a5;
  v11 = (OS_dispatch_queue *)dispatch_queue_create("CSKappaCoreAnalyticsDispatchQueue", 0);
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v11;

  v13 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  defaults = self->_defaults;
  self->_defaults = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v15, v16, 0));
  queryCompletions = self->_queryCompletions;
  self->_queryCompletions = v17;

  v19 = (CSCompanionServiceProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "proxyForService:", CFSTR("CSCompanionService")));
  companion = self->_companion;
  self->_companion = v19;

  -[CSCompanionServiceProtocol registerDelegate:inSilo:](self->_companion, "registerDelegate:inSilo:", self, v8);
  -[CSCompanionServiceProtocol registerClient:](self->_companion, "registerClient:", self);
  self->_isSessionActive = 0;
  -[CSKappaCoreAnalytics clearUserInfo](self, "clearUserInfo");
  -[CSKappaCoreAnalytics clearSessionInfo](self, "clearSessionInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("CSKappaCoreAnalyticsDailyInfo")));

  if (!v22)
  {
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_10034B268);
    v23 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "First time tracking daily aggregates", v28, 2u);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &self->_kappaUserInfo, 84));
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:");
  }
  v24 = (CLTimer *)objc_msgSend(v8, "newTimer");
  queryCompanionTimer = self->_queryCompanionTimer;
  self->_queryCompanionTimer = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  self->_userInfoCadence = (int)objc_msgSend(v26, "integerForKey:", CFSTR("CoreAnalyticsUserInfoCadence"));

  if (!self->_userInfoCadence)
    self->_userInfoCadence = 86400;

  return self;
}

- (void)startTimer:(double)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v5 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "startTimer", v6, 2u);
  }
  -[CLTimer setNextFireDelay:interval:](self->_queryCompanionTimer, "setNextFireDelay:interval:", a3, 1.79769313e308);
}

- (void)stopTimer
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v3 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "stopTimer", v4, 2u);
  }
  -[CLTimer setNextFireDelay:interval:](self->_queryCompanionTimer, "setNextFireDelay:interval:", 1.79769313e308, 1.79769313e308);
}

- (void)clearUserInfo
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v3 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "clearUserInfo", v4, 2u);
  }
  *(_QWORD *)&self->_kappaUserInfo.isCompanionPaired = 0;
  self->_kappaUserInfo.userAgeBin = -1;
  *(_OWORD *)&self->_kappaUserInfo.firstPartyEnabled = 0u;
  *(_OWORD *)&self->_kappaUserInfo.numKappaEvents = 0u;
  *(_OWORD *)&self->_kappaUserInfo.numUISurfaced = 0u;
  *(_OWORD *)&self->_kappaUserInfo.numUserRequestedSOS = 0u;
  *(_QWORD *)&self->_kappaUserInfo.numPlacedCalls = 0;
}

- (id)sendUserInfoToCoreAnalytics
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  unint64_t userInfoCadence;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  unint64_t v44;
  __int16 v45;
  unsigned int v46;
  _QWORD v47[8];
  _QWORD v48[8];
  _QWORD v49[27];
  _QWORD v50[27];

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v3 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sendUserInfoToCoreAnalytics", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
  v40 = objc_msgSend(v4, "isAuthorizedForIS");

  +[CSCoreAnalyticsUtils getSecondsSinceReboot](CSCoreAnalyticsUtils, "getSecondsSinceReboot");
  v6 = v5;
  if (v5 > (double)self->_userInfoCadence)
  {
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_10034B268);
    v7 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
    {
      userInfoCadence = self->_userInfoCadence;
      *(_DWORD *)buf = 134217984;
      v44 = userInfoCadence;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "secondsSinceReboot exceeds UserInfo cadence. Capping at cadence pd:%llu", buf, 0xCu);
    }
    v6 = (double)self->_userInfoCadence;
  }
  if (v40)
  {
    v49[0] = CFSTR("didEnableKappaDetection");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.didEnableKappaDetection));
    v50[0] = v9;
    v49[1] = CFSTR("didEnableKappaDetection_companion");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.didEnableKappaDetection_companion));
    v50[1] = v39;
    v49[2] = CFSTR("isImproveSafetyEnabled");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.isImproveSafetyEnabled));
    v50[2] = v38;
    v49[3] = CFSTR("isImproveSafetyEnabled_companion");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.isImproveSafetyEnabled_companion));
    v50[3] = v37;
    v49[4] = CFSTR("userAgeBin");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.userAgeBin));
    v50[4] = v36;
    v49[5] = CFSTR("firstPartyEnabled");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.firstPartyEnabled));
    v50[5] = v35;
    v49[6] = CFSTR("thirdPartyEnabled");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.thirdPartyEnabled));
    v50[6] = v34;
    v49[7] = CFSTR("firstPartyEnabled_companion");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.firstPartyEnabled_companion));
    v50[7] = v33;
    v49[8] = CFSTR("thirdPartyEnabled_companion");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.thirdPartyEnabled_companion));
    v50[8] = v32;
    v49[9] = CFSTR("totalDrivingTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.totalDrivingTime));
    v50[9] = v31;
    v49[10] = CFSTR("numKappaSessions");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numKappaSessions));
    v50[10] = v30;
    v49[11] = CFSTR("numKappaEvents");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numKappaEvents));
    v50[11] = v29;
    v49[12] = CFSTR("numTriggersAllSessions");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numTriggersAllSessions));
    v50[12] = v28;
    v49[13] = CFSTR("numUISurfaced");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numUISurfaced));
    v50[13] = v27;
    v49[14] = CFSTR("numCancelledUI");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numCancelledUI));
    v50[14] = v26;
    v49[15] = CFSTR("numUserRequestedSOS");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numUserRequestedSOS));
    v50[15] = v25;
    v49[16] = CFSTR("numAutoRequestedSOS");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numAutoRequestedSOS));
    v50[16] = v24;
    v49[17] = CFSTR("numPlacedCalls");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numPlacedCalls));
    v50[17] = v23;
    v49[18] = CFSTR("numKappaSessions_companion");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numKappaSessions_companion));
    v50[18] = v22;
    v49[19] = CFSTR("numKappaEvents_companion");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numKappaEvents_companion));
    v50[19] = v21;
    v49[20] = CFSTR("numTriggersAllSessions_companion");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numTriggersAllSessions_companion));
    v50[20] = v10;
    v49[21] = CFSTR("numUISurfaced_companion");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numUISurfaced_companion));
    v50[21] = v11;
    v49[22] = CFSTR("numCancelledUI_companion");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numCancelledUI_companion));
    v50[22] = v12;
    v49[23] = CFSTR("numUserRequestedSOS_companion");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numUserRequestedSOS_companion));
    v50[23] = v13;
    v49[24] = CFSTR("numAutoRequestedSOS_companion");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numAutoRequestedSOS_companion));
    v50[24] = v14;
    v49[25] = CFSTR("numPlacedCalls_companion");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaUserInfo.numPlacedCalls_companion));
    v50[25] = v15;
    v49[26] = CFSTR("minutesSinceReboot_capped");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6 / 60.0));
    v50[26] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 27));

  }
  else
  {
    v47[0] = CFSTR("didEnableKappaDetection");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.didEnableKappaDetection));
    v48[0] = v9;
    v47[1] = CFSTR("didEnableKappaDetection_companion");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.didEnableKappaDetection_companion));
    v48[1] = v39;
    v47[2] = CFSTR("isImproveSafetyEnabled");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.isImproveSafetyEnabled));
    v48[2] = v38;
    v47[3] = CFSTR("isImproveSafetyEnabled_companion");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.isImproveSafetyEnabled_companion));
    v48[3] = v37;
    v47[4] = CFSTR("firstPartyEnabled");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.firstPartyEnabled));
    v48[4] = v36;
    v47[5] = CFSTR("thirdPartyEnabled");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.thirdPartyEnabled));
    v48[5] = v35;
    v47[6] = CFSTR("firstPartyEnabled_companion");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.firstPartyEnabled_companion));
    v48[6] = v34;
    v47[7] = CFSTR("thirdPartyEnabled_companion");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaUserInfo.thirdPartyEnabled_companion));
    v48[7] = v33;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 8));
  }

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v18 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v44 = (unint64_t)v17;
    v45 = 1024;
    v46 = v40;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "UserInfo:%@, ImproveSafety:%d", buf, 0x12u);
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10002EAF0;
  v41[3] = &unk_10034B220;
  v19 = v17;
  v42 = v19;
  AnalyticsSendEventLazy(CFSTR("com.apple.KappaUserInfo"), v41);
  objc_storeStrong((id *)&self->_cachedUploadedResults, v17);

  return v19;
}

- (void)clearSessionInfo
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v3 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "clearSessionInfo", v4, 2u);
  }
  self->_isSessionActive = 0;
  *(_QWORD *)&self->_kappaSessionInfo.detectionDecision = 0;
  self->_kappaSessionInfo.drivingTimeStartToFirstTrigger = 0;
  self->_kappaSessionInfo.sessionStartTimestamp = -1.0;
  *(_QWORD *)&self->_kappaSessionInfo.sessionDuration = 0;
  *(_QWORD *)&self->_kappaSessionInfo.numTriggers = 0;
  *(_QWORD *)&self->_kappaSessionInfo.numRolloverCrashes = 0;
  self->_kappaSessionInfo.numDeescalations = 0;
  *(int32x2_t *)&self->_kappaSessionInfo.coarseLat = vdup_n_s32(0x447A0000u);
  self->_kappaSessionInfo.sunElevation = 1000.0;
  *(_QWORD *)&self->_kappaSessionInfo.signalEnvironment = 1000;
  *(_QWORD *)&self->_kappaSessionInfo.maxDeltaVXYOverEpoch = 0xBF80000000000000;
  *(_QWORD *)&self->_kappaSessionInfo.didRaiseUI = 0;
  *(_QWORD *)&self->_kappaSessionInfo.isSOSResponseSuccessPushedToCompanion = 0;
}

- (void)processSessionDetails:(KappaSessionDetails *)a3
{
  NSObject *v5;
  int signalEnvironment;
  uint64_t v7;
  uint8_t v8[16];

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v5 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "processSessionDetails", v8, 2u);
  }
  self->_kappaSessionInfo.trigger_bitmap = a3->trigger_bitmap;
  signalEnvironment = a3->signalEnvironment;
  self->_kappaSessionInfo.gpsDuration = a3->gpsCount;
  self->_kappaSessionInfo.serverConfigVersion = a3->serverConfigVersion;
  self->_kappaSessionInfo.signalEnvironment = signalEnvironment;
  *(_OWORD *)&self->_kappaSessionInfo.numPlanarCrashes = *(_OWORD *)&a3->numPlanarCrashes;
  v7 = *(_QWORD *)&a3->maxDeltaVXYBiggestImpact;
  *(_QWORD *)&self->_kappaSessionInfo.coarseLat = *(_QWORD *)&a3->coarseLat;
  self->_kappaSessionInfo.sunElevation = a3->sunElevation;
  *(_QWORD *)&self->_kappaSessionInfo.maxDeltaVXYBiggestImpact = v7;
}

- (void)sendLocalKappaSessionInfoToCompanion
{
  _BOOL4 didEnableKappaDetection;
  _BOOL4 isImproveSafetyEnabled;
  _BOOL4 firstPartyEnabled;
  _BOOL4 thirdPartyEnabled;
  _BOOL4 detectionDecision;
  int numTriggers;
  NSObject *v9;
  CSCompanionServiceProtocol *companion;
  void *v11;
  _BYTE v12[4];
  _BOOL4 v13;
  int v14;
  uint8_t buf[4];
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  int v26;

  -[CSKappaCoreAnalytics updateUserInfoSettings](self, "updateUserInfoSettings");
  didEnableKappaDetection = self->_kappaUserInfo.didEnableKappaDetection;
  v12[0] = self->_kappaUserInfo.didEnableKappaDetection;
  isImproveSafetyEnabled = self->_kappaUserInfo.isImproveSafetyEnabled;
  v12[1] = self->_kappaUserInfo.isImproveSafetyEnabled;
  firstPartyEnabled = self->_kappaUserInfo.firstPartyEnabled;
  v12[2] = self->_kappaUserInfo.firstPartyEnabled;
  thirdPartyEnabled = self->_kappaUserInfo.thirdPartyEnabled;
  v12[3] = self->_kappaUserInfo.thirdPartyEnabled;
  detectionDecision = self->_kappaSessionInfo.detectionDecision;
  numTriggers = self->_kappaSessionInfo.numTriggers;
  v14 = numTriggers;
  v13 = detectionDecision;
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v9 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110400;
    v16 = didEnableKappaDetection;
    v17 = 1024;
    v18 = isImproveSafetyEnabled;
    v19 = 1024;
    v20 = firstPartyEnabled;
    v21 = 1024;
    v22 = thirdPartyEnabled;
    v23 = 1024;
    v24 = detectionDecision;
    v25 = 1024;
    v26 = numTriggers;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "sendLocalKappaSessionInfoToCompanion %d %d %d %d %d %d", buf, 0x26u);
  }
  companion = self->_companion;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v12, 12));
  -[CSCompanionServiceProtocol sendData:type:](companion, "sendData:type:", v11, 8);

}

- (void)queryCompanion:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSMutableArray *queryCompletions;
  id v9;
  _DWORD v10[2];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v7 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "queryCompanion type:%d", (uint8_t *)v10, 8u);
  }
  queryCompletions = self->_queryCompletions;
  v9 = objc_retainBlock(v6);
  -[NSMutableArray replaceObjectAtIndex:withObject:](queryCompletions, "replaceObjectAtIndex:withObject:", v4, v9);

  -[CSCompanionServiceProtocol queryCompanion:](self->_companion, "queryCompanion:", v4);
  -[CSKappaCoreAnalytics startTimer:](self, "startTimer:", 5.0);

}

- (void)sendSessionInfoToCoreAnalytics
{
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[4];
  id v48;
  _QWORD v49[29];
  _QWORD v50[29];

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v3 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sendSessionInfoToCoreAnalytics", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
  v5 = objc_msgSend(v4, "isAuthorizedForIS");

  if ((v5 & 1) != 0)
  {
    v49[0] = CFSTR("detectionDecision");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.detectionDecision));
    v50[0] = v44;
    v49[1] = CFSTR("isCompanionConnected");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.isCompanionConnected));
    v50[1] = v42;
    v49[2] = CFSTR("didCompanionTrigger");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.didCompanionTrigger));
    v50[2] = v41;
    v49[3] = CFSTR("companionDetectionDecision");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.companionDetectionDecision));
    v50[3] = v40;
    v49[4] = CFSTR("trigger_bitmap");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.trigger_bitmap));
    v50[4] = v39;
    v49[5] = CFSTR("drivingTimeStartToFirstTrigger");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.drivingTimeStartToFirstTrigger));
    v50[5] = v38;
    v49[6] = CFSTR("sessionDuration");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.sessionDuration));
    v50[6] = v37;
    v49[7] = CFSTR("gpsDuration");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.gpsDuration));
    v50[7] = v36;
    v49[8] = CFSTR("numTriggers");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.numTriggers));
    v50[8] = v35;
    v49[9] = CFSTR("numPlanarCrashes");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.numPlanarCrashes));
    v50[9] = v34;
    v49[10] = CFSTR("numRolloverCrashes");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.numRolloverCrashes));
    v50[10] = v33;
    v49[11] = CFSTR("numHighSpeedCrashes");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.numHighSpeedCrashes));
    v50[11] = v32;
    v49[12] = CFSTR("numDeescalations");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.numDeescalations));
    v50[12] = v31;
    v49[13] = CFSTR("maxDeltaVXYBiggestImpact");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.maxDeltaVXYBiggestImpact));
    v50[13] = v30;
    v49[14] = CFSTR("maxDeltaVXYOverEpoch");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kappaSessionInfo.maxDeltaVXYOverEpoch));
    v50[14] = v29;
    v49[15] = CFSTR("serverConfigVersion");
    *(float *)&v6 = self->_kappaSessionInfo.serverConfigVersion;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
    v50[15] = v28;
    v49[16] = CFSTR("didRaiseUI");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.didRaiseUI));
    v50[16] = v27;
    v49[17] = CFSTR("didRaiseUI_companion");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.didRaiseUI_companion));
    v50[17] = v26;
    v49[18] = CFSTR("didCancelUI");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.didCancelUI));
    v50[18] = v25;
    v49[19] = CFSTR("didCancelUI_companion");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.didCancelUI_companion));
    v50[19] = v24;
    v49[20] = CFSTR("isSOSResponseSuccess");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.isSOSResponseSuccess));
    v50[20] = v23;
    v49[21] = CFSTR("isSOSResponseSuccessPushedToCompanion");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.isSOSResponseSuccessPushedToCompanion));
    v50[21] = v7;
    v49[22] = CFSTR("isSOSResponseAlreadyActive");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.isSOSResponseAlreadyActive));
    v50[22] = v8;
    v49[23] = CFSTR("isSOSResponseFailed");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.isSOSResponseFailed));
    v50[23] = v9;
    v49[24] = CFSTR("isSOSResponseNotSupported");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.isSOSResponseNotSupported));
    v50[24] = v10;
    v49[25] = CFSTR("isSOSResponseNotEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.isSOSResponseNotEnabled));
    v50[25] = v11;
    v49[26] = CFSTR("isSOSUserInitiated");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.isSOSUserInitiated));
    v50[26] = v12;
    v49[27] = CFSTR("isSOSAutoInitiated");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.isSOSAutoInitiated));
    v50[27] = v13;
    v49[28] = CFSTR("didPlaceCall");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_kappaSessionInfo.didPlaceCall));
    v50[28] = v14;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 29));

    v15 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v15, "setDictionary:", v43);
    if (self->_kappaSessionInfo.coarseLat != 1000.0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("coarseLat"));

    }
    if (self->_kappaSessionInfo.coarseLong != 1000.0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("coarseLong"));

    }
    if (self->_kappaSessionInfo.sunElevation != 1000.0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("sunElevation"));

    }
    if (self->_kappaSessionInfo.signalEnvironment != 1000)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("signalEnvironment"));

    }
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_10034B268);
    v20 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "SessionInfo:%@", buf, 0xCu);
    }
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10002F9C4;
    v45[3] = &unk_10034B248;
    v21 = v15;
    v46 = v21;
    AnalyticsSendEventLazy(CFSTR("com.apple.KappaSession"), v45);

  }
  else
  {
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_10034B268);
    v22 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Not authorized to collect data, discarding session info", buf, 2u);
    }
  }
}

- (void)updatePersistedUserInfo
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FA24;
  block[3] = &unk_10034B158;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)updateUserInfoSettings
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v3 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "updateUserInfoSettings", (uint8_t *)&v7, 2u);
  }
  self->_kappaUserInfo.didEnableKappaDetection = +[SOSKappaManager isKappaEnabled](SOSKappaManager, "isKappaEnabled");
  self->_kappaUserInfo.firstPartyEnabled = +[SOSUtilities kappaTriggersEmergencySOS](SOSUtilities, "kappaTriggersEmergencySOS");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SOSUtilities getKappaThirdPartyDisplayNameForApp](SOSUtilities, "getKappaThirdPartyDisplayNameForApp"));
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v5 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "appName %@", (uint8_t *)&v7, 0xCu);
  }
  self->_kappaUserInfo.thirdPartyEnabled = v4 != 0;
  self->_kappaUserInfo.didEnableKappaDetection |= v4 != 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
  self->_kappaUserInfo.isImproveSafetyEnabled = objc_msgSend(v6, "isAuthorizedForIS");

  self->_kappaUserInfo.isCompanionPaired = -[CSCompanionServiceProtocol syncget_isCompanionPaired](self->_companion, "syncget_isCompanionPaired");
}

- (void)updateUserStats
{
  NSObject *v3;
  CSCAStat *v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  int userAgeBin;
  int totalDrivingTime;
  __int128 v12;
  int v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  int v17;

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v3 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "updateUserStats", buf, 2u);
  }
  v4 = objc_alloc_init(CSCAStat);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  v6 = objc_msgSend(v5, "isKappaLoggingDevice");

  if ((v6 & 1) != 0)
  {
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_10034B268);
    v7 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "getStat not supported", buf, 2u);
    }
    v8 = -1;
    self->_kappaUserInfo.userAgeBin = -1;
  }
  else
  {
    CSAOPSvc::getStat((CSAOPSvc *)self->_aopSvc, v4);
    v13 = 1112014848;
    v12 = xmmword_1002E5D38;
    self->_kappaUserInfo.userAgeBin = +[CSKappaCoreAnalytics binValueForAge:bins:](CSKappaCoreAnalytics, "binValueForAge:bins:", -[CSCAStat userAge](v4, "userAge"), &v12);
    v8 = -[CSCAStat armedSec](v4, "armedSec");
  }
  self->_kappaUserInfo.totalDrivingTime = v8;
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v9 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    userAgeBin = self->_kappaUserInfo.userAgeBin;
    totalDrivingTime = self->_kappaUserInfo.totalDrivingTime;
    *(_DWORD *)buf = 67109376;
    v15 = userAgeBin;
    v16 = 1024;
    v17 = totalDrivingTime;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "age:%d, drivingTime:%d", buf, 0xEu);
  }

}

+ (int)binValueForAge:(char)a3 bins:()array<float
{
  uint64_t i;

  for (i = 0; i != 5; ++i)
  {
    if (a4->var0[i] >= (float)a3)
      break;
  }
  return i;
}

- (void)onKappaSessionUpdate:(int)a3 data:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int sessionDuration;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[9];
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[32];
  __int128 v21;
  __int128 v22;

  v6 = a4;
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v7 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "onKappaSessionUpdate type:%d", buf, 8u);
  }
  switch(a3)
  {
    case 1:
      ++self->_kappaUserInfo.numKappaEvents;
      self->_kappaSessionInfo.detectionDecision = 1;
      break;
    case 2:
      objc_msgSend(v6, "getBytes:length:", buf, 112);
      if ((buf[1] & 0x14) == 0)
      {
        if (self->_kappaSessionInfo.sessionStartTimestamp == -1.0)
        {
          ++self->_kappaUserInfo.numKappaSessions;
          self->_kappaSessionInfo.sessionStartTimestamp = CFAbsoluteTimeGetCurrent();
          self->_isSessionActive = 1;
        }
        ++self->_kappaUserInfo.numTriggersAllSessions;
        ++self->_kappaSessionInfo.numTriggers;
        self->_kappaSessionInfo.drivingTimeStartToFirstTrigger = *(unsigned __int16 *)&buf[2];
      }
      break;
    case 3:
      self->_kappaSessionInfo.sessionDuration = (int)(CFAbsoluteTimeGetCurrent()
                                                    - self->_kappaSessionInfo.sessionStartTimestamp);
      if (qword_1003873C0 != -1)
        dispatch_once(&qword_1003873C0, &stru_10034B268);
      v8 = qword_1003873C8;
      if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
      {
        sessionDuration = self->_kappaSessionInfo.sessionDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = sessionDuration;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onKappaSessionUpdate sessionDuration:%d", buf, 8u);
      }
      break;
    case 4:
      *(_QWORD *)buf = 0;
      objc_msgSend(v6, "getBytes:length:", buf, 8);
      switch(*(_QWORD *)buf)
      {
        case 0:
          self->_kappaSessionInfo.isSOSResponseSuccess = 1;
          break;
        case 1:
          self->_kappaSessionInfo.isSOSResponseNotSupported = 1;
          break;
        case 2:
        case 6:
          self->_kappaSessionInfo.isSOSResponseAlreadyActive = 1;
          break;
        case 3:
          self->_kappaSessionInfo.isSOSResponseFailed = 1;
          break;
        case 4:
          self->_kappaSessionInfo.isSOSResponseNotEnabled = 1;
          break;
        case 5:
          self->_kappaSessionInfo.isSOSResponseSuccessPushedToCompanion = 1;
          break;
        default:
          goto LABEL_42;
      }
      break;
    case 5:
      buf[0] = 0;
      objc_msgSend(v6, "getBytes:length:", buf, 1);
      if (buf[0])
      {
        ++self->_kappaUserInfo.numUISurfaced;
        self->_kappaSessionInfo.didRaiseUI = 1;
      }
      else
      {
        ++self->_kappaUserInfo.numUISurfaced_companion;
        self->_kappaSessionInfo.didRaiseUI_companion = 1;
      }
      break;
    case 6:
      buf[0] = 0;
      objc_msgSend(v6, "getBytes:length:", buf, 1);
      if (buf[0])
      {
        ++self->_kappaUserInfo.numCancelledUI;
        self->_kappaSessionInfo.didCancelUI = 1;
      }
      else
      {
        ++self->_kappaUserInfo.numCancelledUI_companion;
        self->_kappaSessionInfo.didCancelUI_companion = 1;
      }
      break;
    case 7:
      buf[0] = 0;
      objc_msgSend(v6, "getBytes:length:", buf, 1);
      v12 = 76;
      if (!buf[0])
        v12 = 80;
      v13 = 92;
      if (!buf[0])
        v13 = 96;
      ++*(_DWORD *)((char *)&self->super.isa + v12);
      ++*(_DWORD *)((char *)&self->super.isa + v13);
      self->_kappaSessionInfo.isSOSUserInitiated = 1;
      self->_kappaSessionInfo.didPlaceCall = 1;
      break;
    case 8:
      buf[0] = 0;
      objc_msgSend(v6, "getBytes:length:", buf, 1);
      v10 = 84;
      if (!buf[0])
        v10 = 88;
      v11 = 92;
      if (!buf[0])
        v11 = 96;
      ++*(_DWORD *)((char *)&self->super.isa + v10);
      ++*(_DWORD *)((char *)&self->super.isa + v11);
      *(_WORD *)&self->_kappaSessionInfo.isSOSAutoInitiated = 257;
      break;
    case 9:
      if (self->_isSessionActive)
      {
        *(_DWORD *)buf = -1082130432;
        buf[4] = 0;
        v16 = 0uLL;
        *(_QWORD *)&buf[8] = 0;
        *(int32x2_t *)&v17 = vdup_n_s32(0x447A0000u);
        *((_QWORD *)&v17 + 1) = 0x3E8447A0000;
        LODWORD(v21) = 0;
        v18 = 0u;
        v19 = 0u;
        memset(v20, 0, 29);
        v22 = 0uLL;
        *((_QWORD *)&v21 + 1) = 0;
        objc_msgSend(v6, "getBytes:length:", buf, 144);
        v14[6] = *(_OWORD *)&v20[16];
        v14[7] = v21;
        v14[8] = v22;
        v14[2] = v17;
        v14[3] = v18;
        v14[4] = v19;
        v14[5] = *(_OWORD *)v20;
        v14[0] = *(_OWORD *)buf;
        v14[1] = v16;
        -[CSKappaCoreAnalytics processSessionDetails:](self, "processSessionDetails:", v14);
        -[CSKappaCoreAnalytics sendLocalKappaSessionInfoToCompanion](self, "sendLocalKappaSessionInfoToCompanion");
        -[CSKappaCoreAnalytics sendSessionInfoToCoreAnalytics](self, "sendSessionInfoToCoreAnalytics");
      }
      -[CSKappaCoreAnalytics clearSessionInfo](self, "clearSessionInfo");
      -[CSKappaCoreAnalytics updatePersistedUserInfo](self, "updatePersistedUserInfo");
      break;
    case 10:
      self->_kappaSessionInfo.isCompanionConnected = 1;
      break;
    default:
      break;
  }
LABEL_42:

}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v7;
  NSObject *v8;
  NSObject *dispatchQueue;
  NSObject *v10;
  _BOOL4 didEnableKappaDetection;
  _BOOL4 isImproveSafetyEnabled;
  _BOOL4 firstPartyEnabled;
  _BOOL4 thirdPartyEnabled;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  NSMutableArray *queryCompletions;
  void *v23;
  NSObject *v24;
  int v25;
  _QWORD block[4];
  id v27;
  CSKappaCoreAnalytics *v28;
  uint8_t v29[4];
  int v30;
  uint8_t buf[8];
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;

  v7 = a4;
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034B268);
  v8 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onCompanionMessage type:%d", buf, 8u);
  }
  switch(a3)
  {
    case 3:
      objc_msgSend(v7, "getBytes:length:", buf, 40);
      if ((v32 & 0x400) == 0 && vabdd_f64(*(double *)buf, self->_kappaSessionInfo.sessionStartTimestamp) <= 5.0)
        self->_kappaSessionInfo.didCompanionTrigger = 1;
      break;
    case 6:
      if (self->_isSessionActive)
        self->_kappaSessionInfo.companionDetectionDecision = 1;
      break;
    case 8:
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000313D0;
      block[3] = &unk_100347E10;
      v27 = v7;
      v28 = self;
      dispatch_sync(dispatchQueue, block);

      break;
    case 9:
      v25 = 0;
      objc_msgSend(v7, "getBytes:length:", &v25, 4);
      if (qword_1003873C0 != -1)
        dispatch_once(&qword_1003873C0, &stru_10034B268);
      v10 = qword_1003873C8;
      if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "kTypeCompanionQuery queryType:%d", buf, 8u);
      }
      if (v25 == 1)
      {
        -[CSKappaCoreAnalytics updateUserInfoSettings](self, "updateUserInfoSettings");
        *(_DWORD *)v29 = v25;
        didEnableKappaDetection = self->_kappaUserInfo.didEnableKappaDetection;
        LOBYTE(v30) = self->_kappaUserInfo.didEnableKappaDetection;
        isImproveSafetyEnabled = self->_kappaUserInfo.isImproveSafetyEnabled;
        BYTE1(v30) = self->_kappaUserInfo.isImproveSafetyEnabled;
        firstPartyEnabled = self->_kappaUserInfo.firstPartyEnabled;
        BYTE2(v30) = self->_kappaUserInfo.firstPartyEnabled;
        thirdPartyEnabled = self->_kappaUserInfo.thirdPartyEnabled;
        HIBYTE(v30) = self->_kappaUserInfo.thirdPartyEnabled;
        if (qword_1003873C0 != -1)
          dispatch_once(&qword_1003873C0, &stru_10034B268);
        v15 = qword_1003873C8;
        if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&buf[4] = didEnableKappaDetection;
          v32 = 1024;
          v33 = isImproveSafetyEnabled;
          v34 = 1024;
          v35 = firstPartyEnabled;
          v36 = 1024;
          v37 = thirdPartyEnabled;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "kTypeCompanionQuery didEnableKappaDetection:%d isImproveSafetyEnabled:%d firstPartyEnabled:%d thirdPartyEnabled:%d", buf, 0x1Au);
        }
        v16 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", v29, 8);
        -[CSCompanionServiceProtocol returnQueryToCompanion:](self->_companion, "returnQueryToCompanion:", v16);

      }
      break;
    case 10:
      objc_msgSend(v7, "getBytes:length:", buf, 8);
      if (qword_1003873C0 != -1)
        dispatch_once(&qword_1003873C0, &stru_10034B268);
      v17 = qword_1003873C8;
      if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v29 = 67109120;
        v30 = *(_DWORD *)buf;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "kTypeCompanionQueryReturn queryType:%d", v29, 8u);
      }
      if (*(_DWORD *)buf == 1)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_queryCompletions, "objectAtIndex:", 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        v20 = v18 == v19;

        if (v20)
        {
          if (qword_1003873C0 != -1)
            dispatch_once(&qword_1003873C0, &stru_10034B268);
          v24 = qword_1003873C8;
          if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v29 = 67109120;
            v30 = *(_DWORD *)buf;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "CoreAnalytics No completion block for type %d found, ignoring", v29, 8u);
          }
        }
        else
        {
          v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_queryCompletions, "objectAtIndex:", 1));
          ((void (**)(_QWORD, id, _QWORD))v21)[2](v21, v7, *(unsigned int *)buf);
          queryCompletions = self->_queryCompletions;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          -[NSMutableArray replaceObjectAtIndex:withObject:](queryCompletions, "replaceObjectAtIndex:withObject:", 1, v23);

        }
      }
      break;
    default:
      break;
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
  objc_storeStrong((id *)&self->_queryCompletions, 0);
  objc_storeStrong((id *)&self->_cachedUploadedResults, 0);
  objc_storeStrong((id *)&self->_queryCompanionTimer, 0);
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_vendor, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 20) = 0;
  *((_DWORD *)self + 4) = 0;
  *((_DWORD *)self + 6) = -1;
  *(_OWORD *)((char *)self + 28) = 0u;
  *(_OWORD *)((char *)self + 44) = 0u;
  *(_OWORD *)((char *)self + 60) = 0u;
  *(_OWORD *)((char *)self + 76) = 0u;
  *(_QWORD *)((char *)self + 92) = 0;
  return self;
}

@end
