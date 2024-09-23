@implementation _DASLowPowerModePolicy

- (NSArray)triggers
{
  return self->_triggers;
}

+ (id)policyInstance
{
  if (qword_1001AB538 != -1)
    dispatch_once(&qword_1001AB538, &stru_10015DC60);
  return (id)qword_1001AB540;
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

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  LODWORD(self) = -[_DASLowPowerModePolicy isLowPowerModePolicyEnforced:](self, "isLowPowerModePolicyEnforced:", v7);

  if ((_DWORD)self)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
    objc_msgSend(v9, "timeIntervalSinceDate:", v14);
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lowPowerModeEnforced == %@"), v17));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v18);

    if ((objc_msgSend(v6, "budgeted") & 1) != 0)
      goto LABEL_8;
    if (v13 < 1.0)
      v13 = 1.0;
    v20 = objc_msgSend(v6, "schedulingPriority");
    if ((unint64_t)v20 < _DASSchedulingPriorityUtility
      || (v19 = v16 / v13, v16 / v13 < 0.9)
      || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fastPass", v19)), v21, v21))
    {
LABEL_8:
      -[_DASPolicyResponseRationale setResponseOptions:](v8, "setResponseOptions:", (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions", v19) | 1);
      v22 = 33;
    }
    else
    {
      v22 = 0;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v22, v8, (double)0x384uLL));

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 0, v8, (double)0x384uLL));
  }

  return v23;
}

- (BOOL)isLowPowerModePolicyEnforced:(id)a3
{
  id v4;
  void *v5;
  double v6;
  BOOL v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  unsigned int v11;
  char v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", self->_batteryLevelKeyPath));
  objc_msgSend(v5, "doubleValue");
  if (v6 == 0.0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v5, "unsignedIntegerValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", self->_pluginStatusKeyPath));
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = -[_DASLowPowerModePolicy isLowPowerModeEnabledWithContext:](self, "isLowPowerModeEnabledWithContext:", v4);
    v12 = v10 ^ 1;
    if ((unint64_t)v8 < 0x1E)
      v12 = 1;
    if (v11)
      v7 = v12;
    else
      v7 = 0;
  }

  return v7;
}

- (BOOL)isLowPowerModeEnabledWithContext:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", self->_lpmKeyPath));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_lpmKeyPath));
  v11[0] = CFSTR("identifier");
  v11[1] = CFSTR("predicate");
  v12[0] = CFSTR("com.apple.das.batterylevelpolicy.batterylevelchange");
  v12[1] = v3;
  v11[2] = CFSTR("deviceSet");
  v11[3] = CFSTR("mustWake");
  v12[2] = &off_10016E5E8;
  v12[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
  v13[0] = v5;
  v9[0] = CFSTR("identifier");
  v9[1] = CFSTR("predicate");
  v10[0] = CFSTR("com.apple.das.lpmchange");
  v10[1] = v4;
  v9[2] = CFSTR("deviceSet");
  v9[3] = CFSTR("mustWake");
  v10[2] = &off_10016E5E8;
  v10[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));

  return v7;
}

- (_DASLowPowerModePolicy)init
{
  _DASLowPowerModePolicy *v2;
  _DASLowPowerModePolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *batteryLevelKeyPath;
  uint64_t v7;
  _CDContextualKeyPath *lpmKeyPath;
  uint64_t v9;
  _CDContextualKeyPath *pluginStatusKeyPath;
  uint64_t v11;
  NSArray *triggers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_DASLowPowerModePolicy;
  v2 = -[_DASLowPowerModePolicy init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Low Power Mode Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
    batteryLevelKeyPath = v3->_batteryLevelKeyPath;
    v3->_batteryLevelKeyPath = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLowPowerModeStatus](_CDContextQueries, "keyPathForLowPowerModeStatus"));
    lpmKeyPath = v3->_lpmKeyPath;
    v3->_lpmKeyPath = (_CDContextualKeyPath *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
    pluginStatusKeyPath = v3->_pluginStatusKeyPath;
    v3->_pluginStatusKeyPath = (_CDContextualKeyPath *)v9;

    v3->_lastSavedBatteryLevel = 0;
    v11 = objc_claimAutoreleasedReturnValue(-[_DASLowPowerModePolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;

  }
  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
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

- (_CDContextualKeyPath)lpmKeyPath
{
  return self->_lpmKeyPath;
}

- (void)setLpmKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_lpmKeyPath, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_pluginStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_batteryLevelKeyPath, 0);
  objc_storeStrong((id *)&self->_lpmKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
