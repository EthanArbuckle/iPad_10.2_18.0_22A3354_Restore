@implementation _TVRCRMSDeviceQuery

- (void)start
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  _TVRCRMSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Starting query for RMS devices", v10, 2u);
  }

  -[_TVRCRMSDeviceQuery wrapperToIdentifierMapping](self, "wrapperToIdentifierMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[_TVRCRMSDeviceQuery setWrapperToIdentifierMapping:](self, "setWrapperToIdentifierMapping:", v5);

  }
  +[TVRMSDiscoverySession localDiscoverySession](TVRMSDiscoverySession, "localDiscoverySession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRCRMSDeviceQuery setLegacyDiscoverySession:](self, "setLegacyDiscoverySession:", v6);

  -[_TVRCRMSDeviceQuery legacyDiscoverySession](self, "legacyDiscoverySession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDiscoveryTypes:", 6);

  -[_TVRCRMSDeviceQuery legacyDiscoverySession](self, "legacyDiscoverySession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[_TVRCRMSDeviceQuery legacyDiscoverySession](self, "legacyDiscoverySession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginDiscovery");

}

- (void)stop
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _TVRCRMSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Stopping query for RMS devices", v7, 2u);
  }

  -[_TVRCRMSDeviceQuery legacyDiscoverySession](self, "legacyDiscoverySession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDiscovery");

  -[_TVRCRMSDeviceQuery legacyDiscoverySession](self, "legacyDiscoverySession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[_TVRCRMSDeviceQuery setLegacyDiscoverySession:](self, "setLegacyDiscoverySession:", 0);
  -[_TVRCRMSDeviceQuery wrapperToIdentifierMapping](self, "wrapperToIdentifierMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[_TVRCRMSDeviceQuery setWrapperToIdentifierMapping:](self, "setWrapperToIdentifierMapping:", 0);
}

- (void)discoverySessionDidUpdateAvailableServices:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableDictionary *wrapperToIdentifierMapping;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "-discoverySessionDidUpdateAvailableServices: %{public}@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "availableServices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[_TVRCRMSDeviceQuery _shouldReportDevice:](self, "_shouldReportDevice:", v11))
        {
          +[_TVRCRMSDeviceWrapper wrapperWithDevice:](_TVRCRMSDeviceWrapper, "wrapperWithDevice:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          wrapperToIdentifierMapping = self->_wrapperToIdentifierMapping;
          objc_msgSend(v11, "networkName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](wrapperToIdentifierMapping, "setObject:forKey:", v12, v14);

          -[_TVRCRMSDeviceQuery delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "rmsDeviceQuery:addedDevice:", self, v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (BOOL)_shouldReportDevice:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  _BOOL4 v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _TVRCRMSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = (uint64_t)v3;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Checking if we should report this RMS device: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v3, "serviceType");
    v13 = 134217984;
    v14 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "   --> Service Type: %ld", (uint8_t *)&v13, 0xCu);
  }

  if (v3)
    v7 = objc_msgSend(v3, "serviceType") == 2;
  else
    v7 = 0;
  _TVRCRMSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v3, "serviceDiscoverySource");
    v13 = 134217984;
    v14 = v9;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "   --> Service Discovery Source: %ld", (uint8_t *)&v13, 0xCu);
  }

  v10 = v7 && objc_msgSend(v3, "serviceDiscoverySource") == 2;
  _TVRCRMSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109120;
    LODWORD(v14) = v10;
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "   --> Should Report: %d", (uint8_t *)&v13, 8u);
  }

  return v10;
}

- (_TVRCRMSDeviceQueryDelegate)delegate
{
  return (_TVRCRMSDeviceQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRMSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (TVRMSDiscoverySession)legacyDiscoverySession
{
  return self->_legacyDiscoverySession;
}

- (void)setLegacyDiscoverySession:(id)a3
{
  objc_storeStrong((id *)&self->_legacyDiscoverySession, a3);
}

- (NSMutableDictionary)wrapperToIdentifierMapping
{
  return self->_wrapperToIdentifierMapping;
}

- (void)setWrapperToIdentifierMapping:(id)a3
{
  objc_storeStrong((id *)&self->_wrapperToIdentifierMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapperToIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_legacyDiscoverySession, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
