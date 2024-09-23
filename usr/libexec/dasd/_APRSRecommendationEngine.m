@implementation _APRSRecommendationEngine

- (void)handleStateTransitionForProcess:(id)a3 withUpdate:(id)a4
{
  id v6;
  _APRSRecommendationEngine *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSMutableDictionary *runningApps;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v21 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "state"));
  v11 = objc_msgSend(v10, "isRunning");

  runningApps = v7->_runningApps;
  if ((v11 & 1) == 0)
  {
    -[NSMutableDictionary removeObjectForKey:](runningApps, "removeObjectForKey:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v9));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleExecutable"));

    if (v17)
      -[NSMutableDictionary removeObjectForKey:](v7->_foregroundedApps, "removeObjectForKey:", v17);
    if (byte_1001ABB50)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](_APRSPrewarmInterface, "sharedInstance"));
      v20 = objc_msgSend(v19, "prewarmLaunchAppFromBundleID:", v9);

    }
    goto LABEL_8;
  }
  -[NSMutableDictionary setObject:forKey:](runningApps, "setObject:forKey:", v21, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "state"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endowmentNamespaces"));
  v15 = objc_msgSend(v14, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v9));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleExecutable"));

    -[NSMutableDictionary setObject:forKey:](v7->_foregroundedApps, "setObject:forKey:", v21, v17);
LABEL_8:

  }
  objc_sync_exit(v7);

}

- (NSString)name
{
  return (NSString *)CFSTR("recommendationEngine1.0");
}

- (double)version
{
  return 1.0;
}

- (_APRSRecommendationEngine)init
{
  _APRSRecommendationEngine *v2;
  _APRSRecommendationEngine *v3;
  os_log_t v4;
  OS_os_log *log;
  uint64_t v6;
  _APRSFreezerRecommendation *freezerRecommender;
  uint64_t v8;
  _APRSPrewarmRecommendation *prewarmRecommender;
  id v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *foregroundedApps;
  uint64_t v14;
  NSMutableDictionary *runningApps;
  _APRSRecommendationEngine *v16;
  id v17;
  uint64_t v18;
  RBSProcessMonitor *appMonitor;
  _QWORD v21[4];
  id v22;
  _APRSRecommendationEngine *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_APRSRecommendationEngine;
  v2 = -[_APRSRecommendationEngine init](&v24, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_freezerDisabled = 0;
    v4 = os_log_create("com.apple.aprs", "appResume.RecomEngine");
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[_APRSFreezerRecommendation sharedInstance](_APRSFreezerRecommendation, "sharedInstance"));
    freezerRecommender = v3->_freezerRecommender;
    v3->_freezerRecommender = (_APRSFreezerRecommendation *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[_APRSPrewarmRecommendation sharedInstance](_APRSPrewarmRecommendation, "sharedInstance"));
    prewarmRecommender = v3->_prewarmRecommender;
    v3->_prewarmRecommender = (_APRSPrewarmRecommendation *)v8;

    -[_APRSRecommendationEngine registerForTrial](v3, "registerForTrial");
    -[_APRSRecommendationEngine updateTrialParameters](v3, "updateTrialParameters");
    v10 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    byte_1001ABB50 = objc_msgSend(v10, "BOOLForKey:", CFSTR("prewarmOnAppDeath"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
    objc_msgSend(v11, "setValues:", 1);
    objc_msgSend(v11, "setEndowmentNamespaces:", &off_10016F4B8);
    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    foregroundedApps = v3->_foregroundedApps;
    v3->_foregroundedApps = (NSMutableDictionary *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    runningApps = v3->_runningApps;
    v3->_runningApps = (NSMutableDictionary *)v14;

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10007FCDC;
    v21[3] = &unk_10015EF18;
    v22 = v11;
    v16 = v3;
    v23 = v16;
    v17 = v11;
    v18 = objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v21));
    appMonitor = v16->_appMonitor;
    v16->_appMonitor = (RBSProcessMonitor *)v18;

  }
  return v3;
}

- (BOOL)wasAppForegrounded:(id)a3
{
  id v4;
  _APRSRecommendationEngine *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_foregroundedApps, "allKeys"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)isAppRunning:(id)a3
{
  id v4;
  _APRSRecommendationEngine *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_runningApps, "allKeys"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  objc_sync_exit(v5);
  return v7;
}

+ (id)sharedInstance
{
  if (qword_1001ABB60 != -1)
    dispatch_once(&qword_1001ABB60, &stru_10015EF38);
  return (id)qword_1001ABB58;
}

- (void)evaluateFreezerRecommendations
{
  -[_APRSFreezerRecommendation evaluateFreezerRecommendations](self->_freezerRecommender, "evaluateFreezerRecommendations");
}

- (void)evaluatePrewarmRecommendations
{
  -[_APRSPrewarmRecommendation evaluateRecommendations](self->_prewarmRecommender, "evaluateRecommendations");
}

- (void)updateCurrentRecommendations
{
  NSArray *freezerRecommendations;
  NSArray *v4;
  NSArray *prewarmRecommendations;
  NSArray *v6;

  if (self->_freezerDisabled)
  {
    freezerRecommendations = self->_freezerRecommendations;
    self->_freezerRecommendations = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[_APRSFreezerRecommendation freezerRecommendations](self->_freezerRecommender, "freezerRecommendations"));
    freezerRecommendations = self->_freezerRecommendations;
    self->_freezerRecommendations = v4;
  }

  if (self->_prewarmDisabled)
  {
    prewarmRecommendations = self->_prewarmRecommendations;
    self->_prewarmRecommendations = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[_APRSPrewarmRecommendation recommendations](self->_prewarmRecommender, "recommendations"));
    prewarmRecommendations = self->_prewarmRecommendations;
    self->_prewarmRecommendations = v6;
  }

}

- (void)registerForTrial
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  objc_msgSend(v3, "addDelegate:", self);

}

- (void)updateTrialParameters
{
  void *v3;
  void *v4;
  NSObject *log;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  unsigned int v12;
  NSObject *v13;
  _BOOL4 freezerDisabled;
  _BOOL4 prewarmDisabled;
  int v16;
  unsigned int v17;
  __int16 v18;
  _BOOL4 v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "factorWithName:", off_1001AA6B0));
  log = self->_log;
  v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = log;
      v16 = 67109120;
      v17 = objc_msgSend(v4, "BOOLeanValue");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trial: freezerDisabled set to %d", (uint8_t *)&v16, 8u);

    }
    self->_freezerDisabled = objc_msgSend(v4, "BOOLeanValue");
  }
  else if (v6)
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load freezerDisabled", (uint8_t *)&v16, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "factorWithName:", off_1001AA6B8));
  v9 = self->_log;
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      v12 = objc_msgSend(v8, "BOOLeanValue");
      v16 = 67109120;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trial: prewarmDisabled set to %d", (uint8_t *)&v16, 8u);

    }
    self->_prewarmDisabled = objc_msgSend(v8, "BOOLeanValue");
  }
  else if (v10)
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load prewarmDisabled", (uint8_t *)&v16, 2u);
  }
  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    freezerDisabled = self->_freezerDisabled;
    prewarmDisabled = self->_prewarmDisabled;
    v16 = 67109376;
    v17 = freezerDisabled;
    v18 = 1024;
    v19 = prewarmDisabled;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Freezer Disabled: %d, Prewarm Disabled: %d", (uint8_t *)&v16, 0xEu);
  }

}

- (RBSProcessMonitor)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_appMonitor, a3);
}

- (_APRSFreezerRecommendation)freezerRecommender
{
  return self->_freezerRecommender;
}

- (void)setFreezerRecommender:(id)a3
{
  objc_storeStrong((id *)&self->_freezerRecommender, a3);
}

- (NSArray)freezerRecommendations
{
  return self->_freezerRecommendations;
}

- (void)setFreezerRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_freezerRecommendations, a3);
}

- (NSArray)freezerDemotionRecommendations
{
  return self->_freezerDemotionRecommendations;
}

- (void)setFreezerDemotionRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_freezerDemotionRecommendations, a3);
}

- (_APRSPrewarmRecommendation)prewarmRecommender
{
  return self->_prewarmRecommender;
}

- (void)setPrewarmRecommender:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmRecommender, a3);
}

- (NSArray)prewarmRecommendations
{
  return self->_prewarmRecommendations;
}

- (void)setPrewarmRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmRecommendations, a3);
}

- (NSArray)dockingRecommendations
{
  return self->_dockingRecommendations;
}

- (void)setDockingRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_dockingRecommendations, a3);
}

- (NSArray)jetsamDemotionRecommendations
{
  return self->_jetsamDemotionRecommendations;
}

- (void)setJetsamDemotionRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_jetsamDemotionRecommendations, a3);
}

- (NSMutableDictionary)runningApps
{
  return self->_runningApps;
}

- (void)setRunningApps:(id)a3
{
  objc_storeStrong((id *)&self->_runningApps, a3);
}

- (NSMutableDictionary)foregroundedApps
{
  return self->_foregroundedApps;
}

- (void)setForegroundedApps:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundedApps, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (BOOL)freezerDisabled
{
  return self->_freezerDisabled;
}

- (void)setFreezerDisabled:(BOOL)a3
{
  self->_freezerDisabled = a3;
}

- (BOOL)prewarmDisabled
{
  return self->_prewarmDisabled;
}

- (void)setPrewarmDisabled:(BOOL)a3
{
  self->_prewarmDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_foregroundedApps, 0);
  objc_storeStrong((id *)&self->_runningApps, 0);
  objc_storeStrong((id *)&self->_jetsamDemotionRecommendations, 0);
  objc_storeStrong((id *)&self->_dockingRecommendations, 0);
  objc_storeStrong((id *)&self->_prewarmRecommendations, 0);
  objc_storeStrong((id *)&self->_prewarmRecommender, 0);
  objc_storeStrong((id *)&self->_freezerDemotionRecommendations, 0);
  objc_storeStrong((id *)&self->_freezerRecommendations, 0);
  objc_storeStrong((id *)&self->_freezerRecommender, 0);
  objc_storeStrong((id *)&self->_appMonitor, 0);
}

@end
