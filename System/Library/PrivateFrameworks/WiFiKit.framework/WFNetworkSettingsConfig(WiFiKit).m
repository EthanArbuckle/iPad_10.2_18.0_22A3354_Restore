@implementation WFNetworkSettingsConfig(WiFiKit)

- (void)populateIPV4:()WiFiKit
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "method");
  if (v5 == 5)
  {
    v6 = a1;
    v7 = 1;
    goto LABEL_6;
  }
  if (v5 != 4)
  {
    if (v5 != 1)
    {
      WFLogForCategory(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = OSLogForWFLogLevel(2uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 2 && v11)
      {
        v13 = v11;
        if (os_log_type_enabled(v13, v12))
        {
          v23 = 134217984;
          v24 = objc_msgSend(v4, "method");
          _os_log_impl(&dword_219FC8000, v13, v12, "Unknown DHCP config method %ld", (uint8_t *)&v23, 0xCu);
        }

      }
      goto LABEL_15;
    }
    v6 = a1;
    v7 = 0;
LABEL_6:
    objc_msgSend(v6, "setIpv4Config:", v7);
LABEL_15:
    objc_msgSend(v4, "addresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "addresses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setIpv4Address:", v15);

    }
    else
    {
      objc_msgSend(a1, "setIpv4Address:", 0);
    }
    objc_msgSend(a1, "setIpv4AddressManual:", 0);
    objc_msgSend(v4, "subnetMasks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v4, "subnetMasks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setIpv4SubnetMask:", v18);

    }
    else
    {
      objc_msgSend(a1, "setIpv4SubnetMask:", 0);
    }
    objc_msgSend(a1, "setIpv4SubnetMaskManual:", 0);
    objc_msgSend(v4, "router");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIpv4RouterAddress:", v19);
    objc_msgSend(a1, "setIpv4RouterAddressManual:", 0);
    goto LABEL_27;
  }
  objc_msgSend(a1, "setIpv4Config:", 2);
  objc_msgSend(v4, "addresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "addresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIpv4AddressManual:", v10);

  }
  else
  {
    objc_msgSend(a1, "setIpv4AddressManual:", 0);
  }
  objc_msgSend(a1, "setIpv4Address:", 0);
  objc_msgSend(v4, "subnetMasks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "subnetMasks");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIpv4SubnetMaskManual:", v21);

  }
  else
  {
    objc_msgSend(a1, "setIpv4SubnetMaskManual:", 0);
  }
  objc_msgSend(a1, "setIpv4SubnetMask:", 0);
  objc_msgSend(v4, "router");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setIpv4RouterAddressManual:", v19);
  objc_msgSend(a1, "setIpv4RouterAddress:", 0);
LABEL_27:
  objc_msgSend(v4, "dhcpClientID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setDhcpClientID:", v22);

}

- (void)populateIPV6:()WiFiKit
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "method");
  switch(v5)
  {
    case 3:
      v6 = a1;
      v7 = 1;
      goto LABEL_7;
    case 2:
      v6 = a1;
      v7 = 2;
      goto LABEL_7;
    case 1:
      v6 = a1;
      v7 = 0;
LABEL_7:
      objc_msgSend(v6, "setIpv6Config:", v7);
      goto LABEL_14;
  }
  WFLogForCategory(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(2uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 2 && v8)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      v15 = 134217984;
      v16 = objc_msgSend(v4, "method");
      _os_log_impl(&dword_219FC8000, v10, v9, "Unknown DHCP config method %ld", (uint8_t *)&v15, 0xCu);
    }

  }
LABEL_14:
  objc_msgSend(v4, "addresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "addresses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIpv6Addresses:", v12);

  }
  objc_msgSend(v4, "router");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "router");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIpv6RouterAddress:", v14);

  }
}

- (void)populateDNS:()WiFiKit
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "serverAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "serverAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setDnsServerAddresses:", v5);

  }
  objc_msgSend(v8, "searchDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "searchDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setDnsSearchDomains:", v7);

  }
}

- (void)populateProxy:()WiFiKit
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v14, "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setHttpProxyServerAddress:", v5);

  }
  objc_msgSend(v14, "port");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v14, "port");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setHttpProxyServerPort:", v7);

  }
  objc_msgSend(v14, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v14, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setHttpProxyUsername:", v9);

  }
  objc_msgSend(v14, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v14, "password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setHttpProxyPassword:", v11);

  }
  if (objc_msgSend(v14, "authenticated"))
    objc_msgSend(a1, "setHttpProxyAuthenticationRequired:", objc_msgSend(v14, "authenticated"));
  objc_msgSend(v14, "autoConfigureURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v14, "autoConfigureURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setHttpProxyConfigPAC:", v13);

  }
}

@end
