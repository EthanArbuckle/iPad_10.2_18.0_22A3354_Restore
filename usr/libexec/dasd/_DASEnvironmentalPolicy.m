@implementation _DASEnvironmentalPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  id v4;
  BOOL v5;

  v3 = a3;
  if ((objc_msgSend(v3, "backlogged") & 1) != 0 || !objc_msgSend(v3, "requiresPlugin"))
  {
    v5 = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "schedulingPriority");
    v5 = (unint64_t)v4 <= _DASSchedulingPriorityBackground;
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 2.0;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[4];
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("predicate");
  v8[0] = CFSTR("com.apple.duetactivityscheduler.environmentpolicy.ispluggedin");
  v8[1] = v3;
  v7[2] = CFSTR("deviceSet");
  v7[3] = CFSTR("mustWake");
  v8[2] = &off_10016E648;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v5;
}

- (_DASEnvironmentalPolicy)init
{
  _DASEnvironmentalPolicy *v2;
  _DASEnvironmentalPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASEnvironmentalPolicy;
  v2 = -[_DASEnvironmentalPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Environmental Policy");

    v5 = objc_claimAutoreleasedReturnValue(-[_DASEnvironmentalPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A0DC;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB650 != -1)
    dispatch_once(&qword_1001AB650, block);
  return (id)qword_1001AB658;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v4;
  _DASPolicyResponseRationale *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Environmental Policy"));
  if (+[_DASConfig hasRecentlyUpdated](_DASConfig, "hasRecentlyUpdated"))
    goto LABEL_8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASGridDataManager sharedInstance](_DASGridDataManager, "sharedInstance"));
  if ((objc_msgSend(v6, "isHighCarbonImpactWindow") & 1) == 0)
  {

    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));

  if (v7)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v5, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("isInHighCarbonImpactWindow"), 0.0, 1.0);
  if (+[_DASActivityDurationTracker shouldTrackActivity:](_DASActivityDurationTracker, "shouldTrackActivity:", v4))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityDurationTracker sharedInstance](_DASActivityDurationTracker, "sharedInstance"));
    v9 = objc_msgSend(v8, "activityHadEnoughRuntime:", v4);

    if ((v9 & 1) == 0)
    {
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v5, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("hadEnoughRuntime"), 1.0, 0.0);
      goto LABEL_8;
    }
  }
  v10 = 33;
LABEL_9:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v10, v5, (double)0x384uLL));

  return v11;
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
