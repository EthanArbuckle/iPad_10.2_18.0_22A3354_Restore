@implementation WFMutableNetworkProfile

+ (id)mutableProfileForNetwork:(id)a3
{
  id v3;
  WFMutableNetworkProfile *v4;

  v3 = a3;
  v4 = -[WFMutableNetworkProfile initWithNetwork:]([WFMutableNetworkProfile alloc], "initWithNetwork:", v3);

  return v4;
}

- (WFMutableNetworkProfile)initWithNetwork:(id)a3
{
  id v4;
  WFMutableNetworkProfile *v5;
  void *v6;
  uint64_t v7;
  NSString *ssid;
  uint64_t v9;
  NSString *bssid;
  uint64_t v11;
  NSDictionary *scanAttributes;
  uint64_t v13;
  NSDictionary *enterpriseProfile;
  uint64_t v15;
  NSString *username;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFMutableNetworkProfile;
  v5 = -[WFNetworkProfile initWithNetwork:](&v18, sel_initWithNetwork_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "ssid");
      v7 = objc_claimAutoreleasedReturnValue();
      ssid = v5->_ssid;
      v5->_ssid = (NSString *)v7;

      v5->_securityMode = objc_msgSend(v4, "securityMode");
      v5->_securityModeExt = objc_msgSend(v4, "securityModeExt");
      objc_msgSend(v4, "bssid");
      v9 = objc_claimAutoreleasedReturnValue();
      bssid = v5->_bssid;
      v5->_bssid = (NSString *)v9;

      objc_msgSend(v4, "attributes");
      v11 = objc_claimAutoreleasedReturnValue();
      scanAttributes = v5->_scanAttributes;
      v5->_scanAttributes = (NSDictionary *)v11;

      -[NSDictionary objectForKey:](v5->_scanAttributes, "objectForKey:", *MEMORY[0x24BE67DF8]);
      v13 = objc_claimAutoreleasedReturnValue();
      enterpriseProfile = v5->_enterpriseProfile;
      v5->_enterpriseProfile = (NSDictionary *)v13;

      WFUserNameFromEnterpriseProfile(v5->_enterpriseProfile);
      v15 = objc_claimAutoreleasedReturnValue();
      username = v5->_username;
      v5->_username = (NSString *)v15;

    }
  }

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
  v4.super_class = (Class)WFMutableNetworkProfile;
  -[WFNetworkProfile dealloc](&v4, sel_dealloc);
}

- (NSDictionary)enterpriseProfile
{
  NSDictionary *enterpriseProfile;
  NSDictionary *v4;
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSDictionary *v32;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  enterpriseProfile = self->_enterpriseProfile;
  if (enterpriseProfile)
  {
    v4 = enterpriseProfile;
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)WFMutableNetworkProfile;
    -[WFNetworkProfile enterpriseProfile](&v34, sel_enterpriseProfile);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("EAPClientConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    if (self->_TLSIdentity)
    {
      v9 = EAPSecIdentityHandleCreate();
      if (v9)
      {
        v10 = (const void *)v9;
        objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("TLSIdentityHandle"));
        CFRelease(v10);
      }
      else
      {
        WFLogForCategory(0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
        {
          *(_DWORD *)buf = 136315138;
          v36 = "-[WFMutableNetworkProfile enterpriseProfile]";
          _os_log_impl(&dword_219FC8000, v11, v12, "%s: failed to create SecIdentity handle for identity", buf, 0xCu);
        }

      }
      objc_msgSend(v8, "objectForKey:", CFSTR("AcceptEAPTypes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("AcceptEAPTypes"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", &unk_24DC5D318);

        if ((v15 & 1) != 0)
        {
          WFLogForCategory(0);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
          {
            *(_DWORD *)buf = 136315394;
            v36 = "-[WFMutableNetworkProfile enterpriseProfile]";
            v37 = 2112;
            v38 = v8;
            _os_log_impl(&dword_219FC8000, v16, v17, "%s: accept EAP types already present %@", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("AcceptEAPTypes"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          objc_msgSend(v19, "addObject:", &unk_24DC5D318);
          objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("AcceptEAPTypes"));

        }
      }
      else
      {
        objc_msgSend(v8, "setObject:forKey:", &unk_24DC5DAF8, CFSTR("AcceptEAPTypes"));
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFMutableNetworkProfile certificateChain](self, "certificateChain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v21 = v20 == 0;
  else
    v21 = 1;
  if (!v21)
  {
    -[WFMutableNetworkProfile certificateChain](self, "certificateChain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v22, CFSTR("TLSUserTrustProceedCertificateChain"));

    objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("TLSSaveTrustExceptions"));
  }
  -[WFMutableNetworkProfile username](self, "username");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "length"))
  {

  }
  else
  {
    -[WFMutableNetworkProfile password](self, "password");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (!v25)
      goto LABEL_35;
  }
  -[WFMutableNetworkProfile username](self, "username");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    -[WFMutableNetworkProfile username](self, "username");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v28, CFSTR("UserName"));

  }
  -[WFMutableNetworkProfile password](self, "password");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v30)
  {
    -[WFMutableNetworkProfile password](self, "password");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v31, CFSTR("UserPassword"));

  }
LABEL_35:
  if (objc_msgSend(v8, "count"))
  {
    v32 = (NSDictionary *)-[NSDictionary mutableCopy](v5, "mutableCopy");
    -[NSDictionary setObject:forKey:](v32, "setObject:forKey:", v8, CFSTR("EAPClientConfiguration"));

    v5 = v32;
  }

  return v5;
}

- (void)removePassword
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  WFMutableNetworkProfile *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v12 = 136315394;
    v13 = "-[WFMutableNetworkProfile removePassword]";
    v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_219FC8000, v3, v4, "%s: removing password for %@", (uint8_t *)&v12, 0x16u);
  }

  -[WFMutableNetworkProfile password](self, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v9 || !os_log_type_enabled(v9, v10))
      goto LABEL_23;
    v12 = 136315394;
    v13 = "-[WFMutableNetworkProfile removePassword]";
    v14 = 2112;
    v15 = self;
    v11 = "%s: no password to remove for profile %@";
    goto LABEL_22;
  }
  -[WFMutableNetworkProfile setPassword:](self, "setPassword:", 0);
  -[WFMutableNetworkProfile scanAttributes](self, "scanAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v9 || !os_log_type_enabled(v9, v10))
      goto LABEL_23;
    v12 = 136315394;
    v13 = "-[WFMutableNetworkProfile removePassword]";
    v14 = 2112;
    v15 = self;
    v11 = "%s: missing network attributes for profile %@";
    goto LABEL_22;
  }
  -[WFMutableNetworkProfile scanAttributes](self, "scanAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const void *)WiFiNetworkCreate();

  if (!v8)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v9 || !os_log_type_enabled(v9, v10))
      goto LABEL_23;
    v12 = 136315394;
    v13 = "-[WFMutableNetworkProfile removePassword]";
    v14 = 2112;
    v15 = self;
    v11 = "%s: failed to create network for profile %@";
LABEL_22:
    _os_log_impl(&dword_219FC8000, v9, v10, v11, (uint8_t *)&v12, 0x16u);
LABEL_23:

    return;
  }
  WiFiNetworkRemovePassword();
  CFRelease(v8);
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  __SecIdentity *TLSIdentity;

  TLSIdentity = self->_TLSIdentity;
  if (TLSIdentity)
    CFRelease(TLSIdentity);
  self->_TLSIdentity = a3;
  if (a3)
    CFRetain(a3);
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

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_storeStrong((id *)&self->_bssid, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
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

- (void)setEnterpriseProfile:(id)a3
{
  objc_storeStrong((id *)&self->_enterpriseProfile, a3);
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setCertificateChain:(id)a3
{
  objc_storeStrong((id *)&self->_certificateChain, a3);
}

- (NSDictionary)scanAttributes
{
  return self->_scanAttributes;
}

- (void)setScanAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_scanAttributes, a3);
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (BOOL)isAdhoc
{
  return self->_adhoc;
}

- (BOOL)isCaptive
{
  return self->_captive;
}

- (void)setCaptive:(BOOL)a3
{
  self->_captive = a3;
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

- (void)setAutoLoginEnabled:(BOOL)a3
{
  self->_autoLoginEnabled = a3;
}

- (BOOL)isInSaveDataMode
{
  return self->_isInSaveDataMode;
}

- (void)setIsInSaveDataMode:(BOOL)a3
{
  self->_isInSaveDataMode = a3;
}

- (BOOL)isPrivacyProxyEnabled
{
  return self->_isPrivacyProxyEnabled;
}

- (void)setIsPrivacyProxyEnabled:(BOOL)a3
{
  self->_isPrivacyProxyEnabled = a3;
}

- (double)networkQualityResponsiveness
{
  return self->_networkQualityResponsiveness;
}

- (void)setNetworkQualityResponsiveness:(double)a3
{
  self->_networkQualityResponsiveness = a3;
}

- (NSDate)networkQualityDate
{
  return self->_networkQualityDate;
}

- (void)setNetworkQualityDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSDate)lastAssociationDate
{
  return self->_lastAssociationDate;
}

- (void)setLastAssociationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAssociationDate, a3);
}

- (__SecIdentity)TLSIdentity
{
  return self->_TLSIdentity;
}

- (NSString)originatorBundleIdentifier
{
  return self->_originatorBundleIdentifier;
}

- (void)setOriginatorBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)originatorName
{
  return self->_originatorName;
}

- (void)setOriginatorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (BOOL)isCarrierBased
{
  return self->_carrierBased;
}

- (id)HS20AccountName
{
  return self->_HS20AccountName;
}

- (id)HS20Badge
{
  return self->_HS20Badge;
}

- (BOOL)userProvidedPassword
{
  return self->_userProvidedPassword;
}

- (void)setUserProvidedPassword:(BOOL)a3
{
  self->_userProvidedPassword = a3;
}

- (NSString)previousPassword
{
  return self->_previousPassword;
}

- (void)setPreviousPassword:(id)a3
{
  objc_storeStrong((id *)&self->_previousPassword, a3);
}

- (BOOL)isPersonalHotspot
{
  return self->_personalHotspot;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (BOOL)isRandomMACAddressEnabled
{
  return self->_randomMACAddressEnabled;
}

- (void)setRandomMACAddressEnabled:(BOOL)a3
{
  self->_randomMACAddressEnabled = a3;
}

- (BOOL)wasAddedFromWiFiPasswordSharing
{
  return self->_addedFromWiFiPasswordSharing;
}

- (void)setAddedFromWiFiPasswordSharing:(BOOL)a3
{
  self->_addedFromWiFiPasswordSharing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomMACAddress, 0);
  objc_storeStrong((id *)&self->_hotspotDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_previousPassword, 0);
  objc_storeStrong((id *)&self->_HS20Badge, 0);
  objc_storeStrong((id *)&self->_HS20AccountName, 0);
  objc_storeStrong((id *)&self->_originatorName, 0);
  objc_storeStrong((id *)&self->_originatorBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastAssociationDate, 0);
  objc_storeStrong((id *)&self->_networkQualityDate, 0);
  objc_storeStrong((id *)&self->_scanAttributes, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
  objc_storeStrong((id *)&self->_enterpriseProfile, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
