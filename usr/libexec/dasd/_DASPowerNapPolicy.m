@implementation _DASPowerNapPolicy

- (_DASPowerNapPolicy)init
{
  _DASPowerNapPolicy *v2;
  _DASPowerNapPolicy *v3;
  NSString *policyName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DASPowerNapPolicy;
  v2 = -[_DASPowerNapPolicy init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Power Nap Policy");

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005FD5C;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB910 != -1)
    dispatch_once(&qword_1001AB910, block);
  return (id)qword_1001AB918;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)appliesToActivity:(id)a3
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  _DASPolicyResponseRationale *v7;
  void *v8;
  void *v9;
  void *v10;
  NSPredicate *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSleepWakeMonitor sharedMonitorWithDaemon:](_DASSleepWakeMonitor, "sharedMonitorWithDaemon:", v5));

  v7 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Power Nap Policy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "inADarkWake")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("inADarkWake == %@"), v8));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v7, "addRationaleWithCondition:", v9);

  if ((objc_msgSend(v4, "darkWakeEligible") & 1) != 0
    && objc_msgSend(v4, "beforeDaysFirstActivity"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "beforeDaysFirstActivity")));
    v11 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("appRefresh == %@"), v10);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "darkWakeEligible")));
    v11 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("darkWakeEligible == %@"), v10);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v7, "addRationaleWithCondition:", v12);

  if ((objc_msgSend(v6, "canRunInCurrentWakeState:", v4) & 1) != 0)
  {
    if (!objc_msgSend(v4, "darkWakeEligible")
      || (objc_msgSend(v4, "beforeDaysFirstActivity") & 1) != 0
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name")),
          v14 = objc_msgSend(v6, "hasFinishedRunningSinceLastWake:", v13),
          v13,
          !v14))
    {
      v17 = 0;
      goto LABEL_14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("runSinceLastWake == YES")));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v7, "addRationaleWithCondition:", v15);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wakeStateDescription"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("wakeState == (%@)"), v15));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v7, "addRationaleWithCondition:", v16);

    }
  }

  v17 = 33;
LABEL_14:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v17, v7, (double)0x384uLL));

  return v18;
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
