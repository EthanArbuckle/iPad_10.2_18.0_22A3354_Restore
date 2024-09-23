@implementation W5WiFiStatus

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5WiFiStatus;
  -[W5WiFiStatus dealloc](&v3, sel_dealloc);
}

- (void)setIpv4Addresses:(id)a3
{
  NSArray *ipv4Addresses;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  ipv4Addresses = self->_ipv4Addresses;
  if (ipv4Addresses != a3)
  {

    self->_ipv4Addresses = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_ipv4Addresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setIpv6Addresses:(id)a3
{
  NSArray *ipv6Addresses;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  ipv6Addresses = self->_ipv6Addresses;
  if (ipv6Addresses != a3)
  {

    self->_ipv6Addresses = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_ipv6Addresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setDnsAddresses:(id)a3
{
  NSArray *dnsAddresses;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  dnsAddresses = self->_dnsAddresses;
  if (dnsAddresses != a3)
  {

    self->_dnsAddresses = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_dnsAddresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setCachedScanResults:(id)a3
{
  NSArray *cachedScanResults;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  cachedScanResults = self->_cachedScanResults;
  if (cachedScanResults != a3)
  {

    self->_cachedScanResults = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_cachedScanResults = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setSupportedChannels:(id)a3
{
  NSArray *supportedChannels;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  supportedChannels = self->_supportedChannels;
  if (supportedChannels != a3)
  {

    self->_supportedChannels = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_supportedChannels = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setLinkQualityUpdates:(id)a3
{
  NSArray *linkQualityUpdates;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  linkQualityUpdates = self->_linkQualityUpdates;
  if (linkQualityUpdates != a3)
  {

    self->_linkQualityUpdates = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_linkQualityUpdates = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  void *v3;
  const char *v4;
  NSUInteger v5;
  const void *v6;
  _BOOL4 v7;
  const char *v8;
  NSArray *linkQualityUpdates;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSArray *ipv4Addresses;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSArray *ipv6Addresses;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  NSArray *dnsAddresses;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  NSData *btcConfig;
  char *v30;
  char *v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  NSData *v39;
  char *v40;
  char *v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  const void *v49;
  NSData *txChainPower;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  __int128 v54;
  NSData *desense;
  const void *v56;
  const void *v57;
  const char *v58;
  const char *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[28];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("MAC Address: %@ (hw=%@)\n"), self->_macAddress, self->_hardwareMACAddress);
  objc_msgSend(v3, "appendFormat:", CFSTR("Interface Name: %@\n"), self->_interfaceName);
  if (self->_powerOn)
    v4 = "On";
  else
    v4 = "Off";
  v5 = -[NSData length](self->_power, "length");
  v6 = 0;
  if (v5 == 24)
    v6 = -[NSData bytes](self->_power, "bytes");
  objc_msgSend(v3, "appendFormat:", CFSTR("Power: %s [%@]\n"), v4, W5DescriptionForPower((uint64_t)v6));
  objc_msgSend(v3, "appendFormat:", CFSTR("Mode: %@\n"), W5DescriptionForOpMode(self->_opMode));
  objc_msgSend(v3, "appendFormat:", CFSTR("SSID: %@ (%@)\n"), self->_ssidString, self->_ssid);
  objc_msgSend(v3, "appendFormat:", CFSTR("BSSID: %@\n"), self->_bssid);
  objc_msgSend(v3, "appendFormat:", CFSTR("RSSI: %ld\n"), self->_rssi);
  objc_msgSend(v3, "appendFormat:", CFSTR("CCA: %ld\n"), self->_cca);
  objc_msgSend(v3, "appendFormat:", CFSTR("Noise: %ld\n"), self->_noise);
  objc_msgSend(v3, "appendFormat:", CFSTR("Tx Rate: %.1f\n"), *(_QWORD *)&self->_txRate);
  objc_msgSend(v3, "appendFormat:", CFSTR("Security: %@\n"), W5DescriptionForSecurity(self->_security));
  objc_msgSend(v3, "appendFormat:", CFSTR("EAPOL Mode: %@\n"), W5DescriptionForEAPOLControlMode(self->_eapolControlMode));
  objc_msgSend(v3, "appendFormat:", CFSTR("EAPOL Supplicant: %@\n"), W5DescriptionForEAPOLSupplicantState(self->_eapolSupplicantState));
  objc_msgSend(v3, "appendFormat:", CFSTR("PHY Mode: %@\n"), W5DescriptionForPHYMode(self->_phyMode));
  objc_msgSend(v3, "appendFormat:", CFSTR("MCS Index: %ld\n"), self->_mcsIndex);
  objc_msgSend(v3, "appendFormat:", CFSTR("Guard Interval: %ld\n"), self->_guardInterval);
  objc_msgSend(v3, "appendFormat:", CFSTR("NSS: %ld\n"), self->_numberOfSpacialStreams);
  objc_msgSend(v3, "appendFormat:", CFSTR("Channel: %@\n"), -[W5WiFiChannel description](self->_channel, "description"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Country Code: %@\n"), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("Supported Channels: %@\n"), -[NSArray componentsJoinedByString:](self->_supportedChannels, "componentsJoinedByString:", CFSTR(",")));
  v7 = -[NSArray containsObject:](self->_capabilities, "containsObject:", &unk_24C24DFE0);
  v8 = "No";
  if (v7)
    v8 = "Yes";
  objc_msgSend(v3, "appendFormat:", CFSTR("Supports 6e: %s\n"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("Scan Cache Count: %lu\n"), -[NSArray count](self->_cachedScanResults, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Link Quality Updates: %lu\n"), -[NSArray count](self->_linkQualityUpdates, "count"));
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  linkQualityUpdates = self->_linkQualityUpdates;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](linkQualityUpdates, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v82 != v12)
          objc_enumerationMutation(linkQualityUpdates);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i));
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](linkQualityUpdates, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
    }
    while (v11);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("NetworkServiceID: %@\n"), self->_networkServiceID);
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv4ConfigMethod: %@\n"), W5DescriptionForIPv4ConfigMethod(self->_ipv4ConfigMethod));
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv4 Addresses: %lu\n"), -[NSArray count](self->_ipv4Addresses, "count"));
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  ipv4Addresses = self->_ipv4Addresses;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](ipv4Addresses, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v78 != v17)
          objc_enumerationMutation(ipv4Addresses);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j));
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](ipv4Addresses, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
    }
    while (v16);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv4 Router: %@\n"), self->_ipv4RouterAddress);
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv6ConfigMethod: %@\n"), W5DescriptionForIPv6ConfigMethod(self->_ipv6ConfigMethod));
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv6 Addresses: %lu\n"), -[NSArray count](self->_ipv6Addresses, "count"));
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  ipv6Addresses = self->_ipv6Addresses;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](ipv6Addresses, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v74;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v74 != v22)
          objc_enumerationMutation(ipv6Addresses);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k));
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](ipv6Addresses, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
    }
    while (v21);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv6 Router: %@\n"), self->_ipv6RouterAddress);
  objc_msgSend(v3, "appendFormat:", CFSTR("DNS Addresses: %lu\n"), -[NSArray count](self->_dnsAddresses, "count"));
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  dnsAddresses = self->_dnsAddresses;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](dnsAddresses, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v70;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v70 != v27)
          objc_enumerationMutation(dnsAddresses);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * m));
      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](dnsAddresses, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
    }
    while (v26);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("BTC Mode: %@\n"), W5DescriptionForBTCMode(self->_btcMode));
  btcConfig = self->_btcConfig;
  if (btcConfig)
  {
    if (self->_btcProfiles2GHz)
    {
      -[NSData length](btcConfig, "length");
      v30 = *(_DWORD *)(-[NSData bytes](self->_btcConfig, "bytes") + 4) ? "Enabled" : "Disabled";
      objc_msgSend(v3, "appendFormat:", CFSTR("BTC Profile 2.4 GHz: %s\n"), v30);
      -[NSData length](self->_btcConfig, "length");
      if (*(_DWORD *)(-[NSData bytes](self->_btcConfig, "bytes") + 4))
      {
        -[NSData length](self->_btcProfiles2GHz, "length");
        if (*(_DWORD *)(-[NSData bytes](self->_btcProfiles2GHz, "bytes") + 8))
        {
          if (-[NSData length](self->_btcProfiles2GHz, "length") == 572)
            v31 = -[NSData bytes](self->_btcProfiles2GHz, "bytes");
          else
            v31 = 0;
          -[NSData length](self->_btcConfig, "length");
          v32 = &v31[140 * *(unsigned int *)(-[NSData bytes](self->_btcConfig, "bytes") + 8)];
          v61 = *(_OWORD *)(v32 + 12);
          v33 = *(_OWORD *)(v32 + 28);
          v34 = *(_OWORD *)(v32 + 44);
          v35 = *(_OWORD *)(v32 + 76);
          v64 = *(_OWORD *)(v32 + 60);
          v65 = v35;
          v62 = v33;
          v63 = v34;
          v36 = *(_OWORD *)(v32 + 92);
          v37 = *(_OWORD *)(v32 + 108);
          v38 = *(_OWORD *)(v32 + 124);
          *(_OWORD *)&v68[12] = *(_OWORD *)(v32 + 136);
          v67 = v37;
          *(_OWORD *)v68 = v38;
          v66 = v36;
          objc_msgSend(v3, "appendString:", W5DescriptionForBTCProfile((unsigned int *)&v61, (uint64_t)CFSTR("\t")));
        }
      }
    }
    v39 = self->_btcConfig;
    if (v39 && self->_btcProfiles5GHz)
    {
      -[NSData length](v39, "length");
      v40 = *(_DWORD *)(-[NSData bytes](self->_btcConfig, "bytes") + 12) ? "Enabled" : "Disabled";
      objc_msgSend(v3, "appendFormat:", CFSTR("BTC Profile 5 GHz: %s\n"), v40);
      -[NSData length](self->_btcConfig, "length");
      if (*(_DWORD *)(-[NSData bytes](self->_btcConfig, "bytes") + 12))
      {
        -[NSData length](self->_btcProfiles5GHz, "length");
        if (*(_DWORD *)(-[NSData bytes](self->_btcProfiles5GHz, "bytes") + 8))
        {
          if (-[NSData length](self->_btcProfiles5GHz, "length") == 572)
            v41 = -[NSData bytes](self->_btcProfiles5GHz, "bytes");
          else
            v41 = 0;
          -[NSData length](self->_btcConfig, "length");
          v42 = &v41[140 * *(unsigned int *)(-[NSData bytes](self->_btcConfig, "bytes") + 16)];
          v61 = *(_OWORD *)(v42 + 12);
          v43 = *(_OWORD *)(v42 + 28);
          v44 = *(_OWORD *)(v42 + 44);
          v45 = *(_OWORD *)(v42 + 76);
          v64 = *(_OWORD *)(v42 + 60);
          v65 = v45;
          v62 = v43;
          v63 = v44;
          v46 = *(_OWORD *)(v42 + 92);
          v47 = *(_OWORD *)(v42 + 108);
          v48 = *(_OWORD *)(v42 + 124);
          *(_OWORD *)&v68[12] = *(_OWORD *)(v42 + 136);
          v67 = v47;
          *(_OWORD *)v68 = v48;
          v66 = v46;
          objc_msgSend(v3, "appendString:", W5DescriptionForBTCProfile((unsigned int *)&v61, (uint64_t)CFSTR("\t")));
        }
      }
    }
  }
  if (-[NSData length](self->_chainAck, "length") == 24)
    v49 = -[NSData bytes](self->_chainAck, "bytes");
  else
    v49 = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR("Chain Ack: [%@]\n"), W5DescriptionForChainAck((uint64_t)v49));
  txChainPower = self->_txChainPower;
  if (txChainPower)
  {
    -[NSData length](txChainPower, "length");
    if (*(_DWORD *)(-[NSData bytes](self->_txChainPower, "bytes") + 4))
    {
      -[NSData length](self->_txChainPower, "length");
      if (*(int *)(-[NSData bytes](self->_txChainPower, "bytes") + 4) >= 1)
      {
        v51 = 0;
        v52 = 8;
        do
        {
          -[NSData length](self->_txChainPower, "length");
          objc_msgSend(v3, "appendFormat:", CFSTR("Tx Chain Power[%i]: %@\n"), v51, W5DescriptionForChainPowerState(*(unsigned int *)(-[NSData bytes](self->_txChainPower, "bytes") + v52)));
          -[NSData length](self->_txChainPower, "length");
          if (*(_DWORD *)(-[NSData bytes](self->_txChainPower, "bytes") + v52) == 2)
          {
            if (-[NSData length](self->_txChainPower, "length") == 88)
              v53 = -[NSData bytes](self->_txChainPower, "bytes");
            else
              v53 = 0;
            v54 = *(_OWORD *)&v53[v52];
            LODWORD(v62) = *(_DWORD *)&v53[v52 + 16];
            v61 = v54;
            objc_msgSend(v3, "appendString:", W5DescriptionForTxChainPower((unsigned int *)&v61, (uint64_t)CFSTR("\t")));
          }
          ++v51;
          -[NSData length](self->_txChainPower, "length");
          v52 += 20;
        }
        while (v51 < *(int *)(-[NSData bytes](self->_txChainPower, "bytes") + 4));
      }
    }
  }
  desense = self->_desense;
  if (desense && self->_desenseLevel)
  {
    if (-[NSData length](desense, "length") == 16)
      v56 = -[NSData bytes](self->_desense, "bytes");
    else
      v56 = 0;
    if (-[NSData length](self->_desenseLevel, "length") == 8)
      v57 = -[NSData bytes](self->_desenseLevel, "bytes");
    else
      v57 = 0;
    objc_msgSend(v3, "appendFormat:", CFSTR("Desense: %@\n"), W5DescriptionForDesense((uint64_t)v56, (uint64_t)v57));
  }
  if (self->_smartCCADesenseSupported)
    v58 = "Supported";
  else
    v58 = "Not Supported";
  objc_msgSend(v3, "appendFormat:", CFSTR("SmartCCA/Desense: %s (USB=%d)\n"), v58, self->_smartCCADesenseUSBPresence);
  if (self->_isSnifferSupported)
    v59 = "Supported";
  else
    v59 = "Not Supported";
  objc_msgSend(v3, "appendFormat:", CFSTR("Sniffer: %s\n"), v59);
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5WiFiStatus;
  if (-[W5WiFiStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToWiFiStatus:(id)a3
{
  NSString *macAddress;
  int v6;
  NSString *hardwareMACAddress;
  NSString *interfaceName;
  NSArray *capabilities;
  int powerOn;
  int opMode;
  NSString *ssidString;
  NSData *ssid;
  NSString *bssid;
  int64_t rssi;
  unint64_t cca;
  int64_t noise;
  unint64_t txRate;
  double v19;
  int64_t security;
  unsigned int eapolControlMode;
  unsigned int eapolSupplicantState;
  int phyMode;
  unint64_t mcsIndex;
  unint64_t guardInterval;
  unint64_t numberOfSpacialStreams;
  W5WiFiChannel *channel;
  NSArray *supportedChannels;
  NSString *countryCode;
  NSString *networkServiceID;
  int64_t ipv4ConfigMethod;
  int64_t ipv6ConfigMethod;
  NSArray *ipv4Addresses;
  NSArray *ipv6Addresses;
  NSString *ipv4RouterAddress;
  NSString *ipv6RouterAddress;
  NSArray *dnsAddresses;
  NSData *chainAck;
  NSData *txChainPower;
  NSData *desense;
  NSData *desenseLevel;
  NSData *btcConfig;
  NSData *btcProfiles2GHz;
  NSData *btcProfiles5GHz;
  int btcMode;
  NSArray *linkQualityUpdates;
  W5WiFiScanResult *lastJoinedScanResult;
  W5WiFiPreferredNetwork *lastJoinedPreferredNetwork;
  NSArray *cachedScanResults;
  int smartCCADesenseSupported;
  int smartCCADesenseUSBPresence;
  int isSnifferSupported;

  macAddress = self->_macAddress;
  if (!macAddress)
  {
    if (!objc_msgSend(a3, "macAddress"))
      goto LABEL_5;
    macAddress = self->_macAddress;
  }
  v6 = -[NSString isEqual:](macAddress, "isEqual:", objc_msgSend(a3, "macAddress"));
  if (!v6)
    return v6;
LABEL_5:
  hardwareMACAddress = self->_hardwareMACAddress;
  if (!hardwareMACAddress)
  {
    if (!objc_msgSend(a3, "hardwareMACAddress"))
      goto LABEL_9;
    hardwareMACAddress = self->_hardwareMACAddress;
  }
  v6 = -[NSString isEqual:](hardwareMACAddress, "isEqual:", objc_msgSend(a3, "hardwareMACAddress"));
  if (!v6)
    return v6;
LABEL_9:
  interfaceName = self->_interfaceName;
  if (!interfaceName)
  {
    if (!objc_msgSend(a3, "interfaceName"))
      goto LABEL_13;
    interfaceName = self->_interfaceName;
  }
  v6 = -[NSString isEqual:](interfaceName, "isEqual:", objc_msgSend(a3, "interfaceName"));
  if (!v6)
    return v6;
LABEL_13:
  capabilities = self->_capabilities;
  if (!capabilities)
  {
    if (!objc_msgSend(a3, "capabilities"))
      goto LABEL_17;
    capabilities = self->_capabilities;
  }
  v6 = -[NSArray isEqual:](capabilities, "isEqual:", objc_msgSend(a3, "capabilities"));
  if (!v6)
    return v6;
LABEL_17:
  powerOn = self->_powerOn;
  if (powerOn != objc_msgSend(a3, "powerOn"))
    goto LABEL_129;
  v6 = -[NSData isEqualToData:](self->_power, "isEqualToData:", objc_msgSend(a3, "power"));
  if (!v6)
    return v6;
  opMode = self->_opMode;
  if (opMode != objc_msgSend(a3, "opMode"))
    goto LABEL_129;
  ssidString = self->_ssidString;
  if (!ssidString)
  {
    if (!objc_msgSend(a3, "ssidString"))
      goto LABEL_24;
    ssidString = self->_ssidString;
  }
  v6 = -[NSString isEqual:](ssidString, "isEqual:", objc_msgSend(a3, "ssidString"));
  if (!v6)
    return v6;
LABEL_24:
  ssid = self->_ssid;
  if (!ssid)
  {
    if (!objc_msgSend(a3, "ssid"))
      goto LABEL_28;
    ssid = self->_ssid;
  }
  v6 = -[NSData isEqual:](ssid, "isEqual:", objc_msgSend(a3, "ssid"));
  if (!v6)
    return v6;
LABEL_28:
  bssid = self->_bssid;
  if (!bssid)
  {
    if (!objc_msgSend(a3, "bssid"))
      goto LABEL_32;
    bssid = self->_bssid;
  }
  v6 = -[NSString isEqual:](bssid, "isEqual:", objc_msgSend(a3, "bssid"));
  if (!v6)
    return v6;
LABEL_32:
  rssi = self->_rssi;
  if (rssi != objc_msgSend(a3, "rssi"))
    goto LABEL_129;
  cca = self->_cca;
  if (cca != objc_msgSend(a3, "cca"))
    goto LABEL_129;
  noise = self->_noise;
  if (noise != objc_msgSend(a3, "noise"))
    goto LABEL_129;
  txRate = (unint64_t)self->_txRate;
  objc_msgSend(a3, "txRate");
  if (txRate != (unint64_t)v19)
    goto LABEL_129;
  security = self->_security;
  if (security != objc_msgSend(a3, "security"))
    goto LABEL_129;
  eapolControlMode = self->_eapolControlMode;
  if (eapolControlMode != objc_msgSend(a3, "eapolControlMode"))
    goto LABEL_129;
  eapolSupplicantState = self->_eapolSupplicantState;
  if (eapolSupplicantState != objc_msgSend(a3, "eapolSupplicantState"))
    goto LABEL_129;
  phyMode = self->_phyMode;
  if (phyMode != objc_msgSend(a3, "phyMode"))
    goto LABEL_129;
  mcsIndex = self->_mcsIndex;
  if (mcsIndex != objc_msgSend(a3, "mcsIndex"))
    goto LABEL_129;
  guardInterval = self->_guardInterval;
  if (guardInterval != objc_msgSend(a3, "guardInterval"))
    goto LABEL_129;
  numberOfSpacialStreams = self->_numberOfSpacialStreams;
  if (numberOfSpacialStreams != objc_msgSend(a3, "numberOfSpacialStreams"))
    goto LABEL_129;
  channel = self->_channel;
  if (!channel)
  {
    if (!objc_msgSend(a3, "channel"))
      goto LABEL_47;
    channel = self->_channel;
  }
  v6 = -[W5WiFiChannel isEqual:](channel, "isEqual:", objc_msgSend(a3, "channel"));
  if (!v6)
    return v6;
LABEL_47:
  supportedChannels = self->_supportedChannels;
  if (!supportedChannels)
  {
    if (!objc_msgSend(a3, "supportedChannels"))
      goto LABEL_51;
    supportedChannels = self->_supportedChannels;
  }
  v6 = -[NSArray isEqual:](supportedChannels, "isEqual:", objc_msgSend(a3, "supportedChannels"));
  if (!v6)
    return v6;
LABEL_51:
  countryCode = self->_countryCode;
  if (!countryCode)
  {
    if (!objc_msgSend(a3, "countryCode"))
      goto LABEL_55;
    countryCode = self->_countryCode;
  }
  v6 = -[NSString isEqual:](countryCode, "isEqual:", objc_msgSend(a3, "countryCode"));
  if (!v6)
    return v6;
LABEL_55:
  networkServiceID = self->_networkServiceID;
  if (!networkServiceID)
  {
    if (!objc_msgSend(a3, "networkServiceID"))
      goto LABEL_59;
    networkServiceID = self->_networkServiceID;
  }
  v6 = -[NSString isEqual:](networkServiceID, "isEqual:", objc_msgSend(a3, "networkServiceID"));
  if (!v6)
    return v6;
LABEL_59:
  ipv4ConfigMethod = self->_ipv4ConfigMethod;
  if (ipv4ConfigMethod != objc_msgSend(a3, "ipv4ConfigMethod"))
    goto LABEL_129;
  ipv6ConfigMethod = self->_ipv6ConfigMethod;
  if (ipv6ConfigMethod != objc_msgSend(a3, "ipv6ConfigMethod"))
    goto LABEL_129;
  ipv4Addresses = self->_ipv4Addresses;
  if (!ipv4Addresses)
  {
    if (!objc_msgSend(a3, "ipv4Addresses"))
      goto LABEL_65;
    ipv4Addresses = self->_ipv4Addresses;
  }
  v6 = -[NSArray isEqual:](ipv4Addresses, "isEqual:", objc_msgSend(a3, "ipv4Addresses"));
  if (!v6)
    return v6;
LABEL_65:
  ipv6Addresses = self->_ipv6Addresses;
  if (!ipv6Addresses)
  {
    if (!objc_msgSend(a3, "ipv6Addresses"))
      goto LABEL_69;
    ipv6Addresses = self->_ipv6Addresses;
  }
  v6 = -[NSArray isEqual:](ipv6Addresses, "isEqual:", objc_msgSend(a3, "ipv6Addresses"));
  if (!v6)
    return v6;
LABEL_69:
  ipv4RouterAddress = self->_ipv4RouterAddress;
  if (!ipv4RouterAddress)
  {
    if (!objc_msgSend(a3, "ipv4RouterAddress"))
      goto LABEL_73;
    ipv4RouterAddress = self->_ipv4RouterAddress;
  }
  v6 = -[NSString isEqual:](ipv4RouterAddress, "isEqual:", objc_msgSend(a3, "ipv4RouterAddress"));
  if (!v6)
    return v6;
LABEL_73:
  ipv6RouterAddress = self->_ipv6RouterAddress;
  if (!ipv6RouterAddress)
  {
    if (!objc_msgSend(a3, "ipv6RouterAddress"))
      goto LABEL_77;
    ipv6RouterAddress = self->_ipv6RouterAddress;
  }
  v6 = -[NSString isEqual:](ipv6RouterAddress, "isEqual:", objc_msgSend(a3, "ipv6RouterAddress"));
  if (!v6)
    return v6;
LABEL_77:
  dnsAddresses = self->_dnsAddresses;
  if (!dnsAddresses)
  {
    if (!objc_msgSend(a3, "dnsAddresses"))
      goto LABEL_81;
    dnsAddresses = self->_dnsAddresses;
  }
  v6 = -[NSArray isEqual:](dnsAddresses, "isEqual:", objc_msgSend(a3, "dnsAddresses"));
  if (!v6)
    return v6;
LABEL_81:
  chainAck = self->_chainAck;
  if (!chainAck)
  {
    if (!objc_msgSend(a3, "chainAck"))
      goto LABEL_85;
    chainAck = self->_chainAck;
  }
  v6 = -[NSData isEqualToData:](chainAck, "isEqualToData:", objc_msgSend(a3, "chainAck"));
  if (!v6)
    return v6;
LABEL_85:
  txChainPower = self->_txChainPower;
  if (!txChainPower)
  {
    if (!objc_msgSend(a3, "txChainPower"))
      goto LABEL_89;
    txChainPower = self->_txChainPower;
  }
  v6 = -[NSData isEqualToData:](txChainPower, "isEqualToData:", objc_msgSend(a3, "txChainPower"));
  if (!v6)
    return v6;
LABEL_89:
  desense = self->_desense;
  if (!desense)
  {
    if (!objc_msgSend(a3, "desense"))
      goto LABEL_93;
    desense = self->_desense;
  }
  v6 = -[NSData isEqualToData:](desense, "isEqualToData:", objc_msgSend(a3, "desense"));
  if (!v6)
    return v6;
LABEL_93:
  desenseLevel = self->_desenseLevel;
  if (!desenseLevel)
  {
    if (!objc_msgSend(a3, "desenseLevel"))
      goto LABEL_97;
    desenseLevel = self->_desenseLevel;
  }
  v6 = -[NSData isEqualToData:](desenseLevel, "isEqualToData:", objc_msgSend(a3, "desenseLevel"));
  if (!v6)
    return v6;
LABEL_97:
  btcConfig = self->_btcConfig;
  if (!btcConfig)
  {
    if (!objc_msgSend(a3, "btcConfig"))
      goto LABEL_101;
    btcConfig = self->_btcConfig;
  }
  v6 = -[NSData isEqualToData:](btcConfig, "isEqualToData:", objc_msgSend(a3, "btcConfig"));
  if (!v6)
    return v6;
LABEL_101:
  btcProfiles2GHz = self->_btcProfiles2GHz;
  if (!btcProfiles2GHz)
  {
    if (!objc_msgSend(a3, "btcProfiles2GHz"))
      goto LABEL_105;
    btcProfiles2GHz = self->_btcProfiles2GHz;
  }
  v6 = -[NSData isEqualToData:](btcProfiles2GHz, "isEqualToData:", objc_msgSend(a3, "btcProfiles2GHz"));
  if (!v6)
    return v6;
LABEL_105:
  btcProfiles5GHz = self->_btcProfiles5GHz;
  if (!btcProfiles5GHz)
  {
    if (!objc_msgSend(a3, "btcProfiles5GHz"))
      goto LABEL_109;
    btcProfiles5GHz = self->_btcProfiles5GHz;
  }
  v6 = -[NSData isEqualToData:](btcProfiles5GHz, "isEqualToData:", objc_msgSend(a3, "btcProfiles5GHz"));
  if (!v6)
    return v6;
LABEL_109:
  btcMode = self->_btcMode;
  if (btcMode != objc_msgSend(a3, "btcMode"))
    goto LABEL_129;
  linkQualityUpdates = self->_linkQualityUpdates;
  if (!linkQualityUpdates)
  {
    if (!objc_msgSend(a3, "linkQualityUpdates"))
      goto LABEL_114;
    linkQualityUpdates = self->_linkQualityUpdates;
  }
  v6 = -[NSArray isEqual:](linkQualityUpdates, "isEqual:", objc_msgSend(a3, "linkQualityUpdates"));
  if (!v6)
    return v6;
LABEL_114:
  lastJoinedScanResult = self->_lastJoinedScanResult;
  if (!lastJoinedScanResult)
  {
    if (!objc_msgSend(a3, "lastJoinedScanResult"))
      goto LABEL_118;
    lastJoinedScanResult = self->_lastJoinedScanResult;
  }
  v6 = -[W5WiFiScanResult isEqual:](lastJoinedScanResult, "isEqual:", objc_msgSend(a3, "lastJoinedScanResult"));
  if (!v6)
    return v6;
LABEL_118:
  lastJoinedPreferredNetwork = self->_lastJoinedPreferredNetwork;
  if (lastJoinedPreferredNetwork)
    goto LABEL_121;
  if (objc_msgSend(a3, "lastJoinedPreferredNetwork"))
  {
    lastJoinedPreferredNetwork = self->_lastJoinedPreferredNetwork;
LABEL_121:
    v6 = -[W5WiFiPreferredNetwork isEqual:](lastJoinedPreferredNetwork, "isEqual:", objc_msgSend(a3, "lastJoinedPreferredNetwork"));
    if (!v6)
      return v6;
  }
  cachedScanResults = self->_cachedScanResults;
  if (!cachedScanResults)
  {
    if (!objc_msgSend(a3, "cachedScanResults"))
    {
LABEL_126:
      smartCCADesenseSupported = self->_smartCCADesenseSupported;
      if (smartCCADesenseSupported == objc_msgSend(a3, "smartCCADesenseSupported"))
      {
        smartCCADesenseUSBPresence = self->_smartCCADesenseUSBPresence;
        if (smartCCADesenseUSBPresence == objc_msgSend(a3, "smartCCADesenseUSBPresence"))
        {
          isSnifferSupported = self->_isSnifferSupported;
          LOBYTE(v6) = isSnifferSupported == objc_msgSend(a3, "isSnifferSupported");
          return v6;
        }
      }
LABEL_129:
      LOBYTE(v6) = 0;
      return v6;
    }
    cachedScanResults = self->_cachedScanResults;
  }
  v6 = -[NSArray isEqual:](cachedScanResults, "isEqual:", objc_msgSend(a3, "cachedScanResults"));
  if (v6)
    goto LABEL_126;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5WiFiStatus isEqualToWiFiStatus:](self, "isEqualToWiFiStatus:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int btcMode;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int8x16_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  int64_t ipv6ConfigMethod;
  uint64_t v21;
  int64_t ipv4ConfigMethod;
  uint64_t v23;
  NSUInteger v24;
  int phyMode;
  unsigned int eapolSupplicantState;
  unsigned int eapolControlMode;
  int8x16_t v28;
  NSUInteger v29;
  int8x16_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t opMode;
  NSUInteger v38;
  uint64_t v39;
  BOOL powerOn;
  NSUInteger v41;
  uint64_t v42;
  uint64_t v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;

  v46 = -[NSString hash](self->_macAddress, "hash");
  v45 = -[NSString hash](self->_hardwareMACAddress, "hash");
  v44 = -[NSString hash](self->_interfaceName, "hash");
  v43 = -[NSArray hash](self->_capabilities, "hash");
  powerOn = self->_powerOn;
  v42 = -[NSData hash](self->_power, "hash");
  opMode = self->_opMode;
  v41 = -[NSString hash](self->_ssidString, "hash");
  v39 = -[NSData hash](self->_ssid, "hash");
  v38 = -[NSString hash](self->_bssid, "hash");
  v36 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_rssi), "hash");
  v35 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_cca), "hash");
  v34 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_noise), "hash");
  v33 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_txRate), "hash");
  eapolSupplicantState = self->_eapolSupplicantState;
  eapolControlMode = self->_eapolControlMode;
  phyMode = self->_phyMode;
  v30 = *(int8x16_t *)&self->_guardInterval;
  v28 = *(int8x16_t *)&self->_security;
  v32 = -[W5WiFiChannel hash](self->_channel, "hash");
  v31 = -[NSArray hash](self->_supportedChannels, "hash");
  v29 = -[NSString hash](self->_countryCode, "hash");
  v24 = -[NSString hash](self->_networkServiceID, "hash");
  ipv4ConfigMethod = self->_ipv4ConfigMethod;
  ipv6ConfigMethod = self->_ipv6ConfigMethod;
  v23 = -[NSArray hash](self->_ipv4Addresses, "hash");
  v21 = -[NSArray hash](self->_ipv6Addresses, "hash");
  v19 = -[NSString hash](self->_ipv4RouterAddress, "hash");
  v18 = -[NSString hash](self->_ipv6RouterAddress, "hash");
  v17 = -[NSArray hash](self->_dnsAddresses, "hash");
  v16 = -[NSData hash](self->_chainAck, "hash");
  v15 = -[NSData hash](self->_txChainPower, "hash");
  v3 = -[NSData hash](self->_desense, "hash");
  v4 = -[NSData hash](self->_desenseLevel, "hash");
  v5 = -[NSData hash](self->_btcConfig, "hash");
  btcMode = self->_btcMode;
  v7 = -[NSData hash](self->_btcProfiles2GHz, "hash");
  v8 = -[NSData hash](self->_btcProfiles5GHz, "hash");
  v9 = -[NSArray hash](self->_linkQualityUpdates, "hash");
  v10 = -[W5WiFiScanResult hash](self->_lastJoinedScanResult, "hash");
  v11 = -[W5WiFiPreferredNetwork hash](self->_lastJoinedPreferredNetwork, "hash");
  v12 = -[NSArray hash](self->_cachedScanResults, "hash");
  v13 = veorq_s8(v28, v30);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)) ^ ipv4ConfigMethod ^ ipv6ConfigMethod ^ opMode ^ eapolControlMode ^ eapolSupplicantState ^ phyMode ^ btcMode ^ v12 ^ v11 ^ v10 ^ v9 ^ powerOn ^ self->_smartCCADesenseSupported ^ self->_smartCCADesenseUSBPresence ^ self->_isSnifferSupported ^ v8 ^ v7 ^ v5 ^ v4 ^ v3 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v21 ^ v23 ^ v24 ^ v29 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v38 ^ v39 ^ v41 ^ v42 ^ v43 ^ v44 ^ v45 ^ v46;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5WiFiStatus *v4;

  v4 = -[W5WiFiStatus init](+[W5WiFiStatus allocWithZone:](W5WiFiStatus, "allocWithZone:", a3), "init");
  -[W5WiFiStatus setMacAddress:](v4, "setMacAddress:", self->_macAddress);
  -[W5WiFiStatus setHardwareMACAddress:](v4, "setHardwareMACAddress:", self->_hardwareMACAddress);
  -[W5WiFiStatus setInterfaceName:](v4, "setInterfaceName:", self->_interfaceName);
  -[W5WiFiStatus setCapabilities:](v4, "setCapabilities:", self->_capabilities);
  -[W5WiFiStatus setPower:](v4, "setPower:", self->_power);
  -[W5WiFiStatus setPowerOn:](v4, "setPowerOn:", self->_powerOn);
  -[W5WiFiStatus setOpMode:](v4, "setOpMode:", self->_opMode);
  -[W5WiFiStatus setSsidString:](v4, "setSsidString:", self->_ssidString);
  -[W5WiFiStatus setSsid:](v4, "setSsid:", self->_ssid);
  -[W5WiFiStatus setBssid:](v4, "setBssid:", self->_bssid);
  -[W5WiFiStatus setRssi:](v4, "setRssi:", self->_rssi);
  -[W5WiFiStatus setCca:](v4, "setCca:", self->_cca);
  -[W5WiFiStatus setNoise:](v4, "setNoise:", self->_noise);
  -[W5WiFiStatus setTxRate:](v4, "setTxRate:", self->_txRate);
  -[W5WiFiStatus setPhyMode:](v4, "setPhyMode:", self->_phyMode);
  -[W5WiFiStatus setMcsIndex:](v4, "setMcsIndex:", self->_mcsIndex);
  -[W5WiFiStatus setGuardInterval:](v4, "setGuardInterval:", self->_guardInterval);
  -[W5WiFiStatus setNumberOfSpacialStreams:](v4, "setNumberOfSpacialStreams:", self->_numberOfSpacialStreams);
  -[W5WiFiStatus setSecurity:](v4, "setSecurity:", self->_security);
  -[W5WiFiStatus setEapolControlMode:](v4, "setEapolControlMode:", self->_eapolControlMode);
  -[W5WiFiStatus setEapolSupplicantState:](v4, "setEapolSupplicantState:", self->_eapolSupplicantState);
  -[W5WiFiStatus setChannel:](v4, "setChannel:", self->_channel);
  -[W5WiFiStatus setSupportedChannels:](v4, "setSupportedChannels:", self->_supportedChannels);
  -[W5WiFiStatus setCountryCode:](v4, "setCountryCode:", self->_countryCode);
  -[W5WiFiStatus setNetworkServiceID:](v4, "setNetworkServiceID:", self->_networkServiceID);
  -[W5WiFiStatus setIpv4ConfigMethod:](v4, "setIpv4ConfigMethod:", self->_ipv4ConfigMethod);
  -[W5WiFiStatus setIpv6ConfigMethod:](v4, "setIpv6ConfigMethod:", self->_ipv6ConfigMethod);
  -[W5WiFiStatus setIpv4Addresses:](v4, "setIpv4Addresses:", self->_ipv4Addresses);
  -[W5WiFiStatus setIpv6Addresses:](v4, "setIpv6Addresses:", self->_ipv6Addresses);
  -[W5WiFiStatus setIpv4RouterAddress:](v4, "setIpv4RouterAddress:", self->_ipv4RouterAddress);
  -[W5WiFiStatus setIpv6RouterAddress:](v4, "setIpv6RouterAddress:", self->_ipv6RouterAddress);
  -[W5WiFiStatus setDnsAddresses:](v4, "setDnsAddresses:", self->_dnsAddresses);
  -[W5WiFiStatus setChainAck:](v4, "setChainAck:", self->_chainAck);
  -[W5WiFiStatus setTxChainPower:](v4, "setTxChainPower:", self->_txChainPower);
  -[W5WiFiStatus setDesense:](v4, "setDesense:", self->_desense);
  -[W5WiFiStatus setDesenseLevel:](v4, "setDesenseLevel:", self->_desenseLevel);
  -[W5WiFiStatus setBtcConfig:](v4, "setBtcConfig:", self->_btcConfig);
  -[W5WiFiStatus setBtcMode:](v4, "setBtcMode:", self->_btcMode);
  -[W5WiFiStatus setBtcProfiles2GHz:](v4, "setBtcProfiles2GHz:", self->_btcProfiles2GHz);
  -[W5WiFiStatus setBtcProfiles5GHz:](v4, "setBtcProfiles5GHz:", self->_btcProfiles5GHz);
  -[W5WiFiStatus setLinkQualityUpdates:](v4, "setLinkQualityUpdates:", self->_linkQualityUpdates);
  -[W5WiFiStatus setLastJoinedScanResult:](v4, "setLastJoinedScanResult:", self->_lastJoinedScanResult);
  -[W5WiFiStatus setLastJoinedPreferredNetwork:](v4, "setLastJoinedPreferredNetwork:", self->_lastJoinedPreferredNetwork);
  -[W5WiFiStatus setCachedScanResults:](v4, "setCachedScanResults:", self->_cachedScanResults);
  -[W5WiFiStatus setSmartCCADesenseSupported:](v4, "setSmartCCADesenseSupported:", self->_smartCCADesenseSupported);
  -[W5WiFiStatus setSmartCCADesenseUSBPresence:](v4, "setSmartCCADesenseUSBPresence:", self->_smartCCADesenseUSBPresence);
  -[W5WiFiStatus setIsSnifferSupported:](v4, "setIsSnifferSupported:", self->_isSnifferSupported);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_macAddress, CFSTR("_macAddress"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_hardwareMACAddress, CFSTR("_hardwareMACAddress"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_interfaceName, CFSTR("_interfaceName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_capabilities, CFSTR("_capabilities"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_powerOn, CFSTR("_powerOn"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_power, CFSTR("_power"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_opMode, CFSTR("_opMode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ssidString, CFSTR("_ssidString"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ssid, CFSTR("_ssid"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bssid, CFSTR("_bssid"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_rssi, CFSTR("_rssi"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_cca, CFSTR("_cca"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_noise, CFSTR("_noise"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_txRate"), self->_txRate);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_security, CFSTR("_security"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_eapolControlMode, CFSTR("_eapolControlMode"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_eapolSupplicantState, CFSTR("_eapolSupplicantState"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_phyMode, CFSTR("_phyMode"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_mcsIndex, CFSTR("_mcsIndex"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_guardInterval, CFSTR("_guardInterval"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_numberOfSpacialStreams, CFSTR("_numberOfSpacialStreams"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_channel, CFSTR("_channel"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_supportedChannels, CFSTR("_supportedChannels"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_countryCode, CFSTR("_countryCode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_networkServiceID, CFSTR("_networkServiceID"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_ipv4ConfigMethod, CFSTR("_ipv4ConfigMethod"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_ipv6ConfigMethod, CFSTR("_ipv6ConfigMethod"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ipv4Addresses, CFSTR("_ipv4Addresses"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ipv6Addresses, CFSTR("_ipv6Addresses"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ipv4RouterAddress, CFSTR("_ipv4RouterAddress"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ipv6RouterAddress, CFSTR("_ipv6RouterAddress"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_dnsAddresses, CFSTR("_dnsAddresses"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_chainAck, CFSTR("_chainAck"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_txChainPower, CFSTR("_txChainPower"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_desense, CFSTR("_desense"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_desenseLevel, CFSTR("_desenseLevel"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_btcConfig, CFSTR("_btcConfig"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_btcProfiles2GHz, CFSTR("_btcProfiles2GHz"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_btcProfiles5GHz, CFSTR("_btcProfiles5GHz"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_btcMode, CFSTR("_btcMode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_linkQualityUpdates, CFSTR("_linkQualityUpdates"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_lastJoinedScanResult, CFSTR("_lastJoinedScanResult"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_lastJoinedPreferredNetwork, CFSTR("_lastJoinedPreferredNetwork"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_cachedScanResults, CFSTR("_cachedScanResults"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_smartCCADesenseSupported, CFSTR("_smartCCADesenseSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_smartCCADesenseUSBPresence, CFSTR("_smartCCADesenseUSBPresence"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isSnifferSupported, CFSTR("_isSnifferSupported"));
}

- (W5WiFiStatus)initWithCoder:(id)a3
{
  W5WiFiStatus *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)W5WiFiStatus;
  v4 = -[W5WiFiStatus init](&v21, sel_init);
  if (v4)
  {
    v4->_macAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_macAddress")), "copy");
    v4->_hardwareMACAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hardwareMACAddress")), "copy");
    v4->_interfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interfaceName")), "copy");
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v4->_capabilities = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("_capabilities")), "copy");
    v4->_powerOn = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_powerOn"));
    v4->_power = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_power")), "copy");
    v4->_opMode = objc_msgSend(a3, "decodeIntForKey:", CFSTR("_opMode"));
    v4->_ssidString = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ssidString")), "copy");
    v4->_ssid = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ssid")), "copy");
    v4->_bssid = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bssid")), "copy");
    v4->_rssi = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_rssi"));
    v4->_cca = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_cca"));
    v4->_noise = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_noise"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_txRate"));
    v4->_txRate = v7;
    v4->_security = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_security"));
    v4->_eapolControlMode = objc_msgSend(a3, "decodeIntForKey:", CFSTR("_eapolControlMode"));
    v4->_eapolSupplicantState = objc_msgSend(a3, "decodeIntForKey:", CFSTR("_eapolSupplicantState"));
    v4->_phyMode = objc_msgSend(a3, "decodeIntForKey:", CFSTR("_phyMode"));
    v4->_mcsIndex = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_mcsIndex"));
    v4->_guardInterval = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_guardInterval"));
    v4->_numberOfSpacialStreams = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_numberOfSpacialStreams"));
    v4->_channel = (W5WiFiChannel *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_channel")), "copy");
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v4->_supportedChannels = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0), CFSTR("_supportedChannels")), "copy");
    v4->_countryCode = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_countryCode")), "copy");
    v4->_networkServiceID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_networkServiceID")), "copy");
    v4->_ipv4ConfigMethod = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_ipv4ConfigMethod"));
    v4->_ipv6ConfigMethod = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_ipv6ConfigMethod"));
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v4->_ipv4Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), CFSTR("_ipv4Addresses")), "copy");
    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    v4->_ipv6Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0), CFSTR("_ipv6Addresses")), "copy");
    v4->_ipv4RouterAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ipv4RouterAddress")), "copy");
    v4->_ipv6RouterAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ipv6RouterAddress")), "copy");
    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v4->_dnsAddresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0), CFSTR("_dnsAddresses")), "copy");
    v4->_chainAck = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_chainAck")), "copy");
    v4->_txChainPower = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_txChainPower")), "copy");
    v4->_desense = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_desense")), "copy");
    v4->_desenseLevel = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_desenseLevel")), "copy");
    v4->_btcConfig = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_btcConfig")), "copy");
    v4->_btcProfiles2GHz = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_btcProfiles2GHz")), "copy");
    v4->_btcProfiles5GHz = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_btcProfiles5GHz")), "copy");
    v4->_btcMode = objc_msgSend(a3, "decodeIntForKey:", CFSTR("_btcMode"));
    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v4->_linkQualityUpdates = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0), CFSTR("_linkQualityUpdates")), "copy");
    v4->_lastJoinedScanResult = (W5WiFiScanResult *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastJoinedScanResult")), "copy");
    v4->_lastJoinedPreferredNetwork = (W5WiFiPreferredNetwork *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastJoinedPreferredNetwork")), "copy");
    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    v4->_cachedScanResults = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0), CFSTR("_cachedScanResults")), "copy");
    v4->_smartCCADesenseSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_smartCCADesenseSupported"));
    v4->_smartCCADesenseUSBPresence = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_smartCCADesenseUSBPresence"));
    v4->_isSnifferSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isSnifferSupported"));
  }
  return v4;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)powerOn
{
  return self->_powerOn;
}

- (void)setPowerOn:(BOOL)a3
{
  self->_powerOn = a3;
}

- (NSData)power
{
  return self->_power;
}

- (void)setPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)opMode
{
  return self->_opMode;
}

- (void)setOpMode:(int)a3
{
  self->_opMode = a3;
}

- (NSString)ssidString
{
  return self->_ssidString;
}

- (void)setSsidString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (unint64_t)cca
{
  return self->_cca;
}

- (void)setCca:(unint64_t)a3
{
  self->_cca = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (double)txRate
{
  return self->_txRate;
}

- (void)setTxRate:(double)a3
{
  self->_txRate = a3;
}

- (int64_t)security
{
  return self->_security;
}

- (void)setSecurity:(int64_t)a3
{
  self->_security = a3;
}

- (unsigned)eapolControlMode
{
  return self->_eapolControlMode;
}

- (void)setEapolControlMode:(unsigned int)a3
{
  self->_eapolControlMode = a3;
}

- (unsigned)eapolSupplicantState
{
  return self->_eapolSupplicantState;
}

- (void)setEapolSupplicantState:(unsigned int)a3
{
  self->_eapolSupplicantState = a3;
}

- (int)phyMode
{
  return self->_phyMode;
}

- (void)setPhyMode:(int)a3
{
  self->_phyMode = a3;
}

- (unint64_t)mcsIndex
{
  return self->_mcsIndex;
}

- (void)setMcsIndex:(unint64_t)a3
{
  self->_mcsIndex = a3;
}

- (unint64_t)guardInterval
{
  return self->_guardInterval;
}

- (void)setGuardInterval:(unint64_t)a3
{
  self->_guardInterval = a3;
}

- (unint64_t)numberOfSpacialStreams
{
  return self->_numberOfSpacialStreams;
}

- (void)setNumberOfSpacialStreams:(unint64_t)a3
{
  self->_numberOfSpacialStreams = a3;
}

- (W5WiFiChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)linkQualityUpdates
{
  return self->_linkQualityUpdates;
}

- (NSArray)supportedChannels
{
  return self->_supportedChannels;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)networkServiceID
{
  return self->_networkServiceID;
}

- (void)setNetworkServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int64_t)ipv4ConfigMethod
{
  return self->_ipv4ConfigMethod;
}

- (void)setIpv4ConfigMethod:(int64_t)a3
{
  self->_ipv4ConfigMethod = a3;
}

- (int64_t)ipv6ConfigMethod
{
  return self->_ipv6ConfigMethod;
}

- (void)setIpv6ConfigMethod:(int64_t)a3
{
  self->_ipv6ConfigMethod = a3;
}

- (NSArray)ipv4Addresses
{
  return self->_ipv4Addresses;
}

- (NSArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (NSString)ipv4RouterAddress
{
  return self->_ipv4RouterAddress;
}

- (void)setIpv4RouterAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)ipv6RouterAddress
{
  return self->_ipv6RouterAddress;
}

- (void)setIpv6RouterAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSArray)dnsAddresses
{
  return self->_dnsAddresses;
}

- (int)btcMode
{
  return self->_btcMode;
}

- (void)setBtcMode:(int)a3
{
  self->_btcMode = a3;
}

- (NSData)chainAck
{
  return self->_chainAck;
}

- (void)setChainAck:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSData)txChainPower
{
  return self->_txChainPower;
}

- (void)setTxChainPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSData)desense
{
  return self->_desense;
}

- (void)setDesense:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSData)desenseLevel
{
  return self->_desenseLevel;
}

- (void)setDesenseLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSData)btcConfig
{
  return self->_btcConfig;
}

- (void)setBtcConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSData)btcProfiles2GHz
{
  return self->_btcProfiles2GHz;
}

- (void)setBtcProfiles2GHz:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSData)btcProfiles5GHz
{
  return self->_btcProfiles5GHz;
}

- (void)setBtcProfiles5GHz:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (W5WiFiScanResult)lastJoinedScanResult
{
  return self->_lastJoinedScanResult;
}

- (void)setLastJoinedScanResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (W5WiFiPreferredNetwork)lastJoinedPreferredNetwork
{
  return self->_lastJoinedPreferredNetwork;
}

- (void)setLastJoinedPreferredNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSArray)cachedScanResults
{
  return self->_cachedScanResults;
}

- (BOOL)smartCCADesenseSupported
{
  return self->_smartCCADesenseSupported;
}

- (void)setSmartCCADesenseSupported:(BOOL)a3
{
  self->_smartCCADesenseSupported = a3;
}

- (BOOL)smartCCADesenseUSBPresence
{
  return self->_smartCCADesenseUSBPresence;
}

- (void)setSmartCCADesenseUSBPresence:(BOOL)a3
{
  self->_smartCCADesenseUSBPresence = a3;
}

- (BOOL)isSnifferSupported
{
  return self->_isSnifferSupported;
}

- (void)setIsSnifferSupported:(BOOL)a3
{
  self->_isSnifferSupported = a3;
}

@end
