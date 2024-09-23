@implementation _DASWidgetRefreshBudgetPolicy

- (BOOL)appliesToActivity:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "widgetBudgetID"));

  return v3 != 0;
}

- (_DASWidgetRefreshBudgetPolicy)init
{
  _DASWidgetRefreshBudgetPolicy *v2;
  uint64_t v3;
  _DASBudgetManager *budgetManager;
  uint64_t v5;
  _CDContextualKeyPath *widgetOverrideKeypath;
  uint64_t v7;
  NSArray *triggers;
  NSString *policyName;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  OS_os_log *log;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_DASWidgetRefreshBudgetPolicy;
  v2 = -[_DASWidgetRefreshBudgetPolicy init](&v16, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASBudgetManager sharedInstance](_DASBudgetManager, "sharedInstance"));
    budgetManager = v2->_budgetManager;
    v2->_budgetManager = (_DASBudgetManager *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", kDASWidgetOverrideKeyPath));
    widgetOverrideKeypath = v2->_widgetOverrideKeypath;
    v2->_widgetOverrideKeypath = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetPolicy initializeTriggers](v2, "initializeTriggers"));
    triggers = v2->_triggers;
    v2->_triggers = (NSArray *)v7;

    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Widget Refresh Policy");

    v10 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.widgetRefreshBudgets"));
    objc_msgSend(v10, "doubleForKey:", CFSTR("usageDelay"));
    if (v11 > 1.0)
      qword_1001AB3A8 = *(_QWORD *)&v11;
    objc_msgSend(v10, "doubleForKey:", CFSTR("infrequentCadence"));
    if (v12 > 1.0)
      qword_1001AB3B0 = *(_QWORD *)&v12;
    v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("widgetRefreshPolicy")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v13;

  }
  return v2;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DF140;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABEE8 != -1)
    dispatch_once(&qword_1001ABEE8, block);
  return (id)qword_1001ABEF0;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  _QWORD v7[4];
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_widgetOverrideKeypath));
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("predicate");
  v7[0] = CFSTR("com.apple.duetactivityscheduler.widget.overridelist");
  v7[1] = v2;
  v6[2] = CFSTR("deviceSet");
  v6[3] = CFSTR("mustWake");
  v7[2] = &off_10016F200;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 4));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v4;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  _DASPolicyResponseRationale *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  NSPredicate *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  uint64_t v38;
  void *v39;

  v7 = a3;
  v8 = a4;
  v9 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Widget Refresh Policy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v10));
  v12 = objc_msgSend(v11, "unsignedLongLongValue");

  if ((v12 & 0xD) != 0)
  {
LABEL_6:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudgetManager widgetRefreshBudgetManager](self->_budgetManager, "widgetRefreshBudgetManager"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widgetBudgetID"));
    objc_msgSend(v24, "balanceForWidgetBudgetID:", v25);
    v27 = v26;

    if (v27 == -INFINITY)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("IndividualBalance=%d"), 0x80000000));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v28);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v9, (double)0x384uLL));
      goto LABEL_17;
    }
    LODWORD(v4) = vcvtmd_s64_f64(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", self->_widgetOverrideKeypath));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widgetBudgetID"));
    v31 = objc_msgSend(v29, "containsObject:", v30);

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("onOverrideList=%d"), 1));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v32);

    }
    if ((int)v4 < 1)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v34));
      v36 = objc_msgSend(v35, "BOOLValue");

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("IndividualBalance=%d"), v4));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v37);

      v38 = 33;
      if (!v36 || (_DWORD)v4)
        goto LABEL_16;
      v33 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isPluggedIn=%d"), 1);
    }
    else
    {
      v33 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("IndividualBalance=%d"), v4);
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(v33);
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v39);

    v38 = 0;
LABEL_16:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v38, v9, (double)0x384uLL));

    goto LABEL_17;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLastUseDate](_CDContextQueries, "keyPathForLastUseDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v15, "timeIntervalSinceDate:", v14);
  v17 = v16;
  if (v16 <= *(double *)&qword_1001AB3A8
    || (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startAfter")),
        objc_msgSend(v15, "timeIntervalSinceDate:", v18),
        v20 = v19,
        v21 = *(double *)&qword_1001AB3B0,
        v18,
        v20 >= v21))
  {

    goto LABEL_6;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("timeSinceRecentUsage=%d"), ((int)v17 / 60)));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v9, (double)0x384uLL));
LABEL_17:

  return v23;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.widget.overridelist"), a4);
  if (v5)
    -[_DASBudgetManager reinstantiateConfiguredBudgets](self->_budgetManager, "reinstantiateConfiguredBudgets");
  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (double)baselineScoreForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 0;
}

- (_DASBudgetManager)budgetManager
{
  return self->_budgetManager;
}

- (void)setBudgetManager:(id)a3
{
  objc_storeStrong((id *)&self->_budgetManager, a3);
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

- (NSArray)overrideListWidgets
{
  return self->_overrideListWidgets;
}

- (void)setOverrideListWidgets:(id)a3
{
  objc_storeStrong((id *)&self->_overrideListWidgets, a3);
}

- (_CDContextualKeyPath)widgetOverrideKeypath
{
  return self->_widgetOverrideKeypath;
}

- (void)setWidgetOverrideKeypath:(id)a3
{
  objc_storeStrong((id *)&self->_widgetOverrideKeypath, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_widgetOverrideKeypath, 0);
  objc_storeStrong((id *)&self->_overrideListWidgets, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
  objc_storeStrong((id *)&self->_budgetManager, 0);
}

@end
