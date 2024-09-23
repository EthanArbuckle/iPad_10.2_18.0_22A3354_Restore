@implementation RemoteConfigurationController

+ (id)sharedController
{
  if (+[RemoteConfigurationController sharedController]::onceToken != -1)
    dispatch_once(&+[RemoteConfigurationController sharedController]::onceToken, &__block_literal_global_1);
  return (id)+[RemoteConfigurationController sharedController]::sharedController;
}

void __49__RemoteConfigurationController_sharedController__block_invoke()
{
  RemoteConfigurationController *v0;
  void *v1;

  v0 = objc_alloc_init(RemoteConfigurationController);
  v1 = (void *)+[RemoteConfigurationController sharedController]::sharedController;
  +[RemoteConfigurationController sharedController]::sharedController = (uint64_t)v0;

}

- (RemoteConfigurationController)init
{
  RemoteConfigurationController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  RemoteConfigurationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RemoteConfigurationController;
  v2 = -[RemoteConfigurationController init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.RemoteConfigurationController.InternalQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    -[RemoteConfigurationController _loadConfigurationFromDiskIfNecessary](v2, "_loadConfigurationFromDiskIfNecessary");
    -[RemoteConfigurationController _updateConfigurationIfNecessary](v2, "_updateConfigurationIfNecessary");
    -[RemoteConfigurationController _initializeProviderConfigurationsWithConfiguration:](v2, "_initializeProviderConfigurationsWithConfiguration:", v2->_currentConfiguration);
    -[RemoteConfigurationController _scheduleConfigurationUpdateDaily](v2, "_scheduleConfigurationUpdateDaily");
    -[RemoteConfigurationController _resetProviderConfigurationsDidChange](v2, "_resetProviderConfigurationsDidChange");
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSObject *internalQueue;
  objc_super v4;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__RemoteConfigurationController_dealloc__block_invoke;
  block[3] = &unk_1EA3EC298;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)RemoteConfigurationController;
  -[RemoteConfigurationController dealloc](&v4, sel_dealloc);
}

void __40__RemoteConfigurationController_dealloc__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

  }
}

- (BOOL)isSafeBrowsingOff
{
  return -[ProviderConfiguration providerOff](self->_googleProviderConfiguration, "providerOff")
      && -[ProviderConfiguration providerOff](self->_tencentProviderConfiguration, "providerOff")
      && -[ProviderConfiguration providerOff](self->_appleProviderConfiguration, "providerOff");
}

- (id)_providerToTurnOffFromProviderDictionary:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("Provider To Turn Off"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)_initializeToDefaultProviderConfigurations
{
  ProviderConfiguration *googleProviderConfiguration;
  ProviderConfiguration *v4;
  ProviderConfiguration *v5;
  ProviderConfiguration *tencentProviderConfiguration;
  ProviderConfiguration *v7;
  ProviderConfiguration *v8;
  ProviderConfiguration *appleProviderConfiguration;
  ProviderConfiguration *v10;
  ProviderConfiguration *v11;

  googleProviderConfiguration = self->_googleProviderConfiguration;
  if (googleProviderConfiguration
    && !-[ProviderConfiguration isEqualToConfiguration:](googleProviderConfiguration, "isEqualToConfiguration:", 0))
  {
    self->_googleConfigurationDidChange = 1;
  }
  v4 = -[ProviderConfiguration initWithConfiguration:]([ProviderConfiguration alloc], "initWithConfiguration:", 0);
  v5 = self->_googleProviderConfiguration;
  self->_googleProviderConfiguration = v4;

  tencentProviderConfiguration = self->_tencentProviderConfiguration;
  if (tencentProviderConfiguration
    && !-[ProviderConfiguration isEqualToConfiguration:](tencentProviderConfiguration, "isEqualToConfiguration:", 0))
  {
    self->_tencentConfigurationDidChange = 1;
  }
  v7 = -[ProviderConfiguration initWithConfiguration:]([ProviderConfiguration alloc], "initWithConfiguration:", 0);
  v8 = self->_tencentProviderConfiguration;
  self->_tencentProviderConfiguration = v7;

  appleProviderConfiguration = self->_appleProviderConfiguration;
  if (appleProviderConfiguration
    && !-[ProviderConfiguration isEqualToConfiguration:](appleProviderConfiguration, "isEqualToConfiguration:", 0))
  {
    self->_appleConfigurationDidChange = 1;
  }
  v10 = -[ProviderConfiguration initWithConfiguration:]([ProviderConfiguration alloc], "initWithConfiguration:", 0);
  v11 = self->_appleProviderConfiguration;
  self->_appleProviderConfiguration = v10;

}

- (void)_simplifyProviderConfigurations
{
  _BOOL8 v3;

  if (!-[ProviderConfiguration providerOff](self->_googleProviderConfiguration, "providerOff"))
  {
    if (-[ProviderConfiguration socialEngineeringThreatTypeOff](self->_googleProviderConfiguration, "socialEngineeringThreatTypeOff"))
    {
      v3 = -[ProviderConfiguration malwareThreatTypeOff](self->_googleProviderConfiguration, "malwareThreatTypeOff");
    }
    else
    {
      v3 = 0;
    }
    -[ProviderConfiguration setProviderOff:](self->_googleProviderConfiguration, "setProviderOff:", v3);
  }
  if (!-[ProviderConfiguration providerOff](self->_tencentProviderConfiguration, "providerOff"))
    -[ProviderConfiguration setProviderOff:](self->_tencentProviderConfiguration, "setProviderOff:", -[ProviderConfiguration socialEngineeringThreatTypeOff](self->_tencentProviderConfiguration, "socialEngineeringThreatTypeOff"));
  if (!-[ProviderConfiguration providerOff](self->_appleProviderConfiguration, "providerOff"))
    -[ProviderConfiguration setProviderOff:](self->_appleProviderConfiguration, "setProviderOff:", -[ProviderConfiguration socialEngineeringThreatTypeOff](self->_appleProviderConfiguration, "socialEngineeringThreatTypeOff"));
}

+ (id)convertDyldVersionToString:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i.%i.%i"), ((a3 >> 40) & 0x7FFFFF) - 1000 * (((8589935 * ((a3 >> 40) & 0x7FFFFF)) >> 32) >> 1), (a3 >> 30) & 0x3FF, (a3 >> 20) & 0x3FF);
}

- (id)_dyldSourceVersionString
{
  if (-[RemoteConfigurationController _dyldSourceVersionString]::once != -1)
    dispatch_once(&-[RemoteConfigurationController _dyldSourceVersionString]::once, &__block_literal_global_15_0);
  return (id)-[RemoteConfigurationController _dyldSourceVersionString]::versionString;
}

void __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke()
{
  int *v0;
  int *v1;
  int v2;
  _DWORD *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v0 = (int *)dyld_image_header_containing_address();
  if (v0)
  {
    v1 = v0;
    if (*v0 == -17958193)
    {
      v2 = v0[4];
      if (!v2)
        goto LABEL_14;
      v3 = v0 + 8;
      while (*v3 != 42)
      {
        v3 = (_DWORD *)((char *)v3 + v3[1]);
        if (!--v2)
          goto LABEL_14;
      }
      if (*((_QWORD *)v3 + 1))
      {
        +[RemoteConfigurationController convertDyldVersionToString:](RemoteConfigurationController, "convertDyldVersionToString:");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)-[RemoteConfigurationController _dyldSourceVersionString]::versionString;
        -[RemoteConfigurationController _dyldSourceVersionString]::versionString = v6;

      }
      else
      {
LABEL_14:
        v8 = SSBOSLogRemoteConfiguration();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_2();
      }
    }
    else
    {
      v5 = SSBOSLogRemoteConfiguration();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_3(v1, v5);
    }
  }
  else
  {
    v4 = SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_1();
  }
}

- (void)_initializeProviderConfigurationsWithConfiguration:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSArray *v24;
  NSArray *v25;
  void *v26;
  NSArray *v27;
  NSArray *v28;
  void *v29;
  NSArray *v30;
  NSArray *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  BOOL v36;
  ProviderConfiguration *v37;
  ProviderConfiguration *googleProviderConfiguration;
  void *v39;
  BOOL v40;
  ProviderConfiguration *v41;
  ProviderConfiguration *tencentProviderConfiguration;
  void *v43;
  BOOL v44;
  ProviderConfiguration *v45;
  ProviderConfiguration *appleProviderConfiguration;
  NSObject *v47;
  id v48;
  RemoteConfigurationController *v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64;
  _BYTE v65[15];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  if (v48)
  {
    v49 = self;
    -[RemoteConfigurationController _dyldSourceVersionString](self, "_dyldSourceVersionString");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v48, "ssb_arrayForKey:", CFSTR("Configurations"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      if (!v52)
        goto LABEL_49;
      v51 = *(_QWORD *)v71;
      while (1)
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v71 != v51)
            objc_enumerationMutation(obj);
          v4 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v53);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v5 = (id)SSBOSLogRemoteConfiguration();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              v33 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v77 = v33;
              _os_log_error_impl(&dword_1DBCBE000, v5, OS_LOG_TYPE_ERROR, "Skipped an entry in the configuration. Expected a NSDictionary, got %{public}@", buf, 0xCu);
            }
            goto LABEL_31;
          }
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          objc_msgSend(v4, "ssb_arrayForKey:", CFSTR("VersionRanges"));
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
          if (!v6)
            goto LABEL_31;
          v7 = *(_QWORD *)v67;
          while (2)
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v67 != v7)
                objc_enumerationMutation(v5);
              v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v10 = (id)SSBOSLogRemoteConfiguration();
                if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                {
                  v13 = objc_opt_class();
                  *(_DWORD *)buf = 138543362;
                  v77 = v13;
                  _os_log_error_impl(&dword_1DBCBE000, v10, OS_LOG_TYPE_ERROR, "Skipped an version range in the configuration. Expected a NSDictionary, got %{public}@", buf, 0xCu);
                }
                goto LABEL_25;
              }
              objc_msgSend(v9, "ssb_stringForKey:", CFSTR("MinVersion"));
              v10 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "ssb_stringForKey:", CFSTR("MaxVersion"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (!-[NSObject length](v10, "length") || !objc_msgSend(v11, "length"))
              {
                v14 = SSBOSLogRemoteConfiguration();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                  -[RemoteConfigurationController _initializeProviderConfigurationsWithConfiguration:].cold.2(&v64, v65, v14);
LABEL_24:

LABEL_25:
                continue;
              }
              if (objc_msgSend(v59, "compare:options:", v10, 64) == -1)
                goto LABEL_24;
              v12 = objc_msgSend(v59, "compare:options:", v11, 64) == 1;

              if (!v12)
              {

                v62 = 0u;
                v63 = 0u;
                v60 = 0u;
                v61 = 0u;
                objc_msgSend(v4, "ssb_arrayForKey:", CFSTR("Providers"));
                v5 = objc_claimAutoreleasedReturnValue();
                v15 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
                if (v15)
                {
                  v55 = *(_QWORD *)v61;
LABEL_35:
                  v54 = v15;
                  v16 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v61 != v55)
                      objc_enumerationMutation(v5);
                    v17 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v16);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      break;
                    objc_msgSend(v17, "ssb_stringForKey:", CFSTR("Provider To Turn Off"));
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "objectForKeyedSubscript:", v18);
                    v19 = (id)objc_claimAutoreleasedReturnValue();
                    v20 = v17;
                    v21 = v20;
                    if (v19)
                    {
                      objc_msgSend(v19, "ssb_stringForKey:", CFSTR("Provider To Turn Off"));
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "ssb_stringForKey:", CFSTR("Provider To Turn Off"));
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      v57 = v22;
                      if ((objc_msgSend(v22, "isEqualToString:") & 1) != 0)
                      {
                        v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                        objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("Provider To Turn Off"));
                        objc_msgSend(v19, "ssb_arrayForKey:", CFSTR("Regions To Turn Off"));
                        v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "ssb_arrayForKey:", CFSTR("Regions To Turn Off"));
                        v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        mergeConfigurationArrayIfBothNotNil(v24, v25);
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("Regions To Turn Off"));

                        objc_msgSend(v19, "ssb_arrayForKey:", CFSTR("Threat Types To Turn Off"));
                        v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "ssb_arrayForKey:", CFSTR("Threat Types To Turn Off"));
                        v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        mergeConfigurationArrayIfBothNotNil(v27, v28);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, CFSTR("Threat Types To Turn Off"));

                        objc_msgSend(v19, "ssb_arrayForKey:", CFSTR("Proxy Versions To Turn Off"));
                        v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "ssb_arrayForKey:", CFSTR("Proxy Versions To Turn Off"));
                        v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        mergeConfigurationArray(v30, v31);
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v23, "setObject:forKeyedSubscript:", v32, CFSTR("Proxy Versions To Turn Off"));

                      }
                      else
                      {
                        v23 = v19;
                      }

                    }
                    else
                    {
                      v23 = v20;
                    }

                    objc_msgSend(v58, "setObject:forKeyedSubscript:", v23, v18);
                    if (v54 == ++v16)
                    {
                      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
                      if (v15)
                        goto LABEL_35;
                      goto LABEL_31;
                    }
                  }
                }
                goto LABEL_31;
              }
            }
            v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
            if (v6)
              continue;
            break;
          }
LABEL_31:

          ++v53;
        }
        while (v53 != v52);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        v52 = v34;
        if (!v34)
        {
LABEL_49:

          objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("Google"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[ProviderConfiguration isEqualToConfiguration:](v49->_googleProviderConfiguration, "isEqualToConfiguration:", v35);
          v49->_googleConfigurationDidChange = !v36;
          if (!v36)
          {
            v37 = -[ProviderConfiguration initWithConfiguration:]([ProviderConfiguration alloc], "initWithConfiguration:", v35);
            googleProviderConfiguration = v49->_googleProviderConfiguration;
            v49->_googleProviderConfiguration = v37;

          }
          objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("Tencent"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[ProviderConfiguration isEqualToConfiguration:](v49->_tencentProviderConfiguration, "isEqualToConfiguration:", v39);
          v49->_tencentConfigurationDidChange = !v40;
          if (!v40)
          {
            v41 = -[ProviderConfiguration initWithConfiguration:]([ProviderConfiguration alloc], "initWithConfiguration:", v39);
            tencentProviderConfiguration = v49->_tencentProviderConfiguration;
            v49->_tencentProviderConfiguration = v41;

          }
          objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("Apple"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = -[ProviderConfiguration isEqualToConfiguration:](v49->_googleProviderConfiguration, "isEqualToConfiguration:", v43);
          v49->_appleConfigurationDidChange = !v44;
          if (!v44)
          {
            v45 = -[ProviderConfiguration initWithConfiguration:]([ProviderConfiguration alloc], "initWithConfiguration:", v43);
            appleProviderConfiguration = v49->_appleProviderConfiguration;
            v49->_appleProviderConfiguration = v45;

          }
          -[RemoteConfigurationController _simplifyProviderConfigurations](v49, "_simplifyProviderConfigurations");

          goto LABEL_60;
        }
      }
    }
    v47 = SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      -[RemoteConfigurationController _initializeProviderConfigurationsWithConfiguration:].cold.1();
    -[RemoteConfigurationController _initializeToDefaultProviderConfigurations](self, "_initializeToDefaultProviderConfigurations");
LABEL_60:

  }
  else
  {
    -[RemoteConfigurationController _initializeToDefaultProviderConfigurations](self, "_initializeToDefaultProviderConfigurations");
  }

}

- (void)_resetProviderConfigurationsDidChange
{
  *(_WORD *)&self->_googleConfigurationDidChange = 0;
  self->_appleConfigurationDidChange = 0;
}

- (id)_urlOfDownloadedConfiguration
{
  uid_t v2;
  passwd *v3;
  char *pw_dir;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v17;
  id v18[5];

  v18[4] = *(id *)MEMORY[0x1E0C80C00];
  v2 = geteuid();
  if (!v2)
    v2 = getuid();
  v3 = getpwuid(v2);
  if (v3 && (pw_dir = v3->pw_dir) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", pw_dir, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Library"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("SafariSafeBrowsing"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = 0;
      v11 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, v18);
      v12 = v18[0];

      if ((v11 & 1) != 0)
      {
        objc_msgSend(CFSTR("SafeBrowsingRemoteConfiguration-1"), "stringByAppendingPathExtension:", CFSTR("plist"));
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = (id)SSBOSLogRemoteConfiguration();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "ssb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[RemoteConfigurationController _urlOfDownloadedConfiguration].cold.3();
        }
        v14 = 0;
      }

    }
    else
    {
      v17 = SSBOSLogRemoteConfiguration();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[RemoteConfigurationController _urlOfDownloadedConfiguration].cold.2();
      v14 = 0;
    }

    return v14;
  }
  else
  {
    v15 = SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RemoteConfigurationController _urlOfDownloadedConfiguration].cold.1();
    return 0;
  }
}

- (void)_loadConfigurationFromDiskIfNecessary
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__RemoteConfigurationController__loadConfigurationFromDiskIfNecessary__block_invoke;
  block[3] = &unk_1EA3EC298;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __70__RemoteConfigurationController__loadConfigurationFromDiskIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[7])
  {
    objc_msgSend(v2, "_urlOfDownloadedConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

      if ((v6 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 56);
        *(_QWORD *)(v8 + 56) = v7;

        if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
        {
          v10 = SSBOSLogRemoteConfiguration();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            __70__RemoteConfigurationController__loadConfigurationFromDiskIfNecessary__block_invoke_cold_1((uint64_t)v3, v10);
        }
      }
    }

  }
}

- (void)_writeConfigurationToDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10[5];

  v10[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RemoteConfigurationController _urlOfDownloadedConfiguration](self, "_urlOfDownloadedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "writeToURL:atomically:", v5, 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = 0;
      v7 = objc_msgSend(v6, "removeItemAtURL:error:", v5, v10);
      v8 = v10[0];

      if ((v7 & 1) == 0)
      {
        v9 = (id)SSBOSLogRemoteConfiguration();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "ssb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[RemoteConfigurationController _writeConfigurationToDisk:].cold.1();
        }

      }
    }
  }

}

- (void)setCurrentConfiguration:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__RemoteConfigurationController_setCurrentConfiguration___block_invoke;
  block[3] = &unk_1EA3EC2E0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __57__RemoteConfigurationController_setCurrentConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCurrentConfigurationOnInternalQueue:", *(_QWORD *)(a1 + 40));
}

- (void)_setCurrentConfigurationOnInternalQueue:(id)a3
{
  unint64_t v5;
  NSDictionary *currentConfiguration;
  id v7;

  v5 = (unint64_t)a3;
  currentConfiguration = self->_currentConfiguration;
  v7 = (id)v5;
  if (v5 | (unint64_t)currentConfiguration
    && (!v5 || !-[NSDictionary isEqualToDictionary:](currentConfiguration, "isEqualToDictionary:", v5)))
  {
    objc_storeStrong((id *)&self->_currentConfiguration, a3);
    -[RemoteConfigurationController _initializeProviderConfigurationsWithConfiguration:](self, "_initializeProviderConfigurationsWithConfiguration:", self->_currentConfiguration);
    -[RemoteConfigurationController _writeConfigurationToDisk:](self, "_writeConfigurationToDisk:", self->_currentConfiguration);
    -[RemoteConfigurationController _notifyProviderConfigurationsDidChangeIfNecessary](self, "_notifyProviderConfigurationsDidChangeIfNecessary");
  }

}

- (void)_notifyProviderConfigurationsDidChangeIfNecessary
{
  RemoteConfigurationController *v2;
  Backend::Google::SSBUtilities *shouldConsultWithTencent;

  v2 = self;
  if (self->_googleConfigurationDidChange)
    self = (RemoteConfigurationController *)notify_post("com.apple.Safari.SafeBrowsing.GoogleRemoteConfigurationDidChange");
  shouldConsultWithTencent = (Backend::Google::SSBUtilities *)Backend::Google::SSBUtilities::shouldConsultWithTencent((Backend::Google::SSBUtilities *)self);
  if ((_DWORD)shouldConsultWithTencent && v2->_tencentConfigurationDidChange)
    shouldConsultWithTencent = (Backend::Google::SSBUtilities *)notify_post("com.apple.Safari.SafeBrowsing.TencentRemoteConfigurationDidChange");
  if (Backend::Google::SSBUtilities::shouldConsultWithApple(shouldConsultWithTencent)
    && v2->_appleConfigurationDidChange)
  {
    notify_post("com.apple.Safari.SafeBrowsing.AppleRemoteConfigurationDidChange");
  }
  -[RemoteConfigurationController _resetProviderConfigurationsDidChange](v2, "_resetProviderConfigurationsDidChange");
}

- (void)_downloadConfigurationWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  configurationBaseURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SafeBrowsingRemoteConfiguration-1"), "stringByAppendingPathExtension:", CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__RemoteConfigurationController__downloadConfigurationWithCompletionHandler___block_invoke;
  v10[3] = &unk_1EA3EC308;
  v8 = v3;
  v11 = v8;
  objc_msgSend(v4, "dataTaskWithURL:completionHandler:", v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

void __77__RemoteConfigurationController__downloadConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 && v9)
  {
    v11 = (id)SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ssb_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __77__RemoteConfigurationController__downloadConfigurationWithCompletionHandler___block_invoke_cold_1();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_updateConfigurationIfNecessary
{
  void *v3;
  BOOL v4;
  _QWORD v5[5];
  id v6;
  id location;

  -[RemoteConfigurationController _lastConfigurationUpdateAttemptDate](self, "_lastConfigurationUpdateAttemptDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RemoteConfigurationController _shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:](self, "_shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:", v3);

  if (v4)
  {
    -[RemoteConfigurationController _setCurrentDateAsLastConfigurationUpdateAttemptDate](self, "_setCurrentDateAsLastConfigurationUpdateAttemptDate");
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__RemoteConfigurationController__updateConfigurationIfNecessary__block_invoke;
    v5[3] = &unk_1EA3EC358;
    v5[4] = self;
    objc_copyWeak(&v6, &location);
    -[RemoteConfigurationController _downloadConfigurationWithCompletionHandler:](self, "_downloadConfigurationWithCompletionHandler:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __64__RemoteConfigurationController__updateConfigurationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__RemoteConfigurationController__updateConfigurationIfNecessary__block_invoke_2;
    v5[3] = &unk_1EA3EC330;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6 = v3;
    dispatch_async(v4, v5);

    objc_destroyWeak(&v7);
  }

}

void __64__RemoteConfigurationController__updateConfigurationIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didReceiveConfigurationData:", *(_QWORD *)(a1 + 32));

}

- (void)_didReceiveConfigurationData:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7[5];

  v7[4] = *(id *)MEMORY[0x1E0C80C00];
  v7[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7[0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RemoteConfigurationController _setCurrentConfigurationOnInternalQueue:](self, "_setCurrentConfigurationOnInternalQueue:", v4);
  }
  else
  {
    v6 = (id)SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "ssb_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[RemoteConfigurationController _didReceiveConfigurationData:].cold.1();
    }

  }
}

- (BOOL)_shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:(id)a3
{
  Backend::Google::SSBUtilities *v3;
  Backend::Google::SSBUtilities *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;

  v3 = (Backend::Google::SSBUtilities *)a3;
  v4 = v3;
  if (v3)
  {
    if (Backend::Google::SSBUtilities::isInternalInstall(v3)
      && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "objectForKey:", CFSTR("DebugSafeBrowsingTestUpdateInterval")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v6))
    {
      -[Backend::Google::SSBUtilities timeIntervalSinceNow](v4, "timeIntervalSinceNow");
      v8 = v7;
      objc_msgSend(v6, "doubleValue");
      v10 = v9 < -v8;

    }
    else
    {
      -[Backend::Google::SSBUtilities timeIntervalSinceNow](v4, "timeIntervalSinceNow");
      v10 = v11 < -86400.0;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)_lastConfigurationUpdateAttemptDate
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SafeBrowsingRemoteConfigurationLastUpdateDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)_setCurrentDateAsLastConfigurationUpdateAttemptDate
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, CFSTR("SafeBrowsingRemoteConfigurationLastUpdateDate"));

}

- (void)_scheduleConfigurationUpdateDaily
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__RemoteConfigurationController__scheduleConfigurationUpdateDaily__block_invoke;
  block[3] = &unk_1EA3EC298;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __66__RemoteConfigurationController__scheduleConfigurationUpdateDaily__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  dispatch_source_t v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (!*((_QWORD *)a1[4] + 2))
  {
    if (Backend::Google::SSBUtilities::isInternalInstall((Backend::Google::SSBUtilities *)a1))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectForKey:", CFSTR("DebugSafeBrowsingTestUpdateInterval"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(v3, "doubleValue");
        v5 = v4;
      }
      else
      {
        v5 = 86400.0;
      }

    }
    else
    {
      v5 = 86400.0;
    }
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)a1[4] + 1));
    v7 = a1[4];
    v8 = (void *)v7[2];
    v7[2] = v6;

    objc_initWeak(&location, a1[4]);
    v9 = *((_QWORD *)a1[4] + 2);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__RemoteConfigurationController__scheduleConfigurationUpdateDaily__block_invoke_2;
    v12[3] = &unk_1EA3EC380;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v9, v12);
    v10 = *((_QWORD *)a1[4] + 2);
    v11 = dispatch_time(0, (unint64_t)(v5 * 1000000000.0));
    dispatch_source_set_timer(v10, v11, (unint64_t)(v5 * 1000000000.0), (unint64_t)(v5 * 1000000000.0) / 0xA);
    dispatch_resume(*((dispatch_object_t *)a1[4] + 2));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __66__RemoteConfigurationController__scheduleConfigurationUpdateDaily__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  v2 = SSBOSLogRemoteConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DBCBE000, v2, OS_LOG_TYPE_INFO, "update timer fired", v5, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateConfigurationIfNecessary");

}

- (BOOL)forceLoadConfigurationFromDisk
{
  NSObject *internalQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__RemoteConfigurationController_forceLoadConfigurationFromDisk__block_invoke;
  v5[3] = &unk_1EA3EC3A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __63__RemoteConfigurationController_forceLoadConfigurationFromDisk__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_urlOfDownloadedConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

    if ((v4 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isEqualToDictionary:", v5) & 1) == 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v5);
          objc_msgSend(*(id *)(a1 + 32), "_initializeProviderConfigurationsWithConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
          objc_msgSend(*(id *)(a1 + 32), "_notifyProviderConfigurationsDidChangeIfNecessary");
        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }

    }
    else
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 56);
      if (v7)
      {
        *(_QWORD *)(v6 + 56) = 0;

        objc_msgSend(*(id *)(a1 + 32), "_initializeToDefaultProviderConfigurations");
        objc_msgSend(*(id *)(a1 + 32), "_notifyProviderConfigurationsDidChangeIfNecessary");
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (BOOL)forceUpdateConfigurationFromServer
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  BOOL v12;
  _QWORD v14[4];
  NSObject *v15;
  RemoteConfigurationController *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  -[RemoteConfigurationController _setCurrentDateAsLastConfigurationUpdateAttemptDate](self, "_setCurrentDateAsLastConfigurationUpdateAttemptDate");
  v3 = dispatch_semaphore_create(0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  configurationBaseURL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SafeBrowsingRemoteConfiguration-1"), "stringByAppendingPathExtension:", CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke;
  v14[3] = &unk_1EA3EC3F8;
  v17 = &v18;
  v9 = v3;
  v15 = v9;
  v16 = self;
  objc_msgSend(v5, "dataTaskWithURL:completionHandler:", v8, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

  v11 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    v12 = 0;
    *((_BYTE *)v19 + 24) = 0;
  }
  else
  {
    v12 = *((_BYTE *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[5];
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v8, "statusCode") == 404)
    {
      v12 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v13 = *(NSObject **)(v11 + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke_2;
      block[3] = &unk_1EA3EC2E0;
      block[4] = v11;
      v26 = v12;
      dispatch_async(v13, block);
      v14 = v26;
    }
    else
    {
      v15 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke_3;
      v20[3] = &unk_1EA3EC3D0;
      v16 = v7;
      v17 = *(_QWORD *)(a1 + 48);
      v21 = v16;
      v24 = v17;
      v18 = *(id *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      v22 = v18;
      v23 = v19;
      dispatch_async(v15, v20);

      v14 = v21;
    }

  }
}

intptr_t __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setCurrentConfigurationOnInternalQueue:", 0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", *(_QWORD *)(a1 + 32), 0, 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 48), "_setCurrentConfigurationOnInternalQueue:", v2);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (ProviderConfiguration)googleProviderConfiguration
{
  return self->_googleProviderConfiguration;
}

- (ProviderConfiguration)tencentProviderConfiguration
{
  return self->_tencentProviderConfiguration;
}

- (ProviderConfiguration)appleProviderConfiguration
{
  return self->_appleProviderConfiguration;
}

- (NSDictionary)currentConfiguration
{
  return self->_currentConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_appleProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_tencentProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_googleProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1DBCBE000, v0, v1, "Mach-O header not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1DBCBE000, v0, v1, "Could not find LC_SOURCE_VERSION Mach-O command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_3(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1DBCBE000, a2, OS_LOG_TYPE_ERROR, "Mach-O header has incorrect magic: %04x", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_initializeProviderConfigurationsWithConfiguration:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1DBCBE000, v0, OS_LOG_TYPE_FAULT, "Unable to determine SafariSafeBrowsing's version", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_initializeProviderConfigurationsWithConfiguration:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DBCBE000, log, OS_LOG_TYPE_ERROR, "Skipped an version range in the configuration. Missing min or max versions entries in dictionary", buf, 2u);
}

- (void)_urlOfDownloadedConfiguration
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1DBCBE000, v3, v4, "Failed to create Safe Browsing settings directory with error: %{public}@", v5);

  OUTLINED_FUNCTION_0();
}

void __70__RemoteConfigurationController__loadConfigurationFromDiskIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DBCBE000, a2, OS_LOG_TYPE_ERROR, "The downloaded configuration could not be loaded from %@", (uint8_t *)&v2, 0xCu);
}

- (void)_writeConfigurationToDisk:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1DBCBE000, v3, v4, "Failed to remove remote configuration file: %{public}@", v5);

  OUTLINED_FUNCTION_0();
}

void __77__RemoteConfigurationController__downloadConfigurationWithCompletionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1DBCBE000, v3, v4, "Failed to get configuration data from server with error: %{public}@", v5);

  OUTLINED_FUNCTION_0();
}

- (void)_didReceiveConfigurationData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1DBCBE000, v3, v4, "Failed to read configuration data received from server with error: %{public}@", v5);

  OUTLINED_FUNCTION_0();
}

@end
