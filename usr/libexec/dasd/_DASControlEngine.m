@implementation _DASControlEngine

- (void)checkControlAction:(id)a3
{
  id v4;
  _CDContext *context;
  void *v6;
  void *v7;
  unsigned int v8;
  _CDContext *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *log;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  int encounteredTLC;
  unsigned int v35;
  void *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  id obj;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];

  v4 = a3;
  context = self->_context;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    v9 = self->_context;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
    v12 = (uint64_t)objc_msgSend(v11, "integerValue");

    if (v12 <= 95)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Checking control action", buf, 2u);
      }
      v47 = v4;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_actionToAnalyzers, "objectForKeyedSubscript:", v4, v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = v14;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v52;
        v19 = -1;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v52 != v18)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
            v22 = self->_log;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = v22;
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "description"));
              v25 = objc_msgSend(v21, "controlEffortResult");
              *(_DWORD *)buf = 138412546;
              v56 = v24;
              v57 = 2048;
              v58 = v25;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Analyzer %@, Control effort %lu", buf, 0x16u);

            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "analyticsStatus"));

            if (v26)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "analyticsStatus"));
              v28 = objc_msgSend(v27, "copy");
              objc_msgSend(v15, "addEntriesFromDictionary:", v28);

            }
            v29 = objc_msgSend(v21, "controlEffortResult");
            if ((uint64_t)v29 > v19)
            {
              v30 = (uint64_t)v29;
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v29));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, CFSTR("MaxControlEffort"));

              v19 = v30;
            }
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "analyzerName"));
            v33 = off_1001AA370;

            if (v32 == v33)
            {
              encounteredTLC = self->_encounteredTLC;
              v35 = objc_msgSend(v21, "encounteredTLC");
              self->_encounteredTLC = v35;
              if (encounteredTLC != v35)
                -[_DASControlEngine saveTLCState:](self, "saveTLCState:", encounteredTLC != 0);
            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        }
        while (v17);
      }
      else
      {
        v19 = -1;
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v46));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v36, CFSTR("BatteryLevel"));

      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100032554;
      v49[3] = &unk_10015DA30;
      v37 = v15;
      v50 = v37;
      AnalyticsSendEventLazy(CFSTR("com.apple.das.clas.controlEffort"), v49);
      v38 = self->_log;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        sub_1000E0B30((uint64_t)v37, v38, v39, v40, v41, v42, v43, v44);
      v4 = v47;
      if (v19 >= 1)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_controlEffortHistory, "setObject:forKeyedSubscript:", v37, v45);
        -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_controlEffortHistory, CFSTR("controlEffortHistory"));
        -[_DASControlEngine saveControlEffort:](self, "saveControlEffort:", v19);

      }
      -[_DASControlEngine updateControlAction:withEffort:](self, "updateControlAction:withEffort:", v47, v19);

    }
  }

}

- (_DASControlEngine)init
{
  char *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  os_log_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_DASControlEngine;
  v2 = -[_DASControlEngine init](&v18, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.dasd.clas.controlEngineQueue", v4);
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v7;

    v9 = os_log_create("com.apple.clas", "control");
    v10 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    v12 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
    v14 = (void *)*((_QWORD *)v2 + 25);
    *((_QWORD *)v2 + 25) = v13;

    objc_msgSend(*((id *)v2 + 25), "addDelegate:", v2);
    objc_msgSend(v2, "loadTrialTreatmentAndExperimentIdentifiers");
    *((_QWORD *)v2 + 20) = 50000;
    *((_QWORD *)v2 + 21) = 0x3FD3333333333333;
    *(_WORD *)(v2 + 11) = 256;
    v15 = objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStoreWithDirectReadWriteAccess](_DKKnowledgeStore, "knowledgeStoreWithDirectReadWriteAccess"));
    v16 = (void *)*((_QWORD *)v2 + 22);
    *((_QWORD *)v2 + 22) = v15;

    *((_QWORD *)v2 + 19) = -1;
    *(int64x2_t *)(v2 + 72) = vdupq_n_s64(0x7FFFFFFFuLL);
    objc_msgSend(v2, "loadTrialParameters");
    objc_msgSend(v2, "intializeAnalyzers");
    objc_msgSend(v2, "registerTriggers");
    if (v2[11])
      objc_msgSend(v2, "invokeInitialActionWithValue:", 1);
    if ((*((_QWORD *)v2 + 19) & 0x8000000000000000) == 0)
      objc_msgSend(v2, "invokeInitialActionWithValue:");
  }
  return (_DASControlEngine *)v2;
}

- (void)loadTrialTreatmentAndExperimentIdentifiers
{
  NSString *v3;
  NSString *trialTreatmentID;
  NSString *v5;
  NSString *trialExperimentID;
  NSObject *log;
  NSString *v8;
  NSString *v9;
  int v10;
  NSString *v11;
  __int16 v12;
  NSString *v13;

  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager treatmentID](self->_trialManager, "treatmentID"));
  trialTreatmentID = self->_trialTreatmentID;
  self->_trialTreatmentID = v3;

  v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager experimentID](self->_trialManager, "experimentID"));
  trialExperimentID = self->_trialExperimentID;
  self->_trialExperimentID = v5;

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_trialTreatmentID;
    v9 = self->_trialExperimentID;
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Trial: Treatment ID set to: %@, Experiment ID set to: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)loadTrialParameters
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSObject *log;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  id v17;
  void *v18;
  double trialSFIIdleWindowParameter;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  unint64_t v23;
  double v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  id v29;
  int v30;
  unint64_t v31;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_DASControlEngine loadTrialTreatmentAndExperimentIdentifiers](self, "loadTrialTreatmentAndExperimentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("CLAS_InitialActionAlwaysEnabled")));
  log = self->_log;
  v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = log;
      v30 = 134217984;
      v31 = objc_msgSend(v4, "BOOLeanValue");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trial: initialActionAlwaysEnabled action set to %ld", (uint8_t *)&v30, 0xCu);

    }
    self->_trialInitialActionAlways = objc_msgSend(v4, "BOOLeanValue");
  }
  else if (v6)
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load initialActionAlwaysEnabled", (uint8_t *)&v30, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("CLAS_DisableSFI")));
  v9 = self->_log;
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      v12 = objc_msgSend(v8, "BOOLeanValue");
      v30 = 67109120;
      LODWORD(v31) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trial: disableSFI set to %d", (uint8_t *)&v30, 8u);

    }
    self->_trialdisableSFI = objc_msgSend(v8, "BOOLeanValue");
  }
  else if (v10)
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load disableSFI", (uint8_t *)&v30, 2u);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("CLAS_WindowSFI")));
  v14 = self->_log;
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v16 = v14;
      v17 = objc_msgSend(v13, "longValue");
      v30 = 134217984;
      v31 = (unint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Trial: windowSFI set to %ld", (uint8_t *)&v30, 0xCu);

    }
    self->_trialSFIWindow = (int64_t)objc_msgSend(v13, "longValue");
  }
  else if (v15)
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load windowSFI", (uint8_t *)&v30, 2u);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("CLAS_IdleWindowParameterSFI")));
  trialSFIIdleWindowParameter = self->_trialSFIIdleWindowParameter;
  v20 = self->_log;
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (trialSFIIdleWindowParameter == 0.0)
  {
    if (v21)
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load idleWindowParameterSFI", (uint8_t *)&v30, 2u);
    }
  }
  else
  {
    if (v21)
    {
      v22 = v20;
      objc_msgSend(v18, "doubleValue");
      v30 = 134217984;
      v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Trial: idleWindowParameterSFI set to %lf", (uint8_t *)&v30, 0xCu);

    }
    objc_msgSend(v18, "doubleValue");
    self->_trialSFIIdleWindowParameter = v24;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("CLAS_InitialAction")));
  v26 = self->_log;
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      v28 = v26;
      v29 = objc_msgSend(v25, "longValue");
      v30 = 134217984;
      v31 = (unint64_t)v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Trial: initialAction set to %ld", (uint8_t *)&v30, 0xCu);

    }
    self->_trialInitialAction = (int64_t)objc_msgSend(v25, "longValue");
  }
  else if (v27)
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load initialAction", (uint8_t *)&v30, 2u);
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)intializeAnalyzers
{
  NSUserDefaults *v3;
  NSUserDefaults *defaults;
  void *v5;
  unint64_t dutyCyclingMethod;
  NSObject *log;
  void *v8;
  void *v9;
  NSDate *v10;
  NSDate *currentDutyCycleStartTime;
  void *v12;
  double v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *controlEffortHistory;
  void *v16;
  NSDate *v17;
  NSDate *encounteredTLCDate;
  void *v19;
  NSObject *v20;
  _BOOL8 dutyCyclingInitiated;
  _BOOL8 initialMitigationInitiated;
  double dutyCycleDuration;
  _BOOL4 encounteredTLC;
  NSDate *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD block[5];
  uint8_t buf[4];
  unint64_t v32;
  __int16 v33;
  _BOOL8 v34;
  __int16 v35;
  double v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  NSDate *v40;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031ADC;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  if (qword_1001AB4E0 != -1)
    dispatch_once(&qword_1001AB4E0, block);
  v3 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  defaults = self->_defaults;
  self->_defaults = v3;

  self->_dutyCyclingMethod = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("dutyCycling")));

  if (v5)
  {
    dutyCyclingMethod = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", CFSTR("dutyCycling"));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v32 = dutyCyclingMethod;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DutyCycling method is %ld", buf, 0xCu);
    }
    self->_dutyCyclingMethod = dutyCyclingMethod;
  }
  else
  {
    dutyCyclingMethod = self->_dutyCyclingMethod;
  }
  if (dutyCyclingMethod >= 3)
    self->_dutyCyclingMethod = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("initialActionInitiated")));
  self->_initialMitigationInitiated = objc_msgSend(v8, "BOOLValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("dutyCycleInitiated")));
  self->_dutyCyclingInitiated = objc_msgSend(v9, "BOOLValue");

  v10 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("currentDutyCycleStartTime")));
  currentDutyCycleStartTime = self->_currentDutyCycleStartTime;
  self->_currentDutyCycleStartTime = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("dutyCycleDuration")));
  objc_msgSend(v12, "doubleValue");
  self->_dutyCycleDuration = v13;

  v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("controlEffortHistory")));
  controlEffortHistory = self->_controlEffortHistory;
  self->_controlEffortHistory = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("encounteredTLC")));
  self->_encounteredTLC = objc_msgSend(v16, "BOOLValue");

  v17 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("encounteredTLCDate")));
  encounteredTLCDate = self->_encounteredTLCDate;
  self->_encounteredTLCDate = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    dutyCyclingInitiated = self->_dutyCyclingInitiated;
    initialMitigationInitiated = self->_initialMitigationInitiated;
    dutyCycleDuration = self->_dutyCycleDuration;
    encounteredTLC = self->_encounteredTLC;
    v25 = self->_encounteredTLCDate;
    *(_DWORD *)buf = 134219010;
    v32 = dutyCyclingInitiated;
    v33 = 2048;
    v34 = initialMitigationInitiated;
    v35 = 2048;
    v36 = dutyCycleDuration;
    v37 = 1024;
    v38 = encounteredTLC;
    v39 = 2112;
    v40 = v25;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Defaults: DutyCyclingInitiated:%ld, InitialMitigationInitiated:%ld, DutyCycleDuration:%lf, Encountered TLC:%d, Encountered TLC Date:%@", buf, 0x30u);
  }
  v26 = self->_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Initializing Analyzers", buf, 2u);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASControlEngine startBatteryTemperatureLoop](self, "startBatteryTemperatureLoop"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASControlEngine startChargeRateLoop](self, "startChargeRateLoop"));
  objc_msgSend(v19, "addObject:", v27);
  objc_msgSend(v19, "addObject:", v28);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_actionToAnalyzers, "setObject:forKeyedSubscript:", v19, CFSTR("kCLASActionSFI"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[_DASControlEngine intializeAnalyzerTimerWithCadence:forAction:](self, "intializeAnalyzerTimerWithCadence:forAction:", CFSTR("kCLASActionSFI"), 15.0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_actionToTimers, "setObject:forKeyedSubscript:", v29, CFSTR("kCLASActionSFI"));

}

- (id)status
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASControlEngine currentStatus](self, "currentStatus"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_controlEffortHistory, CFSTR("ControlEffortHistory"));
  return v3;
}

- (void)registerTriggers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v3));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100031D2C;
  v10[3] = &unk_10015DA08;
  v10[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.das.clas.deviceActivity"), v4, v10));

  -[_CDContext registerCallback:](self->_context, "registerCallback:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v6));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031D9C;
  v9[3] = &unk_10015DA08;
  v9[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.das.clas.pluggedIn"), v7, v9));

  -[_CDContext registerCallback:](self->_context, "registerCallback:", v8);
}

- (id)intializeAnalyzerTimerWithCadence:(double)a3 forAction:(id)a4
{
  id v6;
  NSObject *log;
  OS_dispatch_source *v8;
  OS_dispatch_source *analyzerTimer;
  NSObject *v10;
  id v11;
  OS_dispatch_source *v12;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;

  v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Activating timer for Action %@", buf, 0xCu);
  }
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_executionQueue);
  analyzerTimer = self->_analyzerTimer;
  self->_analyzerTimer = v8;

  dispatch_set_qos_class_fallback(self->_analyzerTimer, 17);
  dispatch_source_set_timer((dispatch_source_t)self->_analyzerTimer, 0, (unint64_t)(a3 * 1000000000.0), 0x3B9ACA00uLL);
  v10 = self->_analyzerTimer;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100017528;
  v14[3] = &unk_10015D558;
  v14[4] = self;
  v15 = v6;
  v11 = v6;
  dispatch_source_set_event_handler(v10, v14);
  dispatch_activate((dispatch_object_t)self->_analyzerTimer);
  v12 = self->_analyzerTimer;

  return v12;
}

- (void)saveTLCState:(BOOL)a3
{
  int64_t v4;
  int64_t lastSavedTLC;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *encounteredTLCDate;
  NSDate *v16;
  NSUserDefaults *defaults;
  void *v18;
  void *v19;
  void *v20;
  _DKKnowledgeSaving *store;
  void *v22;
  NSDate *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  lastSavedTLC = self->_lastSavedTLC;
  if (lastSavedTLC == 0x7FFFFFFF)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/system/TLC")));
    v26 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
    v25 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v7, 0, 1, v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeSaving executeQuery:error:](self->_store, "executeQuery:error:", v10, 0));
    if (objc_msgSend(v11, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));

      if (objc_msgSend(v13, "integerValue"))
        self->_lastSavedTLC = (int64_t)objc_msgSend(v13, "integerValue");

    }
    lastSavedTLC = self->_lastSavedTLC;
  }
  if (lastSavedTLC != v4)
  {
    if (!self->_encounteredTLCDate)
    {
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
      encounteredTLCDate = self->_encounteredTLCDate;
      self->_encounteredTLCDate = v14;

    }
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    defaults = self->_defaults;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_encounteredTLC));
    -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v18, CFSTR("encounteredTLC"));

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v16, CFSTR("encounteredTLCDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/system/TLC")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:", v19, self->_encounteredTLCDate, v16, v4, 0));

    if (v20)
    {
      store = self->_store;
      v24 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      LODWORD(store) = -[_DKKnowledgeSaving saveObjects:error:](store, "saveObjects:error:", v22, 0);

      if ((_DWORD)store)
        self->_lastSavedTLC = v4;
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E0B04();
    }
    v23 = self->_encounteredTLCDate;
    self->_encounteredTLCDate = v16;

  }
}

- (void)saveControlEffort:(int64_t)a3
{
  void *v5;
  int64_t lastSavedEffort;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _DKKnowledgeSaving *store;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (self->_trialInitialActionAlways)
    a3 += 200;
  lastSavedEffort = self->_lastSavedEffort;
  if (lastSavedEffort == 0x7FFFFFFF)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/dasd/controlEffort")));
    v21 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
    v20 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v8, 0, 1, v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeSaving executeQuery:error:](self->_store, "executeQuery:error:", v11, 0));
    if (objc_msgSend(v12, "count"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));

      if (objc_msgSend(v14, "integerValue"))
        self->_lastSavedEffort = (int64_t)objc_msgSend(v14, "integerValue");

    }
    lastSavedEffort = self->_lastSavedEffort;
  }
  if (lastSavedEffort != a3)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/dasd/controlEffort")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:", v15, v5, v5, a3, 0));

    if (v16)
    {
      store = self->_store;
      v19 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      LODWORD(store) = -[_DKKnowledgeSaving saveObjects:error:](store, "saveObjects:error:", v18, 0);

      if ((_DWORD)store)
        self->_lastSavedEffort = a3;
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E0B04();
    }

  }
}

- (void)updateControlAction:(id)a3 withEffort:(int64_t)a4
{
  id v6;
  unint64_t dutyCyclingMethod;
  _DASControlEngine *v8;
  uint64_t v9;
  NSObject *log;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  int64_t v17;

  v6 = a3;
  if (a4 < 0)
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    v16 = 134217984;
    v17 = a4;
    v11 = "Effort less than 0 (%ld). Taking no action";
    v12 = log;
    v13 = 12;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    goto LABEL_33;
  }
  dutyCyclingMethod = self->_dutyCyclingMethod;
  if (!dutyCyclingMethod)
  {
    v14 = self->_log;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    LOWORD(v16) = 0;
    v11 = "Duty cycling method is disabled";
    v12 = v14;
    v13 = 2;
    goto LABEL_11;
  }
  if ((unint64_t)a4 >= 0x1F && !self->_initialMitigationInitiated)
  {
    if (self->_trialInitialAction < 0)
    {
      v8 = self;
      v9 = 1;
LABEL_24:
      -[_DASControlEngine invokeInitialActionWithValue:](v8, "invokeInitialActionWithValue:", v9);
      goto LABEL_33;
    }
LABEL_26:
    if (dutyCyclingMethod == 1)
    {
      -[_DASControlEngine executeSFIWithEffort:](self, "executeSFIWithEffort:", a4);
      if (a4)
      {
LABEL_30:
        self->_dutyCyclingInitiated = 1;
        goto LABEL_33;
      }
    }
    else
    {
      if (dutyCyclingMethod == 2)
        -[_DASControlEngine executeDutyCyclingWithEffort:](self, "executeDutyCyclingWithEffort:", a4);
      if (a4)
        goto LABEL_30;
    }
    self->_dutyCyclingInitiated = 0;
    goto LABEL_33;
  }
  if (!a4 && self->_initialMitigationInitiated)
  {
    if (self->_trialInitialAction < 0)
    {
      v8 = self;
      v9 = 0;
      goto LABEL_24;
    }
    if (!self->_dutyCyclingInitiated)
      goto LABEL_33;
LABEL_20:
    v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Less than minimum effort. Setting effort to 0", (uint8_t *)&v16, 2u);
    }
    a4 = 0;
    dutyCyclingMethod = self->_dutyCyclingMethod;
    goto LABEL_26;
  }
  if ((unint64_t)a4 > 0xA)
    goto LABEL_26;
  if (self->_dutyCyclingInitiated)
  {
    if ((unint64_t)a4 > 9)
    {
      a4 = 10;
      goto LABEL_26;
    }
    goto LABEL_20;
  }
LABEL_33:

}

- (void)invokeInitialActionWithValue:(int64_t)a3
{
  NSObject *log;
  int v6;
  int64_t v7;

  self->_initialMitigationInitiated = a3 != 0;
  if (notify_set_state(self->_startToken, a3) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    sub_1000E0B94();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Posting notifications for initial mitigation with value %ld", (uint8_t *)&v6, 0xCu);
  }
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.das.clas.startDutyCycling"), "UTF8String"));
}

- (void)resetInitialAction
{
  if (!self->_trialInitialActionAlways && self->_trialInitialAction < 0)
    -[_DASControlEngine invokeInitialActionWithValue:](self, "invokeInitialActionWithValue:", 0);
}

- (unint64_t)SFITimeFromEffort:(unint64_t)a3
{
  return (unint64_t)((double)a3 * 0.5 * self->_trialSFIIdleWindowParameter * 1000.0);
}

- (void)executeSFIWithEffort:(unint64_t)a3
{
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  NSObject *log;
  const __CFString *v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  unint64_t v13;

  v5 = +[_DASDeviceActivityPolicy isDeviceInUse:](_DASDeviceActivityPolicy, "isDeviceInUse:", self->_context);
  v6 = v5;
  if (!a3 || v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("Effort is 0");
      if (v6)
        v9 = CFSTR("Device in use");
      v12 = 138412290;
      v13 = (unint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "No SFI action. (%@)", (uint8_t *)&v12, 0xCu);
    }
    -[_DASControlEngine resetSFIEffort](self, "resetSFIEffort");
  }
  else if (self->_trialdisableSFI)
  {
    v7 = self->_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SFI action disabled", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    v10 = -[_DASControlEngine SFITimeFromEffort:](self, "SFITimeFromEffort:", a3);
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting SFI for %lu microseconds", (uint8_t *)&v12, 0xCu);
    }
    if (system_set_sfi_window(self->_trialSFIWindow) == -1
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E0C68();
    }
    if (sfi_set_class_offtime(1, v10) == -1
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E0C00();
    }
  }
}

- (void)resetSFIEffort
{
  NSObject *log;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (system_set_sfi_window(0) == -1)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      sub_1000E0D40(log, v4, v5, v6, v7, v8, v9, v10);
  }
  if (sfi_set_class_offtime(1, 0) == -1)
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000E0CD4(v11, v12, v13, v14, v15, v16, v17, v18);
  }
}

- (unint64_t)dutyCycleTimeFromEffort:(unint64_t)a3
{
  return 2000 * a3;
}

- (void)executeDutyCyclingWithEffort:(unint64_t)a3
{
  uint64_t v4;
  NSObject *log;
  int v6;
  uint64_t v7;

  v4 = -[_DASControlEngine dutyCycleTimeFromEffort:](self, "dutyCycleTimeFromEffort:", a3);
  if (notify_set_state(self->_timeToken, v4) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    sub_1000E0DAC();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Posting dutycycling notification for %lu microseconds", (uint8_t *)&v6, 0xCu);
  }
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.das.clas.dutyCyclingMicroSeconds"), "UTF8String"));
}

- (void)resetDutyCyclingEffort
{
  NSObject *log;
  uint8_t v4[16];

  if (notify_set_state(self->_timeToken, 0) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    sub_1000E0DAC();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Posting dutycycling notification for 0 microseconds", v4, 2u);
  }
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.das.clas.dutyCyclingMicroSeconds"), "UTF8String"));
}

- (id)startBatteryTemperatureLoop
{
  _DASBatteryTemperatureReader *v3;
  _DASBatteryTemperatureAnalyzer *v4;

  v3 = objc_opt_new(_DASBatteryTemperatureReader);
  v4 = -[_DASBatteryTemperatureAnalyzer initWithQueueLimit:reader:monitoringInterval:analyzeToMonitorRatio:]([_DASBatteryTemperatureAnalyzer alloc], "initWithQueueLimit:reader:monitoringInterval:analyzeToMonitorRatio:", 10, v3, 30, 2);
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_1000E0E18();
  -[_DASBatteryTemperatureAnalyzer start](v4, "start");

  return v4;
}

- (void)resetState
{
  -[_DASControlEngine resetSFIEffort](self, "resetSFIEffort");
  -[_DASControlEngine resetDutyCyclingEffort](self, "resetDutyCyclingEffort");
  -[_DASControlEngine resetInitialAction](self, "resetInitialAction");
  -[_DASControlEngine saveTLCState:](self, "saveTLCState:", 0);
  -[_DASControlEngine saveControlEffort:](self, "saveControlEffort:", 0);
  *(_WORD *)&self->_initialMitigationInitiated = 0;
}

- (void)resetAnalyticsState
{
  NSDate *currentDutyCycleStartTime;

  currentDutyCycleStartTime = self->_currentDutyCycleStartTime;
  self->_currentDutyCycleStartTime = 0;

  self->_dutyCycleDuration = 0.0;
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("dutyCycleDuration"));
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("controlEffortHistory"));
}

- (id)currentStatus
{
  void *v3;
  void *v4;
  _UNKNOWN **v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_dutyCycleDuration));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DutyCycleDuration"));

  if (self->_dutyCycleDuration <= 0.0)
    v5 = &off_10016E570;
  else
    v5 = &off_10016E558;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("EngagedDutyCycle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_trialTreatmentID, CFSTR("TreatmentID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_trialExperimentID, CFSTR("ExperimentID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_encounteredTLC));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("EncounteredTLC"));

  return v3;
}

- (void)recordSessionAnalytics
{
  id v3;
  NSObject *log;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032F50;
  v11[3] = &unk_10015DA30;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[_DASControlEngine currentStatus](self, "currentStatus"));
  v12 = v3;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.clas.pluginSession"), v11);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E0B30((uint64_t)v3, log, v5, v6, v7, v8, v9, v10);

}

- (void)setDutyCyclingInitiated:(BOOL)a3
{
  _BOOL8 v3;
  NSDate *v5;
  NSDate *currentDutyCycleStartTime;
  double v7;
  NSDate *v8;

  v3 = a3;
  if (a3)
  {
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    currentDutyCycleStartTime = self->_currentDutyCycleStartTime;
    self->_currentDutyCycleStartTime = v5;

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_currentDutyCycleStartTime, CFSTR("currentDutyCycleStartTime"));
  }
  else
  {
    -[NSDate timeIntervalSinceNow](self->_currentDutyCycleStartTime, "timeIntervalSinceNow");
    self->_dutyCycleDuration = self->_dutyCycleDuration - v7;
    -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("dutyCycleDuration"));
    v8 = self->_currentDutyCycleStartTime;
    self->_currentDutyCycleStartTime = 0;

    -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("currentDutyCycleStartTime"));
  }
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v3, CFSTR("dutyCycleInitiated"));
}

- (void)setInitialMitigationInitiated:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", a3, CFSTR("initialActionInitiated"));
}

- (id)startChargeRateLoop
{
  _DASChargeRateReader *v3;
  _DASChargeRateAnalyzer *v4;

  v3 = objc_opt_new(_DASChargeRateReader);
  v4 = -[_DASChargeRateAnalyzer initWithQueueLimit:reader:monitoringInterval:analyzeToMonitorRatio:]([_DASChargeRateAnalyzer alloc], "initWithQueueLimit:reader:monitoringInterval:analyzeToMonitorRatio:", 10, v3, 30, 2);
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_1000E0E44();
  -[_DASChargeRateAnalyzer start](v4, "start");

  return v4;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)actionToAnalyzers
{
  return self->_actionToAnalyzers;
}

- (void)setActionToAnalyzers:(id)a3
{
  objc_storeStrong((id *)&self->_actionToAnalyzers, a3);
}

- (NSMutableDictionary)actionToTimers
{
  return self->_actionToTimers;
}

- (void)setActionToTimers:(id)a3
{
  objc_storeStrong((id *)&self->_actionToTimers, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (int)startToken
{
  return self->_startToken;
}

- (void)setStartToken:(int)a3
{
  self->_startToken = a3;
}

- (int)timeToken
{
  return self->_timeToken;
}

- (void)setTimeToken:(int)a3
{
  self->_timeToken = a3;
}

- (BOOL)initialMitigationInitiated
{
  return self->_initialMitigationInitiated;
}

- (BOOL)dutyCyclingInitiated
{
  return self->_dutyCyclingInitiated;
}

- (BOOL)encounteredTLC
{
  return self->_encounteredTLC;
}

- (void)setEncounteredTLC:(BOOL)a3
{
  self->_encounteredTLC = a3;
}

- (NSDate)encounteredTLCDate
{
  return self->_encounteredTLCDate;
}

- (void)setEncounteredTLCDate:(id)a3
{
  objc_storeStrong((id *)&self->_encounteredTLCDate, a3);
}

- (int64_t)lastSavedTLC
{
  return self->_lastSavedTLC;
}

- (void)setLastSavedTLC:(int64_t)a3
{
  self->_lastSavedTLC = a3;
}

- (int64_t)lastSavedEffort
{
  return self->_lastSavedEffort;
}

- (void)setLastSavedEffort:(int64_t)a3
{
  self->_lastSavedEffort = a3;
}

- (OS_dispatch_source)analyzerTimer
{
  return self->_analyzerTimer;
}

- (void)setAnalyzerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_analyzerTimer, a3);
}

- (unint64_t)dutyCyclingMethod
{
  return self->_dutyCyclingMethod;
}

- (void)setDutyCyclingMethod:(unint64_t)a3
{
  self->_dutyCyclingMethod = a3;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSDate)currentDutyCycleStartTime
{
  return self->_currentDutyCycleStartTime;
}

- (void)setCurrentDutyCycleStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentDutyCycleStartTime, a3);
}

- (double)dutyCycleDuration
{
  return self->_dutyCycleDuration;
}

- (void)setDutyCycleDuration:(double)a3
{
  self->_dutyCycleDuration = a3;
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTrialTrackingID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)trialTreatmentID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTrialTreatmentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)trialExperimentID
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTrialExperimentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int64_t)trialInitialAction
{
  return self->_trialInitialAction;
}

- (void)setTrialInitialAction:(int64_t)a3
{
  self->_trialInitialAction = a3;
}

- (BOOL)trialInitialActionAlways
{
  return self->_trialInitialActionAlways;
}

- (void)setTrialInitialActionAlways:(BOOL)a3
{
  self->_trialInitialActionAlways = a3;
}

- (BOOL)trialdisableSFI
{
  return self->_trialdisableSFI;
}

- (void)setTrialdisableSFI:(BOOL)a3
{
  self->_trialdisableSFI = a3;
}

- (int64_t)trialSFIWindow
{
  return self->_trialSFIWindow;
}

- (void)setTrialSFIWindow:(int64_t)a3
{
  self->_trialSFIWindow = a3;
}

- (double)trialSFIIdleWindowParameter
{
  return self->_trialSFIIdleWindowParameter;
}

- (void)setTrialSFIIdleWindowParameter:(double)a3
{
  self->_trialSFIIdleWindowParameter = a3;
}

- (_DKKnowledgeSaving)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSMutableDictionary)controlEffortHistory
{
  return self->_controlEffortHistory;
}

- (void)setControlEffortHistory:(id)a3
{
  objc_storeStrong((id *)&self->_controlEffortHistory, a3);
}

- (_DASTrialManager)trialManager
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
  objc_storeStrong((id *)&self->_controlEffortHistory, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_currentDutyCycleStartTime, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_analyzerTimer, 0);
  objc_storeStrong((id *)&self->_encounteredTLCDate, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_actionToTimers, 0);
  objc_storeStrong((id *)&self->_actionToAnalyzers, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
}

@end
