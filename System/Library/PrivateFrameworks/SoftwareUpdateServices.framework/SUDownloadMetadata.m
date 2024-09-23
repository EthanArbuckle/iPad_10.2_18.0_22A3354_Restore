@implementation SUDownloadMetadata

- (SUDownloadMetadata)init
{
  SUDownloadMetadata *v2;
  SUDownloadMetadata *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUDownloadMetadata;
  v2 = -[SUDownloadMetadata init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SUDownloadMetadata setActiveDownloadPolicyType:](v2, "setActiveDownloadPolicyType:", 3);
    v3->_enforceWifiOnlyOverride = 0;
    v3->_enabledForCellularRoaming = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUDownloadMetadata)initWithCoder:(id)a3
{
  id v4;
  SUDownloadMetadata *v5;

  v4 = a3;
  v5 = -[SUDownloadMetadata init](self, "init");
  if (v5)
  {
    -[SUDownloadMetadata setAutoDownload:](v5, "setAutoDownload:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutoDownload")));
    -[SUDownloadMetadata setDownloadOnly:](v5, "setDownloadOnly:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDownloadOnly")));
    -[SUDownloadMetadata setActiveDownloadPolicyType:](v5, "setActiveDownloadPolicyType:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("activeDownloadPolicy")));
    -[SUDownloadMetadata setEnabledFor2G:](v5, "setEnabledFor2G:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabledFor2G")));
    -[SUDownloadMetadata setEnabledFor3G:](v5, "setEnabledFor3G:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabledFor3G")));
    -[SUDownloadMetadata setEnabledFor4G:](v5, "setEnabledFor4G:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabledFor4G")));
    -[SUDownloadMetadata setEnabledForWifi:](v5, "setEnabledForWifi:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabledForWifi")));
    -[SUDownloadMetadata setEnabledOnBatteryPower:](v5, "setEnabledOnBatteryPower:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabledOnBatteryPower")));
    -[SUDownloadMetadata setEnforceWifiOnlyOverride:](v5, "setEnforceWifiOnlyOverride:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enforceWifiOnlyOverride")));
    -[SUDownloadMetadata setDownloadFeeAgreementStatus:](v5, "setDownloadFeeAgreementStatus:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("downloadFeeAgreementStatus")));
    -[SUDownloadMetadata setTermsAndConditionsAgreementStatus:](v5, "setTermsAndConditionsAgreementStatus:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("termsAndConditionsAgreementStatus")));
    -[SUDownloadMetadata setEnabledForCellularRoaming:](v5, "setEnabledForCellularRoaming:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabledForCellularRoaming")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 autoDownload;
  id v5;

  autoDownload = self->_autoDownload;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", autoDownload, CFSTR("isAutoDownload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_downloadOnly, CFSTR("isDownloadOnly"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_activeDownloadPolicyType, CFSTR("activeDownloadPolicy"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabledFor2G, CFSTR("enabledFor2G"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabledFor3G, CFSTR("enabledFor3G"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabledFor4G, CFSTR("enabledFor4G"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabledForWifi, CFSTR("enabledForWifi"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabledOnBatteryPower, CFSTR("enabledOnBatteryPower"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enforceWifiOnlyOverride, CFSTR("enforceWifiOnlyOverride"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_downloadFeeAgreementStatus, CFSTR("downloadFeeAgreementStatus"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_termsAndConditionsAgreementStatus, CFSTR("termsAndConditionsAgreementStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabledForCellularRoaming, CFSTR("enabledForCellularRoaming"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAutoDownload:", self->_autoDownload);
  objc_msgSend(v4, "setDownloadOnly:", self->_downloadOnly);
  objc_msgSend(v4, "setActiveDownloadPolicyType:", self->_activeDownloadPolicyType);
  objc_msgSend(v4, "setEnabledFor2G:", self->_enabledFor2G);
  objc_msgSend(v4, "setEnabledFor3G:", self->_enabledFor3G);
  objc_msgSend(v4, "setEnabledFor4G:", self->_enabledFor4G);
  objc_msgSend(v4, "setEnabledForWifi:", self->_enabledForWifi);
  objc_msgSend(v4, "setEnabledOnBatteryPower:", self->_enabledOnBatteryPower);
  objc_msgSend(v4, "setEnforceWifiOnlyOverride:", self->_enforceWifiOnlyOverride);
  objc_msgSend(v4, "setDownloadFeeAgreementStatus:", self->_downloadFeeAgreementStatus);
  objc_msgSend(v4, "setTermsAndConditionsAgreementStatus:", self->_termsAndConditionsAgreementStatus);
  objc_msgSend(v4, "setEnabledForCellularRoaming:", self->_enabledForCellularRoaming);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAutoDownload:", self->_autoDownload);
  objc_msgSend(v4, "setDownloadOnly:", self->_downloadOnly);
  objc_msgSend(v4, "setActiveDownloadPolicyType:", self->_activeDownloadPolicyType);
  objc_msgSend(v4, "setEnabledFor2G:", self->_enabledFor2G);
  objc_msgSend(v4, "setEnabledFor3G:", self->_enabledFor3G);
  objc_msgSend(v4, "setEnabledFor4G:", self->_enabledFor4G);
  objc_msgSend(v4, "setEnabledForWifi:", self->_enabledForWifi);
  objc_msgSend(v4, "setEnabledOnBatteryPower:", self->_enabledOnBatteryPower);
  objc_msgSend(v4, "setEnforceWifiOnlyOverride:", self->_enforceWifiOnlyOverride);
  objc_msgSend(v4, "setDownloadFeeAgreementStatus:", self->_downloadFeeAgreementStatus);
  objc_msgSend(v4, "setTermsAndConditionsAgreementStatus:", self->_termsAndConditionsAgreementStatus);
  objc_msgSend(v4, "setEnabledForCellularRoaming:", self->_enabledForCellularRoaming);
  return v4;
}

- (void)applyDownloadPolicy:(id)a3
{
  id v4;
  BOOL v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = (objc_msgSend(v4, "isDownloadFreeForCellular") & 1) != 0
      || -[SUDownloadMetadata downloadFeeAgreementStatus](self, "downloadFeeAgreementStatus") == 1;
    v6 = -[SUDownloadMetadata enforceWifiOnlyOverride](self, "enforceWifiOnlyOverride");
    -[SUDownloadMetadata setActiveDownloadPolicyType:](self, "setActiveDownloadPolicyType:", +[SUDownloadPolicyFactory downloadPolicyTypeForClass:](SUDownloadPolicyFactory, "downloadPolicyTypeForClass:", v9));
    -[SUDownloadMetadata setEnabledOnBatteryPower:](self, "setEnabledOnBatteryPower:", objc_msgSend(v9, "isPowerRequired") ^ 1);
    if (v6 || !v5)
    {
      -[SUDownloadMetadata setEnabledFor2G:](self, "setEnabledFor2G:", 0);
      -[SUDownloadMetadata setEnabledFor3G:](self, "setEnabledFor3G:", 0);
      v7 = 0;
    }
    else
    {
      -[SUDownloadMetadata setEnabledFor2G:](self, "setEnabledFor2G:", objc_msgSend(v9, "isDownloadAllowableForCellular2G"));
      -[SUDownloadMetadata setEnabledFor3G:](self, "setEnabledFor3G:", objc_msgSend(v9, "isDownloadAllowableForCellular"));
      v7 = objc_msgSend(v9, "isDownloadAllowableForCellular");
    }
    -[SUDownloadMetadata setEnabledFor4G:](self, "setEnabledFor4G:", v7);
    if (-[SUDownloadMetadata isEnabledFor2G](self, "isEnabledFor2G")
      || -[SUDownloadMetadata isEnabledFor3G](self, "isEnabledFor3G")
      || -[SUDownloadMetadata isEnabledFor4G](self, "isEnabledFor4G"))
    {
      v8 = objc_msgSend(v9, "isDownloadAllowableForCellularRoaming");
    }
    else
    {
      v8 = 0;
    }
    -[SUDownloadMetadata setEnabledForCellularRoaming:](self, "setEnabledForCellularRoaming:", v8);
    -[SUDownloadMetadata setEnabledForWifi:](self, "setEnabledForWifi:", objc_msgSend(v9, "isDownloadAllowableForWiFi"));
    v4 = v9;
  }

}

- (id)activeDownloadPolicy:(id)a3
{
  if (!a3)
    return 0;
  +[SUDownloadPolicyFactory downloadPolicyForType:forDescriptor:](SUDownloadPolicyFactory, "downloadPolicyForType:forDescriptor:", self->_activeDownloadPolicyType, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)availableDownloadPolicyIfDifferentFromActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SUDownloadMetadata activeDownloadPolicy:](self, "activeDownloadPolicy:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUDownloadPolicyFactory userDownloadPolicyForDescriptor:existingPolicy:](SUDownloadPolicyFactory, "userDownloadPolicyForDescriptor:existingPolicy:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v5, "isSamePolicy:", v6) & 1) == 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (BOOL)matchesDownloadPolicy:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v12;

  v4 = a3;
  if (self->_activeDownloadPolicyType == +[SUDownloadPolicyFactory downloadPolicyTypeForClass:](SUDownloadPolicyFactory, "downloadPolicyTypeForClass:", v4)&& (v5 = objc_msgSend(v4, "isPowerRequired"), v5 != -[SUDownloadMetadata isEnabledOnBatteryPower](self, "isEnabledOnBatteryPower"))&& (v6 = objc_msgSend(v4, "isDownloadAllowableForWiFi"), v6 == -[SUDownloadMetadata isEnabledForWifi](self, "isEnabledForWifi"))&& (v7 = objc_msgSend(v4, "isDownloadAllowableForCellular2G"), v7 == -[SUDownloadMetadata isEnabledFor2G](self, "isEnabledFor2G"))&& (v8 = objc_msgSend(v4, "isDownloadAllowableForCellular"), v8 == -[SUDownloadMetadata isEnabledFor3G](self, "isEnabledFor3G"))&& (v9 = objc_msgSend(v4, "isDownloadAllowableForCellular"), v9 == -[SUDownloadMetadata isEnabledFor4G](self, "isEnabledFor4G")))
  {
    v12 = objc_msgSend(v4, "isDownloadAllowableForCellularRoaming");
    v10 = v12 ^ -[SUDownloadMetadata isEnabledForCellularRoaming](self, "isEnabledForCellularRoaming") ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)isEnabledForNetworkType:(int)a3
{
  BOOL result;

  switch(a3)
  {
    case 0:
      result = 0;
      break;
    case 1:
      result = -[SUDownloadMetadata isEnabledForWifi](self, "isEnabledForWifi");
      break;
    case 2:
      result = -[SUDownloadMetadata isEnabledFor2G](self, "isEnabledFor2G");
      break;
    case 3:
      result = -[SUDownloadMetadata isEnabledFor3G](self, "isEnabledFor3G");
      break;
    default:
      result = -[SUDownloadMetadata isEnabledFor4G](self, "isEnabledFor4G");
      break;
  }
  return result;
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3)
    return CFSTR("Yes");
  else
    return CFSTR("No");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v14 = (void *)MEMORY[0x24BDD17C8];
  -[SUDownloadMetadata _stringForBool:](self, "_stringForBool:", -[SUDownloadMetadata isAutoDownload](self, "isAutoDownload"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownloadMetadata _stringForBool:](self, "_stringForBool:", -[SUDownloadMetadata isDownloadOnly](self, "isDownloadOnly"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUStringFromDownloadPolicyType(self->_activeDownloadPolicyType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownloadMetadata _stringForBool:](self, "_stringForBool:", -[SUDownloadMetadata isEnabledFor2G](self, "isEnabledFor2G"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownloadMetadata _stringForBool:](self, "_stringForBool:", -[SUDownloadMetadata isEnabledFor3G](self, "isEnabledFor3G"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownloadMetadata _stringForBool:](self, "_stringForBool:", -[SUDownloadMetadata isEnabledFor4G](self, "isEnabledFor4G"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownloadMetadata _stringForBool:](self, "_stringForBool:", -[SUDownloadMetadata isEnabledForCellularRoaming](self, "isEnabledForCellularRoaming"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownloadMetadata _stringForBool:](self, "_stringForBool:", -[SUDownloadMetadata isEnabledForWifi](self, "isEnabledForWifi"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownloadMetadata _stringForBool:](self, "_stringForBool:", -[SUDownloadMetadata isEnabledOnBatteryPower](self, "isEnabledOnBatteryPower"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownloadMetadata _stringForBool:](self, "_stringForBool:", -[SUDownloadMetadata enforceWifiOnlyOverride](self, "enforceWifiOnlyOverride"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("\n            \tisAutoDownload: %@\n            \tisDownloadOnly: %@\n            \tactiveDownloadPolicyType: %@\n            \tisEnabledFor2G: %@\n            \tisEnabledFor3G: %@\n            \tisEnabledFor4G: %@\n            \tisEnabledForCellularRoaming: %@\n            \tisEnabledForWifi: %@\n            \tisEnabledOnBatteryPower: %@\n            \tenforceWifiOnlyOverride: %@\n            \tDownloadFeeAgreementStatus: %d\n            \tTermsAndConditionsAgreementStatus: %d"), v13, v12, v3, v4, v5, v6, v7, v8, v9, v10, -[SUDownloadMetadata downloadFeeAgreementStatus](self, "downloadFeeAgreementStatus"), -[SUDownloadMetadata termsAndConditionsAgreementStatus](self, "termsAndConditionsAgreementStatus"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  SUDownloadMetadata *v4;
  SUDownloadMetadata *v5;
  SUDownloadMetadata *v6;
  _BOOL4 autoDownload;
  _BOOL4 downloadOnly;
  int activeDownloadPolicyType;
  _BOOL4 enabledFor2G;
  _BOOL4 enabledFor3G;
  _BOOL4 enabledFor4G;
  _BOOL4 enabledForWifi;
  _BOOL4 enabledOnBatteryPower;
  _BOOL4 enforceWifiOnlyOverride;
  int downloadFeeAgreementStatus;
  int termsAndConditionsAgreementStatus;
  _BOOL4 enabledForCellularRoaming;
  BOOL v19;

  v4 = (SUDownloadMetadata *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_16;
  if (self == v4)
  {
    v19 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    autoDownload = self->_autoDownload;
    if (autoDownload != -[SUDownloadMetadata isAutoDownload](v6, "isAutoDownload"))
      goto LABEL_18;
    downloadOnly = self->_downloadOnly;
    if (downloadOnly != -[SUDownloadMetadata isDownloadOnly](v6, "isDownloadOnly"))
      goto LABEL_18;
    activeDownloadPolicyType = self->_activeDownloadPolicyType;
    if (activeDownloadPolicyType != -[SUDownloadMetadata activeDownloadPolicyType](v6, "activeDownloadPolicyType"))
      goto LABEL_18;
    enabledFor2G = self->_enabledFor2G;
    if (enabledFor2G != -[SUDownloadMetadata isEnabledFor2G](v6, "isEnabledFor2G"))
      goto LABEL_18;
    enabledFor3G = self->_enabledFor3G;
    if (enabledFor3G == -[SUDownloadMetadata isEnabledFor3G](v6, "isEnabledFor3G")
      && (enabledFor4G = self->_enabledFor4G, enabledFor4G == -[SUDownloadMetadata isEnabledFor4G](v6, "isEnabledFor4G"))
      && (enabledForWifi = self->_enabledForWifi,
          enabledForWifi == -[SUDownloadMetadata isEnabledForWifi](v6, "isEnabledForWifi"))
      && (enabledOnBatteryPower = self->_enabledOnBatteryPower,
          enabledOnBatteryPower == -[SUDownloadMetadata isEnabledOnBatteryPower](v6, "isEnabledOnBatteryPower"))
      && (enforceWifiOnlyOverride = self->_enforceWifiOnlyOverride,
          enforceWifiOnlyOverride == -[SUDownloadMetadata enforceWifiOnlyOverride](v6, "enforceWifiOnlyOverride"))
      && (downloadFeeAgreementStatus = self->_downloadFeeAgreementStatus,
          downloadFeeAgreementStatus == -[SUDownloadMetadata downloadFeeAgreementStatus](v6, "downloadFeeAgreementStatus"))&& (termsAndConditionsAgreementStatus = self->_termsAndConditionsAgreementStatus, termsAndConditionsAgreementStatus == -[SUDownloadMetadata termsAndConditionsAgreementStatus](v6, "termsAndConditionsAgreementStatus")))
    {
      enabledForCellularRoaming = self->_enabledForCellularRoaming;
      v19 = enabledForCellularRoaming == -[SUDownloadMetadata isEnabledForCellularRoaming](v6, "isEnabledForCellularRoaming");
    }
    else
    {
LABEL_18:
      v19 = 0;
    }

  }
  else
  {
LABEL_16:
    v19 = 0;
  }
LABEL_20:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 3;
  if (!self->_autoDownload)
    v2 = 1;
  if (self->_enabledFor2G)
    v2 |= 4uLL;
  if (self->_enabledFor3G)
    v2 |= 8uLL;
  if (self->_enabledForWifi)
    v2 |= 0x10uLL;
  if (self->_enabledOnBatteryPower)
    v2 |= 0x20uLL;
  if (self->_enforceWifiOnlyOverride)
    v2 |= 0x40uLL;
  if (self->_enabledForCellularRoaming)
    v2 |= 0x80uLL;
  if (self->_enabledFor4G)
    v2 |= 0x100uLL;
  if (self->_downloadOnly)
    v2 |= 0x200uLL;
  return self->_termsAndConditionsAgreementStatus
       + 8
       * (self->_downloadFeeAgreementStatus + 8 * (self->_activeDownloadPolicyType + 8 * v2));
}

- (BOOL)isAutoDownload
{
  return self->_autoDownload;
}

- (void)setAutoDownload:(BOOL)a3
{
  self->_autoDownload = a3;
}

- (BOOL)isDownloadOnly
{
  return self->_downloadOnly;
}

- (void)setDownloadOnly:(BOOL)a3
{
  self->_downloadOnly = a3;
}

- (int)downloadFeeAgreementStatus
{
  return self->_downloadFeeAgreementStatus;
}

- (void)setDownloadFeeAgreementStatus:(int)a3
{
  self->_downloadFeeAgreementStatus = a3;
}

- (int)termsAndConditionsAgreementStatus
{
  return self->_termsAndConditionsAgreementStatus;
}

- (void)setTermsAndConditionsAgreementStatus:(int)a3
{
  self->_termsAndConditionsAgreementStatus = a3;
}

- (int)activeDownloadPolicyType
{
  return self->_activeDownloadPolicyType;
}

- (void)setActiveDownloadPolicyType:(int)a3
{
  self->_activeDownloadPolicyType = a3;
}

- (BOOL)isEnabledFor2G
{
  return self->_enabledFor2G;
}

- (void)setEnabledFor2G:(BOOL)a3
{
  self->_enabledFor2G = a3;
}

- (BOOL)isEnabledFor3G
{
  return self->_enabledFor3G;
}

- (void)setEnabledFor3G:(BOOL)a3
{
  self->_enabledFor3G = a3;
}

- (BOOL)isEnabledFor4G
{
  return self->_enabledFor4G;
}

- (void)setEnabledFor4G:(BOOL)a3
{
  self->_enabledFor4G = a3;
}

- (BOOL)isEnabledForWifi
{
  return self->_enabledForWifi;
}

- (void)setEnabledForWifi:(BOOL)a3
{
  self->_enabledForWifi = a3;
}

- (BOOL)isEnabledForCellularRoaming
{
  return self->_enabledForCellularRoaming;
}

- (void)setEnabledForCellularRoaming:(BOOL)a3
{
  self->_enabledForCellularRoaming = a3;
}

- (BOOL)isEnabledOnBatteryPower
{
  return self->_enabledOnBatteryPower;
}

- (void)setEnabledOnBatteryPower:(BOOL)a3
{
  self->_enabledOnBatteryPower = a3;
}

- (BOOL)enforceWifiOnlyOverride
{
  return self->_enforceWifiOnlyOverride;
}

- (void)setEnforceWifiOnlyOverride:(BOOL)a3
{
  self->_enforceWifiOnlyOverride = a3;
}

@end
