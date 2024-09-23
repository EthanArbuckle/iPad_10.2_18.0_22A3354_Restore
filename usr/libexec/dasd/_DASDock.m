@implementation _DASDock

- (void)handleStateTransitionForProcess:(id)a3 withUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  if (v9 && !-[NSSet containsObject:](self->_excludedApplications, "containsObject:", v9))
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E8BAC();
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "state"));
    -[_DASDock recordState:forProcess:associatedWithApplication:](self, "recordState:forProcess:associatedWithApplication:", v10, v6, v9);
    if (objc_msgSend(v10, "taskState") == 3)
      -[_DASDock updatePolicy](self, "updatePolicy");
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E8B48();

  }
}

- (void)recordState:(id)a3 forProcess:(id)a4 associatedWithApplication:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  NSMutableDictionary *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  _DASDock *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *applicationActivationCounts;
  _UNKNOWN **v21;
  NSMutableDictionary *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isRunning") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endowmentNamespaces"));
    v12 = objc_msgSend(v11, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    if (v12)
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
        sub_1000E8C10();
      v13 = self->_applicationProcessHandles;
      objc_sync_enter(v13);
      v14 = objc_msgSend(v9, "pid");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_applicationProcessHandles, "objectForKey:", v10));
      v16 = objc_msgSend(v15, "pid");

      if (v14 != v16)
      {
        -[NSMutableDictionary setObject:forKey:](self->_applicationProcessHandles, "setObject:forKey:", v9, v10);
        -[_DASDock persistApplicationProcessHandles](self, "persistApplicationProcessHandles");
      }
      objc_sync_exit(v13);

      v17 = self;
      objc_sync_enter(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v17->_applicationActivationCounts, "objectForKey:", v10));
      v19 = v18;
      applicationActivationCounts = v17->_applicationActivationCounts;
      if (v18)
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v18, "intValue") + 1));
      else
        v21 = &off_10016ECC0;
      -[NSMutableDictionary setObject:forKey:](applicationActivationCounts, "setObject:forKey:", v21, v10);
      if (v19)

      objc_sync_exit(v17);
    }
    if (objc_msgSend(v8, "taskState") == 3)
      -[_DASDock refreshLedgerInformationForApplicationProcesses](self, "refreshLedgerInformationForApplicationProcesses");
  }
  else
  {
    v22 = self->_applicationProcessHandles;
    objc_sync_enter(v22);
    -[NSMutableDictionary removeObjectForKey:](self->_applicationProcessHandles, "removeObjectForKey:", v10);
    -[_DASDock persistApplicationProcessHandles](self, "persistApplicationProcessHandles");
    objc_sync_exit(v22);

  }
}

- (void)persistApplicationProcessHandles
{
  id v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *applicationProcessHandles;
  NSUserDefaults *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = self->_applicationProcessHandles;
  objc_sync_enter(v4);
  applicationProcessHandles = self->_applicationProcessHandles;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006F1C;
  v8[3] = &unk_10015F948;
  v7 = v3;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](applicationProcessHandles, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_sync_exit(v4);
  v6 = self->_persistence;
  objc_sync_enter(v6);
  -[NSUserDefaults setObject:forKey:](self->_persistence, "setObject:forKey:", v7, CFSTR("applicationProcessIdentifiers"));
  objc_sync_exit(v6);

}

+ (id)dockManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009E424;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABCB0 != -1)
    dispatch_once(&qword_1001ABCB0, block);
  return (id)qword_1001ABCB8;
}

- (_DASDock)init
{
  _DASDock *v2;
  _DASDock *v3;
  os_log_t v4;
  OS_os_log *logger;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v9;
  uint64_t v10;
  NSDate *lastPolicyUpdateTimestamp;
  uint64_t v12;
  NSDate *lastActivationInformationUpdateTimestamp;
  NSSet *v14;
  NSSet *dockedApplications;
  NSMutableDictionary *v16;
  NSMutableDictionary *applicationActivationCounts;
  NSMutableDictionary *v18;
  NSMutableDictionary *activeDockAssertions;
  NSSet *v20;
  NSSet *excludedApplications;
  NSSet *v22;
  NSSet *springboardVisibleApplications;
  NSDictionary *v24;
  NSDictionary *meanLaunchVersusResumeTimeDeltas;
  NSMutableDictionary *v26;
  NSMutableDictionary *applicationProcessHandles;
  NSMutableDictionary *v28;
  NSMutableDictionary *lastPhysFootprintObservedForApplication;
  NSMutableDictionary *v30;
  NSMutableDictionary *lastFrozenFootprintObservedForApplication;
  uint64_t v32;
  RBSDomainAttribute *domainAttribute;
  NSUserDefaults *v34;
  NSUserDefaults *persistence;
  _DASDataProtectionStateMonitor *v36;
  _DASDataProtectionStateMonitor *lockStateMonitor;
  objc_super v38;
  uint8_t buf[4];
  const __CFString *v40;

  v38.receiver = self;
  v38.super_class = (Class)_DASDock;
  v2 = -[_DASDock init](&v38, "init");
  v3 = v2;
  if (v2)
  {
    v2->_dockDisabled = 0;
    v4 = os_log_create("com.apple.aprs", "DASDock");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v4;

    -[_DASDock registerForTrial](v3, "registerForTrial");
    -[_DASDock updateTrialParameters](v3, "updateTrialParameters");
    if ((_os_feature_enabled_impl("DuetActivityScheduler", "run_without_docking") & 1) != 0
      || (_os_feature_enabled_impl("DAS", "run_without_docking") & 1) != 0
      || v3->_dockDisabled)
    {
      v6 = v3->_logger;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (v3->_dockDisabled)
          v7 = CFSTR("Trial");
        else
          v7 = CFSTR("Feature flag");
        *(_DWORD *)buf = 138412290;
        v40 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DASDock disabled by %@.", buf, 0xCu);
      }
    }
    else
    {
      v9 = v3->_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initializing DASDock...", buf, 2u);
      }
      *(_QWORD *)&v3->_maxDockCapacity = 0x7A12000000000;
      -[_DASDock configureMaximumDockCapacity](v3, "configureMaximumDockCapacity");
      v10 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
      lastPolicyUpdateTimestamp = v3->_lastPolicyUpdateTimestamp;
      v3->_lastPolicyUpdateTimestamp = (NSDate *)v10;

      v12 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
      lastActivationInformationUpdateTimestamp = v3->_lastActivationInformationUpdateTimestamp;
      v3->_lastActivationInformationUpdateTimestamp = (NSDate *)v12;

      v14 = (NSSet *)objc_alloc_init((Class)NSSet);
      dockedApplications = v3->_dockedApplications;
      v3->_dockedApplications = v14;

      v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      applicationActivationCounts = v3->_applicationActivationCounts;
      v3->_applicationActivationCounts = v16;

      v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      activeDockAssertions = v3->_activeDockAssertions;
      v3->_activeDockAssertions = v18;

      v20 = (NSSet *)objc_alloc_init((Class)NSSet);
      excludedApplications = v3->_excludedApplications;
      v3->_excludedApplications = v20;

      -[_DASDock setDefaultExcludedApplications](v3, "setDefaultExcludedApplications");
      v22 = (NSSet *)objc_alloc_init((Class)NSSet);
      springboardVisibleApplications = v3->_springboardVisibleApplications;
      v3->_springboardVisibleApplications = v22;

      -[_DASDock refreshApplicationSpringboardVisibility](v3, "refreshApplicationSpringboardVisibility");
      v24 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
      meanLaunchVersusResumeTimeDeltas = v3->_meanLaunchVersusResumeTimeDeltas;
      v3->_meanLaunchVersusResumeTimeDeltas = v24;

      v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      applicationProcessHandles = v3->_applicationProcessHandles;
      v3->_applicationProcessHandles = v26;

      v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lastPhysFootprintObservedForApplication = v3->_lastPhysFootprintObservedForApplication;
      v3->_lastPhysFootprintObservedForApplication = v28;

      v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lastFrozenFootprintObservedForApplication = v3->_lastFrozenFootprintObservedForApplication;
      v3->_lastFrozenFootprintObservedForApplication = v30;

      v32 = objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.dasd"), CFSTR("DockApp")));
      domainAttribute = v3->_domainAttribute;
      v3->_domainAttribute = (RBSDomainAttribute *)v32;

      -[_DASDock initializeLedgerIndices](v3, "initializeLedgerIndices");
      v34 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.dock.persistence"));
      persistence = v3->_persistence;
      v3->_persistence = v34;

      -[_DASDock restoreApplicationProcessHandles](v3, "restoreApplicationProcessHandles");
      -[_DASDock initProcessMonitorForDockedApplications](v3, "initProcessMonitorForDockedApplications");
      v36 = objc_opt_new(_DASDataProtectionStateMonitor);
      lockStateMonitor = v3->_lockStateMonitor;
      v3->_lockStateMonitor = v36;

      -[_DASDock setClassCUnlockMonitor](v3, "setClassCUnlockMonitor");
    }
  }
  return v3;
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
  NSObject *logger;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  double v13;
  double v14;
  int v15;
  uint64_t v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "factorWithName:", CFSTR("APRS_DockDisabled")));
  logger = self->_logger;
  v6 = os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = logger;
      v15 = 67109120;
      LODWORD(v16) = objc_msgSend(v4, "BOOLeanValue");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trial: dockDisabled set to %d", (uint8_t *)&v15, 8u);

    }
    self->_dockDisabled = objc_msgSend(v4, "BOOLeanValue");
  }
  else if (v6)
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load dockDisabled", (uint8_t *)&v15, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "factorWithName:", CFSTR("APRS_DockCapacityLevel")));
  v9 = self->_logger;
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      objc_msgSend(v8, "doubleValue");
      v15 = 134217984;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trial: dockCapacityLevel set to %f", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(v8, "doubleValue");
    v14 = v13;
  }
  else
  {
    v14 = 10.0;
    if (v10)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load dockCapacityLevel", (uint8_t *)&v15, 2u);
    }
  }
  self->_dockCapacityPercentage = v14;

}

- (void)applyPolicyChangesFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  _DASDock *v8;
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  NSObject *logger;
  void *v16;
  void *v17;
  NSMutableDictionary *activeDockAssertions;
  void *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  _BYTE v42[128];

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v36;
    *(_QWORD *)&v11 = 138412290;
    v29 = v11;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "containsObject:", v14, v29) & 1) == 0)
        {
          logger = v8->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v29;
            v41 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Removing %@", buf, 0xCu);
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8->_applicationProcessHandles, "objectForKey:", v14));
          v17 = v16;
          if (v16)
          {
            activeDockAssertions = v8->_activeDockAssertions;
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v16, "pid")));
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activeDockAssertions, "objectForKey:", v19));

            if (v20)
              -[_DASDock invalidateDockedAppAssertion:forProcess:](v8, "invalidateDockedAppAssertion:forProcess:", v20, v17);

          }
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v10);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = v6;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v22)
  {
    v24 = *(_QWORD *)v32;
    *(_QWORD *)&v23 = 138412290;
    v30 = v23;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v9, "containsObject:", v26, v30, (_QWORD)v31) & 1) == 0)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8->_applicationProcessHandles, "objectForKey:", v26));
          v28 = v8->_logger;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            v41 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Adding %@", buf, 0xCu);
          }
          -[_DASDock acquireDockAppAssertionForProcess:](v8, "acquireDockAppAssertionForProcess:", v27);

        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v22);
  }

  objc_sync_exit(v8);
  if (os_log_type_enabled((os_log_t)v8->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E8C74();

}

- (void)updatePolicy
{
  NSDate *v3;
  double v4;
  double v5;
  _DASDock *v6;
  id v7;
  void *v8;
  NSSet *v9;
  NSSet *dockedApplications;
  NSDate *v11;
  NSDate *lastPolicyUpdateTimestamp;

  v3 = self->_lastPolicyUpdateTimestamp;
  objc_sync_enter(v3);
  -[NSDate timeIntervalSinceNow](self->_lastPolicyUpdateTimestamp, "timeIntervalSinceNow");
  v5 = v4;
  objc_sync_exit(v3);

  if (v5 <= -0.25)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E8D04();
    v6 = self;
    objc_sync_enter(v6);
    v7 = -[NSSet copy](v6->_dockedApplications, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDock computePolicyForCurrentState](v6, "computePolicyForCurrentState"));
    if ((objc_msgSend(v7, "isEqualToSet:", v8) & 1) == 0)
    {
      -[_DASDock applyPolicyChangesFrom:to:](v6, "applyPolicyChangesFrom:to:", v8, v7);
      v9 = (NSSet *)objc_msgSend(v8, "copy");
      dockedApplications = v6->_dockedApplications;
      v6->_dockedApplications = v9;

    }
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    lastPolicyUpdateTimestamp = self->_lastPolicyUpdateTimestamp;
    self->_lastPolicyUpdateTimestamp = v11;

    objc_sync_exit(v6);
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E8CD8();
  }
}

- (id)computePolicyForCurrentState
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _DASDock *v8;
  __int128 v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *logger;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _UNKNOWN **v21;
  __int128 v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDock admissibleApplications](self, "admissibleApplications"));
  v4 = objc_msgSend(v3, "count");
  if ((unint64_t)v4 < 0xFF)
  {
    v6 = v4;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDock quantizedMaxExpectedTotalActivationTimeForApps:](self, "quantizedMaxExpectedTotalActivationTimeForApps:", v3));
    v25 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v6);
    v26 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v6);
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v6);
    v8 = self;
    objc_sync_enter(v8);
    if (!v6)
    {
LABEL_17:
      objc_sync_exit(v8);

      v5 = (id)objc_claimAutoreleasedReturnValue(-[_DASDock computeOptimalPolicyForApps:withValues:scaledWeights:andMemoryFootprint:](v8, "computeOptimalPolicyForApps:withValues:scaledWeights:andMemoryFootprint:", v3, v25, v26, v7));
      goto LABEL_18;
    }
    v10 = 0;
    v11 = v6;
    *(_QWORD *)&v9 = 138412290;
    v23 = v9;
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v10, v23));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8->_lastPhysFootprintObservedForApplication, "objectForKey:", v12));
      v14 = v13;
      if (v13)
      {
        v15 = (uint64_t)objc_msgSend(v13, "unsignedIntValue");
        if (!(_DWORD)v15)
        {
          logger = v8->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v28 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Observed a process footprint of zero bytes: %@", buf, 0xCu);
          }
          goto LABEL_16;
        }
      }
      else
      {
        v15 = 0xFFFFFFFFLL;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v15 / v8->_weightScaleFactor));
      objc_msgSend(v26, "setObject:atIndexedSubscript:", v17, v10);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v15));
      objc_msgSend(v7, "setObject:atIndexedSubscript:", v18, v10);

      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v12));
      v20 = (void *)v19;
      if (v19)
        v21 = (_UNKNOWN **)v19;
      else
        v21 = &off_10016ECD8;
      objc_msgSend(v25, "setObject:atIndexedSubscript:", v21, v10);

LABEL_16:
      if (v11 <= ++v10)
        goto LABEL_17;
    }
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E8D30();
  v5 = objc_alloc_init((Class)NSSet);
LABEL_18:

  return v5;
}

- (id)computeOptimalPolicyForApps:(id)a3 withValues:(id)a4 scaledWeights:(id)a5 andMemoryFootprint:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _DASKnapsackSolver *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _DASKnapsackSolver *v22;
  void *v23;
  _DASKnapsackSolver *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *i;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *logger;
  id v36;
  _DASDock *v37;
  id v38;
  _DASKnapsackSolver *v39;
  id v40;
  unsigned int *p_maxDockCapacity;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init((Class)NSMutableSet);
  if ((unint64_t)objc_msgSend(v10, "count") > 1)
  {
    p_maxDockCapacity = &self->_maxDockCapacity;
    v16 = self->_maxDockCapacity / self->_weightScaleFactor;
    v17 = objc_alloc_init(_DASKnapsackSolver);
    v18 = objc_alloc_init((Class)NSSet);
    v19 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_10016ECF0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v16));
    v21 = v12;
    v22 = v17;
    v43 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASKnapsackSolver solveKnapsackWithCapacity:forItemWeights:andItemValues:](v17, "solveKnapsackWithCapacity:forItemWeights:andItemValues:", v20));

    v42 = v23;
    if (objc_msgSend(v23, "isEqualToSet:", v19))
    {
      v24 = v22;
      v12 = v43;
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
        sub_1000E8D5C();
    }
    else if (objc_msgSend(v23, "isEqualToSet:", v18))
    {
      v24 = v22;
      v12 = v43;
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
        sub_1000E8D88();
    }
    else
    {
      v36 = v19;
      v37 = self;
      v38 = v18;
      v39 = v22;
      v40 = v11;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v25 = v23;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v26)
      {
        v27 = v26;
        LODWORD(v28) = 0;
        v29 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v29)
              objc_enumerationMutation(v25);
            v31 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "unsignedShortValue");
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v31));
            objc_msgSend(v14, "addObject:", v32);

            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v31));
            v28 = objc_msgSend(v33, "unsignedIntValue") + v28;

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v27);
      }
      else
      {
        v28 = 0;
      }

      logger = v37->_logger;
      v24 = v39;
      v11 = v40;
      v12 = v43;
      v18 = v38;
      v19 = v36;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        sub_1000E8DB4(logger, v28, p_maxDockCapacity);
    }
    v15 = objc_msgSend(v14, "copy");

  }
  else
  {
    v15 = v14;
  }

  return v15;
}

- (id)admissibleApplications
{
  id v3;
  _DASDock *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[_DASDock refreshApplicationActivationInformation](self, "refreshApplicationActivationInformation");
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = self;
  objc_sync_enter(v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4->_applicationProcessHandles, "allKeys", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (-[_DASDock applicationIsAdmissibleForDockMembership:](v4, "applicationIsAdmissibleForDockMembership:", v9))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  v10 = objc_msgSend(v3, "copy");

  return v10;
}

- (BOOL)applicationIsAdmissibleForDockMembership:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  NSSet *springboardVisibleApplications;
  id v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v17;
  int v18;
  _BOOL4 v19;
  NSObject *logger;
  void *v22;
  _BOOL4 v23;
  uint8_t buf[4];
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  id v45;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_applicationProcessHandles, "objectForKey:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lastPhysFootprintObservedForApplication, "objectForKey:", v4));
  v7 = v6;
  if (v6)
    v23 = (uint64_t)objc_msgSend(v6, "longValue") > 0;
  else
    v23 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_applicationActivationCounts, "objectForKey:", v4));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lastFrozenFootprintObservedForApplication, "objectForKey:", v4));
  v10 = objc_msgSend(v9, "longValue");

  v11 = -[NSSet containsObject:](self->_excludedApplications, "containsObject:", v4);
  v12 = -[NSSet containsObject:](self->_springboardVisibleApplications, "containsObject:", v4);
  springboardVisibleApplications = self->_springboardVisibleApplications;
  v14 = objc_alloc_init((Class)NSSet);
  v15 = !-[NSSet isEqualToSet:](springboardVisibleApplications, "isEqualToSet:", v14)
     && self->_springboardVisibleApplications != 0;
  v22 = v5;
  v16 = v5 != 0;

  if ((uint64_t)v10 > 0)
    v17 = 1;
  else
    v17 = v11;
  v18 = v16 & ~(v17 | v15 & ~v12) & v23;
  if (v8)
    v19 = v18;
  else
    v19 = 0;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67111682;
    v25 = v19;
    v26 = 1024;
    v27 = v22 != 0;
    v28 = 1024;
    v29 = v23;
    v30 = 1024;
    v31 = v8 != 0;
    v32 = 1024;
    v33 = (uint64_t)v10 > 0;
    v34 = 1024;
    v35 = v11;
    v36 = 1024;
    v37 = v15 & ~v12;
    v38 = 1024;
    v39 = v12;
    v40 = 1024;
    v41 = v15;
    v42 = 2112;
    v43 = CFSTR("111000(00|10|11)");
    v44 = 2112;
    v45 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Admissible: %d, Flags: %d%d%d%d%d%d%d%d %@, %@", buf, 0x4Cu);
  }

  return v19;
}

- (void)refreshApplicationActivationInformation
{
  void *v2;
  double v3;
  void *v4;
  uint64_t v5;
  NSDictionary *meanLaunchVersusResumeTimeDeltas;
  _DASDock *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[NSDate timeIntervalSinceNow](obj->_lastActivationInformationUpdateTimestamp, "timeIntervalSinceNow");
  if (v3 <= -3600.0)
  {
    -[_DASDock refreshApplicationActivationCounts](obj, "refreshApplicationActivationCounts");
    -[_DASDock refreshApplicationSpringboardVisibility](obj, "refreshApplicationSpringboardVisibility");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeEventAnalyzer sharedInstance](_APRSBiomeEventAnalyzer, "sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "meanDeltaTimeBetweenColdLaunchAndResume"));
    meanLaunchVersusResumeTimeDeltas = obj->_meanLaunchVersusResumeTimeDeltas;
    obj->_meanLaunchVersusResumeTimeDeltas = (NSDictionary *)v5;

    objc_storeStrong((id *)&obj->_lastActivationInformationUpdateTimestamp, v2);
  }

  objc_sync_exit(obj);
}

- (void)refreshApplicationActivationCounts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *logger;
  void *v14;
  _DASDock *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *applicationActivationCounts;
  id v18;
  uint8_t buf[4];
  id v20;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", -172800.0));
  v6 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKHistogramQuery histogramQueryForStream:interval:withPredicate:](_DKHistogramQuery, "histogramQueryForStream:interval:withPredicate:", v7, v6, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
  v18 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "executeQuery:error:", v9, &v18));
  v12 = v18;

  if (v12)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEFAULT, "Error obtaining results for app usage history: %@", buf, 0xCu);
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "countDictionary"));

  objc_autoreleasePoolPop(v3);
  v15 = self;
  objc_sync_enter(v15);
  if (v14)
  {
    v16 = (NSMutableDictionary *)objc_msgSend(v14, "mutableCopy");
  }
  else
  {
    if (v15->_applicationActivationCounts)
      goto LABEL_8;
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  applicationActivationCounts = v15->_applicationActivationCounts;
  v15->_applicationActivationCounts = v16;

LABEL_8:
  objc_sync_exit(v15);

}

- (void)refreshApplicationSpringboardVisibility
{
  NSSet *v3;
  uint64_t v4;
  NSSet *v5;
  NSSet *springboardVisibleApplications;
  NSSet *v7;
  id v8;
  unsigned int v9;
  NSObject *logger;
  const char *v11;
  uint8_t *v12;
  __int16 v13;
  uint8_t buf[2];

  v3 = self->_springboardVisibleApplications;
  v4 = objc_sync_enter(v3);
  v5 = (NSSet *)SBSCopyDisplayIdentifiers(v4);
  springboardVisibleApplications = self->_springboardVisibleApplications;
  self->_springboardVisibleApplications = v5;

  v7 = self->_springboardVisibleApplications;
  if (v7)
  {
    v8 = objc_alloc_init((Class)NSSet);
    v9 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v8);

    if (v9)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v11 = "Warning: SBSCopyDisplayIdentifiers returned an empty set";
        v12 = (uint8_t *)&v13;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      }
    }
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Warning: SBSCopyDisplayIdentifiers returned nil";
      v12 = buf;
      goto LABEL_7;
    }
  }
  objc_sync_exit(v3);

}

- (id)quantizedMaxExpectedTotalActivationTimeForApps:(id)a3
{
  id v4;
  id v5;
  _DASDock *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = self;
  objc_sync_enter(v6);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6->_applicationActivationCounts, "objectForKey:", v11, (_QWORD)v22));
        objc_msgSend(v12, "floatValue");
        v14 = v13;

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v6->_meanLaunchVersusResumeTimeDeltas, "objectForKey:", v11));
        objc_msgSend(v15, "floatValue");
        v17 = v16;

        *(float *)&v18 = v14 * fminf(fmaxf(v17, 1.0), 20000.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
        objc_msgSend(v5, "setObject:forKey:", v19, v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDock quantizeNumericMap:](v6, "quantizeNumericMap:", v5));

  return v20;
}

- (id)quantizeNumericMap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[7];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  v6 = objc_msgSend(v5, "count");
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000A0074;
  v22 = sub_1000A0084;
  v23 = 0;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v6);
  v8 = (void *)v19[5];
  v19[5] = (uint64_t)v7;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v17 = malloc_type_calloc((size_t)v6, 1uLL, 0x100004077774924uLL);
  v9 = v15[3];
  if (v9)
  {
    -[_DASDock zNormalizeArray:intoQuantizedVector:withScaleFactor:](self, "zNormalizeArray:intoQuantizedVector:withScaleFactor:", v5, v9, &off_10016ED08);
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A008C;
    v12[3] = &unk_10015F8D0;
    v12[4] = &v14;
    v12[5] = v13;
    v12[6] = &v18;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
    free((void *)v15[3]);
    v10 = objc_msgSend((id)v19[5], "copy");
    _Block_object_dispose(v13, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_1000E8EC0();
    v10 = objc_msgSend((id)v19[5], "copy");
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (void)zNormalizeArray:(id)a3 intoQuantizedVector:(char *)a4 withScaleFactor:(id)a5
{
  id v8;
  float v9;
  float v10;
  unint64_t v11;
  float *v12;
  float *v13;
  uint64_t i;
  void *v15;
  float v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float *v21;
  unint64_t v22;
  float v23;
  float v24;
  float *v25;
  float v26;
  float v27;
  float v28;
  float v29;

  v8 = a3;
  objc_msgSend(a5, "floatValue");
  v10 = v9;
  v11 = (unint64_t)objc_msgSend(v8, "count");
  v12 = (float *)malloc_type_malloc(4 * v11, 0x100004052888210uLL);
  if (v12)
  {
    v13 = v12;
    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", i));
        objc_msgSend(v15, "floatValue");
        v13[i] = v16;

      }
      v17 = 0;
      v18 = 0.0;
      do
        v18 = v18 + v13[v17++];
      while (v11 != v17);
      v19 = v18 / (float)v11;
      v20 = 0.0;
      v21 = v13;
      v22 = v11;
      do
      {
        v23 = *v21++;
        v20 = v20 + (float)((float)(v23 - v19) * (float)(v23 - v19));
        --v22;
      }
      while (v22);
      v24 = sqrtf(v20 / (float)v11);
      v25 = v13;
      do
      {
        v26 = *v25++;
        v27 = v10 * (float)((float)(v26 - v19) / v24);
        v28 = fabsf(v27);
        v29 = -127.0;
        if (v27 >= 127.0)
          v29 = 127.0;
        if (v28 >= 127.0)
          v27 = v29;
        *a4++ = (int)v27 ^ 0x80;
        --v11;
      }
      while (v11);
    }
    free(v13);
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
  {
    sub_1000E8EEC();
  }

}

- (void)acquireDockAppAssertionForProcess:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *activeDockAssertions;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *logger;
  void **v24;
  uint64_t v25;
  id (*v26)(uint64_t);
  void *v27;
  _DASDock *v28;
  id v29;
  id v30;
  id v31;
  RBSDomainAttribute *domainAttribute;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "pid");
    v7 = self->_activeDockAssertions;
    objc_sync_enter(v7);
    activeDockAssertions = self->_activeDockAssertions;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activeDockAssertions, "objectForKey:", v9));

    if (objc_msgSend(v10, "isValid"))
    {
      objc_sync_exit(v7);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", v6));
      v12 = objc_alloc((Class)RBSAssertion);
      domainAttribute = self->_domainAttribute;
      v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &domainAttribute, 1));
      v14 = objc_msgSend(v12, "initWithExplanation:target:attributes:", CFSTR("DAS: Application is docked."), v11, v13);

      v31 = 0;
      LOBYTE(v13) = objc_msgSend(v14, "acquireWithError:", &v31);
      v15 = v31;
      if ((v13 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
          sub_1000E8FBC();
        v24 = _NSConcreteStackBlock;
        v25 = 3221225472;
        v26 = sub_1000A05BC;
        v27 = &unk_10015F8F8;
        v28 = self;
        v29 = v5;
        v16 = v14;
        v30 = v16;
        objc_msgSend(v29, "monitorForDeath:", &v24);
        v17 = self->_activeDockAssertions;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6, v24, v25, v26, v27, v28));
        -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v16, v18);

      }
      else
      {
        -[_DASDock handleFailureToAcquireAssertion:forProcess:withError:](self, "handleFailureToAcquireAssertion:forProcess:withError:", v14, v5, v15);
      }
      v19 = -[NSMutableDictionary count](self->_activeDockAssertions, "count");

      objc_sync_exit(v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSMetricRecorder sharedInstance](_APRSMetricRecorder, "sharedInstance"));
        objc_msgSend(v22, "startLoggingForApp:pid:forEvent:", v21, objc_msgSend(v5, "pid"), 1);

      }
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        sub_1000E8F18(logger, (uint64_t)v19);

      v10 = v14;
    }

  }
}

- (void)handleDeathForProcess:(id)a3 withDockAssertion:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *activeDockAssertions;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;

  v6 = a3;
  v7 = a4;
  v8 = self->_activeDockAssertions;
  objc_sync_enter(v8);
  activeDockAssertions = self->_activeDockAssertions;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "pid")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activeDockAssertions, "objectForKey:", v10));

  if (objc_msgSend(v11, "isValid"))
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_1000E9024();
    -[_DASDock invalidateDockedAppAssertion:forProcess:](self, "invalidateDockedAppAssertion:forProcess:", v11, v6);
  }

  objc_sync_exit(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

  if (v13)
  {
    v14 = self->_applicationProcessHandles;
    objc_sync_enter(v14);
    -[NSMutableDictionary removeObjectForKey:](self->_applicationProcessHandles, "removeObjectForKey:", v13);
    -[_DASDock persistApplicationProcessHandles](self, "persistApplicationProcessHandles");
    objc_sync_exit(v14);

  }
  -[_DASDock removeInactiveAssertions](self, "removeInactiveAssertions");
  -[_DASDock updatePolicy](self, "updatePolicy");

}

- (void)removeInactiveAssertions
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = self->_activeDockAssertions;
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_activeDockAssertions, "allKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_activeDockAssertions, "objectForKey:", v8));
        v10 = v9;
        if (!v9 || (objc_msgSend(v9, "isValid") & 1) == 0)
          -[NSMutableDictionary removeObjectForKey:](self->_activeDockAssertions, "removeObjectForKey:", v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)handleFailureToAcquireAssertion:(id)a3 forProcess:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *logger;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    v19 = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_ERROR, "Failed to acquire assertion %@ for process %@ with error %@", (uint8_t *)&v19, 0x20u);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

  if (v13)
  {
    v14 = self->_applicationProcessHandles;
    objc_sync_enter(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_applicationProcessHandles, "objectForKey:", v13));
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentState"));
      v18 = objc_msgSend(v17, "isRunning");

      if ((v18 & 1) == 0)
      {
        -[NSMutableDictionary removeObjectForKey:](self->_applicationProcessHandles, "removeObjectForKey:", v13);
        -[_DASDock persistApplicationProcessHandles](self, "persistApplicationProcessHandles");
      }
    }

    objc_sync_exit(v14);
  }

}

- (void)invalidateDockedAppAssertion:(id)a3 forProcess:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *activeDockAssertions;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = self->_activeDockAssertions;
  objc_sync_enter(v8);
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E9088();
  objc_msgSend(v6, "invalidate");
  activeDockAssertions = self->_activeDockAssertions;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "pid")));
  -[NSMutableDictionary removeObjectForKey:](activeDockAssertions, "removeObjectForKey:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSMetricRecorder sharedInstance](_APRSMetricRecorder, "sharedInstance"));
    objc_msgSend(v13, "endEventForApp:pid:forEvent:", v12, objc_msgSend(v7, "pid"), 1);

  }
  objc_sync_exit(v8);

}

- (void)initProcessMonitorForDockedApplications
{
  void *v3;
  id v4;
  id v5;
  RBSProcessMonitor *v6;
  RBSProcessMonitor *processMonitor;
  _QWORD v8[4];
  id v9;
  id v10;
  _DASDock *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
  objc_msgSend(v3, "setValues:", 1);
  objc_msgSend(v3, "setEndowmentNamespaces:", &off_10016F4D0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A0C9C;
  v8[3] = &unk_10015F920;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingProcessTypeApplication](RBSProcessPredicate, "predicateMatchingProcessTypeApplication"));
  v9 = v4;
  v5 = v3;
  v10 = v5;
  v11 = self;
  v6 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v8));
  processMonitor = self->_processMonitor;
  self->_processMonitor = v6;

  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_1000E90F0();

}

- (id)getProcessHandleFromRunningBoardForPid:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *logger;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:"));
  if (!v5)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
      sub_1000E91D0(logger);
  }
  v11 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v5, &v11));
  v8 = v11;
  if (!v7)
  {
    v9 = self->_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1000E911C(v9, v3, (uint64_t)v8);
  }

  return v7;
}

- (void)initializeLedgerIndices
{
  int64_t *p_phys_footprint_index;
  pid_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int64_t v8;
  const char *v9;
  int v10;
  int64_t *v11;
  int v12;
  uint64_t v13;
  _OWORD v14[2];
  __int128 v15;

  *(int64x2_t *)&self->_phys_footprint_index = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  p_phys_footprint_index = &self->_phys_footprint_index;
  v15 = 0u;
  memset(v14, 0, sizeof(v14));
  v4 = getpid();
  ledger(0, v4, v14, 0);
  v13 = *((_QWORD *)&v15 + 1);
  v5 = (char *)malloc_type_malloc(96 * *((_QWORD *)&v15 + 1), 0x1000040565EDBD2uLL);
  if (v5)
  {
    v6 = v5;
    if ((ledger(2, v5, &v13, 0) & 0x80000000) == 0)
    {
      v7 = v13;
      if (v13 >= 1)
      {
        v8 = 0;
        v9 = v6;
        do
        {
          v10 = strcmp(v9, "phys_footprint");
          v11 = p_phys_footprint_index;
          if (!v10 || (v12 = strcmp(v9, "frozen_to_swap"), v11 = p_phys_footprint_index + 1, !v12))
            *v11 = v8;
          ++v8;
          v9 += 96;
        }
        while (v7 != v8);
      }
    }
    free(v6);
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E9268();
  }
}

- (int64_t)getLedgerCountForProcess:(int)a3
{
  NSObject *logger;
  _OWORD v6[2];
  __int128 v7;

  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  if ((ledger(0, a3, v6, 0) & 0x80000000) == 0)
    return *((_QWORD *)&v7 + 1);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    sub_1000E9294(logger);
  return 0;
}

- (void)getFootprintsForProcess:(int)a3 physFootprintReference:(int64_t *)a4 frozenFootprintReference:(int64_t *)a5
{
  int64_t v9;
  _QWORD *v10;
  int64_t v11;
  int64_t v12;
  NSObject *logger;
  int64_t v14;

  v9 = -[_DASDock getLedgerCountForProcess:](self, "getLedgerCountForProcess:");
  v14 = v9;
  v10 = malloc_type_malloc(56 * v9, 0xC9E76426uLL);
  if (self->_frozen_to_swap_index >= v9
    || self->_phys_footprint_index >= v9
    || (ledger(1, a3, v10, &v14) & 0x80000000) != 0)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
      sub_1000E932C(logger);
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v11 = v10[7 * self->_frozen_to_swap_index];
    v12 = v10[7 * self->_phys_footprint_index];
  }
  free(v10);
  if (a4)
    *a4 = v12;
  if (a5)
    *a5 = v11;
}

- (void)refreshLedgerInformationForProcess:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lastFrozenFootprintObservedForApplication;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *lastPhysFootprintObservedForApplication;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "pid");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

  if (v7)
  {
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    -[_DASDock getFootprintsForProcess:physFootprintReference:frozenFootprintReference:](self, "getFootprintsForProcess:physFootprintReference:frozenFootprintReference:", v5, &v15, &v14);
    v8 = self->_lastFrozenFootprintObservedForApplication;
    objc_sync_enter(v8);
    lastFrozenFootprintObservedForApplication = self->_lastFrozenFootprintObservedForApplication;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v14));
    -[NSMutableDictionary setObject:forKey:](lastFrozenFootprintObservedForApplication, "setObject:forKey:", v10, v7);

    objc_sync_exit(v8);
    v11 = self->_lastFrozenFootprintObservedForApplication;
    objc_sync_enter(v11);
    lastPhysFootprintObservedForApplication = self->_lastPhysFootprintObservedForApplication;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v15));
    -[NSMutableDictionary setObject:forKey:](lastPhysFootprintObservedForApplication, "setObject:forKey:", v13, v7);

    objc_sync_exit(v11);
  }

}

- (void)refreshLedgerInformationForApplicationProcesses
{
  id v2;
  _DASDock *obj;
  _QWORD v4[5];

  obj = self;
  objc_sync_enter(obj);
  v2 = -[NSMutableDictionary copy](obj->_applicationProcessHandles, "copy");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A1348;
  v4[3] = &unk_10015F948;
  v4[4] = obj;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

  objc_sync_exit(obj);
}

- (unint64_t)getPhysMemSizeInBytes
{
  int v3;
  int v4;
  NSObject *logger;
  size_t v7;
  unint64_t v8;

  v7 = 8;
  v8 = 0;
  v3 = sysctlbyname("hw.memsize", &v8, &v7, 0, 0);
  if (v3)
  {
    v4 = v3;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      sub_1000E93C4(logger, v4);
  }
  return v8;
}

- (void)configureMaximumDockCapacity
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  NSObject *logger;
  NSObject *v9;
  unint64_t v10;
  float v11;
  float v12;
  _DASDock *v13;
  float v14;
  NSObject *v15;
  uint64_t maxDockCapacity;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.dock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("DockCapacityPercentage")));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v7 = v6;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
      sub_1000E951C(logger, v7);
  }
  else
  {
    v9 = self->_logger;
    v7 = 10.0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1000E947C(v9);
  }
  v10 = -[_DASDock getPhysMemSizeInBytes](self, "getPhysMemSizeInBytes");
  if (v10)
  {
    v11 = fminf(v7, 100.0);
    if (v11 >= 0.0)
      v12 = v11 / 100.0;
    else
      v12 = 0.0;
    v13 = self;
    objc_sync_enter(v13);
    v13->_maxDockCapacity = fminf(v12 * (float)v10, 4295000000.0);
    objc_sync_exit(v13);

    v14 = v12 * 100.0;
  }
  else
  {
    v14 = 0.0;
  }
  v15 = self->_logger;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    maxDockCapacity = self->_maxDockCapacity;
    v17 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", maxDockCapacity));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10));
    *(float *)&v20 = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
    v22 = 138412802;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    v26 = 2112;
    v27 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Max capacity: %@ bytes, PhysMemSize: %@ bytes, Capacity percentage: %@ percent", (uint8_t *)&v22, 0x20u);

  }
}

- (void)restoreApplicationProcessHandles
{
  NSUserDefaults *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = self->_persistence;
  objc_sync_enter(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](self->_persistence, "valueForKey:", CFSTR("applicationProcessIdentifiers")));
  objc_sync_exit(v3);

  v4 = v5;
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A16E0;
    v6[3] = &unk_10015D480;
    v6[4] = self;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);
    v4 = v5;
  }

}

- (void)setClassCUnlockMonitor
{
  _DASDataProtectionStateMonitor *lockStateMonitor;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[_DASDataProtectionStateMonitor unnotifiedIsDataAvailableForClassC](self->_lockStateMonitor, "unnotifiedIsDataAvailableForClassC"))
  {
    objc_initWeak(&location, self);
    lockStateMonitor = self->_lockStateMonitor;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000A1888;
    v4[3] = &unk_10015D438;
    objc_copyWeak(&v5, &location);
    -[_DASDataProtectionStateMonitor setChangeHandler:](lockStateMonitor, "setChangeHandler:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)setDefaultExcludedApplications
{
  NSSet *v3;
  NSSet *excludedApplications;

  v3 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10016F4E8));
  excludedApplications = self->_excludedApplications;
  self->_excludedApplications = v3;

}

- (NSMutableDictionary)lastFrozenFootprintObservedForApplication
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastFrozenFootprintObservedForApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)lastPhysFootprintObservedForApplication
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastPhysFootprintObservedForApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)applicationProcessHandles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationProcessHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)activeDockAssertions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActiveDockAssertions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)applicationActivationCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplicationActivationCounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)meanLaunchVersusResumeTimeDeltas
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMeanLaunchVersusResumeTimeDeltas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)lastActivationInformationUpdateTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastActivationInformationUpdateTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)lastPolicyUpdateTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastPolicyUpdateTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSSet)dockedApplications
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDockedApplications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSSet)excludedApplications
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExcludedApplications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSSet)springboardVisibleApplications
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSpringboardVisibleApplications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (_DASDataProtectionStateMonitor)lockStateMonitor
{
  return (_DASDataProtectionStateMonitor *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLockStateMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSUserDefaults)persistence
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPersistence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (RBSDomainAttribute)domainAttribute
{
  return (RBSDomainAttribute *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDomainAttribute:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (RBSProcessMonitor)processMonitor
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 136, 1);
}

- (void)setProcessMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (int64_t)phys_footprint_index
{
  return self->_phys_footprint_index;
}

- (void)setPhys_footprint_index:(int64_t)a3
{
  self->_phys_footprint_index = a3;
}

- (int64_t)frozen_to_swap_index
{
  return self->_frozen_to_swap_index;
}

- (void)setFrozen_to_swap_index:(int64_t)a3
{
  self->_frozen_to_swap_index = a3;
}

- (unsigned)maxDockCapacity
{
  return self->_maxDockCapacity;
}

- (void)setMaxDockCapacity:(unsigned int)a3
{
  self->_maxDockCapacity = a3;
}

- (unsigned)weightScaleFactor
{
  return self->_weightScaleFactor;
}

- (void)setWeightScaleFactor:(unsigned int)a3
{
  self->_weightScaleFactor = a3;
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)dockDisabled
{
  return self->_dockDisabled;
}

- (void)setDockDisabled:(BOOL)a3
{
  self->_dockDisabled = a3;
}

- (double)dockCapacityPercentage
{
  return self->_dockCapacityPercentage;
}

- (void)setDockCapacityPercentage:(double)a3
{
  self->_dockCapacityPercentage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_domainAttribute, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_springboardVisibleApplications, 0);
  objc_storeStrong((id *)&self->_excludedApplications, 0);
  objc_storeStrong((id *)&self->_dockedApplications, 0);
  objc_storeStrong((id *)&self->_lastPolicyUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_lastActivationInformationUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_meanLaunchVersusResumeTimeDeltas, 0);
  objc_storeStrong((id *)&self->_applicationActivationCounts, 0);
  objc_storeStrong((id *)&self->_activeDockAssertions, 0);
  objc_storeStrong((id *)&self->_applicationProcessHandles, 0);
  objc_storeStrong((id *)&self->_lastPhysFootprintObservedForApplication, 0);
  objc_storeStrong((id *)&self->_lastFrozenFootprintObservedForApplication, 0);
}

@end
