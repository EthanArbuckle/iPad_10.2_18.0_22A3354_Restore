@implementation OTSetAccountSettingsOperation

- (OTSetAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 settings:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OTSetAccountSettingsOperation *v15;
  OTSetAccountSettingsOperation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OTSetAccountSettingsOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_settings, a6);
    objc_storeStrong((id *)&v16->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a5);
  }

  return v16;
}

- (void)groupStart
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = objc_alloc_init((Class)NSOperation);
  -[OTSetAccountSettingsOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation settings](self, "settings"));
  if (v5)
  {
    if (-[OTAccountSettings hasWalrus](self->_settings, "hasWalrus"))
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[OTAccountSettings walrus](self->_settings, "walrus"));

      if (v6)
      {
        v6 = objc_alloc_init((Class)TPPBPeerStableInfoSetting);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation settings](self, "settings"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "walrus"));
        objc_msgSend(v6, "setValue:", objc_msgSend(v8, "enabled"));

      }
    }
    else
    {
      v6 = 0;
    }
    if (-[OTAccountSettings hasWebAccess](self->_settings, "hasWebAccess"))
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[OTAccountSettings webAccess](self->_settings, "webAccess"));

      if (v10)
      {
        v10 = objc_alloc_init((Class)TPPBPeerStableInfoSetting);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation settings](self, "settings"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "webAccess"));
        objc_msgSend(v10, "setValue:", objc_msgSend(v12, "enabled"));

      }
    }
    else
    {
      v10 = 0;
    }
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation deps](self, "deps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cuttlefishXPCWrapper"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation deps](self, "deps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeAccount"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001BA864;
    v18[3] = &unk_1002EACC0;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v14, "updateWithSpecificUser:forceRefetch:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:reply:", v16, 0, 0, 0, 0, 0, 0, 0, 0, v6, v10, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation intendedState](self, "intendedState"));
    -[OTSetAccountSettingsOperation setNextState:](self, "setNextState:", v9);

    v17 = (id)objc_claimAutoreleasedReturnValue(-[OTSetAccountSettingsOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);

  }
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (OTAccountSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
