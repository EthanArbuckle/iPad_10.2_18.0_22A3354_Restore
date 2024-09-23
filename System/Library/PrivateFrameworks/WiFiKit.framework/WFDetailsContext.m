@implementation WFDetailsContext

- (WFDetailsContext)initWithNetwork:(id)a3 profile:(id)a4 ipMonitor:(id)a5 interface:(id)a6 privateMACConfig:(id)a7 wifiModeConfig:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  WFDetailsContext *v19;
  void *v20;
  os_log_type_t v21;
  NSObject *v22;
  char *v23;
  void *v24;
  os_log_type_t v25;
  NSObject *v26;
  char *v27;
  void *v28;
  os_log_type_t v29;
  NSObject *v30;
  char *v31;
  int v32;
  void *v33;
  os_log_type_t v34;
  BOOL v35;
  int v36;
  NSObject *v37;
  char *v38;
  void *v39;
  os_log_type_t v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  char *v44;
  void *v45;
  os_log_type_t v46;
  NSObject *v47;
  char *v48;
  char v49;
  int v50;
  void *v51;
  void *v52;
  os_log_type_t v53;
  NSObject *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  char *v59;
  BOOL v60;
  void *v61;
  os_log_type_t v62;
  NSObject *v63;
  id v64;
  id v65;
  id v66;
  char *v67;
  void *v68;
  uint64_t v69;
  NSString *hardwareMACAddress;
  void *v71;
  char *v72;
  NSObject *v73;
  NSObject *v74;
  NSString *v75;
  void *v76;
  uint64_t v77;
  NSString *randomMACAddress;
  void *v79;
  char *v80;
  NSObject *v81;
  NSObject *v82;
  NSString *v83;
  void *v84;
  os_log_type_t v85;
  NSObject *v86;
  int v87;
  uint64_t v88;
  void *v89;
  os_log_type_t v90;
  NSObject *v91;
  char *v92;
  id v93;
  _BOOL4 autoJoinEnabled;
  _BOOL4 autoLoginEnabled;
  void *v96;
  _BOOL4 randomMACAddressConfigurable;
  void *v98;
  NSObject *v99;
  os_log_type_t v100;
  id credentialsTappedHandler;
  WFPortalContext *v102;
  void *v103;
  uint64_t v104;
  WFPortalContext *portalContext;
  void *v106;
  int v107;
  NSObject *v108;
  os_log_type_t v109;
  const char *v110;
  void *v111;
  char v112;
  WFDetailsContext *v113;
  NSObject *v115;
  os_log_type_t v116;
  const char *v117;
  _BOOL4 isInSaveDataMode;
  _BOOL4 isPrivacyProxyEnabled;
  unint64_t privateAddressMode;
  id v121;
  id v122;
  id obj;
  id v124;
  id v125;
  id v126;
  objc_super v127;
  uint8_t buf[4];
  const char *v129;
  __int16 v130;
  _BYTE v131[10];
  char *v132;
  _BYTE v133[14];
  __int16 v134;
  void *v135;
  __int16 v136;
  _BOOL4 v137;
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v126 = a4;
  obj = a5;
  v16 = a5;
  v124 = a6;
  v125 = a6;
  v17 = a7;
  v18 = a8;
  v127.receiver = self;
  v127.super_class = (Class)WFDetailsContext;
  v19 = -[WFDetailsContext init](&v127, sel_init);

  if (!v19)
    goto LABEL_137;
  if (!v15)
  {
    WFLogForCategory(0);
    v115 = objc_claimAutoreleasedReturnValue();
    v116 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v115 || !os_log_type_enabled(v115, v116))
      goto LABEL_136;
    *(_DWORD *)buf = 136315138;
    v129 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
    v117 = "%s: nil network";
    goto LABEL_135;
  }
  objc_storeStrong((id *)&v19->_network, a3);
  if (v126)
  {
    objc_storeStrong((id *)&v19->_profile, a4);
    v19->_knownNetwork = 1;
    if (objc_msgSend(v126, "autoJoinConfigurable"))
    {
      WFLogForCategory(0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v20)
      {
        v22 = v20;
        if (os_log_type_enabled(v22, v21))
        {
          objc_msgSend(v15, "ssid");
          v23 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v129 = v23;
          _os_log_impl(&dword_219FC8000, v22, v21, "'%@' is autoJoinConfigurable", buf, 0xCu);

        }
      }

      v19->_requestedFields |= 0x20uLL;
    }
    if (objc_msgSend(v126, "autoLoginConfigurable"))
    {
      WFLogForCategory(0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v24)
      {
        v26 = v24;
        if (os_log_type_enabled(v26, v25))
        {
          objc_msgSend(v15, "ssid");
          v27 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v129 = v27;
          _os_log_impl(&dword_219FC8000, v26, v25, "'%@' is autoLoginConfigurable", buf, 0xCu);

        }
      }

      v19->_requestedFields |= 0x40uLL;
    }
    if (objc_msgSend(v126, "saveDataModeConfigurable"))
    {
      WFLogForCategory(0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v28)
      {
        v30 = v28;
        if (os_log_type_enabled(v30, v29))
        {
          objc_msgSend(v15, "ssid");
          v31 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v129 = v31;
          _os_log_impl(&dword_219FC8000, v30, v29, "'%@' is saveDataModeConfigurable", buf, 0xCu);

        }
      }

      v19->_requestedFields |= 0x200uLL;
    }
    v32 = objc_msgSend(v126, "networkQualityVisible");
    WFLogForCategory(0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel())
      v35 = v33 == 0;
    else
      v35 = 1;
    v36 = !v35;
    if (v32)
    {
      if (v36)
      {
        v37 = v33;
        if (os_log_type_enabled(v37, v34))
        {
          objc_msgSend(v15, "ssid");
          v38 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v129 = v38;
          _os_log_impl(&dword_219FC8000, v37, v34, "NetQuality: '%@' is networkQualityVisible", buf, 0xCu);

        }
      }

      v19->_requestedFields |= 0x800uLL;
    }
    else
    {
      if (v36)
      {
        v43 = v33;
        if (os_log_type_enabled(v43, v34))
        {
          objc_msgSend(v15, "ssid");
          v44 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v129 = v44;
          _os_log_impl(&dword_219FC8000, v43, v34, "NetQuality: %@ is NOT networkQualityVisible", buf, 0xCu);

        }
      }

    }
    if (objc_msgSend(v126, "forgetable"))
    {
      WFLogForCategory(0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v45)
      {
        v47 = v45;
        if (os_log_type_enabled(v47, v46))
        {
          objc_msgSend(v15, "ssid");
          v48 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v129 = v48;
          _os_log_impl(&dword_219FC8000, v47, v46, "'%@' is forgettable", buf, 0xCu);

        }
      }

      v19->_requestedFields |= 0x10uLL;
    }
  }
  else
  {
    WFLogForCategory(0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v39)
    {
      v41 = v39;
      if (os_log_type_enabled(v41, v40))
      {
        objc_msgSend(v15, "ssid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v129 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
        v130 = 2112;
        *(_QWORD *)v131 = v42;
        _os_log_impl(&dword_219FC8000, v41, v40, "%s: not a known network %@, nil profile", buf, 0x16u);

      }
    }

    v19->_knownNetwork = 0;
  }
  if (objc_msgSend(v15, "isPrivateMACDisabledByProfile")
    && objc_msgSend(v15, "isSupervised"))
  {
    v49 = objc_msgSend(v15, "isRandomMACAddressEnabled");
  }
  else
  {
    v49 = 1;
  }
  v19->_randomMACAddressConfigurable = v49;
  v50 = objc_msgSend(v126, "isAutoJoinDisabled");
  v19->_autoJoinEnabled = v50 ^ 1;
  if (((v50 ^ 1) & 1) == 0)
  {
    objc_msgSend(v126, "hasDisabledUntilDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      WFLogForCategory(0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v52)
      {
        v54 = v52;
        if (os_log_type_enabled(v54, v53))
        {
          objc_msgSend(v126, "SSID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "hasDisabledUntilDate");
          v56 = v18;
          v57 = v17;
          v58 = v16;
          v59 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v129 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
          v130 = 2112;
          *(_QWORD *)v131 = v55;
          *(_WORD *)&v131[8] = 2112;
          v132 = v59;
          _os_log_impl(&dword_219FC8000, v54, v53, "%s: %@ autojoin temporarily disabled until %@, overriding UI switch to show enabled", buf, 0x20u);

          v16 = v58;
          v17 = v57;
          v18 = v56;

        }
      }

      v19->_autoJoinEnabled = 1;
    }
  }
  v19->_autoLoginEnabled = objc_msgSend(v126, "bypassCaptive") ^ 1;
  if (objc_msgSend(v126, "lowDataMode") == 1)
  {
    v60 = 1;
  }
  else if (objc_msgSend(v126, "isPersonalHotspot"))
  {
    v60 = objc_msgSend(v126, "lowDataMode") == 0;
  }
  else
  {
    v60 = 0;
  }
  v19->_isInSaveDataMode = v60;
  v19->_isPrivacyProxyEnabled = objc_msgSend(v126, "isPrivacyProxyEnabled");
  if (MEMORY[0x24BED3BC8])
    v19->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  WFLogForCategory(0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v61)
  {
    v63 = v61;
    if (os_log_type_enabled(v63, v62))
    {
      objc_msgSend(v17, "hardwareMACAddress");
      v64 = v18;
      v65 = v17;
      v66 = v16;
      v67 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v129 = v67;
      _os_log_impl(&dword_219FC8000, v63, v62, "hardwareMAC is '%@'", buf, 0xCu);

      v16 = v66;
      v17 = v65;
      v18 = v64;
    }

  }
  objc_msgSend(v17, "hardwareMACAddress");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "formattedWiFiAddress");
  v69 = objc_claimAutoreleasedReturnValue();
  hardwareMACAddress = v19->_hardwareMACAddress;
  v19->_hardwareMACAddress = (NSString *)v69;

  if (v19->_greenTeaLogger)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "processName");
    v72 = (char *)objc_claimAutoreleasedReturnValue();

    getCTGreenTeaOsLogHandle();
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = v73;
    if (v73 && os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      v75 = v19->_hardwareMACAddress;
      *(_DWORD *)buf = 138413058;
      v129 = v72;
      v130 = 2080;
      *(_QWORD *)v131 = "com.apple.wifikit";
      *(_WORD *)&v131[8] = 2112;
      v132 = v72;
      *(_WORD *)v133 = 2112;
      *(_QWORD *)&v133[2] = v75;
      _os_log_impl(&dword_219FC8000, v74, OS_LOG_TYPE_INFO, "<%@>[%s][%@]:WLAN hardware MAC address..%@", buf, 0x2Au);
    }

  }
  objc_msgSend(v15, "randomMACAddress");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "formattedWiFiAddress");
  v77 = objc_claimAutoreleasedReturnValue();
  randomMACAddress = v19->_randomMACAddress;
  v19->_randomMACAddress = (NSString *)v77;

  if (v19->_greenTeaLogger)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "processName");
    v80 = (char *)objc_claimAutoreleasedReturnValue();

    getCTGreenTeaOsLogHandle();
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = v81;
    if (v81 && os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      v83 = v19->_randomMACAddress;
      *(_DWORD *)buf = 138413058;
      v129 = v80;
      v130 = 2080;
      *(_QWORD *)v131 = "com.apple.wifikit";
      *(_WORD *)&v131[8] = 2112;
      v132 = v80;
      *(_WORD *)v133 = 2112;
      *(_QWORD *)&v133[2] = v83;
      _os_log_impl(&dword_219FC8000, v82, OS_LOG_TYPE_INFO, "<%@>[%s][%@]:WLAN random MAC address..%@", buf, 0x2Au);
    }

  }
  v19->_randomMACFeatureEnabled = objc_msgSend(v17, "isPrivateAddressSupported");
  WFLogForCategory(0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v84)
  {
    v86 = v84;
    if (os_log_type_enabled(v86, v85))
    {
      v87 = objc_msgSend(v17, "isConnectedWithHardwareAddress");
      *(_DWORD *)buf = 67109120;
      LODWORD(v129) = v87;
      _os_log_impl(&dword_219FC8000, v86, v85, "Network connected with hardware Address: %d", buf, 8u);
    }

  }
  v19->_connectedWithHardwareAddress = objc_msgSend(v17, "isConnectedWithHardwareAddress");
  if (v19->_randomMACFeatureEnabled)
    v19->_requestedFields |= 0x400uLL;
  v88 = objc_msgSend(v17, "privateAddressMode");
  v19->_privateAddressMode = v88;
  v19->_randomMACAddressDisabled = v88 != 2;
  v19->_randomMACSwitchOn = v88 == 2;
  WFLogForCategory(0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v89)
  {
    v91 = v89;
    if (os_log_type_enabled(v91, v90))
    {
      objc_msgSend(v15, "ssid");
      v92 = (char *)objc_claimAutoreleasedReturnValue();
      v93 = v18;
      autoJoinEnabled = v19->_autoJoinEnabled;
      v121 = v17;
      autoLoginEnabled = v19->_autoLoginEnabled;
      isInSaveDataMode = v19->_isInSaveDataMode;
      isPrivacyProxyEnabled = v19->_isPrivacyProxyEnabled;
      privateAddressMode = v19->_privateAddressMode;
      objc_msgSend(v15, "randomMACAddress");
      v122 = v16;
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      randomMACAddressConfigurable = v19->_randomMACAddressConfigurable;
      *(_DWORD *)buf = 138414082;
      v129 = v92;
      v130 = 1024;
      *(_DWORD *)v131 = autoJoinEnabled;
      v18 = v93;
      *(_WORD *)&v131[4] = 1024;
      *(_DWORD *)&v131[6] = autoLoginEnabled;
      LOWORD(v132) = 1024;
      *(_DWORD *)((char *)&v132 + 2) = isInSaveDataMode;
      HIWORD(v132) = 1024;
      *(_DWORD *)v133 = isPrivacyProxyEnabled;
      *(_WORD *)&v133[4] = 2048;
      v17 = v121;
      *(_QWORD *)&v133[6] = privateAddressMode;
      v134 = 2112;
      v135 = v96;
      v136 = 1024;
      v137 = randomMACAddressConfigurable;
      _os_log_impl(&dword_219FC8000, v91, v90, "%@ - autoJoinEnabled=%d autoLoginEnabled=%d isInSaveDataMode=%d isPrivacyProxyEnabled=%d _privateAddressMode=%ld randomMAC='%@' _randomMACAddressConfigurable=%d", buf, 0x3Eu);

      v16 = v122;
    }

  }
  if (!v16)
  {
    WFLogForCategory(0);
    v115 = objc_claimAutoreleasedReturnValue();
    v116 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v115 || !os_log_type_enabled(v115, v116))
      goto LABEL_136;
    *(_DWORD *)buf = 136315138;
    v129 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
    v117 = "%s: nil ipmonitor";
    goto LABEL_135;
  }
  objc_storeStrong((id *)&v19->_ipMonitor, obj);
  objc_storeStrong((id *)&v19->_interface, v124);
  if (!v125)
  {
    WFLogForCategory(0);
    v115 = objc_claimAutoreleasedReturnValue();
    v116 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v115 || !os_log_type_enabled(v115, v116))
      goto LABEL_136;
    *(_DWORD *)buf = 136315138;
    v129 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
    v117 = "%s: nil interface";
LABEL_135:
    _os_log_impl(&dword_219FC8000, v115, v116, v117, buf, 0xCu);
LABEL_136:

LABEL_137:
    v19 = 0;
    goto LABEL_122;
  }
  v19->_supportsAirportManagement = 0;
  v19->_wifiModeConfigurable = objc_msgSend(v18, "isWifiModeConfigurable");
  v19->_wifiMode = objc_msgSend(v18, "wifiMode");
  objc_msgSend(MEMORY[0x24BE676A8], "sharedInstance");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v19->_demoModeEnabled = objc_msgSend(v98, "isStoreDemoModeEnabled:", 0);

  if (v19->_demoModeEnabled)
  {
    WFLogForCategory(0);
    v99 = objc_claimAutoreleasedReturnValue();
    v100 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v99 && os_log_type_enabled(v99, v100))
    {
      *(_DWORD *)buf = 136315138;
      v129 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
      _os_log_impl(&dword_219FC8000, v99, v100, "%s: demo mode enabled", buf, 0xCu);
    }

  }
  credentialsTappedHandler = v19->_credentialsTappedHandler;
  v19->_credentialsTappedHandler = &__block_literal_global_3;

  v102 = [WFPortalContext alloc];
  objc_msgSend(v126, "captiveProfile");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = -[WFPortalContext initWithCaptiveProfile:](v102, "initWithCaptiveProfile:", v103);
  portalContext = v19->_portalContext;
  v19->_portalContext = (WFPortalContext *)v104;

  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BE60C20], "shared");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v106, "enabled");

  }
  else
  {
    v107 = 0;
  }
  WFLogForCategory(0);
  v108 = objc_claimAutoreleasedReturnValue();
  v109 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v108 && os_log_type_enabled(v108, v109))
  {
    v110 = "disabled";
    if (v107)
      v110 = "enabled";
    *(_DWORD *)buf = 136315394;
    v129 = "-[WFDetailsContext initWithNetwork:profile:ipMonitor:interface:privateMACConfig:wifiModeConfig:]";
    v130 = 2080;
    *(_QWORD *)v131 = v110;
    _os_log_impl(&dword_219FC8000, v108, v109, "%s: Lockdown mode is %s", buf, 0x16u);
  }

  objc_msgSend(v15, "scanResult");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v111, "isAllowedInLockdownMode");

  v19->_autoJoinConfigurable = v107 && (v112 & 1) == 0;
LABEL_122:
  v113 = v19;

  return v113;
}

void __96__WFDetailsContext_initWithNetwork_profile_ipMonitor_interface_privateMACConfig_wifiModeConfig___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (a2 == 2)
  {
    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v2 = 13;
  }
  else
  {
    if (a2 != 1)
      return;
    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v2 = 12;
  }
  +[WFUserEvent eventWithType:](WFUserEvent, "eventWithType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processEvent:", v3);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (MEMORY[0x24BED3BD8])
    ct_green_tea_logger_destroy();
  self->_greenTeaLogger = 0;
  v4.receiver = self;
  v4.super_class = (Class)WFDetailsContext;
  -[WFDetailsContext dealloc](&v4, sel_dealloc);
}

- (void)setAutoJoinEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  v3 = a3;
  -[WFDetailsContext autoJoinHandler](self, "autoJoinHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFDetailsContext autoJoinHandler](self, "autoJoinHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
  self->_autoJoinEnabled = v3;
}

- (void)setWifiMode:(int64_t)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  -[WFDetailsContext WiFiModeChangedHandler](self, "WiFiModeChangedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFDetailsContext WiFiModeChangedHandler](self, "WiFiModeChangedHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, a3);

  }
  self->_wifiMode = a3;
}

- (void)setWifiModeConfig:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  self->_wifiModeConfigurable = objc_msgSend(v4, "isWifiModeConfigurable");
  v5 = objc_msgSend(v4, "wifiMode");

  self->_wifiMode = v5;
}

- (void)setAutoLoginEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  v3 = a3;
  -[WFDetailsContext autoLoginHandler](self, "autoLoginHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFDetailsContext autoLoginHandler](self, "autoLoginHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
  self->_autoLoginEnabled = v3;
}

- (void)setIsInSaveDataMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  v3 = a3;
  -[WFDetailsContext lowDataModeHandler](self, "lowDataModeHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFDetailsContext lowDataModeHandler](self, "lowDataModeHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
  self->_isInSaveDataMode = v3;
}

- (void)setWiFiOutranked:(BOOL)a3
{
  uint64_t v3;

  self->_WiFiOutranked = a3;
  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_requestedFields = self->_requestedFields & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (void)setWiFiOutranked:(BOOL)a3 privateCellular:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  int64_t requestedFields;
  int64_t v8;
  void *v9;
  os_log_type_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    self->_WiFiOutranked = a3;
    requestedFields = self->_requestedFields;
    if (a3)
      v8 = requestedFields | 0x4000;
    else
      v8 = requestedFields & 0xFFFFFFFFFFFFBFFFLL;
    self->_requestedFields = v8;
  }
  else
  {
    -[WFDetailsContext setWiFiOutranked:](self, "setWiFiOutranked:", a3);
  }
  WFLogForCategory(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9)
  {
    v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      -[WFDetailsContext network](self, "network");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ssid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = 67109634;
      v14[1] = v5;
      v15 = 1024;
      v16 = v4;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_219FC8000, v11, v10, "setting WiFiOutranked=%d privateCellular=%d for %@", (uint8_t *)v14, 0x18u);

    }
  }

}

- (void)setWiFiOutrankedDev:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  self->_WiFiOutrankedDev = a3;
  v4 = 0x2000;
  if (!a3)
    v4 = 0;
  self->_requestedFields = self->_requestedFields & 0xFFFFFFFFFFFFDFFFLL | v4;
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      -[WFDetailsContext network](self, "network");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ssid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = 0x2000;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_219FC8000, v7, v6, "setting WiFiOutrankedDev=%ld for %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)setIsPrivacyProxyEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  v3 = a3;
  -[WFDetailsContext privacyProxyHandler](self, "privacyProxyHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFDetailsContext privacyProxyHandler](self, "privacyProxyHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
  self->_isPrivacyProxyEnabled = v3;
}

- (void)runNetworkQualityWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD v16[4];

  v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v5 = objc_alloc_init(MEMORY[0x24BEDCBE8]);
  -[WFDetailsContext ipMonitor](self, "ipMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interfaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNetworkInterfaceName:", v7);

  v8 = objc_alloc(MEMORY[0x24BEDCBE0]);
  v9 = objc_alloc_init(MEMORY[0x24BEDCBE8]);
  v10 = (void *)objc_msgSend(v8, "initWithConfiguration:", v9);
  -[WFDetailsContext setNetworkQualityAssessment:](self, "setNetworkQualityAssessment:", v10);

  -[WFDetailsContext networkQualityAssessment](self, "networkQualityAssessment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__WFDetailsContext_runNetworkQualityWithCompletionHandler___block_invoke;
  v13[3] = &unk_24DC35678;
  v15 = v16;
  v13[4] = self;
  v12 = v4;
  v14 = v12;
  objc_msgSend(v11, "runWithCompletionHandler:", v13);

  _Block_object_dispose(v16, 8);
}

void __59__WFDetailsContext_runNetworkQualityWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, double);
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "downlinkResponsiveness");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "downlinkResponsiveness");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "unsignedLongValue");

    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v19 = 136315394;
      v20 = "-[WFDetailsContext runNetworkQualityWithCompletionHandler:]_block_invoke";
      v21 = 2048;
      v22 = v13;
      _os_log_impl(&dword_219FC8000, v11, v12, "NetQuality: %s: Got responsiveness %lu", (uint8_t *)&v19, 0x16u);
    }

  }
  WFLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
  {
    v19 = 136315394;
    v20 = "-[WFDetailsContext runNetworkQualityWithCompletionHandler:]_block_invoke";
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_219FC8000, v14, v15, "NetQuality: %s: Completed! Error: %@", (uint8_t *)&v19, 0x16u);
  }

  if (v6)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "networkQualityHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "networkQualityHandler");
      v18 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, double))v18)[2](v18, v16, (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setNetworkQualityAssessment:", 0);
  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))((double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                             + 24));

}

- (void)cancelNetworkQualityRun
{
  void *v3;
  void *v4;

  -[WFDetailsContext networkQualityAssessment](self, "networkQualityAssessment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFDetailsContext networkQualityAssessment](self, "networkQualityAssessment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[WFDetailsContext setNetworkQualityAssessment:](self, "setNetworkQualityAssessment:", 0);
  }
}

- (void)forget
{
  NSObject *v3;
  os_log_type_t v4;
  void (**v5)(_QWORD, _QWORD);
  uint8_t v6[16];

  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "User tapped forget in network details", v6, 2u);
  }

  -[WFDetailsContext actionHandler](self, "actionHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0);

}

- (void)openRecommendationLink
{
  NSObject *v3;
  os_log_type_t v4;
  void (**v5)(_QWORD, _QWORD);
  uint8_t v6[16];

  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "User tapped recommendation link in network details", v6, 2u);
  }

  -[WFDetailsContext actionHandler](self, "actionHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, 4);

}

- (void)renewLease
{
  NSObject *v3;
  os_log_type_t v4;
  void (**v5)(_QWORD, _QWORD);
  uint8_t v6[16];

  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "User tapped remew lease in network details", v6, 2u);
  }

  -[WFDetailsContext actionHandler](self, "actionHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, 3);

}

- (void)join
{
  NSObject *v3;
  os_log_type_t v4;
  void (**v5)(_QWORD, _QWORD);
  uint8_t v6[16];

  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "User tapped join network in details", v6, 2u);
  }

  -[WFDetailsContext actionHandler](self, "actionHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, 2);

}

- (void)manage
{
  NSObject *v3;
  os_log_type_t v4;
  void (**v5)(_QWORD, _QWORD);
  uint8_t v6[16];

  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219FC8000, v3, v4, "User tapped manage network in details", v6, 2u);
  }

  -[WFDetailsContext actionHandler](self, "actionHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, 1);

}

- (void)disableRandomMAC
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      -[WFDetailsContext network](self, "network");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ssid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_219FC8000, v5, v4, "user disabled using random mac address for '%@'", (uint8_t *)&v10, 0xCu);

    }
  }

  -[WFDetailsContext privateMACHandler](self, "privateMACHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFDetailsContext privateMACHandler](self, "privateMACHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, 3);

  }
}

- (void)enableRandomMAC:(BOOL)a3
{
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      -[WFDetailsContext network](self, "network");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ssid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_219FC8000, v6, v5, "user enabled using random mac address for '%@'", (uint8_t *)&v11, 0xCu);

    }
  }

  -[WFDetailsContext privateMACHandler](self, "privateMACHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFDetailsContext privateMACHandler](self, "privateMACHandler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, 2);

  }
}

- (void)updatePrivateAddressMode:(unint64_t)a3
{
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_219FC8000, v5, v6, "User tried to set private address mode to : %ld", (uint8_t *)&v9, 0xCu);
  }

  -[WFDetailsContext privateMACHandler](self, "privateMACHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFDetailsContext privateMACHandler](self, "privateMACHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, a3);

  }
  -[WFDetailsContext setPrivateAddressMode:](self, "setPrivateAddressMode:", a3);
}

- (BOOL)shouldHideCredentials
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[WFDetailsContext profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "addReason");

  -[WFDetailsContext profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addReason");

  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      -[WFDetailsContext network](self, "network");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "ssid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDetailsContext network](self, "network");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v21, "securityMode") == 0;
      -[WFDetailsContext network](self, "network");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v20, "isSupervised");
      -[WFDetailsContext profile](self, "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316930;
      v24 = "-[WFDetailsContext shouldHideCredentials]";
      v25 = 2112;
      v26 = v10;
      v27 = 1024;
      v28 = v19;
      v29 = 1024;
      v30 = v11;
      v31 = 1024;
      v32 = objc_msgSend(v12, "isProfileBased");
      v33 = 1024;
      v34 = v6 == 11;
      v35 = 1024;
      v36 = -[WFDetailsContext demoModeEnabled](self, "demoModeEnabled");
      v37 = 1024;
      v38 = v4 == 10;
      _os_log_impl(&dword_219FC8000, v9, v8, "%s: Network %@ is open:%d supervised:%d profile-based:%d shared:%d demo-mode-enabled:%d carrier-based:%d", buf, 0x3Au);

    }
  }

  -[WFDetailsContext network](self, "network");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "securityMode"))
  {
    -[WFDetailsContext network](self, "network");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isSupervised") & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      -[WFDetailsContext profile](self, "profile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 1;
      if ((objc_msgSend(v16, "isProfileBased") & 1) == 0 && v6 != 11)
      {
        v17 = -[WFDetailsContext demoModeEnabled](self, "demoModeEnabled");
        v15 = v4 == 10 || v17;
      }

    }
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (WFDiagnosticsContext)diagnosticsContext
{
  WFDiagnosticsContext *diagnosticsContext;
  WFNetworkProfile *v4;
  void *v5;
  WFNetworkProfile *v6;
  WFDiagnosticsContext *v7;
  void *v8;
  WFDiagnosticsContext *v9;
  WFDiagnosticsContext *v10;
  WFDiagnosticsContext *v11;

  diagnosticsContext = self->_diagnosticsContext;
  if (diagnosticsContext)
  {
    self->_diagnosticsContext = 0;

  }
  v4 = [WFNetworkProfile alloc];
  -[WFDetailsContext profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFNetworkProfile initWithCoreWiFiProfile:](v4, "initWithCoreWiFiProfile:", v5);

  v7 = [WFDiagnosticsContext alloc];
  -[WFDetailsContext network](self, "network");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFDiagnosticsContext initWithNetwork:profile:detailsContext:](v7, "initWithNetwork:profile:detailsContext:", v8, v6, self);
  v10 = self->_diagnosticsContext;
  self->_diagnosticsContext = v9;

  v11 = self->_diagnosticsContext;
  return v11;
}

- (BOOL)needsDismissal
{
  return 1;
}

- (void)cancel
{
  void *v3;
  void *v4;
  WFDiagnosticsContext *diagnosticsContext;

  -[WFDetailsContext networkQualityAssessment](self, "networkQualityAssessment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFDetailsContext networkQualityAssessment](self, "networkQualityAssessment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[WFDetailsContext setNetworkQualityAssessment:](self, "setNetworkQualityAssessment:", 0);
  }
  diagnosticsContext = self->_diagnosticsContext;
  self->_diagnosticsContext = 0;

}

- (void)overrideWiFiOutrank
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      -[WFDetailsContext network](self, "network");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ssid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_219FC8000, v5, v4, "User is overriding WiFi outrank for network='%@'", (uint8_t *)&v9, 0xCu);

    }
  }

  -[WFDetailsContext setWiFiOutranked:](self, "setWiFiOutranked:", 0);
  -[WFDetailsContext actionHandler](self, "actionHandler");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8[2](v8, 5);

}

- (unint64_t)networkOrigin
{
  void *v2;
  uint64_t v3;

  -[WFDetailsContext profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "addReason");

  if (v3 == 10)
    return 1;
  else
    return 2 * (v3 == 9);
}

- (NSString)portalURL
{
  void *v2;
  void *v3;

  -[WFDetailsContext portalContext](self, "portalContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "portalURLForDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)openPortalURL
{
  void (**v2)(id, uint64_t);

  -[WFDetailsContext actionHandler](self, "actionHandler");
  v2 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 6);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDetailsContext network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ssid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p SSID: %@ Current: %d Known: %d Context: %ld>"), v5, self, v7, -[WFDetailsContext isCurrent](self, "isCurrent"), -[WFDetailsContext isKnownNetwork](self, "isKnownNetwork"), -[WFDetailsContext entryContext](self, "entryContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)autoJoinEnabled
{
  return self->_autoJoinEnabled;
}

- (BOOL)autoLoginEnabled
{
  return self->_autoLoginEnabled;
}

- (BOOL)isInSaveDataMode
{
  return self->_isInSaveDataMode;
}

- (BOOL)isPrivacyProxyEnabled
{
  return self->_isPrivacyProxyEnabled;
}

- (WFNetworkView)provider
{
  return (WFNetworkView *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (BOOL)diagnosable
{
  return self->_diagnosable;
}

- (void)setDiagnosable:(BOOL)a3
{
  self->_diagnosable = a3;
}

- (BOOL)isRandomMACAddressDisabled
{
  return self->_randomMACAddressDisabled;
}

- (void)setRandomMACAddressDisabled:(BOOL)a3
{
  self->_randomMACAddressDisabled = a3;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_privateAddressMode = a3;
}

- (BOOL)isRandomMACAddressConfigurable
{
  return self->_randomMACAddressConfigurable;
}

- (BOOL)isRandomMACFeatureEnabled
{
  return self->_randomMACFeatureEnabled;
}

- (BOOL)isRandomMACSwitchOn
{
  return self->_randomMACSwitchOn;
}

- (void)setRandomMACSwitchOn:(BOOL)a3
{
  self->_randomMACSwitchOn = a3;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isConnectedWithHardwareAddress
{
  return self->_connectedWithHardwareAddress;
}

- (void)setConnectedWithHardwareAddress:(BOOL)a3
{
  self->_connectedWithHardwareAddress = a3;
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (BOOL)isWiFiOutranked
{
  return self->_WiFiOutranked;
}

- (BOOL)isWiFiOutrankedDev
{
  return self->_WiFiOutrankedDev;
}

- (BOOL)isJoinable
{
  return self->_joinable;
}

- (void)setJoinable:(BOOL)a3
{
  self->_joinable = a3;
}

- (BOOL)isWifiModeConfigurable
{
  return self->_wifiModeConfigurable;
}

- (void)setWifiModeConfigurable:(BOOL)a3
{
  self->_wifiModeConfigurable = a3;
}

- (int64_t)wifiMode
{
  return self->_wifiMode;
}

- (id)credentialsTappedHandler
{
  return self->_credentialsTappedHandler;
}

- (void)setCredentialsTappedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)autoJoinConfigurable
{
  return self->_autoJoinConfigurable;
}

- (void)setAutoJoinConfigurable:(unint64_t)a3
{
  self->_autoJoinConfigurable = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)autoJoinHandler
{
  return self->_autoJoinHandler;
}

- (void)setAutoJoinHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)autoLoginHandler
{
  return self->_autoLoginHandler;
}

- (void)setAutoLoginHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)lowDataModeHandler
{
  return self->_lowDataModeHandler;
}

- (void)setLowDataModeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)privacyProxyHandler
{
  return self->_privacyProxyHandler;
}

- (void)setPrivacyProxyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)privateMACHandler
{
  return self->_privateMACHandler;
}

- (void)setPrivateMACHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)WiFiModeChangedHandler
{
  return self->_WiFiModeChangedHandler;
}

- (void)setWiFiModeChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)networkQualityHandler
{
  return self->_networkQualityHandler;
}

- (void)setNetworkQualityHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_recommendations, a3);
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (BOOL)supportsAirportManagement
{
  return self->_supportsAirportManagement;
}

- (void)setSupportsAirportManagement:(BOOL)a3
{
  self->_supportsAirportManagement = a3;
}

- (CWFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (WFIPMonitor)ipMonitor
{
  return self->_ipMonitor;
}

- (void)setIpMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_ipMonitor, a3);
}

- (WFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (NSString)staticPrivateMACFooterText
{
  return self->_staticPrivateMACFooterText;
}

- (void)setStaticPrivateMACFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)turnONPrivateMACFooterText
{
  return self->_turnONPrivateMACFooterText;
}

- (void)setTurnONPrivateMACFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)turnOFFPrivateMACFooterText
{
  return self->_turnOFFPrivateMACFooterText;
}

- (void)setTurnOFFPrivateMACFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)isPrivacyProxyConfigurable
{
  return self->_privacyProxyConfigurable;
}

- (void)setPrivacyProxyConfigurable:(BOOL)a3
{
  self->_privacyProxyConfigurable = a3;
}

- (int64_t)privacyProxyTierStatus
{
  return self->_privacyProxyTierStatus;
}

- (void)setPrivacyProxyTierStatus:(int64_t)a3
{
  self->_privacyProxyTierStatus = a3;
}

- (BOOL)isCredentialsVisible
{
  return self->_credentialsVisible;
}

- (void)setCredentialsVisible:(BOOL)a3
{
  self->_credentialsVisible = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (int64_t)entryContext
{
  return self->_entryContext;
}

- (void)setEntryContext:(int64_t)a3
{
  self->_entryContext = a3;
}

- (WFPortalContext)portalContext
{
  return self->_portalContext;
}

- (void)setPortalContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (DADevice)daDevice
{
  return self->_daDevice;
}

- (void)setDaDevice:(id)a3
{
  objc_storeStrong((id *)&self->_daDevice, a3);
}

- (unint64_t)scrollToCellType
{
  return self->_scrollToCellType;
}

- (void)setScrollToCellType:(unint64_t)a3
{
  self->_scrollToCellType = a3;
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (int64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(int64_t)a3
{
  self->_requestedFields = a3;
}

- (BOOL)isKnownNetwork
{
  return self->_knownNetwork;
}

- (void)setKnownNetwork:(BOOL)a3
{
  self->_knownNetwork = a3;
}

- (void)setDiagnosticsContext:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsContext, a3);
}

- (NetworkQualityAssessment)networkQualityAssessment
{
  return self->_networkQualityAssessment;
}

- (void)setNetworkQualityAssessment:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityAssessment, a3);
}

- (BOOL)demoModeEnabled
{
  return self->_demoModeEnabled;
}

- (void)setDemoModeEnabled:(BOOL)a3
{
  self->_demoModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkQualityAssessment, 0);
  objc_storeStrong((id *)&self->_diagnosticsContext, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_daDevice, 0);
  objc_storeStrong((id *)&self->_portalContext, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_turnOFFPrivateMACFooterText, 0);
  objc_storeStrong((id *)&self->_turnONPrivateMACFooterText, 0);
  objc_storeStrong((id *)&self->_staticPrivateMACFooterText, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_ipMonitor, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_storeStrong(&self->_networkQualityHandler, 0);
  objc_storeStrong(&self->_WiFiModeChangedHandler, 0);
  objc_storeStrong(&self->_privateMACHandler, 0);
  objc_storeStrong(&self->_privacyProxyHandler, 0);
  objc_storeStrong(&self->_lowDataModeHandler, 0);
  objc_storeStrong(&self->_autoLoginHandler, 0);
  objc_storeStrong(&self->_autoJoinHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong(&self->_credentialsTappedHandler, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
