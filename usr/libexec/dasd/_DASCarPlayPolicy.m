@implementation _DASCarPlayPolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "schedulingPriority");
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCarplayConnectedStatus](_CDContextQueries, "keyPathForCarplayConnectedStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("predicate");
  v8[0] = CFSTR("com.apple.duetactivityscheduler.carplaypolicy.carplayconnected");
  v8[1] = v3;
  v7[2] = CFSTR("deviceSet");
  v7[3] = CFSTR("mustWake");
  v8[2] = &off_10016E708;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v5;
}

- (_DASCarPlayPolicy)init
{
  _DASCarPlayPolicy *v2;
  _DASCarPlayPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASCarPlayPolicy;
  v2 = -[_DASCarPlayPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Carplay Connected Policy");

    v5 = objc_claimAutoreleasedReturnValue(-[_DASCarPlayPolicy initializeTriggers](v3, "initializeTriggers"));
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
  block[2] = sub_10004C1A4;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB6B0 != -1)
    dispatch_once(&qword_1001AB6B0, block);
  return (id)qword_1001AB6B8;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.carplaypolicy.carplayconnected")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCarplayConnectedStatus](_CDContextQueries, "keyPathForCarplayConnectedStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  _DASPolicyResponseRationale *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCarplayConnectedStatus](_CDContextQueries, "keyPathForCarplayConnectedStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Carplay Connected Policy"));
  if (!v9)
    goto LABEL_5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("carplayConnected = %@"), v11));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v10, "addRationaleWithCondition:", v12);

  if ((objc_msgSend(v5, "requiresDeviceInactivity") & 1) != 0
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASThermalPolicy policyInstance](_DASThermalPolicy, "policyInstance")),
        v14 = objc_msgSend(v13, "thermalPressureWithState:", v6),
        v13,
        v14 >= 0x14))
  {
    v15 = 33;
  }
  else
  {
LABEL_5:
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v15, v10, (double)0x384uLL));

  return v16;
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
