@implementation _DASDataBudgetPolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widgetID"));
  if (!v4 || (v5 = objc_msgSend(v3, "schedulingPriority"), (unint64_t)v5 >= _DASSchedulingPriorityUserInitiated))
  {
    if (!objc_msgSend(v3, "requiresNetwork"))
    {
      v6 = 0;
      goto LABEL_8;
    }
    if ((objc_msgSend(v3, "budgeted") & 1) == 0)
    {
      v6 = objc_msgSend(v3, "dataBudgeted");
      goto LABEL_8;
    }
  }
  v6 = 1;
LABEL_8:

  return v6;
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
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus](_CDContextQueries, "keyPathForNetworkingBudgetRemainingStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBudgetManager sharedInstance](_DASBudgetManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "budgetKeyPathForBudgetName:", CFSTR("com.apple.dasd.baCellular")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v5));

  v13[0] = CFSTR("identifier");
  v13[1] = CFSTR("predicate");
  v14[0] = CFSTR("com.apple.duetactivityscheduler.databudgetpolicy.status");
  v14[1] = v3;
  v13[2] = CFSTR("deviceSet");
  v13[3] = CFSTR("mustWake");
  v14[2] = &off_10016E750;
  v14[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  v15[0] = v7;
  v11[0] = CFSTR("identifier");
  v11[1] = CFSTR("predicate");
  v12[0] = CFSTR("com.apple.das.databaudget.ba.status");
  v12[1] = v6;
  v11[2] = CFSTR("deviceSet");
  v11[3] = CFSTR("mustWake");
  v12[2] = &off_10016E750;
  v12[3] = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
  v15[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));

  return v9;
}

- (_DASDataBudgetPolicy)init
{
  _DASDataBudgetPolicy *v2;
  _DASDataBudgetPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  uint64_t v7;
  _DASComplicationManager *complicationManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASDataBudgetPolicy;
  v2 = -[_DASDataBudgetPolicy init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Data Budget Policy");

    v5 = objc_claimAutoreleasedReturnValue(-[_DASDataBudgetPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_DASComplicationManager sharedInstance](_DASComplicationManager, "sharedInstance"));
    complicationManager = v3->_complicationManager;
    v3->_complicationManager = (_DASComplicationManager *)v7;

  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001AB6F0 != -1)
    dispatch_once(&qword_1001AB6F0, &stru_10015E208);
  return (id)qword_1001AB6F8;
}

+ (BOOL)isBudgetAvailable:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if ((uint64_t)+[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v3) <= 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus](_CDContextQueries, "keyPathForNetworkingBudgetRemainingStatus"));
    v4 = +[_DASDataBudgetPolicy budget:isPositive:](_DASDataBudgetPolicy, "budget:isPositive:", v5, v3);

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)budgetIsPositive:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus](_CDContextQueries, "keyPathForNetworkingBudgetRemainingStatus"));
  LOBYTE(a1) = objc_msgSend(a1, "budget:isPositive:", v5, v4);

  return (char)a1;
}

+ (BOOL)budget:(id)a3 isPositive:(id)a4
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", a3));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
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
    objc_msgSend(v5, "removeConstraint:forSchedulingPriority:", 8, _DASSchedulingPriorityMaintenance);
  else
    objc_msgSend(v5, "addConstraint:forSchedulingPriority:", 8, _DASSchedulingPriorityMaintenance);

}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  BOOL v9;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.databudgetpolicy.status")))
  {
    -[_DASDataBudgetPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v6);
    v7 = +[_DASDataBudgetPolicy budgetIsPositive:](_DASDataBudgetPolicy, "budgetIsPositive:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
    objc_msgSend(v8, "reportNewStatus:forTrigger:", v7, off_1001AB2D0);

    v9 = !v7;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4 rationale:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  const __CFString *v13;
  void *v14;
  BOOL v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v7))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosBudgetOverride](_DASPhotosPolicy, "keyPathForPhotosBudgetOverride"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v10));
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    if ((v12 & 1) != 0)
    {
      v13 = CFSTR("shouldOverrideBudget == YES");
LABEL_7:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v13));
      objc_msgSend(v9, "addRationaleWithCondition:", v14);

      goto LABEL_8;
    }
  }
  if ((uint64_t)+[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", v8) >= 1)
  {
    if (!objc_msgSend(v7, "deferred"))
    {
      v15 = 0;
      goto LABEL_10;
    }
    v13 = CFSTR("deferred == YES");
    goto LABEL_7;
  }
LABEL_8:
  v15 = 1;
LABEL_10:

  return v15;
}

- (double)projectedUsageForActivity:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  uint64_t v8;
  double *v9;
  double v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = +[_DASNetworkEvaluationMonitor inexpensivePathAvailable](_DASNetworkEvaluationMonitor, "inexpensivePathAvailable");
  v8 = (uint64_t)+[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", v5);

  v9 = (double *)&unk_10011CF48;
  if ((v7 & (v8 > 20)) == 0)
    v9 = (double *)&unk_10011CF50;
  v10 = *v9;
  v11 = objc_msgSend(v6, "transferSize");

  return v10 * (double)(unint64_t)((_QWORD)v11 << 10);
}

- (BOOL)budgetAvailableForActivity:(id)a3 withContext:(id)a4 rationale:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v8 = a3;
  v9 = a5;
  -[_DASDataBudgetPolicy projectedUsageForActivity:withContext:](self, "projectedUsageForActivity:withContext:", v8, a4);
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBudgetManager sharedInstance](_DASBudgetManager, "sharedInstance"));
  objc_msgSend(v12, "balanceForBudgetWithName:", CFSTR("com.apple.dasd.systemCellular"));
  v14 = v13;
  objc_msgSend(v12, "capacityForBudgetWithName:", CFSTR("com.apple.dasd.systemCellular"));
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("remainingBudget == %@"), v18));
    objc_msgSend(v9, "addRationaleWithCondition:", v19);

    v20 = v14 > 0.0;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", _DASCTSMinDataBudgetPercentRemainingKey));

    objc_msgSend(v22, "doubleValue");
    if (v22)
    {
      v24 = v23;
    }
    else
    {
      v24 = 0.5;
      if (v11 <= v16 * 0.5)
        v24 = v11 / v16;
    }
    v20 = v14 >= v16 * v24;
    if (v14 < v16 * v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("remainingBudget == %@ AND projectedUsage == %@ and percentage == %@"), v25, v26, v27));
      objc_msgSend(v9, "addRationaleWithCondition:", v28);

    }
  }

  return v20;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DASPolicyResponseRationale *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _DASComplicationManager *complicationManager;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t);
  void *v30;
  _DASDataBudgetPolicy *v31;
  id v32;

  v6 = a3;
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_10004E014;
  v30 = &unk_10015D558;
  v31 = self;
  v7 = a4;
  v32 = v7;
  if (qword_1001AB700 != -1)
    dispatch_once(&qword_1001AB700, &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientDataBudgetName", v27, v28, v29, v30, v31));

  if (!v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBudgetManager sharedInstance](_DASBudgetManager, "sharedInstance")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientDataBudgetName")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "budgetKeyPathForBudgetName:", v10)),
        v10,
        v9,
        !v11))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus](_CDContextQueries, "keyPathForNetworkingBudgetRemainingStatus"));
  }
  v12 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  if (-[_DASDataBudgetPolicy shouldIgnoreBudgetForActivity:withState:rationale:](self, "shouldIgnoreBudgetForActivity:withState:rationale:", v6, v7, v12))
  {
    goto LABEL_10;
  }
  if (+[_DASDataBudgetPolicy budget:isPositive:](_DASDataBudgetPolicy, "budget:isPositive:", v11, v7))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](_DASNetworkQualityPolicy, "policyInstance"));
    if (objc_msgSend(v13, "privateNetworkCellConnection"))
    {

LABEL_10:
      v14 = 0;
      goto LABEL_15;
    }
    v16 = -[_DASDataBudgetPolicy budgetAvailableForActivity:withContext:rationale:](self, "budgetAvailableForActivity:withContext:rationale:", v6, v7, v12);

    if (v16)
      v14 = 0;
    else
      v14 = 33;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v12, "addRationaleForCondition:withRequiredValue:withCurrentValue:", v15, 1.0, 0.0);

    v14 = 33;
  }
LABEL_15:
  v17 = (uint64_t)+[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v7);
  if (v17 >= 1)
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v12, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("wifiQuality"), 20.0, (double)v17);
    v14 = 0;
  }
  v18 = (uint64_t)+[_CDNetworkContext wiredQuality:](_CDNetworkContext, "wiredQuality:", v7);
  if (v18 < 1)
  {
    if (v14)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      complicationManager = self->_complicationManager;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications"));
      if (-[_DASComplicationManager isAnyActiveComplication:](complicationManager, "isAnyActiveComplication:", v21))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
        objc_msgSend(v19, "timeIntervalSinceDate:", v22);
        v24 = v23;

        if (v24 > 1800.0)
          v14 = 0;
      }
      else
      {

      }
    }
  }
  else
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v12, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("wiredQuality"), 20.0, (double)v18);
    v14 = 0;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v14, v12, (double)0x384uLL));

  return v25;
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
