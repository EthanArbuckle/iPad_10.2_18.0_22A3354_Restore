@implementation KTContextDependencies

- (KTContextDependencies)initWithOperationDependencies:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  KTContextDependencies *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KTContextDependencies;
  v8 = -[KTContextDependencies init](&v22, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicKeyStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationPublicKeyStore:", v7));
    -[KTContextDependencies setApplicationKeyStore:](v8, "setApplicationKeyStore:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataStore"));
    -[KTContextDependencies setDataStore:](v8, "setDataStore:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "staticKeyStore"));
    -[KTContextDependencies setStaticKeyStore:](v8, "setStaticKeyStore:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logClient"));
    -[KTContextDependencies setLogClient:](v8, "setLogClient:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextStore"));
    -[KTContextDependencies setContextStore:](v8, "setContextStore:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountKeyService"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountKeyService:", v7));
    -[KTContextDependencies setAccountKeyServer:](v8, "setAccountKeyServer:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kvs"));
    -[KTContextDependencies setKvs:](v8, "setKvs:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "followup"));
    -[KTContextDependencies setFollowup:](v8, "setFollowup:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudRecords"));
    -[KTContextDependencies setCloudRecords:](v8, "setCloudRecords:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "settings"));
    -[KTContextDependencies setSettings:](v8, "setSettings:", v20);

  }
  return v8;
}

- (KTApplicationPublicKeyStore)applicationKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplicationKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (KTSMDataStore)smDataStore
{
  return (KTSMDataStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSmDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStaticKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTLogClientProtocol)logClient
{
  return (KTLogClientProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (KTContextStore)contextStore
{
  return (KTContextStore *)objc_loadWeakRetained((id *)&self->_contextStore);
}

- (void)setContextStore:(id)a3
{
  objc_storeWeak((id *)&self->_contextStore, a3);
}

- (KTSMManager)stateMachine
{
  return (KTSMManager *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
  objc_storeWeak((id *)&self->_stateMachine, a3);
}

- (KTAccountKeyProtocol)accountKeyServer
{
  return (KTAccountKeyProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccountKeyServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (KTKVSProtocol)kvs
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKvs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFollowup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCloudRecords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (TransparencyAnalytics)analyticsLogger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAnalyticsLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_cloudRecords, 0);
  objc_storeStrong((id *)&self->_followup, 0);
  objc_storeStrong((id *)&self->_kvs, 0);
  objc_storeStrong((id *)&self->_accountKeyServer, 0);
  objc_destroyWeak((id *)&self->_stateMachine);
  objc_destroyWeak((id *)&self->_contextStore);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_storeStrong((id *)&self->_staticKeyStore, 0);
  objc_storeStrong((id *)&self->_smDataStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_applicationKeyStore, 0);
}

@end
