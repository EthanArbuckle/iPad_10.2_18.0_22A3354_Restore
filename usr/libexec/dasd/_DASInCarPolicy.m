@implementation _DASInCarPolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 2.0;
}

- (id)initializeTriggers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_inCarKeyPath));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_navigationKeyPath));
  v11[0] = CFSTR("identifier");
  v11[1] = CFSTR("predicate");
  v12[0] = CFSTR("com.apple.duetactivityscheduler.incarpolicy.incar");
  v12[1] = v3;
  v11[2] = CFSTR("deviceSet");
  v11[3] = CFSTR("mustWake");
  v12[2] = &off_10016E7C8;
  v12[3] = &__kCFBooleanFalse;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
  v13[0] = v5;
  v9[0] = CFSTR("identifier");
  v9[1] = CFSTR("predicate");
  v10[0] = CFSTR("com.apple.duetactivityscheduler.incarpolicy.nav");
  v10[1] = v4;
  v9[2] = CFSTR("deviceSet");
  v9[3] = CFSTR("mustWake");
  v10[2] = &off_10016E7C8;
  v10[3] = &__kCFBooleanFalse;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));

  return v7;
}

- (_DASInCarPolicy)init
{
  _DASInCarPolicy *v2;
  _DASInCarPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *inCarKeyPath;
  uint64_t v7;
  _CDContextualKeyPath *navigationKeyPath;
  uint64_t v9;
  NSArray *triggers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DASInCarPolicy;
  v2 = -[_DASInCarPolicy init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("In Car Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/car/isConnected")));
    inCarKeyPath = v3->_inCarKeyPath;
    v3->_inCarKeyPath = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/maps/navigationInProgress")));
    navigationKeyPath = v3->_navigationKeyPath;
    v3->_navigationKeyPath = (_CDContextualKeyPath *)v7;

    v9 = objc_claimAutoreleasedReturnValue(-[_DASInCarPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v9;

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000570B4;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB7F8 != -1)
    dispatch_once(&qword_1001AB7F8, block);
  return (id)qword_1001AB800;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.incarpolicy.incar")) & 1) != 0)
  {
    v8 = 32;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.incarpolicy.nav")))
    {
      v10 = 0;
      goto LABEL_7;
    }
    v8 = 40;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", *(Class *)((char *)&self->super.isa + v8)));
  v10 = objc_msgSend(v9, "BOOLValue");

LABEL_7:
  return v10;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  _CDContextualKeyPath *inCarKeyPath;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  _DASPolicyResponseRationale *v16;
  void *v17;
  double v18;
  void *v19;
  NSPredicate *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;

  v6 = a3;
  inCarKeyPath = self->_inCarKeyPath;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", inCarKeyPath));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", self->_navigationKeyPath));
  v12 = objc_msgSend(v11, "BOOLValue");

  if ((v10 & 1) != 0 || (v12 & 1) != 0)
  {
    v14 = objc_msgSend(v6, "isIntensive");
    v15 = objc_msgSend(v6, "requiresDeviceInactivity");
    v16 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("In Car Policy"));
    if (v12)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("navigationInProgress == YES")));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v16, "addRationaleWithCondition:", v17);

      if (v14)
      {
LABEL_9:
        v20 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isIntensive == %u"), 1);
LABEL_15:
        v25 = (void *)objc_claimAutoreleasedReturnValue(v20);
        -[_DASPolicyResponseRationale addRationaleWithCondition:](v16, "addRationaleWithCondition:", v25);

        v26 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 33, v16, (double)0x384uLL));
LABEL_17:
        v13 = (void *)v26;

        goto LABEL_18;
      }
      if (v15)
      {
        v20 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requiresInactive == %u"), 1);
        goto LABEL_15;
      }
      v21 = objc_msgSend(v6, "schedulingPriority");
      v18 = 0.1;
      if ((unint64_t)v21 < _DASSchedulingPriorityUtility)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
        objc_msgSend(v22, "timeIntervalSinceNow");
        v24 = v23;

        if (v24 > 0.0)
        {
          v20 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("priority == %llu && timeUntilDeadline > 0"), objc_msgSend(v6, "schedulingPriority"));
          goto LABEL_15;
        }
      }
    }
    else
    {
      v18 = 1.0;
      if (v10)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("inCar == YES")));
        -[_DASPolicyResponseRationale addRationaleWithCondition:](v16, "addRationaleWithCondition:", v19);

        v18 = 0.5;
        if (v14)
          goto LABEL_9;
      }
    }
    v26 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v16, v18, (double)0x384uLL));
    goto LABEL_17;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 0, 0, (double)0x384uLL));
LABEL_18:

  return v13;
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

- (_CDContextualKeyPath)inCarKeyPath
{
  return self->_inCarKeyPath;
}

- (void)setInCarKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_inCarKeyPath, a3);
}

- (_CDContextualKeyPath)navigationKeyPath
{
  return self->_navigationKeyPath;
}

- (void)setNavigationKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_navigationKeyPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationKeyPath, 0);
  objc_storeStrong((id *)&self->_inCarKeyPath, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
