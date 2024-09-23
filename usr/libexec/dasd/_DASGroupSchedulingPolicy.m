@implementation _DASGroupSchedulingPolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupName"));
  if (v4)
  {
    v5 = objc_msgSend(v3, "schedulingPriority");
    v6 = (unint64_t)v5 < _DASSchedulingPriorityUserInitiatedOvercommit;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)weightForActivity:(id)a3
{
  return 0.5;
}

- (_DASGroupSchedulingPolicy)init
{
  _DASGroupSchedulingPolicy *v2;
  _DASGroupSchedulingPolicy *v3;
  NSString *policyName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DASGroupSchedulingPolicy;
  v2 = -[_DASGroupSchedulingPolicy init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Activity Group Policy");

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056C4C;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB7E8 != -1)
    dispatch_once(&qword_1001AB7E8, block);
  return (id)qword_1001AB7F0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _DASPolicyResponseRationale *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));
  v7 = (uint64_t)objc_msgSend(v5, "additionalCapacityForActivity:inGroupWithName:shouldTryToSuspend:", v4, v6, 1);

  if (v7 < 1)
  {
    v9 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Activity Group Policy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%@.currentAvailableLimit == %ld"), v6, v7));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v10);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v9, (double)0x384uLL));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 0, 0, (double)0x384uLL));
  }

  return v8;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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
