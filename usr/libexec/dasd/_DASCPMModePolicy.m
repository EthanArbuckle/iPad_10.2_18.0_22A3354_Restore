@implementation _DASCPMModePolicy

- (_DASCPMModePolicy)init
{
  _DASCPMModePolicy *v2;
  _DASCPMModePolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  uint64_t v7;
  _DASCPMModeMonitor *monitor;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASCPMModePolicy;
  v2 = -[_DASCPMModePolicy init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("CPM Mode Policy");

    v5 = objc_claimAutoreleasedReturnValue(-[_DASCPMModePolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_DASCPMModeMonitor sharedMonitor](_DASCPMModeMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (_DASCPMModeMonitor *)v7;

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A774;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABBE8 != -1)
    dispatch_once(&qword_1001ABBE8, block);
  return (id)qword_1001ABBF0;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v5 = CFSTR("identifier");
  v6 = CFSTR("com.apple.das.cpm.modeChanged");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return v3;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "requiresPlugin"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileProtection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](_DASFileProtection, "complete"));
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileProtection"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](_DASFileProtection, "completeUnlessOpen"));
      if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
        if (v9)
          LOBYTE(v6) = 0;
        else
          v6 = !+[_DASConditionScore isPremiumClient:](_DASConditionScore, "isPremiumClient:", v3);

      }
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _DASPolicyResponseRationale *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCPMModeMonitor currentMode](self->_monitor, "currentMode"));
  v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("cpmModes")));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1000E6AB0((uint64_t)v6, (uint64_t)v8, v9);

  if (v8)
  {
    v10 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("CPM Mode Policy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("activeMode == %@"), v8));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v10, "addRationaleWithCondition:", v11);

    if (objc_msgSend(v8, "isEqual:", CFSTR("InUseChargingMode")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastModifiedDateForContextualKeyPath:", v12));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v14, "timeIntervalSinceDate:", v13);
      if (v15 < 900.0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v10, (double)0x384uLL));

        goto LABEL_13;
      }

    }
    else if (objc_msgSend(v8, "isEqual:", CFSTR("AcceleratedChargingMode")))
    {
      v17 = (double)0x384uLL;
      v18 = 33;
LABEL_11:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v18, v10, v17));
LABEL_13:

      goto LABEL_14;
    }
    v17 = (double)0x384uLL;
    v18 = 0;
    goto LABEL_11;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 0, 0, (double)0x384uLL));
LABEL_14:

  return v16;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.das.cpm.modeChanged"), a4) ^ 1;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
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

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (_DASCPMModeMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
