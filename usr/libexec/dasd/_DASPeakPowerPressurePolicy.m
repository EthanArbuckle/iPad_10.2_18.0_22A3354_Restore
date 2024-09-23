@implementation _DASPeakPowerPressurePolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _DASCTSBypassPeakPowerPressureKey));
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v3, "schedulingPriority");
    v7 = (unint64_t)v8 < _DASSchedulingPriorityUserInitiated;
  }

  return v7;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080474;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABB68 != -1)
    dispatch_once(&qword_1001ABB68, block);
  return (id)qword_1001ABB70;
}

- (_DASPeakPowerPressurePolicy)init
{
  _DASPeakPowerPressurePolicy *v2;
  _DASPeakPowerPressurePolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *peakPowerPressureKeyPath;
  uint64_t v7;
  NSArray *triggers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASPeakPowerPressurePolicy;
  v2 = -[_DASPeakPowerPressurePolicy init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Peak Power Pressure Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/system/peakPowerPressureLevel")));
    peakPowerPressureKeyPath = v3->_peakPowerPressureKeyPath;
    v3->_peakPowerPressureKeyPath = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(-[_DASPeakPowerPressurePolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;

  }
  return v3;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  _QWORD v7[4];
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_peakPowerPressureKeyPath));
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("predicate");
  v7[0] = CFSTR("com.apple.duetactivityscheduler.peakpowerpressurepolicy.peakpowerpressurechange");
  v7[1] = v2;
  v6[2] = CFSTR("deviceSet");
  v6[3] = CFSTR("mustWake");
  v7[2] = &off_10016EA80;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 4));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v4;
}

- (BOOL)isUnderPeakPowerPressureWithContext:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", self->_peakPowerPressureKeyPath));
  v4 = objc_msgSend(v3, "integerValue") != 0;

  return v4;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.peakpowerpressurepolicy.peakpowerpressurechange")))v7 = -[_DASPeakPowerPressurePolicy isUnderPeakPowerPressureWithContext:](self, "isUnderPeakPowerPressureWithContext:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5;
  _DASPolicyResponseRationale *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Peak Power Pressure Policy"));
  LODWORD(self) = -[_DASPeakPowerPressurePolicy isUnderPeakPowerPressureWithContext:](self, "isUnderPeakPowerPressureWithContext:", v5);

  if ((_DWORD)self)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("peakPowerPressure == %@"), &__kCFBooleanTrue));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v6, "addRationaleWithCondition:", v7);

    v8 = 100;
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v8, v6, (double)0x384uLL));

  return v9;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (_CDContextualKeyPath)peakPowerPressureKeyPath
{
  return self->_peakPowerPressureKeyPath;
}

- (void)setPeakPowerPressureKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_peakPowerPressureKeyPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peakPowerPressureKeyPath, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
