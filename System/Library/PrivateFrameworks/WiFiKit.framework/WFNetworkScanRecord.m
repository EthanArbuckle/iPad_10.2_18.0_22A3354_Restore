@implementation WFNetworkScanRecord

- (CWFNetworkProfile)matchingKnownNetworkProfile
{
  return self->_matchingKnownNetworkProfile;
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[WFNetworkScanRecord _isEqualToHotspotDevice:](self, "_isEqualToHotspotDevice:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = -[WFNetworkScanRecord _isEqualToNetwork:](self, "_isEqualToNetwork:", v4);
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNetworkRef:", 0);
  if (v5)
  {
    objc_msgSend(v5, "setHidden:", -[WFNetworkScanRecord isHidden](self, "isHidden"));
    objc_msgSend(v5, "setSecure:", -[WFNetworkScanRecord isSecure](self, "isSecure"));
    objc_msgSend(v5, "setCarPlay:", -[WFNetworkScanRecord isCarPlay](self, "isCarPlay"));
    objc_msgSend(v5, "setIOSHotspot:", -[WFNetworkScanRecord iOSHotspot](self, "iOSHotspot"));
    objc_msgSend(v5, "setRequiresPassword:", -[WFNetworkScanRecord requiresPassword](self, "requiresPassword"));
    objc_msgSend(v5, "setRequiresUsername:", -[WFNetworkScanRecord requiresUsername](self, "requiresUsername"));
    objc_msgSend(v5, "setAdhoc:", -[WFNetworkScanRecord isAdhoc](self, "isAdhoc"));
    objc_msgSend(v5, "setEnterprise:", -[WFNetworkScanRecord isEnterprise](self, "isEnterprise"));
    objc_msgSend(v5, "setUnconfiguredAccessory:", -[WFNetworkScanRecord isUnconfiguredAccessory](self, "isUnconfiguredAccessory"));
    objc_msgSend(v5, "setHotspot20:", -[WFNetworkScanRecord isHotspot20](self, "isHotspot20"));
    objc_msgSend(v5, "setAmbiguousSSID:", -[WFNetworkScanRecord isAmbiguousSSID](self, "isAmbiguousSSID"));
    objc_msgSend(v5, "setAirPortBaseStation:", -[WFNetworkScanRecord isAirPortBaseStation](self, "isAirPortBaseStation"));
    objc_msgSend(v5, "setCarPlayType:", -[WFNetworkScanRecord carPlayType](self, "carPlayType"));
    objc_msgSend(v5, "setUnconfiguredAccessoryType:", -[WFNetworkScanRecord unconfiguredAccessoryType](self, "unconfiguredAccessoryType"));
    objc_msgSend(v5, "setUnconfiguredAccessorySTAOnly:", -[WFNetworkScanRecord isUnconfiguredAccessorySTAOnly](self, "isUnconfiguredAccessorySTAOnly"));
    objc_msgSend(v5, "setRssi:", -[WFNetworkScanRecord rssi](self, "rssi"));
    objc_msgSend(v5, "setSecurityMode:", -[WFNetworkScanRecord securityMode](self, "securityMode"));
    -[WFNetworkScanRecord scaledRSSI](self, "scaledRSSI");
    objc_msgSend(v5, "setScaledRSSI:");
    objc_msgSend(v5, "setPhyMode:", -[WFNetworkScanRecord phyMode](self, "phyMode"));
    -[WFNetworkScanRecord ssid](self, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "setSsid:", v7);

    -[WFNetworkScanRecord bssid](self, "bssid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
    objc_msgSend(v5, "setBssid:", v9);

    -[WFNetworkScanRecord channel](self, "channel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
    objc_msgSend(v5, "setChannel:", v11);

    -[WFNetworkScanRecord eapProfile](self, "eapProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
    objc_msgSend(v5, "setEapProfile:", v13);

    -[WFNetworkScanRecord attributes](self, "attributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
    objc_msgSend(v5, "setAttributes:", v15);

    -[WFNetworkScanRecord unconfiguredDeviceName](self, "unconfiguredDeviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
    objc_msgSend(v5, "setUnconfiguredDeviceName:", v17);

    -[WFNetworkScanRecord unconfiguredDeviceID](self, "unconfiguredDeviceID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
    objc_msgSend(v5, "setUnconfiguredDeviceID:", v19);

    -[WFNetworkScanRecord hotspotPluginLabel](self, "hotspotPluginLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
    objc_msgSend(v5, "setHotspotPluginLabel:", v21);

    -[WFNetworkScanRecord hotspot20Name](self, "hotspot20Name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
    objc_msgSend(v5, "setHotspot20Name:", v23);

    objc_msgSend(v5, "setSecurityModeExt:", -[WFNetworkScanRecord securityModeExt](self, "securityModeExt"));
    -[WFNetworkScanRecord randomMACAddress](self, "randomMACAddress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
    objc_msgSend(v5, "setRandomMACAddress:", v25);

    objc_msgSend(v5, "setPrivateAddressMode:", -[WFNetworkScanRecord privateAddressMode](self, "privateAddressMode"));
    objc_msgSend(v5, "setRandomMACAddressEnabled:", -[WFNetworkScanRecord isRandomMACAddressEnabled](self, "isRandomMACAddressEnabled"));
    -[WFNetworkScanRecord privateAddressConfig](self, "privateAddressConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
    objc_msgSend(v5, "setPrivateAddressConfig:", v27);

    -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copyWithZone:", a3);
    objc_msgSend(v5, "setMatchingKnownNetworkProfile:", v29);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crowdsourceDescription, 0);
  objc_storeStrong((id *)&self->_unconfiguredDeviceID, 0);
  objc_storeStrong((id *)&self->_hotspotPluginLabel, 0);
  objc_storeStrong((id *)&self->_hotspot20Name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong((id *)&self->_matchingKnownNetworkProfile, 0);
  objc_storeStrong((id *)&self->_privateAddressConfig, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_eapProfile, 0);
  objc_storeStrong((id *)&self->_unconfiguredDeviceName, 0);
  objc_storeStrong((id *)&self->_channelWidth, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (NSString)unconfiguredDeviceName
{
  return self->_unconfiguredDeviceName;
}

- (NSString)unconfiguredDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (int64_t)unconfiguredAccessoryType
{
  return self->_unconfiguredAccessoryType;
}

- (void)setUnconfiguredDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setUnconfiguredDeviceID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void)setUnconfiguredAccessoryType:(int64_t)a3
{
  self->_unconfiguredAccessoryType = a3;
}

- (void)setUnconfiguredAccessorySTAOnly:(BOOL)a3
{
  self->_unconfiguredAccessorySTAOnly = a3;
}

- (void)setUnconfiguredAccessory:(BOOL)a3
{
  self->_unconfiguredAccessory = a3;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setSecurityModeExt:(int64_t)a3
{
  self->_securityModeExt = a3;
}

- (void)setSecurityMode:(int64_t)a3
{
  self->_securityMode = a3;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (void)setScaledRSSI:(float)a3
{
  self->_scaledRSSI = a3;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (void)setRequiresUsername:(BOOL)a3
{
  self->_requiresUsername = a3;
}

- (void)setRequiresPassword:(BOOL)a3
{
  self->_requiresPassword = a3;
}

- (void)setRandomMACAddressEnabled:(BOOL)a3
{
  self->_randomMACAddressEnabled = a3;
}

- (void)setRandomMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_randomMACAddress, a3);
}

- (void)setPrivateAddressConfig:(id)a3
{
  objc_storeStrong((id *)&self->_privateAddressConfig, a3);
}

- (void)setPhyMode:(unsigned int)a3
{
  self->_phyMode = a3;
}

- (void)setIOSHotspot:(BOOL)a3
{
  self->_iOSHotspot = a3;
}

- (void)setHotspotPluginLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setHotspot20Name:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setHotspot20:(BOOL)a3
{
  self->_hotspot20 = a3;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void)setEnterprise:(BOOL)a3
{
  self->_enterprise = a3;
}

- (void)setEapProfile:(id)a3
{
  objc_storeStrong((id *)&self->_eapProfile, a3);
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (void)setCarPlayType:(int64_t)a3
{
  self->_carPlayType = a3;
}

- (void)setCarPlay:(BOOL)a3
{
  self->_carPlay = a3;
}

- (void)setBssid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setAmbiguousSSID:(BOOL)a3
{
  self->_ambiguousSSID = a3;
}

- (void)setAirPortBaseStation:(BOOL)a3
{
  self->_airPortBaseStation = a3;
}

- (void)setAdhoc:(BOOL)a3
{
  self->_adhoc = a3;
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (float)scaledRSSI
{
  return self->_scaledRSSI;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (BOOL)requiresUsername
{
  return self->_requiresUsername;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (WFPrivateAddressConfig)privateAddressConfig
{
  return self->_privateAddressConfig;
}

- (unsigned)phyMode
{
  return self->_phyMode;
}

- (BOOL)isUnconfiguredAccessory
{
  return self->_unconfiguredAccessory;
}

- (BOOL)isUnconfiguredAccessorySTAOnly
{
  return self->_unconfiguredAccessorySTAOnly;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (BOOL)isHotspot20
{
  return self->_hotspot20;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isEnterprise
{
  return self->_enterprise;
}

- (BOOL)isAmbiguousSSID
{
  return self->_ambiguousSSID;
}

- (BOOL)isAirPortBaseStation
{
  return self->_airPortBaseStation;
}

- (BOOL)isAdhoc
{
  return self->_adhoc;
}

- (WFNetworkScanRecord)initWithScanResults:(id)a3
{
  id v4;
  WFNetworkScanRecord *v5;
  uint64_t v6;
  CWFScanResult *scanResult;
  uint64_t v8;
  NSString *ssid;
  uint64_t v10;
  NSString *bssid;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *channel;
  void *v16;
  void *v17;
  uint64_t v18;
  NSNumber *channelWidth;
  void *v20;
  int v21;
  uint64_t v22;
  NSString *unconfiguredDeviceName;
  void **p_unconfiguredDeviceName;
  uint64_t v25;
  uint64_t v26;
  NSString *unconfiguredDeviceID;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFData *v33;
  uint64_t v34;
  NSString *randomMACAddress;
  int v36;
  void *v37;
  void *v38;
  float v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  os_log_type_t v47;
  NSObject *v48;
  char *v49;
  uint64_t v50;
  NSString *crowdsourceDescription;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  WFPrivateAddressConfig *v57;
  WFPrivateAddressConfig *privateAddressConfig;
  void *v59;
  uint64_t v60;
  CWFNetworkProfile *matchingKnownNetworkProfile;
  WFNetworkScanRecord *v62;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  os_log_type_t v67;
  NSObject *v68;
  os_log_type_t v69;
  objc_super v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)WFNetworkScanRecord;
  v5 = -[WFNetworkScanRecord init](&v70, sel_init);
  if (!v5)
  {
    v20 = 0;
    v30 = 0;
    v28 = 0;
    v59 = 0;
    goto LABEL_45;
  }
  if (!v4)
  {
    WFLogForCategory(0);
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v66 && os_log_type_enabled(v66, v67))
    {
      *(_DWORD *)buf = 136315138;
      v72 = "-[WFNetworkScanRecord initWithScanResults:]";
      _os_log_impl(&dword_219FC8000, v66, v67, "%s: nil scan result", buf, 0xCu);
    }

    WFErrorLogCurrentCallStackThread(0, 3);
    goto LABEL_60;
  }
  v6 = objc_msgSend(v4, "copy");
  scanResult = v5->_scanResult;
  v5->_scanResult = (CWFScanResult *)v6;

  objc_msgSend(v4, "networkName");
  v8 = objc_claimAutoreleasedReturnValue();
  ssid = v5->_ssid;
  v5->_ssid = (NSString *)v8;

  if (!v5->_ssid)
  {
    WFLogForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v68 && os_log_type_enabled(v68, v69))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[WFNetworkScanRecord initWithScanResults:]";
      v73 = 2112;
      v74 = v4;
      _os_log_impl(&dword_219FC8000, v68, v69, "%s: nil SSID for %@", buf, 0x16u);
    }

LABEL_60:
    v20 = 0;
    v30 = 0;
    v28 = 0;
    v59 = v5;
    v5 = 0;
    goto LABEL_45;
  }
  v5->_hidden = objc_msgSend(v4, "isHidden");
  objc_msgSend(v4, "BSSID");
  v10 = objc_claimAutoreleasedReturnValue();
  bssid = v5->_bssid;
  v5->_bssid = (NSString *)v10;

  v5->_requiresPassword = objc_msgSend(v4, "requiresPassword");
  v5->_requiresUsername = objc_msgSend(v4, "requiresUsername");
  v5->_iOSHotspot = objc_msgSend(v4, "isPersonalHotspot");
  v5->_carPlay = objc_msgSend(v4, "isCarPlay");
  v5->_adhoc = objc_msgSend(v4, "isIBSS");
  v5->_enterprise = objc_msgSend(v4, "isEAP");
  v5->_phyMode = objc_msgSend(v4, "phyMode");
  v5->_ambiguousSSID = objc_msgSend(v4, "isSSIDAmbiguous");
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "channel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "channel"));
  v14 = objc_claimAutoreleasedReturnValue();
  channel = v5->_channel;
  v5->_channel = (NSNumber *)v14;

  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "channel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInt:", objc_msgSend(v17, "width"));
  v18 = objc_claimAutoreleasedReturnValue();
  channelWidth = v5->_channelWidth;
  v5->_channelWidth = (NSNumber *)v18;

  v5->_hotspot20 = objc_msgSend(v4, "isPasspoint");
  objc_msgSend(v4, "scanRecord");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(MEMORY[0x24BE03950], "isUnconfiguredDevice:", v20);
  v5->_unconfiguredAccessory = v21;
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BE03950], "unconfiguredDeviceName:", v20);
    v22 = objc_claimAutoreleasedReturnValue();
    p_unconfiguredDeviceName = (void **)&v5->_unconfiguredDeviceName;
    unconfiguredDeviceName = v5->_unconfiguredDeviceName;
    v5->_unconfiguredDeviceName = (NSString *)v22;

    if (objc_msgSend(MEMORY[0x24BE03950], "isHomeKitSecureWACDevice:", v20))
    {
      v5->_unconfiguredAccessoryType = 4;
      objc_storeStrong((id *)&v5->_unconfiguredDeviceName, v5->_ssid);
    }
    else
    {
      if (objc_msgSend(MEMORY[0x24BE03950], "isAirPlayDevice:", v20))
      {
        v25 = 2;
      }
      else
      {
        if (!objc_msgSend(MEMORY[0x24BE03950], "isGenericMFiAccessory:", v20))
        {
          v5->_unconfiguredAccessoryType = 1;
          if (v5->_unconfiguredDeviceName && v5->_bssid)
          {
            objc_msgSend(MEMORY[0x24BE03950], "uniqueBaseStationName:withBssid:");
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = *p_unconfiguredDeviceName;
            *p_unconfiguredDeviceName = (void *)v64;

          }
          goto LABEL_13;
        }
        v25 = 3;
      }
      v5->_unconfiguredAccessoryType = v25;
    }
LABEL_13:
    v5->_unconfiguredAccessorySTAOnly = objc_msgSend(MEMORY[0x24BE03950], "isSTAOnlyDevice:", v20);
    objc_msgSend(MEMORY[0x24BE03950], "unconfiguredDeviceID:", v20);
    v26 = objc_claimAutoreleasedReturnValue();
    unconfiguredDeviceID = v5->_unconfiguredDeviceID;
    v5->_unconfiguredDeviceID = (NSString *)v26;

    goto LABEL_14;
  }
  v5->_unconfiguredAccessoryType = 0;
LABEL_14:
  objc_msgSend(v4, "privateAddressConfigDictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateAddressInfoDictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "objectForKey:", *MEMORY[0x24BE67E50]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supervised = objc_msgSend(v31, "BOOLValue");

    objc_msgSend(v30, "objectForKey:", *MEMORY[0x24BE67E78]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_privateMACDisabledByProfile = objc_msgSend(v32, "BOOLValue");

  }
  if (v28)
  {
    v33 = (const __CFData *)objc_msgSend(v28, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_VALUE"));
    if (v33)
    {
      WFConvertEthernetNetworkAddressToString(v33);
      v34 = objc_claimAutoreleasedReturnValue();
      randomMACAddress = v5->_randomMACAddress;
      v5->_randomMACAddress = (NSString *)v34;

    }
    v36 = objc_msgSend((id)objc_msgSend(v28, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_TYPE")), "intValue");
    v5->_privateAddressMode = v36;
    v5->_randomMACAddressEnabled = v36 == 2;
  }
  else
  {
    v5->_randomMACAddressEnabled = 0;
  }
  v5->_rssi = objc_msgSend(v4, "RSSI");
  objc_msgSend(v20, "objectForKey:", CFSTR("ScaledRSSI"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v20, "objectForKey:", CFSTR("ScaledRSSI"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "floatValue");
    v5->_scaledRSSI = v39;

  }
  else
  {
    v5->_scaledRSSI = WFScaleRSSI(v5->_rssi);
  }
  v40 = WFSecurityModeFromScanDictionary(v20, &v5->_securityModeExt);
  v5->_securityMode = v40;
  v41 = (v40 | 0x800) != 0x800 || objc_msgSend(v4, "WAPISubtype") == 2 || objc_msgSend(v4, "WAPISubtype") == 1;
  if (v5->_iOSHotspot)
    v41 = 1;
  v5->_secure = v41;
  v5->_obsoleteNetworkCipherType = WFDetermineNetworkCipherTypeObsolete(v20);
  v5->_airPortBaseStation = objc_msgSend(v4, "airPortBaseStationModel") != 0;
  v5->_prominentDisplay = 1;
  objc_storeStrong((id *)&v5->_attributes, v20);
  objc_msgSend(v4, "OSSpecificAttributes");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKey:", *MEMORY[0x24BE67DE0]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "intValue");

  if (v44)
  {
    v45 = (void *)v44;
    WFLogForCategory(0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v46)
    {
      v48 = v46;
      if (os_log_type_enabled(v48, v47))
      {
        objc_msgSend(v4, "networkName");
        v49 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v72 = v49;
        v73 = 2048;
        v74 = v45;
        _os_log_impl(&dword_219FC8000, v48, v47, "Popularity for network: %@ is %lu", buf, 0x16u);

      }
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Score %lu"), v45);
    v50 = objc_claimAutoreleasedReturnValue();
    crowdsourceDescription = v5->_crowdsourceDescription;
    v5->_crowdsourceDescription = (NSString *)v50;
  }
  else
  {
    crowdsourceDescription = v5->_crowdsourceDescription;
    v5->_crowdsourceDescription = (NSString *)&stru_24DC36C30;
  }

  objc_msgSend(v4, "OSSpecificAttributes");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKey:", *MEMORY[0x24BE67DD0]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v53, "BOOLValue"))
  {
    v5->_known = 1;
  }
  else
  {
    objc_msgSend(v4, "matchingKnownNetworkProfile");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_known = v54 != 0;

  }
  objc_msgSend(v4, "OSSpecificAttributes");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKey:", *MEMORY[0x24BE67DD8]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_popular = objc_msgSend(v56, "BOOLValue");

  if (v5->_popular && v5->_enterprise)
    v5->_popular = 0;
  v57 = -[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]([WFPrivateAddressConfig alloc], "initWithPrivateAddressConfigDictionary:ssid:", v30, v5->_ssid);
  privateAddressConfig = v5->_privateAddressConfig;
  v5->_privateAddressConfig = v57;

  objc_msgSend(v4, "matchingKnownNetworkProfile");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "copy");
  matchingKnownNetworkProfile = v5->_matchingKnownNetworkProfile;
  v5->_matchingKnownNetworkProfile = (CWFNetworkProfile *)v60;

LABEL_45:
  v62 = v5;

  return v62;
}

- (WFNetworkScanRecord)initWithNetworkRef:(__WiFiNetwork *)a3
{
  WFNetworkScanRecord *v4;
  WFNetworkScanRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *ssid;
  uint64_t v12;
  NSString *bssid;
  int Type;
  uint64_t v15;
  uint64_t v16;
  NSNumber *channel;
  uint64_t v18;
  NSNumber *channelWidth;
  int v20;
  uint64_t v21;
  NSString *unconfiguredDeviceName;
  void **p_unconfiguredDeviceName;
  uint64_t v24;
  uint64_t v25;
  NSString *unconfiguredDeviceID;
  void *v27;
  void *v28;
  void *v29;
  const __CFData *v30;
  uint64_t v31;
  NSString *randomMACAddress;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  uint64_t v38;
  BOOL v39;
  void *v40;
  uint64_t v41;
  NSString *crowdsourceDescription;
  BOOL v43;
  WFPrivateAddressConfig *v44;
  WFPrivateAddressConfig *privateAddressConfig;
  WFNetworkScanRecord *v46;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)WFNetworkScanRecord;
  v4 = -[WFNetworkScanRecord init](&v52, sel_init);
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (!a3 || !v4)
    goto LABEL_41;
  v4->_hidden = WiFiNetworkGetDirectedState() != 0;
  WiFiNetworkGetSSID();
  v10 = objc_claimAutoreleasedReturnValue();
  ssid = v5->_ssid;
  v5->_ssid = (NSString *)v10;

  WiFiNetworkGetProperty();
  v12 = objc_claimAutoreleasedReturnValue();
  bssid = v5->_bssid;
  v5->_bssid = (NSString *)v12;

  v5->_requiresPassword = WiFiNetworkRequiresPassword() != 0;
  v5->_requiresUsername = WiFiNetworkRequiresUsername() != 0;
  v5->_iOSHotspot = WiFiNetworkIsApplePersonalHotspot() != 0;
  v5->_carPlay = WiFiNetworkIsCarPlay() != 0;
  Type = WiFiNetworkGetType();
  if (v5->_carPlay && (Type - 1) <= 1)
  {
    v15 = 1;
    if (Type == 2)
      v15 = 2;
    v5->_carPlayType = v15;
  }
  WiFiNetworkGetProperty();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_storeStrong((id *)&v5->_eapProfile, v9);
  v5->_adhoc = WiFiNetworkIsAdHoc() != 0;
  v5->_enterprise = WFWiFiNetworkRefIsEnterprise();
  v5->_phyMode = WiFiNetworkGetPhyMode();
  v5->_ambiguousSSID = WiFiNetworkIsSSIDAmbiguous() != 0;
  WiFiNetworkGetChannel();
  v16 = objc_claimAutoreleasedReturnValue();
  channel = v5->_channel;
  v5->_channel = (NSNumber *)v16;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", WiFiNetworkGetChannelWidthInMHz());
  v18 = objc_claimAutoreleasedReturnValue();
  channelWidth = v5->_channelWidth;
  v5->_channelWidth = (NSNumber *)v18;

  v5->_hotspot20 = WiFiNetworkIsHotspot20() != 0;
  v6 = (void *)WiFiNetworkCopyRecord();
  v20 = objc_msgSend(MEMORY[0x24BE03950], "isUnconfiguredDevice:", v6);
  v5->_unconfiguredAccessory = v20;
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BE03950], "unconfiguredDeviceName:", v6);
    v21 = objc_claimAutoreleasedReturnValue();
    p_unconfiguredDeviceName = (void **)&v5->_unconfiguredDeviceName;
    unconfiguredDeviceName = v5->_unconfiguredDeviceName;
    v5->_unconfiguredDeviceName = (NSString *)v21;

    if (objc_msgSend(MEMORY[0x24BE03950], "isHomeKitSecureWACDevice:", v6))
    {
      v5->_unconfiguredAccessoryType = 4;
      objc_storeStrong((id *)&v5->_unconfiguredDeviceName, v5->_ssid);
    }
    else
    {
      if (objc_msgSend(MEMORY[0x24BE03950], "isAirPlayDevice:", v6))
      {
        v24 = 2;
      }
      else
      {
        if (!objc_msgSend(MEMORY[0x24BE03950], "isGenericMFiAccessory:", v6))
        {
          v5->_unconfiguredAccessoryType = 1;
          if (v5->_bssid)
          {
            WiFiNetworkGetProperty();
            v48 = objc_claimAutoreleasedReturnValue();
            v49 = (void *)v48;
            if (*p_unconfiguredDeviceName && v48)
            {
              objc_msgSend(MEMORY[0x24BE03950], "uniqueBaseStationName:withBssid:");
              v50 = objc_claimAutoreleasedReturnValue();
              v51 = *p_unconfiguredDeviceName;
              *p_unconfiguredDeviceName = (void *)v50;

            }
          }
          goto LABEL_19;
        }
        v24 = 3;
      }
      v5->_unconfiguredAccessoryType = v24;
    }
LABEL_19:
    v5->_unconfiguredAccessorySTAOnly = objc_msgSend(MEMORY[0x24BE03950], "isSTAOnlyDevice:", v6);
    objc_msgSend(MEMORY[0x24BE03950], "unconfiguredDeviceID:", v6);
    v25 = objc_claimAutoreleasedReturnValue();
    unconfiguredDeviceID = v5->_unconfiguredDeviceID;
    v5->_unconfiguredDeviceID = (NSString *)v25;

    goto LABEL_20;
  }
  v5->_unconfiguredAccessoryType = 0;
LABEL_20:
  WiFiNetworkGetProperty();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE67E50]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_supervised = objc_msgSend(v27, "BOOLValue");

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE67E78]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_privateMACDisabledByProfile = objc_msgSend(v28, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v29;
  if (v29)
  {
    v30 = (const __CFData *)objc_msgSend(v29, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_VALUE"));
    if (v30)
    {
      WFConvertEthernetNetworkAddressToString(v30);
      v31 = objc_claimAutoreleasedReturnValue();
      randomMACAddress = v5->_randomMACAddress;
      v5->_randomMACAddress = (NSString *)v31;

    }
    v33 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_TYPE")), "intValue");
    v5->_privateAddressMode = v33;
    v5->_randomMACAddressEnabled = v33 == 2;
  }
  else
  {
    v5->_randomMACAddressEnabled = 0;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("RSSI"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_rssi = objc_msgSend(v34, "integerValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("ScaledRSSI"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("ScaledRSSI"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    v5->_scaledRSSI = v37;

  }
  else
  {
    v5->_scaledRSSI = WFScaleRSSI(v5->_rssi);
  }
  v38 = WFSecurityModeFromScanDictionary(v6, &v5->_securityModeExt);
  v5->_securityMode = v38;
  v39 = (v38 | 0x800) != 0x800 || WiFiNetworkIsWAPICERT() || WiFiNetworkIsWAPIPSK() != 0;
  v5->_secure = v39;
  v5->_obsoleteNetworkCipherType = WFDetermineNetworkCipherTypeObsolete(v6);
  objc_msgSend(v6, "objectForKey:", CFSTR("APPLE_IE"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
    v5->_airPortBaseStation = 1;
  v5->_prominentDisplay = 1;
  objc_storeStrong((id *)&v5->_attributes, v6);
  v5->_known = WiFiNetworkGetProperty() != 0;
  if (WiFiNetworkGetProperty())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Score %lu"), WiFiNetworkGetIntProperty());
    v41 = objc_claimAutoreleasedReturnValue();
    crowdsourceDescription = v5->_crowdsourceDescription;
    v5->_crowdsourceDescription = (NSString *)v41;

  }
  v43 = WiFiNetworkGetProperty() == *MEMORY[0x24BDBD270];
  v5->_popular = v43;
  if (v43 && v5->_enterprise)
    v5->_popular = 0;
  v44 = -[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]([WFPrivateAddressConfig alloc], "initWithPrivateAddressConfigDictionary:ssid:", v7, v5->_ssid);
  privateAddressConfig = v5->_privateAddressConfig;
  v5->_privateAddressConfig = v44;

LABEL_41:
  v46 = v5;

  return v46;
}

- (BOOL)iOSHotspot
{
  void *v3;
  void *v4;

  -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "NANServiceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 || self->_iOSHotspot;
}

- (NSString)hotspotPluginLabel
{
  return self->_hotspotPluginLabel;
}

- (NSString)hotspot20Name
{
  return self->_hotspot20Name;
}

- (NSDictionary)eapProfile
{
  return self->_eapProfile;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (int64_t)carPlayType
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;

  if (!-[WFNetworkScanRecord isCarPlay](self, "isCarPlay"))
    return 0;
  -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastJoinedByUserAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    return 2;
  }
  -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payloadUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 2;
  return 1;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)_isEqualToNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  _BOOL4 v15;

  v4 = a3;
  -[WFNetworkScanRecord ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && -[WFNetworkScanRecord isNetworkSecurityModeMatch:](self, "isNetworkSecurityModeMatch:", objc_msgSend(v4, "securityModeExt")))
  {
    v7 = objc_msgSend(v4, "isCarPlay");
    v8 = -[WFNetworkScanRecord isCarPlay](self, "isCarPlay");

    if (v7 == v8)
    {
      -[WFNetworkScanRecord randomMACAddress](self, "randomMACAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 || (objc_msgSend(v4, "randomMACAddress"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[WFNetworkScanRecord randomMACAddress](self, "randomMACAddress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "randomMACAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (v9)
        {
LABEL_13:

          v15 = -[WFNetworkScanRecord isRandomMACAddressEnabled](self, "isRandomMACAddressEnabled");
          v13 = v12 & (v15 ^ objc_msgSend(v4, "isRandomMACAddressEnabled") ^ 1);
          goto LABEL_10;
        }
      }
      else
      {
        v12 = 1;
      }

      goto LABEL_13;
    }
  }
  else
  {

  }
  LOBYTE(v13) = 0;
LABEL_10:

  return v13;
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (BOOL)isCarPlay
{
  return self->_carPlay;
}

- (BOOL)isRandomMACAddressEnabled
{
  return self->_randomMACAddressEnabled;
}

- (BOOL)isNetworkSecurityModeMatch:(int64_t)a3
{
  if (a3 == 512)
    return -[WFNetworkScanRecord securityModeExt](self, "securityModeExt") == a3;
  if (a3)
  {
    if (-[WFNetworkScanRecord securityModeExt](self, "securityModeExt") != 512)
      return (-[WFNetworkScanRecord securityModeExt](self, "securityModeExt") & a3) != 0;
    return -[WFNetworkScanRecord securityModeExt](self, "securityModeExt") == a3;
  }
  if (!-[WFNetworkScanRecord securityModeExt](self, "securityModeExt"))
    return 1;
  return -[WFNetworkScanRecord securityModeExt](self, "securityModeExt") == 2048;
}

- (int64_t)securityModeExt
{
  return self->_securityModeExt;
}

- (void)setMatchingKnownNetworkProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (WFNetworkScanRecord)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFNetworkScanRecord init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (WFNetworkScanRecord)initWithCoreWiFiProfile:(id)a3
{
  return -[WFNetworkScanRecord initWithNetworkRef:](self, "initWithNetworkRef:", (id)WiFiNetworkCreateFromCoreWiFiNetworkProfile());
}

- (int64_t)type
{
  if (self->_iOSHotspot)
    return 2;
  if (self->_adhoc)
    return 0;
  if (self->_unconfiguredAccessory)
    return 3;
  return 1;
}

- (BOOL)_isEqualToHotspotDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFNetworkScanRecord ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[WFNetworkScanRecord ssid](self, "ssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[WFNetworkScanRecord securityMode](self, "securityMode") ^ v4;

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  const __CFString *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkScanRecord ssid](self, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkScanRecord bssid](self, "bssid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFNetworkScanRecord rssi](self, "rssi");
  v9 = -[WFNetworkScanRecord isSecure](self, "isSecure");
  v10 = -[WFNetworkScanRecord isEnterprise](self, "isEnterprise");
  WFStringFromWFSecurityMode(-[WFNetworkScanRecord securityMode](self, "securityMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WFStringFromWFSecurityModeExt(-[WFNetworkScanRecord securityModeExt](self, "securityModeExt"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p ssid='%@' bssid='%@' rssi='%ld' secured=%d eap=%d mode='%@' modeExt=[%@]"), v5, self, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFNetworkScanRecord obsoleteNetworkCipherType](self, "obsoleteNetworkCipherType"))
    objc_msgSend(v13, "appendFormat:", CFSTR(" cipher=%d"), -[WFNetworkScanRecord obsoleteNetworkCipherType](self, "obsoleteNetworkCipherType"));
  objc_msgSend(v13, "appendFormat:", CFSTR(" hidden=%d"), -[WFNetworkScanRecord isHidden](self, "isHidden"));
  objc_msgSend(v13, "appendFormat:", CFSTR(" HS20=%d"), -[WFNetworkScanRecord isHotspot20](self, "isHotspot20"));
  if (-[WFNetworkScanRecord isCarPlay](self, "isCarPlay"))
  {
    v14 = -[WFNetworkScanRecord carPlayType](self, "carPlayType");
    v15 = CFSTR("CarPlayUserConfigured");
    if (v14 == 1)
      v15 = CFSTR("CarPlayOnly");
    objc_msgSend(v13, "appendFormat:", CFSTR(" carPlay='%@'"), v15);
  }
  if (-[WFNetworkScanRecord isUnconfiguredAccessory](self, "isUnconfiguredAccessory"))
  {
    v16 = -[WFNetworkScanRecord unconfiguredAccessoryType](self, "unconfiguredAccessoryType");
    -[WFNetworkScanRecord unconfiguredDeviceName](self, "unconfiguredDeviceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR(" MFIType=%d MFIName='%@'"), v16, v17);

  }
  if (-[WFNetworkScanRecord iOSHotspot](self, "iOSHotspot"))
    objc_msgSend(v13, "appendFormat:", CFSTR(" iOSHotspot=%d"), -[WFNetworkScanRecord iOSHotspot](self, "iOSHotspot"));
  objc_msgSend(v13, "appendFormat:", CFSTR(" popular=%d"), -[WFNetworkScanRecord isPopular](self, "isPopular"));
  objc_msgSend(v13, "appendFormat:", CFSTR(" known=%d"), -[WFNetworkScanRecord isKnown](self, "isKnown"));
  objc_msgSend(v13, "appendFormat:", CFSTR(" privateAddressState=%d"), -[WFNetworkScanRecord isRandomMACAddressEnabled](self, "isRandomMACAddressEnabled"));
  -[WFNetworkScanRecord randomMACAddress](self, "randomMACAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    -[WFNetworkScanRecord randomMACAddress](self, "randomMACAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR(" privateAddress='%@'"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v21);

  }
  -[WFNetworkScanRecord privateAddressConfig](self, "privateAddressConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    -[WFNetworkScanRecord privateAddressConfig](self, "privateAddressConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    WFPrivateAddressConfigDisableReasonToString(objc_msgSend(v24, "disabledReason"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR(" privateAddressDisabled='%@'"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v26);

  }
  -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR(" matchedProfile=[%@]"), v28);

  }
  objc_msgSend(v13, "appendString:", CFSTR(">"));
  return (NSString *)v13;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  void *v31;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;

  v4 = a3;
  if (!v4)
    goto LABEL_25;
  if (!_os_feature_enabled_impl())
  {
LABEL_17:
    if (objc_msgSend(v4, "isPopular") && !-[WFNetworkScanRecord isPopular](self, "isPopular"))
      goto LABEL_22;
    if ((objc_msgSend(v4, "isPopular") & 1) != 0 || !-[WFNetworkScanRecord isPopular](self, "isPopular"))
    {
      v27 = objc_msgSend(v4, "rssi");
      if (v27 > -[WFNetworkScanRecord rssi](self, "rssi"))
        goto LABEL_22;
      v29 = objc_msgSend(v4, "rssi");
      if (v29 > -[WFNetworkScanRecord rssi](self, "rssi"))
      {
        v28 = objc_msgSend(v4, "isEqual:", self) ^ 1;
        goto LABEL_26;
      }
    }
LABEL_25:
    v28 = 1;
    goto LABEL_26;
  }
  objc_msgSend(v4, "scanResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "is6GHz"))
  {

    goto LABEL_6;
  }
  -[WFNetworkScanRecord scanResult](self, "scanResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "is6GHz");

  if ((v9 & 1) == 0)
  {
LABEL_6:
    objc_msgSend(v4, "scanResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "BSSID");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[WFNetworkScanRecord scanResult](self, "scanResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "BSSID");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v4, "scanResult");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "BSSID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFNetworkScanRecord scanResult](self, "scanResult");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "BSSID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqual:", v19))
        {
          v48 = v17;
          v20 = v16;
          objc_msgSend(v4, "scanResult");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "SSID");
          v21 = objc_claimAutoreleasedReturnValue();
          -[WFNetworkScanRecord scanResult](self, "scanResult");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "SSID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)v21;
          v49 = v20;
          if ((void *)v21 == v52)
            goto LABEL_27;
          objc_msgSend(v4, "scanResult");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "SSID");
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            LOBYTE(v47) = 0;
            v26 = v48;
LABEL_41:

            goto LABEL_42;
          }
          v45 = (void *)v22;
          -[WFNetworkScanRecord scanResult](self, "scanResult");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "SSID");
          v23 = objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            LOBYTE(v47) = 0;
            v26 = v48;
LABEL_40:

            goto LABEL_41;
          }
          v43 = (void *)v23;
          objc_msgSend(v4, "scanResult");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "SSID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFNetworkScanRecord scanResult](self, "scanResult");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "SSID");
          v41 = v25;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v24;
          if (objc_msgSend(v25, "isEqual:"))
          {
LABEL_27:
            objc_msgSend(v4, "scanResult");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "channel");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v32, "is6GHz"))
            {
              v37 = v32;
              v38 = v31;
              -[WFNetworkScanRecord scanResult](self, "scanResult");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "channel");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v34, "is6GHz"))
              {
                objc_msgSend(v4, "scanResult");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v36, "hasNon6GHzRNRChannel"))
                {
                  -[WFNetworkScanRecord scanResult](self, "scanResult");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v35, "hasNon6GHzRNRChannel") ^ 1;

                }
                else
                {
                  LOBYTE(v47) = 0;
                }

              }
              else
              {
                LOBYTE(v47) = 0;
              }

            }
            else
            {

              LOBYTE(v47) = 0;
            }
            v26 = v48;
            if (v53 == v52)
            {
LABEL_42:

              if ((v47 & 1) != 0)
                goto LABEL_22;
              goto LABEL_17;
            }
          }
          else
          {
            LOBYTE(v47) = 0;
            v26 = v48;
          }

          goto LABEL_40;
        }

      }
    }

    goto LABEL_17;
  }
LABEL_22:
  v28 = -1;
LABEL_26:

  return v28;
}

- (void)populatePrivateAddressConfig:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFData *v8;
  NSString *v9;
  NSString *randomMACAddress;
  void *v11;
  int v12;
  WFPrivateAddressConfig *v13;
  WFPrivateAddressConfig *privateAddressConfig;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE67E50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_supervised = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE67E78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_privateMACDisabledByProfile = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v15, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (const __CFData *)objc_msgSend(v6, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_VALUE"));
    if (v8)
    {
      WFConvertEthernetNetworkAddressToString(v8);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      randomMACAddress = self->_randomMACAddress;
      self->_randomMACAddress = v9;

    }
    objc_msgSend(v7, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_TYPE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");
    self->_privateAddressMode = v12;
    self->_randomMACAddressEnabled = (v12 & 0xFFFFFFFE) == 2;

  }
  else
  {
    self->_randomMACAddressEnabled = 0;
  }
  v13 = -[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]([WFPrivateAddressConfig alloc], "initWithPrivateAddressConfigDictionary:ssid:", v15, self->_ssid);
  privateAddressConfig = self->_privateAddressConfig;
  self->_privateAddressConfig = v13;

}

- (NSNumber)channelWidth
{
  return self->_channelWidth;
}

- (BOOL)prominentDisplay
{
  return self->_prominentDisplay;
}

- (void)setProminentDisplay:(BOOL)a3
{
  self->_prominentDisplay = a3;
}

- (unint64_t)privateAddressMode
{
  return self->_privateAddressMode;
}

- (void)setPrivateAddressMode:(unint64_t)a3
{
  self->_privateAddressMode = a3;
}

- (BOOL)isPrivateMACDisabledByProfile
{
  return self->_privateMACDisabledByProfile;
}

- (BOOL)isSupervised
{
  return self->_supervised;
}

- (unint64_t)obsoleteNetworkCipherType
{
  return self->_obsoleteNetworkCipherType;
}

- (void)setScanResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)instantHotspot
{
  return self->_instantHotspot;
}

- (void)setInstantHotspot:(BOOL)a3
{
  self->_instantHotspot = a3;
}

- (BOOL)isHotspot20Provisioned
{
  return self->_hotspot20Provisioned;
}

- (void)setHotspot20Provisioned:(BOOL)a3
{
  self->_hotspot20Provisioned = a3;
}

- (BOOL)isKnown
{
  return self->_known;
}

- (void)setKnown:(BOOL)a3
{
  self->_known = a3;
}

- (NSString)crowdsourceDescription
{
  return self->_crowdsourceDescription;
}

- (void)setCrowdsourceDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)isPopular
{
  return self->_popular;
}

- (void)setPopular:(BOOL)a3
{
  self->_popular = a3;
}

- (BOOL)isCloudSyncable
{
  return !-[WFNetworkScanRecord isEnterprise](self, "isEnterprise")
      && !-[WFNetworkScanRecord isAdhoc](self, "isAdhoc")
      && -[WFNetworkScanRecord isSecure](self, "isSecure");
}

- (id)configurationIssues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkScanRecord securityIssue](self, "securityIssue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFNetworkScanRecord securityIssue](self, "securityIssue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (-[WFNetworkScanRecord isAmbiguousSSID](self, "isAmbiguousSSID"))
  {
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  if (-[WFNetworkScanRecord phyMode](self, "phyMode") == 4)
  {
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (id)securityIssue
{
  uint64_t v3;
  void *v4;

  if (-[WFNetworkScanRecord securityMode](self, "securityMode")
    && -[WFNetworkScanRecord securityMode](self, "securityMode") != 2048)
  {
    if (-[WFNetworkScanRecord securityMode](self, "securityMode") == 1
      || -[WFNetworkScanRecord obsoleteNetworkCipherType](self, "obsoleteNetworkCipherType") == 1)
    {
      v3 = 2;
    }
    else if (-[WFNetworkScanRecord securityMode](self, "securityMode") == 4)
    {
      v3 = 4;
    }
    else
    {
      if (-[WFNetworkScanRecord obsoleteNetworkCipherType](self, "obsoleteNetworkCipherType") != 2)
      {
        v4 = 0;
        return v4;
      }
      v3 = 4096;
    }
  }
  else
  {
    v3 = 8;
  }
  objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (BOOL)supportsWiFiHealth
{
  if (-[WFNetworkScanRecord carPlayType](self, "carPlayType") == 1)
    return 0;
  else
    return !-[WFNetworkScanRecord iOSHotspot](self, "iOSHotspot");
}

- (BOOL)supportsJoinFailureDiagnostics
{
  if (-[WFNetworkScanRecord isHotspot20](self, "isHotspot20")
    || -[WFNetworkScanRecord isEnterprise](self, "isEnterprise"))
  {
    return 0;
  }
  else
  {
    return !-[WFNetworkScanRecord isCarPlay](self, "isCarPlay");
  }
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayFriendlyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayFriendlyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (!-[WFNetworkScanRecord isUnconfiguredAccessory](self, "isUnconfiguredAccessory")
         || (-[WFNetworkScanRecord unconfiguredDeviceName](self, "unconfiguredDeviceName"),
             (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[WFNetworkScanRecord ssid](self, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)isInstantHotspot
{
  return 0;
}

- (id)hotspotBatteryLife
{
  return 0;
}

- (id)hotspotSignalStrength
{
  return 0;
}

- (id)hotspotCellularProtocol
{
  return 0;
}

- (id)subtitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedOperatorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayedOperatorName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    -[WFNetworkScanRecord hotspot20Name](self, "hotspot20Name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[WFNetworkScanRecord hotspot20Name](self, "hotspot20Name");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFNetworkScanRecord hotspotPluginLabel](self, "hotspotPluginLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v8 = 0;
        return v8;
      }
      -[WFNetworkScanRecord hotspotPluginLabel](self, "hotspotPluginLabel");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v10;
  }
  return v8;
}

- (BOOL)canBeDisplayedAsCurrent
{
  return -[WFNetworkScanRecord carPlayType](self, "carPlayType") != 1;
}

- (unint64_t)signalBars
{
  -[WFNetworkScanRecord scaledRSSI](self, "scaledRSSI");
  return WFSignalBarsFromScaledRSSI();
}

- (BOOL)isEquivalentRecord:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[WFNetworkScanRecord ssid](self, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
      v8 = -[WFNetworkScanRecord isNetworkSecurityModeMatch:](self, "isNetworkSecurityModeMatch:", objc_msgSend(v5, "securityModeExt"));
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)lastJoinedDate
{
  return 0;
}

- (BOOL)shouldShowInMyNetworkList
{
  void *v3;
  void *v4;
  char v5;

  -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldShowInMyNetworkList");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowInKnownNetworkList
{
  void *v3;
  void *v4;
  char v5;

  -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFNetworkScanRecord matchingKnownNetworkProfile](self, "matchingKnownNetworkProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldShowInKnownNetworkList");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
