@implementation _DASThermalPolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "schedulingPriority");
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (id)initializeTriggers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[3];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_thermalPressureLevelKeyPath));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_watchThermalPressureLevelKeyPath));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_restoreInProgressKeyPath));
  v15[0] = CFSTR("identifier");
  v15[1] = CFSTR("predicate");
  v16[0] = CFSTR("com.apple.duetactivityscheduler.thermalpolicypolicy.thermalpressurechange");
  v16[1] = v10;
  v15[2] = CFSTR("deviceSet");
  v15[3] = CFSTR("mustWake");
  v16[2] = &off_10016E8A0;
  v16[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));
  v17[0] = v4;
  v13[0] = CFSTR("identifier");
  v13[1] = CFSTR("predicate");
  v14[0] = CFSTR("com.apple.duetactivityscheduler.thermalpolicypolicy.watchthermalpressurechange");
  v14[1] = v9;
  v13[2] = CFSTR("deviceSet");
  v13[3] = CFSTR("mustWake");
  v14[2] = &off_10016E8A0;
  v14[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  v17[1] = v5;
  v11[0] = CFSTR("identifier");
  v11[1] = CFSTR("predicate");
  v12[0] = CFSTR("com.apple.duetactivityscheduler.thermalpolicy.restore");
  v12[1] = v3;
  v11[2] = CFSTR("deviceSet");
  v11[3] = CFSTR("mustWake");
  v12[2] = &off_10016E8A0;
  v12[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
  v17[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 3));

  return v7;
}

- (_DASThermalPolicy)init
{
  _DASThermalPolicy *v2;
  _DASThermalPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *thermalPressureLevelKeyPath;
  uint64_t v7;
  _CDContextualKeyPath *watchThermalPressureLevelKeyPath;
  uint64_t v9;
  _CDContextualKeyPath *restoreInProgressKeyPath;
  uint64_t v11;
  NSArray *triggers;
  uint64_t v13;
  _DASTrialManager *trialManager;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_DASThermalPolicy;
  v2 = -[_DASThermalPolicy init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Thermal Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForThermalPressureLevel](_CDContextQueries, "keyPathForThermalPressureLevel"));
    thermalPressureLevelKeyPath = v3->_thermalPressureLevelKeyPath;
    v3->_thermalPressureLevelKeyPath = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDeviceThermalPressureLevel](_CDContextQueries, "keyPathForDefaultPairedDeviceThermalPressureLevel"));
    watchThermalPressureLevelKeyPath = v3->_watchThermalPressureLevelKeyPath;
    v3->_watchThermalPressureLevelKeyPath = (_CDContextualKeyPath *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/restore/inProgress")));
    restoreInProgressKeyPath = v3->_restoreInProgressKeyPath;
    v3->_restoreInProgressKeyPath = (_CDContextualKeyPath *)v9;

    v11 = objc_claimAutoreleasedReturnValue(-[_DASThermalPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstanceForNamespace:](_DASTrialManager, "sharedInstanceForNamespace:", CFSTR("COREOS_DAS")));
    trialManager = v3->_trialManager;
    v3->_trialManager = (_DASTrialManager *)v13;

    -[_DASTrialManager addDelegate:](v3->_trialManager, "addDelegate:", v3);
    -[_DASThermalPolicy updateTrialParameters](v3, "updateTrialParameters");
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001AB948 != -1)
    dispatch_once(&qword_1001AB948, &stru_10015E760);
  return (id)qword_1001AB950;
}

- (int)levelFromTrialLevel:(unsigned int)a3
{
  return a3;
}

- (void)dasTrialManager:(id)a3 hasUpdatedParametersForNamespace:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("COREOS_DAS")))
    -[_DASThermalPolicy updateTrialParameters](self, "updateTrialParameters");
}

- (void)updateTrialParameters
{
  void *v3;
  id v4;
  NSObject *v5;
  int utilityMax;
  void *v7;
  id v8;
  NSObject *v9;
  int maintenanceMax;
  void *v11;
  id v12;
  NSObject *v13;
  int utilityInUseMax;
  void *v15;
  id v16;
  NSObject *v17;
  int utilityInactivityMax;
  void *v19;
  id v20;
  NSObject *v21;
  int maintenanceInactivityMax;
  void *v23;
  id v24;
  NSObject *v25;
  int maintenanceNWMax;
  int v27;
  const __CFString *v28;
  __int16 v29;
  int v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("PolicyThermalUtilityMaxAllowable")));
  v4 = objc_msgSend(v3, "longValue");

  self->_utilityMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v4);
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("trial")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    utilityMax = self->_utilityMax;
    v27 = 138412546;
    v28 = CFSTR("PolicyThermalUtilityMaxAllowable");
    v29 = 1024;
    v30 = utilityMax;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v27, 0x12u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("PolicyThermalMaintenanceMaxAllowable")));
  v8 = objc_msgSend(v7, "longValue");

  self->_maintenanceMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v8);
  v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("trial")));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    maintenanceMax = self->_maintenanceMax;
    v27 = 138412546;
    v28 = CFSTR("PolicyThermalMaintenanceMaxAllowable");
    v29 = 1024;
    v30 = maintenanceMax;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v27, 0x12u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("PolicyThermalUtilityInUseMaxAllowable")));
  v12 = objc_msgSend(v11, "longValue");

  self->_utilityInUseMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v12);
  v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("trial")));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    utilityInUseMax = self->_utilityInUseMax;
    v27 = 138412546;
    v28 = CFSTR("PolicyThermalUtilityInUseMaxAllowable");
    v29 = 1024;
    v30 = utilityInUseMax;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v27, 0x12u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("PolicyThermalUtilityInactivityMaxAllowable")));
  v16 = objc_msgSend(v15, "longValue");

  self->_utilityInactivityMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v16);
  v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("trial")));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    utilityInactivityMax = self->_utilityInactivityMax;
    v27 = 138412546;
    v28 = CFSTR("PolicyThermalUtilityInactivityMaxAllowable");
    v29 = 1024;
    v30 = utilityInactivityMax;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v27, 0x12u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("PolicyThermalMaintenanceInactivityMaxAllowable")));
  v20 = objc_msgSend(v19, "longValue");

  self->_maintenanceInactivityMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v20);
  v21 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("trial")));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    maintenanceInactivityMax = self->_maintenanceInactivityMax;
    v27 = 138412546;
    v28 = CFSTR("PolicyThermalMaintenanceInactivityMaxAllowable");
    v29 = 1024;
    v30 = maintenanceInactivityMax;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v27, 0x12u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("PolicyThermalMaintenanceNetworkMaxAllowable")));
  v24 = objc_msgSend(v23, "longValue");

  self->_maintenanceNWMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v24);
  v25 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("trial")));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    maintenanceNWMax = self->_maintenanceNWMax;
    v27 = 138412546;
    v28 = CFSTR("PolicyThermalMaintenanceNetworkMaxAllowable");
    v29 = 1024;
    v30 = maintenanceNWMax;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v27, 0x12u);
  }

}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", self->_thermalPressureLevelKeyPath));
  v4 = objc_msgSend(v3, "unsignedIntValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v6 = v5;
  if (!v4)
  {
    objc_msgSend(v5, "removeConstraint:forSchedulingPriority:", 2, _DASSchedulingPriorityUtility);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
    v8 = _DASSchedulingPriorityMaintenance;
    v9 = v7;
    goto LABEL_5;
  }
  objc_msgSend(v5, "addConstraint:forSchedulingPriority:", 2, _DASSchedulingPriorityMaintenance);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v8 = _DASSchedulingPriorityUtility;
  v9 = v7;
  if (v4 < 0x15)
  {
LABEL_5:
    objc_msgSend(v7, "removeConstraint:forSchedulingPriority:", 2, v8);
    goto LABEL_6;
  }
  objc_msgSend(v7, "addConstraint:forSchedulingPriority:", 2, _DASSchedulingPriorityUtility);
LABEL_6:

}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _CDContextualKeyPath *thermalPressureLevelKeyPath;
  void *v9;
  unsigned int v10;
  unsigned __int8 v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.thermalpolicypolicy.thermalpressurechange")))
  {
    -[_DASThermalPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v7);
    thermalPressureLevelKeyPath = self->_thermalPressureLevelKeyPath;
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", thermalPressureLevelKeyPath));
    v10 = objc_msgSend(v9, "unsignedIntValue");

    v11 = v10 != 0;
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.thermalpolicypolicy.watchthermalpressurechange")))
  {
    thermalPressureLevelKeyPath = self->_watchThermalPressureLevelKeyPath;
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.thermalpolicy.restore")))v11 = -[_DASThermalPolicy isRestoreInProgressWithContext:](self, "isRestoreInProgressWithContext:", v7);
  else
    v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)shouldIgnoreThermalsForActivity:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int16 v9;
  void *v10;
  unsigned int v11;
  BOOL v12;

  v6 = a4;
  if (!+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", a3))
    goto LABEL_5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));
  v9 = (unsigned __int16)objc_msgSend(v8, "unsignedIntegerValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", self->_thermalPressureLevelKeyPath));
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if ((v9 & 0x800) == 0)
    goto LABEL_5;
  if (v11 < 0x15)
    v12 = 1;
  else
LABEL_5:
    v12 = 0;

  return v12;
}

- (double)getScoreForThermalLevel:(int)a3
{
  double result;

  result = 1.0;
  if (a3 <= 29)
  {
    if (a3 == 10)
    {
      return 0.6;
    }
    else if (a3 == 20)
    {
      return 0.2;
    }
  }
  else if (a3 == 30)
  {
    return 0.1;
  }
  else if (a3 == 40 || a3 == 50)
  {
    return 0.0;
  }
  return result;
}

- (int64_t)getReasonForThermalLevel:(int)a3
{
  int64_t result;
  int64_t v4;

  result = 1;
  if (a3 <= 29)
  {
    v4 = 4;
    if (a3 != 20)
      v4 = 1;
    if (a3 == 10)
      return 2;
    else
      return v4;
  }
  else if (a3 == 30)
  {
    return 8;
  }
  else if (a3 == 40 || a3 == 50)
  {
    return 16;
  }
  return result;
}

- (int)maxAllowableThermalPressureForActivity:(id)a3 restoreInProgress:(BOOL)a4 deviceInUse:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  int utilityInUseMax;
  void *v15;
  unsigned __int8 v16;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "schedulingPriority");
  if ((unint64_t)v9 >= _DASSchedulingPriorityUserInitiated)
  {
    utilityInUseMax = 30;
  }
  else
  {
    v10 = objc_msgSend(v8, "schedulingPriority");
    if ((unint64_t)v10 >= _DASSchedulingPriorityUtility)
    {
      if (v5)
      {
        utilityInUseMax = self->_utilityInUseMax;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASInternetSharingPolicy policyInstance](_DASInternetSharingPolicy, "policyInstance"));
        v16 = objc_msgSend(v15, "enabled");

        if ((v16 & 1) != 0)
          utilityInUseMax = 10;
        else
          utilityInUseMax = self->_utilityMax;
      }
    }
    else if (v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedApplications"));
      v12 = objc_msgSend(v11, "containsObject:", CFSTR("com.apple.icloud.restore"));

      if (v12)
        utilityInUseMax = 10;
      else
        utilityInUseMax = 0;
    }
    else if ((objc_msgSend(v8, "requiresNetwork") & 1) != 0
           || objc_msgSend(v8, "triggersRestart"))
    {
      utilityInUseMax = self->_maintenanceNWMax;
    }
    else
    {
      utilityInUseMax = self->_maintenanceMax;
    }
  }

  return utilityInUseMax;
}

- (BOOL)isRestoreInProgressWithContext:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", self->_restoreInProgressKeyPath));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  _BOOL8 v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v26;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000646F0;
  block[3] = &unk_10015D558;
  block[4] = self;
  v7 = a4;
  v26 = v7;
  if (qword_1001AB958 != -1)
    dispatch_once(&qword_1001AB958, block);
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  v9 = -[_DASThermalPolicy isRestoreInProgressWithContext:](self, "isRestoreInProgressWithContext:", v7);
  v10 = -[_DASThermalPolicy maxAllowableThermalPressureForActivity:restoreInProgress:deviceInUse:](self, "maxAllowableThermalPressureForActivity:restoreInProgress:deviceInUse:", v6, v9, +[_DASDeviceActivityPolicy isDeviceInUse:](_DASDeviceActivityPolicy, "isDeviceInUse:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_thermalPressureLevelKeyPath));
  v12 = objc_msgSend(v11, "unsignedIntValue");

  -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", -[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | -[_DASThermalPolicy getReasonForThermalLevel:](self, "getReasonForThermalLevel:", v12));
  if (v12 <= v10)
  {
    if (objc_msgSend(v6, "targetDevice") != (id)1 && objc_msgSend(v6, "targetDevice") != (id)2
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_watchThermalPressureLevelKeyPath)),
          v17 = objc_msgSend(v16, "unsignedIntValue"),
          v16,
          v17 <= v10))
    {
      -[_DASThermalPolicy getScoreForThermalLevel:](self, "getScoreForThermalLevel:", v12);
      if (v19 > 0.0)
      {
        v20 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v8));
LABEL_17:
        v23 = (void *)v20;
        goto LABEL_18;
      }
      v15 = 100;
      v14 = (double)0x384uLL;
LABEL_16:
      v20 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v15, v8, v14));
      goto LABEL_17;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("watchThermalLevel >= %ld"), v12));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v18);
  }
  else
  {
    if (-[_DASThermalPolicy shouldIgnoreThermalsForActivity:withState:](self, "shouldIgnoreThermalsForActivity:withState:", v6, v7))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("shouldOverrideModerateThermals == YES")));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v13);

      v14 = (double)0x384uLL;
      v15 = 67;
      goto LABEL_16;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("thermalLevel > %ld"), v10));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v18);
    if (v9)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("restoreInProgress == %@"), v21));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v22);

    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 100, v8, (double)0x384uLL));

LABEL_18:
  return v23;
}

- (int)thermalPressureWithState:(id)a3
{
  void *v3;
  int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", self->_thermalPressureLevelKeyPath));
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_storeStrong((id *)&self->_policyName, a3);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (_CDContextualKeyPath)thermalPressureLevelKeyPath
{
  return self->_thermalPressureLevelKeyPath;
}

- (void)setThermalPressureLevelKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_thermalPressureLevelKeyPath, a3);
}

- (_CDContextualKeyPath)watchThermalPressureLevelKeyPath
{
  return self->_watchThermalPressureLevelKeyPath;
}

- (void)setWatchThermalPressureLevelKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_watchThermalPressureLevelKeyPath, a3);
}

- (_CDContextualKeyPath)restoreInProgressKeyPath
{
  return self->_restoreInProgressKeyPath;
}

- (void)setRestoreInProgressKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_restoreInProgressKeyPath, a3);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (int)utilityMax
{
  return self->_utilityMax;
}

- (void)setUtilityMax:(int)a3
{
  self->_utilityMax = a3;
}

- (int)utilityInUseMax
{
  return self->_utilityInUseMax;
}

- (void)setUtilityInUseMax:(int)a3
{
  self->_utilityInUseMax = a3;
}

- (int)utilityInactivityMax
{
  return self->_utilityInactivityMax;
}

- (void)setUtilityInactivityMax:(int)a3
{
  self->_utilityInactivityMax = a3;
}

- (int)maintenanceInactivityMax
{
  return self->_maintenanceInactivityMax;
}

- (void)setMaintenanceInactivityMax:(int)a3
{
  self->_maintenanceInactivityMax = a3;
}

- (int)maintenanceMax
{
  return self->_maintenanceMax;
}

- (void)setMaintenanceMax:(int)a3
{
  self->_maintenanceMax = a3;
}

- (int)maintenanceNWMax
{
  return self->_maintenanceNWMax;
}

- (void)setMaintenanceNWMax:(int)a3
{
  self->_maintenanceNWMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_restoreInProgressKeyPath, 0);
  objc_storeStrong((id *)&self->_watchThermalPressureLevelKeyPath, 0);
  objc_storeStrong((id *)&self->_thermalPressureLevelKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
