@implementation WFEnterpriseJoinOperation

- (WFEnterpriseJoinOperation)initWithAssocParameters:(id)a3 interface:(id)a4
{
  id v7;
  id v8;
  WFEnterpriseJoinOperation *v9;
  WFEnterpriseJoinOperation *v10;
  void *v11;
  WFEnterpriseJoinOperation *v12;
  NSObject *v13;
  uint64_t v14;
  NSString *name;
  WFEnterpriseJoinOperation *v16;
  os_log_type_t v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFEnterpriseJoinOperation;
  v9 = -[WFEnterpriseJoinOperation init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v9->_associationParameters, a3);
      objc_storeStrong((id *)&v10->_interface, a4);
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "scanResult");
      v12 = (WFEnterpriseJoinOperation *)objc_claimAutoreleasedReturnValue();
      -[WFEnterpriseJoinOperation networkName](v12, "networkName");
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
        v21 = "-[WFEnterpriseJoinOperation initWithAssocParameters:interface:]";
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

- (WFEnterpriseJoinOperation)initWithNetwork:(id)a3 profile:(id)a4
{
  id v7;
  id v8;
  WFEnterpriseJoinOperation *v9;
  WFEnterpriseJoinOperation *v10;
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
  v21.super_class = (Class)WFEnterpriseJoinOperation;
  v9 = -[WFEnterpriseJoinOperation init](&v21, sel_init);
  v10 = v9;
  v11 = 0;
  if (!v7 || !v9)
    goto LABEL_26;
  objc_storeStrong((id *)&v9->_network, a3);
  if (!v8)
  {
    v11 = 0;
LABEL_26:

    v10 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v10->_profile, a4);
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
    goto LABEL_25;
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
      goto LABEL_25;
    *(_WORD *)v20 = 0;
    v18 = "failed to get array of WiFiDeviceClients";
    goto LABEL_24;
  }
  v14 = (__WiFiDeviceClient *)-[__WiFiManagerClient objectAtIndex:](v11, "objectAtIndex:", 0);
  v10->_device = v14;
  if (!v14)
  {
    WFLogForCategory(5uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v16 || !os_log_type_enabled(v16, v17))
      goto LABEL_25;
    *(_WORD *)v20 = 0;
    v18 = "failed to get WiFiDeviceClient";
LABEL_24:
    _os_log_impl(&dword_219FC8000, v16, v17, v18, v20, 2u);
LABEL_25:

    goto LABEL_26;
  }
  CFRetain(v14);
LABEL_9:

  return v10;
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFEnterpriseJoinOperation;
  -[WFOperation start](&v3, sel_start);
  -[WFEnterpriseJoinOperation _joinWithCoreWiFi](self, "_joinWithCoreWiFi");
}

- (void)_joinWithCoreWiFi
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[WFEnterpriseJoinOperation interface](self, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEnterpriseJoinOperation associationParameters](self, "associationParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__WFEnterpriseJoinOperation__joinWithCoreWiFi__block_invoke;
  v5[3] = &unk_24DC347C8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v3, "associateWithParameters:reply:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __46__WFEnterpriseJoinOperation__joinWithCoreWiFi__block_invoke(uint64_t a1, void *a2)
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
  int v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const void *v21;
  int v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
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
      v33 = v7;
      v34 = 2112;
      v35 = v3;
      _os_log_impl(&dword_219FC8000, v8, v9, "{ASSOC*} association failed to %@, error: %@", buf, 0x16u);
    }

    v12 = objc_msgSend(v3, "code");
    if ((v12 & 0xFFFF0000) == 0xEA010000)
    {
      v13 = (const char *)(v12 & 0x15FEFFFF);
      WFLogForCategory(5uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v13;
        _os_log_impl(&dword_219FC8000, v14, v15, "association failed with EAP specific error: %ld", buf, 0xCu);
      }

      objc_msgSend(v3, "userInfo");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_handleEnterpriseJoinResult:userInfo:network:", v13, v8, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "associationParameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scanResult");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "RSSI");

      objc_msgSend(*(id *)(a1 + 32), "associationParameters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scanResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scanRecord");
      v8 = objc_claimAutoreleasedReturnValue();

      v21 = (const void *)WiFiNetworkCreate();
      v22 = WiFiNetworkRequiresPassword();
      if (v21)
        CFRelease(v21);
      WFLogForCategory(5uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
      {
        v25 = "is not";
        *(_DWORD *)buf = 136315650;
        if (v22)
          v25 = "is";
        v33 = v25;
        v34 = 2112;
        v35 = v7;
        v36 = 2048;
        v37 = v18;
        _os_log_impl(&dword_219FC8000, v23, v24, "password %s required for %@, rssi at join: %ld", buf, 0x20u);
      }

      v26 = (void *)MEMORY[0x24BDD1540];
      v27 = objc_msgSend(v3, "code");
      v30 = *MEMORY[0x24BDD1398];
      v31 = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "associationErrorWithCode:requiresPassword:signalStrength:userInfo:", v27, v22 != 0, v18, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setError:", v29);

    }
  }
  else if (v11 && os_log_type_enabled(v8, v9))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v7;
    _os_log_impl(&dword_219FC8000, v8, v9, "{ASSOC*} association successful to %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "finish");
}

- (void)_joinWithMobileWiFi
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_type_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t Property;
  void *v29;
  os_log_type_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  NSObject *v44;
  os_log_type_t v45;
  const char *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  -[WFEnterpriseJoinOperation network](self, "network");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = WiFiNetworkCreate();
  if (!v6)
  {
    WFLogForCategory(5uLL);
    v49 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v50) = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v49 || !os_log_type_enabled(v49, (os_log_type_t)v50))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Unable to create WiFiNetworkRef";
    goto LABEL_50;
  }
  v7 = v6;
  -[WFEnterpriseJoinOperation profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enterpriseProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    WFLogForCategory(5uLL);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v49 || !os_log_type_enabled(v49, (os_log_type_t)v50))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v51 = "Nil enterpriseProfile on WFNetworkProfile";
LABEL_50:
    _os_log_impl(&dword_219FC8000, v49, (os_log_type_t)v50, v51, buf, 2u);
LABEL_51:

    objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 12);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOperation setError:](self, "setError:", v52);

    -[WFOperation finish](self, "finish");
    goto LABEL_41;
  }
  -[WFEnterpriseJoinOperation profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scanAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)WiFiNetworkCreate();

  if (v12)
  {
    WiFiNetworkMergeForAssociation();
    CFRelease(v12);
  }
  else
  {
    WFLogForCategory(5uLL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13)
    {
      v15 = v13;
      if (os_log_type_enabled(v15, v14))
      {
        -[WFEnterpriseJoinOperation profile](self, "profile");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v56 = "-[WFEnterpriseJoinOperation _joinWithMobileWiFi]";
        v57 = 2112;
        v58 = v16;
        _os_log_impl(&dword_219FC8000, v15, v14, "%s: failed to create profile based networkRef (profile %@)", buf, 0x16u);

      }
    }

  }
  WiFiNetworkSetProperty();
  WFLogForCategory(5uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v17)
  {
    v19 = v17;
    if (os_log_type_enabled(v19, v18))
    {
      -[WFEnterpriseJoinOperation network](self, "network");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ssid");
      v53 = v9;
      v21 = v5;
      v22 = (char *)objc_claimAutoreleasedReturnValue();
      -[WFEnterpriseJoinOperation profile](self, "profile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "enterpriseProfile");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v56 = v22;
      v57 = 2112;
      v58 = v24;
      _os_log_impl(&dword_219FC8000, v19, v18, "Attempting association to %@ | enterprise profile %@", buf, 0x16u);

      v5 = v21;
      v9 = v53;

    }
  }

  -[WFEnterpriseJoinOperation profile](self, "profile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "policyUUID");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    Property = WiFiNetworkGetProperty();

    if (Property)
      goto LABEL_25;
    WFLogForCategory(5uLL);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29)
    {
      v31 = v29;
      if (os_log_type_enabled(v31, v30))
      {
        -[WFEnterpriseJoinOperation profile](self, "profile");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "policyUUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFEnterpriseJoinOperation network](self, "network");
        v54 = v9;
        v34 = v5;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "ssid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v56 = "-[WFEnterpriseJoinOperation _joinWithMobileWiFi]";
        v57 = 2112;
        v58 = v33;
        v59 = 2112;
        v60 = v36;
        _os_log_impl(&dword_219FC8000, v31, v30, "%s: setting policyUUID %@ for %@", buf, 0x20u);

        v5 = v34;
        v9 = v54;

      }
    }

    -[WFEnterpriseJoinOperation profile](self, "profile");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "policyUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    WiFiNetworkSetProperty();

  }
LABEL_25:
  -[WFEnterpriseJoinOperation profile](self, "profile");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "password");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = (void *)WiFiNetworkCopyPassword();
    if (v40)
    {
      -[WFEnterpriseJoinOperation profile](self, "profile");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "password");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v40, "isEqualToString:", v42);

      if ((v43 & 1) == 0)
      {
        WFLogForCategory(5uLL);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = OSLogForWFLogLevel(1uLL);
        if (!WFCurrentLogLevel() || !v44 || !os_log_type_enabled(v44, v45))
          goto LABEL_38;
        *(_DWORD *)buf = 136315138;
        v56 = "-[WFEnterpriseJoinOperation _joinWithMobileWiFi]";
        v46 = "%s: keychain password differs from association attempt password updating";
LABEL_37:
        _os_log_impl(&dword_219FC8000, v44, v45, v46, buf, 0xCu);
LABEL_38:

        -[WFEnterpriseJoinOperation profile](self, "profile");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "password");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        WiFiNetworkSetPassword();

      }
    }
    else if (WiFiNetworkRequiresOneTimePassword())
    {
      WFLogForCategory(5uLL);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v44 || !os_log_type_enabled(v44, v45))
        goto LABEL_38;
      *(_DWORD *)buf = 136315138;
      v56 = "-[WFEnterpriseJoinOperation _joinWithMobileWiFi]";
      v46 = "%s: keychain password doesn't exist and network requires OTP";
      goto LABEL_37;
    }

  }
  -[WFEnterpriseJoinOperation joinNetworkRef:](self, "joinNetworkRef:", v7);

LABEL_41:
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
    v10 = "-[WFEnterpriseJoinOperation joinNetworkRef:]";
    v11 = 2112;
    v12 = a3;
    v13 = 2112;
    v14 = device;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: networkRef: %@ device %@", (uint8_t *)&v9, 0x20u);
  }

  v8 = WiFiDeviceClientAssociateAsync();
  if ((_DWORD)v8)
    -[WFEnterpriseJoinOperation _joinComplete:userInfo:network:](self, "_joinComplete:userInfo:network:", v8, 0, 0);
  if (a3)
    CFRelease(a3);
}

- (void)_joinComplete:(int)a3 userInfo:(__CFDictionary *)a4 network:(__WiFiNetwork *)a5
{
  __WiFiNetwork *v5;
  uint64_t v7;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t RSSI;
  int v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  _BYTE v19[14];
  uint64_t v20;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  if (HIWORD(a3) == 59905)
  {
    -[WFEnterpriseJoinOperation _handleEnterpriseJoinResult:userInfo:network:](self, "_handleEnterpriseJoinResult:userInfo:network:", a3 & 0x15FEFFFF, a4, a5);
  }
  else
  {
    WFLogForCategory(5uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      v16 = 136315650;
      v17 = "-[WFEnterpriseJoinOperation _joinComplete:userInfo:network:]";
      v18 = 1024;
      *(_DWORD *)v19 = v7;
      *(_WORD *)&v19[4] = 2112;
      *(_QWORD *)&v19[6] = a4;
      _os_log_impl(&dword_219FC8000, v9, v10, "%s: error code %d (userInfo %@)", (uint8_t *)&v16, 0x1Cu);
    }

    if ((_DWORD)v7 || !v5)
    {
      if (v5)
      {
        RSSI = (int)WiFiNetworkGetRSSI();
        v12 = WiFiNetworkRequiresPassword();
        v5 = (__WiFiNetwork *)(v12 != 0);
        WFLogForCategory(5uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
        {
          v16 = 136315650;
          v17 = "-[WFEnterpriseJoinOperation _joinComplete:userInfo:network:]";
          v18 = 2048;
          *(_QWORD *)v19 = RSSI;
          *(_WORD *)&v19[8] = 1024;
          *(_DWORD *)&v19[10] = v12 != 0;
          _os_log_impl(&dword_219FC8000, v13, v14, "%s: joinRssi: %ld requiresPassword: %d", (uint8_t *)&v16, 0x1Cu);
        }

      }
      else
      {
        RSSI = 0;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithCode:requiresPassword:signalStrength:", v7, v5, RSSI);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFOperation setError:](self, "setError:", v15);

    }
    -[WFOperation finish](self, "finish");
  }
}

- (void)_handleEnterpriseJoinResult:(int64_t)a3 userInfo:(id)a4 network:(__WiFiNetwork *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  const __CFString **v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  uint8_t buf[4];
  int64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a5)
  {
    v9 = (void *)WiFiNetworkCopyRecord();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE67E60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a5 = (__WiFiNetwork *)objc_msgSend(v10, "BOOLValue");

  }
  WFLogForCategory(5uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 134218498;
    v37 = a3;
    v38 = 2112;
    v39 = v8;
    v40 = 1024;
    v41 = (int)a5;
    _os_log_impl(&dword_219FC8000, v11, v12, "handling enterprise join result: %ld userInfo: %@ isPrivateMACFailureThresholdMet: %d", buf, 0x1Cu);
  }

  switch(a3)
  {
    case 3:
      objc_msgSend(v8, "objectForKey:", CFSTR("RequiredProperties"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      WFLogForCategory(5uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (int64_t)v15;
        _os_log_impl(&dword_219FC8000, v16, v17, "user input required, requested info %@", buf, 0xCu);
      }

      objc_msgSend(v8, "objectForKey:", CFSTR("TLSServerCertificateChain"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
      {
        v34 = CFSTR("kWFAssociationCertificateChainKey");
        v35 = v18;
        v20 = (void *)MEMORY[0x24BDBCE70];
        v21 = &v35;
        v22 = &v34;
      }
      else if (objc_msgSend(v15, "containsObject:", CFSTR("UserName")))
      {
        v32 = CFSTR("kWFAssociationUsernameRequiredKey");
        v33 = MEMORY[0x24BDBD1C8];
        v20 = (void *)MEMORY[0x24BDBCE70];
        v21 = &v33;
        v22 = &v32;
      }
      else
      {
        if (!objc_msgSend(v15, "containsObject:", CFSTR("UserPassword")))
        {
          v28 = 0;
          goto LABEL_37;
        }
        v30 = CFSTR("kWFAssociationPasswordRequiredKey");
        v31 = MEMORY[0x24BDBD1C8];
        v20 = (void *)MEMORY[0x24BDBCE70];
        v21 = &v31;
        v22 = &v30;
      }
      objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1, v30, v31, v32, v33, v34, v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:
      objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:userInfo:", 7, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFOperation setError:](self, "setError:", v29);

      -[WFOperation finish](self, "finish");
      goto LABEL_38;
    case 1:
      WFLogForCategory(5uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v23, v24, "EAP status = failed", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 12);
      v25 = objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      WFLogForCategory(5uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v13, v14, "EAP status = ok", buf, 2u);
      }
      goto LABEL_31;
    default:
      WFLogForCategory(5uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v26 && os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 134349056;
        v37 = a3;
        _os_log_impl(&dword_219FC8000, v26, v27, "EAP status = unhandled error code %{public}ld", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithCode:isPrivateMACFailureThresholdMet:", a3, a5);
      v25 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v13 = v25;
  -[WFOperation setError:](self, "setError:", v25);
LABEL_31:

  -[WFOperation finish](self, "finish");
LABEL_38:

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
  v5.super_class = (Class)WFEnterpriseJoinOperation;
  -[WFEnterpriseJoinOperation dealloc](&v5, sel_dealloc);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_associationParameters, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
