@implementation _DASSmartPowerNapPolicy

- (NSArray)triggers
{
  return self->triggers;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C7A4;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABA00 != -1)
    dispatch_once(&qword_1001ABA00, block);
  return (id)qword_1001ABA08;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  id v6;

  v3 = a3;
  if ((objc_msgSend(v3, "useStatisticalModelForTriggersRestart") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      v6 = objc_msgSend(v3, "schedulingPriority");
      v4 = (unint64_t)v6 < _DASSchedulingPriorityUserInitiated;
    }

  }
  return v4;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  _DASPolicyResponseRationale *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  id v32;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSmartPowerNapMonitor sharedMonitorWithDaemon:](_DASSmartPowerNapMonitor, "sharedMonitorWithDaemon:", v8));

  v10 = objc_msgSend(v9, "inSmartPowerNap");
  v11 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  if (!objc_msgSend(v6, "requiresSignificantUserInactivity"))
  {
    if (!v10)
      goto LABEL_13;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
    if (objc_msgSend(v13, "isEqualToString:", _DASLaunchReasonBackgroundRefresh))
    {

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
      v15 = objc_msgSend(v14, "isEqualToString:", _DASLaunchReasonBackgroundFetch);

      if ((v15 & 1) == 0)
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widgetID"));
        if (v18)
        {
          v19 = (void *)v18;
          v20 = objc_msgSend(v6, "targetDevice");

          if (!v20)
          {
            v12 = CFSTR("smartPowerNap == YES AND LocalWidget == YES");
            goto LABEL_9;
          }
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_pluginStatusKeyPath));
        v22 = objc_msgSend(v21, "BOOLValue");

        if ((v22 & 1) == 0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
          objc_msgSend(v25, "timeIntervalSinceDate:", v26);
          v28 = v27;

          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
          objc_msgSend(v29, "timeIntervalSinceNow");
          v31 = v30;

          if ((objc_msgSend(v6, "budgeted") & 1) != 0)
          {
            v12 = CFSTR("smartPowerNap == YES");
            goto LABEL_9;
          }
          if (v28 < 1.0)
            v28 = 1.0;
          v32 = objc_msgSend(v6, "schedulingPriority");
          v12 = CFSTR("smartPowerNap == YES");
          if ((unint64_t)v32 < _DASSchedulingPriorityUtility || -v31 / v28 < 0.9)
            goto LABEL_9;
        }
LABEL_13:
        v17 = 0;
        goto LABEL_14;
      }
    }
    v12 = CFSTR("smartPowerNap == YES AND LaunchReason == BackgroundRefresh");
    goto LABEL_9;
  }
  if ((v10 & 1) != 0)
    goto LABEL_13;
  v12 = CFSTR("smartPowerNap == NO");
LABEL_9:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v12));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v11, "addRationaleWithCondition:", v16);

  v17 = 33;
LABEL_14:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v17, v11, (double)0x384uLL));

  return v23;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (_DASSmartPowerNapPolicy)init
{
  _DASSmartPowerNapPolicy *v2;
  _DASSmartPowerNapPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *pluginStatusKeyPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASSmartPowerNapPolicy;
  v2 = -[_DASSmartPowerNapPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("SmartPowerNap Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
    pluginStatusKeyPath = v3->_pluginStatusKeyPath;
    v3->_pluginStatusKeyPath = (_CDContextualKeyPath *)v5;

  }
  return v3;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
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

- (_CDContextualKeyPath)pluginStatusKeyPath
{
  return self->_pluginStatusKeyPath;
}

- (void)setPluginStatusKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_pluginStatusKeyPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
  objc_storeStrong((id *)&self->triggers, 0);
}

@end
