@implementation WFNetworkSettingsConfig

- (WFNetworkSettingsConfig)init
{
  WFNetworkSettingsConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFNetworkSettingsConfig;
  result = -[WFNetworkSettingsConfig init](&v3, sel_init);
  if (result)
  {
    result->_ipv4Config = -1;
    result->_ipv6Config = -1;
    result->_current = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFNetworkSettingsConfig *v5;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;

  v5 = objc_alloc_init(WFNetworkSettingsConfig);
  if (v5)
  {
    -[WFNetworkSettingsConfig healthRecommendations](self, "healthRecommendations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkSettingsConfig setHealthRecommendations:](v5, "setHealthRecommendations:", v6);

    -[WFNetworkSettingsConfig ssid](self, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNetworkSettingsConfig setSsid:](v5, "setSsid:", v7);

    -[WFNetworkSettingsConfig displayFriendlyName](self, "displayFriendlyName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setDisplayFriendlyName:](v5, "setDisplayFriendlyName:", v9);

    -[WFNetworkSettingsConfig setCurrent:](v5, "setCurrent:", -[WFNetworkSettingsConfig current](self, "current"));
    -[WFNetworkSettingsConfig setForgetable:](v5, "setForgetable:", -[WFNetworkSettingsConfig forgetable](self, "forgetable"));
    -[WFNetworkSettingsConfig setJoinable:](v5, "setJoinable:", -[WFNetworkSettingsConfig joinable](self, "joinable"));
    -[WFNetworkSettingsConfig setManageable:](v5, "setManageable:", -[WFNetworkSettingsConfig manageable](self, "manageable"));
    -[WFNetworkSettingsConfig setCloudSyncable:](v5, "setCloudSyncable:", -[WFNetworkSettingsConfig cloudSyncable](self, "cloudSyncable"));
    -[WFNetworkSettingsConfig setCanRenewLease:](v5, "setCanRenewLease:", -[WFNetworkSettingsConfig canRenewLease](self, "canRenewLease"));
    -[WFNetworkSettingsConfig setDiagnosable:](v5, "setDiagnosable:", -[WFNetworkSettingsConfig diagnosable](self, "diagnosable"));
    -[WFNetworkSettingsConfig setAutoJoinConfigurable:](v5, "setAutoJoinConfigurable:", -[WFNetworkSettingsConfig autoJoinConfigurable](self, "autoJoinConfigurable"));
    -[WFNetworkSettingsConfig setAutoJoinEnabled:](v5, "setAutoJoinEnabled:", -[WFNetworkSettingsConfig autoJoinEnabled](self, "autoJoinEnabled"));
    -[WFNetworkSettingsConfig setAutoLoginConfigurable:](v5, "setAutoLoginConfigurable:", -[WFNetworkSettingsConfig autoLoginConfigurable](self, "autoLoginConfigurable"));
    -[WFNetworkSettingsConfig setAutoLoginEnabled:](v5, "setAutoLoginEnabled:", -[WFNetworkSettingsConfig autoLoginEnabled](self, "autoLoginEnabled"));
    -[WFNetworkSettingsConfig setSaveDataModeConfigurable:](v5, "setSaveDataModeConfigurable:", -[WFNetworkSettingsConfig saveDataModeConfigurable](self, "saveDataModeConfigurable"));
    -[WFNetworkSettingsConfig setPrivacyProxyTierStatus:](v5, "setPrivacyProxyTierStatus:", -[WFNetworkSettingsConfig privacyProxyTierStatus](self, "privacyProxyTierStatus"));
    -[WFNetworkSettingsConfig setIsInSaveDataMode:](v5, "setIsInSaveDataMode:", -[WFNetworkSettingsConfig isInSaveDataMode](self, "isInSaveDataMode"));
    -[WFNetworkSettingsConfig setPrivacyProxyEnabled:](v5, "setPrivacyProxyEnabled:", -[WFNetworkSettingsConfig privacyProxyEnabled](self, "privacyProxyEnabled"));
    -[WFNetworkSettingsConfig setWifiOutrankEnabled:](v5, "setWifiOutrankEnabled:", -[WFNetworkSettingsConfig wifiOutrankEnabled](self, "wifiOutrankEnabled"));
    -[WFNetworkSettingsConfig setNetworkQualityVisible:](v5, "setNetworkQualityVisible:", -[WFNetworkSettingsConfig networkQualityVisible](self, "networkQualityVisible"));
    -[WFNetworkSettingsConfig networkQualityResponsiveness](self, "networkQualityResponsiveness");
    -[WFNetworkSettingsConfig setNetworkQualityResponsiveness:](v5, "setNetworkQualityResponsiveness:");
    -[WFNetworkSettingsConfig networkQualityDate](self, "networkQualityDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setNetworkQualityDate:](v5, "setNetworkQualityDate:", v11);

    -[WFNetworkSettingsConfig setIpv4Config:](v5, "setIpv4Config:", -[WFNetworkSettingsConfig ipv4Config](self, "ipv4Config"));
    -[WFNetworkSettingsConfig ipv4Address](self, "ipv4Address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv4Address:](v5, "setIpv4Address:", v13);

    -[WFNetworkSettingsConfig ipv4AddressManual](self, "ipv4AddressManual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv4AddressManual:](v5, "setIpv4AddressManual:", v15);

    -[WFNetworkSettingsConfig ipv4SubnetMask](self, "ipv4SubnetMask");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv4SubnetMask:](v5, "setIpv4SubnetMask:", v17);

    -[WFNetworkSettingsConfig ipv4SubnetMaskManual](self, "ipv4SubnetMaskManual");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv4SubnetMaskManual:](v5, "setIpv4SubnetMaskManual:", v19);

    -[WFNetworkSettingsConfig ipv4RouterAddress](self, "ipv4RouterAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv4RouterAddress:](v5, "setIpv4RouterAddress:", v21);

    -[WFNetworkSettingsConfig ipv4RouterAddressManual](self, "ipv4RouterAddressManual");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv4RouterAddressManual:](v5, "setIpv4RouterAddressManual:", v23);

    -[WFNetworkSettingsConfig dhcpClientID](self, "dhcpClientID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setDhcpClientID:](v5, "setDhcpClientID:", v25);

    -[WFNetworkSettingsConfig dhcpLeaseExpirationDate](self, "dhcpLeaseExpirationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setDhcpLeaseExpirationDate:](v5, "setDhcpLeaseExpirationDate:", v27);

    -[WFNetworkSettingsConfig setIpv6Config:](v5, "setIpv6Config:", -[WFNetworkSettingsConfig ipv6Config](self, "ipv6Config"));
    -[WFNetworkSettingsConfig ipv6Addresses](self, "ipv6Addresses");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv6Addresses:](v5, "setIpv6Addresses:", v29);

    -[WFNetworkSettingsConfig ipv6PrefixLengths](self, "ipv6PrefixLengths");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv6PrefixLengths:](v5, "setIpv6PrefixLengths:", v31);

    -[WFNetworkSettingsConfig ipv6AddressManual](self, "ipv6AddressManual");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv6AddressManual:](v5, "setIpv6AddressManual:", v33);

    -[WFNetworkSettingsConfig ipv6RouterAddress](self, "ipv6RouterAddress");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv6RouterAddress:](v5, "setIpv6RouterAddress:", v35);

    -[WFNetworkSettingsConfig ipv6RouterAddressManual](self, "ipv6RouterAddressManual");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv6RouterAddressManual:](v5, "setIpv6RouterAddressManual:", v37);

    -[WFNetworkSettingsConfig ipv6PrefixLengthManual](self, "ipv6PrefixLengthManual");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setIpv6PrefixLengthManual:](v5, "setIpv6PrefixLengthManual:", v39);

    -[WFNetworkSettingsConfig setDnsConfig:](v5, "setDnsConfig:", -[WFNetworkSettingsConfig dnsConfig](self, "dnsConfig"));
    -[WFNetworkSettingsConfig dnsServerAddresses](self, "dnsServerAddresses");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setDnsServerAddresses:](v5, "setDnsServerAddresses:", v41);

    -[WFNetworkSettingsConfig dnsSearchDomains](self, "dnsSearchDomains");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setDnsSearchDomains:](v5, "setDnsSearchDomains:", v43);

    -[WFNetworkSettingsConfig setHttpProxyConfigurable:](v5, "setHttpProxyConfigurable:", -[WFNetworkSettingsConfig httpProxyConfigurable](self, "httpProxyConfigurable"));
    -[WFNetworkSettingsConfig setHttpProxyConfig:](v5, "setHttpProxyConfig:", -[WFNetworkSettingsConfig httpProxyConfig](self, "httpProxyConfig"));
    -[WFNetworkSettingsConfig httpProxyServerAddress](self, "httpProxyServerAddress");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setHttpProxyServerAddress:](v5, "setHttpProxyServerAddress:", v45);

    -[WFNetworkSettingsConfig httpProxyServerPort](self, "httpProxyServerPort");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setHttpProxyServerPort:](v5, "setHttpProxyServerPort:", v47);

    -[WFNetworkSettingsConfig setHttpProxyAuthenticationRequired:](v5, "setHttpProxyAuthenticationRequired:", -[WFNetworkSettingsConfig httpProxyAuthenticationRequired](self, "httpProxyAuthenticationRequired"));
    -[WFNetworkSettingsConfig httpProxyUsername](self, "httpProxyUsername");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setHttpProxyUsername:](v5, "setHttpProxyUsername:", v49);

    -[WFNetworkSettingsConfig httpProxyPassword](self, "httpProxyPassword");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setHttpProxyPassword:](v5, "setHttpProxyPassword:", v51);

    -[WFNetworkSettingsConfig httpProxyConfigPAC](self, "httpProxyConfigPAC");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copyWithZone:", a3);
    -[WFNetworkSettingsConfig setHttpProxyConfigPAC:](v5, "setHttpProxyConfigPAC:", v53);

  }
  return v5;
}

- (BOOL)validProxyConfiguration
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  void *v13;

  if (-[WFNetworkSettingsConfig httpProxyConfig](self, "httpProxyConfig") != 1)
    goto LABEL_10;
  -[WFNetworkSettingsConfig httpProxyServerAddress](self, "httpProxyServerAddress");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  v4 = (void *)v3;
  -[WFNetworkSettingsConfig httpProxyServerAddress](self, "httpProxyServerAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmpty");

  if ((v6 & 1) != 0)
    goto LABEL_6;
  -[WFNetworkSettingsConfig httpProxyServerPort](self, "httpProxyServerPort");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[WFNetworkSettingsConfig httpProxyServerPort](self, "httpProxyServerPort"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEmpty"),
        v9,
        v8,
        (v10 & 1) != 0))
  {
LABEL_6:
    LOBYTE(v11) = 0;
    return v11;
  }
  if (!-[WFNetworkSettingsConfig httpProxyAuthenticationRequired](self, "httpProxyAuthenticationRequired"))
  {
LABEL_10:
    LOBYTE(v11) = 1;
    return v11;
  }
  -[WFNetworkSettingsConfig httpProxyUsername](self, "httpProxyUsername");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[WFNetworkSettingsConfig httpProxyUsername](self, "httpProxyUsername");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "isEmpty") ^ 1;

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)validIPv4Configuration
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;

  if (-[WFNetworkSettingsConfig ipv4Config](self, "ipv4Config") != 2)
  {
LABEL_12:
    LOBYTE(v3) = 1;
    return v3;
  }
  -[WFNetworkSettingsConfig ipv4AddressManual](self, "ipv4AddressManual");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WFNetworkSettingsConfig ipv4AddressManual](self, "ipv4AddressManual");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEmpty"))
    {
LABEL_4:

LABEL_13:
      LOBYTE(v3) = 0;
      return v3;
    }
    -[WFNetworkSettingsConfig ipv4AddressManual](self, "ipv4AddressManual");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isValidIPv4Address");

    if (!v7)
      goto LABEL_13;
    -[WFNetworkSettingsConfig ipv4SubnetMaskManual](self, "ipv4SubnetMaskManual");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[WFNetworkSettingsConfig ipv4SubnetMaskManual](self, "ipv4SubnetMaskManual");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEmpty"))
        goto LABEL_4;
      -[WFNetworkSettingsConfig ipv4SubnetMaskManual](self, "ipv4SubnetMaskManual");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isValidSubnetMask");

      if (!v9)
        goto LABEL_13;
      -[WFNetworkSettingsConfig ipv4RouterAddressManual](self, "ipv4RouterAddressManual");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v4 = (void *)v10;
        -[WFNetworkSettingsConfig ipv4RouterAddressManual](self, "ipv4RouterAddressManual");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "isEmpty"))
          goto LABEL_4;
        -[WFNetworkSettingsConfig ipv4RouterAddressManual](self, "ipv4RouterAddressManual");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isValidIPv4Address");

        if (!v12)
          goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  return v3;
}

- (BOOL)validIPv6Configuration
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  if (-[WFNetworkSettingsConfig ipv6Config](self, "ipv6Config") != 1)
    goto LABEL_5;
  -[WFNetworkSettingsConfig ipv6AddressManual](self, "ipv6AddressManual");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WFNetworkSettingsConfig ipv6AddressManual](self, "ipv6AddressManual");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if ((v6 & 1) != 0)
    {
      LOBYTE(v3) = 0;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[WFNetworkSettingsConfig isEqualToNetworkSettingsConfig:](self, "isEqualToNetworkSettingsConfig:", v4);

  return v5;
}

- (BOOL)isEqualToNetworkSettingsConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int64_t v23;
  int v24;
  int v25;
  int v26;
  double v27;
  double v28;
  double v29;
  char v30;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  int64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  int64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  int v103;
  int64_t v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  int v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;

  v4 = a3;
  -[WFNetworkSettingsConfig ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_20;
  -[WFNetworkSettingsConfig displayFriendlyName](self, "displayFriendlyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayFriendlyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_20;
  v11 = -[WFNetworkSettingsConfig current](self, "current");
  if (v11 != objc_msgSend(v4, "current"))
    goto LABEL_20;
  v12 = -[WFNetworkSettingsConfig forgetable](self, "forgetable");
  if (v12 != objc_msgSend(v4, "forgetable"))
    goto LABEL_20;
  v13 = -[WFNetworkSettingsConfig joinable](self, "joinable");
  if (v13 != objc_msgSend(v4, "joinable"))
    goto LABEL_20;
  v14 = -[WFNetworkSettingsConfig manageable](self, "manageable");
  if (v14 != objc_msgSend(v4, "manageable"))
    goto LABEL_20;
  v15 = -[WFNetworkSettingsConfig cloudSyncable](self, "cloudSyncable");
  if (v15 != objc_msgSend(v4, "cloudSyncable"))
    goto LABEL_20;
  v16 = -[WFNetworkSettingsConfig canRenewLease](self, "canRenewLease");
  if (v16 != objc_msgSend(v4, "canRenewLease"))
    goto LABEL_20;
  v17 = -[WFNetworkSettingsConfig autoJoinConfigurable](self, "autoJoinConfigurable");
  if (v17 != objc_msgSend(v4, "autoJoinConfigurable"))
    goto LABEL_20;
  v18 = -[WFNetworkSettingsConfig autoJoinEnabled](self, "autoJoinEnabled");
  if (v18 != objc_msgSend(v4, "autoJoinEnabled"))
    goto LABEL_20;
  v19 = -[WFNetworkSettingsConfig autoLoginConfigurable](self, "autoLoginConfigurable");
  if (v19 != objc_msgSend(v4, "autoLoginConfigurable"))
    goto LABEL_20;
  v20 = -[WFNetworkSettingsConfig autoLoginEnabled](self, "autoLoginEnabled");
  if (v20 != objc_msgSend(v4, "autoLoginEnabled"))
    goto LABEL_20;
  v21 = -[WFNetworkSettingsConfig saveDataModeConfigurable](self, "saveDataModeConfigurable");
  if (v21 != objc_msgSend(v4, "saveDataModeConfigurable"))
    goto LABEL_20;
  v22 = -[WFNetworkSettingsConfig isInSaveDataMode](self, "isInSaveDataMode");
  if (v22 != objc_msgSend(v4, "isInSaveDataMode"))
    goto LABEL_20;
  v23 = -[WFNetworkSettingsConfig privacyProxyTierStatus](self, "privacyProxyTierStatus");
  if (v23 != objc_msgSend(v4, "privacyProxyTierStatus"))
    goto LABEL_20;
  v24 = -[WFNetworkSettingsConfig privacyProxyEnabled](self, "privacyProxyEnabled");
  if (v24 != objc_msgSend(v4, "privacyProxyEnabled"))
    goto LABEL_20;
  v25 = -[WFNetworkSettingsConfig wifiOutrankEnabled](self, "wifiOutrankEnabled");
  if (v25 != objc_msgSend(v4, "wifiOutrankEnabled"))
    goto LABEL_20;
  v26 = -[WFNetworkSettingsConfig networkQualityVisible](self, "networkQualityVisible");
  if (v26 != objc_msgSend(v4, "networkQualityVisible"))
    goto LABEL_20;
  -[WFNetworkSettingsConfig networkQualityResponsiveness](self, "networkQualityResponsiveness");
  v28 = v27;
  objc_msgSend(v4, "networkQualityResponsiveness");
  if (v28 != v29)
    goto LABEL_20;
  -[WFNetworkSettingsConfig networkQualityDate](self, "networkQualityDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32 || (objc_msgSend(v4, "networkQualityDate"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig networkQualityDate](self, "networkQualityDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkQualityDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (v32)
    {

      if (!v35)
        goto LABEL_20;
    }
    else
    {

      if ((v35 & 1) == 0)
        goto LABEL_20;
    }
  }
  v36 = -[WFNetworkSettingsConfig ipv4Config](self, "ipv4Config");
  if (v36 != objc_msgSend(v4, "ipv4Config"))
    goto LABEL_20;
  -[WFNetworkSettingsConfig ipv4Address](self, "ipv4Address");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37 || (objc_msgSend(v4, "ipv4Address"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv4Address](self, "ipv4Address");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv4Address");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqualToString:", v39);

    if (v37)
    {

      if (!v40)
        goto LABEL_20;
    }
    else
    {

      if ((v40 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv4AddressManual](self, "ipv4AddressManual");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 || (objc_msgSend(v4, "ipv4AddressManual"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv4AddressManual](self, "ipv4AddressManual");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv4AddressManual");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "isEqualToString:", v43);

    if (v41)
    {

      if (!v44)
        goto LABEL_20;
    }
    else
    {

      if ((v44 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv4SubnetMask](self, "ipv4SubnetMask");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45 || (objc_msgSend(v4, "ipv4SubnetMask"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv4SubnetMask](self, "ipv4SubnetMask");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv4SubnetMask");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqualToString:", v47);

    if (v45)
    {

      if (!v48)
        goto LABEL_20;
    }
    else
    {

      if ((v48 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv4SubnetMaskManual](self, "ipv4SubnetMaskManual");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49 || (objc_msgSend(v4, "ipv4SubnetMaskManual"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv4SubnetMaskManual](self, "ipv4SubnetMaskManual");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv4SubnetMaskManual");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqualToString:", v51);

    if (v49)
    {

      if (!v52)
        goto LABEL_20;
    }
    else
    {

      if ((v52 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv4RouterAddress](self, "ipv4RouterAddress");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53 || (objc_msgSend(v4, "ipv4RouterAddress"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv4RouterAddress](self, "ipv4RouterAddress");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv4RouterAddress");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqualToString:", v55);

    if (v53)
    {

      if (!v56)
        goto LABEL_20;
    }
    else
    {

      if ((v56 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv4RouterAddressManual](self, "ipv4RouterAddressManual");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57 || (objc_msgSend(v4, "ipv4RouterAddressManual"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv4RouterAddressManual](self, "ipv4RouterAddressManual");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv4RouterAddressManual");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqualToString:", v59);

    if (v57)
    {

      if (!v60)
        goto LABEL_20;
    }
    else
    {

      if ((v60 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig dhcpClientID](self, "dhcpClientID");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61 || (objc_msgSend(v4, "dhcpClientID"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig dhcpClientID](self, "dhcpClientID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dhcpClientID");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqualToString:", v63);

    if (v61)
    {

      if (!v64)
        goto LABEL_20;
    }
    else
    {

      if ((v64 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig dhcpLeaseExpirationDate](self, "dhcpLeaseExpirationDate");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65 || (objc_msgSend(v4, "dhcpLeaseExpirationDate"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig dhcpLeaseExpirationDate](self, "dhcpLeaseExpirationDate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dhcpLeaseExpirationDate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (v65)
    {

      if (!v68)
        goto LABEL_20;
    }
    else
    {

      if ((v68 & 1) == 0)
        goto LABEL_20;
    }
  }
  v69 = -[WFNetworkSettingsConfig ipv6Config](self, "ipv6Config");
  if (v69 != objc_msgSend(v4, "ipv6Config"))
    goto LABEL_20;
  -[WFNetworkSettingsConfig ipv6Addresses](self, "ipv6Addresses");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70 || (objc_msgSend(v4, "ipv6Addresses"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6Addresses](self, "ipv6Addresses");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv6Addresses");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v71, "isEqualToArray:", v72);

    if (v70)
    {

      if (!v73)
        goto LABEL_20;
    }
    else
    {

      if ((v73 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv6PrefixLengths](self, "ipv6PrefixLengths");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74 || (objc_msgSend(v4, "ipv6PrefixLengths"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6PrefixLengths](self, "ipv6PrefixLengths");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv6PrefixLengths");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqualToArray:", v76);

    if (v74)
    {

      if (!v77)
        goto LABEL_20;
    }
    else
    {

      if ((v77 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv6AddressManual](self, "ipv6AddressManual");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78 || (objc_msgSend(v4, "ipv6AddressManual"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6AddressManual](self, "ipv6AddressManual");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv6AddressManual");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqualToString:", v80);

    if (v78)
    {

      if (!v81)
        goto LABEL_20;
    }
    else
    {

      if ((v81 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv6RouterAddress](self, "ipv6RouterAddress");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82 || (objc_msgSend(v4, "ipv6RouterAddress"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6RouterAddress](self, "ipv6RouterAddress");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv6RouterAddress");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqualToString:", v84);

    if (v82)
    {

      if (!v85)
        goto LABEL_20;
    }
    else
    {

      if ((v85 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv6RouterAddressManual](self, "ipv6RouterAddressManual");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v86 || (objc_msgSend(v4, "ipv6RouterAddressManual"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6RouterAddressManual](self, "ipv6RouterAddressManual");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv6RouterAddressManual");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "isEqualToString:", v88);

    if (v86)
    {

      if (!v89)
        goto LABEL_20;
    }
    else
    {

      if ((v89 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig ipv6PrefixLengthManual](self, "ipv6PrefixLengthManual");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90 || (objc_msgSend(v4, "ipv6PrefixLengthManual"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6PrefixLengthManual](self, "ipv6PrefixLengthManual");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv6PrefixLengthManual");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v91, "isEqualToString:", v92);

    if (v90)
    {

      if (!v93)
        goto LABEL_20;
    }
    else
    {

      if ((v93 & 1) == 0)
        goto LABEL_20;
    }
  }
  v94 = -[WFNetworkSettingsConfig dnsConfig](self, "dnsConfig");
  if (v94 != objc_msgSend(v4, "dnsConfig"))
    goto LABEL_20;
  -[WFNetworkSettingsConfig dnsServerAddresses](self, "dnsServerAddresses");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95 || (objc_msgSend(v4, "dnsServerAddresses"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig dnsServerAddresses](self, "dnsServerAddresses");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dnsServerAddresses");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v96, "isEqualToArray:", v97);

    if (v95)
    {

      if (!v98)
        goto LABEL_20;
    }
    else
    {

      if ((v98 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig dnsSearchDomains](self, "dnsSearchDomains");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99 || (objc_msgSend(v4, "dnsSearchDomains"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig dnsSearchDomains](self, "dnsSearchDomains");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dnsSearchDomains");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqualToArray:", v101);

    if (v99)
    {

      if (!v102)
        goto LABEL_20;
    }
    else
    {

      if ((v102 & 1) == 0)
        goto LABEL_20;
    }
  }
  v103 = -[WFNetworkSettingsConfig httpProxyConfigurable](self, "httpProxyConfigurable");
  if (v103 != objc_msgSend(v4, "httpProxyConfigurable"))
    goto LABEL_20;
  v104 = -[WFNetworkSettingsConfig httpProxyConfig](self, "httpProxyConfig");
  if (v104 != objc_msgSend(v4, "httpProxyConfig"))
    goto LABEL_20;
  -[WFNetworkSettingsConfig httpProxyServerAddress](self, "httpProxyServerAddress");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (v105 || (objc_msgSend(v4, "httpProxyServerAddress"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig httpProxyServerAddress](self, "httpProxyServerAddress");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "httpProxyServerAddress");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v106, "isEqualToString:", v107);

    if (v105)
    {

      if (!v108)
        goto LABEL_20;
    }
    else
    {

      if ((v108 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig httpProxyServerPort](self, "httpProxyServerPort");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109 || (objc_msgSend(v4, "httpProxyServerPort"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig httpProxyServerPort](self, "httpProxyServerPort");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "httpProxyServerPort");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v110, "isEqualToString:", v111);

    if (v109)
    {

      if (!v112)
        goto LABEL_20;
    }
    else
    {

      if ((v112 & 1) == 0)
        goto LABEL_20;
    }
  }
  v113 = -[WFNetworkSettingsConfig httpProxyAuthenticationRequired](self, "httpProxyAuthenticationRequired");
  if (v113 != objc_msgSend(v4, "httpProxyAuthenticationRequired"))
    goto LABEL_20;
  -[WFNetworkSettingsConfig httpProxyUsername](self, "httpProxyUsername");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (v114 || (objc_msgSend(v4, "httpProxyUsername"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig httpProxyUsername](self, "httpProxyUsername");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "httpProxyUsername");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v115, "isEqualToString:", v116);

    if (v114)
    {

      if (!v117)
        goto LABEL_20;
    }
    else
    {

      if ((v117 & 1) == 0)
        goto LABEL_20;
    }
  }
  -[WFNetworkSettingsConfig httpProxyPassword](self, "httpProxyPassword");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v118)
  {
    objc_msgSend(v4, "httpProxyPassword");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_154:
      -[WFNetworkSettingsConfig httpProxyConfigPAC](self, "httpProxyConfigPAC");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      if (v122 || (objc_msgSend(v4, "httpProxyConfigPAC"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[WFNetworkSettingsConfig httpProxyConfigPAC](self, "httpProxyConfigPAC");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "httpProxyConfigPAC");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = objc_msgSend(v123, "isEqualToString:", v124) ^ 1;

        if (v122)
        {
LABEL_160:

          v30 = v125 ^ 1;
          goto LABEL_21;
        }
      }
      else
      {
        LOBYTE(v125) = 0;
      }

      goto LABEL_160;
    }
  }
  -[WFNetworkSettingsConfig httpProxyPassword](self, "httpProxyPassword");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "httpProxyPassword");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v119, "isEqualToString:", v120);

  if (!v118)
  {

    if ((v121 & 1) == 0)
      goto LABEL_20;
    goto LABEL_154;
  }

  if (v121)
    goto LABEL_154;
LABEL_20:
  v30 = 0;
LABEL_21:

  return v30;
}

- (id)changesBetweenConfig:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int64_t v21;
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
  int64_t v33;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v104;
  void *v105;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFNetworkSettingsConfig autoJoinEnabled](self, "autoJoinEnabled");
  if (v10 != objc_msgSend(v8, "autoJoinEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "autoJoinEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("autoJoinEnabled"));

  }
  v12 = -[WFNetworkSettingsConfig autoLoginEnabled](self, "autoLoginEnabled");
  if (v12 != objc_msgSend(v8, "autoLoginEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "autoLoginEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("autoLoginEnabled"));

  }
  v14 = -[WFNetworkSettingsConfig isInSaveDataMode](self, "isInSaveDataMode");
  if (v14 != objc_msgSend(v8, "isInSaveDataMode"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "isInSaveDataMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("isInSaveDataMode"));

  }
  v16 = -[WFNetworkSettingsConfig privacyProxyEnabled](self, "privacyProxyEnabled");
  if (v16 != objc_msgSend(v8, "privacyProxyEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "privacyProxyEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("privacyProxyEnabled"));

  }
  v18 = -[WFNetworkSettingsConfig wifiOutrankEnabled](self, "wifiOutrankEnabled");
  if (v18 != objc_msgSend(v8, "wifiOutrankEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "wifiOutrankEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("wifiOutrankEnabled"));

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[WFNetworkSettingsConfig ipv4Config](self, "ipv4Config");
  if (v21 != objc_msgSend(v8, "ipv4Config"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "ipv4Config"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("ipv4Config"));

  }
  v105 = v20;
  -[WFNetworkSettingsConfig ipv4AddressManual](self, "ipv4AddressManual");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 || (objc_msgSend(v8, "ipv4AddressManual"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv4AddressManual](self, "ipv4AddressManual");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ipv4AddressManual");
    v6 = objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend((id)v5, "isEqualToString:", v6);

    if (v23)
    {

      if ((v4 & 1) != 0)
        goto LABEL_23;
    }
    else
    {

      if ((v4 & 1) != 0)
        goto LABEL_23;
    }
    objc_msgSend(v8, "ipv4AddressManual");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v8, "ipv4AddressManual");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v3, CFSTR("ipv4AddressManual"));

    }
    else
    {
      objc_msgSend(v20, "setObject:forKey:", &stru_24DB39F78, CFSTR("ipv4AddressManual"));
    }

  }
LABEL_23:
  -[WFNetworkSettingsConfig ipv4SubnetMaskManual](self, "ipv4SubnetMaskManual");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 || (objc_msgSend(v8, "ipv4SubnetMaskManual"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv4SubnetMaskManual](self, "ipv4SubnetMaskManual");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ipv4SubnetMaskManual");
    v6 = objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend((id)v5, "isEqualToString:", v6);

    if (v25)
    {

      if ((v4 & 1) != 0)
        goto LABEL_33;
    }
    else
    {

      if ((v4 & 1) != 0)
        goto LABEL_33;
    }
    objc_msgSend(v8, "ipv4SubnetMaskManual");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v8, "ipv4SubnetMaskManual");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v3, CFSTR("ipv4SubnetMaskManual"));

    }
    else
    {
      objc_msgSend(v20, "setObject:forKey:", &stru_24DB39F78, CFSTR("ipv4SubnetMaskManual"));
    }

  }
LABEL_33:
  -[WFNetworkSettingsConfig ipv4RouterAddressManual](self, "ipv4RouterAddressManual");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27 || (objc_msgSend(v8, "ipv4RouterAddressManual"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv4RouterAddressManual](self, "ipv4RouterAddressManual");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ipv4RouterAddressManual");
    v6 = objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend((id)v5, "isEqualToString:", v6);

    if (v27)
    {

      if ((v4 & 1) != 0)
        goto LABEL_43;
    }
    else
    {

      if ((v4 & 1) != 0)
        goto LABEL_43;
    }
    objc_msgSend(v8, "ipv4RouterAddressManual");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v8, "ipv4RouterAddressManual");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v3, CFSTR("ipv4RouterAddressManual"));

    }
    else
    {
      objc_msgSend(v20, "setObject:forKey:", &stru_24DB39F78, CFSTR("ipv4RouterAddressManual"));
    }

  }
LABEL_43:
  -[WFNetworkSettingsConfig dhcpClientID](self, "dhcpClientID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 || (objc_msgSend(v8, "dhcpClientID"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig dhcpClientID](self, "dhcpClientID");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dhcpClientID");
    v6 = objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend((id)v5, "isEqualToString:", v6);

    if (v29)
    {

      if ((v4 & 1) != 0)
        goto LABEL_53;
    }
    else
    {

      if ((v4 & 1) != 0)
        goto LABEL_53;
    }
    objc_msgSend(v8, "dhcpClientID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v8, "dhcpClientID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v31, CFSTR("dhcpClientID"));

    }
    else
    {
      objc_msgSend(v20, "setObject:forKey:", &stru_24DB39F78, CFSTR("dhcpClientID"));
    }

  }
LABEL_53:
  if (objc_msgSend(v20, "count"))
    objc_msgSend(v104, "setObject:forKey:", v20, CFSTR("WFIPv4Changes"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[WFNetworkSettingsConfig ipv6Config](self, "ipv6Config");
  if (v33 != objc_msgSend(v8, "ipv6Config"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "ipv6Config"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKey:", v34, CFSTR("ipv6Config"));

  }
  -[WFNetworkSettingsConfig ipv6Addresses](self, "ipv6Addresses");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35 || (objc_msgSend(v8, "ipv6Addresses"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6Addresses](self, "ipv6Addresses");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ipv6Addresses");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)v6, "isEqualToArray:", v36);

    if (v35)
    {

      if ((v5 & 1) != 0)
        goto LABEL_67;
    }
    else
    {

      if ((v5 & 1) != 0)
        goto LABEL_67;
    }
    objc_msgSend(v8, "ipv6Addresses");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      objc_msgSend(v8, "ipv6Addresses");
    else
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKey:", v4, CFSTR("ipv6Addresses"));

  }
LABEL_67:
  -[WFNetworkSettingsConfig ipv6PrefixLengths](self, "ipv6PrefixLengths");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 || (objc_msgSend(v8, "ipv6PrefixLengths"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6PrefixLengths](self, "ipv6PrefixLengths");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ipv6PrefixLengths");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)v6, "isEqualToArray:", v39);

    if (v38)
    {

      if ((v5 & 1) != 0)
        goto LABEL_77;
    }
    else
    {

      if ((v5 & 1) != 0)
        goto LABEL_77;
    }
    objc_msgSend(v8, "ipv6PrefixLengths");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      objc_msgSend(v8, "ipv6PrefixLengths");
    else
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKey:", v4, CFSTR("ipv6PrefixLengths"));

  }
LABEL_77:
  -[WFNetworkSettingsConfig ipv6AddressManual](self, "ipv6AddressManual");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 || (objc_msgSend(v8, "ipv6AddressManual"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6AddressManual](self, "ipv6AddressManual");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ipv6AddressManual");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)v6, "isEqualToString:", v42);

    if (v41)
    {

      if ((v5 & 1) != 0)
        goto LABEL_87;
    }
    else
    {

      if ((v5 & 1) != 0)
        goto LABEL_87;
    }
    objc_msgSend(v8, "ipv6AddressManual");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v8, "ipv6AddressManual");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v4, CFSTR("ipv6AddressManual"));

    }
    else
    {
      objc_msgSend(v32, "setObject:forKey:", &stru_24DB39F78, CFSTR("ipv6AddressManual"));
    }

  }
LABEL_87:
  -[WFNetworkSettingsConfig ipv6RouterAddress](self, "ipv6RouterAddress");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44 || (objc_msgSend(v8, "ipv6RouterAddress"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6RouterAddress](self, "ipv6RouterAddress");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ipv6RouterAddress");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)v6, "isEqualToString:", v45);

    if (v44)
    {

      if ((v5 & 1) != 0)
        goto LABEL_97;
    }
    else
    {

      if ((v5 & 1) != 0)
        goto LABEL_97;
    }
    objc_msgSend(v8, "ipv6RouterAddress");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v8, "ipv6RouterAddress");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v4, CFSTR("ipv6RouterAddress"));

    }
    else
    {
      objc_msgSend(v32, "setObject:forKey:", &stru_24DB39F78, CFSTR("ipv6RouterAddress"));
    }

  }
LABEL_97:
  -[WFNetworkSettingsConfig ipv6RouterAddressManual](self, "ipv6RouterAddressManual");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47 || (objc_msgSend(v8, "ipv6RouterAddressManual"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6RouterAddressManual](self, "ipv6RouterAddressManual");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ipv6RouterAddressManual");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)v6, "isEqualToString:", v48);

    if (v47)
    {

      if ((v5 & 1) != 0)
        goto LABEL_107;
    }
    else
    {

      if ((v5 & 1) != 0)
        goto LABEL_107;
    }
    objc_msgSend(v8, "ipv6RouterAddressManual");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v8, "ipv6RouterAddressManual");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v4, CFSTR("ipv6RouterAddressManual"));

    }
    else
    {
      objc_msgSend(v32, "setObject:forKey:", &stru_24DB39F78, CFSTR("ipv6RouterAddressManual"));
    }

  }
LABEL_107:
  -[WFNetworkSettingsConfig ipv6PrefixLengthManual](self, "ipv6PrefixLengthManual");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50 || (objc_msgSend(v8, "ipv6PrefixLengthManual"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig ipv6PrefixLengthManual](self, "ipv6PrefixLengthManual");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ipv6PrefixLengthManual");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)v6, "isEqualToString:", v51);

    if (v50)
    {

      if ((v5 & 1) != 0)
        goto LABEL_117;
    }
    else
    {

      if ((v5 & 1) != 0)
        goto LABEL_117;
    }
    objc_msgSend(v8, "ipv6PrefixLengthManual");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v8, "ipv6PrefixLengthManual");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v53, CFSTR("ipv6PrefixLengthManual"));

    }
    else
    {
      objc_msgSend(v32, "setObject:forKey:", &stru_24DB39F78, CFSTR("ipv6PrefixLengthManual"));
    }

  }
LABEL_117:
  if (objc_msgSend(v32, "count"))
    objc_msgSend(v104, "setObject:forKey:", v32, CFSTR("WFIPv6Changes"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[WFNetworkSettingsConfig dnsConfig](self, "dnsConfig");
  if (v55 != objc_msgSend(v8, "dnsConfig"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "dnsConfig"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKey:", v56, CFSTR("dnsConfig"));

  }
  -[WFNetworkSettingsConfig dnsServerAddresses](self, "dnsServerAddresses");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57 || (objc_msgSend(v8, "dnsServerAddresses"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig dnsServerAddresses](self, "dnsServerAddresses");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dnsServerAddresses");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v58, "isEqualToArray:", v59);

    if (v57)
    {

      if ((v6 & 1) != 0)
        goto LABEL_131;
    }
    else
    {

      if ((v6 & 1) != 0)
        goto LABEL_131;
    }
    objc_msgSend(v8, "dnsServerAddresses");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
      objc_msgSend(v8, "dnsServerAddresses");
    else
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKey:", v5, CFSTR("dnsServerAddresses"));

  }
LABEL_131:
  -[WFNetworkSettingsConfig dnsSearchDomains](self, "dnsSearchDomains");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61 || (objc_msgSend(v8, "dnsSearchDomains"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig dnsSearchDomains](self, "dnsSearchDomains");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dnsSearchDomains");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v62, "isEqualToArray:", v63);

    if (v61)
    {

      if ((v6 & 1) != 0)
        goto LABEL_141;
    }
    else
    {

      if ((v6 & 1) != 0)
        goto LABEL_141;
    }
    objc_msgSend(v8, "dnsSearchDomains");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
      objc_msgSend(v8, "dnsSearchDomains");
    else
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKey:", v65, CFSTR("dnsSearchDomains"));

  }
LABEL_141:
  if (objc_msgSend(v54, "count"))
    objc_msgSend(v104, "setObject:forKey:", v54, CFSTR("WFDNSChangesKey"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[WFNetworkSettingsConfig httpProxyConfig](self, "httpProxyConfig");
  if (v67 != objc_msgSend(v8, "httpProxyConfig"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "httpProxyConfig"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setObject:forKey:", v68, CFSTR("httpProxyConfig"));

  }
  -[WFNetworkSettingsConfig httpProxyServerAddress](self, "httpProxyServerAddress");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69 || (objc_msgSend(v8, "httpProxyServerAddress"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig httpProxyServerAddress](self, "httpProxyServerAddress");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "httpProxyServerAddress");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqualToString:", v71);

    if (v69)
    {

      if ((v72 & 1) != 0)
        goto LABEL_155;
    }
    else
    {

      if ((v72 & 1) != 0)
        goto LABEL_155;
    }
    objc_msgSend(v8, "httpProxyServerAddress");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      objc_msgSend(v8, "httpProxyServerAddress");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKey:", v74, CFSTR("httpProxyServerAddress"));

    }
    else
    {
      objc_msgSend(v66, "setObject:forKey:", &stru_24DB39F78, CFSTR("httpProxyServerAddress"));
    }

  }
LABEL_155:
  -[WFNetworkSettingsConfig httpProxyServerPort](self, "httpProxyServerPort");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75 || (objc_msgSend(v8, "httpProxyServerPort"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig httpProxyServerPort](self, "httpProxyServerPort");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "httpProxyServerPort");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v76, "isEqualToString:", v77);

    if (v75)
    {

      if ((v78 & 1) != 0)
        goto LABEL_165;
    }
    else
    {

      if ((v78 & 1) != 0)
        goto LABEL_165;
    }
    objc_msgSend(v8, "httpProxyServerPort");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79)
    {
      objc_msgSend(v8, "httpProxyServerPort");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKey:", v80, CFSTR("httpProxyServerPort"));

    }
    else
    {
      objc_msgSend(v66, "setObject:forKey:", &stru_24DB39F78, CFSTR("httpProxyServerPort"));
    }

  }
LABEL_165:
  v81 = -[WFNetworkSettingsConfig httpProxyAuthenticationRequired](self, "httpProxyAuthenticationRequired");
  if (v81 != objc_msgSend(v8, "httpProxyAuthenticationRequired"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "httpProxyAuthenticationRequired"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setObject:forKey:", v82, CFSTR("httpProxyAuthenticationRequired"));

  }
  -[WFNetworkSettingsConfig httpProxyUsername](self, "httpProxyUsername");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83 || (objc_msgSend(v8, "httpProxyUsername"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig httpProxyUsername](self, "httpProxyUsername");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "httpProxyUsername");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v84, "isEqualToString:", v85);

    if (v83)
    {

      if ((v86 & 1) != 0)
        goto LABEL_177;
    }
    else
    {

      if ((v86 & 1) != 0)
        goto LABEL_177;
    }
    objc_msgSend(v8, "httpProxyUsername");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      objc_msgSend(v8, "httpProxyUsername");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKey:", v88, CFSTR("httpProxyUsername"));

    }
    else
    {
      objc_msgSend(v66, "setObject:forKey:", &stru_24DB39F78, CFSTR("httpProxyUsername"));
    }

  }
LABEL_177:
  -[WFNetworkSettingsConfig httpProxyPassword](self, "httpProxyPassword");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89 || (objc_msgSend(v8, "httpProxyPassword"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig httpProxyPassword](self, "httpProxyPassword");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "httpProxyPassword");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqualToString:", v91);

    if (v89)
    {

      if ((v92 & 1) != 0)
        goto LABEL_187;
    }
    else
    {

      if ((v92 & 1) != 0)
        goto LABEL_187;
    }
    objc_msgSend(v8, "httpProxyPassword");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (v93)
    {
      objc_msgSend(v8, "httpProxyPassword");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKey:", v94, CFSTR("httpProxyPassword"));

    }
    else
    {
      objc_msgSend(v66, "setObject:forKey:", &stru_24DB39F78, CFSTR("httpProxyPassword"));
    }

  }
LABEL_187:
  -[WFNetworkSettingsConfig httpProxyConfigPAC](self, "httpProxyConfigPAC");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95 || (objc_msgSend(v8, "httpProxyConfigPAC"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFNetworkSettingsConfig httpProxyConfigPAC](self, "httpProxyConfigPAC");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "httpProxyConfigPAC");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v96, "isEqualToString:", v97);

    if (v95)
    {

      if ((v98 & 1) != 0)
        goto LABEL_197;
    }
    else
    {

      if ((v98 & 1) != 0)
        goto LABEL_197;
    }
    objc_msgSend(v8, "httpProxyConfigPAC");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      objc_msgSend(v8, "httpProxyConfigPAC");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKey:", v100, CFSTR("httpProxyConfigPAC"));

    }
    else
    {
      objc_msgSend(v66, "setObject:forKey:", &stru_24DB39F78, CFSTR("httpProxyConfigPAC"));
    }

  }
LABEL_197:
  v101 = v104;
  if (objc_msgSend(v66, "count"))
    objc_msgSend(v104, "setObject:forKey:", v66, CFSTR("WFProxyChangesKey"));
  if (!objc_msgSend(v104, "count"))
  {

    v101 = 0;
  }
  v102 = v101;

  return v102;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayFriendlyName
{
  return self->_displayFriendlyName;
}

- (void)setDisplayFriendlyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)current
{
  return self->_current;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (BOOL)forgetable
{
  return self->_forgetable;
}

- (void)setForgetable:(BOOL)a3
{
  self->_forgetable = a3;
}

- (BOOL)joinable
{
  return self->_joinable;
}

- (void)setJoinable:(BOOL)a3
{
  self->_joinable = a3;
}

- (BOOL)manageable
{
  return self->_manageable;
}

- (void)setManageable:(BOOL)a3
{
  self->_manageable = a3;
}

- (BOOL)cloudSyncable
{
  return self->_cloudSyncable;
}

- (void)setCloudSyncable:(BOOL)a3
{
  self->_cloudSyncable = a3;
}

- (BOOL)canRenewLease
{
  return self->_canRenewLease;
}

- (void)setCanRenewLease:(BOOL)a3
{
  self->_canRenewLease = a3;
}

- (BOOL)diagnosable
{
  return self->_diagnosable;
}

- (void)setDiagnosable:(BOOL)a3
{
  self->_diagnosable = a3;
}

- (BOOL)autoJoinConfigurable
{
  return self->_autoJoinConfigurable;
}

- (void)setAutoJoinConfigurable:(BOOL)a3
{
  self->_autoJoinConfigurable = a3;
}

- (BOOL)autoJoinEnabled
{
  return self->_autoJoinEnabled;
}

- (void)setAutoJoinEnabled:(BOOL)a3
{
  self->_autoJoinEnabled = a3;
}

- (BOOL)autoLoginConfigurable
{
  return self->_autoLoginConfigurable;
}

- (void)setAutoLoginConfigurable:(BOOL)a3
{
  self->_autoLoginConfigurable = a3;
}

- (BOOL)autoLoginEnabled
{
  return self->_autoLoginEnabled;
}

- (void)setAutoLoginEnabled:(BOOL)a3
{
  self->_autoLoginEnabled = a3;
}

- (BOOL)saveDataModeConfigurable
{
  return self->_saveDataModeConfigurable;
}

- (void)setSaveDataModeConfigurable:(BOOL)a3
{
  self->_saveDataModeConfigurable = a3;
}

- (BOOL)privacyProxyConfigurable
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

- (BOOL)isInSaveDataMode
{
  return self->_isInSaveDataMode;
}

- (void)setIsInSaveDataMode:(BOOL)a3
{
  self->_isInSaveDataMode = a3;
}

- (BOOL)privacyProxyEnabled
{
  return self->_privacyProxyEnabled;
}

- (void)setPrivacyProxyEnabled:(BOOL)a3
{
  self->_privacyProxyEnabled = a3;
}

- (BOOL)wifiOutrankEnabled
{
  return self->_wifiOutrankEnabled;
}

- (void)setWifiOutrankEnabled:(BOOL)a3
{
  self->_wifiOutrankEnabled = a3;
}

- (BOOL)networkQualityVisible
{
  return self->_networkQualityVisible;
}

- (void)setNetworkQualityVisible:(BOOL)a3
{
  self->_networkQualityVisible = a3;
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
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNetworkQualityDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSArray)healthRecommendations
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHealthRecommendations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (int64_t)ipv4Config
{
  return self->_ipv4Config;
}

- (void)setIpv4Config:(int64_t)a3
{
  self->_ipv4Config = a3;
}

- (NSString)ipv4Address
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIpv4Address:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)ipv4AddressManual
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIpv4AddressManual:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSString)ipv4SubnetMask
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIpv4SubnetMask:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)ipv4SubnetMaskManual
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIpv4SubnetMaskManual:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)ipv4RouterAddress
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIpv4RouterAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSString)ipv4RouterAddressManual
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIpv4RouterAddressManual:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSString)dhcpClientID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDhcpClientID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSDate)dhcpLeaseExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDhcpLeaseExpirationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (int64_t)ipv6Config
{
  return self->_ipv6Config;
}

- (void)setIpv6Config:(int64_t)a3
{
  self->_ipv6Config = a3;
}

- (NSArray)ipv6Addresses
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setIpv6Addresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSArray)ipv6PrefixLengths
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setIpv6PrefixLengths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)ipv6AddressManual
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIpv6AddressManual:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSString)ipv6RouterAddress
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setIpv6RouterAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSString)ipv6RouterAddressManual
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setIpv6RouterAddressManual:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSString)ipv6PrefixLengthManual
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setIpv6PrefixLengthManual:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (int64_t)dnsConfig
{
  return self->_dnsConfig;
}

- (void)setDnsConfig:(int64_t)a3
{
  self->_dnsConfig = a3;
}

- (NSArray)dnsServerAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDnsServerAddresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSArray)dnsSearchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setDnsSearchDomains:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (BOOL)httpProxyConfigurable
{
  return self->_httpProxyConfigurable;
}

- (void)setHttpProxyConfigurable:(BOOL)a3
{
  self->_httpProxyConfigurable = a3;
}

- (int64_t)httpProxyConfig
{
  return self->_httpProxyConfig;
}

- (void)setHttpProxyConfig:(int64_t)a3
{
  self->_httpProxyConfig = a3;
}

- (NSString)httpProxyServerAddress
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHttpProxyServerAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (NSString)httpProxyServerPort
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setHttpProxyServerPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (BOOL)httpProxyAuthenticationRequired
{
  return self->_httpProxyAuthenticationRequired;
}

- (void)setHttpProxyAuthenticationRequired:(BOOL)a3
{
  self->_httpProxyAuthenticationRequired = a3;
}

- (NSString)httpProxyUsername
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setHttpProxyUsername:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (NSString)httpProxyPassword
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setHttpProxyPassword:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (NSString)httpProxyConfigPAC
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setHttpProxyConfigPAC:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpProxyConfigPAC, 0);
  objc_storeStrong((id *)&self->_httpProxyPassword, 0);
  objc_storeStrong((id *)&self->_httpProxyUsername, 0);
  objc_storeStrong((id *)&self->_httpProxyServerPort, 0);
  objc_storeStrong((id *)&self->_httpProxyServerAddress, 0);
  objc_storeStrong((id *)&self->_dnsSearchDomains, 0);
  objc_storeStrong((id *)&self->_dnsServerAddresses, 0);
  objc_storeStrong((id *)&self->_ipv6PrefixLengthManual, 0);
  objc_storeStrong((id *)&self->_ipv6RouterAddressManual, 0);
  objc_storeStrong((id *)&self->_ipv6RouterAddress, 0);
  objc_storeStrong((id *)&self->_ipv6AddressManual, 0);
  objc_storeStrong((id *)&self->_ipv6PrefixLengths, 0);
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_dhcpLeaseExpirationDate, 0);
  objc_storeStrong((id *)&self->_dhcpClientID, 0);
  objc_storeStrong((id *)&self->_ipv4RouterAddressManual, 0);
  objc_storeStrong((id *)&self->_ipv4RouterAddress, 0);
  objc_storeStrong((id *)&self->_ipv4SubnetMaskManual, 0);
  objc_storeStrong((id *)&self->_ipv4SubnetMask, 0);
  objc_storeStrong((id *)&self->_ipv4AddressManual, 0);
  objc_storeStrong((id *)&self->_ipv4Address, 0);
  objc_storeStrong((id *)&self->_healthRecommendations, 0);
  objc_storeStrong((id *)&self->_networkQualityDate, 0);
  objc_storeStrong((id *)&self->_displayFriendlyName, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
