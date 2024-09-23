@implementation WFNetworkProfile

- (id)networkAttributes
{
  WFNetworkProfile *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
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
  id v26;
  const char *v27;
  ether_addr *v28;
  CFDataRef v29;
  uint64_t v30;
  void *v31;

  v2 = self;
  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[WFNetworkProfile scanAttributes](v2, "scanAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  -[WFNetworkProfile enterpriseProfile](v2, "enterpriseProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFNetworkProfile enterpriseProfile](v2, "enterpriseProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x24BE67DF8]);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WFNetworkProfile isHidden](v2, "isHidden"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("HIDDEN_NETWORK"));

  v9 = -[WFNetworkProfile isCaptive](v2, "isCaptive");
  v10 = MEMORY[0x24BDBD1C8];
  v11 = MEMORY[0x24BDBD1C0];
  if (v9)
  {
    if (-[WFNetworkProfile isAutoLoginEnabled](v2, "isAutoLoginEnabled"))
      v12 = v11;
    else
      v12 = v10;
    objc_msgSend(v5, "setObject:forKey:", v12, *MEMORY[0x24BE14B10]);
  }
  if (-[WFNetworkProfile isInSaveDataMode](v2, "isInSaveDataMode"))
    v13 = 1;
  else
    v13 = 2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v14, *MEMORY[0x24BE67E30]);

  if (-[WFNetworkProfile isPrivacyProxyEnabled](v2, "isPrivacyProxyEnabled"))
    v15 = v10;
  else
    v15 = v11;
  objc_msgSend(v5, "setObject:forKey:", v15, *MEMORY[0x24BE67E28]);
  -[WFNetworkProfile networkQualityDate](v2, "networkQualityDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[WFNetworkProfile networkQualityDate](v2, "networkQualityDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v17, *MEMORY[0x24BE67E08]);

    v18 = (void *)MEMORY[0x24BDD16E0];
    -[WFNetworkProfile networkQualityResponsiveness](v2, "networkQualityResponsiveness");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v19, *MEMORY[0x24BE67E10]);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFNetworkProfile lastAssociationDate](v2, "lastAssociationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("lastJoined"));

  }
  -[WFNetworkProfile originatorBundleIdentifier](v2, "originatorBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[WFNetworkProfile originatorBundleIdentifier](v2, "originatorBundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v22, *MEMORY[0x24BE67DE8]);

  }
  -[WFNetworkProfile hotspotDeviceIdentifier](v2, "hotspotDeviceIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[WFNetworkProfile hotspotDeviceIdentifier](v2, "hotspotDeviceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("HotspotDeviceIdentifier"));

  }
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("enabled"));
  objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x24BE67DF0]);
  v25 = (void *)objc_opt_new();
  -[WFNetworkProfile randomMACAddress](v2, "randomMACAddress");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = (const char *)objc_msgSend(v26, "UTF8String");

  if (v27)
  {
    v28 = ether_aton(v27);
    v29 = CFDataCreate(0, v28->octet, 6);
    objc_msgSend(v25, "setObject:forKey:", v29, CFSTR("PRIVATE_MAC_ADDRESS_VALUE"));

  }
  if (-[WFNetworkProfile isRandomMACAddressEnabled](v2, "isRandomMACAddressEnabled"))
    v30 = 2;
  else
    v30 = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v31, CFSTR("PRIVATE_MAC_ADDRESS_TYPE"));

  objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("PRIVATE_MAC_ADDRESS"));
  return v5;
}

- (WFNetworkProfile)initWithNetworkRef:(__WiFiNetwork *)a3
{
  WFNetworkProfile *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *hotspotDeviceIdentifier;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *bssid;
  uint64_t v16;
  NSDictionary *enterpriseProfile;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *certificateChain;
  uint64_t v23;
  NSString *username;
  const __CFBoolean *Property;
  const __CFBoolean *v26;
  CFTypeID v27;
  int IsHotspot20;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *HS20OperatorName;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  os_log_type_t v36;
  NSString *ssid;
  int IsCarPlay;
  int Type;
  uint64_t v40;
  uint64_t v41;
  NSString *carPlayUUID;
  uint64_t v43;
  NSString *policyUUID;
  const __CFBoolean *v45;
  const __CFBoolean *v46;
  CFTypeID v47;
  int Value;
  NSObject *v49;
  os_log_type_t v50;
  double v51;
  uint64_t v52;
  NSDate *networkQualityDate;
  uint64_t v54;
  NSString *originatorBundleIdentifier;
  uint64_t v56;
  NSString *originatorName;
  uint64_t v58;
  NSString *HS20AccountName;
  uint64_t v60;
  NSString *HS20Badge;
  int v62;
  uint64_t v63;
  int Originator;
  uint64_t v65;
  void *v66;
  void *v67;
  const __CFData *v68;
  uint64_t v69;
  NSString *randomMACAddress;
  void *v71;
  NSObject *v72;
  os_log_type_t v73;
  NSString *v74;
  _BOOL4 randomMACAddressEnabled;
  const __CFBoolean *v76;
  const __CFBoolean *v77;
  CFTypeID v78;
  WFNetworkProfile *v79;
  NSObject *v81;
  uint64_t v82;
  os_log_type_t v83;
  objc_super v84;
  uint8_t buf[4];
  __WiFiNetwork *v86;
  __int16 v87;
  NSString *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v84.receiver = self;
  v84.super_class = (Class)WFNetworkProfile;
  v4 = -[WFNetworkProfile init](&v84, sel_init);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_77;
  }
  if (!a3)
  {
    WFLogForCategory(0);
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = OSLogForWFLogLevel(1uLL);
    v7 = 0;
    if (WFCurrentLogLevel() && v81)
    {
      if (os_log_type_enabled(v81, (os_log_type_t)v82))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v81, (os_log_type_t)v82, "nil networkRef for network profile", buf, 2u);
      }
      v7 = 0;
    }
LABEL_76:

    goto LABEL_77;
  }
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = (void *)WiFiNetworkCopyRecord();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_77:
    v8 = 0;
    goto LABEL_78;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("SSID_STR"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("HotspotDeviceIdentifier"));
  v9 = objc_claimAutoreleasedReturnValue();
  hotspotDeviceIdentifier = v4->_hotspotDeviceIdentifier;
  v4->_hotspotDeviceIdentifier = (NSString *)v9;

  if (!v8 || !objc_msgSend(v8, "length"))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("SSID"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_78:

      v19 = 0;
      v34 = 0;
      v67 = 0;
      v4 = 0;
      goto LABEL_62;
    }
    v12 = (void *)v11;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);

    v8 = (void *)v13;
    if (v13)
      goto LABEL_8;
    WFLogForCategory(0);
    v81 = objc_claimAutoreleasedReturnValue();
    v83 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v81 && os_log_type_enabled(v81, v83))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v81, v83, "Missing ssid for network profile", buf, 2u);
    }
    goto LABEL_76;
  }
LABEL_8:
  objc_storeStrong((id *)&v4->_ssid, v8);
  WiFiNetworkGetProperty();
  v14 = objc_claimAutoreleasedReturnValue();
  bssid = v4->_bssid;
  v4->_bssid = (NSString *)v14;

  v4->_securityMode = WFSecurityModeFromScanDictionary(v7, &v4->_securityModeExt);
  WiFiNetworkGetProperty();
  v16 = objc_claimAutoreleasedReturnValue();
  enterpriseProfile = v4->_enterpriseProfile;
  v4->_enterpriseProfile = (NSDictionary *)v16;

  -[NSDictionary objectForKey:](v4->_enterpriseProfile, "objectForKey:", CFSTR("EAPClientConfiguration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "objectForKey:", CFSTR("TLSUserTrustProceedCertificateChain"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v19, "objectForKey:", CFSTR("TLSUserTrustProceedCertificateChain"));
      v21 = objc_claimAutoreleasedReturnValue();
      certificateChain = v4->_certificateChain;
      v4->_certificateChain = (NSArray *)v21;

    }
  }
  v4->_hidden = WiFiNetworkGetDirectedState() != 0;
  objc_storeStrong((id *)&v4->_scanAttributes, v7);
  WFUserNameFromEnterpriseProfile(v4->_enterpriseProfile);
  v23 = objc_claimAutoreleasedReturnValue();
  username = v4->_username;
  v4->_username = (NSString *)v23;

  if (WiFiNetworkGetProperty())
    v4->_managed = 1;
  Property = (const __CFBoolean *)WiFiNetworkGetProperty();
  if (Property)
  {
    v26 = Property;
    v27 = CFGetTypeID(Property);
    if (v27 == CFBooleanGetTypeID())
      v4->_captive = CFBooleanGetValue(v26) != 0;
  }
  v4->_adhoc = WiFiNetworkIsAdHoc() != 0;
  IsHotspot20 = WiFiNetworkIsHotspot20();
  if (IsHotspot20)
  {
    v4->_HS20NetworkProvisioned = WiFiNetworkIsProvisionedHS20Network() != 0;
    WiFiNetworkGetProperty();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = objc_msgSend(v29, "copy");
      HS20OperatorName = v4->_HS20OperatorName;
      v4->_HS20OperatorName = (NSString *)v31;

    }
  }
  v4->_HS20Network = IsHotspot20 != 0;
  v4->_autoJoinEnabled = WiFiNetworkIsEnabled() != 0;
  WiFiNetworkGetProperty();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (!v4->_autoJoinEnabled && v33)
  {
    WFLogForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v35 && os_log_type_enabled(v35, v36))
    {
      ssid = v4->_ssid;
      *(_DWORD *)buf = 136315650;
      v86 = (__WiFiNetwork *)"-[WFNetworkProfile initWithNetworkRef:]";
      v87 = 2112;
      v88 = ssid;
      v89 = 2112;
      v90 = v34;
      _os_log_impl(&dword_219FC8000, v35, v36, "%s: %@ autojoin temporarily disabled until %@, overriding UI switch to show enabled", buf, 0x20u);
    }

    v4->_autoJoinEnabled = 1;
  }
  IsCarPlay = WiFiNetworkIsCarPlay();
  v4->_carPlay = IsCarPlay != 0;
  if (IsCarPlay)
  {
    Type = WiFiNetworkGetType();
    v40 = 1;
    if (Type != 1)
      v40 = 2;
    v4->_carPlayType = v40;
  }
  WiFiNetworkGetProperty();
  v41 = objc_claimAutoreleasedReturnValue();
  carPlayUUID = v4->_carPlayUUID;
  v4->_carPlayUUID = (NSString *)v41;

  WiFiNetworkGetProperty();
  v43 = objc_claimAutoreleasedReturnValue();
  policyUUID = v4->_policyUUID;
  v4->_policyUUID = (NSString *)v43;

  v45 = (const __CFBoolean *)WiFiNetworkGetProperty();
  if (v45 && (v46 = v45, v47 = CFGetTypeID(v45), v47 == CFBooleanGetTypeID()))
  {
    Value = CFBooleanGetValue(v46);
    v4->_autoLoginEnabled = Value == 0;
    if (Value)
    {
      WFLogForCategory(0);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v49 && os_log_type_enabled(v49, v50))
      {
        *(_DWORD *)buf = 138412290;
        v86 = a3;
        _os_log_impl(&dword_219FC8000, v49, v50, "Autologin disabled due to captive bypass for network %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v4->_autoLoginEnabled = 1;
  }
  v4->_isInSaveDataMode = WiFiNetworkIsInSaveDataMode() != 0;
  v4->_isPrivacyProxyEnabled = WiFiNetworkGetPrivacyProxyEnabled() != 0;
  WiFiNetworkGetNetworkQualityResponsiveness();
  v4->_networkQualityResponsiveness = v51;
  WiFiNetworkGetNetworkQualityDate();
  v52 = objc_claimAutoreleasedReturnValue();
  networkQualityDate = v4->_networkQualityDate;
  v4->_networkQualityDate = (NSDate *)v52;

  v4->_carrierBased = WiFiNetworkIsCarrierBundleBased() != 0;
  v4->_lastAutoJoinDate = (NSDate *)WiFiNetworkGetAssociationDate();
  v4->_addedDate = (NSDate *)WiFiNetworkGetAssociationDate();
  WiFiNetworkGetBundleIdentifier();
  v54 = objc_claimAutoreleasedReturnValue();
  originatorBundleIdentifier = v4->_originatorBundleIdentifier;
  v4->_originatorBundleIdentifier = (NSString *)v54;

  WiFiNetworkGetProperty();
  v56 = objc_claimAutoreleasedReturnValue();
  originatorName = v4->_originatorName;
  v4->_originatorName = (NSString *)v56;

  WiFiNetworkGetProperty();
  v58 = objc_claimAutoreleasedReturnValue();
  HS20AccountName = v4->_HS20AccountName;
  v4->_HS20AccountName = (NSString *)v58;

  WiFiNetworkGetHS2NetworkBadge();
  v60 = objc_claimAutoreleasedReturnValue();
  HS20Badge = v4->_HS20Badge;
  v4->_HS20Badge = (NSString *)v60;

  v4->_canExposeIMSI = WiFiNetworkCanExposeIMSI() != 0;
  v4->_requiresPassword = WiFiNetworkRequiresPassword() != 0;
  v4->_personalHotspot = WiFiNetworkIsApplePersonalHotspot() != 0;
  v62 = objc_msgSend((id)WiFiNetworkGetProperty(), "intValue");
  if (v62 == 17)
  {
    v63 = 21;
  }
  else
  {
    if (v62 != 11)
      goto LABEL_45;
    v63 = 22;
  }
  *((_BYTE *)&v4->super.isa + v63) = 1;
LABEL_45:
  Originator = WiFiNetworkGetOriginator();
  if (v4->_carrierBased)
  {
    v65 = 2;
  }
  else if (v4->_managed)
  {
    v65 = 3;
  }
  else
  {
    if (Originator)
    {
      v4->_originator = 0;
      goto LABEL_50;
    }
    v65 = 1;
  }
  v4->_originator = v65;
LABEL_50:
  objc_msgSend(v7, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v66)
  {
    v68 = (const __CFData *)objc_msgSend(v66, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_VALUE"));
    if (v68)
    {
      WFConvertEthernetNetworkAddressToString(v68);
      v69 = objc_claimAutoreleasedReturnValue();
      randomMACAddress = v4->_randomMACAddress;
      v4->_randomMACAddress = (NSString *)v69;

    }
    objc_msgSend(v67, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_TYPE"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_randomMACAddressEnabled = (objc_msgSend(v71, "intValue") & 0xFFFFFFFE) == 2;
    WFLogForCategory(0);
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v72 && os_log_type_enabled(v72, v73))
    {
      v74 = v4->_ssid;
      randomMACAddressEnabled = v4->_randomMACAddressEnabled;
      *(_DWORD *)buf = 136315650;
      v86 = (__WiFiNetwork *)"-[WFNetworkProfile initWithNetworkRef:]";
      v87 = 2112;
      v88 = v74;
      v89 = 1024;
      LODWORD(v90) = randomMACAddressEnabled;
      _os_log_impl(&dword_219FC8000, v72, v73, "%s: %@ _randomMACAddressEnabled: %d", buf, 0x1Cu);
    }

  }
  else
  {
    v4->_randomMACAddressEnabled = 1;
  }
  v76 = (const __CFBoolean *)WiFiNetworkGetProperty();
  if (v76)
  {
    v77 = v76;
    v78 = CFGetTypeID(v76);
    if (v78 == CFBooleanGetTypeID())
      v4->_DNSHeuristicsFiltered = CFBooleanGetValue(v77) != 0;
  }
LABEL_62:
  v79 = v4;

  return v79;
}

- (WFNetworkProfile)initWithNetwork:(id)a3
{
  id v4;
  void *v5;
  const void *v6;

  v4 = a3;
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "attributes");
  v6 = (const void *)WiFiNetworkCreate();
  self = -[WFNetworkProfile initWithNetworkRef:](self, "initWithNetworkRef:", v6);
  if (v6)
    CFRelease(v6);
  if (!self)
  {
LABEL_5:

    self = 0;
  }

  return self;
}

- (WFNetworkProfile)initWithCoreWiFiProfile:(id)a3
{
  return -[WFNetworkProfile initWithNetworkRef:](self, "initWithNetworkRef:", (id)WiFiNetworkCreateFromCoreWiFiNetworkProfile());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  WFMutableNetworkProfile *v5;
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
  void *v30;
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

  v5 = objc_alloc_init(WFMutableNetworkProfile);
  -[WFNetworkProfile ssid](self, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setSsid:](v5, "setSsid:", v7);

  -[WFNetworkProfile bssid](self, "bssid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setBssid:](v5, "setBssid:", v9);

  -[WFNetworkProfile username](self, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setUsername:](v5, "setUsername:", v11);

  -[WFNetworkProfile password](self, "password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setPassword:](v5, "setPassword:", v13);

  -[WFMutableNetworkProfile setSecurityMode:](v5, "setSecurityMode:", -[WFNetworkProfile securityMode](self, "securityMode"));
  -[WFMutableNetworkProfile setSecurityModeExt:](v5, "setSecurityModeExt:", -[WFNetworkProfile securityModeExt](self, "securityModeExt"));
  -[WFNetworkProfile enterpriseProfile](self, "enterpriseProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setEnterpriseProfile:](v5, "setEnterpriseProfile:", v15);

  -[WFNetworkProfile certificateChain](self, "certificateChain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setCertificateChain:](v5, "setCertificateChain:", v17);

  -[WFNetworkProfile scanAttributes](self, "scanAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setScanAttributes:](v5, "setScanAttributes:", v19);

  -[WFNetworkProfile enterpriseProfile](self, "enterpriseProfile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setEnterpriseProfile:](v5, "setEnterpriseProfile:", v21);

  -[WFNetworkProfile enterpriseProfile](self, "enterpriseProfile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  WFUserNameFromEnterpriseProfile(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMutableNetworkProfile setUsername:](v5, "setUsername:", v23);

  -[WFMutableNetworkProfile username](v5, "username");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    -[WFNetworkProfile username](self, "username");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copyWithZone:", a3);
    -[WFMutableNetworkProfile setUsername:](v5, "setUsername:", v26);

  }
  -[WFNetworkProfile password](self, "password");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setPassword:](v5, "setPassword:", v28);

  -[WFMutableNetworkProfile setManaged:](v5, "setManaged:", -[WFNetworkProfile isManaged](self, "isManaged"));
  -[WFMutableNetworkProfile setCaptive:](v5, "setCaptive:", -[WFNetworkProfile isCaptive](self, "isCaptive"));
  -[WFNetworkProfile setAdhoc:](v5, "setAdhoc:", -[WFNetworkProfile isAdhoc](self, "isAdhoc"));
  -[WFMutableNetworkProfile setAutoJoinEnabled:](v5, "setAutoJoinEnabled:", -[WFNetworkProfile isAutoJoinEnabled](self, "isAutoJoinEnabled"));
  -[WFMutableNetworkProfile setAutoLoginEnabled:](v5, "setAutoLoginEnabled:", -[WFNetworkProfile isAutoLoginEnabled](self, "isAutoLoginEnabled"));
  -[WFMutableNetworkProfile setIsInSaveDataMode:](v5, "setIsInSaveDataMode:", -[WFNetworkProfile isInSaveDataMode](self, "isInSaveDataMode"));
  -[WFMutableNetworkProfile setIsPrivacyProxyEnabled:](v5, "setIsPrivacyProxyEnabled:", -[WFNetworkProfile isPrivacyProxyEnabled](self, "isPrivacyProxyEnabled"));
  -[WFNetworkProfile networkQualityResponsiveness](self, "networkQualityResponsiveness");
  -[WFMutableNetworkProfile setNetworkQualityResponsiveness:](v5, "setNetworkQualityResponsiveness:");
  -[WFNetworkProfile networkQualityDate](self, "networkQualityDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setNetworkQualityDate:](v5, "setNetworkQualityDate:", v30);

  -[WFMutableNetworkProfile setHidden:](v5, "setHidden:", -[WFNetworkProfile isHidden](self, "isHidden"));
  -[WFNetworkProfile policyUUID](self, "policyUUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkProfile setPolicyUUID:](v5, "setPolicyUUID:", v31);

  -[WFNetworkProfile carPlayUUID](self, "carPlayUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkProfile setCarPlayUUID:](v5, "setCarPlayUUID:", v32);

  -[WFNetworkProfile setCarPlay:](v5, "setCarPlay:", -[WFNetworkProfile isCarPlay](self, "isCarPlay"));
  -[WFNetworkProfile setCarPlayType:](v5, "setCarPlayType:", -[WFNetworkProfile carPlayType](self, "carPlayType"));
  -[WFMutableNetworkProfile setTLSIdentity:](v5, "setTLSIdentity:", -[WFNetworkProfile TLSIdentity](self, "TLSIdentity"));
  -[WFNetworkProfile policyUUID](self, "policyUUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkProfile setPolicyUUID:](v5, "setPolicyUUID:", v33);

  -[WFNetworkProfile originatorBundleIdentifier](self, "originatorBundleIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMutableNetworkProfile setOriginatorBundleIdentifier:](v5, "setOriginatorBundleIdentifier:", v34);

  -[WFNetworkProfile originatorName](self, "originatorName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMutableNetworkProfile setOriginatorName:](v5, "setOriginatorName:", v35);

  -[WFMutableNetworkProfile setHS20Network:](v5, "setHS20Network:", -[WFNetworkProfile isHS20Network](self, "isHS20Network"));
  -[WFMutableNetworkProfile setHS20NetworkProvisioned:](v5, "setHS20NetworkProvisioned:", -[WFNetworkProfile isHS20NetworkProvisioned](self, "isHS20NetworkProvisioned"));
  -[WFNetworkProfile setCarrierBased:](v5, "setCarrierBased:", -[WFNetworkProfile isCarrierBased](self, "isCarrierBased"));
  -[WFNetworkProfile setProfileBased:](v5, "setProfileBased:", -[WFNetworkProfile isProfileBased](self, "isProfileBased"));
  -[WFMutableNetworkProfile setAddedFromWiFiPasswordSharing:](v5, "setAddedFromWiFiPasswordSharing:", -[WFNetworkProfile wasAddedFromWiFiPasswordSharing](self, "wasAddedFromWiFiPasswordSharing"));
  -[WFNetworkProfile HS20AccountName](self, "HS20AccountName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copyWithZone:", a3);
  -[WFNetworkProfile setHS20AccountName:](v5, "setHS20AccountName:", v37);

  -[WFNetworkProfile HS20Badge](self, "HS20Badge");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "copyWithZone:", a3);
  -[WFNetworkProfile setHS20Badge:](v5, "setHS20Badge:", v39);

  -[WFNetworkProfile setCanExposeIMSI:](v5, "setCanExposeIMSI:", -[WFNetworkProfile canExposeIMSI](self, "canExposeIMSI"));
  -[WFNetworkProfile setRequiresPassword:](v5, "setRequiresPassword:", -[WFNetworkProfile requiresPassword](self, "requiresPassword"));
  -[WFNetworkProfile setFetchedPassword:](v5, "setFetchedPassword:", 0);
  -[WFMutableNetworkProfile setUserProvidedPassword:](v5, "setUserProvidedPassword:", -[WFNetworkProfile userProvidedPassword](self, "userProvidedPassword"));
  -[WFNetworkProfile setPersonalHotspot:](v5, "setPersonalHotspot:", -[WFNetworkProfile isPersonalHotspot](self, "isPersonalHotspot"));
  -[WFMutableNetworkProfile setInstantHotspotJoin:](v5, "setInstantHotspotJoin:", -[WFNetworkProfile isInstantHotspotJoin](self, "isInstantHotspotJoin"));
  -[WFNetworkProfile hotspotDeviceIdentifier](self, "hotspotDeviceIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMutableNetworkProfile setHotspotDeviceIdentifier:](v5, "setHotspotDeviceIdentifier:", v40);

  -[WFMutableNetworkProfile setRandomMACAddressEnabled:](v5, "setRandomMACAddressEnabled:", -[WFNetworkProfile isRandomMACAddressEnabled](self, "isRandomMACAddressEnabled"));
  -[WFNetworkProfile randomMACAddress](self, "randomMACAddress");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copyWithZone:", a3);
  -[WFMutableNetworkProfile setRandomMACAddress:](v5, "setRandomMACAddress:", v42);

  -[WFNetworkProfile setDNSHeuristicsFiltered:](v5, "setDNSHeuristicsFiltered:", -[WFNetworkProfile isDNSHeuristicsFiltered](self, "isDNSHeuristicsFiltered"));
  -[WFNetworkProfile HS20OperatorName](self, "HS20OperatorName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copyWithZone:", a3);
  -[WFNetworkProfile setHS20OperatorName:](v5, "setHS20OperatorName:", v44);

  return v5;
}

- (void)dealloc
{
  __SecIdentity *TLSIdentity;
  objc_super v4;

  TLSIdentity = self->_TLSIdentity;
  if (TLSIdentity)
  {
    CFRelease(TLSIdentity);
    self->_TLSIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFNetworkProfile;
  -[WFNetworkProfile dealloc](&v4, sel_dealloc);
}

- (BOOL)requiresUsernameAndPassword
{
  _BOOL4 v3;

  v3 = -[WFNetworkProfile isEnterprise](self, "isEnterprise");
  if (v3)
    LOBYTE(v3) = !-[WFNetworkProfile requiresTLSIdentityOnly](self, "requiresTLSIdentityOnly");
  return v3;
}

- (BOOL)TLSProfileCanJoin
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[WFNetworkProfile requiresTLSIdentityOnly](self, "requiresTLSIdentityOnly"))
    return 0;
  if (-[WFNetworkProfile TLSIdentity](self, "TLSIdentity"))
    return 1;
  -[WFNetworkProfile enterpriseProfile](self, "enterpriseProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("EAPClientConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("TLSIdentityHandle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6 != 0;

  return v3;
}

- (__SecIdentity)TLSIdentity
{
  __SecIdentity *TLSIdentity;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int SecIdentity;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  WFNetworkProfile *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  TLSIdentity = self->_TLSIdentity;
  if (TLSIdentity)
  {
    v7 = 0;
    v5 = 0;
  }
  else
  {
    -[WFNetworkProfile enterpriseProfile](self, "enterpriseProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("EAPClientConfiguration"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "objectForKey:", CFSTR("TLSIdentityHandle")))
      {
        SecIdentity = EAPSecIdentityHandleCreateSecIdentity();
        WFLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
        {
          *(_DWORD *)buf = 136315650;
          v13 = "-[WFNetworkProfile TLSIdentity]";
          v14 = 1024;
          v15 = SecIdentity;
          v16 = 2112;
          v17 = self;
          _os_log_impl(&dword_219FC8000, v10, v11, "%s: failed to create TLS identity (err %d) %@", buf, 0x1Cu);
        }

        TLSIdentity = 0;
      }
      else
      {
        TLSIdentity = 0;
      }
    }
    else
    {
      TLSIdentity = 0;
      v7 = 0;
    }
  }

  return TLSIdentity;
}

- (BOOL)requiresTLSIdentityOnly
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[WFNetworkProfile enterpriseProfile](self, "enterpriseProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("EAPClientConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("AcceptEAPTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (NSDictionary)enterpriseProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFNetworkProfile isEnterprise](self, "isEnterprise")
    || -[WFNetworkProfile isHS20Network](self, "isHS20Network"))
  {
    if (self->_enterpriseProfile)
      objc_msgSend(v3, "addEntriesFromDictionary:");
    objc_msgSend(v3, "objectForKey:", CFSTR("EAPClientConfiguration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "addEntriesFromDictionary:", v4);
    objc_msgSend(v6, "objectForKey:", CFSTR("AcceptEAPTypes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (self->_TLSIdentity)
        v8 = &unk_24DC5DBB8;
      else
        v8 = &unk_24DC5DBD0;
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("AcceptEAPTypes"));
    }
    -[WFNetworkProfile username](self, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[WFNetworkProfile username](self, "username");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("UserName"));

    }
    -[WFNetworkProfile password](self, "password");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      -[WFNetworkProfile password](self, "password");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("UserPassword"));

    }
    -[WFNetworkProfile certificateChain](self, "certificateChain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[WFNetworkProfile certificateChain](self, "certificateChain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v16, CFSTR("TLSUserTrustProceedCertificateChain"));

      objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("TLSSaveTrustExceptions"));
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("EAPClientConfiguration"));
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("EnableUserInterface"));
    v17 = v3;

  }
  else
  {
    v17 = 0;
  }

  return (NSDictionary *)v17;
}

- (BOOL)isEnterprise
{
  NSDictionary *v3;
  int v4;
  char v5;
  BOOL v6;

  v3 = self->_enterpriseProfile;
  if (-[WFNetworkProfile isHS20Network](self, "isHS20Network"))
    v4 = !-[WFNetworkProfile isHS20NetworkProvisioned](self, "isHS20NetworkProvisioned");
  else
    LOBYTE(v4) = 0;
  if (-[WFNetworkProfile isHS20Network](self, "isHS20Network")
    && -[WFNetworkProfile isHS20NetworkProvisioned](self, "isHS20NetworkProvisioned"))
  {
    v5 = 0;
  }
  else
  {
    if (v3)
      v6 = -[WFNetworkProfile profileContainsCarrierEAPType:](self, "profileContainsCarrierEAPType:", v3);
    else
      v6 = 0;
    if ((WFSecurityModeIsEnterprise(-[WFNetworkProfile securityMode](self, "securityMode")) & 1) != 0)
      v5 = 1;
    else
      v5 = v6 | v4;
  }

  return v5;
}

- (BOOL)profileContainsEAPSIM:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("EAPClientConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("AcceptEAPTypes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)profileContainsEAPAKA:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("EAPClientConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("AcceptEAPTypes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 23);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)profileContainsCarrierEAPType:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (v4)
    v5 = -[WFNetworkProfile profileContainsEAPSIM:](self, "profileContainsEAPSIM:", v4)
      || -[WFNetworkProfile profileContainsEAPAKA:](self, "profileContainsEAPAKA:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)canAttemptJoin
{
  int64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int v14;
  int v15;
  NSObject *v16;
  os_log_type_t v17;
  char v18;
  int v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = -[WFNetworkProfile securityMode](self, "securityMode");
  -[WFNetworkProfile enterpriseProfile](self, "enterpriseProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkProfile password](self, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WFValidPasswordForSecurityMode(v3, v5);

  v7 = WFSecurityModeRequiresPasswordOnly(v3);
  v8 = -[WFNetworkProfile requiresUsernameAndPassword](self, "requiresUsernameAndPassword");
  if (-[WFNetworkProfile requiresTLSIdentityOnly](self, "requiresTLSIdentityOnly"))
  {
    if (-[WFNetworkProfile TLSIdentity](self, "TLSIdentity"))
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("EAPClientConfiguration"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("TLSIdentityHandle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11 != 0;

    }
  }
  else
  {
    v9 = 0;
  }
  v12 = -[WFNetworkProfile profileContainsCarrierEAPType:](self, "profileContainsCarrierEAPType:", v4);
  if (-[WFNetworkProfile isHS20Network](self, "isHS20Network"))
    v13 = -[WFNetworkProfile isHS20NetworkProvisioned](self, "isHS20NetworkProvisioned");
  else
    v13 = 0;
  v14 = v7 & v6;
  v15 = v8 & v6;
  WFLogForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v16 && os_log_type_enabled(v16, v17))
  {
    v20 = 136316418;
    v21 = "-[WFNetworkProfile canAttemptJoin]";
    v22 = 1024;
    v23 = v9;
    v24 = 1024;
    v25 = v15;
    v26 = 1024;
    v27 = v14;
    v28 = 1024;
    v29 = v12;
    v30 = 1024;
    v31 = v13;
    _os_log_impl(&dword_219FC8000, v16, v17, "%s: tlsProfileCanJoin %d, automaticProfileCanJoin %d, passwordOnlyCanJoin %d, isEAPSimOrAKA %d, isHS20Provisioned %d", (uint8_t *)&v20, 0x2Au);
  }
  if (v3)
    v18 = v14;
  else
    v18 = 1;

  return v18 | v15 | v9 | (v12 || v13);
}

- (BOOL)userProvidedPassword
{
  return 0;
}

- (NSString)password
{
  NSString **p_password;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  const void *v10;
  NSString *v11;
  NSString *password;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (self->_fetchedPassword)
    goto LABEL_25;
  if (!self->_requiresPassword)
  {
LABEL_24:
    self->_fetchedPassword = 1;
LABEL_25:
    p_password = &self->_password;
    return *p_password;
  }
  if (!-[WFNetworkProfile userProvidedPassword](self, "userProvidedPassword")
    || (p_password = &self->_password, !self->_password))
  {
    WFLogForCategory(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        -[WFNetworkProfile ssid](self, "ssid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 136315394;
        v19 = "-[WFNetworkProfile password]";
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_219FC8000, v8, v7, "%s: fetching password from keychain for %@", (uint8_t *)&v18, 0x16u);

      }
    }

    -[WFNetworkProfile scanAttributes](self, "scanAttributes");
    v10 = (const void *)WiFiNetworkCreate();
    v11 = (NSString *)WiFiNetworkCopyPassword();
    password = self->_password;
    self->_password = v11;

    if (!self->_password)
    {
      WFLogForCategory(0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13)
      {
        v15 = v13;
        if (os_log_type_enabled(v15, v14))
        {
          -[WFNetworkProfile ssid](self, "ssid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 136315394;
          v19 = "-[WFNetworkProfile password]";
          v20 = 2114;
          v21 = v16;
          _os_log_impl(&dword_219FC8000, v15, v14, "%s: password is nil for %{public}@", (uint8_t *)&v18, 0x16u);

        }
      }

    }
    if (v10)
      CFRelease(v10);
    goto LABEL_24;
  }
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v18 = 136315138;
    v19 = "-[WFNetworkProfile password]";
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: user provided password marking password as fetched", (uint8_t *)&v18, 0xCu);
  }

  self->_fetchedPassword = 1;
  return *p_password;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkProfile ssid](self, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkProfile bssid](self, "bssid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WFStringFromWFSecurityMode(-[WFNetworkProfile securityMode](self, "securityMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFStringFromWFSecurityModeExt(-[WFNetworkProfile securityModeExt](self, "securityModeExt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p SSID:%@ BSSID:%@ security:%@ securityExt %@"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFNetworkProfile requiresPassword](self, "requiresPassword"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR(" pwd:("));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("fetched=%d"), -[WFNetworkProfile fetchedPassword](self, "fetchedPassword"));
    if (-[WFNetworkProfile fetchedPassword](self, "fetchedPassword"))
    {
      -[WFNetworkProfile password](self, "password");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendFormat:", CFSTR(",valid=%d"), v12 != 0);

    }
    if (-[WFNetworkProfile userProvidedPassword](self, "userProvidedPassword"))
      objc_msgSend(v11, "appendFormat:", CFSTR(",userProvided=1"));
    objc_msgSend(v11, "appendString:", CFSTR(")"));
    objc_msgSend(v10, "appendString:", v11);

  }
  objc_msgSend(v10, "appendFormat:", CFSTR(" auto-join=%d, auto-login=%d, data-saver=%d, privacy-proxy=%d"), -[WFNetworkProfile isAutoJoinEnabled](self, "isAutoJoinEnabled"), -[WFNetworkProfile isAutoLoginEnabled](self, "isAutoLoginEnabled"), -[WFNetworkProfile isInSaveDataMode](self, "isInSaveDataMode"), -[WFNetworkProfile isPrivacyProxyEnabled](self, "isPrivacyProxyEnabled"));
  -[WFNetworkProfile networkQualityResponsiveness](self, "networkQualityResponsiveness");
  v14 = v13;
  -[WFNetworkProfile networkQualityDate](self, "networkQualityDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR(" responsiveness=%.3f (%@)"), v14, v15);

  if (-[WFNetworkProfile isHidden](self, "isHidden"))
    objc_msgSend(v10, "appendString:", CFSTR(", hidden"));
  if (-[WFNetworkProfile isManaged](self, "isManaged"))
    objc_msgSend(v10, "appendString:", CFSTR(", managed"));
  if (-[WFNetworkProfile isCaptive](self, "isCaptive"))
    objc_msgSend(v10, "appendString:", CFSTR(", isCaptive"));
  if (-[WFNetworkProfile isAdhoc](self, "isAdhoc"))
    objc_msgSend(v10, "appendString:", CFSTR(", adhoc"));
  if (-[WFNetworkProfile isHS20Network](self, "isHS20Network"))
    objc_msgSend(v10, "appendFormat:", CFSTR(", hs20(provisioned=%d)"), -[WFNetworkProfile isHS20NetworkProvisioned](self, "isHS20NetworkProvisioned"));
  if (-[WFNetworkProfile isCarPlay](self, "isCarPlay"))
  {
    v16 = -[WFNetworkProfile carPlayType](self, "carPlayType");
    v17 = CFSTR(",CarPlayUserConfigured");
    if (v16 == 1)
      v17 = CFSTR(",CarPlayOnly");
    objc_msgSend(v10, "appendFormat:", CFSTR(", %@"), v17);
  }
  -[WFNetworkProfile originatorBundleIdentifier](self, "originatorBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[WFNetworkProfile originatorBundleIdentifier](self, "originatorBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(", originatorBundle:%@"), v19);

  }
  -[WFNetworkProfile originatorName](self, "originatorName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[WFNetworkProfile originatorName](self, "originatorName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(", originatorName:%@"), v21);

  }
  if (-[WFNetworkProfile isDNSHeuristicsFiltered](self, "isDNSHeuristicsFiltered"))
    objc_msgSend(v10, "appendString:", CFSTR(", dnsFiltered"));
  if (-[WFNetworkProfile isRandomMACAddressEnabled](self, "isRandomMACAddressEnabled"))
    v22 = CFSTR(" RandomMAC enabled!");
  else
    v22 = CFSTR(" RandomMAC disabled!");
  objc_msgSend(v10, "appendString:", v22);
  -[WFNetworkProfile randomMACAddress](self, "randomMACAddress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    -[WFNetworkProfile randomMACAddress](self, "randomMACAddress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR(" Random MAC: %@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v26);

  }
  objc_msgSend(v10, "appendString:", CFSTR(">"));
  return v10;
}

- (BOOL)isEqualToNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFNetworkProfile ssid](self, "ssid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      v7 = -[WFNetworkProfile securityMode](self, "securityMode");
      v8 = v7 == objc_msgSend(v4, "securityMode");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  BOOL v23;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_21;
  -[WFNetworkProfile randomMACAddress](self, "randomMACAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "randomMACAddress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 1;
LABEL_7:

      goto LABEL_8;
    }
  }
  -[WFNetworkProfile randomMACAddress](self, "randomMACAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "randomMACAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (!v6)
    goto LABEL_7;
LABEL_8:

  -[WFNetworkProfile ssid](self, "ssid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ssid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", v11))
    goto LABEL_20;
  v12 = -[WFNetworkProfile securityMode](self, "securityMode");
  if (v12 != objc_msgSend(v5, "securityMode"))
    goto LABEL_20;
  v13 = -[WFNetworkProfile isAutoJoinEnabled](self, "isAutoJoinEnabled");
  if (v13 != objc_msgSend(v5, "isAutoJoinEnabled"))
    goto LABEL_20;
  v14 = -[WFNetworkProfile isAutoLoginEnabled](self, "isAutoLoginEnabled");
  if (v14 != objc_msgSend(v5, "isAutoLoginEnabled"))
    goto LABEL_20;
  v15 = -[WFNetworkProfile isInSaveDataMode](self, "isInSaveDataMode");
  if (v15 != objc_msgSend(v5, "isInSaveDataMode"))
    goto LABEL_20;
  v16 = -[WFNetworkProfile isPrivacyProxyEnabled](self, "isPrivacyProxyEnabled");
  if (v16 == objc_msgSend(v5, "isPrivacyProxyEnabled")
    && (v17 = -[WFNetworkProfile isHidden](self, "isHidden"), v17 == objc_msgSend(v5, "isHidden"))
    && (v18 = -[WFNetworkProfile carPlayType](self, "carPlayType"), v18 == objc_msgSend(v5, "carPlayType"))
    && (v19 = -[WFNetworkProfile isManaged](self, "isManaged"), v19 == objc_msgSend(v5, "isManaged"))
    && (v20 = -[WFNetworkProfile isHS20Network](self, "isHS20Network"),
        v20 == objc_msgSend(v5, "isHS20Network"))
    && (v21 = -[WFNetworkProfile isCaptive](self, "isCaptive"), v21 == objc_msgSend(v5, "isCaptive"))
    && (v22 = -[WFNetworkProfile isRandomMACAddressEnabled](self, "isRandomMACAddressEnabled"),
        v22 == objc_msgSend(v5, "isRandomMACAddressEnabled")))
  {

    if ((v9 & 1) != 0)
    {
      v23 = 1;
      goto LABEL_22;
    }
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v23 = 0;
LABEL_22:

  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  unint64_t v17;

  -[WFNetworkProfile ssid](self, "ssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[WFNetworkProfile securityMode](self, "securityMode") ^ v4;
  v6 = v5 ^ -[WFNetworkProfile isAutoJoinEnabled](self, "isAutoJoinEnabled");
  v7 = -[WFNetworkProfile isAutoLoginEnabled](self, "isAutoLoginEnabled");
  v8 = v6 ^ v7 ^ -[WFNetworkProfile isInSaveDataMode](self, "isInSaveDataMode");
  v9 = -[WFNetworkProfile isPrivacyProxyEnabled](self, "isPrivacyProxyEnabled");
  v10 = v9 ^ -[WFNetworkProfile isHidden](self, "isHidden");
  v11 = v8 ^ v10 ^ -[WFNetworkProfile carPlayType](self, "carPlayType");
  v12 = -[WFNetworkProfile isManaged](self, "isManaged");
  v13 = v12 ^ -[WFNetworkProfile isHS20Network](self, "isHS20Network");
  v14 = v13 ^ -[WFNetworkProfile isCaptive](self, "isCaptive");
  v15 = v11 ^ v14 ^ -[WFNetworkProfile isRandomMACAddressEnabled](self, "isRandomMACAddressEnabled");
  -[WFNetworkProfile randomMACAddress](self, "randomMACAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

+ (BOOL)networkProfileRepresentSameNetwork:(id)a3 toNetworkProfile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char IsEquivalentWPA;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "ssid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ssid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    if ((WFIsSecurityModeMatch(objc_msgSend(v5, "securityModeExt"), objc_msgSend(v6, "securityModeExt")) & 1) != 0)
      IsEquivalentWPA = 1;
    else
      IsEquivalentWPA = WFSecurityModeIsEquivalentWPA(objc_msgSend(v5, "securityMode"), objc_msgSend(v6, "securityMode"));
  }
  else
  {
    IsEquivalentWPA = 0;
  }

  return IsEquivalentWPA;
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  self->_TLSIdentity = a3;
}

- (NSDictionary)scanAttributes
{
  return self->_scanAttributes;
}

- (void)setScanAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_scanAttributes, a3);
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setEnterpriseProfile:(id)a3
{
  objc_storeStrong((id *)&self->_enterpriseProfile, a3);
}

- (NSString)username
{
  return self->_username;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_storeStrong((id *)&self->_bssid, a3);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_storeStrong((id *)&self->_ssid, a3);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (BOOL)isCaptive
{
  return self->_captive;
}

- (void)setCaptive:(BOOL)a3
{
  self->_captive = a3;
}

- (BOOL)isAdhoc
{
  return self->_adhoc;
}

- (void)setAdhoc:(BOOL)a3
{
  self->_adhoc = a3;
}

- (BOOL)isHS20Network
{
  return self->_HS20Network;
}

- (void)setHS20Network:(BOOL)a3
{
  self->_HS20Network = a3;
}

- (BOOL)isHS20NetworkProvisioned
{
  return self->_HS20NetworkProvisioned;
}

- (void)setHS20NetworkProvisioned:(BOOL)a3
{
  self->_HS20NetworkProvisioned = a3;
}

- (NSString)HS20AccountName
{
  return self->_HS20AccountName;
}

- (void)setHS20AccountName:(id)a3
{
  objc_storeStrong((id *)&self->_HS20AccountName, a3);
}

- (NSString)HS20Badge
{
  return self->_HS20Badge;
}

- (void)setHS20Badge:(id)a3
{
  objc_storeStrong((id *)&self->_HS20Badge, a3);
}

- (BOOL)isAutoJoinEnabled
{
  return self->_autoJoinEnabled;
}

- (void)setAutoJoinEnabled:(BOOL)a3
{
  self->_autoJoinEnabled = a3;
}

- (BOOL)isAutoLoginEnabled
{
  return self->_autoLoginEnabled;
}

- (BOOL)isCarPlay
{
  return self->_carPlay;
}

- (void)setCarPlay:(BOOL)a3
{
  self->_carPlay = a3;
}

- (BOOL)isInSaveDataMode
{
  return self->_isInSaveDataMode;
}

- (BOOL)isPrivacyProxyEnabled
{
  return self->_isPrivacyProxyEnabled;
}

- (double)networkQualityResponsiveness
{
  return self->_networkQualityResponsiveness;
}

- (NSDate)networkQualityDate
{
  return self->_networkQualityDate;
}

- (int64_t)carPlayType
{
  return self->_carPlayType;
}

- (void)setCarPlayType:(int64_t)a3
{
  self->_carPlayType = a3;
}

- (NSString)carPlayUUID
{
  return self->_carPlayUUID;
}

- (void)setCarPlayUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)policyUUID
{
  return self->_policyUUID;
}

- (void)setPolicyUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(int64_t)a3
{
  self->_securityMode = a3;
}

- (int64_t)securityModeExt
{
  return self->_securityModeExt;
}

- (void)setSecurityModeExt:(int64_t)a3
{
  self->_securityModeExt = a3;
}

- (NSDate)addedDate
{
  return self->_addedDate;
}

- (NSDate)lastAutoJoinDate
{
  return self->_lastAutoJoinDate;
}

- (unint64_t)originator
{
  return self->_originator;
}

- (NSString)originatorBundleIdentifier
{
  return self->_originatorBundleIdentifier;
}

- (void)setOriginatorBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)originatorName
{
  return self->_originatorName;
}

- (void)setOriginatorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)isCarrierBased
{
  return self->_carrierBased;
}

- (void)setCarrierBased:(BOOL)a3
{
  self->_carrierBased = a3;
}

- (BOOL)isPersonalHotspot
{
  return self->_personalHotspot;
}

- (void)setPersonalHotspot:(BOOL)a3
{
  self->_personalHotspot = a3;
}

- (BOOL)isProfileBased
{
  return self->_profileBased;
}

- (void)setProfileBased:(BOOL)a3
{
  self->_profileBased = a3;
}

- (BOOL)wasAddedFromWiFiPasswordSharing
{
  return self->_addedFromWiFiPasswordSharing;
}

- (void)setAddedFromWiFiPasswordSharing:(BOOL)a3
{
  self->_addedFromWiFiPasswordSharing = a3;
}

- (BOOL)canExposeIMSI
{
  return self->_canExposeIMSI;
}

- (void)setCanExposeIMSI:(BOOL)a3
{
  self->_canExposeIMSI = a3;
}

- (NSString)previousPassword
{
  return self->_previousPassword;
}

- (BOOL)isInstantHotspotJoin
{
  return self->_instantHotspotJoin;
}

- (void)setInstantHotspotJoin:(BOOL)a3
{
  self->_instantHotspotJoin = a3;
}

- (NSString)hotspotDeviceIdentifier
{
  return self->_hotspotDeviceIdentifier;
}

- (void)setHotspotDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hotspotDeviceIdentifier, a3);
}

- (NSString)randomMACAddress
{
  return self->_randomMACAddress;
}

- (void)setRandomMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)isRandomMACAddressEnabled
{
  return self->_randomMACAddressEnabled;
}

- (void)setRandomMACAddressEnabled:(BOOL)a3
{
  self->_randomMACAddressEnabled = a3;
}

- (BOOL)isDNSHeuristicsFiltered
{
  return self->_DNSHeuristicsFiltered;
}

- (void)setDNSHeuristicsFiltered:(BOOL)a3
{
  self->_DNSHeuristicsFiltered = a3;
}

- (NSString)HS20OperatorName
{
  return self->_HS20OperatorName;
}

- (void)setHS20OperatorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)fetchedPassword
{
  return self->_fetchedPassword;
}

- (void)setFetchedPassword:(BOOL)a3
{
  self->_fetchedPassword = a3;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (void)setRequiresPassword:(BOOL)a3
{
  self->_requiresPassword = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HS20OperatorName, 0);
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_hotspotDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_originatorName, 0);
  objc_storeStrong((id *)&self->_originatorBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_policyUUID, 0);
  objc_storeStrong((id *)&self->_carPlayUUID, 0);
  objc_storeStrong((id *)&self->_networkQualityDate, 0);
  objc_storeStrong((id *)&self->_HS20Badge, 0);
  objc_storeStrong((id *)&self->_HS20AccountName, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_enterpriseProfile, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
  objc_storeStrong((id *)&self->_scanAttributes, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

- (BOOL)shouldBeRemovedIfApplicationIsNoLongerInstalled
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v10;
  uint64_t v11;
  os_log_type_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  WFNetworkProfile *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WFNetworkProfile originatorBundleIdentifier](self, "originatorBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[WFNetworkProfile originatorBundleIdentifier](self, "originatorBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("com.apple"), 1);

  if (!v5)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, (os_log_type_t)v11))
    {
      v14 = 136315394;
      v15 = "-[WFNetworkProfile(NEHotspotHelper) shouldBeRemovedIfApplicationIsNoLongerInstalled]";
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_219FC8000, v10, (os_log_type_t)v11, "%s: application based network (%@) is configured by first party app", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNetworkProfile originatorBundleIdentifier](self, "originatorBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "applicationIsInstalled:", v7);

  if (v8)
  {
    WFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10)
    {
      v10 = v10;
      if (os_log_type_enabled(v10, v12))
      {
        -[WFNetworkProfile originatorBundleIdentifier](self, "originatorBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[WFNetworkProfile(NEHotspotHelper) shouldBeRemovedIfApplicationIsNoLongerInstalled]";
        v16 = 2112;
        v17 = self;
        v18 = 2112;
        v19 = v13;
        _os_log_impl(&dword_219FC8000, v10, v12, "%s: application based network (%@) with identifier %@ is not installed", (uint8_t *)&v14, 0x20u);

      }
    }
LABEL_15:

    return 0;
  }
  return 1;
}

@end
