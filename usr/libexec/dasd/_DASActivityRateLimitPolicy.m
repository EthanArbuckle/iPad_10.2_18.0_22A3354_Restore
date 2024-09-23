@implementation _DASActivityRateLimitPolicy

- (BOOL)appliesToActivity:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "rateLimitConfigurationName"));
  v4 = v3 != 0;

  return v4;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v8 = CFSTR("identifier");
  v9 = CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v10[0] = v2;
  v6 = CFSTR("identifier");
  v7 = CFSTR("com.apple.das.lpmchange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v10[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));

  return v4;
}

- (_DASActivityRateLimitPolicy)init
{
  _DASActivityRateLimitPolicy *v2;
  _DASActivityRateLimitPolicy *v3;
  NSString *policyName;
  NSString *policyDescription;
  uint64_t v6;
  NSArray *triggers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_DASActivityRateLimitPolicy;
  v2 = -[_DASActivityRateLimitPolicy init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("ActivityRateLimitPolicy");

    policyDescription = v3->_policyDescription;
    v3->_policyDescription = (NSString *)CFSTR("Blocks rate limited activities if rate limit configuration group is at capacity.");

    v6 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v6;

  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001AB588 != -1)
    dispatch_once(&qword_1001AB588, &stru_10015DF28);
  return (id)qword_1001AB590;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5;
  _DASPolicyResponseRationale *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v5 = a3;
  v6 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rateLimitConfigurationName"));
  if (v7 && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate")), v8, !v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimitManager sharedLimiter](_DASActivityRateLimitManager, "sharedLimiter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "evaluateRateLimitedActivity:", v5));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "maxedRateLimits"));
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v6, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("ratelimited"), 1.0, 0.0);
      v14 = 33;
    }
    else
    {
      v14 = 0;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v14, v6, (double)0x384uLL));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 0, v6, (double)0x384uLL));
  }

  return v9;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.das.lpmchange")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin")))&& !+[_DASRateLimiterUtilities consideredInLPMWithState:](_DASRateLimiterUtilities, "consideredInLPMWithState:", v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimitManager sharedLimiter](_DASActivityRateLimitManager, "sharedLimiter"));
    objc_msgSend(v8, "recalculateStartDates");

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
