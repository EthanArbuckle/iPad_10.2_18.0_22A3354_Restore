@implementation FBSDisplayConfiguration(PosterUIFoundation)

- (id)pui_displayConfigurationIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  CC_LONG v12;
  void *v13;
  uint64_t i;
  void *v15;
  unsigned __int8 md[32];
  uint64_t v18;
  CGRect v19;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "currentMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "bounds");
  NSStringFromCGRect(v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pointScale");
  v6 = v5;
  objc_msgSend(v2, "colorGamut");
  FBSDisplayGamutDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hdrMode");
  FBSDisplayHDRModeDescription();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{bounds:'%@',pointScale:'%f',gamut:'%@',hdrMode:'%@'}"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  v12 = strlen(v11);
  CC_SHA256(v11, v12, md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 64);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v13, "appendFormat:", CFSTR("%02x"), md[i]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)pui_displayConfigurationForScreen:()PosterUIFoundation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BE38450];
  v4 = a3;
  objc_msgSend(v3, "pui_sharedDisplayMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "configurationForIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pui_displayConfigurationForHardwareIdentifier:()PosterUIFoundation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE38450], "pui_sharedDisplayMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "connectedIdentities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(v4, "configurationForIdentity:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pui_displayConfigurationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v3);

      if ((v12 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

@end
