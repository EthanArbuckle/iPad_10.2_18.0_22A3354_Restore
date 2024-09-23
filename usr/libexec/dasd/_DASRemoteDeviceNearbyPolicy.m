@implementation _DASRemoteDeviceNearbyPolicy

- (BOOL)appliesToActivity:(id)a3
{
  return objc_msgSend(a3, "targetDevice") == (id)3;
}

- (_DASRemoteDeviceNearbyPolicy)init
{
  _DASRemoteDeviceNearbyPolicy *v2;
  _DASRemoteDeviceNearbyPolicy *v3;
  NSString *policyName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DASRemoteDeviceNearbyPolicy;
  v2 = -[_DASRemoteDeviceNearbyPolicy init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Remote Device Nearby Policy");

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DE05C;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABEC8 != -1)
    dispatch_once(&qword_1001ABEC8, block);
  return (id)qword_1001ABED0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _DASPolicyResponseRationale *v8;
  _DASPolicyResponseRationale *v9;
  double v10;
  uint64_t v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "remoteDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRemoteDeviceNearbyMonitor sharedMonitorWithDaemon:](_DASRemoteDeviceNearbyMonitor, "sharedMonitorWithDaemon:", v6));

  LODWORD(v6) = objc_msgSend(v7, "isRemoteDeviceNearby:", v5);
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  v9 = v8;
  v10 = 1.0;
  if ((_DWORD)v6)
  {
    v11 = 0;
  }
  else
  {
    v10 = 0.0;
    v11 = 33;
  }
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("remoteDeviceNearby"), 1.0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v11, v9, (double)0x384uLL));

  return v12;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
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
