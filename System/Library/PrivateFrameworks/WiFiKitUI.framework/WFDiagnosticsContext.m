@implementation WFDiagnosticsContext

- (WFDiagnosticsContext)initWithNetwork:(id)a3 profile:(id)a4 detailsContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFDiagnosticsContext *v12;
  WFDiagnosticsContext *v13;
  uint64_t v14;
  NSString *BSSID;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  NSString *security;
  void *v22;
  uint64_t v23;
  NSDate *networkQualityDate;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v30;
  os_log_type_t v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)WFDiagnosticsContext;
  v12 = -[WFDiagnosticsContext init](&v32, sel_init);
  v13 = v12;
  if (!v12)
  {
    v28 = 0;
    goto LABEL_39;
  }
  if (!v9)
  {
    WFLogForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[WFDiagnosticsContext initWithNetwork:profile:detailsContext:]";
      _os_log_impl(&dword_2196CC000, v30, v31, "%s: nil network", buf, 0xCu);
    }

    v28 = v13;
    v13 = 0;
    goto LABEL_39;
  }
  objc_storeStrong((id *)&v12->_network, a3);
  objc_storeStrong((id *)&v13->_context, a5);
  -[WFNetworkScanRecord bssid](v13->_network, "bssid");
  v14 = objc_claimAutoreleasedReturnValue();
  BSSID = v13->_BSSID;
  v13->_BSSID = (NSString *)v14;

  v16 = objc_msgSend(v9, "securityMode");
  if (v16 <= 63)
  {
    switch(v16)
    {
      case 0:
        goto LABEL_23;
      case 1:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("kWFLocDiagnosticsSecurityWEP");
        break;
      case 2:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("kWFLocDiagnosticsSecurityLEAP");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_33;
      case 4:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("kWFLocDiagnosticsSecurityWPAPersonal");
        break;
      case 8:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("kWFLocDiagnosticsSecurityWPA2Personal");
        break;
      default:
        if (v16 == 16)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          v19 = CFSTR("kWFLocDiagnosticsSecurityWPAEnterprise");
        }
        else
        {
          if (v16 != 32)
            goto LABEL_33;
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          v19 = CFSTR("kWFLocDiagnosticsSecurityWPA2 Enterprise");
        }
        break;
    }
  }
  else if (v16 > 519)
  {
    if (v16 > 1074)
    {
      if (v16 == 1075)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("kWFLocDiagnosticsSecurityAnyEAPEncryption");
      }
      else
      {
        if (v16 != 2048)
          goto LABEL_33;
LABEL_23:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("kWFLocDiagnosticsSecurityOpen");
      }
    }
    else if (v16 == 520)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = CFSTR("kWFLocDiagnosticsSecurityWPA3Transition");
    }
    else
    {
      if (v16 != 1024)
        goto LABEL_33;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = CFSTR("kWFLocDiagnosticsSecurityWPA3Enterprise");
    }
  }
  else if (v16 > 255)
  {
    if (v16 == 256)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = CFSTR("kWFLocDiagnosticsSecurityWEP40_128");
    }
    else
    {
      if (v16 != 512)
        goto LABEL_33;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = CFSTR("kWFLocDiagnosticsSecurityWPA3Personal");
    }
  }
  else if (v16 == 64)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("kWFLocDiagnosticsSecurityWAPIPersonal");
  }
  else
  {
    if (v16 != 128)
      goto LABEL_33;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("kWFLocDiagnosticsSecurityWAPIEnterprise");
  }
  objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
  v20 = objc_claimAutoreleasedReturnValue();
  security = v13->_security;
  v13->_security = (NSString *)v20;

LABEL_33:
  v13->_captive = objc_msgSend(v10, "isCaptive");
  objc_msgSend(v10, "networkQualityDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copy");
  networkQualityDate = v13->_networkQualityDate;
  v13->_networkQualityDate = (NSDate *)v23;

  objc_msgSend(v10, "networkQualityResponsiveness");
  v13->_networkQualityResponsiveness = v25;
  v26 = WiFiManagerClientCreate();
  v13->_manager = (__WiFiManagerClient *)v26;
  if (v26)
  {
    v27 = (void *)WiFiManagerClientCopyDevices();
    if (objc_msgSend(v27, "count"))
      v13->_device = (__WiFiDeviceClient *)objc_msgSend(v27, "objectAtIndex:", 0);

  }
  if (v13->_device)
  {
    WiFiDeviceClientRegisterDiagnosticsCallback();
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "getCFRunLoop");
    WiFiManagerClientScheduleWithRunLoop();
LABEL_39:

  }
  return v13;
}

- (void)updateInfo:(id)a3
{
  const void *v4;
  NSString *v5;
  NSString *BSSID;
  NSNumber *v7;
  NSNumber *channel;
  NSString *v9;
  NSString *channelString;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  NSString *v15;
  NSString *deployment;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  NSString *v21;
  NSString *motion;
  void *v23;
  void *v24;
  const void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  int v31;
  NSString *v32;
  NSString *rssiPerformance;
  NSString *v34;
  NSString *rssi;
  void *v36;
  void *v37;
  const __CFString *v38;
  int v39;
  NSString *v40;
  NSString *cca;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *gateway;
  NSString *v47;
  NSString *v48;
  NSString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *internet;
  NSString *v56;
  NSString *v57;
  NSString *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  NSString *v66;
  NSString *awdl;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  NSString *v73;
  NSString *bluetooth;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  NSString *v80;
  NSString *scan;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSString *v92;
  NSString *coexFooter;
  void (**v94)(void);
  int v95;
  void *v96;
  void *v97;
  const void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;

  v103 = a3;
  v4 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
  if (!v103 || !v4)
    goto LABEL_62;
  WiFiNetworkGetProperty();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  BSSID = self->_BSSID;
  self->_BSSID = v5;

  WiFiNetworkGetProperty();
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  channel = self->_channel;
  self->_channel = v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%dMHz)"), self->_channel, WiFiNetworkGetChannelWidthInMHz());
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  channelString = self->_channelString;
  self->_channelString = v9;

  WiFiNetworkGetAPEnv();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v11, "intValue"))
  {
    case 1u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("kWFLocDiagnosticsLearning");
      break;
    case 2u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("kWFLocDiagnosticsSingleAP");
      break;
    case 3u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("kWFLocDiagnosticsDualBandSingleAP");
      break;
    case 4u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("kWFLocDiagnosticsMultipleAP");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("kWFLocDiagnosticsUnspecifiedEnv");
      break;
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  deployment = self->_deployment;
  self->_deployment = v15;

  objc_msgSend(v103, "objectForKey:", *MEMORY[0x24BE67D70]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("Stationary")))
  {
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("Walking")))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("kWFLocDiagnosticsWalking");
      goto LABEL_17;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("Running")))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("kWFLocDiagnosticsRunning");
      goto LABEL_17;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("Driving")))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("kWFLocDiagnosticsDriving");
      goto LABEL_17;
    }
    if (!objc_msgSend(v17, "isEqualToString:", CFSTR("Moving")))
    {
      v95 = objc_msgSend(v17, "isEqualToString:", CFSTR("Driving Stopped"));
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v95)
        v20 = CFSTR("kWFLocDiagnosticsDrivingStopped");
      else
        v20 = CFSTR("kWFLocDiagnosticsMotionUnknown");
      goto LABEL_17;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = CFSTR("kWFLocDiagnosticsMoving");
LABEL_17:
  objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  motion = self->_motion;
  self->_motion = v21;

  objc_msgSend(v103, "objectForKey:", *MEMORY[0x24BE67D68]);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v23 = v17;
    v24 = v11;
    v25 = v4;
    objc_msgSend(v102, "objectForKey:", CFSTR("RSSI"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "objectForKey:", CFSTR("CCA"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v26, "intValue") < -59)
    {
      v31 = objc_msgSend(v26, "intValue");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v31 < -74)
        v30 = CFSTR("kWFLocDiagnosticsRSSIWeak");
      else
        v30 = CFSTR("kWFLocDiagnosticsRSSIModerate");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = CFSTR("kWFLocDiagnosticsRSSIStrong");
    }
    objc_msgSend(v28, "localizedStringForKey:value:table:", v30, &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
    rssiPerformance = self->_rssiPerformance;
    self->_rssiPerformance = v32;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%@)"), v26, self->_rssiPerformance);
    v34 = (NSString *)objc_claimAutoreleasedReturnValue();
    rssi = self->_rssi;
    self->_rssi = v34;

    if ((int)objc_msgSend(v27, "intValue") > 49)
    {
      v39 = objc_msgSend(v27, "intValue");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v39 > 69)
        v38 = CFSTR("kWFLocDiagnosticsCCAWeak");
      else
        v38 = CFSTR("kWFLocDiagnosticsCCAModerate");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      v38 = CFSTR("kWFLocDiagnosticsCCAStrong");
    }
    objc_msgSend(v36, "localizedStringForKey:value:table:", v38, &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
    v40 = (NSString *)objc_claimAutoreleasedReturnValue();
    cca = self->_cca;
    self->_cca = v40;

    v4 = v25;
    v11 = v24;
    v17 = v23;
  }
  objc_msgSend(v103, "objectForKey:", *MEMORY[0x24BE67D78]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v43, "objectForKey:", CFSTR("kWiFiLqaMgrNumProbesFail"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKey:", CFSTR("kWiFiLqaMgrAverageRTT"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v44, "intValue") < 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ms"), v45);
      v49 = (NSString *)objc_claimAutoreleasedReturnValue();
      gateway = self->_gateway;
      self->_gateway = v49;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      gateway = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(gateway, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsProbeNoConnection"), &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
      v47 = (NSString *)objc_claimAutoreleasedReturnValue();
      v48 = self->_gateway;
      self->_gateway = v47;

    }
  }
  objc_msgSend(v103, "objectForKey:", *MEMORY[0x24BE67D80]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v51, "objectForKey:", CFSTR("kWiFiLqaMgrNumProbesFail"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v51;
    objc_msgSend(v51, "objectForKey:", CFSTR("kWiFiLqaMgrAverageRTT"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v52, "intValue") < 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ms"), v54);
      v58 = (NSString *)objc_claimAutoreleasedReturnValue();
      internet = self->_internet;
      self->_internet = v58;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      internet = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(internet, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsProbeNoConnection"), &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
      v56 = (NSString *)objc_claimAutoreleasedReturnValue();
      v57 = self->_internet;
      self->_internet = v56;

    }
    v51 = v53;
  }
  objc_msgSend(v103, "objectForKey:", *MEMORY[0x24BE67D58]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v59)
  {
    objc_msgSend(v59, "objectForKey:", CFSTR("LINK_CHANGED_IS_LINKDOWN"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v62)
      v65 = CFSTR("kWFLocDiagnosticsAWDLInactive");
    else
      v65 = CFSTR("kWFLocDiagnosticsAWDLActive");
    objc_msgSend(v63, "localizedStringForKey:value:table:", v65, &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
    v66 = (NSString *)objc_claimAutoreleasedReturnValue();
    awdl = self->_awdl;
    self->_awdl = v66;

  }
  objc_msgSend(v103, "objectForKey:", *MEMORY[0x24BE67D60]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
  {
    switch(objc_msgSend(v68, "intValue"))
    {
      case 0u:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v70;
        v72 = CFSTR("kWFLocDiagnosticsBTIdle");
        break;
      case 1u:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v70;
        v72 = CFSTR("kWFLocDiagnosticsBT_SCO");
        break;
      case 2u:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v70;
        v72 = CFSTR("kWFLocDiagnosticsBT_A2DP");
        break;
      case 4u:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v70;
        v72 = CFSTR("kWFLocDiagnosticsBTInquiry");
        break;
      case 8u:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v70;
        v72 = CFSTR("kWFLocDiagnosticsBTPaging");
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v70;
        v72 = CFSTR("kWFLocDiagnosticsBTUnnkown");
        break;
    }
    objc_msgSend(v70, "localizedStringForKey:value:table:", v72, &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
    v73 = (NSString *)objc_claimAutoreleasedReturnValue();
    bluetooth = self->_bluetooth;
    self->_bluetooth = v73;

  }
  v99 = v69;
  v100 = v60;
  v101 = v43;
  objc_msgSend(v103, "objectForKey:", *MEMORY[0x24BE67D90]);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "intValue");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (v76)
    v79 = CFSTR("kWFLocDiagnosticsScanInactive");
  else
    v79 = CFSTR("kWFLocDiagnosticsScanActive");
  objc_msgSend(v77, "localizedStringForKey:value:table:", v79, &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
  v80 = (NSString *)objc_claimAutoreleasedReturnValue();
  scan = self->_scan;
  self->_scan = v80;

  objc_msgSend(v103, "objectForKey:", *MEMORY[0x24BE67D88]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (v82)
  {
    v84 = v51;
    objc_msgSend(v82, "objectForKey:", *MEMORY[0x24BE67D40]);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "objectForKey:", *MEMORY[0x24BE67D48]);
    v86 = objc_claimAutoreleasedReturnValue();
    v87 = (void *)v86;
    if (v85 && v86)
    {
      v96 = (void *)MEMORY[0x24BDD17C8];
      v98 = v4;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsLastScan"), &stru_24DB39F78, CFSTR("WiFiKitLocalizableStrings"));
      v97 = v17;
      v89 = v11;
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v87, 1, 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "stringWithFormat:", CFSTR("%@ %@ at %@"), v90, v85, v91);
      v92 = (NSString *)objc_claimAutoreleasedReturnValue();
      coexFooter = self->_coexFooter;
      self->_coexFooter = v92;

      v11 = v89;
      v17 = v97;

      v4 = v98;
    }

    v51 = v84;
  }
  -[WFDiagnosticsContext refreshHandler](self, "refreshHandler");
  v94 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v94[2]();

  CFRelease(v4);
LABEL_62:

}

- (void)cancel
{
  id v3;

  if (self->_device)
    WiFiDeviceClientRegisterDiagnosticsCallback();
  if (self->_manager)
  {
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getCFRunLoop");
    WiFiManagerClientUnscheduleFromRunLoop();

  }
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (BOOL)captive
{
  return self->_captive;
}

- (BOOL)multiAP
{
  return self->_multiAP;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (NSString)channelPerformance
{
  return self->_channelPerformance;
}

- (int64_t)requestedFields
{
  return self->requestedFields;
}

- (NSString)rssi
{
  return self->_rssi;
}

- (NSString)rssiPerformance
{
  return self->_rssiPerformance;
}

- (id)refreshHandler
{
  return self->refreshHandler;
}

- (void)setRefreshHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)security
{
  return self->_security;
}

- (NSString)adviceString
{
  return self->_adviceString;
}

- (NSString)awdl
{
  return self->_awdl;
}

- (NSString)beaconPER
{
  return self->_beaconPER;
}

- (NSString)bluetooth
{
  return self->_bluetooth;
}

- (NSString)cca
{
  return self->_cca;
}

- (NSString)channelString
{
  return self->_channelString;
}

- (NSString)channelWidth
{
  return self->_channelWidth;
}

- (NSString)coexFooter
{
  return self->_coexFooter;
}

- (NSString)deployment
{
  return self->_deployment;
}

- (NSString)motion
{
  return self->_motion;
}

- (NSString)gateway
{
  return self->_gateway;
}

- (NSString)internet
{
  return self->_internet;
}

- (BOOL)managed
{
  return self->_managed;
}

- (NSString)probeFooter
{
  return self->_probeFooter;
}

- (NSString)recvFrames
{
  return self->_recvFrames;
}

- (NSString)scan
{
  return self->_scan;
}

- (NSString)securityAdvice
{
  return self->_securityAdvice;
}

- (NSString)transmitPER
{
  return self->_transmitPER;
}

- (NSDate)networkQualityDate
{
  return self->_networkQualityDate;
}

- (void)setNetworkQualityDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (double)networkQualityResponsiveness
{
  return self->_networkQualityResponsiveness;
}

- (void)setNetworkQualityResponsiveness:(double)a3
{
  self->_networkQualityResponsiveness = a3;
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (WFDetailsContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
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
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_networkQualityDate, 0);
  objc_storeStrong((id *)&self->_transmitPER, 0);
  objc_storeStrong((id *)&self->_securityAdvice, 0);
  objc_storeStrong((id *)&self->_scan, 0);
  objc_storeStrong((id *)&self->_recvFrames, 0);
  objc_storeStrong((id *)&self->_probeFooter, 0);
  objc_storeStrong((id *)&self->_internet, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_coexFooter, 0);
  objc_storeStrong((id *)&self->_channelWidth, 0);
  objc_storeStrong((id *)&self->_channelString, 0);
  objc_storeStrong((id *)&self->_cca, 0);
  objc_storeStrong((id *)&self->_bluetooth, 0);
  objc_storeStrong((id *)&self->_beaconPER, 0);
  objc_storeStrong((id *)&self->_awdl, 0);
  objc_storeStrong((id *)&self->_adviceString, 0);
  objc_storeStrong((id *)&self->_security, 0);
  objc_storeStrong(&self->refreshHandler, 0);
  objc_storeStrong((id *)&self->_rssiPerformance, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_channelPerformance, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
}

@end
