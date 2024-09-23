@implementation TVRMSDiscoverySessionProxy

- (TVRMSDiscoverySessionProxy)init
{
  TVRMSDiscoverySessionProxy *v2;
  uint64_t v3;
  TVRMSIDSClient *idsClient;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRMSDiscoverySessionProxy;
  v2 = -[TVRMSSessionProxy initWithTimeout:](&v7, sel_initWithTimeout_, *(double *)&TVRMSDiscoverySessionTimeout);
  if (v2)
  {
    +[TVRMSIDSClient sharedClient](TVRMSIDSClient, "sharedClient");
    v3 = objc_claimAutoreleasedReturnValue();
    idsClient = v2->_idsClient;
    v2->_idsClient = (TVRMSIDSClient *)v3;

    v2->_wifiAvailable = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__availableServicesDidUpdateNotification_, CFSTR("RMSIDSClientAvailableServicesDidUpdateNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleSessionDidEndNotification_, CFSTR("RMSIDSClientSessionDidEndNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__companionAvailabilityDidChange_, CFSTR("RMSIDSClientCompanionAvailabilityDidChangeNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__wifiAvailabilityDidChange_, CFSTR("RMSIDSClientWifiAvailabilityDidChangeNotification"), 0);
    -[TVRMSDiscoverySessionProxy _updateNetworkAvailability](v2, "_updateNetworkAvailability");

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
  v4.super_class = (Class)TVRMSDiscoverySessionProxy;
  -[TVRMSSessionProxy dealloc](&v4, sel_dealloc);
}

- (void)beginDiscovery
{
  TVRMSIDSClient *idsClient;
  uint64_t discoveryTypes_low;
  NSArray *pairedNetworkNames;
  _QWORD v6[5];
  id v7;
  id location;

  if (!self->_discovering)
  {
    self->_discovering = 1;
    objc_initWeak(&location, self);
    idsClient = self->_idsClient;
    discoveryTypes_low = LODWORD(self->_discoveryTypes);
    pairedNetworkNames = self->_pairedNetworkNames;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__TVRMSDiscoverySessionProxy_beginDiscovery__block_invoke;
    v6[3] = &unk_24DCD74A0;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    -[TVRMSIDSClient beginDiscoverySessionWithDiscoveryTypes:pairedNetworkNames:completionHandler:](idsClient, "beginDiscoverySessionWithDiscoveryTypes:pairedNetworkNames:completionHandler:", discoveryTypes_low, pairedNetworkNames, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __44__TVRMSDiscoverySessionProxy_beginDiscovery__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  id *v6;
  _QWORD *WeakRetained;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  dispatch_time_t v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[16];

  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      _TVRCRMSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Begin discovery success, session established", buf, 2u);
      }

      objc_msgSend(v8, "setSessionIdentifier:", a3);
      objc_msgSend(v8, "beginHeartbeat");
      *((_QWORD *)v8 + 6) = 0;
    }
    else
    {
      v10 = (void *)WeakRetained[10];
      WeakRetained[10] = 0;

      *((_BYTE *)v8 + 56) = 0;
      v11 = *((_QWORD *)v8 + 6);
      if (v11 >= 7)
        v11 = 7;
      *((_QWORD *)v8 + 6) = v11 + 1;
      v12 = objc_loadWeakRetained((id *)v8 + 8);
      objc_msgSend(v12, "discoverySessionDidUpdateAvailableServices:", *(_QWORD *)(a1 + 32));

      v13 = dispatch_time(0, 1000000000 * *((_QWORD *)v8 + 6));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__TVRMSDiscoverySessionProxy_beginDiscovery__block_invoke_12;
      block[3] = &unk_24DCD71B8;
      objc_copyWeak(&v15, v6);
      dispatch_after(v13, MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v15);
    }
  }

}

void __44__TVRMSDiscoverySessionProxy_beginDiscovery__block_invoke_12(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "beginDiscovery");

}

- (void)setPairedNetworkNames:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_pairedNetworkNames, a3);
  if (-[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"))
    -[TVRMSIDSClient updatePairedNetworkNames:sessionIdentifier:](self->_idsClient, "updatePairedNetworkNames:sessionIdentifier:", self->_pairedNetworkNames, -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"));

}

- (void)heartbeatDidFail
{
  self->_discovering = 0;
  -[TVRMSDiscoverySessionProxy beginDiscovery](self, "beginDiscovery");
}

- (void)endDiscovery
{
  NSObject *v3;
  NSArray *availableServices;
  uint8_t v5[16];

  _TVRCRMSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "end discovery invoked", v5, 2u);
  }

  if (-[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"))
  {
    -[TVRMSIDSClient endDiscoverySession:](self->_idsClient, "endDiscoverySession:", -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"));
    -[TVRMSSessionProxy setSessionIdentifier:](self, "setSessionIdentifier:", 0);
  }
  availableServices = self->_availableServices;
  self->_availableServices = 0;

  self->_discovering = 0;
  -[TVRMSSessionProxy endHeartbeat](self, "endHeartbeat");
}

- (void)_availableServicesDidUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *availableServices;
  NSObject *v8;
  NSArray *v9;
  id WeakRetained;
  int v11;
  NSArray *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:", v4))
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RMSIDSClientAvailableServicesNotificationKey"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    availableServices = self->_availableServices;
    self->_availableServices = v6;

    _TVRCRMSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_availableServices;
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Discovery proxy handling available services update: %@", (uint8_t *)&v11, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "discoverySessionDidUpdateAvailableServices:", self);

  }
}

- (void)_handleSessionDidEndNotification:(id)a3
{
  _QWORD block[5];

  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:", a3))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__TVRMSDiscoverySessionProxy__handleSessionDidEndNotification___block_invoke;
    block[3] = &unk_24DCD70C8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __63__TVRMSDiscoverySessionProxy__handleSessionDidEndNotification___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "endHeartbeat");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 56))
  {
    *(_BYTE *)(v3 + 56) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "beginDiscovery");
  }
  return result;
}

- (void)_wifiAvailabilityDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    objc_msgSend(v6, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("RMSIDSClientWifiAvailabilityNotificationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_wifiAvailable = objc_msgSend(v5, "BOOLValue");

    -[TVRMSDiscoverySessionProxy _updateNetworkAvailability](self, "_updateNetworkAvailability");
  }

}

- (void)_updateNetworkAvailability
{
  _BOOL4 wifiAvailable;
  id WeakRetained;
  char v5;
  id v6;

  if (-[TVRMSIDSClient isCompanionAvailable](self->_idsClient, "isCompanionAvailable"))
    wifiAvailable = self->_wifiAvailable;
  else
    wifiAvailable = 0;
  if (self->_networkAvailable != wifiAvailable)
  {
    self->_networkAvailable = wifiAvailable;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "discoverySessionNetworkAvailabilityDidChange:", self);

    }
  }
}

- (TVRMSDiscoverySessionDelegate)delegate
{
  return (TVRMSDiscoverySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)discoveryTypes
{
  return self->_discoveryTypes;
}

- (void)setDiscoveryTypes:(int64_t)a3
{
  self->_discoveryTypes = a3;
}

- (NSArray)availableServices
{
  return self->_availableServices;
}

- (BOOL)isNetworkAvailable
{
  return self->_networkAvailable;
}

- (NSArray)pairedNetworkNames
{
  return self->_pairedNetworkNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedNetworkNames, 0);
  objc_storeStrong((id *)&self->_availableServices, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsClient, 0);
}

@end
