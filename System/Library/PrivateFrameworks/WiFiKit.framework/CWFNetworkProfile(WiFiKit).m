@implementation CWFNetworkProfile(WiFiKit)

- (uint64_t)carPlayNetworkType
{
  void *v2;
  void *v4;

  if (!objc_msgSend(a1, "isCarPlay"))
    return 0;
  objc_msgSend(a1, "lastJoinedByUserAt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

    return 2;
  }
  objc_msgSend(a1, "payloadUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 2;
  return 1;
}

- (uint64_t)wifiModeConfigurable
{
  uint64_t v2;
  int v3;
  int v4;

  v2 = objc_msgSend(a1, "disable6EMode");
  if (_os_feature_enabled_impl())
    v3 = _os_feature_enabled_impl() ^ 1;
  else
    v3 = 1;
  v4 = objc_msgSend(a1, "isStandalone6G") | v3;
  if ((v4 & 1) != 0 || v2 == 2)
    return v4 ^ 1u;
  else
    return objc_msgSend(a1, "hasJoined6GHz");
}

- (uint64_t)hasJoined6GHz
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  int v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "BSSList", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "channel");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "band");

        if (v6 == 3)
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)shouldShowInKnownNetworkList
{
  void *v2;
  os_log_type_t v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v2)
  {
    v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      objc_msgSend(a1, "networkName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136316162;
      v8 = "-[CWFNetworkProfile(WiFiKit) shouldShowInKnownNetworkList]";
      v9 = 2112;
      v10 = v5;
      v11 = 1024;
      v12 = objc_msgSend(a1, "shouldShowInMyNetworkList");
      v13 = 1024;
      v14 = objc_msgSend(a1, "isPersonalHotspot");
      v15 = 1024;
      v16 = objc_msgSend(a1, "isAppBased");
      _os_log_impl(&dword_219FC8000, v4, v3, "%s: networkName='%@' shouldShowInMyNetworkList=%d isPersonalHotspot=%d isAppBased=%d", (uint8_t *)&v7, 0x28u);

    }
  }

  if (objc_msgSend(a1, "shouldShowInMyNetworkList")
    && !objc_msgSend(a1, "isPersonalHotspot"))
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isAppBased");
  }
}

- (uint64_t)shouldShowInMyNetworkList
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  os_log_type_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  int v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "lastJoinedAt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v3, "setDay:", 14);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v3, v2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", v5);

    v8 = objc_msgSend(a1, "isOpen");
    if (v7 == 1)
      v9 = v8;
    else
      v9 = 0;
    WFLogForCategory(0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v10)
    {
      v12 = v10;
      if (os_log_type_enabled(v12, v11))
      {
        v13 = v7 == 1;
        objc_msgSend(a1, "networkName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v14;
        v19 = 1024;
        v20 = v13;
        v21 = 1024;
        v22 = objc_msgSend(a1, "isOpen");
        _os_log_impl(&dword_219FC8000, v12, v11, "%@ did pass last joined checkpoint: %d, is open: %d", (uint8_t *)&v17, 0x18u);

      }
    }

    v15 = v9 ^ 1u;
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)isManaged
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "payloadUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)forgetable
{
  return (objc_msgSend(a1, "isManaged") & 1) == 0 && objc_msgSend(a1, "carPlayNetworkType") != 1;
}

- (uint64_t)autoLoginConfigurable
{
  uint64_t result;

  result = objc_msgSend(a1, "isCaptive");
  if ((_DWORD)result)
    return objc_msgSend(a1, "addReason") != 10;
  return result;
}

- (uint64_t)autoJoinConfigurable
{
  return objc_msgSend(a1, "isPersonalHotspot") ^ 1;
}

- (BOOL)saveDataModeConfigurable
{
  return objc_msgSend(a1, "carPlayNetworkType") != 1;
}

- (uint64_t)networkQualityVisible
{
  return _os_feature_enabled_impl();
}

- (uint64_t)randomMACAddressConfigurable
{
  return 1;
}

- (id)randomMACAddress
{
  void *v1;
  void *v2;
  const __CFData *v3;
  void *v4;

  objc_msgSend(a1, "OSSpecificAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && (v3 = (const __CFData *)objc_msgSend(v2, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS_VALUE"))) != 0)
  {
    WFConvertEthernetNetworkAddressToString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)networkQualityResponsiveness
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "OSSpecificAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE67E10]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (id)networkQualityDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "OSSpecificAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE67E08]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hasDisabledUntilDate
{
  id v0;

  v0 = (id)WiFiNetworkCreateFromCoreWiFiNetworkProfile();
  return WiFiNetworkGetProperty();
}

- (id)displayFriendlyName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "OSSpecificAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("DisplayFriendlyName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)accessoryIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "OSSpecificAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AccessoryIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
