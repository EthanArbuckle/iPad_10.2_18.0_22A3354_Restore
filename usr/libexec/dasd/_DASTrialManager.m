@implementation _DASTrialManager

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  v2 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)qword_1001AB4C0;
  qword_1001AB4C0 = v2;

  dword_1001AB4C8 = 0;
}

+ (_DASTrialManager)sharedInstance
{
  if (qword_1001AB4D0 != -1)
    dispatch_once(&qword_1001AB4D0, &stru_10015D968);
  return (_DASTrialManager *)(id)qword_1001AB4D8;
}

+ (id)sharedInstanceForNamespace:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  _DASTrialManager *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001AB4C8);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)qword_1001AB4C0;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "namespace", (_QWORD)v14));
      v11 = objc_msgSend(v10, "isEqual:", v3);

      if ((v11 & 1) != 0)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (v12)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v12 = -[_DASTrialManager initWithNamespaceName:]([_DASTrialManager alloc], "initWithNamespaceName:", v3);
  objc_msgSend((id)qword_1001AB4C0, "addObject:", v12);
LABEL_12:
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001AB4C8);

  return v12;
}

- (_DASTrialManager)initWithNamespaceName:(id)a3
{
  id v5;
  _DASTrialManager *v6;
  _DASTrialManager *v7;
  uint64_t v8;
  OS_os_log *log;
  uint64_t v10;
  TRIClient *trialClient;
  NSObject *v12;
  TRIClient *v13;
  uint64_t v14;
  NSMutableArray *delegates;
  NSUserDefaults *v16;
  NSUserDefaults *defaults;
  TRIClient *v18;
  id v19;
  dispatch_queue_global_t global_queue;
  NSObject *v21;
  _QWORD v23[4];
  _DASTrialManager *v24;
  _QWORD v25[4];
  id v26;
  objc_super v27;
  uint8_t buf[4];
  TRIClient *v29;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_DASTrialManager;
  v6 = -[_DASTrialManager init](&v27, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_namespace, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("TrialManager")));
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 222));
    trialClient = v7->_trialClient;
    v7->_trialClient = (TRIClient *)v10;

    v12 = v7->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v7->_trialClient;
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
    }
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    delegates = v7->_delegates;
    v7->_delegates = (NSMutableArray *)v14;

    v16 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler.trial"));
    defaults = v7->_defaults;
    v7->_defaults = v16;

    objc_initWeak((id *)buf, v7);
    v18 = v7->_trialClient;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100030000;
    v25[3] = &unk_10015D990;
    objc_copyWeak(&v26, (id *)buf);
    v19 = -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v18, "addUpdateHandlerForNamespaceName:usingBlock:", v5, v25);
    -[_DASTrialManager updateFactors](v7, "updateFactors");
    -[_DASTrialManager updateKernelWithDASIdentifiers](v7, "updateKernelWithDASIdentifiers");
    global_queue = dispatch_get_global_queue(-32768, 0);
    v21 = objc_claimAutoreleasedReturnValue(global_queue);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100030094;
    v23[3] = &unk_10015D9B8;
    v24 = v7;
    notify_register_dispatch("com.apple.dasd.trial", &v7->_token, v21, v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

  return v7;
}

- (void)updateFactors
{
  uint64_t v3;
  NSString *v4;
  NSString *v5;
  int deploymentID;
  NSObject *log;
  NSString *experimentID;
  NSString *treatmentID;
  int v10;
  const char *v11;
  NSString *v12;
  NSString *v13;
  int v14;
  unsigned int v15;
  _BOOL4 v16;
  NSString *v17;
  NSString *v18;
  int v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  NSObject *v26;
  dispatch_queue_global_t global_queue;
  NSObject *v28;
  os_unfair_lock_t lock;
  NSString *v30;
  NSString *v31;
  void *v32;
  _QWORD block[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  NSString *v40;
  __int16 v41;
  NSString *v42;
  __int16 v43;
  int v44;

  -[TRIClient refresh](self->_trialClient, "refresh");
  v3 = objc_claimAutoreleasedReturnValue(-[TRIClient experimentIdentifiersWithNamespaceName:](self->_trialClient, "experimentIdentifiersWithNamespaceName:", self->_namespace));
  v4 = self->_experimentID;
  v5 = self->_treatmentID;
  deploymentID = self->_deploymentID;
  v32 = (void *)v3;
  if (-[_DASTrialManager handleTrialStart:](self, "handleTrialStart:", v3))
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    treatmentID = self->_treatmentID;
    experimentID = self->_experimentID;
    v10 = self->_deploymentID;
    *(_DWORD *)buf = 138412802;
    v40 = experimentID;
    v41 = 2112;
    v42 = treatmentID;
    v43 = 1024;
    v44 = v10;
    v11 = "Trial Experiment Started, experiment: %@, treatment: %@, deployment: %d";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, v11, buf, 0x1Cu);
    goto LABEL_14;
  }
  if (-[_DASTrialManager handleTrialUpdate:](self, "handleTrialUpdate:", v3))
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    v13 = self->_treatmentID;
    v12 = self->_experimentID;
    v14 = self->_deploymentID;
    *(_DWORD *)buf = 138412802;
    v40 = v12;
    v41 = 2112;
    v42 = v13;
    v43 = 1024;
    v44 = v14;
    v11 = "Trial Experiment Updated, experiment: %@, treatment: %@, deployment: %d";
    goto LABEL_13;
  }
  if (-[_DASTrialManager handleTrialEnd:](self, "handleTrialEnd:", v3))
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    *(_DWORD *)buf = 138412802;
    v40 = v4;
    v41 = 2112;
    v42 = v5;
    v43 = 1024;
    v44 = deploymentID;
    v11 = "Trial Experiment Ended, experiment: %@, treatment: %@, deployment: %d";
    goto LABEL_13;
  }
  v15 = -[_DASTrialManager handleTrialContinuation:](self, "handleTrialContinuation:", v3);
  log = self->_log;
  v16 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (!v16)
      goto LABEL_14;
    v18 = self->_treatmentID;
    v17 = self->_experimentID;
    v19 = self->_deploymentID;
    *(_DWORD *)buf = 138412802;
    v40 = v17;
    v41 = 2112;
    v42 = v18;
    v43 = 1024;
    v44 = v19;
    v11 = "Trial Experiment Found, experiment: %@, treatment: %@, deployment: %d";
    goto LABEL_13;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "No Trial Experiments Found", buf, 2u);
  }
  -[_DASTrialManager clear](self, "clear");
LABEL_14:
  v30 = v5;
  v31 = v4;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_delegates;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Calling out Trial handler blocks", buf, 2u);
        }
        global_queue = dispatch_get_global_queue(-2, 0);
        v28 = objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10003049C;
        block[3] = &unk_10015D558;
        block[4] = v25;
        block[5] = self;
        dispatch_async(v28, block);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16, lock, v30, v31, v32);
    }
    while (v22);
  }

  os_unfair_lock_unlock(lock);
}

- (id)factorWithName:(id)a3
{
  return -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, self->_namespace);
}

- (void)addDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSMutableArray addObject:](self->_delegates, "addObject:", v5);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)updateKernelWithDASIdentifiers
{
  NSString *treatmentID;
  const char *v4;
  size_t v5;
  const char *v6;
  size_t v7;
  NSObject *log;
  int v9;
  _OWORD v10[4];
  __int128 v11;

  treatmentID = self->_treatmentID;
  if (treatmentID)
  {
    if (self->_experimentID)
    {
      v11 = 0u;
      memset(v10, 0, sizeof(v10));
      v9 = 1;
      v4 = -[NSString UTF8String](treatmentID, "UTF8String");
      v5 = strlen(-[NSString UTF8String](self->_treatmentID, "UTF8String"));
      __strncpy_chk(v10, v4, v5 + 1, 37);
      v6 = -[NSString UTF8String](self->_experimentID, "UTF8String");
      v7 = strlen(-[NSString UTF8String](self->_experimentID, "UTF8String"));
      __strncpy_chk((char *)&v10[2] + 5, v6, v7 + 1, 37);
      HIDWORD(v11) = self->_deploymentID;
      if (!memorystatus_control(20, 0, 3, &v9, 84))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          sub_1000E0964(log);
      }
    }
  }
}

- (BOOL)handleTrialStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSString *v10;
  NSString *treatmentID;
  NSString *v12;
  NSString *experimentID;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = v4;
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experimentId")), v6, v6)
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager readFromDefaults](self, "readFromDefaults")),
        v7,
        !v7))
  {
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "treatmentId"));
    treatmentID = self->_treatmentID;
    self->_treatmentID = v10;

    v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "experimentId"));
    experimentID = self->_experimentID;
    self->_experimentID = v12;

    self->_deploymentID = objc_msgSend(v5, "deploymentId");
    v14 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", self->_experimentID, CFSTR("trialExperimentId"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", self->_treatmentID, CFSTR("trialTreatmentId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_deploymentID));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("trialDeploymentId"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("trialStartDate"));

    -[_DASTrialManager saveToDefaults:](self, "saveToDefaults:", v14);
    -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v14);
    -[_DASTrialManager startTimer](self, "startTimer");

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)handleTrialUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  NSString *v11;
  NSString *treatmentID;
  NSString *v13;
  NSString *experimentID;
  id v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experimentId")), v6, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager readFromDefaults](self, "readFromDefaults"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (v8 && !-[_DASTrialManager matches:withCache:](self, "matches:withCache:", v5, v8))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("trialEndDate"));

      -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v8);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "treatmentId"));
      treatmentID = self->_treatmentID;
      self->_treatmentID = v11;

      v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "experimentId"));
      experimentID = self->_experimentID;
      self->_experimentID = v13;

      self->_deploymentID = objc_msgSend(v5, "deploymentId");
      v15 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", self->_experimentID, CFSTR("trialExperimentId"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", self->_treatmentID, CFSTR("trialTreatmentId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_deploymentID));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("trialDeploymentId"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("trialStartDate"));

      -[_DASTrialManager saveToDefaults:](self, "saveToDefaults:", v15);
      -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v15);

      v9 = 1;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)handleTrialEnd:(id)a3
{
  BOOL v3;
  void *v5;
  id v6;
  void *v7;

  if (a3)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager readFromDefaults](self, "readFromDefaults"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v3 = v6 != 0;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("trialEndDate"));

    -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v6);
    -[_DASTrialManager clear](self, "clear");
  }

  return v3;
}

- (BOOL)handleTrialContinuation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSString *v9;
  NSString *treatmentID;
  NSString *v11;
  NSString *experimentID;
  BOOL v13;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experimentId")), v6, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager readFromDefaults](self, "readFromDefaults"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (v8 && -[_DASTrialManager matches:withCache:](self, "matches:withCache:", v5, v8))
    {
      v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "treatmentId"));
      treatmentID = self->_treatmentID;
      self->_treatmentID = v9;

      v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "experimentId"));
      experimentID = self->_experimentID;
      self->_experimentID = v11;

      self->_deploymentID = objc_msgSend(v5, "deploymentId");
      -[_DASTrialManager sendToPowerLog:](self, "sendToPowerLog:", v8);
      -[_DASTrialManager startTimer](self, "startTimer");
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)readFromDefaults
{
  return -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("trialDictionary"));
}

- (void)saveToDefaults:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v5, CFSTR("trialDictionary"));
  else
    -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("trialDictionary"));
  -[NSUserDefaults synchronize](self->_defaults, "synchronize");

}

- (BOOL)matches:(id)a3 withCache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "experimentId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trialExperimentId")));
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "treatmentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trialTreatmentId")));
    if (objc_msgSend(v9, "isEqualToString:", v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "deploymentId")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trialDeploymentId")));
      v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)startTimer
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *timer;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_timer)
  {
    global_queue = dispatch_get_global_queue(-32768, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
    timer = self->_timer;
    self->_timer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, 0x4E94914F0000uLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    v7 = self->_timer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100030DA4;
    v8[3] = &unk_10015D9E0;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_activate((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)clear
{
  NSObject *timer;
  OS_dispatch_source *v4;
  NSString *treatmentID;
  NSString *experimentID;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  treatmentID = self->_treatmentID;
  self->_treatmentID = 0;

  experimentID = self->_experimentID;
  self->_experimentID = 0;

  self->_deploymentID = 0;
  -[_DASTrialManager saveToDefaults:](self, "saveToDefaults:", 0);
}

- (void)sendToPowerLog:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("powerlog")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1000E09A4((uint64_t)v4, v5);

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialStartDate")));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialStartDate")));
      objc_msgSend(v8, "timeIntervalSinceNow");
      v10 = v9;

      if (v10 > -1209600.0)
        PLLogRegisteredEvent(70, CFSTR("DASTrial"), v4, 0);
    }
  }

}

- (NSString)treatmentID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTreatmentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)experimentID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExperimentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(int)a3
{
  self->_deploymentID = a3;
}

- (NSString)namespace
{
  return self->_namespace;
}

- (void)setNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_namespace, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
}

@end
