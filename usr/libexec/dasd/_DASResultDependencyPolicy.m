@implementation _DASResultDependencyPolicy

+ (id)policyInstance
{
  if (qword_1001AB4F8 != -1)
    dispatch_once(&qword_1001AB4F8, &stru_10015DA78);
  return (id)qword_1001AB500;
}

- (_DASResultDependencyPolicy)init
{
  _DASResultDependencyPolicy *v2;
  _DASResultDependencyPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _DASActivityDependencyManager *dependencyManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASResultDependencyPolicy;
  v2 = -[_DASResultDependencyPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Result Dependency Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_DASActivityDependencyManager sharedInstance](_DASActivityDependencyManager, "sharedInstance"));
    dependencyManager = v3->_dependencyManager;
    v3->_dependencyManager = (_DASActivityDependencyManager *)v5;

  }
  return v3;
}

- (BOOL)appliesToActivity:(id)a3
{
  return -[_DASActivityDependencyManager isDependentActivity:](self->_dependencyManager, "isDependentActivity:", a3);
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  _BOOL8 v5;
  _DASPolicyResponseRationale *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[_DASActivityDependencyManager areDependenciesSatisfiedFor:](self->_dependencyManager, "areDependenciesSatisfiedFor:", a3, a4);
  v6 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  if (v5)
    v7 = 0;
  else
    v7 = 100;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dependencySatisfaction == %@"), v8));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v6, "addRationaleWithCondition:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v7, v6, (double)0x384uLL));
  return v10;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_DASActivityDependencyManager)dependencyManager
{
  return self->_dependencyManager;
}

- (void)setDependencyManager:(id)a3
{
  objc_storeStrong((id *)&self->_dependencyManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencyManager, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
}

@end
