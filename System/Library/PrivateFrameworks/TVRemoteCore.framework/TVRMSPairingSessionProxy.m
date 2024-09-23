@implementation TVRMSPairingSessionProxy

- (TVRMSPairingSessionProxy)init
{
  TVRMSPairingSessionProxy *v2;
  void *v3;
  uint64_t v4;
  NSString *passcode;
  void *v6;
  uint64_t v7;
  NSString *advertisedAppName;
  uint64_t v9;
  NSString *advertisedDeviceName;
  uint64_t v11;
  NSString *advertisedDeviceModel;
  uint64_t v13;
  TVRMSIDSClient *idsClient;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TVRMSPairingSessionProxy;
  v2 = -[TVRMSSessionProxy initWithTimeout:](&v16, sel_initWithTimeout_, *(double *)&TVRMSPairingSessionTimeout);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleDidPairWithServiceNotification_, CFSTR("RMSIDSClientDidPairWithServiceNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handlePairingDidFailNotification_, CFSTR("RMSIDSClientPairingDidFailNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleSessionDidEndNotification_, CFSTR("RMSIDSClientSessionDidEndNotification"), 0);
    generateRandomPasscode();
    v4 = objc_claimAutoreleasedReturnValue();
    passcode = v2->_passcode;
    v2->_passcode = (NSString *)v4;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
    v7 = objc_claimAutoreleasedReturnValue();
    advertisedAppName = v2->_advertisedAppName;
    v2->_advertisedAppName = (NSString *)v7;

    v9 = MGCopyAnswer();
    advertisedDeviceName = v2->_advertisedDeviceName;
    v2->_advertisedDeviceName = (NSString *)v9;

    v11 = MGCopyAnswer();
    advertisedDeviceModel = v2->_advertisedDeviceModel;
    v2->_advertisedDeviceModel = (NSString *)v11;

    +[TVRMSIDSClient sharedClient](TVRMSIDSClient, "sharedClient");
    v13 = objc_claimAutoreleasedReturnValue();
    idsClient = v2->_idsClient;
    v2->_idsClient = (TVRMSIDSClient *)v13;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVRMSPairingSessionProxy;
  -[TVRMSSessionProxy dealloc](&v4, sel_dealloc);
}

- (void)beginPairing
{
  TVRMSIDSClient *idsClient;
  NSString *passcode;
  NSString *advertisedAppName;
  NSString *advertisedDeviceName;
  NSString *advertisedDeviceModel;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_pairing)
  {
    self->_pairing = 1;
    objc_initWeak(&location, self);
    idsClient = self->_idsClient;
    passcode = self->_passcode;
    advertisedAppName = self->_advertisedAppName;
    advertisedDeviceName = self->_advertisedDeviceName;
    advertisedDeviceModel = self->_advertisedDeviceModel;
    v8[0] = MEMORY[0x24BDAC760];
    v8[2] = __40__TVRMSPairingSessionProxy_beginPairing__block_invoke;
    v8[3] = &unk_24DCD7A98;
    v8[1] = 3221225472;
    objc_copyWeak(&v9, &location);
    -[TVRMSIDSClient beginPairingSessionWithPasscode:appName:deviceName:deviceModel:completionHandler:](idsClient, "beginPairingSessionWithPasscode:appName:deviceName:deviceModel:completionHandler:", passcode, advertisedAppName, advertisedDeviceName, advertisedDeviceModel, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __40__TVRMSPairingSessionProxy_beginPairing__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (a2 == 1)
    {
      objc_msgSend(WeakRetained, "setSessionIdentifier:", a3);
      objc_msgSend(v6, "beginHeartbeat");
    }
    else
    {
      objc_msgSend(WeakRetained, "_notifyDelegatePairingFailed");
    }
    WeakRetained = v6;
  }

}

- (void)endPairing
{
  uint64_t v3;

  -[TVRMSSessionProxy endHeartbeat](self, "endHeartbeat");
  v3 = -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier");
  if ((_DWORD)v3)
    -[TVRMSIDSClient endPairingSession:](self->_idsClient, "endPairingSession:", v3);
  self->_pairing = 0;
  -[TVRMSSessionProxy setSessionIdentifier:](self, "setSessionIdentifier:", 0);
}

- (void)_notifyDelegatePairingFailed
{
  id WeakRetained;

  if (self->_pairing)
  {
    if (-[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"))
    {
      self->_pairing = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "pairingSessionDidFail:", self);

    }
  }
}

- (void)_handleDidPairWithServiceNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  v10 = a3;
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    objc_msgSend(v10, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RMSIDSClientServiceNetworkNameNotificationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RMSIDSClientPairingGUIDNotificationKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[TVRMSPairingRecordStore sharedRecordStore](TVRMSPairingRecordStore, "sharedRecordStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "savePairingRecord:forServiceWithNetworkName:", v7, v5);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pairingSession:didPairWithServiceNetworkName:pairingGUID:", self, v5, v7);

  }
}

- (void)_handlePairingDidFailNotification:(id)a3
{
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:", a3))
    -[TVRMSPairingSessionProxy _notifyDelegatePairingFailed](self, "_notifyDelegatePairingFailed");
}

- (void)_handleSessionDidEndNotification:(id)a3
{
  _QWORD block[5];

  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:", a3))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__TVRMSPairingSessionProxy__handleSessionDidEndNotification___block_invoke;
    block[3] = &unk_24DCD70C8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __61__TVRMSPairingSessionProxy__handleSessionDidEndNotification___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endHeartbeat");
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatePairingFailed");
}

- (TVRMSPairingSessionDelegate)delegate
{
  return (TVRMSPairingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_passcode, a3);
}

- (NSString)advertisedAppName
{
  return self->_advertisedAppName;
}

- (void)setAdvertisedAppName:(id)a3
{
  objc_storeStrong((id *)&self->_advertisedAppName, a3);
}

- (NSString)advertisedDeviceName
{
  return self->_advertisedDeviceName;
}

- (void)setAdvertisedDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_advertisedDeviceName, a3);
}

- (NSString)advertisedDeviceModel
{
  return self->_advertisedDeviceModel;
}

- (void)setAdvertisedDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_advertisedDeviceModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisedDeviceModel, 0);
  objc_storeStrong((id *)&self->_advertisedDeviceName, 0);
  objc_storeStrong((id *)&self->_advertisedAppName, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsClient, 0);
}

@end
