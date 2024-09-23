@implementation SUCorePolicyMacUpdateBrain

- (SUCorePolicyMacUpdateBrain)initWithAssetType:(id)a3 majorTargetBuild:(id)a4 minorTargetBuild:(id)a5 usingPolicies:(int64_t)a6 usingExtensions:(id)a7
{
  id v13;
  id v14;
  SUCorePolicyMacUpdateBrain *v15;
  uint64_t v16;
  NSNumber *compatibilityVersion;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v15 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:](&v19, sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_, a3, 0, a6, a7);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 20);
    v16 = objc_claimAutoreleasedReturnValue();
    compatibilityVersion = v15->_compatibilityVersion;
    v15->_compatibilityVersion = (NSNumber *)v16;

    objc_storeStrong((id *)&v15->_majorTargetBuildVersion, a4);
    objc_storeStrong((id *)&v15->_minorTargetBuildVersion, a5);
  }

  return v15;
}

- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  objc_super v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  objc_super v60;
  objc_super v61;
  objc_super v62;
  objc_super v63;
  objc_super v64;
  objc_super v65;
  objc_super v66;
  objc_super v67;
  objc_super v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCorePolicyMacUpdateBrain description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v71 = v7;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMASoftwareUpdateCatalogDownloadOptionsWithUUID for MacUpdateBrainPolicy: %{public}@", buf, 0xCu);

  }
  v68.receiver = self;
  v68.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy softwareUpdateScanPolicy](&v68, sel_softwareUpdateScanPolicy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalServerParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v15);

  }
  v52 = v11;
  objc_msgSend(v10, "setSafeObject:forKey:", v11, CFSTR("TargetBuildVersionArray"));
  v67.receiver = self;
  v67.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy productType](&v67, sel_productType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSafeObject:forKey:", v16, CFSTR("ProductType"));

  v66.receiver = self;
  v66.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy hwModelStr](&v66, sel_hwModelStr);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSafeObject:forKey:", v17, CFSTR("HWModelStr"));

  v65.receiver = self;
  v65.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy deviceClass](&v65, sel_deviceClass);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSafeObject:forKey:", v18, CFSTR("DeviceName"));

  v64.receiver = self;
  v64.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy prerequisiteBuildVersion](&v64, sel_prerequisiteBuildVersion);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSafeObject:forKey:", v19, CFSTR("BuildVersion"));

  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSafeObject:forKey:", v20, CFSTR("CompatibilityVersion"));

  v21 = objc_alloc_init(MEMORY[0x1E0D4E098]);
  objc_msgSend(v21, "setDiscretionary:", 0);
  objc_msgSend(v21, "setSessionId:", v53);
  objc_msgSend(v21, "setAdditionalServerParams:", v10);
  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v63.receiver = self;
    v63.super_class = (Class)SUCorePolicyMacUpdateBrain;
    -[SUCorePolicy downloadAuthorizationHeader](&v63, sel_downloadAuthorizationHeader);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDownloadAuthorizationHeader:", v23);

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("|"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sessionId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendFormat:", CFSTR("scanUUID:%@|"), v25);

  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendFormat:", CFSTR("CompatibilityVersion:%@|"), v26);

  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendFormat:", CFSTR("TargetBuildVersionArray:%@|"), v27);

  v62.receiver = self;
  v62.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy productType](&v62, sel_productType);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SUCorePolicy productType](self, "productType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("ProductType:%@|"), v29);

  }
  v61.receiver = self;
  v61.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy hwModelStr](&v61, sel_hwModelStr);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[SUCorePolicy hwModelStr](self, "hwModelStr");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("HWModelStr:%@|"), v31);

  }
  v60.receiver = self;
  v60.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy deviceClass](&v60, sel_deviceClass);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[SUCorePolicy deviceClass](self, "deviceClass");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("DeviceClass:%@|"), v33);

  }
  v59.receiver = self;
  v59.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy prerequisiteBuildVersion](&v59, sel_prerequisiteBuildVersion);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("BuildVersion:%@|"), v35);

  }
  v51 = v10;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "oslog");
  v37 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v71 = v24;
    _os_log_impl(&dword_1DDFDD000, v37, OS_LOG_TYPE_DEFAULT, "[POLICY] MacUpdateBrain catalog download options summary: %{public}@", buf, 0xCu);
  }
  v50 = v24;

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "oslog");
  v39 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v71 = v21;
    _os_log_impl(&dword_1DDFDD000, v39, OS_LOG_TYPE_DEFAULT, "[POLICY] MacUpdateBrain catalog downloadOptions: %{public}@", buf, 0xCu);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v54.receiver = self;
  v54.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy policyExtensions](&v54, sel_policyExtensions);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v56 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "oslog");
        v47 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v45, "extensionName");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v71 = v48;
          _os_log_impl(&dword_1DDFDD000, v47, OS_LOG_TYPE_DEFAULT, "[POLICY] extending MacUpdateBrain catalog download options for extension %{public}@", buf, 0xCu);

        }
        objc_msgSend(v45, "extendMASoftwareUpdateCatalogDownloadOptions:", v21);
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v42);
  }

  return v21;
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return -[SUCorePolicyMacUpdateBrain constructSoftwareUpdateMAAssetQueryWithPurpose:](self, "constructSoftwareUpdateMAAssetQueryWithPurpose:", 0);
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  objc_super v52;
  objc_super v53;
  objc_super v54;
  objc_super v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D4E050]);
  v55.receiver = self;
  v55.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy softwareUpdateAssetType](&v55, sel_softwareUpdateAssetType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v4;
  v9 = (void *)objc_msgSend(v7, "initWithType:andPurpose:", v8, v4);

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v11, "intValue"));
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addKeyValuePair:with:", CFSTR("_CompatibilityVersion"), v12);
  v44 = (void *)v12;
  objc_msgSend(v5, "appendFormat:", CFSTR("CompatibilityVersion:%@"), v12);
  v54.receiver = self;
  v54.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy hwModelStr](&v54, sel_hwModelStr);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v15 = v14;
  if (v13)
  {
    v53.receiver = self;
    v53.super_class = (Class)SUCorePolicyMacUpdateBrain;
    -[SUCorePolicy hwModelStr](&v53, sel_hwModelStr);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithObjects:", v6, v16, 0);
    objc_msgSend(v9, "addKeyValueArray:with:", CFSTR("SupportedDeviceModels"), v17);

  }
  else
  {
    v16 = (void *)objc_msgSend(v14, "initWithObjects:", v6, 0);
    objc_msgSend(v9, "addKeyValueArray:with:", CFSTR("SupportedDeviceModels"), v16);
  }

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("hwModelStr:%@|"), v18);

  v52.receiver = self;
  v52.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy productType](&v52, sel_productType);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v51.receiver = self;
    v51.super_class = (Class)SUCorePolicyMacUpdateBrain;
    -[SUCorePolicy productType](&v51, sel_productType);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithObjects:", v6, v21, 0);
    objc_msgSend(v9, "addKeyValueArray:with:", CFSTR("SupportedDevices"), v22);

  }
  -[SUCorePolicy productType](self, "productType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("productType:%@|"), v23);

  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v26);

  }
  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v28);

  }
  objc_msgSend(v24, "addObject:", v6);
  v29 = v9;
  objc_msgSend(v9, "addKeyValueArray:with:", CFSTR("Build"), v24);
  v43 = v24;
  objc_msgSend(v24, "componentsJoinedByString:", CFSTR(","));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Builds:%@|"), v30);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "oslog");
  v32 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v58 = v5;
    _os_log_impl(&dword_1DDFDD000, v32, OS_LOG_TYPE_DEFAULT, "[POLICY] querying MacUpdateBrain metadata: %{public}@", buf, 0xCu);
  }
  v45 = v5;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "oslog");
        v40 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v38, "extensionName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v41;
          _os_log_impl(&dword_1DDFDD000, v40, OS_LOG_TYPE_DEFAULT, "[POLICY] extending query for extension %{public}@", buf, 0xCu);

        }
        objc_msgSend(v38, "extendSoftwareUpdateMAAssetQuery:", v29);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v35);
  }

  return v29;
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7
{
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  _QWORD *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id *v69;
  _QWORD *v70;
  id v71;
  _QWORD v72[5];
  _QWORD v73[5];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  SUCorePolicyMacUpdateBrain *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v79 = self;
    _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "[POLICY] Select major/minor MacUpdateBrain for policy: %{public}@", buf, 0xCu);
  }

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 || !v15)
  {
    -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a5 && v19)
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("Select major/minor MacUpdateBrain called with unexpected nil minorPrimaryAsset param");
      goto LABEL_17;
    }
    objc_msgSend(v12, "SUCoreBorder_results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "count");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (!v20)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDFDD000, v22, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 MacUpdateBrain query results (before filtering)", buf, 2u);
      }
      goto LABEL_57;
    }
    if (v23)
    {
      v24 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 134217984;
      v79 = (SUCorePolicyMacUpdateBrain *)v24;
      _os_log_impl(&dword_1DDFDD000, v22, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu MacUpdateBrain query results (before filtering)", buf, 0xCu);
    }
    v69 = a5;
    v71 = v12;

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    -[SUCorePolicy policyExtensions](self, "policyExtensions");
    v22 = objc_claimAutoreleasedReturnValue();
    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v75;
      while (2)
      {
        v28 = 0;
        v29 = v17;
        do
        {
          if (*(_QWORD *)v75 != v27)
            objc_enumerationMutation(v22);
          v30 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v28);
          objc_msgSend(v30, "filterSoftwareUpdateAssetArray:", v29, v69);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "oslog");
          v32 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = objc_msgSend(v17, "count");
            objc_msgSend(v30, "extensionName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v79 = (SUCorePolicyMacUpdateBrain *)v33;
            v80 = 2114;
            v81 = v34;
            _os_log_impl(&dword_1DDFDD000, v32, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);

          }
          if (!objc_msgSend(v17, "count"))
          {
            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "oslog");
            v52 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DDFDD000, v52, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found, stopping filtering early", buf, 2u);
            }

            v12 = v71;
            goto LABEL_57;
          }
          ++v28;
          v29 = v17;
        }
        while (v26 != v28);
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
        if (v26)
          continue;
        break;
      }
    }

    -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = MEMORY[0x1E0C809B0];
    if (v35)
    {
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke;
      v73[3] = &unk_1EA877F48;
      v73[4] = self;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v73);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filteredArrayUsingPredicate:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "oslog");
      v40 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = objc_msgSend(v38, "count");
        *(_DWORD *)buf = 134217984;
        v79 = (SUCorePolicyMacUpdateBrain *)v41;
        _os_log_impl(&dword_1DDFDD000, v40, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for major assets in SUCorePolicyMacUpdateBrain", buf, 0xCu);
      }

      if ((unint64_t)objc_msgSend(v38, "count") >= 2)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "oslog");
        v43 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[SUCorePolicyMacUpdateBrain selectSoftwareUpdateMajorPrimaryAsset:majorSecondaryAsset:minorPrimaryAsset:minorSecondaryAsset:fromAssetQuery:].cold.2(v43, v44, v45, v46, v47, v48, v49, v50);

      }
      objc_msgSend(v38, "firstObject", v69);
      v22 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
    -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion", v69);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      v72[0] = v36;
      v72[1] = 3221225472;
      v72[2] = __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_251;
      v72[3] = &unk_1EA877F48;
      v72[4] = self;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v72);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filteredArrayUsingPredicate:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "oslog");
      v57 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = objc_msgSend(v55, "count");
        *(_DWORD *)buf = 134217984;
        v79 = (SUCorePolicyMacUpdateBrain *)v58;
        _os_log_impl(&dword_1DDFDD000, v57, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for minor assets in SUCorePolicyMacUpdateBrain", buf, 0xCu);
      }

      v59 = v70;
      v12 = v71;
      if ((unint64_t)objc_msgSend(v55, "count") >= 2)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "oslog");
        v61 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          -[SUCorePolicyMacUpdateBrain selectSoftwareUpdateMajorPrimaryAsset:majorSecondaryAsset:minorPrimaryAsset:minorSecondaryAsset:fromAssetQuery:].cold.1(v61, v62, v63, v64, v65, v66, v67, v68);

      }
      objc_msgSend(v55, "firstObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a3)
        goto LABEL_54;
    }
    else
    {
      v59 = v70;
      v12 = v71;
      if (!a3)
        goto LABEL_54;
    }
    *a3 = objc_retainAutorelease(v22);
LABEL_54:
    if (v59)
      *v59 = objc_retainAutorelease(v53);

LABEL_57:
    goto LABEL_58;
  }
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = CFSTR("Select major/minor MacUpdateBrain called with unexpected nil majorPrimaryAsset param");
LABEL_17:
  objc_msgSend(v16, "trackError:forReason:withResult:withError:", CFSTR("[POLICY] SELECT_UPDATE_ASSET"), v18, 8102, 0);
LABEL_58:

}

uint64_t __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("Build"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DA8920];
  objc_msgSend(*(id *)(a1 + 32), "majorTargetBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "stringIsEqual:to:", v4, v6);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "majorTargetBuildVersion");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("NO");
    v14 = 138543874;
    v15 = v4;
    v16 = 2114;
    if ((_DWORD)v7)
      v12 = CFSTR("YES");
    v17 = v10;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering for major assets: assetBuildVersion=%{public}@ majorTargetBuildVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v14, 0x20u);

  }
  return v7;
}

uint64_t __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_251(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("Build"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DA8920];
  objc_msgSend(*(id *)(a1 + 32), "minorTargetBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "stringIsEqual:to:", v4, v6);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "minorTargetBuildVersion");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("NO");
    v14 = 138543874;
    v15 = v4;
    v16 = 2114;
    if ((_DWORD)v7)
      v12 = CFSTR("YES");
    v17 = v10;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering for minor assets: assetBuildVersion=%{public}@ minorTargetBuildVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v14, 0x20u);

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyMacUpdateBrain)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyMacUpdateBrain *v5;
  uint64_t v6;
  NSNumber *compatibilityVersion;
  uint64_t v8;
  NSString *majorTargetBuildVersion;
  uint64_t v10;
  NSString *minorTargetBuildVersion;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v5 = -[SUCorePolicy initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CompatibilityVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MajorTargetBuildVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    majorTargetBuildVersion = v5->_majorTargetBuildVersion;
    v5->_majorTargetBuildVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MinorTargetBuildVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    minorTargetBuildVersion = v5->_minorTargetBuildVersion;
    v5->_minorTargetBuildVersion = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v4 = a3;
  -[SUCorePolicy encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CompatibilityVersion"));

  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MajorTargetBuildVersion"));

  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MinorTargetBuildVersion"));

}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyMacUpdateBrain *v4;
  SUCorePolicyMacUpdateBrain *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  objc_super v17;

  v4 = (SUCorePolicyMacUpdateBrain *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v17.receiver = self;
      v17.super_class = (Class)SUCorePolicyMacUpdateBrain;
      if (-[SUCorePolicy isEqual:](&v17, sel_isEqual_, v5))
      {
        v6 = (void *)MEMORY[0x1E0DA8920];
        -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicyMacUpdateBrain compatibilityVersion](v5, "compatibilityVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "numberIsEqual:to:", v7, v8))
        {
          v9 = (void *)MEMORY[0x1E0DA8920];
          -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](v5, "majorTargetBuildVersion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "stringIsEqual:to:", v10, v11))
          {
            v12 = (void *)MEMORY[0x1E0DA8920];
            -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](v5, "minorTargetBuildVersion");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v12, "stringIsEqual:to:", v13, v14);

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v4 = -[SUCorePolicy copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCompatibilityVersion:", v6);

  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMajorTargetBuildVersion:", v8);

  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setMinorTargetBuildVersion:", v10);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyMacUpdateBrain(compatibilityVersion:%@|majorTargetBuildVersion:%@|minorTargetBuildVersion:%@|super:%@)"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy summary](&v15, sel_summary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("|compatibilityVersion=%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("|majorTargetBuildVersion=%@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("|minorTargetBuildVersion=%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v12;
  }
  if ((objc_msgSend(v3, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("|"));
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v13;
  }
  return v3;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityVersion, a3);
}

- (NSString)majorTargetBuildVersion
{
  return self->_majorTargetBuildVersion;
}

- (void)setMajorTargetBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_majorTargetBuildVersion, a3);
}

- (NSString)minorTargetBuildVersion
{
  return self->_minorTargetBuildVersion;
}

- (void)setMinorTargetBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minorTargetBuildVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorTargetBuildVersion, 0);
  objc_storeStrong((id *)&self->_majorTargetBuildVersion, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(uint64_t)a3 majorSecondaryAsset:(uint64_t)a4 minorPrimaryAsset:(uint64_t)a5 minorSecondaryAsset:(uint64_t)a6 fromAssetQuery:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, a1, a3, "[POLICY] Found more than one minor MacUpdateBrain asset in filtered results; selecting the first asset in array",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(uint64_t)a3 majorSecondaryAsset:(uint64_t)a4 minorPrimaryAsset:(uint64_t)a5 minorSecondaryAsset:(uint64_t)a6 fromAssetQuery:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, a1, a3, "[POLICY] Found more than one major MacUpdateBrain asset in filtered results; selecting the first asset in array",
    a5,
    a6,
    a7,
    a8,
    0);
}

@end
