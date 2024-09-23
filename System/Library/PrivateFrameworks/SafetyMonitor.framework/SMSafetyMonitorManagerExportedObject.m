@implementation SMSafetyMonitorManagerExportedObject

- (SMSafetyMonitorManagerExportedObject)initWithSafetyMonitorManager:(id)a3
{
  id v4;
  SMSafetyMonitorManagerExportedObject *v5;
  SMSafetyMonitorManagerExportedObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SMSafetyMonitorManagerExportedObject;
  v5 = -[SMSafetyMonitorManagerExportedObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_safetyMonitorManager, v4);

  return v6;
}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4 withError:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SMSafetyMonitorManagerExportedObject safetyMonitorManager](self, "safetyMonitorManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "onSessionStateChanged:forActiveDevice:withError:", v9, v5, v8);

}

- (void)onLocalSessionStateChanged:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SMSafetyMonitorManagerExportedObject safetyMonitorManager](self, "safetyMonitorManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onLocalSessionStateChanged:withError:", v7, v6);

}

- (void)onInitiatorSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[SMSafetyMonitorManagerExportedObject safetyMonitorManager](self, "safetyMonitorManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "onInitiatorSafetyCacheChangeForSessionID:phoneCache:watchCache:cacheExpiryDate:cacheReleaseDate:", v16, v15, v14, v13, v12);

}

- (void)onReceiverSessionStatusChangeForSessionID:(id)a3 sessionStatus:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SMSafetyMonitorManagerExportedObject safetyMonitorManager](self, "safetyMonitorManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onReceiverSessionStatusChangeForSessionID:sessionStatus:", v7, v6);

}

- (void)onReceiverSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SMSafetyMonitorManagerExportedObject safetyMonitorManager](self, "safetyMonitorManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onReceiverSafetyCacheChangeForSessionID:phoneCache:watchCache:", v10, v9, v8);

}

- (SMSafetyMonitorManager)safetyMonitorManager
{
  return (SMSafetyMonitorManager *)objc_loadWeakRetained((id *)&self->_safetyMonitorManager);
}

- (void)setSafetyMonitorManager:(id)a3
{
  objc_storeWeak((id *)&self->_safetyMonitorManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_safetyMonitorManager);
}

@end
