@implementation TRINamespaceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceAttributionIdentifier, 0);
  objc_storeStrong((id *)&self->_upgradeNCVs, 0);
  objc_storeStrong((id *)&self->_appContainer, 0);
  objc_storeStrong((id *)&self->_factorsURL, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

+ (id)loadWithNamespaceName:(id)a3 fromDirectory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "descriptorPathForNamespaceName:fromDirectory:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadFromFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(v8, "namespaceName"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v6, "isEqualToString:", v9),
        v9,
        (v10 & 1) == 0))
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "namespaceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v14;
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "namespace descriptor loaded from file has unexpected namespace name: %@ != %@", (uint8_t *)&v15, 0x16u);

    }
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

+ (id)loadFromFile:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  TRINamespaceDescriptor *v7;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        v10 = objc_msgSend(v6, "code");

        if (v10 == 260)
        {
LABEL_13:
          v7 = 0;
          goto LABEL_14;
        }
      }
      else
      {

      }
    }
    TRILogCategory_ClientFramework();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_19B89C000, v11, OS_LOG_TYPE_ERROR, "failed to parse dictionary from file: %@ (%@)", buf, 0x16u);
    }

    goto LABEL_13;
  }
  v7 = -[TRINamespaceDescriptor initWithDictionary:]([TRINamespaceDescriptor alloc], "initWithDictionary:", v4);
LABEL_14:

  return v7;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (TRINamespaceDescriptor)initWithDictionary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  TRINamespaceDescriptor *v70;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unsigned int v81;
  TRINamespaceDescriptor *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint8_t v92[128];
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Namespace Compatibility Version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v6, "unsignedIntValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Namespace Name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Namespace Id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      TRILogCategory_ClientFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "failed to instantiate namespace descriptor: missing namespace", buf, 2u);
      }

      v8 = &unk_1E3C195B0;
    }
    objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", objc_msgSend(v8, "unsignedIntValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("App Container Id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("App Container Type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDescriptor.m"), 157, CFSTR("app container id provided but unspecified container type"));

    }
    +[TRIAppContainer containerWithIdentifier:type:](TRIAppContainer, "containerWithIdentifier:type:", v10, objc_msgSend(v11, "integerValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Factor Path"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v82 = self;
  if (v13)
  {
    if (objc_msgSend(v13, "hasPrefix:", CFSTR("/")))
    {
      +[TRIStandardPaths resolveHardCodedPath:](TRIStandardPaths, "resolveHardCodedPath:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v15;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fileExistsAtPath:", v14);

    if ((v17 & 1) == 0)
    {
      objc_msgSend(v14, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      v21 = v14;
      objc_msgSend(v14, "stringByDeletingLastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@/Resources"), v22);
      objc_msgSend(v23, "stringByAppendingPathComponent:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = objc_msgSend(v25, "fileExistsAtPath:", v24);

      if ((_DWORD)v23)
      {
        TRILogCategory_ClientFramework();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v94 = v7;
          v95 = 2112;
          v96 = v21;
          v97 = 2112;
          v98 = v24;
          _os_log_impl(&dword_19B89C000, v26, OS_LOG_TYPE_DEFAULT, "Found invalid factors path for %@: %@. Changing it to be %@", buf, 0x20u);
        }

        v14 = v24;
      }
      else
      {
        v14 = v21;
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E98], "triParseURLFromString:isDirectory:", v14, 0);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ResourceAttributionBundleIdentifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v79 = v27;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v27;
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("iOS"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (v31 = v30) == 0)
      {
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("default"));
        v32 = v14;
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v33;
        v14 = v32;
        v31 = v34;
      }

      v28 = v31;
    }
    else
    {
      v28 = 0;
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Namespace Upgrade Compatibility Versions"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v80 = v14;
  v78 = v35;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v35;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = v28;
      v38 = v18;
      v74 = v10;
      v76 = v7;
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v40 = v35;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v88 != v43)
              objc_enumerationMutation(v40);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "integerValue"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v45);

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
        }
        while (v42);
      }

      v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v39);
      v10 = v74;
      v7 = v76;
      v18 = v38;
      v28 = v37;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v35, "componentsSeparatedByString:", CFSTR(","));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          v73 = v28;
          v47 = v18;
          v75 = v10;
          v77 = v7;
          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v46, "count"));
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v49 = v46;
          v50 = v46;
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v84;
            do
            {
              for (j = 0; j != v52; ++j)
              {
                if (*(_QWORD *)v84 != v53)
                  objc_enumerationMutation(v50);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * j), "integerValue"));
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "addObject:", v55);

              }
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
            }
            while (v52);
          }

          v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v48);
          v10 = v75;
          v7 = v77;
          v18 = v47;
          v28 = v73;
          v46 = v49;
        }
        else
        {
          v36 = 0;
        }

      }
      else
      {
        v36 = 0;
      }
    }
  }
  v56 = (void *)objc_opt_new();
  objc_msgSend(v56, "setFactorsURL:", v18);
  objc_msgSend(v56, "setAppContainer:", v12);
  objc_msgSend(v56, "setUpgradeNCVs:", v36);
  v57 = v28;
  objc_msgSend(v56, "setResourceAttributionIdentifier:", v28);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CloudKit Container Id"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  v60 = (void *)v18;
  if (v58)
    v61 = objc_msgSend(v58, "unsignedIntValue");
  else
    v61 = 0;
  objc_msgSend(v56, "setCloudKitContainerId:", v61);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Expensive Networking Allowed"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Expensive Networking Allowed"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setExpensiveNetworkingAllowed:", objc_msgSend(v63, "BOOLValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Enable Fetch During Setup Assistant"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Enable Fetch During Setup Assistant"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setEnableFetchDuringSetupAssistant:", objc_msgSend(v65, "BOOLValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Purgeability Level"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Purgeability Level"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setPurgeabilityLevel:", objc_msgSend(v67, "unsignedIntValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Available To Root User"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Available To Root User"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setAvailableToRootUser:", objc_msgSend(v69, "BOOLValue"));

  }
  v70 = -[TRINamespaceDescriptor initWithNamespaceName:downloadNCV:optionalParams:](v82, "initWithNamespaceName:downloadNCV:optionalParams:", v7, v81, v56);

  return v70;
}

- (TRINamespaceDescriptor)initWithNamespaceName:(id)a3 downloadNCV:(unsigned int)a4 optionalParams:(id)a5
{
  id v9;
  id v10;
  TRINamespaceDescriptor *v11;
  TRINamespaceDescriptor *v12;
  uint64_t v13;
  NSURL *factorsURL;
  uint64_t v15;
  TRIAppContainer *appContainer;
  void *v17;
  NSSet *v18;
  NSSet *upgradeNCVs;
  NSObject *v20;
  uint64_t v21;
  NSString *resourceAttributionIdentifier;
  objc_super v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
    v10 = (id)objc_opt_new();
  v24.receiver = self;
  v24.super_class = (Class)TRINamespaceDescriptor;
  v11 = -[TRINamespaceDescriptor init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_namespaceName, a3);
    objc_msgSend(v10, "factorsURL");
    v13 = objc_claimAutoreleasedReturnValue();
    factorsURL = v12->_factorsURL;
    v12->_factorsURL = (NSURL *)v13;

    objc_msgSend(v10, "appContainer");
    v15 = objc_claimAutoreleasedReturnValue();
    appContainer = v12->_appContainer;
    v12->_appContainer = (TRIAppContainer *)v15;

    v12->_downloadNCV = a4;
    objc_msgSend(v10, "upgradeNCVs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && !-[TRINamespaceDescriptor _upgradeNCVsIsValid:](v12, "_upgradeNCVsIsValid:", v17))
    {
      TRILogCategory_ClientFramework();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v26 = CFSTR("Namespace Upgrade Compatibility Versions");
        v27 = 2112;
        v28 = v17;
        _os_log_error_impl(&dword_19B89C000, v20, OS_LOG_TYPE_ERROR, "%@ %@ is not valid. Setting it to nil", buf, 0x16u);
      }

      upgradeNCVs = v12->_upgradeNCVs;
      v12->_upgradeNCVs = 0;
    }
    else
    {
      v18 = v17;
      upgradeNCVs = v12->_upgradeNCVs;
      v12->_upgradeNCVs = v18;
    }

    v12->_cloudKitContainerId = objc_msgSend(v10, "cloudKitContainerId");
    objc_msgSend(v10, "resourceAttributionIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    resourceAttributionIdentifier = v12->_resourceAttributionIdentifier;
    v12->_resourceAttributionIdentifier = (NSString *)v21;

    v12->_expensiveNetworkingAllowed = objc_msgSend(v10, "expensiveNetworkingAllowed");
    v12->_enableFetchDuringSetupAssistant = objc_msgSend(v10, "enableFetchDuringSetupAssistant");
    v12->_purgeabilityLevel = objc_msgSend(v10, "purgeabilityLevel");
    v12->_availableToRootUser = objc_msgSend(v10, "availableToRootUser");

  }
  return v12;
}

+ (id)descriptorPathForNamespaceName:(id)a3 fromDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  NSObject *v25;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id obj;
  char v36;
  id location;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AC6B8C]();
  location = 0;
  objc_msgSend(v5, "triSanitizedPathComponentWithMaxLength:addHash:error:", 128, 1, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v5;
      v41 = 2112;
      v42 = location;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "could not sanitize namespace %@ -- %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NamespaceDescriptor.%@.plist"), v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceIdFromName:", v5);
  if (!(_DWORD)v10)
  {
LABEL_26:
    objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "fileExistsAtPath:", v13) & 1) != 0
    || (v36 = 0, !objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v6, &v36)))
  {
LABEL_25:

    goto LABEL_26;
  }
  if (v36)
  {
    obj = location;
    objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", v6, &obj);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&location, obj);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Trial.NamespaceDescriptor.%d."), v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Trial.NamespaceDescriptor.%@."), v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v28 = v14;
      v15 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v15)
      {
        v16 = v15;
        v27 = v13;
        v17 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v28);
            v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v19, "hasPrefix:", v30) & 1) != 0 || objc_msgSend(v19, "hasPrefix:", v29))
            {
              v25 = v19;

              v9 = v25;
              goto LABEL_23;
            }
          }
          v16 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
          if (v16)
            continue;
          break;
        }
LABEL_23:
        v13 = v27;
      }

      goto LABEL_25;
    }
    TRILogCategory_ClientFramework();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 138412546;
    v40 = v6;
    v41 = 2112;
    v42 = location;
    v22 = "cannot access files in directory: %@ -- %@";
    v23 = v21;
    v24 = 22;
    goto LABEL_31;
  }
  TRILogCategory_ClientFramework();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v6;
    v22 = "file exists at path but is not a directory: %@";
    v23 = v21;
    v24 = 12;
LABEL_31:
    _os_log_error_impl(&dword_19B89C000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
  }
LABEL_29:

LABEL_19:
  v20 = 0;
LABEL_27:

  objc_autoreleasePoolPop(v7);
  return v20;
}

- (id)factorsAbsolutePathAsOwner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v18;
  void *v19;
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  -[TRINamespaceDescriptor factorsURL](self, "factorsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triPathAsOwner:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_9;
  if ((objc_msgSend(v6, "isAbsolutePath") & 1) != 0)
    goto LABEL_9;
  -[TRINamespaceDescriptor appContainer](self, "appContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_9;
  -[TRINamespaceDescriptor appContainer](self, "appContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
    objc_msgSend(v8, "containerURLAsOwner");
  else
    objc_msgSend(v8, "containerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    v20[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathWithComponents:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v15;
LABEL_9:
    v6 = v6;
    v16 = v6;
    goto LABEL_10;
  }
  TRILogCategory_ClientFramework();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    -[TRINamespaceDescriptor factorsURL](self, "factorsURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v19;
    _os_log_error_impl(&dword_19B89C000, v18, OS_LOG_TYPE_ERROR, "factorsAbsolutePathAsOwner: can't resolve containerDir for factorsURL: %@", buf, 0xCu);

  }
  v16 = 0;
LABEL_10:

  return v16;
}

- (NSURL)factorsURL
{
  return self->_factorsURL;
}

- (unsigned)downloadNCV
{
  return self->_downloadNCV;
}

- (BOOL)_upgradeNCVsArePositiveIntegers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((int)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "intValue", (_QWORD)v10) < 1)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)_upgradeNCVsIsValid:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TRINamespaceDescriptor _upgradeNCVsArePositiveIntegers:](self, "_upgradeNCVsArePositiveIntegers:", v4);
  if (!v5)
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = CFSTR("Namespace Upgrade Compatibility Versions");
      v10 = 2112;
      v11 = v4;
      _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, "%@ %@ must consist of positive integers", (uint8_t *)&v8, 0x16u);
    }

  }
  return v5;
}

- (id)dictionary
{
  void *v3;
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
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("Namespace Name");
  -[TRINamespaceDescriptor namespaceName](self, "namespaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v3;
  v27[1] = CFSTR("Namespace Compatibility Version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[TRINamespaceDescriptor downloadNCV](self, "downloadNCV"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v4;
  v27[2] = CFSTR("CloudKit Container Id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TRINamespaceDescriptor cloudKitContainerId](self, "cloudKitContainerId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v5;
  v27[3] = CFSTR("Purgeability Level");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TRINamespaceDescriptor purgeabilityLevel](self, "purgeabilityLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[TRINamespaceDescriptor factorsURL](self, "factorsURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TRINamespaceDescriptor factorsURL](self, "factorsURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("Factor Path"));

  }
  -[TRINamespaceDescriptor appContainer](self, "appContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TRINamespaceDescriptor appContainer](self, "appContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("App Container Id"));

    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[TRINamespaceDescriptor appContainer](self, "appContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("App Container Type"));

  }
  -[TRINamespaceDescriptor resourceAttributionIdentifier](self, "resourceAttributionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[TRINamespaceDescriptor resourceAttributionIdentifier](self, "resourceAttributionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("ResourceAttributionBundleIdentifier"));

  }
  -[TRINamespaceDescriptor upgradeNCVs](self, "upgradeNCVs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[TRINamespaceDescriptor upgradeNCVs](self, "upgradeNCVs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("Namespace Upgrade Compatibility Versions"));

  }
  if (-[TRINamespaceDescriptor expensiveNetworkingAllowed](self, "expensiveNetworkingAllowed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRINamespaceDescriptor expensiveNetworkingAllowed](self, "expensiveNetworkingAllowed"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("Expensive Networking Allowed"));

  }
  if (-[TRINamespaceDescriptor enableFetchDuringSetupAssistant](self, "enableFetchDuringSetupAssistant"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRINamespaceDescriptor enableFetchDuringSetupAssistant](self, "enableFetchDuringSetupAssistant"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("Enable Fetch During Setup Assistant"));

  }
  if (-[TRINamespaceDescriptor availableToRootUser](self, "availableToRootUser"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRINamespaceDescriptor availableToRootUser](self, "availableToRootUser"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("Available To Root User"));

  }
  return v8;
}

- (BOOL)writeToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  char v13;
  BOOL v14;
  NSObject *v15;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v19);
  v8 = v19;

  if ((v7 & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB38B0];
    -[TRINamespaceDescriptor dictionary](self, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v9, "dataWithPropertyList:format:options:error:", v10, 100, 0, &v18);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v18;

    if (v11)
    {
      v17 = v12;
      v13 = -[NSObject writeToFile:options:error:](v11, "writeToFile:options:error:", v4, 268435457, &v17);
      v8 = v17;

      if ((v13 & 1) != 0)
      {
        v14 = 1;
        goto LABEL_14;
      }
      TRILogCategory_ClientFramework();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v4;
        v22 = 2112;
        v23 = v8;
        _os_log_error_impl(&dword_19B89C000, v15, OS_LOG_TYPE_ERROR, "failed to write namespace descriptor to file: %@ -- %@", buf, 0x16u);
      }
      v12 = v8;
    }
    else
    {
      TRILogCategory_ClientFramework();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v12;
        _os_log_error_impl(&dword_19B89C000, v15, OS_LOG_TYPE_ERROR, "failed to serialize namespace descriptor -- %@", buf, 0xCu);
      }
    }

    v14 = 0;
    v8 = v12;
    goto LABEL_14;
  }
  TRILogCategory_ClientFramework();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    v22 = 2112;
    v23 = v8;
    _os_log_error_impl(&dword_19B89C000, v11, OS_LOG_TYPE_ERROR, "failed to create directory for namespace descriptor: %@ -- %@", buf, 0x16u);
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)saveToDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  -[TRINamespaceDescriptor namespaceName](self, "namespaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptor descriptorPathForNamespaceName:fromDirectory:](TRINamespaceDescriptor, "descriptorPathForNamespaceName:fromDirectory:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[TRINamespaceDescriptor writeToFile:](self, "writeToFile:", v6);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "cannot save namespace descriptor: path is nil", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)removeFromDirectory:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[TRINamespaceDescriptor namespaceName](self, "namespaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[TRINamespaceDescriptor removeDescriptorWithNamespaceName:fromDirectory:](TRINamespaceDescriptor, "removeDescriptorWithNamespaceName:fromDirectory:", v5, v4);

  return v6;
}

+ (BOOL)removeDescriptorWithNamespaceName:(id)a3 fromDirectory:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;
  char v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptor descriptorPathForNamespaceName:fromDirectory:](TRINamespaceDescriptor, "descriptorPathForNamespaceName:fromDirectory:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v16 = 0;
    if (objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v9, &v16))
    {
      if (v16)
      {
        TRILogCategory_ClientFramework();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v9;
          _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "expected file not directory at path %@", buf, 0xCu);
        }

      }
      v15 = 0;
      v11 = objc_msgSend(v8, "removeItemAtPath:error:", v9, &v15);
      v12 = v15;
      if (v12)
      {
        TRILogCategory_ClientFramework();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v9;
          v19 = 2112;
          v20 = v12;
          _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "failed to delete file %@ -- %@", buf, 0x16u);
        }

      }
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)descriptorsForDirectory:(id)a3 filterBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__14;
  v18 = __Block_byref_object_dispose__14;
  v19 = 0;
  v7 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__TRINamespaceDescriptor_descriptorsForDirectory_filterBlock___block_invoke;
  v11[3] = &unk_1E3C00560;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateDescriptorsInDirectory:block:", v5, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __62__TRINamespaceDescriptor_descriptorsForDirectory_filterBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(void))(v4 + 16))(), v6 = v13, v5))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    if (v8)
    {
      v9 = v8;
      v10 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v9;
    }
    else
    {
      v11 = objc_opt_new();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v13);
    v6 = v13;
  }

}

+ (void)enumerateDescriptorsInDirectory:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, void *, uint8_t *);
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, uint8_t *))a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v5, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;
  if (v8)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v8;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v19 = v9;
      v20 = v8;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1A1AC6B8C]();
          objc_msgSend(v5, "stringByAppendingPathComponent:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRINamespaceDescriptor loadFromFile:](TRINamespaceDescriptor, "loadFromFile:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            buf[0] = 0;
            v6[2](v6, v18, buf);
            if (buf[0])
            {

              objc_autoreleasePoolPop(v16);
              goto LABEL_15;
            }
          }

          objc_autoreleasePoolPop(v16);
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v12)
          continue;
        break;
      }
LABEL_15:
      v8 = v20;
      v9 = v19;
    }
  }
  else
  {
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v5;
      v29 = 2112;
      v30 = v9;
      _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "failed to read contents of directory %@: %@", buf, 0x16u);
    }
  }

}

- (BOOL)_isEqualToNamespaceDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  _BOOL4 v31;
  char v32;
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

  v4 = a3;
  -[TRINamespaceDescriptor namespaceName](self, "namespaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namespaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[TRINamespaceDescriptor factorsURL](self, "factorsURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "factorsURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
    {
      objc_msgSend(v4, "factorsURL");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        LOBYTE(v13) = 0;
        goto LABEL_41;
      }
      v10 = (void *)v9;
      -[TRINamespaceDescriptor factorsURL](self, "factorsURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "factorsURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "triIsEqual:", v12))
      {
        LOBYTE(v13) = 0;
LABEL_40:

        goto LABEL_41;
      }
      v40 = v10;
      v41 = v12;
      v42 = v11;
    }
    -[TRINamespaceDescriptor appContainer](self, "appContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v15)
    {
      v43 = v14;
    }
    else
    {
      objc_msgSend(v4, "appContainer");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        LOBYTE(v13) = 0;
        goto LABEL_22;
      }
      v17 = (void *)v16;
      v43 = v14;
      -[TRINamespaceDescriptor appContainer](self, "appContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appContainer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToContainer:", v19) & 1) == 0)
      {

        LOBYTE(v13) = 0;
        goto LABEL_39;
      }
      v37 = v19;
      v38 = v18;
      v39 = v17;
    }
    v20 = -[TRINamespaceDescriptor downloadNCV](self, "downloadNCV");
    if (v20 != objc_msgSend(v4, "downloadNCV"))
      goto LABEL_35;
    -[TRINamespaceDescriptor upgradeNCVs](self, "upgradeNCVs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "upgradeNCVs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 == v22)
    {
      v26 = v21;
    }
    else
    {
      objc_msgSend(v4, "upgradeNCVs");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
LABEL_34:

LABEL_35:
        v32 = 0;
        LOBYTE(v13) = 0;
LABEL_36:
        if (v43 != v15)
        {

          LOBYTE(v13) = v32;
        }

LABEL_39:
        v12 = v41;
        v11 = v42;
        v10 = v40;
        if (v7 != v8)
          goto LABEL_40;
LABEL_41:

        goto LABEL_42;
      }
      v36 = (void *)v23;
      -[TRINamespaceDescriptor upgradeNCVs](self, "upgradeNCVs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "upgradeNCVs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToSet:");
      v35 = v24;
      v26 = v21;
      if (!v25)
      {
        LOBYTE(v13) = 0;
LABEL_18:

        v14 = v43;
        if (v43 == v15)
        {

          goto LABEL_23;
        }

LABEL_22:
LABEL_23:

        goto LABEL_39;
      }
    }
    v27 = -[TRINamespaceDescriptor cloudKitContainerId](self, "cloudKitContainerId");
    if (v27 == objc_msgSend(v4, "cloudKitContainerId"))
    {
      v28 = -[TRINamespaceDescriptor expensiveNetworkingAllowed](self, "expensiveNetworkingAllowed");
      if (v28 == objc_msgSend(v4, "expensiveNetworkingAllowed"))
      {
        v29 = -[TRINamespaceDescriptor enableFetchDuringSetupAssistant](self, "enableFetchDuringSetupAssistant");
        if (v29 == objc_msgSend(v4, "enableFetchDuringSetupAssistant"))
        {
          v30 = -[TRINamespaceDescriptor purgeabilityLevel](self, "purgeabilityLevel");
          if (v30 == objc_msgSend(v4, "purgeabilityLevel"))
          {
            v31 = -[TRINamespaceDescriptor availableToRootUser](self, "availableToRootUser");
            v13 = v31 ^ objc_msgSend(v4, "availableToRootUser") ^ 1;
            v32 = v13;
            if (v26 != v22)
              goto LABEL_18;
            goto LABEL_44;
          }
        }
      }
    }
    v21 = v26;
    if (v26 == v22)
    {
      v32 = 0;
      LOBYTE(v13) = 0;
LABEL_44:

      goto LABEL_36;
    }

    goto LABEL_34;
  }
  LOBYTE(v13) = 0;
LABEL_42:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRINamespaceDescriptor *v4;
  BOOL v5;

  v4 = (TRINamespaceDescriptor *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRINamespaceDescriptor _isEqualToNamespaceDescriptor:](self, "_isEqualToNamespaceDescriptor:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  -[TRINamespaceDescriptor namespaceName](self, "namespaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TRINamespaceDescriptor factorsURL](self, "factorsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TRINamespaceDescriptor factorsURL](self, "factorsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash");

  }
  else
  {
    v7 = 0;
  }

  -[TRINamespaceDescriptor appContainer](self, "appContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[TRINamespaceDescriptor appContainer](self, "appContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hash");

  }
  else
  {
    v10 = 0;
  }

  v11 = -[TRINamespaceDescriptor downloadNCV](self, "downloadNCV");
  -[TRINamespaceDescriptor upgradeNCVs](self, "upgradeNCVs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[TRINamespaceDescriptor upgradeNCVs](self, "upgradeNCVs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hash");

  }
  else
  {
    v14 = 0;
  }

  v15 = 37
      * (37 * (v14 + 37 * (37 * (v10 + 37 * (v7 + 37 * v4)) + v11))
       + -[TRINamespaceDescriptor cloudKitContainerId](self, "cloudKitContainerId"));
  v16 = 37 * (v15 + -[TRINamespaceDescriptor expensiveNetworkingAllowed](self, "expensiveNetworkingAllowed"));
  v17 = 37 * (v16 + -[TRINamespaceDescriptor enableFetchDuringSetupAssistant](self, "enableFetchDuringSetupAssistant"));
  v18 = 37 * (v17 + -[TRINamespaceDescriptor purgeabilityLevel](self, "purgeabilityLevel"));
  return v18 + -[TRINamespaceDescriptor availableToRootUser](self, "availableToRootUser") + 0x111561CB63F539;
}

- (TRIAppContainer)appContainer
{
  return self->_appContainer;
}

- (NSSet)upgradeNCVs
{
  return self->_upgradeNCVs;
}

- (int)cloudKitContainerId
{
  return self->_cloudKitContainerId;
}

- (NSString)resourceAttributionIdentifier
{
  return self->_resourceAttributionIdentifier;
}

- (BOOL)expensiveNetworkingAllowed
{
  return self->_expensiveNetworkingAllowed;
}

- (BOOL)enableFetchDuringSetupAssistant
{
  return self->_enableFetchDuringSetupAssistant;
}

- (int)purgeabilityLevel
{
  return self->_purgeabilityLevel;
}

- (BOOL)availableToRootUser
{
  return self->_availableToRootUser;
}

@end
