@implementation _DASBootTimePolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(v3, "schedulingPriority");
    v5 = (unint64_t)v6 < _DASSchedulingPriorityUserInitiated;
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (_DASBootTimePolicy)init
{
  _DASBootTimePolicy *v2;
  _DASBootTimePolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSDate *bootTime;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASBootTimePolicy;
  v2 = -[_DASBootTimePolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Boot Time Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_DASBootTimePolicy getDeviceBootTime](_DASBootTimePolicy, "getDeviceBootTime"));
    bootTime = v3->_bootTime;
    v3->_bootTime = (NSDate *)v5;

    *(_WORD *)&v3->_didExceedMinDurationAfterBoot = 0;
    v3->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary = 0;
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001AB638 != -1)
    dispatch_once(&qword_1001AB638, &stru_10015E120);
  return (id)qword_1001AB640;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

+ (id)getDeviceBootTime
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  int v9[2];

  v2 = (void *)qword_1001AB648;
  if (!qword_1001AB648)
  {
    v6 = 0;
    v7 = 0;
    *(_QWORD *)v9 = 0x1500000001;
    v8 = 16;
    if (sysctl(v9, 2u, &v6, &v8, 0, 0) != -1)
    {
      v3 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(int)v7 / 1000000.0 + (double)v6));
      v4 = (void *)qword_1001AB648;
      qword_1001AB648 = v3;

    }
    v2 = (void *)qword_1001AB648;
  }
  return v2;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5;
  _DASPolicyResponseRationale *v6;
  NSDate *v7;
  NSDate *bootTime;
  id v9;
  _BOOL4 v10;
  double v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  unsigned int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  char v22;

  v5 = a3;
  v6 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  if (!self->_bootTime)
  {
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[_DASBootTimePolicy getDeviceBootTime](_DASBootTimePolicy, "getDeviceBootTime"));
    bootTime = self->_bootTime;
    self->_bootTime = v7;

  }
  v9 = objc_msgSend(v5, "schedulingPriority");
  if ((unint64_t)v9 >= _DASSchedulingPriorityUtility)
  {
    objc_msgSend(v5, "interval");
    v10 = v11 == 0.0;
  }
  else
  {
    v10 = 0;
  }
  v12 = objc_msgSend(v5, "requiresNetwork");
  if (self->_bootTime)
  {
    if (!self->_didExceedMinDurationAfterBoot)
    {
      v16 = v12;
      if ((!v12 || !self->_didExceedMinDurationAfterBootNetworkActivites)
        && (!v10 || !self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v17, "timeIntervalSinceDate:", self->_bootTime);
        v19 = v18;

        if (v19 >= -15.0)
          v20 = v19;
        else
          v20 = 301.0;
        v21 = 120.0;
        if (!v16)
          v21 = 300.0;
        if (v10)
          v21 = 15.0;
        if (v20 <= 300.0)
        {
          if (v20 > 120.0)
            v22 = v16;
          else
            v22 = 0;
          if ((v22 & 1) == 0)
          {
            if (v20 <= 15.0 || !v10)
            {
              v13 = 33;
              goto LABEL_29;
            }
LABEL_28:
            v13 = 0;
            self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary = 1;
LABEL_29:
            -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v6, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("Minimum seconds after boot"), v21);
            goto LABEL_9;
          }
        }
        else
        {
          self->_didExceedMinDurationAfterBoot = 1;
        }
        self->_didExceedMinDurationAfterBootNetworkActivites = 1;
        goto LABEL_28;
      }
    }
  }
  v13 = 0;
LABEL_9:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v13, v6, (double)0x384uLL));

  return v14;
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

- (NSDate)bootTime
{
  return self->_bootTime;
}

- (void)setBootTime:(id)a3
{
  objc_storeStrong((id *)&self->_bootTime, a3);
}

- (BOOL)didExceedMinDurationAfterBoot
{
  return self->_didExceedMinDurationAfterBoot;
}

- (void)setDidExceedMinDurationAfterBoot:(BOOL)a3
{
  self->_didExceedMinDurationAfterBoot = a3;
}

- (BOOL)didExceedMinDurationAfterBootNetworkActivites
{
  return self->_didExceedMinDurationAfterBootNetworkActivites;
}

- (void)setDidExceedMinDurationAfterBootNetworkActivites:(BOOL)a3
{
  self->_didExceedMinDurationAfterBootNetworkActivites = a3;
}

- (BOOL)didExceedMinDurationAfterBootNonRepeatingNonDiscretionary
{
  return self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary;
}

- (void)setDidExceedMinDurationAfterBootNonRepeatingNonDiscretionary:(BOOL)a3
{
  self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootTime, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
