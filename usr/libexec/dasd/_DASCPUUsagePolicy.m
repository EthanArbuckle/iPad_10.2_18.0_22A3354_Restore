@implementation _DASCPUUsagePolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  void *v7;
  double v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated
    || (objc_msgSend(v3, "triggersRestart") & 1) != 0
    || (objc_msgSend(v3, "isIntensive") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startBefore"));
    objc_msgSend(v7, "timeIntervalSinceNow");
    v5 = v8 >= 0.0;

  }
  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

+ (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[4];
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCPUUsageLevel](_CDContextQueries, "keyPathForCPUUsageLevel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("predicate");
  v8[0] = CFSTR("com.apple.duetactivityscheduler.cpuusagepolicy.cpuusagelevelchange");
  v8[1] = v3;
  v7[2] = CFSTR("deviceSet");
  v7[3] = CFSTR("mustWake");
  v8[2] = &off_10016E720;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v5;
}

- (_DASCPUUsagePolicy)init
{
  _DASCPUUsagePolicy *v2;
  _DASCPUUsagePolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASCPUUsagePolicy;
  v2 = -[_DASCPUUsagePolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("CPU Usage Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_DASCPUUsagePolicy initializeTriggers](_DASCPUUsagePolicy, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001AB6C0 != -1)
    dispatch_once(&qword_1001AB6C0, &stru_10015E1E0);
  return (id)qword_1001AB6C8;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.cpuusagepolicy.cpuusagelevelchange")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCPUUsageLevel](_CDContextQueries, "keyPathForCPUUsageLevel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
    v8 = objc_msgSend(v7, "integerValue");

    v9 = v8 != (id)qword_1001ABF00;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  unsigned int v17;
  _DASPolicyResponseRationale *v18;
  uint64_t v19;
  id v20;
  id v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  double v27;
  void *v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  objc_msgSend(v9, "timeIntervalSinceNow");
  v11 = v10;

  if (v11 < 0.0)
  {
    v12 = (double)0x384uLL;
    v13 = 0;
LABEL_15:
    v18 = v8;
    goto LABEL_16;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCPUUsageLevel](_CDContextQueries, "keyPathForCPUUsageLevel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v14));
  v16 = objc_msgSend(v15, "integerValue");

  v17 = +[_DASDeviceActivityPolicy isDeviceInUse:](_DASDeviceActivityPolicy, "isDeviceInUse:", v7);
  if ((v17 & 1) != 0 || !+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v6))
  {
    v19 = qword_1001ABF00;
    v20 = objc_msgSend(v6, "schedulingPriority");
    if ((unint64_t)v20 <= _DASSchedulingPriorityBackground)
    {
      v23 = (uint64_t *)&unk_1001AA500;
      if (!v17)
        v23 = &qword_1001AA510;
      v22 = *v23;
    }
    else
    {
      v21 = objc_msgSend(v6, "schedulingPriority");
      if ((unint64_t)v21 <= _DASSchedulingPriorityDefault)
        v22 = qword_1001AA510;
      else
        v22 = v19;
    }
    if ((unint64_t)v16 <= v22)
    {
      v27 = (double)(100 - (uint64_t)v16) / 100.0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("cpuLevel == %@"), v28));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v29);

      v24 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v8, v27, (double)0x384uLL));
      goto LABEL_17;
    }
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("Max allowed CPU Usage level"), (double)v22, (double)(uint64_t)v16);
    v12 = (double)0x384uLL;
    v13 = 33;
    goto LABEL_15;
  }
  v12 = (double)0x384uLL;
  v13 = 0;
  v18 = 0;
LABEL_16:
  v24 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v13, v18, v12));
LABEL_17:
  v25 = (void *)v24;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
