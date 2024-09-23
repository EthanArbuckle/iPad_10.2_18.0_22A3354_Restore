@implementation NANDTelemetry_Base

- (NANDTelemetry_Base)initWithXpcActivityMgr:(id)a3 persistentStateMgr:(id)a4 privacyMgr:(id)a5
{
  id v9;
  id v10;
  id v11;
  NANDTelemetry_Base *v12;
  NANDTelemetry_Base *v13;
  NANDTelemetry_Base *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NANDTelemetry_Base;
  v12 = -[NANDTelemetry_Base init](&v16, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityMgr, a3);
    objc_storeStrong((id *)&v13->_stateMgr, a4);
    objc_storeStrong((id *)&v13->_privacyMgr, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)tryDeferXpcActivity
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base activityMgr](self, "activityMgr"));
  v3 = objc_msgSend(v2, "tryDeferXpcActivity");

  return v3;
}

- (BOOL)isXpcActivityDeferred
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base activityMgr](self, "activityMgr"));
  v3 = objc_msgSend(v2, "isXpcActivityDeferred");

  return v3;
}

+ (BOOL)shouldRegisterActivity
{
  return 1;
}

+ (void)registerActivityWithIdentifier:(const char *)a3 XpcCriteria:(id)a4 ActivityQ:(id)a5 PersistentState:(BOOL)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  BOOL v13;

  v10 = a4;
  v11 = a5;
  if (objc_msgSend(a1, "shouldRegisterActivity"))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100001AE8;
    v12[3] = &unk_10008C808;
    v12[4] = a1;
    v13 = a6;
    SafeXpcActivityRegister(a3, v10, v11, v12);
  }

}

- (XpcActivityManager)activityMgr
{
  return self->_activityMgr;
}

- (void)setActivityMgr:(id)a3
{
  objc_storeStrong((id *)&self->_activityMgr, a3);
}

- (TelemetryPrivacyManager)privacyMgr
{
  return self->_privacyMgr;
}

- (void)setPrivacyMgr:(id)a3
{
  objc_storeStrong((id *)&self->_privacyMgr, a3);
}

- (PersistentStateManager)stateMgr
{
  return self->_stateMgr;
}

- (void)setStateMgr:(id)a3
{
  objc_storeStrong((id *)&self->_stateMgr, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMgr, 0);
  objc_storeStrong((id *)&self->_privacyMgr, 0);
  objc_storeStrong((id *)&self->_activityMgr, 0);
}

@end
