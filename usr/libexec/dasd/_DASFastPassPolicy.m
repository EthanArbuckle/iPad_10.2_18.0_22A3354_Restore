@implementation _DASFastPassPolicy

+ (id)policyInstance
{
  if (qword_1001AB7B8 != -1)
    dispatch_once(&qword_1001AB7B8, &stru_10015E2F8);
  return (id)qword_1001AB7C0;
}

- (_DASFastPassPolicy)init
{
  _DASFastPassPolicy *v2;
  _DASFastPassPolicy *v3;
  NSString *policyName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DASFastPassPolicy;
  v2 = -[_DASFastPassPolicy init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Fast Pass Policy");

    v3->_fastPassShallYield = 0;
  }
  return v3;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (_os_feature_enabled_impl("DAS", "fastpass_yield"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateFastPassShallYield:(BOOL)a3
{
  _BOOL4 v3;
  dispatch_time_t v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];

  v3 = a3;
  if (_os_feature_enabled_impl("DAS", "fastpass_yield"))
  {
    self->_fastPassShallYield = v3;
    if (v3)
    {
      v5 = dispatch_time(0, 900000000000);
      global_queue = dispatch_get_global_queue(9, 0);
      v7 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005490C;
      block[3] = &unk_10015D4E0;
      block[4] = self;
      dispatch_after(v5, v7, block);

    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("fastpasspolicy")));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1000E2284(v8);

  }
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  int64_t v5;
  void *v6;
  void *v7;

  v5 = -[_DASFastPassPolicy makeDecisionBasedOnSystemConstraints](self, "makeDecisionBasedOnSystemConstraints", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFastPassPolicy rationaleWithAllSystemConditions](self, "rationaleWithAllSystemConditions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v5, v6, 900.0));

  return v7;
}

- (int64_t)makeDecisionBasedOnSystemConstraints
{
  if (self->_fastPassShallYield)
    return 100;
  else
    return 0;
}

- (id)rationaleWithAllSystemConditions
{
  _DASPolicyResponseRationale *v3;
  _DASPolicyResponseRationale *v4;
  double v5;

  v3 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Fast Pass Policy"));
  v4 = v3;
  v5 = 1.0;
  if (!self->_fastPassShallYield)
    v5 = 0.0;
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v3, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("fastPassShallYield"), 0.0, v5);
  return v4;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 0.001;
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)fastPassShallYield
{
  return self->_fastPassShallYield;
}

- (void)setFastPassShallYield:(BOOL)a3
{
  self->_fastPassShallYield = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
}

@end
