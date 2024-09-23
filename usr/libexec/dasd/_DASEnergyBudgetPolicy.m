@implementation _DASEnergyBudgetPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if (objc_msgSend(v3, "budgeted"))
    v4 = objc_msgSend(v3, "requiresPlugin") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForEnergyBudgetRemainingStatus](_CDContextQueries, "keyPathForEnergyBudgetRemainingStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v10[0] = CFSTR("identifier");
  v10[1] = CFSTR("predicate");
  v11[0] = CFSTR("com.apple.duetactivityscheduler.energybudgetpolicy.status");
  v11[1] = v3;
  v10[2] = CFSTR("deviceSet");
  v10[3] = CFSTR("mustWake");
  v11[2] = &off_10016E798;
  v11[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 4));
  v12[0] = v4;
  v8 = CFSTR("identifier");
  v9 = CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v12[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));

  return v6;
}

- (_DASEnergyBudgetPolicy)init
{
  _DASEnergyBudgetPolicy *v2;
  _DASEnergyBudgetPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  uint64_t v7;
  _DASComplicationManager *complicationManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASEnergyBudgetPolicy;
  v2 = -[_DASEnergyBudgetPolicy init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Energy Budget Policy");

    v5 = objc_claimAutoreleasedReturnValue(-[_DASEnergyBudgetPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_DASComplicationManager sharedInstance](_DASComplicationManager, "sharedInstance"));
    complicationManager = v3->_complicationManager;
    v3->_complicationManager = (_DASComplicationManager *)v7;

  }
  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_1001AB790 != -1)
    dispatch_once(&qword_1001AB790, &stru_10015E2C8);
  return (id)qword_1001AB798;
}

+ (BOOL)isBudgetAvailable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
    v7 = 1;
  else
    v7 = +[_DASEnergyBudgetPolicy budgetIsPositive:](_DASEnergyBudgetPolicy, "budgetIsPositive:", v3);

  return v7;
}

+ (BOOL)budgetIsPositive:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForEnergyBudgetRemainingStatus](_CDContextQueries, "keyPathForEnergyBudgetRemainingStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  if (v5)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 1;

  return v6;
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  LODWORD(self) = objc_msgSend((id)objc_opt_class(self), "isBudgetAvailable:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v6 = v5;
  if ((_DWORD)self)
    objc_msgSend(v5, "removeConstraint:forSchedulingPriority:", 4, _DASSchedulingPriorityMaintenance);
  else
    objc_msgSend(v5, "addConstraint:forSchedulingPriority:", 4, _DASSchedulingPriorityMaintenance);

}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  _BOOL4 v13;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.energybudgetpolicy.status")) & 1) == 0&& !objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin")))
  {
    goto LABEL_6;
  }
  -[_DASEnergyBudgetPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v7);
  v8 = +[_DASEnergyBudgetPolicy budgetIsPositive:](_DASEnergyBudgetPolicy, "budgetIsPositive:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
  objc_msgSend(v9, "reportNewStatus:forTrigger:", v8, off_1001AB2C8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v10));
  v12 = objc_msgSend(v11, "BOOLValue");

  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.energybudgetpolicy.status"))|| !v8|| v12)
  {
    v13 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin")) ^ 1 | v8 | v12 ^ 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  BOOL v9;

  v5 = a4;
  v9 = 0;
  if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if ((v8 & 2) != 0)
      v9 = 1;
  }

  return v9;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  _DASPolicyResponseRationale *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  _DASComplicationManager *complicationManager;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void **v24;
  uint64_t v25;
  id (*v26)(uint64_t);
  void *v27;
  _DASEnergyBudgetPolicy *v28;
  id v29;

  v6 = a3;
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_100053D6C;
  v27 = &unk_10015D558;
  v28 = self;
  v7 = a4;
  v29 = v7;
  if (qword_1001AB7A0 != -1)
    dispatch_once(&qword_1001AB7A0, &v24);
  v8 = [_DASPolicyResponseRationale alloc];
  v9 = -[_DASPolicyResponseRationale initWithPolicyName:](v8, "initWithPolicyName:", self->_policyName, v24, v25, v26, v27, v28);
  if (+[_DASEnergyBudgetPolicy budgetIsPositive:](_DASEnergyBudgetPolicy, "budgetIsPositive:", v7))
    goto LABEL_6;
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v9, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("energyBudget"), 1.0, 0.0);
  if (-[_DASEnergyBudgetPolicy shouldIgnoreBudgetForActivity:withState:](self, "shouldIgnoreBudgetForActivity:withState:", v6, v7))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("shouldOverrideBudget == YES")));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v10);

LABEL_6:
    v11 = 0;
    v12 = 1;
    goto LABEL_8;
  }
  v12 = 0;
  v11 = 33;
LABEL_8:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v9, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("pluggedInStatus"), 1.0, 1.0);
LABEL_11:
    v11 = 0;
    goto LABEL_18;
  }
  if ((v12 & 1) != 0)
    goto LABEL_11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  complicationManager = self->_complicationManager;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications"));
  if (-[_DASComplicationManager isAnyActiveComplication:](complicationManager, "isAnyActiveComplication:", v18))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
    objc_msgSend(v16, "timeIntervalSinceDate:", v19);
    v21 = v20;

    if (v21 > 1800.0)
      v11 = 0;
  }
  else
  {

  }
LABEL_18:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v11, v9, (double)0x384uLL));

  return v22;
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

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (_DASComplicationManager)complicationManager
{
  return self->_complicationManager;
}

- (void)setComplicationManager:(id)a3
{
  objc_storeStrong((id *)&self->_complicationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationManager, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
