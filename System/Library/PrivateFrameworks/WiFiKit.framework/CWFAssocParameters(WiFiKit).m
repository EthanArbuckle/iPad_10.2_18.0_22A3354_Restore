@implementation CWFAssocParameters(WiFiKit)

+ (id)associationParametersFromScanRecord:()WiFiKit profile:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_type_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  os_log_type_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t Property;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *CoreWiFiNetworkProfile;
  void *v40;
  os_log_type_t v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  os_log_type_t v45;
  void *v46;
  void *v47;
  os_log_type_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *CoreWiFiScanResult;
  void *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BE29F00]);
  objc_msgSend(v5, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = (const void *)WiFiNetworkCreate();

  if (objc_msgSend(v5, "carPlayType") == 1)
  {
    WFLogForCategory(5uLL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        objc_msgSend(v5, "ssid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v58 = v14;
        _os_log_impl(&dword_219FC8000, v13, v12, "adding kWiFiJoiningFromUI == 1 for CarPlayOnly network %@", buf, 0xCu);

      }
    }

    WiFiNetworkSetProperty();
  }
  if (objc_msgSend(v6, "isInstantHotspotJoin"))
  {
    WFLogForCategory(5uLL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15)
    {
      v17 = v15;
      if (os_log_type_enabled(v17, v16))
      {
        objc_msgSend(v5, "ssid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v58 = v18;
        _os_log_impl(&dword_219FC8000, v17, v16, "adding kWiFiInstantHotspotJoining for instant hotspot join to %@", buf, 0xCu);

      }
    }

    WiFiNetworkSetProperty();
  }
  if (v6)
  {
    objc_msgSend(v6, "scanAttributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v20, "removeObjectForKey:", CFSTR("enabled"));
    objc_msgSend(v20, "removeObjectForKey:", *MEMORY[0x24BE67DF0]);
    v21 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isHidden"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("HIDDEN_NETWORK"));

    WiFiNetworkCreate();
    if (objc_msgSend(v5, "isEnterprise"))
    {
      WiFiNetworkMergeForAssociation();
      objc_msgSend(v6, "enterpriseProfile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        WiFiNetworkSetProperty();
      }
      else
      {
        WFLogForCategory(5uLL);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v24)
        {
          v26 = v24;
          if (os_log_type_enabled(v26, v25))
          {
            objc_msgSend(v5, "ssid");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v58 = v55;
            _os_log_impl(&dword_219FC8000, v26, v25, "enterprise profile is nil for %@", buf, 0xCu);

          }
          v21 = 0x24BDD1000;
        }

      }
      objc_msgSend(v6, "policyUUID");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        Property = WiFiNetworkGetProperty();

        if (!Property)
        {
          WFLogForCategory(5uLL);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v30)
          {
            v32 = v30;
            if (os_log_type_enabled(v32, (os_log_type_t)v31))
            {
              objc_msgSend(v6, "policyUUID");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "ssid");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v58 = v56;
              v59 = 2112;
              v60 = v54;
              _os_log_impl(&dword_219FC8000, v32, (os_log_type_t)v31, "setting policyUUID %@ for %@", buf, 0x16u);

            }
            v21 = 0x24BDD1000uLL;
          }

          objc_msgSend(v6, "policyUUID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          WiFiNetworkSetProperty();

        }
      }

    }
    objc_msgSend(v6, "originatorBundleIdentifier", v54);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v6, "originatorBundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      WiFiNetworkSetProperty();

    }
    objc_msgSend(v6, "hotspotDeviceIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v6, "hotspotDeviceIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      WiFiNetworkSetProperty();

    }
    if (objc_msgSend(v6, "isInSaveDataMode"))
      v38 = 1;
    else
      v38 = 2;
    objc_msgSend(*(id *)(v21 + 1760), "numberWithInt:", v38);
    WiFiNetworkSetProperty();
    CoreWiFiNetworkProfile = (void *)WiFiNetworkCreateCoreWiFiNetworkProfile();
    if (objc_msgSend(v6, "wasAddedFromWiFiPasswordSharing"))
    {
      WFLogForCategory(5uLL);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v40)
      {
        v42 = v40;
        if (os_log_type_enabled(v42, v41))
        {
          objc_msgSend(v5, "ssid");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v58 = v43;
          _os_log_impl(&dword_219FC8000, v42, v41, "'%@' was added from WiFi password sharing, setting add reason.", buf, 0xCu);

        }
      }

      objc_msgSend(CoreWiFiNetworkProfile, "setAddReason:", 11);
    }
    objc_msgSend(v7, "setKnownNetworkProfile:", CoreWiFiNetworkProfile);
    WFLogForCategory(5uLL);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v44 && os_log_type_enabled(v44, v45))
    {
      *(_DWORD *)buf = 138412290;
      v58 = CoreWiFiNetworkProfile;
      _os_log_impl(&dword_219FC8000, v44, v45, "known network profile %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "password");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    WFLogForCategory(5uLL);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v47)
    {
      v49 = v47;
      if (os_log_type_enabled(v49, v48))
      {
        objc_msgSend(v5, "ssid");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v58 = v50;
        _os_log_impl(&dword_219FC8000, v49, v48, "password provided to assoication parameters for %@", buf, 0xCu);

      }
    }

    objc_msgSend(v6, "password");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPassword:", v51);

  }
  CoreWiFiScanResult = (void *)WiFiNetworkCreateCoreWiFiScanResult();
  objc_msgSend(v7, "setScanResult:", CoreWiFiScanResult);
  if (v10)
    CFRelease(v10);
  objc_msgSend(v7, "setRememberUponSuccessfulAssociation:", 1);

  return v7;
}

@end
