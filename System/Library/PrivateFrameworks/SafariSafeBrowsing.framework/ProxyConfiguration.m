@implementation ProxyConfiguration

+ (id)currentVersion
{
  return CFSTR("v1");
}

+ (BOOL)shouldRetryForError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C930A8]))
    v5 = objc_msgSend(v3, "code") == 310;
  else
    v5 = 0;

  return v5;
}

- (ProxyConfiguration)initWithDeviceIdentificationToken:(id)a3
{
  id v5;
  ProxyConfiguration *v6;
  ProxyConfiguration *v7;
  ProxyConfiguration *v8;
  void *v9;
  void *v10;
  char v11;
  NSDictionary *proxy;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ProxyConfiguration;
  v6 = -[ProxyConfiguration init](&v14, sel_init);
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if ((Backend::Google::SSBUtilities::shouldConsultWithTencent((Backend::Google::SSBUtilities *)v6) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      +[RemoteConfigurationController sharedController](RemoteConfigurationController, "sharedController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "googleProviderConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "proxyOff");

      if ((v11 & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        proxy = v7->_proxy;
        v7->_proxy = (NSDictionary *)&unk_1EA3EFBF0;

        objc_storeStrong((id *)&v7->_deviceIdentificationToken, a3);
        v8 = v7;
      }

    }
  }

  return v8;
}

- (void)applyToRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ProxyConfiguration proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ProxyConfiguration proxy](self, "proxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFURLRequestSetProxySettings();

  }
  -[ProxyConfiguration deviceIdentificationToken](self, "deviceIdentificationToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[ProxyConfiguration deviceIdentificationToken](self, "deviceIdentificationToken", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[ProxyConfiguration deviceIdentificationToken](self, "deviceIdentificationToken");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v4, "setValue:forHTTPHeaderField:", v15, v13);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
}

- (NSDictionary)proxy
{
  return self->_proxy;
}

- (NSDictionary)deviceIdentificationToken
{
  return self->_deviceIdentificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentificationToken, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
