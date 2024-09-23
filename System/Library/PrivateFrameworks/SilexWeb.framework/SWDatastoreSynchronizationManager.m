@implementation SWDatastoreSynchronizationManager

- (SWDatastoreSynchronizationManager)initWithSettingsFactory:(id)a3 scriptsManager:(id)a4 messageHandlerManager:(id)a5 sessionManager:(id)a6 logger:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SWDatastoreSynchronizationManager *v18;
  SWDatastoreSynchronizationManager *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SWDatastoreSynchronizationManager;
  v18 = -[SWDatastoreSynchronizationManager init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_settingsFactory, a3);
    objc_storeStrong((id *)&v19->_scriptsManager, a4);
    objc_storeStrong((id *)&v19->_sessionManager, a6);
    objc_storeStrong((id *)&v19->_logger, a7);
    objc_msgSend(v15, "addMessageHandler:name:", v19, CFSTR("datastore"));
    objc_msgSend(v15, "addMessageHandler:name:", v19, CFSTR("localDatastore"));
  }

  return v19;
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("localDatastore"));

  -[SWDatastoreSynchronizationManager logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "body");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v7)
  {
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Received local datastore update message: %@"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "log:", v12);

    -[SWDatastoreSynchronizationManager settingsFactory](self, "settingsFactory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createDatastoreFromMessage:", v5);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    -[SWDatastoreSynchronizationManager localDatastoreManager](self, "localDatastoreManager");
  }
  else
  {
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Received shared datastore update message: %@"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "log:", v14);

    -[SWDatastoreSynchronizationManager settingsFactory](self, "settingsFactory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createDatastoreFromMessage:", v5);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    -[SWDatastoreSynchronizationManager datastoreManager](self, "datastoreManager");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWDatastoreSynchronizationManager sessionManager](self, "sessionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "session");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateDatastore:originatingSession:forceUpdate:completion:", v19, v18, 0, 0);

}

- (void)synchronizeDatastore:(id)a3 from:(id)a4 previousDatastore:(id)a5 originatingSession:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __objc2_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[SWDatastoreSynchronizationManager localDatastoreManager](self, "localDatastoreManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[SWDatastoreSynchronizationManager logger](self, "logger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v13, "identifier");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v17 == v15)
  {
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Received local datastore change callback with originating session: %@"), v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "log:", v24);

    v23 = SWLocalDatastoreUpdateScript;
  }
  else
  {
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Received shared datastore change callback with originating session: %@"), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "log:", v22);

    v23 = SWDatastoreUpdateScript;
  }
  v29 = (id)objc_msgSend([v23 alloc], "initWithDatastore:oldDatastore:originatingSession:", v16, v14, v13);

  -[SWDatastoreSynchronizationManager scriptsManager](self, "scriptsManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeScriptByIdentifier:", v26);

  -[SWDatastoreSynchronizationManager scriptsManager](self, "scriptsManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "executeScript:completion:", v29, v12);

  -[SWDatastoreSynchronizationManager scriptsManager](self, "scriptsManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addScript:", v29);

}

- (SWDatastoreManager)datastoreManager
{
  return (SWDatastoreManager *)objc_loadWeakRetained((id *)&self->_datastoreManager);
}

- (void)setDatastoreManager:(id)a3
{
  objc_storeWeak((id *)&self->_datastoreManager, a3);
}

- (SWDatastoreManager)localDatastoreManager
{
  return (SWDatastoreManager *)objc_loadWeakRetained((id *)&self->_localDatastoreManager);
}

- (void)setLocalDatastoreManager:(id)a3
{
  objc_storeWeak((id *)&self->_localDatastoreManager, a3);
}

- (SWDatastoreFactory)settingsFactory
{
  return self->_settingsFactory;
}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (SWSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_scriptsManager, 0);
  objc_storeStrong((id *)&self->_settingsFactory, 0);
  objc_destroyWeak((id *)&self->_localDatastoreManager);
  objc_destroyWeak((id *)&self->_datastoreManager);
}

@end
