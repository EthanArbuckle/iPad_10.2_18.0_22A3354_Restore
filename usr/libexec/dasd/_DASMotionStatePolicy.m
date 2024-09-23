@implementation _DASMotionStatePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  id v4;
  id v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "motionState");
  if (v4 == (id)_DASMotionStateAny)
  {
    v5 = objc_msgSend(v3, "schedulingPriority");
    if ((unint64_t)v5 >= _DASSchedulingPriorityUserInitiated)
    {
      v6 = 0;
      goto LABEL_8;
    }
    if ((objc_msgSend(v3, "requiresNetwork") & 1) == 0
      && (objc_msgSend(v3, "isIntensive") & 1) == 0)
    {
      v6 = objc_msgSend(v3, "requiresSignificantUserInactivity");
      goto LABEL_8;
    }
  }
  v6 = 1;
LABEL_8:

  return v6;
}

- (NSArray)triggers
{
  return self->_triggers;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForMotionState](_CDContextQueries, "keyPathForMotionState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("predicate");
  v8[0] = CFSTR("com.apple.duetactivityscheduler.motionstatepolicy.motionstatechange");
  v8[1] = v3;
  v7[2] = CFSTR("deviceSet");
  v7[3] = CFSTR("mustWake");
  v8[2] = &off_10016E810;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v5;
}

- (_DASMotionStatePolicy)init
{
  _DASMotionStatePolicy *v2;
  _DASMotionStatePolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASMotionStatePolicy;
  v2 = -[_DASMotionStatePolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Motion State Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_DASMotionStatePolicy initializeTriggers](_DASMotionStatePolicy, "initializeTriggers"));
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
  block[2] = sub_10005B630;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB8A0 != -1)
    dispatch_once(&qword_1001AB8A0, block);
  return (id)qword_1001AB8A8;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _DASPolicyResponseRationale *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForMotionState](_CDContextQueries, "keyPathForMotionState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  v9 = objc_msgSend(v8, "integerValue");
  v10 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Motion State Policy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("motionState = %@"), v11));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v10, "addRationaleWithCondition:", v12);

  v13 = objc_msgSend(v5, "motionState");
  if (v13 != (id)_DASMotionStateAny)
  {
    if (v9 == objc_msgSend(v5, "motionState"))
      v21 = 0;
    else
      v21 = 33;
    v20 = (double)0x384uLL;
    goto LABEL_15;
  }
  if (v9 == v13 || v9 == (id)_DASMotionStateStationary)
    goto LABEL_14;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startBefore"));
  objc_msgSend(v14, "timeIntervalSinceNow");
  v16 = v15;

  if (v16 > 0.0
    && ((objc_msgSend(v5, "isIntensive") & 1) != 0
     || objc_msgSend(v5, "requiresSignificantUserInactivity")))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "requiresSignificantUserInactivity")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "isIntensive")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requiresSignificantUserInactivity == %@ AND isIntensive == %@"), v17, v18));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v10, "addRationaleWithCondition:", v19);

    v20 = (double)0x384uLL;
    v21 = 33;
LABEL_15:
    v23 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v21, v10, v20));
    goto LABEL_16;
  }
  if (!objc_msgSend(v5, "requiresNetwork"))
  {
LABEL_14:
    v20 = (double)0x384uLL;
    v21 = 0;
    goto LABEL_15;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requiresNetwork == YES")));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v10, "addRationaleWithCondition:", v22);

  v23 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v10, 0.1, (double)0x384uLL));
LABEL_16:
  v24 = (void *)v23;

  return v24;
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
