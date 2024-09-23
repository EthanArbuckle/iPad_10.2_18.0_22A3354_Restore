@implementation PKPlugInCore

- (BOOL)isData
{
  void *v2;
  char v3;

  -[PKPlugInCore protocolSpec](self, "protocolSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(CFSTR("#Data"), "isEqual:", v2);

  return v3;
}

- (id)protocolSpec
{
  __CFString *v3;

  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("NSExtensionProtocol"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[PKPlugInCore isAppExtension](self, "isAppExtension"))
      v3 = CFSTR("NSObject");
    else
      v3 = 0;
  }
  return v3;
}

- (NSString)path
{
  void *v2;
  void *v3;

  -[PKPlugInCore url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isAppExtension
{
  void *v2;
  void *v3;
  char v4;

  -[PKPlugInCore url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".appex"));

  return v4;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)_loadLocalizedNames
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *localizedName;
  NSString *v13;
  NSObject *localizedShortName;
  _BOOL4 v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  NSString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1AF45AD14](self, a2);
  -[PKPlugInCore external](self, "external");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasLSDatabaseAccess");

  if (!v6)
    goto LABEL_7;
  -[PKPlugInCore external](self, "external");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "plugInRecordForUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "localizedName");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedName = self->_localizedName;
    self->_localizedName = v11;

    objc_msgSend(v10, "localizedShortName");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedShortName = self->_localizedShortName;
    self->_localizedShortName = v13;
  }
  else
  {
    pklog_handle_for_category(3);
    localizedShortName = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(localizedShortName, OS_LOG_TYPE_ERROR))
      sub_1AF27666C(self);
  }

  if (!v10)
  {
LABEL_7:
    v32 = 0;
    v15 = -[PKPlugInCore useBundle:error:](self, "useBundle:error:", CFSTR("."), &v32);
    v16 = v32;
    if (v15)
    {
      -[PKPlugInCore external](self, "external");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filesystem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore url](self, "url");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleWithURL:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      -[NSObject localizedInfoDictionary](v20, "localizedInfoDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (!v22)
      {
        -[PKPlugInCore bundleInfoDictionary](self, "bundleInfoDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&self->_localizedName, v23);
      if (!v22)
      {

      }
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (!v24)
      {
        -[PKPlugInCore bundleInfoDictionary](self, "bundleInfoDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&self->_localizedShortName, v25);
      if (!v24)
      {

      }
      pklog_handle_for_category(3);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        -[PKPlugInCore uuid](self, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore identifier](self, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore version](self, "version");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = self->_localizedName;
        v31 = self->_localizedShortName;
        *(_DWORD *)buf = 138544386;
        v34 = v27;
        v35 = 2112;
        v36 = v28;
        v37 = 2112;
        v38 = v29;
        v39 = 2112;
        v40 = v30;
        v41 = 2112;
        v42 = v31;
        _os_log_debug_impl(&dword_1AF254000, v26, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] BundleInfo[BundleDisplayName] is [%@], BundleInfo[BundleName] is [%@]", buf, 0x34u);

      }
    }
    else
    {
      pklog_handle_for_category(4);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        sub_1AF2765DC(self, v16, v20);
    }

  }
  objc_autoreleasePoolPop(v3);
}

- (PKExternalProviders)external
{
  return self->_external;
}

- (BOOL)isDedicated
{
  void *v2;
  char v3;

  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("Dedicated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)infoKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPlugInCore bundleInfoDictionary](self, "bundleInfoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_1AF254000, v7, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] info [%@] => [%@]", (uint8_t *)&v12, 0x34u);

  }
  return v6;
}

- (NSDictionary)bundleInfoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)localizedShortName
{
  PKPlugInCore *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *localizedShortName;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedShortName)
    -[PKPlugInCore _loadLocalizedNames](v2, "_loadLocalizedNames");
  objc_sync_exit(v2);

  pklog_handle_for_category(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PKPlugInCore uuid](v2, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](v2, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    localizedShortName = v2->_localizedShortName;
    v9 = 138544130;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = localizedShortName;
    _os_log_impl(&dword_1AF254000, v3, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] got localized short name: %@", (uint8_t *)&v9, 0x2Au);

  }
  return v2->_localizedShortName;
}

- (NSString)localizedName
{
  PKPlugInCore *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *localizedName;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedName)
    -[PKPlugInCore _loadLocalizedNames](v2, "_loadLocalizedNames");
  objc_sync_exit(v2);

  pklog_handle_for_category(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PKPlugInCore uuid](v2, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](v2, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    localizedName = v2->_localizedName;
    v9 = 138544130;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = localizedName;
    _os_log_impl(&dword_1AF254000, v3, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] got localized name: %@", (uint8_t *)&v9, 0x2Au);

  }
  return v2->_localizedName;
}

- (BOOL)setupWithForm:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  NSObject *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  _BOOL4 v39;
  const char *v40;
  void *v41;
  void *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v5, "initFileURLWithPath:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("discoveryInstanceUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
  else
    v8 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("epPlatform"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v9, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);
  LODWORD(v15) = -[PKPlugInCore setupWithName:extensionPointPlatform:url:bundleInfo:uuid:discoveryInstanceUUID:extensionPointCache:](self, "setupWithName:extensionPointPlatform:url:bundleInfo:uuid:discoveryInstanceUUID:extensionPointCache:", v10, v15, v44, v11, v14, v8, 0);

  if ((_DWORD)v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hubProtocolVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setHubProtocolVersion:](self, "setHubProtocolVersion:", objc_msgSend(v16, "unsignedIntegerValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hubProtocolVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      -[PKPlugInCore setHubProtocolVersion:](self, "setHubProtocolVersion:", 1);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("original-identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setOriginalIdentifier:](self, "setOriginalIdentifier:", v18);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hash"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setCdhash:](self, "setCdhash:", v19);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requirement"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setRequirement:](self, "setRequirement:", v20);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastmodified"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setLastModified:](self, "setLastModified:", objc_msgSend(v21, "longValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitlements"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setEntitlements:](self, "setEntitlements:", v22);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("containingPath"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v23);
      -[PKPlugInCore setContainingUrl:](self, "setContainingUrl:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("containingBundleIdentifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setContainingBundleIdentifier:](self, "setContainingBundleIdentifier:", v25);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemResident"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setOnSystemVolume:](self, "setOnSystemVolume:", objc_msgSend(v26, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotations"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setAnnotations:](self, "setAnnotations:", v27);

    pklog_handle_for_category(6);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      -[PKPlugInCore identifier](self, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore annotations](self, "annotations");
      v43 = v7;
      v30 = v23;
      v31 = v15;
      v15 = (uint64_t)v9;
      v32 = v8;
      v33 = v17;
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v29;
      v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_1AF254000, v28, OS_LOG_TYPE_INFO, "%@: annotations = %@", buf, 0x16u);

      v17 = v33;
      v8 = v32;
      v9 = (void *)v15;
      LOBYTE(v15) = v31;
      v23 = v30;
      v7 = v43;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedContainingDisplayName"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setLocalizedContainingName:](self, "setLocalizedContainingName:", v35);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRBManaged"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setIsRBManaged:](self, "setIsRBManaged:", objc_msgSend(v36, "BOOLValue"));

    pklog_handle_for_category(6);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      -[PKPlugInCore identifier](self, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[PKPlugInCore isRBManaged](self, "isRBManaged");
      v40 = "will not";
      if (v39)
        v40 = "will";
      *(_DWORD *)buf = 138412546;
      v46 = v38;
      v47 = 2080;
      v48 = v40;
      _os_log_impl(&dword_1AF254000, v37, OS_LOG_TYPE_INFO, "%@: %s be managed by runningboard", buf, 0x16u);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("launchPersonas"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setLaunchPersonas:](self, "setLaunchPersonas:", v41);

  }
  return v15;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)setupWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  NSObject *p_super;
  BOOL v27;
  void *v28;
  NSUUID *v29;
  NSObject *log;
  id v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = v21;
  if (!v17)
    goto LABEL_22;
  if (v16)
  {
    self->_extensionPointPlatform = a4;
    if (!v18)
      goto LABEL_16;
    if (v21)
    {
      v32 = v20;
      -[PKPlugInCore normalizeInfoDictionary:](self, "normalizeInfoDictionary:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore resolveSDKWithInfoPlist:extensionPointCache:](self, "resolveSDKWithInfoPlist:extensionPointCache:", v23, v22);
      v24 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v24;
      v25 = -[PKPlugInCore setDictionaries:](self, "setDictionaries:", v24);
      if (v25)
      {
        -[PKPlugInCore canonicalize](self, "canonicalize");
        v20 = v32;
      }
      else
      {
        pklog_handle_for_category(6);
        log = objc_claimAutoreleasedReturnValue();
        v20 = v32;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v35 = v32;
          v36 = 2114;
          v37 = v16;
          v38 = 2114;
          v39 = v17;
          v40 = 2114;
          v41 = v18;
          _os_log_error_impl(&dword_1AF254000, log, OS_LOG_TYPE_ERROR, "[d %@] malformed plugin dictionary in plugin [%{public}@] at [%{public}@]: %{public}@", buf, 0x2Au);
        }

      }
      if (v25)
        goto LABEL_16;
LABEL_22:
      v27 = 0;
      goto LABEL_23;
    }
    if (-[PKPlugInCore setDictionaries:](self, "setDictionaries:", v18))
    {
LABEL_16:
      objc_storeStrong((id *)&self->_identifier, a3);
      objc_storeStrong((id *)&self->_url, a5);
      v28 = v19;
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&self->_uuid, v28);
      if (!v19)

      v29 = (NSUUID *)v20;
      p_super = &self->_discoveryInstanceUUID->super;
      self->_discoveryInstanceUUID = v29;
      v27 = 1;
      goto LABEL_21;
    }
    pklog_handle_for_category(6);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v35 = v20;
      v36 = 2114;
      v37 = v16;
      v38 = 2114;
      v39 = v17;
      v40 = 2114;
      v41 = v18;
      _os_log_error_impl(&dword_1AF254000, p_super, OS_LOG_TYPE_ERROR, "[d %@] malformed plugin dictionary in plugin [%{public}@] at [%{public}@]: %{public}@", buf, 0x2Au);
      v27 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    pklog_handle_for_category(6);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      sub_1AF276164((uint64_t)v20, v17);
      v27 = 0;
      goto LABEL_21;
    }
  }
  v27 = 0;
LABEL_21:

LABEL_23:
  return v27;
}

- (void)setRequirement:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void)setOriginalIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setOnSystemVolume:(BOOL)a3
{
  self->_onSystemVolume = a3;
}

- (void)setLocalizedContainingName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void)setLaunchPersonas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setLastModified:(int64_t)a3
{
  self->_lastModified = a3;
}

- (void)setIsRBManaged:(BOOL)a3
{
  self->_isRBManaged = a3;
}

- (void)setHubProtocolVersion:(unint64_t)a3
{
  self->_hubProtocolVersion = a3;
}

- (void)setEntitlements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)setDictionaries:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_bundleInfoDictionary, a3);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&self->_plugInDictionary, v6);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Multiple"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        pklog_handle_for_category(6);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[PKPlugInCore discoveryInstanceUUID](self, "discoveryInstanceUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPlugInCore uuid](self, "uuid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPlugInCore identifier](self, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPlugInCore version](self, "version");
          *(_DWORD *)buf = 138413314;
          v17 = v15;
          v18 = 2114;
          v19 = v9;
          v20 = 2112;
          v21 = v10;
          v22 = 2112;
          v23 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v23;
          v24 = 2114;
          v25 = CFSTR("Multiple");
          _os_log_impl(&dword_1AF254000, v8, OS_LOG_TYPE_DEFAULT, "[d %@] [u %{public}@] [%@(%@)] multiplexed plug-ins (%{public}@ key) obsolete and ignored", buf, 0x34u);

        }
      }
      -[PKPlugInCore plugInDictionary](self, "plugInDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)setContainingUrl:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setContainingBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setCdhash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setAnnotations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)isRBManaged
{
  return self->_isRBManaged;
}

- (PKPlugInCore)initWithForm:(id)a3 externalProviders:(id)a4
{
  id v6;
  PKPlugInCore *v7;
  PKPlugInCore *v8;

  v6 = a3;
  v7 = -[PKPlugInCore initWithExternalProviders:](self, "initWithExternalProviders:", a4);
  v8 = v7;
  if (v7 && !-[PKPlugInCore setupWithForm:](v7, "setupWithForm:", v6))
  {

    v8 = 0;
  }

  return v8;
}

- (PKPlugInCore)initWithExternalProviders:(id)a3
{
  id v5;
  PKPlugInCore *v6;
  PKPlugInCore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPlugInCore;
  v6 = -[PKPlugInCore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_external, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PKPlugInCore uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    sub_1AF27613C();

  -[PKPlugInCore uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPlugInCore *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PKPlugInCore *)a3;
  -[PKPlugInCore uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    sub_1AF276114();

  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKPlugInCore uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore uuid](v4, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (id)export:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[11];
  _QWORD v40[13];

  v40[11] = *MEMORY[0x1E0C80C00];
  -[PKPlugInCore bundleInfoDictionary](self, "bundleInfoDictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("CFBundleInfoPlistURL"));
  v34 = (void *)MEMORY[0x1E0C99E08];
  v39[0] = CFSTR("hubProtocolVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPlugInCore hubProtocolVersion](self, "hubProtocolVersion"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v37;
  v39[1] = CFSTR("path");
  -[PKPlugInCore path](self, "path");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v36;
  v39[2] = CFSTR("systemResident");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPlugInCore onSystemVolume](self, "onSystemVolume"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v35;
  v39[3] = CFSTR("identifier");
  -[PKPlugInCore identifier](self, "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v33;
  v39[4] = CFSTR("original-identifier");
  -[PKPlugInCore originalIdentifier](self, "originalIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v32;
  v39[5] = CFSTR("version");
  -[PKPlugInCore version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKPlugInCore version](self, "version");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("<none>");
  }
  v40[5] = v7;
  v40[6] = v5;
  v38 = v5;
  v39[6] = CFSTR("bundleInfo");
  v39[7] = CFSTR("uuid");
  -[PKPlugInCore uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v9;
  v39[8] = CFSTR("lastmodified");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[PKPlugInCore lastModified](self, "lastModified"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v10;
  v39[9] = CFSTR("annotations");
  -[PKPlugInCore annotations](self, "annotations");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = MEMORY[0x1E0C9AA70];
  if (v11)
    v13 = v11;
  v40[9] = v13;
  v39[10] = CFSTR("isRBManaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPlugInCore isRBManaged](self, "isRBManaged"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[10] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  -[PKPlugInCore entitlements](self, "entitlements");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PKPlugInCore entitlements](self, "entitlements");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("entitlements"));

  }
  -[PKPlugInCore containingPath](self, "containingPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PKPlugInCore containingPath](self, "containingPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("containingPath"));

  }
  -[PKPlugInCore containingBundleIdentifier](self, "containingBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[PKPlugInCore containingBundleIdentifier](self, "containingBundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("containingBundleIdentifier"));

  }
  -[PKPlugInCore localizedContainingName](self, "localizedContainingName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PKPlugInCore localizedContainingName](self, "localizedContainingName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("localizedContainingDisplayName"));

  }
  -[PKPlugInCore discoveryInstanceUUID](self, "discoveryInstanceUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[PKPlugInCore discoveryInstanceUUID](self, "discoveryInstanceUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, CFSTR("discoveryInstanceUUID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PKPlugInCore extensionPointPlatform](self, "extensionPointPlatform"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, CFSTR("epPlatform"));

  -[PKPlugInCore launchPersonas](self, "launchPersonas");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[PKPlugInCore launchPersonas](self, "launchPersonas");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, CFSTR("launchPersonas"));

  }
  return v16;
}

- (NSString)version
{
  -[PKPlugInCore attribute:](self, "attribute:", CFSTR("NSExtensionVersion"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)attribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKPlugInCore attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)attributes
{
  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("NSExtensionAttributes"));
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)pluginKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKPlugInCore plugInDictionary](self, "plugInDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)plugInDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)containingPath
{
  void *v2;
  void *v3;

  -[PKPlugInCore containingUrl](self, "containingUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)containingUrl
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)localizedContainingName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSUUID)discoveryInstanceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)containingBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKPlugInCore entitlements](self, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)onSystemVolume
{
  return self->_onSystemVolume;
}

- (NSArray)launchPersonas
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (NSDictionary)annotations
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)originalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)lastModified
{
  return self->_lastModified;
}

- (unint64_t)hubProtocolVersion
{
  return self->_hubProtocolVersion;
}

- (unsigned)extensionPointPlatform
{
  return self->_extensionPointPlatform;
}

- (void)updateFromForm:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v16;
  unint64_t v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v24;
  uint64_t v25;
  _BYTE v26[40];
  _BYTE v27[32];
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pklog_handle_for_category(10);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1AF2763BC((uint64_t)self, (uint64_t)v4, (uint64_t)v5, v6, v7, v8, v9, v10, v24, *(__int128 *)v26, *(void **)&v26[16], *(__int128 *)&v26[24], *(uint64_t *)v27, *(uint64_t *)&v27[8], *(uint64_t *)&v27[16], *(uint64_t *)&v27[24], v28, v29, *((uint64_t *)&v29 + 1),
      v30,
      v31,
      v32);

  if (!-[PKPlugInCore annotationTimestamp](self, "annotationTimestamp"))
    goto LABEL_21;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotations"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bootuuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = v12 == 0;
  else
    v15 = 1;
  v16 = !v15;
  if (v15)
  {
    v18 = 1;
    if (!v16)
      goto LABEL_16;
    goto LABEL_15;
  }
  -[PKPlugInCore bootInstance](self, "bootInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", v13))
  {
    v17 = objc_msgSend(v14, "unsignedLongLongValue");
    v18 = v17 <= -[PKPlugInCore annotationTimestamp](self, "annotationTimestamp");
    if (!v16)
      goto LABEL_16;
LABEL_15:

    goto LABEL_16;
  }
  v18 = 1;
  if (v16)
    goto LABEL_15;
LABEL_16:
  if (!v18)
  {

LABEL_21:
    -[PKPlugInCore setAnnotationTimestamp:](self, "setAnnotationTimestamp:", 0);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotations"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore setAnnotations:](self, "setAnnotations:", v23);

    goto LABEL_22;
  }
  pklog_handle_for_category(10);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPlugInCore uuid](self, "uuid");
    *(_QWORD *)v26 = objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v14, "unsignedLongLongValue");
    -[PKPlugInCore bootInstance](self, "bootInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)&v26[8] = 138545154;
    *(_QWORD *)&v26[12] = *(_QWORD *)v26;
    *(_WORD *)&v26[20] = 2112;
    *(_QWORD *)&v26[22] = v20;
    *(_WORD *)&v26[30] = 2112;
    *(_QWORD *)&v26[32] = v21;
    *(_WORD *)v27 = 2080;
    *(_QWORD *)&v27[2] = "-[PKPlugInCore updateFromForm:]";
    *(_WORD *)&v27[10] = 2112;
    *(_QWORD *)&v27[12] = v12;
    *(_WORD *)&v27[20] = 2048;
    *(_QWORD *)&v27[22] = v25;
    *(_WORD *)&v27[30] = 2112;
    v28 = (uint64_t)v22;
    LOWORD(v29) = 2048;
    *(_QWORD *)((char *)&v29 + 2) = -[PKPlugInCore annotationTimestamp](self, "annotationTimestamp");
    _os_log_impl(&dword_1AF254000, v19, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] %s ignoring annotation update (%@, %llu) vs. (%@, %llu)", &v26[8], 0x52u);

  }
LABEL_22:

}

- (void)setAnnotationTimestamp:(unint64_t)a3
{
  self->_annotationTimestamp = a3;
}

- (unint64_t)annotationTimestamp
{
  return self->_annotationTimestamp;
}

- (PKPlugInCore)init
{
  void *v3;
  PKPlugInCore *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[PKPlugInCore initWithExternalProviders:](self, "initWithExternalProviders:", v3);

  return v4;
}

- (PKPlugInCore)initWithName:(id)a3 extensionPointPlatform:(unsigned int)a4 url:(id)a5 bundleInfo:(id)a6 uuid:(id)a7 discoveryInstanceUUID:(id)a8 extensionPointCache:(id)a9 externalProviders:(id)a10
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PKPlugInCore *v22;
  PKPlugInCore *v23;

  v14 = *(_QWORD *)&a4;
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = -[PKPlugInCore initWithExternalProviders:](self, "initWithExternalProviders:", a10);
  v23 = v22;
  if (v22
    && !-[PKPlugInCore setupWithName:extensionPointPlatform:url:bundleInfo:uuid:discoveryInstanceUUID:extensionPointCache:](v22, "setupWithName:extensionPointPlatform:url:bundleInfo:uuid:discoveryInstanceUUID:extensionPointCache:", v16, v14, v17, v18, v19, v20, v21))
  {

    v23 = 0;
  }

  return v23;
}

- (id)normalizeInfoDictionary:(id)a3
{
  return a3;
}

- (void)canonicalize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  -[PKPlugInCore attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E08];
  -[PKPlugInCore plugInDictionary](self, "plugInDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("NSExtensionAttributes"));
  -[PKPlugInCore setPlugInDictionary:](self, "setPlugInDictionary:", v7);
  -[PKPlugInCore attribute:](self, "attribute:", CFSTR("NSExtensionVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[PKPlugInCore infoKey:](self, "infoKey:", CFSTR("CFBundleShortVersionString"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = (__CFString *)v9;
    else
      v10 = CFSTR("1");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("NSExtensionVersion"));

  }
}

+ (id)readSDKDictionary:(id)a3 forPlatform:(unsigned int)a4 externalProviders:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  int v22;
  id v23;
  uint64_t v24;

  v6 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  pklog_handle_for_category(3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, v7);

  pklog_handle_for_category(3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v22 = 138543362;
    v23 = v7;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "LSSDKDictionary", " name=%{public, signpost.description:attribute}@ ", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(v8, "ls");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extensionPointForIdentifier:platform:", v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sdkEntry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(3);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v22 = 138543362;
    v23 = v7;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v18, OS_SIGNPOST_INTERVAL_END, v10, "LSSDKDictionary", " name=%{public, signpost.description:attribute}@ ", (uint8_t *)&v22, 0xCu);
  }

  if (v16)
  {
    v19 = v16;
  }
  else
  {
    pklog_handle_for_category(3);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1AF27620C((uint64_t)v7, v6, v20);

    v19 = 0;
  }

  return v19;
}

- (id)resolveSDKWithInfoPlist:(id)a3 extensionPointCache:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKPlugInCore.m"), 361, CFSTR("cannot resolve SDK without materialized Info.plist"));

  }
  -[PKPlugInCore sdkDictionaryWithInfoPlist:extensionPointCache:](self, "sdkDictionaryWithInfoPlist:extensionPointCache:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v11 = v10;
  if (v9)
  {
    -[PKPlugInCore mergeSDKDictionary:intoExtensionDictionary:](self, "mergeSDKDictionary:intoExtensionDictionary:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)mergeSDKDictionary:(id)a3 intoExtensionDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  -[PKPlugInCore sdkOnlyKeyPaths](self, "sdkOnlyKeyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_removeItemsAtKeyPaths:", v8);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v30[0] = CFSTR("NSExtension");
  v30[1] = CFSTR("Shared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObjects:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1AF26847C;
  v19[3] = &unk_1E5F40D90;
  v19[4] = self;
  objc_msgSend(v7, "pk_overlayDictionary:existingValuesTakePrecedent:exceptKeyPaths:exemptionHandler:", v6, 1, v11, v19);

  pklog_handle_for_category(6);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("XPCService"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    v27 = v17;
    v28 = 2112;
    v29 = v18;
    _os_log_debug_impl(&dword_1AF254000, v12, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] Merged plugin dictionary; NSExtension = %@, XPCService = %@",
      buf,
      0x34u);

  }
  return v7;
}

- (id)sdkOnlyKeyPaths
{
  if (qword_1ECDD7018 != -1)
    dispatch_once(&qword_1ECDD7018, &unk_1E5F404F8);
  return (id)qword_1ECDD7010;
}

- (id)mergeSharedResources:(id)a3 into:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a3;
  objc_msgSend(v5, "setWithArray:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v6);

  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)diagnose
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  int v26;
  __CFString *v27;
  __CFString **v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v34;

  -[PKPlugInCore identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v27 = CFSTR("missing identifier (no NSExtensionIdentifier, nor even CFBundleIdentifier)");
LABEL_21:
    pkErrorf(12, v27, v5, v6, v7, v8, v9, v10, (uint64_t)v34);
    goto LABEL_22;
  }
  -[PKPlugInCore protocolSpec](self, "protocolSpec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v28 = PKProtocolInfoKey;
LABEL_10:
    pkErrorf(12, CFSTR("missing \"%@\" key in Info.plist or SDK"), v12, v13, v14, v15, v16, v17, (uint64_t)*v28);
LABEL_22:
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    return v32;
  }
  -[PKPlugInCore attributes](self, "attributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v28 = PKAttributesInfoKey;
    goto LABEL_10;
  }
  v25 = -[PKPlugInCore isAppExtension](self, "isAppExtension");
  if (!v25)
  {
    v26 = 0;
    goto LABEL_17;
  }
  -[PKPlugInCore principalSpec](self, "principalSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("NSObject")) & 1) != 0)
  {
    v26 = 0;
    goto LABEL_17;
  }
  if (!pkUseInternalDiagnostics())
  {
    v26 = 1;
LABEL_17:
    if (v25)
      goto LABEL_18;
LABEL_13:
    if (!v26)
      goto LABEL_19;
    goto LABEL_14;
  }
  -[PKPlugInCore url](self, "url");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "path");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v30, "hasPrefix:", CFSTR("/AppleInternal/")) ^ 1;

  if (!v25)
    goto LABEL_13;
LABEL_18:

  if (v26)
  {
LABEL_14:
    pkErrorf(12, CFSTR("Application Extensions may not use the \"%@\" key"), v19, v20, v21, v22, v23, v24, (uint64_t)CFSTR("PrincipalClass"));
    goto LABEL_22;
  }
LABEL_19:
  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("PassProxy"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v34 = CFSTR("PassProxy");
    v27 = CFSTR("the \"%@\" key is not supported on this platform");
    goto LABEL_21;
  }
  if (-[PKPlugInCore isHybrid](self, "isHybrid"))
  {
    pkError(12, CFSTR("hybrid plug-ins are not supported on this platform"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  return v32;
}

- (NSString)bootInstance
{
  if (qword_1EEE37658 != -1)
    dispatch_once(&qword_1EEE37658, &unk_1E5F40DB0);
  return (NSString *)(id)qword_1EEE37688;
}

- (void)setAnnotation:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKPlugInCore setAnnotationTimestamp:](self, "setAnnotationTimestamp:", mach_continuous_time());
  -[PKPlugInCore annotations](self, "annotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "dictionaryChanging:to:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore setAnnotations:](self, "setAnnotations:", v10);

  pklog_handle_for_category(10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544642;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v21 = 2080;
    v20 = v14;
    v22 = "-[PKPlugInCore setAnnotation:value:]";
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl(&dword_1AF254000, v11, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] %s set annotation %@ : %@", (uint8_t *)&v15, 0x3Eu);

  }
}

- (BOOL)oldStyle
{
  void *v4;
  void *v5;
  void *v7;

  -[PKPlugInCore infoKey:](self, "infoKey:", CFSTR("NSExtension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PKPlugInCore infoKey:](self, "infoKey:", CFSTR("PlugInKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKPlugInCore.m"), 570, CFSTR("unknown plug-in configuration style"));

    }
  }
  return v4 == 0;
}

- (NSString)principalSpec
{
  __CFString *v3;

  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("PrincipalClass"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[PKPlugInCore isAppExtension](self, "isAppExtension"))
      v3 = CFSTR("NSObject");
    else
      v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)sdkSpec
{
  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("NSExtensionPointIdentifier"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)embeddedCodePath
{
  return 0;
}

- (id)embeddedProtocolSpec
{
  void *v3;

  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("EmbeddedProtocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PKPlugInCore protocolSpec](self, "protocolSpec");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isMultiplexed
{
  return 0;
}

- (BOOL)isHybrid
{
  void *v2;
  BOOL v3;

  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("EmbeddedCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSDate)timestamp
{
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)-[PKPlugInCore lastModified](self, "lastModified"));
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldTerminateOnHold
{
  void *v2;
  char v3;

  -[PKPlugInCore pluginKey:](self, "pluginKey:", CFSTR("NSExtensionShouldTerminateOnHold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasEntitlement:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  -[PKPlugInCore valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isEqual:", MEMORY[0x1E0C9AAA0]) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)usesHostPersona
{
  void *v2;
  char v3;
  NSObject *v4;

  -[PKPlugInCore valueForEntitlement:](self, "valueForEntitlement:", CFSTR("com.apple.private.pluginkit.persona"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pklog_handle_for_category(7);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1AF2764BC();

    goto LABEL_7;
  }
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("host"));
LABEL_8:

  return v3;
}

- (id)augmentInterface:(id)a3
{
  return 0;
}

- (void)localizedInfoDictionaryForKeys:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void (**v27)(id, void *, void *);
  id v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_bundleInfoDictionary)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v11)
    {
      v27 = v7;
      v28 = v6;
      v30 = 0;
      v12 = *(_QWORD *)v32;
      v29 = *MEMORY[0x1E0CB2D50];
      while (1)
      {
        v13 = 0;
        if (v11 <= 1)
          v14 = 1;
        else
          v14 = v11;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("CFBundleName")))
          {
            -[PKPlugInCore localizedShortName](self, "localizedShortName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
              goto LABEL_14;
          }
          else if (!objc_msgSend(v15, "isEqualToString:", CFSTR("CFBundleDisplayName"))
                 || (-[PKPlugInCore localizedName](self, "localizedName"),
                     (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
LABEL_14:
            -[PKPlugInCore infoKey:](self, "infoKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              -[NSDictionary objectForKey:](self->_bundleInfoDictionary, "objectForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v16)
                goto LABEL_18;
            }
          }
          if (!objc_msgSend(v16, "conformsToProtocol:", &unk_1EEE3D000))
          {

            v17 = (void *)MEMORY[0x1E0CB35C8];
            v37 = v29;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value of info dictionary key \"%@\" for plugin %@ does not conform to secure coding!"), v15, self->_identifier);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PlugInKit"), -1, v19);
            v20 = v10;
            v21 = objc_claimAutoreleasedReturnValue();

            v30 = (void *)v21;
            v10 = v20;
            v9 = 0;

            goto LABEL_22;
          }
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);
LABEL_18:

          ++v13;
        }
        while (v14 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (!v11)
        {
LABEL_22:
          v7 = v27;
          v6 = v28;
          v22 = v30;
          goto LABEL_25;
        }
      }
    }
    v22 = 0;
  }
  else
  {

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to resolve plugin for %@"), self->_identifier);
    v24 = objc_claimAutoreleasedReturnValue();
    v36 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("PlugInKit"), -1, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)v24;
    v9 = 0;
  }
LABEL_25:

  pklog_handle_for_category(3);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    sub_1AF27654C(self, v9, v26);

  v7[2](v7, v9, v22);
}

- (NSDictionary)localizedFileProviderActionNames
{
  PKPlugInCore *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localizedFileProviderActionNames)
    -[PKPlugInCore _loadLocalizedFileProviderActionNames](v2, "_loadLocalizedFileProviderActionNames");
  objc_sync_exit(v2);

  return v2->_localizedFileProviderActionNames;
}

- (BOOL)useBundle:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)_loadLocalizedFileProviderActionNames
{
  void *v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *localizedFileProviderActionNames;
  NSObject *v13;
  id v14;

  v3 = (void *)MEMORY[0x1AF45AD14](self, a2);
  v14 = 0;
  v4 = -[PKPlugInCore useBundle:error:](self, "useBundle:error:", CFSTR("."), &v14);
  v5 = v14;
  if (v4)
  {
    -[PKPlugInCore external](self, "external");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filesystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore url](self, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleWithURL:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    -[PKPlugInCore plugInDictionary](self, "plugInDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore _localizedFileProviderActionNamesForPKDict:fromBundle:](self, "_localizedFileProviderActionNamesForPKDict:fromBundle:", v10, v9);
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedFileProviderActionNames = self->_localizedFileProviderActionNames;
    self->_localizedFileProviderActionNames = v11;

    pklog_handle_for_category(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1AF276710(self, &self->_localizedFileProviderActionNames, v13);

  }
  else
  {
    pklog_handle_for_category(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_1AF2767D0(self, v5, v9);
  }

  objc_autoreleasePoolPop(v3);
}

- (id)_localizedFileProviderActionNamesForPKDict:(id)a3 fromBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  PKPlugInCore *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)MEMORY[0x1AF45AD14]();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSExtensionFileProviderActions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1AF2695FC;
    v14[3] = &unk_1E5F40DD8;
    v15 = v8;
    v16 = v7;
    v17 = self;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

    v11 = v15;
  }
  else
  {
    pklog_handle_for_category(3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1AF276860(self, v11);
  }

  objc_autoreleasePoolPop(v9);
  v12 = (void *)objc_msgSend(v8, "copy");

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PKPlugInCore uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore discoveryInstanceUUID](self, "discoveryInstanceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<[u %@] [%@(%@)],[d %@] [%@]>"), v4, v5, v6, v7, v8);

  return v9;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PKPlugInCore uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPlugInCore isAppExtension](self, "isAppExtension");
  v7 = -[PKPlugInCore onSystemVolume](self, "onSystemVolume");
  -[PKPlugInCore containingBundleIdentifier](self, "containingBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPlugInCore lastModified](self, "lastModified");
  -[PKPlugInCore discoveryInstanceUUID](self, "discoveryInstanceUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore path](self, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("<PKPlugInCore: %p; uuid = [%@], identifier = [%@(%@)], isAppExtension = %d, onSystemVolume = %d, containingBundle = [%@], lastModified = %ld, discoveryInstanceUUID = [%@], path = [%@]>"),
                  self,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10,
                  v11);

  return v12;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setBundleInfoDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setPlugInDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSData)cdhash
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)requirement
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_discoveryInstanceUUID, 0);
  objc_storeStrong((id *)&self->_launchPersonas, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_requirement, 0);
  objc_storeStrong((id *)&self->_cdhash, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_localizedFileProviderActionNames, 0);
  objc_storeStrong((id *)&self->_localizedContainingName, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_plugInDictionary, 0);
  objc_storeStrong((id *)&self->_bundleInfoDictionary, 0);
  objc_storeStrong((id *)&self->_containingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containingUrl, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_originalIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
