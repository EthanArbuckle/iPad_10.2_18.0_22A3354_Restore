@implementation SOSClient

- (id)initSOSClientWithAccount:(id)a3
{
  id v5;
  SOSClient *v6;
  SOSClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOSClient;
  v6 = -[SOSClient init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (BOOL)checkEntitlement:(id)a3
{
  return 1;
}

- (void)userPublicKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "userPublicKey:", v4);

}

- (void)kvsPerformanceCounters:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "kvsPerformanceCounters:", v4);

}

- (void)rateLimitingPerformanceCounters:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "rateLimitingPerformanceCounters:", v4);

}

- (void)stashedCredentialPublicKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "stashedCredentialPublicKey:", v4);

}

- (void)assertStashedAccountCredential:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "assertStashedAccountCredential:", v4);

}

- (void)validatedStashedAccountCredential:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v16, "validatedStashedAccountCredential:flowID:deviceSessionID:canSendMetrics:complete:", v15, v14, v13, v7, v12);

}

- (void)stashAccountCredential:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v19, "stashAccountCredential:altDSID:flowID:deviceSessionID:canSendMetrics:complete:", v18, v17, v16, v15, v8, v14);

}

- (void)myPeerInfo:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v16, "myPeerInfo:flowID:deviceSessionID:canSendMetrics:complete:", v15, v14, v13, v7, v12);

}

- (void)circleHash:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "circleHash:", v4);

}

- (void)circleJoiningBlob:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 applicant:(id)a7 complete:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a6;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v19, "circleJoiningBlob:flowID:deviceSessionID:canSendMetrics:applicant:complete:", v18, v17, v16, v9, v15, v14);

}

- (void)joinCircleWithBlob:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 version:(int)a8 complete:(id)a9
{
  uint64_t v9;
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = *(_QWORD *)&a8;
  v10 = a7;
  v16 = a9;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v21, "joinCircleWithBlob:altDSID:flowID:deviceSessionID:canSendMetrics:version:complete:", v20, v19, v18, v17, v10, v9, v16);

}

- (void)initialSyncCredentials:(unsigned int)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  _BOOL8 v9;
  uint64_t v12;
  id v14;
  id v15;
  void (**v16)(id, void *, void *);
  void *v17;
  id v18;

  v9 = a7;
  v12 = *(_QWORD *)&a3;
  v18 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *, void *))a8;
  if (-[SOSClient checkEntitlement:](self, "checkEntitlement:", CFSTR("com.apple.private.security.initial-sync")))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
    objc_msgSend(v17, "initialSyncCredentials:altDSID:flowID:deviceSessionID:canSendMetrics:complete:", v12, v18, v14, v15, v9, v16);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kSOSErrorDomain, 7, 0));
    v16[2](v16, &__NSArray0__struct, v17);
  }

}

- (void)importInitialSyncCredentials:(id)a3 complete:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (-[SOSClient checkEntitlement:](self, "checkEntitlement:", CFSTR("com.apple.private.security.initial-sync")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
    objc_msgSend(v7, "importInitialSyncCredentials:complete:", v8, v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kSOSErrorDomain, 7, 0));
    v6[2](v6, 0, v7);
  }

}

- (void)rpcTriggerSync:(id)a3 complete:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[SOSClient SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
    objc_msgSend(v7, "rpcTriggerSync:complete:", v8, v6);

  }
  else
  {
    v6[2](v6, 1, 0);
  }

}

- (void)getWatchdogParameters:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "getWatchdogParameters:", v4);

}

- (void)setWatchdogParmeters:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v8, "setWatchdogParmeters:complete:", v7, v6);

}

- (void)ghostBust:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v7, "ghostBust:complete:", v4, v6);

}

- (void)ghostBustTriggerTimed:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v7, "ghostBustTriggerTimed:complete:", v4, v6);

}

- (void)ghostBustPeriodic:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v7, "ghostBustPeriodic:complete:", v4, v6);

}

- (void)ghostBustInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "ghostBustInfo:", v4);

}

- (void)iCloudIdentityStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "iCloudIdentityStatus:", v4);

}

- (void)accountStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "accountStatus:", v4);

}

- (void)keyStatusFor:(int)a3 complete:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v7, "keyStatusFor:complete:", v4, v6);

}

- (void)rpcTriggerBackup:(id)a3 complete:(id)a4
{
  void (**v6)(id, id);
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, id))a4;
  if (-[SOSClient SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
    objc_msgSend(v7, "rpcTriggerBackup:complete:", v9, v6);
  }
  else
  {
    v8 = objc_alloc((Class)NSError);
    v7 = objc_msgSend(v8, "initWithDomain:code:userInfo:", kSOSErrorDomain, 10, &__NSDictionary0__struct);
    v6[2](v6, v7);
  }

}

- (void)rpcTriggerRingUpdate:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  if (-[SOSClient SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
    objc_msgSend(v6, "rpcTriggerRingUpdate:", v4);
  }
  else
  {
    v5 = objc_alloc((Class)NSError);
    v6 = objc_msgSend(v5, "initWithDomain:code:userInfo:", kSOSErrorDomain, 10, &__NSDictionary0__struct);
    v4[2](v4);
  }

}

- (void)iCloudIdentityStatus_internal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "iCloudIdentityStatus_internal:", v4);

}

- (void)removeV0Peers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v5, "removeV0Peers:", v4);

}

- (void)SOSMonitorModeDisableSOS
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10021693C;
  v4[3] = &unk_1002ED920;
  v4[4] = self;
  objc_msgSend(v3, "performTransaction:", v4);

}

- (void)SOSMonitorModeEnableSOS
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10021690C;
  v4[3] = &unk_1002ED920;
  v4[4] = self;
  objc_msgSend(v3, "performTransaction:", v4);

}

- (void)SOSMonitorModeSOSIsActiveWithCallback:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021687C;
  v7[3] = &unk_1002ED970;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performTransaction:", v7);

}

- (BOOL)SOSMonitorModeSOSIsActive
{
  NSObject *v3;
  _QWORD v5[4];
  NSObject *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100216868;
  v5[3] = &unk_1002ED998;
  v7 = &v8;
  v3 = dispatch_semaphore_create(0);
  v6 = v3;
  -[SOSClient SOSMonitorModeSOSIsActiveWithCallback:](self, "SOSMonitorModeSOSIsActiveWithCallback:", v5);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (id)SOSMonitorModeSOSIsActiveDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "SOSMonitorModeSOSIsActiveDescription"));

  return v3;
}

- (void)setBypass:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSClient account](self, "account"));
  objc_msgSend(v7, "setBypass:reply:", v4, v6);

}

- (SOSAccount)account
{
  return (SOSAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
