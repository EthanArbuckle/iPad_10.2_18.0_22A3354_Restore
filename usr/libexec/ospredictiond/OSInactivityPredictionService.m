@implementation OSInactivityPredictionService

+ (id)sharedInstance
{
  if (qword_100076808 != -1)
    dispatch_once(&qword_100076808, &stru_1000607B0);
  return (id)qword_100076800;
}

- (OSInactivityPredictionService)init
{
  OSInactivityPredictionService *v2;
  os_log_t v3;
  void *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *mainQueue;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  NSDate *dateOfHistorySufficiency;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSDate *v18;
  uint64_t v19;
  NSDate *v20;
  OSInactivityPredictionService *v21;
  NSObject *v22;
  NSDate *v23;
  double v24;
  uint64_t v25;
  TRIClient *trialClient;
  void *v27;
  unsigned int v28;
  _OSInactivityNotificationManager *v29;
  _OSInactivityNotificationManager *notificationManager;
  dispatch_queue_global_t global_queue;
  NSObject *v32;
  _QWORD handler[4];
  OSInactivityPredictionService *v35;
  id v36;
  _QWORD v37[4];
  OSInactivityPredictionService *v38;
  objc_super v39;
  uint8_t buf[4];
  NSDate *v41;

  v39.receiver = self;
  v39.super_class = (Class)OSInactivityPredictionService;
  v2 = -[OSInactivityPredictionService initWithMachServiceName:](&v39, "initWithMachServiceName:", CFSTR("com.apple.OSIntelligence"));
  if (!v2)
  {
LABEL_20:
    -[OSInactivityPredictionService resume](v2, "resume");
    v21 = v2;
    goto LABEL_21;
  }
  v3 = os_log_create("com.apple.osintelligence", "inactivity.predictionservice");
  v4 = (void *)qword_1000767F8;
  qword_1000767F8 = (uint64_t)v3;

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = dispatch_queue_create("com.apple.osintelligence.inactivityprediction.mainqueue", v6);
  mainQueue = v2->_mainQueue;
  v2->_mainQueue = (OS_dispatch_queue *)v7;

  if (v2->_mainQueue)
  {
    v9 = qword_1000767F8;
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initializing inactivity predictor...", buf, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor predictor](_OSInactivityPredictor, "predictor"));
    objc_storeStrong((id *)&v2->_predictor, v10);
    v11 = objc_alloc_init((Class)_OSDataProtectionStateMonitor);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_OSDataProtectionStateMonitor dataProtectionClassC](_OSDataProtectionStateMonitor, "dataProtectionClassC"));
    v13 = objc_msgSend(v11, "isDataAvailableFor:", v12);

    if ((v13 & 1) == 0)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100004C84;
      v37[3] = &unk_1000607D8;
      v38 = v2;
      objc_msgSend(v11, "setChangeHandler:", v37);

    }
    dateOfHistorySufficiency = v2->_dateOfHistorySufficiency;
    v2->_dateOfHistorySufficiency = 0;

    if ((objc_msgSend(v10, "requireEnoughHistory") & 1) == 0)
    {
      v15 = qword_1000767F8;
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Predictor needs upgrade. Calculating date of history sufficiency...", buf, 2u);
      }
      v36 = 0;
      v16 = objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor projectedDateOfHistorySufficiencyWithError:](_OSInactivityPredictor, "projectedDateOfHistorySufficiencyWithError:", &v36));
      v17 = v36;
      v18 = v2->_dateOfHistorySufficiency;
      v2->_dateOfHistorySufficiency = (NSDate *)v16;

      if (v17 || !v2->_dateOfHistorySufficiency)
      {
        if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_ERROR))
          sub_10003D140();
        v19 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 604800.0));
        v20 = v2->_dateOfHistorySufficiency;
        v2->_dateOfHistorySufficiency = (NSDate *)v19;

      }
      v22 = qword_1000767F8;
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_INFO))
      {
        v23 = v2->_dateOfHistorySufficiency;
        *(_DWORD *)buf = 138412290;
        v41 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Projected to reach history sufficienty by: %@", buf, 0xCu);
      }
      -[NSDate timeIntervalSinceNow](v2->_dateOfHistorySufficiency, "timeIntervalSinceNow");
      -[OSInactivityPredictionService scheduleModelUpgradeAfterInterval:](v2, "scheduleModelUpgradeAfterInterval:", fmin(v24, 604800.0));

    }
    v25 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 293));
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](v2->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("onlyDefaultModel"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    v28 = objc_msgSend(v27, "BOOLeanValue");

    -[OSInactivityPredictionService registerDeviceTypeEvalution:](v2, "registerDeviceTypeEvalution:", +[_OSInactivityPredictor hasEnoughInactivityHistory](_OSInactivityPredictor, "hasEnoughInactivityHistory") & (v28 ^ 1));
    -[OSInactivityPredictionService setDelegate:](v2, "setDelegate:", v2);
    -[OSInactivityPredictionService registerBackupTask](v2, "registerBackupTask");
    v29 = objc_alloc_init(_OSInactivityNotificationManager);
    notificationManager = v2->_notificationManager;
    v2->_notificationManager = v29;

    *(_DWORD *)buf = 0;
    global_queue = dispatch_get_global_queue(-32768, 0);
    v32 = objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100004DAC;
    handler[3] = &unk_100060800;
    v35 = v2;
    notify_register_dispatch("com.apple.osintelligence.defaultmodelchanged", (int *)buf, v32, handler);

    goto LABEL_20;
  }
  v21 = 0;
LABEL_21:

  return v21;
}

- (void)registerBackupTask
{
  xpc_object_t v2;
  id v3;
  _QWORD handler[4];
  id v5;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, 345600);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004F1C;
  handler[3] = &unk_100060828;
  v5 = v2;
  v3 = v2;
  xpc_activity_register("com.apple.osintelligence.inactivitybackup", XPC_ACTIVITY_CHECK_IN, handler);

}

- (unint64_t)evaluatePredictorTypeWithLookahead:(double)a3 withIncrement:(double)a4 withActivity:(id)a5
{
  _xpc_activity_s *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **p_cache;
  NSObject *v13;
  unint64_t v14;
  double v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  _xpc_activity_s *v21;
  void *v22;
  id v23;
  void **v24;
  id v25;
  void **v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const __CFString *v33;
  NSObject *v35;
  __CFString *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  const __CFString *v41;
  __int16 v42;
  __CFString *v43;

  v7 = (_xpc_activity_s *)a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictorTwoStage evaluator](_OSInactivityPredictorTwoStage, "evaluator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getAllLockIntervalsEndingBefore:", v10));

  v37 = v11;
  if (objc_msgSend(v11, "count"))
  {
    p_cache = &OBJC_METACLASS___longDurationModelOutput.cache;
    if (a3 >= 0.0)
    {
      v38 = 0;
      v15 = 0.0;
      while (!xpc_activity_should_defer(v7))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v15));
        if ((objc_msgSend(v9, "didDateTakePlaceDuringRecentLongLocks:", v16) & 1) != 0)
        {
          v39 = 0;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "longInactivityPredictionResultAtDate:withLockHistory:withOptions:withError:", v16, v9, 1, &v39));
          v18 = (__CFString *)v39;
          if (v18)
          {
            v19 = p_cache[255];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v41 = v16;
              v42 = 2112;
              v43 = v18;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Evaluating... Error: Date %@ with error %@", buf, 0x16u);
            }
          }
          else
          {
            v21 = v7;
            v22 = v8;
            v23 = objc_msgSend(v17, "confidenceLevel");
            v24 = p_cache;
            v25 = v23;
            v26 = v24;
            v27 = v24[255];
            v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            if (v25 == (id)2)
            {
              if (v28)
              {
                v35 = v27;
                v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
                *(_DWORD *)buf = 138412546;
                v41 = v16;
                v42 = 2112;
                v43 = v36;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Evaluating... High confidence at %@ with output %@", buf, 0x16u);

              }
              v38 = 1;
              p_cache = v26;
              v8 = v22;
              v7 = v21;
              goto LABEL_24;
            }
            if (v28)
            {
              v29 = v27;
              v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
              *(_DWORD *)buf = 138412546;
              v41 = v16;
              v42 = 2112;
              v43 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Evaluating... no engagement for date %@ with output %@", buf, 0x16u);

            }
            v31 = v38;
            if (!v38)
              v31 = 2;
            v38 = v31;
            p_cache = v26;
            v8 = v22;
            v7 = v21;
          }

        }
        else
        {
          v20 = p_cache[255];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v16;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Evaluating... Date %@ not worth querying because didn't happen during recent long locks", buf, 0xCu);
          }
          v18 = v16;
        }

        v15 = v15 + a4;
        if (v15 > a3)
          goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)p_cache[255], OS_LOG_TYPE_ERROR))
        sub_10003D1D0();
      if (!xpc_activity_set_state(v7, 5) && os_log_type_enabled((os_log_t)p_cache[255], OS_LOG_TYPE_ERROR))
        sub_10003D1A4();
    }
    v38 = 0;
LABEL_24:
    v32 = p_cache[255];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = CFSTR("default");
      v14 = v38;
      if (v38 == 2)
        v33 = CFSTR("alternate");
      *(_DWORD *)buf = 138412290;
      v41 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Evaluated device to be %@ model", buf, 0xCu);
    }
    else
    {
      v14 = v38;
    }
  }
  else
  {
    v13 = qword_1000767F8;
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No lock interval found--type unknown", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (void)registerDeviceTypeEvalution:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  xpc_object_t v7;
  TRIClient *v8;
  TRIClient *trialClient;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  OSInactivityPredictionService *v22;
  double v23;
  double v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("modelType"));
  if (!v3 || v6 == (id)2)
  {
    xpc_activity_unregister("com.apple.osintelligence.evaluateModelType");
    v19 = qword_1000767F8;
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not registering xpc to evaluate model type", buf, 2u);
    }
  }
  else
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    v8 = (TRIClient *)objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 293));
    trialClient = self->_trialClient;
    self->_trialClient = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("nextLongInactivityIncrements"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    if (v12 <= 0.0)
      v13 = 3600.0;
    else
      v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("nextLongInactivityLookAhead"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    if (v16 <= 0.0)
      v16 = 86400.0;
    xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, 28800);
    v17 = qword_1000767F8;
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v26 = 0x40DC200000000000;
      v27 = 2048;
      v28 = v16;
      v29 = 2048;
      v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Scheduling evaluation with interval %f, lookahead seconds %f, and increments seconds %f", buf, 0x20u);
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000056EC;
    v20[3] = &unk_100060850;
    v21 = v7;
    v22 = self;
    v23 = v16;
    v24 = v13;
    v18 = v7;
    xpc_activity_register("com.apple.osintelligence.evaluateModelType", XPC_ACTIVITY_CHECK_IN, v20);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  OSInactivityPredictionServiceXPCProxy *v9;
  BOOL v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.osintelligence.inactivity")));
  if (v6
    && (v7 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____OSInactivityPredictionProtocol_Private));
    objc_msgSend(v5, "setExportedInterface:", v8);

    v9 = -[OSInactivityPredictionServiceXPCProxy initWithObserver:]([OSInactivityPredictionServiceXPCProxy alloc], "initWithObserver:", self);
    objc_msgSend(v5, "setExportedObject:", v9);

    objc_msgSend(v5, "resume");
    v10 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_ERROR))
      sub_10003D290();
    v10 = 0;
  }

  return v10;
}

- (void)modelDescriptionWithHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

}

- (void)modelMetadataWithHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

}

- (void)hasEnoughInactivityHistoryWithHandler:(id)a3
{
  id v4;

  v4 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v4, +[_OSInactivityPredictor hasEnoughInactivityHistory](_OSInactivityPredictor, "hasEnoughInactivityHistory"));

}

- (void)recommendedWaitTimeWithHandler:(id)a3
{
  void (**v4)(_QWORD);
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v4 = (void (**)(_QWORD))a3;
  -[OSInactivityPredictionService readOverriddenWaitTime](self, "readOverriddenWaitTime");
  v6 = v5;
  if (v5 == -777.0)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
    objc_msgSend(v15, "recommendedWaitTime");
    v4[2](v4);

  }
  else
  {
    v7 = qword_1000767F8;
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEBUG))
      sub_10003D2BC(v7, v8, v9, v10, v11, v12, v13, v14);
    ((void (*)(void (**)(_QWORD), double))v4[2])(v4, v6);

  }
}

- (void)inactivityHistoryDiagnosisWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor userHistoryDiagnosis](_OSInactivityPredictor, "userHistoryDiagnosis"));
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

- (void)deviceUsageDiagnosisWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor deviceUsageDiagnosis](_OSInactivityPredictor, "deviceUsageDiagnosis"));
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

- (void)longInactivityPredictionResultWithHandler:(id)a3
{
  -[OSInactivityPredictionService longInactivityPredictionResultWithOptions:withHandler:](self, "longInactivityPredictionResultWithOptions:withHandler:", 0, a3);
}

- (void)longInactivityPredictionResultWithOptions:(int64_t)a3 withHandler:(id)a4
{
  void (**v6)(id, id, _QWORD);
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  _OSInactivityNotificationManager *notificationManager;
  double v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  int64_t v30;
  __int16 v31;
  _BYTE v32[10];
  void *v33;

  v6 = (void (**)(id, id, _QWORD))a4;
  v28 = 0;
  if (!-[OSInactivityPredictionService overriddenToUseTimeRestrictionFromHour:toHour:](self, "overriddenToUseTimeRestrictionFromHour:toHour:", (char *)&v28 + 4, &v28))goto LABEL_5;
  v7 = qword_1000767F8;
  if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v30 = a3;
    v31 = 1024;
    *(_DWORD *)v32 = HIDWORD(v28);
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "(%ld) User has overridden to use time restriction during (%d, %d)", buf, 0x18u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = +[OSIntelligenceUtilities isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:](OSIntelligenceUtilities, "isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:", v8, (double)SHIDWORD(v28), (double)(int)v28);

  if ((v9 & 1) == 0)
  {
    v26 = (void *)qword_1000767F8;
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEBUG))
      sub_10003D39C(v26, a3);
    v12 = objc_msgSend(objc_alloc((Class)_OSInactivityPredictorOutput), "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:", 0, 5, 0.0, 0.0);
    v6[2](v6, v12, 0);
  }
  else
  {
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService readOverriddenModelOutput](self, "readOverriddenModelOutput"));
    if (v10)
    {
      v11 = qword_1000767F8;
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEBUG))
        sub_10003D324((uint64_t)v10, a3, v11);
      v6[2](v6, v10, 0);
      v12 = 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
      v27 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "longInactivityPredictionResultWithOptions:withError:", a3, &v27));
      v12 = v27;

      if (objc_msgSend(v14, "confidenceLevel") == (id)2)
      {
        objc_msgSend(v14, "predictedDuration");
        if (v15 > 0.0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
          if (objc_msgSend(v16, "BOOLForKey:", CFSTR("showNotifications")))
          {
            if (a3 == 1 || !a3 && (objc_msgSend(v14, "predictedDuration"), v17 > 7200.0))
            {
              notificationManager = self->_notificationManager;
              objc_msgSend(v14, "predictedDuration");
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v19 * 3600.0));
              v21 = -[_OSInactivityNotificationManager postEngagedUntilDate:inactivityOptions:](notificationManager, "postEngagedUntilDate:inactivityOptions:", v20, a3);

            }
          }
          v22 = (void *)qword_1000767F8;
          if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "predictorType"));
            *(_DWORD *)buf = 134218498;
            v30 = a3;
            v31 = 2112;
            *(_QWORD *)v32 = v25;
            *(_WORD *)&v32[8] = 2112;
            v33 = v14;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "(%ld) %@ predicts %@", buf, 0x20u);

          }
        }
      }
      ((void (**)(id, id, id))v6)[2](v6, v14, v12);

    }
  }

}

- (void)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withHandler:(id)a6
{
  id v10;
  void (**v11)(id, id, _QWORD);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v10 = a3;
  v11 = (void (**)(id, id, _QWORD))a6;
  v22 = 0;
  if (!-[OSInactivityPredictionService overriddenToUseTimeRestrictionFromHour:toHour:](self, "overriddenToUseTimeRestrictionFromHour:toHour:", (char *)&v22 + 4, &v22))goto LABEL_5;
  if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEBUG))
    sub_10003D584();
  if (!+[OSIntelligenceUtilities isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:](OSIntelligenceUtilities, "isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:", v10, (double)SHIDWORD(v22), (double)(int)v22))
  {
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEBUG))
      sub_10003D524();
    v13 = objc_msgSend(objc_alloc((Class)_OSInactivityPredictorOutput), "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:", 0, 5, 0.0, 0.0);
    v11[2](v11, v13, 0);
  }
  else
  {
LABEL_5:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService readOverriddenModelOutput](self, "readOverriddenModelOutput"));
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEBUG))
        sub_10003D4C4();
      v11[2](v11, v12, 0);
      v13 = 0;
    }
    else
    {
      if (+[_OSInactivityPredictor isDeviceRarelyUsedRecently](_OSInactivityPredictor, "isDeviceRarelyUsedRecently"))
      {
        v14 = (void *)qword_1000767F8;
        if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_ERROR))
          sub_10003D1FC(v14);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
      v21 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:", v10, a5, &v21, a4));
      v13 = v21;

      v17 = (void *)qword_1000767F8;
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "predictorType"));
        *(_DWORD *)buf = 138412802;
        v24 = v10;
        v25 = 2112;
        v26 = v20;
        v27 = 2112;
        v28 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "(At %@) %@ predicts %@", buf, 0x20u);

      }
      if (v13 && os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_ERROR))
        sub_10003D448();
      ((void (**)(id, id, id))v11)[2](v11, v16, v13);

    }
  }

}

- (void)fixModelOutput:(id)a3 withHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Fixed model output = %@"), v10));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService readOverriddenModelOutput](self, "readOverriddenModelOutput"));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Replaced fixed output %@ with %@"), v8, v10));

    v7 = (void *)v9;
  }
  -[OSInactivityPredictionService writeOverriddenModelOutput:](self, "writeOverriddenModelOutput:", v10);
  v6[2](v6, v7);

}

- (void)unfixModelOutputWithHandler:(id)a3
{
  void (**v4)(id, __CFString *);
  uint64_t v5;
  __CFString *v6;
  id v7;

  v4 = (void (**)(id, __CFString *))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService readOverriddenModelOutput](self, "readOverriddenModelOutput"));
  v7 = (id)v5;
  if (v5)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unfixed model output (previously fixed to be %@)"), v5, v5));
  else
    v6 = CFSTR("Nothing to be unfixed");
  -[OSInactivityPredictionService writeOverriddenModelOutput:](self, "writeOverriddenModelOutput:", 0);
  v4[2](v4, v6);

}

- (void)overrideRecommendedWaitTimeTo:(double)a3 withHandler:(id)a4
{
  void (**v6)(id, uint64_t);

  if (a3 <= 0.0)
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    v6 = (void (**)(id, uint64_t))a4;
    -[OSInactivityPredictionService writeOverriddenWaitTime:](self, "writeOverriddenWaitTime:", a3);
    v6[2](v6, 1);
  }

}

- (void)restoreRecommendedWaitTimeWithHandler:(id)a3
{
  void (**v4)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  -[OSInactivityPredictionService writeOverriddenWaitTime:](self, "writeOverriddenWaitTime:", -777.0);
  v4[2](v4, 1);

}

- (void)restoreInactivityModelWithHandler:(id)a3
{
  void (**v4)(id, BOOL);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, BOOL))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("modelType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor predictor](_OSInactivityPredictor, "predictor"));
  -[OSInactivityPredictionService setPredictor:](self, "setPredictor:", v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
  v4[2](v4, v7 != 0);

}

- (void)backedUpDataWithHandler:(id)a3
{
  void (**v3)(id, void *);
  _OSInactivityPredictionBackupManager *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = (void (**)(id, void *))a3;
  v4 = objc_alloc_init(_OSInactivityPredictionBackupManager);
  v5 = (void *)qword_1000767F8;
  if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictionBackupManager hydrateBackup](v4, "hydrateBackup"));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityPredictionBackupManager hydrateBackup](v4, "hydrateBackup"));
  v3[2](v3, v8);

}

- (void)writeEvaluatedPredictorTypeToDefaults:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("predictorType"));

}

- (id)readOverriddenModelOutput
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("overriddenModelOutput")));
  if (v3)
  {
    v9 = 0;
    v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(_OSInactivityPredictorOutput), v3, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v9;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_ERROR))
        sub_10003D5FC();
      v7 = 0;
    }
    else
    {
      v7 = v5;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)writeOverriddenModelOutput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  if (v3)
  {
    v6 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v6));
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("overriddenModelOutput"));

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEBUG))
      sub_10003D660();
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("overriddenModelOutput"));
  }

}

- (double)readOverriddenWaitTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("overriddenWaitTime")));

  if (v3)
  {
    objc_msgSend(v2, "doubleForKey:", CFSTR("overriddenWaitTime"));
    v5 = v4;
  }
  else
  {
    v5 = -777.0;
  }

  return v5;
}

- (void)writeOverriddenWaitTime:(double)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  v5 = v4;
  if (a3 == -777.0)
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("overriddenWaitTime"));
  else
    objc_msgSend(v4, "setDouble:forKey:", CFSTR("overriddenWaitTime"), a3);

}

- (BOOL)overriddenToUseTimeRestrictionFromHour:(int *)a3 toHour:(int *)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("overriddenBedtime")));

  if (!v7
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("overriddenWakeupTime"))),
        v8,
        !v8))
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  *a3 = objc_msgSend(v6, "integerForKey:", CFSTR("overriddenBedtime"));
  v9 = objc_msgSend(v6, "integerForKey:", CFSTR("overriddenWakeupTime"));
  *a4 = v9;
  if (*a3 > 0x17 || v9 < 0 || v9 >= 24)
  {
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_ERROR))
      sub_10003D698();
    goto LABEL_9;
  }
  v10 = 1;
LABEL_10:

  return v10;
}

- (void)scheduleModelUpgradeAfterInterval:(double)a3
{
  double v3;
  dispatch_time_t v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (a3 < 86400.0)
    a3 = 86400.0;
  if (a3 <= 604800.0)
    v3 = a3;
  else
    v3 = 604800.0;
  objc_initWeak(&location, self);
  v4 = dispatch_walltime(0, 1000000000 * vcvtpd_s64_f64(v3));
  global_queue = dispatch_get_global_queue(-2, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006AE8;
  v7[3] = &unk_100060878;
  objc_copyWeak(&v8, &location);
  dispatch_after(v4, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)upgradePredictorIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSDate *dateOfHistorySufficiency;
  NSDate *v11;
  NSDate *v12;
  double v13;
  double v14;
  NSObject *v15;
  _BOOL4 v16;
  NSDate *v17;
  NSDate *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  NSObject *v25;
  NSDate *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  NSDate *v31;
  int v33;
  NSDate *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
  v4 = objc_msgSend(v3, "requireEnoughHistory");

  if (v4)
  {
    v5 = (void *)qword_1000767F8;
    v6 = 1;
    if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_INFO))
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "predictorType"));
      v33 = 138412290;
      v34 = (NSDate *)v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Predictor type is already history-aware: %@", (uint8_t *)&v33, 0xCu);

      goto LABEL_4;
    }
  }
  else
  {
    dateOfHistorySufficiency = self->_dateOfHistorySufficiency;
    if (!dateOfHistorySufficiency)
    {
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor projectedDateOfHistorySufficiencyWithError:](_OSInactivityPredictor, "projectedDateOfHistorySufficiencyWithError:", 0));
      v12 = self->_dateOfHistorySufficiency;
      self->_dateOfHistorySufficiency = v11;

      dateOfHistorySufficiency = self->_dateOfHistorySufficiency;
    }
    -[NSDate timeIntervalSinceNow](dateOfHistorySufficiency, "timeIntervalSinceNow");
    v14 = v13;
    v15 = qword_1000767F8;
    v16 = os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_INFO);
    if (v14 <= 0.0)
    {
      if (v16)
      {
        v18 = self->_dateOfHistorySufficiency;
        v33 = 138412290;
        v34 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Reached date of sufficiency of %@. Upgrading to the ML models...", (uint8_t *)&v33, 0xCu);
      }
      v19 = objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor predictor](_OSInactivityPredictor, "predictor"));
      v7 = v19;
      if (v19
        && (v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject predictorType](v19, "predictorType")),
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor")),
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "predictorType")),
            v23 = objc_msgSend(v20, "isEqualToString:", v22),
            v22,
            v21,
            v20,
            !v23))
      {
        -[OSInactivityPredictionService setPredictor:](self, "setPredictor:", v7);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
        v28 = objc_msgSend(v27, "requireEnoughHistory");

        v29 = (void *)qword_1000767F8;
        if ((v28 & 1) != 0)
        {
          v6 = 1;
          if (!os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_INFO))
            goto LABEL_23;
          v9 = v29;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[OSInactivityPredictionService predictor](self, "predictor"));
          v31 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "predictorType"));
          v33 = 138412290;
          v34 = v31;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Successfully upgraded the model to: %@", (uint8_t *)&v33, 0xCu);

LABEL_4:
LABEL_23:

          return v6;
        }
        if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_ERROR))
          sub_10003D710(v29, self);
      }
      else
      {
        v24 = (void *)qword_1000767F8;
        if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_INFO))
        {
          v25 = v24;
          v26 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSObject predictorType](v7, "predictorType"));
          v33 = 138412290;
          v34 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "New predictor is nil or type remains the same as old model: %@. Upgrade aborted.", (uint8_t *)&v33, 0xCu);

        }
      }
      v6 = 0;
      goto LABEL_23;
    }
    if (v16)
    {
      v17 = self->_dateOfHistorySufficiency;
      v33 = 138412290;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Still haven't reached history sufficient. New projected date: %@", (uint8_t *)&v33, 0xCu);
    }
    return 0;
  }
  return v6;
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMainQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_OSInactivityPredictor)predictor
{
  return (_OSInactivityPredictor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPredictor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)dateOfHistorySufficiency
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDateOfHistorySufficiency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (_OSInactivityNotificationManager)notificationManager
{
  return (_OSInactivityNotificationManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNotificationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_dateOfHistorySufficiency, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
}

@end
