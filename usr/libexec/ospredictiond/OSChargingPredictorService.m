@implementation OSChargingPredictorService

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000178B0;
  block[3] = &unk_100060720;
  block[4] = a1;
  if (qword_100076878 != -1)
    dispatch_once(&qword_100076878, block);
  return (id)qword_100076870;
}

- (OSChargingPredictorService)init
{
  OSChargingPredictorService *v2;
  os_log_t v3;
  OS_os_log *log;
  NSString *defaultsDomain;
  uint64_t v6;
  OSIntelligenceTrialManager *trialManager;
  uint64_t v8;
  _CDLocalContext *context;
  NSObject *v10;
  NSXPCListener *v11;
  NSXPCListener *listener;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)OSChargingPredictorService;
  v2 = -[OSChargingPredictorService init](&v15, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "chargingprediction");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    defaultsDomain = v2->_defaultsDomain;
    v2->_defaultsDomain = (NSString *)CFSTR("com.apple.osintelligence.chargingpredictor");

    v6 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceTrialManager sharedChargePredictionInstance](OSIntelligenceTrialManager, "sharedChargePredictionInstance"));
    trialManager = v2->_trialManager;
    v2->_trialManager = (OSIntelligenceTrialManager *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v8;

    v10 = v2->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initializing delegate", v14, 2u);
    }
    v11 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.OSIntelligence.charging"));
    listener = v2->_listener;
    v2->_listener = v11;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (void)dealloc
{
  NSXPCListener *listener;
  objc_super v4;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)OSChargingPredictorService;
  -[OSChargingPredictorService dealloc](&v4, "dealloc");
}

- (void)chargeDurationPredictionOfScheme:(unint64_t)a3 withHandler:(id)a4
{
  void (**v6)(id, id, _QWORD);
  void *v7;
  OS_os_log *v8;
  unint64_t v9;
  NSObject *log;
  NSObject *v11;
  void *v12;
  OS_os_log *v13;
  __objc2_class **v14;
  OSChargingPredictorSignalsOnly *v15;
  unsigned __int8 v16;
  id v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPredictorService readOverriddenModelOutput](self, "readOverriddenModelOutput"));
  if (!v7)
  {
    v9 = -[OSChargingPredictorService readOverridenModelScheme](self, "readOverridenModelScheme");
    if (v9 != 0xFFFFFFFF)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v11 = log;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
        *(_DWORD *)buf = 138412290;
        v27 = (unint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Model scheme overriden to %@", buf, 0xCu);

      }
      a3 = v9;
    }
    v13 = self->_log;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Querying prediction service for prediction scheme: %lu", buf, 0xCu);
    }
    if (a3)
    {
      if (a3 >= 3)
      {
        switch(a3)
        {
          case 3uLL:
            v14 = off_100060268;
            break;
          case 5uLL:
            v14 = off_100060270;
            break;
          case 4uLL:
            v15 = -[OSChargingPredictorSignalsOnly initWithDefaultsDomain:withContextStore:withTrialManager:]([OSChargingPredictorSignalsOnly alloc], "initWithDefaultsDomain:withContextStore:withTrialManager:", self->_defaultsDomain, self->_context, self->_trialManager);
            v17 = (id)objc_claimAutoreleasedReturnValue(-[OSChargingPredictorSignalsOnly chargingDecisionWithLog:](v15, "chargingDecisionWithLog:", self->_log));
            goto LABEL_19;
          default:
            v15 = 0;
LABEL_16:
            v16 = -[OSChargingPredictorSignalsOnly isSufficientDataAvailable](v15, "isSufficientDataAvailable");
            if (v9 != 0xFFFFFFFF || (v16 & 1) != 0)
            {
              v18 = +[OSIntelligenceUtilities currentBatteryLevelWithContext:](OSIntelligenceUtilities, "currentBatteryLevelWithContext:", self->_context);
              v17 = (id)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities lastPluggedInDate](OSIntelligenceUtilities, "lastPluggedInDate"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
              if (v15)
                -[OSChargingPredictorSignalsOnly chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:](v15, "chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:", v18, v17, v19, self->_log, (double)v18);

              v20 = self->_log;
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                v21 = v20;
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
                v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
                *(_DWORD *)buf = 138412802;
                v27 = (unint64_t)v22;
                v28 = 2112;
                v29 = v23;
                v30 = 2112;
                v31 = v24;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Predictions at plug-in: \n Confidence: %@,\n Duration: %@,\n Decision: %@", buf, 0x20u);

              }
              v25 = objc_alloc_init((Class)_OSChargingPredictorOutput);
              objc_msgSend(v25, "setConfidence:", 0.0);
              objc_msgSend(v25, "setMeetsSystemConfidenceThreshold:", 0);
              objc_msgSend(v25, "setChargingDuration:", 0.0 * 3600.0);
              v6[2](v6, v25, 0);

              goto LABEL_29;
            }
            v17 = objc_alloc_init((Class)_OSChargingPredictorOutput);
            objc_msgSend(v17, "setConfidence:", 0.0);
            objc_msgSend(v17, "setMeetsSystemConfidenceThreshold:", 0);
            objc_msgSend(v17, "setChargingDuration:", 0.0);
LABEL_19:
            v6[2](v6, v17, 0);
LABEL_29:

            goto LABEL_30;
        }
      }
      else
      {
        v14 = off_100060260;
      }
    }
    else
    {
      v14 = &off_100060278;
    }
    v15 = (OSChargingPredictorSignalsOnly *)objc_msgSend(objc_alloc(*v14), "initWithDefaultsDomain:withContextStore:withTrialManager:", self->_defaultsDomain, self->_context, self->_trialManager);
    goto LABEL_16;
  }
  v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    sub_10003EAD0((uint64_t)v7, v8);
  v6[2](v6, v7, 0);
LABEL_30:

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  OS_os_log *log;
  void *v9;
  uint64_t v10;
  void *v11;
  OSChargingPredictorServiceXPCProxy *v12;
  BOOL v13;
  NSObject *v14;
  uint8_t v16[16];

  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Listener received connection!", v16, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.osintelligence.charging")));
  if (v9
    && (v10 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____OSChargingPredictorProtocol));
    objc_msgSend(v7, "setExportedInterface:", v11);

    v12 = -[OSChargingPredictorServiceXPCProxy initWithObserver:]([OSChargingPredictorServiceXPCProxy alloc], "initWithObserver:", self);
    objc_msgSend(v7, "setExportedObject:", v12);

    objc_msgSend(v7, "resume");
    v13 = 1;
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(-[OSChargingPredictorService log](self, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003EB44(v14);

    v13 = 0;
  }

  return v13;
}

- (id)readOverriddenModelOutput
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  OS_os_log *log;
  id v9;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines chargingUserDefaults](OSIntelligenceDefines, "chargingUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("overriddenModelOutput")));
  if (v4)
  {
    v11 = 0;
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(_OSChargingPredictorOutput), v4, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v11;
    if (v7)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
        sub_10003EB84((uint64_t)v7, log);
      v9 = 0;
    }
    else
    {
      v9 = v6;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)writeOverriddenModelOutput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OS_os_log *log;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines chargingUserDefaults](OSIntelligenceDefines, "chargingUserDefaults"));
  if (v4)
  {
    v8 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v8));
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("overriddenModelOutput"));

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
      sub_10003EBF8((os_log_t)log);
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("overriddenModelOutput"));
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPredictorService readOverriddenModelOutput](self, "readOverriddenModelOutput"));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Replaced fixed output %@ with %@"), v8, v10));

    v7 = (void *)v9;
  }
  -[OSChargingPredictorService writeOverriddenModelOutput:](self, "writeOverriddenModelOutput:", v10);
  v6[2](v6, v7);

}

- (void)unfixModelOutputWithHandler:(id)a3
{
  void (**v4)(id, __CFString *);
  uint64_t v5;
  __CFString *v6;
  id v7;

  v4 = (void (**)(id, __CFString *))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OSChargingPredictorService readOverriddenModelOutput](self, "readOverriddenModelOutput"));
  v7 = (id)v5;
  if (v5)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unfixed model output (previously fixed to be %@)"), v5, v5));
  else
    v6 = CFSTR("Nothing to be unfixed");
  -[OSChargingPredictorService writeOverriddenModelOutput:](self, "writeOverriddenModelOutput:", 0);
  v4[2](v4, v6);

}

- (unint64_t)readOverridenModelScheme
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines chargingUserDefaults](OSIntelligenceDefines, "chargingUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("modelType")));

  if (v3)
    v4 = (unint64_t)objc_msgSend(v2, "integerForKey:", CFSTR("modelType"));
  else
    v4 = 0xFFFFFFFFLL;

  return v4;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsDomain, a3);
}

- (OSIntelligenceTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
