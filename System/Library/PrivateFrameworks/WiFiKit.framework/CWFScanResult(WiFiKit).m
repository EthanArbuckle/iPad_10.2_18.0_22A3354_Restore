@implementation CWFScanResult(WiFiKit)

- (uint64_t)requiresUsername
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  if (!objc_msgSend(a1, "isEAP"))
    return 0;
  objc_msgSend(a1, "supportedEAPTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "containsObject:", v5);

    v4 = v6 ^ 1u;
  }

  return v4;
}

- (id)privateAddressInfoDictionary
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "scanRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("PrivateMacInfoDictionary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)privateAddressConfigDictionary
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "scanRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("PRIVATE_MAC_ADDRESS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)phyMode
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scanRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("PHY_MODE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (uint64_t)isSSIDAmbiguous
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scanRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("AmbiguousSSIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)isCarPlay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "scanRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("APPLE_DEVICE_IE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(a1, "supportsCarPlay");
  objc_msgSend(a1, "scanRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CARPLAY_NETWORK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (uint64_t)isHidden
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  objc_msgSend(a1, "scanRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("UserDirected"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(a1, "scanRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HIDDEN_NETWORK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(a1, "scanRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("scanWasDirected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(a1, "networkName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "networkName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", &stru_24DC36C30) & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend(a1, "networkName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "isEqualToString:", CFSTR(" "));

    }
  }
  else
  {
    v13 = 1;
  }

  return v4 | v7 | v10 | v13;
}

- (uint64_t)requiresPassword
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v7;

  if (objc_msgSend(a1, "isEAP"))
  {
    objc_msgSend(a1, "supportedEAPTypes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "containsObject:", &unk_24DC5D768);

    objc_msgSend(a1, "supportedEAPTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsObject:", &unk_24DC5D780) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(a1, "supportedEAPTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "containsObject:", &unk_24DC5D798);

    }
    return (v3 | v5) ^ 1u;
  }
  else if ((objc_msgSend(a1, "isPSK") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isSAE");
  }
}

- (uint64_t)carPlayNetworkType
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;

  if (!objc_msgSend(a1, "isCarPlay"))
    return 0;
  objc_msgSend(a1, "matchingKnownNetworkProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastJoinedByUserAt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return 2;
  }
  objc_msgSend(a1, "matchingKnownNetworkProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 2;
  return 1;
}

- (id)ieDictionary
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "scanRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("APPLE_DEVICE_IE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)supportedEAPTypes
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "scanRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("AcceptEAPTypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)isSAE
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "scanRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("RSN_IE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    && ((objc_msgSend(v2, "objectForKey:", CFSTR("IE_KEY_RSN_AUTHSELS")),
         (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (objc_msgSend(v2, "objectForKey:", CFSTR("IE_KEY_WPA_AUTHSELS")),
         (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    if ((objc_msgSend(v3, "containsObject:", &unk_24DC5D738) & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "containsObject:", &unk_24DC5D750);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)supportsWiFiHealth
{
  return objc_msgSend(a1, "carPlayNetworkType") != 1;
}

- (uint64_t)supportsJoinFailureDiagnostics
{
  if ((objc_msgSend(a1, "isEAP") & 1) != 0 || (objc_msgSend(a1, "isPasspoint") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "isCarPlay") ^ 1;
}

- (id)securityIssue
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(a1, "isOpen") & 1) == 0 && (objc_msgSend(a1, "isOWE") & 1) == 0)
  {
    if ((objc_msgSend(a1, "isWEP") & 1) != 0
      || objc_msgSend(a1, "WPAMulticastCipher") == 1
      || objc_msgSend(a1, "WPAMulticastCipher") == 5)
    {
      if ((objc_msgSend(a1, "isEAP") & 1) == 0)
      {
        v2 = 2;
        goto LABEL_4;
      }
    }
    else if (((objc_msgSend(a1, "isWPA") & 1) != 0 || objc_msgSend(a1, "isWPA2"))
           && objc_msgSend(a1, "hasTKIPCipher"))
    {
      v2 = 4096;
      goto LABEL_4;
    }
    v3 = 0;
    return v3;
  }
  v2 = 8;
LABEL_4:
  objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)configurationIssues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "securityIssue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "securityIssue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  if (objc_msgSend(a1, "isSSIDAmbiguous"))
  {
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  if (objc_msgSend(a1, "phyMode") == 4)
  {
    objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  return v2;
}

@end
