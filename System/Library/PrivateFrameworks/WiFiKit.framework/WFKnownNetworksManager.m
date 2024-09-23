@implementation WFKnownNetworksManager

- (WFKnownNetworksManager)initWithInterface:(id)a3
{
  id v5;
  WFKnownNetworksManager *v6;
  WFKnownNetworksManager *v7;
  uint64_t v8;
  CWFInterface *interface;
  WFPrivateAddressConfigManager *v10;
  WFPrivateAddressConfigManager *privateAddressConfigManager;
  NSObject *v12;
  os_log_type_t v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFKnownNetworksManager;
  v6 = -[WFKnownNetworksManager init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_interface, a3);
    }
    else
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE29F18]), "initWithServiceType:", 1);
      interface = v7->_interface;
      v7->_interface = (CWFInterface *)v8;

      -[CWFInterface resume](v7->_interface, "resume");
    }
    v10 = objc_alloc_init(WFPrivateAddressConfigManager);
    privateAddressConfigManager = v7->_privateAddressConfigManager;
    v7->_privateAddressConfigManager = v10;

    if (!v7->_privateAddressConfigManager)
    {
      WFLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[WFKnownNetworksManager initWithInterface:]";
        _os_log_impl(&dword_219FC8000, v12, v13, "%s: failed to create WFPrivateAddressConfigManager", buf, 0xCu);
      }

    }
  }

  return v7;
}

- (id)_getAllKnownProfiles
{
  return (id)-[CWFInterface knownNetworkProfilesWithProperties:](self->_interface, "knownNetworkProfilesWithProperties:", 0);
}

- (id)allNonEditableNetworkProfiles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFKnownNetworksManager _getAllKnownProfiles](self, "_getAllKnownProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isProfileBased"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)allEditableNetworkProfiles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFKnownNetworksManager _getAllKnownProfiles](self, "_getAllKnownProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isProfileBased") & 1) == 0
          && objc_msgSend(v9, "shouldShowInKnownNetworkList"))
        {
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)removeNetworks:(id)a3
{
  id v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  os_log_type_t v19;
  NSObject *v20;
  void *v21;
  CWFInterface *interface;
  void *v23;
  os_log_type_t v24;
  NSObject *v25;
  void *v26;
  os_log_type_t v27;
  id v29;
  NSObject *obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      *(_DWORD *)buf = 134217984;
      v38 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_219FC8000, v6, v5, "Trying to forget %lu networks.", buf, 0xCu);
    }

  }
  if (v3)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v3;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v8)
    {
      v9 = v8;
      v29 = v3;
      v10 = 0;
      v11 = *(_QWORD *)v34;
      v12 = 1;
      obj = v7;
      do
      {
        v13 = 0;
        v14 = v10;
        do
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
          if (!v15)
          {
            WFLogForCategory(0);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v16, v17, "Invalid CWFNetworkProfile object.", buf, 2u);
            }

          }
          WFLogForCategory(0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = OSLogForWFLogLevel(4uLL);
          if ((unint64_t)WFCurrentLogLevel() >= 4 && v18)
          {
            v20 = v18;
            if (os_log_type_enabled(v20, v19))
            {
              objc_msgSend(v15, "networkName");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v38 = (uint64_t)v21;
              _os_log_impl(&dword_219FC8000, v20, v19, "Trying to forget network: %@", buf, 0xCu);

            }
          }

          interface = self->_interface;
          v32 = v14;
          -[CWFInterface removeKnownNetworkProfile:reason:error:](interface, "removeKnownNetworkProfile:reason:error:", v15, 2, &v32);
          v10 = v32;

          if (objc_msgSend(v10, "code"))
          {
            WFLogForCategory(0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v23)
            {
              v25 = v23;
              if (os_log_type_enabled(v25, v24))
              {
                objc_msgSend(v15, "networkName");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v38 = (uint64_t)v10;
                v39 = 2112;
                v40 = v26;
                _os_log_impl(&dword_219FC8000, v25, v24, "Error:%@ happen when trying to remove network profile for %@", buf, 0x16u);

              }
            }

            v12 = 0;
          }
          ++v13;
          v14 = v10;
        }
        while (v9 != v13);
        v7 = obj;
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v9);

      v3 = v29;
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(1uLL);
    v12 = 0;
    if (WFCurrentLogLevel() && v7)
    {
      if (os_log_type_enabled(v7, v27))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219FC8000, v7, v27, "No networks to delete, return function.", buf, 2u);
      }
      v12 = 0;
    }
  }

  return v12 & 1;
}

- (id)passwordForNetworksWithSSID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  WFNetworkProfile *v14;
  void *v15;
  os_log_type_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFKnownNetworksManager _getAllKnownProfiles](self, "_getAllKnownProfiles");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      objc_msgSend(v10, "networkName", (_QWORD)v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_12;
    v14 = -[WFNetworkProfile initWithCoreWiFiProfile:]([WFNetworkProfile alloc], "initWithCoreWiFiProfile:", v13);
    -[WFNetworkProfile password](v14, "password");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_9:

LABEL_12:
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    v15 = 0;
    if (WFCurrentLogLevel() && v13)
    {
      if (os_log_type_enabled(v13, v16))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_impl(&dword_219FC8000, v13, v16, "failed to find password for network '%@'", buf, 0xCu);
      }
      v15 = 0;
    }
  }

  return v15;
}

- (id)privateAddressConfigForNetworkName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  id v21;
  os_log_type_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFKnownNetworksManager privateAddressConfigManager](self, "privateAddressConfigManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateAddressConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v23))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v17 = "nil private address configs";
    v18 = v15;
    v19 = v23;
    v20 = 2;
LABEL_15:
    _os_log_impl(&dword_219FC8000, v18, v19, v17, buf, v20);
LABEL_16:

    v21 = 0;
    goto LABEL_18;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (!v8)
  {
LABEL_10:

LABEL_11:
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v15 || !os_log_type_enabled(v15, v16))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    v17 = "nil private address config for network '%@'";
    v18 = v15;
    v19 = v16;
    v20 = 12;
    goto LABEL_15;
  }
  v9 = v8;
  v10 = *(_QWORD *)v25;
LABEL_4:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SSID_STR"), (_QWORD)v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v4);

    if ((v14 & 1) != 0)
      break;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v9)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v21 = v12;

  if (!v21)
    goto LABEL_11;
LABEL_18:

  return v21;
}

- (NSArray)allKnownProfiles
{
  return self->_allKnownProfiles;
}

- (void)setAllKnownProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_allKnownProfiles, a3);
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (WFPrivateAddressConfigManager)privateAddressConfigManager
{
  return self->_privateAddressConfigManager;
}

- (void)setPrivateAddressConfigManager:(id)a3
{
  objc_storeStrong((id *)&self->_privateAddressConfigManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateAddressConfigManager, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_allKnownProfiles, 0);
}

@end
