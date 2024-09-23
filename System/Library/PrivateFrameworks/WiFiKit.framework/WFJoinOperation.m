@implementation WFJoinOperation

- (WFJoinOperation)initWithAssocParameters:(id)a3 interface:(id)a4
{
  id v7;
  id v8;
  WFJoinOperation *v9;
  WFJoinOperation *v10;
  void *v11;
  WFJoinOperation *v12;
  NSObject *v13;
  uint64_t v14;
  NSString *name;
  WFJoinOperation *v16;
  os_log_type_t v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFJoinOperation;
  v9 = -[WFJoinOperation init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v9->_associationParameters, a3);
      objc_storeStrong((id *)&v10->_interface, a4);
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "scanResult");
      v12 = (WFJoinOperation *)objc_claimAutoreleasedReturnValue();
      -[WFJoinOperation networkName](v12, "networkName");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Association operation to network='%@'"), v13);
      v14 = objc_claimAutoreleasedReturnValue();
      name = v10->_name;
      v10->_name = (NSString *)v14;

    }
    else
    {
      WFLogForCategory(5uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      v18 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v18))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[WFJoinOperation initWithAssocParameters:interface:]";
        _os_log_impl(&dword_219FC8000, v13, v18, "%s: missing association parameters", buf, 0xCu);
      }
      v12 = v10;
      v10 = 0;
    }
    v16 = v10;

    v10 = v12;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (WFJoinOperation)initWithNetwork:(id)a3 profile:(id)a4
{
  id v7;
  id v8;
  WFJoinOperation *v9;
  WFJoinOperation *v10;
  __WiFiManagerClient *v11;
  void *v12;
  __WiFiManagerClient *v13;
  __WiFiDeviceClient *v14;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  os_log_type_t v19;
  uint8_t v20[16];
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFJoinOperation;
  v9 = -[WFJoinOperation init](&v21, sel_init);
  v10 = v9;
  if (!v9 || (objc_storeStrong((id *)&v9->_profile, a4), !v7))
  {
    v11 = 0;
LABEL_25:

    v10 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v10->_network, a3);
  v11 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  v10->_manager = v11;
  if (!v11)
  {
    WFLogForCategory(5uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16)
    {
      if (os_log_type_enabled(v16, v19))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_219FC8000, v16, v19, "failed to create WiFiManagerClientRef", v20, 2u);
      }
      v11 = 0;
    }
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getCFRunLoop");
  WiFiManagerClientScheduleWithRunLoop();

  v13 = (__WiFiManagerClient *)WiFiManagerClientCopyDevices();
  v11 = v13;
  if (!v13 || !-[__WiFiManagerClient count](v13, "count"))
  {
    WFLogForCategory(5uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v16 || !os_log_type_enabled(v16, v17))
      goto LABEL_24;
    *(_WORD *)v20 = 0;
    v18 = "failed to get array of WiFiDeviceClients";
    goto LABEL_23;
  }
  v14 = (__WiFiDeviceClient *)-[__WiFiManagerClient objectAtIndex:](v11, "objectAtIndex:", 0);
  v10->_device = v14;
  if (!v14)
  {
    WFLogForCategory(5uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v16 || !os_log_type_enabled(v16, v17))
      goto LABEL_24;
    *(_WORD *)v20 = 0;
    v18 = "failed to get WiFiDeviceClient";
LABEL_23:
    _os_log_impl(&dword_219FC8000, v16, v17, v18, v20, 2u);
LABEL_24:

    goto LABEL_25;
  }
  CFRetain(v14);
LABEL_8:

  return v10;
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFJoinOperation;
  -[WFOperation start](&v3, sel_start);
  -[WFJoinOperation _joinWithCoreWiFi](self, "_joinWithCoreWiFi");
}

- (void)_joinWithCoreWiFi
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[WFJoinOperation interface](self, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFJoinOperation associationParameters](self, "associationParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__WFJoinOperation__joinWithCoreWiFi__block_invoke;
  v5[3] = &unk_24DC347C8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v3, "associateWithParameters:reply:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __36__WFJoinOperation__joinWithCoreWiFi__block_invoke(uint64_t a1, void *a2)
{
  char *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const void *v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "associationParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scanResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "networkName");
  v7 = (char *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(5uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v10 = v8 == 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v3)
  {
    if (v11 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v7;
      v30 = 2112;
      v31 = v3;
      _os_log_impl(&dword_219FC8000, v8, v9, "{ASSOC*} association failed to %@, error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "associationParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scanResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "RSSI");

    objc_msgSend(*(id *)(a1 + 32), "associationParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scanResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scanRecord");
    v8 = objc_claimAutoreleasedReturnValue();

    v17 = (const void *)WiFiNetworkCreate();
    v18 = WiFiNetworkRequiresPassword();
    if (v17)
      CFRelease(v17);
    WFLogForCategory(5uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
    {
      v21 = "is not";
      *(_DWORD *)buf = 136315650;
      if (v18)
        v21 = "is";
      v29 = v21;
      v30 = 2112;
      v31 = v7;
      v32 = 2048;
      v33 = v14;
      _os_log_impl(&dword_219FC8000, v19, v20, "password %s required for %@, rssi at join: %ld", buf, 0x20u);
    }

    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = objc_msgSend(v3, "code");
    v26 = *MEMORY[0x24BDD1398];
    v27 = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "associationErrorWithCode:requiresPassword:signalStrength:userInfo:", v23, v18 != 0, v14, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setError:", v25);

  }
  else if (v11 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v7;
    _os_log_impl(&dword_219FC8000, v8, v9, "{ASSOC*} association successful to %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "finish");
}

- (void)joinNetworkRef:(__WiFiNetwork *)a3
{
  NSObject *v5;
  os_log_type_t v6;
  __WiFiDeviceClient *device;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  __WiFiNetwork *v12;
  __int16 v13;
  __WiFiDeviceClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(5uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v5 && os_log_type_enabled(v5, v6))
  {
    device = self->_device;
    v9 = 136315650;
    v10 = "-[WFJoinOperation joinNetworkRef:]";
    v11 = 2112;
    v12 = a3;
    v13 = 2112;
    v14 = device;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: networkRef: %@ device %@", (uint8_t *)&v9, 0x20u);
  }

  v8 = WiFiDeviceClientAssociateAsync();
  if ((_DWORD)v8)
    -[WFJoinOperation _joinComplete:userInfo:network:](self, "_joinComplete:userInfo:network:", v8, 0, 0);
  if (a3)
    CFRelease(a3);
}

- (void)_joinComplete:(int)a3 userInfo:(__CFDictionary *)a4 network:(__WiFiNetwork *)a5
{
  uint64_t v7;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t RSSI;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  os_log_type_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  os_log_type_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  os_log_type_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  os_log_type_t v43;
  BOOL v44;
  int v45;
  void *v46;
  uint64_t v47;
  unsigned int v48;
  void *v49;
  unsigned int v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  _BYTE v56[14];
  __int16 v57;
  unsigned int v58;
  uint64_t v59;

  v7 = *(_QWORD *)&a3;
  v59 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(5uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 136315650;
    v52 = "-[WFJoinOperation _joinComplete:userInfo:network:]";
    v53 = 1024;
    v54 = v7;
    v55 = 2112;
    *(_QWORD *)v56 = a4;
    _os_log_impl(&dword_219FC8000, v9, v10, "%s: error code %d (userInfo %@)", buf, 0x1Cu);
  }

  if ((_DWORD)v7 || !a5)
  {
    if (!a5)
    {
      v39 = 0;
      RSSI = 0;
      v13 = 0;
LABEL_45:
      objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithCode:requiresPassword:signalStrength:isPrivateMACFailureThresholdMet:", v7, v13, RSSI, v39, v47);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFOperation setError:](self, "setError:", v46);

      goto LABEL_46;
    }
    RSSI = (int)WiFiNetworkGetRSSI();
    v12 = WiFiNetworkRequiresPassword();
    v13 = v12 != 0;
    v49 = (void *)WiFiNetworkCopyRecord();
    objc_msgSend(v49, "objectForKey:", *MEMORY[0x24BE67E60]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v14, "BOOLValue");

    WFLogForCategory(5uLL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15)
    {
      v17 = v15;
      if (os_log_type_enabled(v17, v16))
      {
        -[WFJoinOperation profile](self, "profile");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "userProvidedPassword");
        *(_DWORD *)buf = 136316162;
        v52 = "-[WFJoinOperation _joinComplete:userInfo:network:]";
        v53 = 1024;
        v54 = v12 != 0;
        v13 = v12 != 0;
        v55 = 1024;
        *(_DWORD *)v56 = v19;
        *(_WORD *)&v56[4] = 2048;
        *(_QWORD *)&v56[6] = RSSI;
        v57 = 1024;
        v58 = v50;
        _os_log_impl(&dword_219FC8000, v17, v16, "%s: requiresPassword: %d userProvidedPassword: %d joinRssi: %ld, isPrivateMacFailureThresholdMet: %d", buf, 0x28u);

      }
    }

    if (v12)
    {
      -[WFJoinOperation profile](self, "profile");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "userProvidedPassword");

      if (v21)
      {
        WFLogForCategory(5uLL);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v22)
        {
          v24 = v22;
          if (os_log_type_enabled(v24, v23))
          {
            -[WFJoinOperation profile](self, "profile");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "userProvidedPassword");
            *(_DWORD *)buf = 136315650;
            v52 = "-[WFJoinOperation _joinComplete:userInfo:network:]";
            v53 = 1024;
            v54 = 1;
            v55 = 1024;
            *(_DWORD *)v56 = v26;
            _os_log_impl(&dword_219FC8000, v24, v23, "%s: requiresPassword %d userProvidedPassword %d", buf, 0x18u);

          }
        }
        v48 = v13;
        v47 = RSSI;

        -[WFJoinOperation profile](self, "profile");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "previousPassword");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)v28;
          -[WFJoinOperation profile](self, "profile");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "password");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFJoinOperation profile](self, "profile");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "previousPassword");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v31, "isEqualToString:", v33);

          if ((v34 & 1) == 0)
          {
            WFLogForCategory(5uLL);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v35 && os_log_type_enabled(v35, v36))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v35, v36, "Resave previous password to the keychain", buf, 2u);
            }

            -[WFJoinOperation profile](self, "profile");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "previousPassword");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            WiFiNetworkSetPassword();

            RSSI = v47;
            v13 = v48;
            goto LABEL_44;
          }
        }
        else
        {

        }
        -[WFJoinOperation profile](self, "profile", v47);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "previousPassword");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        WFLogForCategory(5uLL);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel())
          v44 = v42 == 0;
        else
          v44 = 1;
        v45 = !v44;
        if (v41)
        {
          RSSI = v47;
          v13 = v48;
          if (v45 && os_log_type_enabled(v42, v43))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219FC8000, v42, v43, "Same password in the keychain", buf, 2u);
          }

        }
        else
        {
          RSSI = v47;
          v13 = v48;
          if (v45 && os_log_type_enabled(v42, v43))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219FC8000, v42, v43, "Remove added password from keychain", buf, 2u);
          }

          WiFiNetworkRemovePassword();
        }
      }
    }
LABEL_44:

    v39 = v50;
    goto LABEL_45;
  }
LABEL_46:
  -[WFOperation finish](self, "finish");
}

- (void)dealloc
{
  __WiFiDeviceClient *device;
  __WiFiManagerClient *manager;
  objc_super v5;

  device = self->_device;
  if (device)
  {
    CFRelease(device);
    self->_device = 0;
  }
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WFJoinOperation;
  -[WFJoinOperation dealloc](&v5, sel_dealloc);
}

- (id)name
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (__WiFiManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManagerClient *)a3
{
  self->_manager = a3;
}

- (__WiFiDeviceClient)device
{
  return self->_device;
}

- (void)setDevice:(__WiFiDeviceClient *)a3
{
  self->_device = a3;
}

- (CWFAssocParameters)associationParameters
{
  return self->_associationParameters;
}

- (void)setAssociationParameters:(id)a3
{
  objc_storeStrong((id *)&self->_associationParameters, a3);
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_associationParameters, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
