@implementation _DASBatteryLevelPolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  BOOL v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "allowsUnrestrictedBackgroundLaunches") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "schedulingPriority");
    v4 = (unint64_t)v5 < _DASSchedulingPriorityUserInitiated;
  }

  return v4;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (double)baselineScoreForActivity:(id)a3
{
  return 0.5;
}

- (id)initializeTriggers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_batteryLevelKeyPath));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_defaultPairedBatteryKeyPath));
  v11[0] = CFSTR("identifier");
  v11[1] = CFSTR("predicate");
  v12[0] = CFSTR("com.apple.das.batterylevelpolicy.batterylevelchange");
  v12[1] = v3;
  v11[2] = CFSTR("deviceSet");
  v11[3] = CFSTR("mustWake");
  v12[2] = &off_10016E630;
  v12[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
  v13[0] = v5;
  v9[0] = CFSTR("identifier");
  v9[1] = CFSTR("predicate");
  v10[0] = CFSTR("com.apple.das.batterylevelpolicy.watchbatterylevelchange");
  v10[1] = v4;
  v9[2] = CFSTR("deviceSet");
  v9[3] = CFSTR("mustWake");
  v10[2] = &off_10016E630;
  v10[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));

  return v7;
}

- (_DASBatteryLevelPolicy)init
{
  _DASBatteryLevelPolicy *v2;
  _DASBatteryLevelPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *batteryLevelKeyPath;
  uint64_t v7;
  _CDContextualKeyPath *pluginStatusKeyPath;
  uint64_t v9;
  _CDContextualKeyPath *defaultPairedBatteryKeyPath;
  uint64_t v11;
  _CDContextualKeyPath *defaultPairedPluginKeyPath;
  uint64_t v13;
  NSArray *triggers;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_DASBatteryLevelPolicy;
  v2 = -[_DASBatteryLevelPolicy init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Battery Level Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
    batteryLevelKeyPath = v3->_batteryLevelKeyPath;
    v3->_batteryLevelKeyPath = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
    pluginStatusKeyPath = v3->_pluginStatusKeyPath;
    v3->_pluginStatusKeyPath = (_CDContextualKeyPath *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDeviceBatteryLevel](_CDContextQueries, "keyPathForDefaultPairedDeviceBatteryLevel"));
    defaultPairedBatteryKeyPath = v3->_defaultPairedBatteryKeyPath;
    v3->_defaultPairedBatteryKeyPath = (_CDContextualKeyPath *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDefaultPairedDevicePluginStatus](_CDContextQueries, "keyPathForDefaultPairedDevicePluginStatus"));
    defaultPairedPluginKeyPath = v3->_defaultPairedPluginKeyPath;
    v3->_defaultPairedPluginKeyPath = (_CDContextualKeyPath *)v11;

    v3->_isiPad = +[_DASConfig isiPad](_DASConfig, "isiPad");
    v13 = objc_claimAutoreleasedReturnValue(-[_DASBatteryLevelPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;

    v3->_lastSavedBatteryLevel = 0;
  }
  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_1001AB620 != -1)
    dispatch_once(&qword_1001AB620, &stru_10015E100);
  return (id)qword_1001AB628;
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", self->_batteryLevelKeyPath));
  v4 = (uint64_t)objc_msgSend(v3, "integerValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v6 = v5;
  if (v4 > 9)
  {
    if ((unint64_t)v4 > 0x13)
      objc_msgSend(v5, "removeConstraint:forSchedulingPriority:", 1, _DASSchedulingPriorityMaintenance);
    else
      objc_msgSend(v5, "addConstraint:forSchedulingPriority:", 1, _DASSchedulingPriorityMaintenance);
    objc_msgSend(v6, "removeConstraint:forSchedulingPriority:", 1, _DASSchedulingPriorityUtility);
  }
  else
  {
    objc_msgSend(v5, "addConstraint:forSchedulingPriority:", 1, _DASSchedulingPriorityMaintenance);
    objc_msgSend(v6, "addConstraint:forSchedulingPriority:", 1, _DASSchedulingPriorityUtility);
  }

}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  id v8;
  int64_t lastSavedBatteryLevel;
  BOOL v10;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.das.batterylevelpolicy.batterylevelchange")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", self->_batteryLevelKeyPath));
    v8 = objc_msgSend(v7, "integerValue");

    -[_DASBatteryLevelPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v6);
    lastSavedBatteryLevel = self->_lastSavedBatteryLevel;
    v10 = (uint64_t)v8 - lastSavedBatteryLevel < 5;
    if ((uint64_t)v8 - lastSavedBatteryLevel > 4 || (uint64_t)v8 < lastSavedBatteryLevel)
      self->_lastSavedBatteryLevel = (int64_t)v8;
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)getScoreForActivity:(id)a3 forBatteryLevel:(double)a4 isPluggedIn:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;

  v5 = a5;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", _DASCTSMinBatteryLevelKey));
  v10 = objc_msgSend(v9, "integerValue");

  v11 = 0.0;
  if ((double)(uint64_t)v10 <= a4)
  {
    v12 = objc_msgSend(v7, "schedulingPriority", (double)(uint64_t)v10);
    if ((unint64_t)v12 >= _DASSchedulingPriorityUserInitiated)
    {
      v15 = 5.0;
      v14 = 0.25;
    }
    else
    {
      v13 = objc_msgSend(v7, "schedulingPriority");
      v14 = 0.5;
      if ((unint64_t)v13 >= _DASSchedulingPriorityUtility)
        v14 = 0.4;
      v15 = 10.0;
      if ((unint64_t)v13 < _DASSchedulingPriorityUtility)
        v15 = 20.0;
    }
    v16 = pow((a4 - v15) / (100.0 - v15), v14);
    if (v5)
      v16 = v16 * 1.2;
    if (v16 > 1.0)
      v16 = 1.0;
    v11 = fmax(v16, 0.0);
  }

  return v11;
}

- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRationale:(id)a4 withBatteryLevel:(double)a5 isPluggedIn:(BOOL)a6
{
  id v10;
  unsigned int v11;
  BOOL v12;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = objc_msgSend(a3, "isEqualToString:", _DASLaunchReasonBackgroundProcessing);
  v12 = 1;
  if (v11 && !a6 && (a5 < 75.0 || !self->_isiPad))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("launchType == PROCESSING AND batteryLevel == %@"), v14));
    objc_msgSend(v10, "addRationaleWithCondition:", v15);

    v12 = 0;
  }

  return v12;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  _DASPolicyResponseRationale *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  unsigned __int8 v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  double v32;
  void *v33;
  _QWORD block[5];
  id v36;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049960;
  block[3] = &unk_10015D558;
  block[4] = self;
  v7 = a4;
  v36 = v7;
  if (qword_1001AB630 != -1)
    dispatch_once(&qword_1001AB630, block);
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_batteryLevelKeyPath));
  objc_msgSend(v9, "doubleValue");
  if (v10 == 0.0)
  {
    v11 = (double)0x384uLL;
    v12 = 0;
    v13 = 0;
LABEL_5:
    v14 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v12, v13, v11));
    goto LABEL_17;
  }
  v15 = objc_msgSend(v9, "unsignedIntegerValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("batteryLevel == %ld"), v15));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_pluginStatusKeyPath));
  v18 = objc_msgSend(v17, "BOOLValue");

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("pluggedIn == %@"), v19));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v20);

  if ((objc_msgSend(v6, "requestsApplicationLaunch") & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
    v22 = (double)(unint64_t)v15;
    v23 = -[_DASBatteryLevelPolicy backgroundTaskAllowedWithType:withRationale:withBatteryLevel:isPluggedIn:](self, "backgroundTaskAllowedWithType:withRationale:withBatteryLevel:isPluggedIn:", v21, v8, v18, (double)(unint64_t)v15);

    if ((v23 & 1) == 0)
    {
      v11 = (double)0x384uLL;
      v12 = 33;
      v13 = v8;
      goto LABEL_5;
    }
  }
  else
  {
    v22 = (double)(unint64_t)v15;
  }
  -[_DASBatteryLevelPolicy getScoreForActivity:forBatteryLevel:isPluggedIn:](self, "getScoreForActivity:forBatteryLevel:isPluggedIn:", v6, v18, v22);
  v25 = v24;
  if (objc_msgSend(v6, "targetDevice") == (id)1 || objc_msgSend(v6, "targetDevice") == (id)2)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_defaultPairedBatteryKeyPath));
    v27 = v26;
    if (v26)
    {
      v28 = objc_msgSend(v26, "unsignedIntegerValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("watchBatteryLevel == %ld"), v28));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_defaultPairedPluginKeyPath));
      v31 = objc_msgSend(v30, "BOOLValue");

      -[_DASBatteryLevelPolicy getScoreForActivity:forBatteryLevel:isPluggedIn:](self, "getScoreForActivity:forBatteryLevel:isPluggedIn:", v6, v31, (double)(unint64_t)v28);
      if (v25 >= v32)
        v25 = v32;
    }

  }
  v14 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v8, v25, (double)0x384uLL));
LABEL_17:
  v33 = (void *)v14;

  return v33;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (_CDContextualKeyPath)batteryLevelKeyPath
{
  return self->_batteryLevelKeyPath;
}

- (void)setBatteryLevelKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelKeyPath, a3);
}

- (_CDContextualKeyPath)pluginStatusKeyPath
{
  return self->_pluginStatusKeyPath;
}

- (void)setPluginStatusKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_pluginStatusKeyPath, a3);
}

- (_CDContextualKeyPath)defaultPairedBatteryKeyPath
{
  return self->_defaultPairedBatteryKeyPath;
}

- (void)setDefaultPairedBatteryKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPairedBatteryKeyPath, a3);
}

- (_CDContextualKeyPath)defaultPairedPluginKeyPath
{
  return self->_defaultPairedPluginKeyPath;
}

- (void)setDefaultPairedPluginKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPairedPluginKeyPath, a3);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (int64_t)lastSavedBatteryLevel
{
  return self->_lastSavedBatteryLevel;
}

- (void)setLastSavedBatteryLevel:(int64_t)a3
{
  self->_lastSavedBatteryLevel = a3;
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_defaultPairedPluginKeyPath, 0);
  objc_storeStrong((id *)&self->_defaultPairedBatteryKeyPath, 0);
  objc_storeStrong((id *)&self->_pluginStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_batteryLevelKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
