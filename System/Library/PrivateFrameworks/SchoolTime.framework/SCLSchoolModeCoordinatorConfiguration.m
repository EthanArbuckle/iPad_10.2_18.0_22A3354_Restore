@implementation SCLSchoolModeCoordinatorConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  SCLSchoolModeCoordinatorConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(SCLSchoolModeCoordinatorConfiguration);
  -[SCLSchoolModeCoordinatorConfiguration NRDevice](self, "NRDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinatorConfiguration setNRDevice:](v4, "setNRDevice:", v5);

  -[SCLSchoolModeCoordinatorConfiguration idsDevice](self, "idsDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinatorConfiguration setIdsDevice:](v4, "setIdsDevice:", v6);

  -[SCLSchoolModeCoordinatorConfiguration transportController](self, "transportController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinatorConfiguration setTransportController:](v4, "setTransportController:", v7);

  -[SCLSchoolModeCoordinatorConfiguration server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinatorConfiguration setServer:](v4, "setServer:", v8);

  -[SCLSchoolModeCoordinatorConfiguration historyStore](self, "historyStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinatorConfiguration setHistoryStore:](v4, "setHistoryStore:", v9);

  -[SCLSchoolModeCoordinatorConfiguration directoryURL](self, "directoryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinatorConfiguration setDirectoryURL:](v4, "setDirectoryURL:", v10);

  -[SCLSchoolModeCoordinatorConfiguration setSendsRemoteHistoryItems:](v4, "setSendsRemoteHistoryItems:", -[SCLSchoolModeCoordinatorConfiguration sendsRemoteHistoryItems](self, "sendsRemoteHistoryItems"));
  -[SCLSchoolModeCoordinatorConfiguration setSendsRemoteScheduleSettings:](v4, "setSendsRemoteScheduleSettings:", -[SCLSchoolModeCoordinatorConfiguration sendsRemoteScheduleSettings](self, "sendsRemoteScheduleSettings"));
  -[SCLSchoolModeCoordinatorConfiguration setManuallyManagedOnly:](v4, "setManuallyManagedOnly:", -[SCLSchoolModeCoordinatorConfiguration isManuallyManagedOnly](self, "isManuallyManagedOnly"));
  -[SCLSchoolModeCoordinatorConfiguration targetQueue](self, "targetQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeCoordinatorConfiguration setTargetQueue:](v4, "setTargetQueue:", v11);

  return v4;
}

- (NRDevice)NRDevice
{
  return self->_NRDevice;
}

- (void)setNRDevice:(id)a3
{
  objc_storeStrong((id *)&self->_NRDevice, a3);
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (void)setIdsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_idsDevice, a3);
}

- (SCLTransportController)transportController
{
  return self->_transportController;
}

- (void)setTransportController:(id)a3
{
  objc_storeStrong((id *)&self->_transportController, a3);
}

- (SCLSchoolModeServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (SCLUnlockHistoryPersistentStore)historyStore
{
  return self->_historyStore;
}

- (void)setHistoryStore:(id)a3
{
  objc_storeStrong((id *)&self->_historyStore, a3);
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_directoryURL, a3);
}

- (BOOL)sendsRemoteScheduleSettings
{
  return self->_sendsRemoteScheduleSettings;
}

- (void)setSendsRemoteScheduleSettings:(BOOL)a3
{
  self->_sendsRemoteScheduleSettings = a3;
}

- (BOOL)sendsRemoteHistoryItems
{
  return self->_sendsRemoteHistoryItems;
}

- (void)setSendsRemoteHistoryItems:(BOOL)a3
{
  self->_sendsRemoteHistoryItems = a3;
}

- (BOOL)isManuallyManagedOnly
{
  return self->_manuallyManagedOnly;
}

- (void)setManuallyManagedOnly:(BOOL)a3
{
  self->_manuallyManagedOnly = a3;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
  objc_storeStrong((id *)&self->_targetQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_historyStore, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_transportController, 0);
  objc_storeStrong((id *)&self->_idsDevice, 0);
  objc_storeStrong((id *)&self->_NRDevice, 0);
}

@end
