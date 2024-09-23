@implementation SUCorePolicyMacRecoveryOSUpdate

- (SUCorePolicyMacRecoveryOSUpdate)initWithAssetType:(id)a3 targetRestoreVersion:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6
{
  id v10;
  SUCorePolicyMacRecoveryOSUpdate *v11;
  SUCorePolicyMacRecoveryOSUpdate *v12;
  void *v13;
  uint64_t v14;
  NSString *installedSFRRestoreVersion;
  void *v16;
  uint64_t v17;
  NSString *installedRecoveryOSBuildVersion;
  void *v19;
  uint64_t v20;
  NSString *installedRecoveryOSProductVersion;
  void *v22;
  uint64_t v23;
  NSString *installedRecoveryOSRestoreVersion;
  void *v25;
  uint64_t v26;
  NSString *installedRecoveryOSReleaseType;
  objc_super v29;
  objc_super v30;

  v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v11 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:](&v30, sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_, a3, 0, a5, a6);
  v12 = v11;
  if (v11)
  {
    v29.receiver = v11;
    v29.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
    -[SUCorePolicy setTargetRestoreVersion:](&v29, sel_setTargetRestoreVersion_, v10);
    -[SUCorePolicy setDisableSplatCombo:](v12, "setDisableSplatCombo:", 1);
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sfrRestoreVersion");
    v14 = objc_claimAutoreleasedReturnValue();
    installedSFRRestoreVersion = v12->_installedSFRRestoreVersion;
    v12->_installedSFRRestoreVersion = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recoveryOSBuildVersion");
    v17 = objc_claimAutoreleasedReturnValue();
    installedRecoveryOSBuildVersion = v12->_installedRecoveryOSBuildVersion;
    v12->_installedRecoveryOSBuildVersion = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recoveryOSProductVersion");
    v20 = objc_claimAutoreleasedReturnValue();
    installedRecoveryOSProductVersion = v12->_installedRecoveryOSProductVersion;
    v12->_installedRecoveryOSProductVersion = (NSString *)v20;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "recoveryOSRestoreVersion");
    v23 = objc_claimAutoreleasedReturnValue();
    installedRecoveryOSRestoreVersion = v12->_installedRecoveryOSRestoreVersion;
    v12->_installedRecoveryOSRestoreVersion = (NSString *)v23;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recoveryOSReleaseType");
    v26 = objc_claimAutoreleasedReturnValue();
    installedRecoveryOSReleaseType = v12->_installedRecoveryOSReleaseType;
    v12->_installedRecoveryOSReleaseType = (NSString *)v26;

  }
  return v12;
}

- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v66;
  void *v67;
  objc_super v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  objc_super v74;
  objc_super v75;
  objc_super v76;
  objc_super v77;
  objc_super v78;
  objc_super v79;
  objc_super v80;
  objc_super v81;
  objc_super v82;
  objc_super v83;
  objc_super v84;
  objc_super v85;
  uint8_t v86[128];
  uint8_t buf[4];
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCorePolicyMacRecoveryOSUpdate description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v88 = v8;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMASoftwareUpdateCatalogDownloadOptionsWithUUID for SUCorePolicyMacRecoveryOSUpdate: %{public}@", buf, 0xCu);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0D4E098]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setAdditionalServerParams:", v10);

  v85.receiver = self;
  v85.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy softwareUpdateScanPolicy](&v85, sel_softwareUpdateScanPolicy);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDiscretionary:", objc_msgSend(v11, "discretionary"));

  v84.receiver = self;
  v84.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy softwareUpdateScanPolicy](&v84, sel_softwareUpdateScanPolicy);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequiresPowerPluggedIn:", objc_msgSend(v12, "requiresPowerPluggedIn"));

  v83.receiver = self;
  v83.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy softwareUpdateScanPolicy](&v83, sel_softwareUpdateScanPolicy);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLiveServerCatalogOnly:", objc_msgSend(v13, "liveServerCatalogOnly"));

  v67 = v5;
  objc_msgSend(v9, "setSessionId:", v5);
  objc_msgSend(v9, "additionalServerParams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSafeObject:forKey:", v15, CFSTR("TargetRestoreVersion"));

  objc_msgSend(v9, "additionalServerParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSafeObject:forKey:", v17, CFSTR("InstalledSFRVersion"));

  objc_msgSend(v9, "additionalServerParams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSafeObject:forKey:", v19, CFSTR("InstalledSFRRestoreVersion"));

  objc_msgSend(v9, "additionalServerParams");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSafeObject:forKey:", v21, CFSTR("InstalledRecoveryOSRestoreVersion"));

  objc_msgSend(v9, "additionalServerParams");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSafeObject:forKey:", v23, CFSTR("InstalledRecoveryOSVersion"));

  objc_msgSend(v9, "additionalServerParams");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSafeObject:forKey:", v25, CFSTR("ReleaseType"));

  objc_msgSend(v9, "additionalServerParams");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v82.receiver = self;
  v82.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy productType](&v82, sel_productType);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSafeObject:forKey:", v27, CFSTR("ProductType"));

  objc_msgSend(v9, "additionalServerParams");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v81.receiver = self;
  v81.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy hwModelStr](&v81, sel_hwModelStr);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSafeObject:forKey:", v29, CFSTR("HWModelStr"));

  objc_msgSend(v9, "additionalServerParams");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v80.receiver = self;
  v80.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy deviceClass](&v80, sel_deviceClass);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSafeObject:forKey:", v31, CFSTR("DeviceName"));

  objc_msgSend(v9, "additionalServerParams");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0CB37E8];
  v79.receiver = self;
  v79.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy softwareUpdateScanPolicy](&v79, sel_softwareUpdateScanPolicy);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "allowSameVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setSafeObject:forKey:", v35, CFSTR("AllowSameBuildVersion"));

  objc_msgSend(v9, "additionalServerParams");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0CB37E8];
  v78.receiver = self;
  v78.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy softwareUpdateScanPolicy](&v78, sel_softwareUpdateScanPolicy);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "numberWithBool:", objc_msgSend(v38, "allowSameVersion"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setSafeObject:forKey:", v39, CFSTR("AllowSameRestoreVersion"));

  v77.receiver = self;
  v77.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy prerequisiteBuildVersion](&v77, sel_prerequisiteBuildVersion);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrerequisiteProductVersion:", v40);

  v76.receiver = self;
  v76.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy prerequisiteProductVersion](&v76, sel_prerequisiteProductVersion);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrerequisiteBuildVersion:", v41);

  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v75.receiver = self;
    v75.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
    -[SUCorePolicy downloadAuthorizationHeader](&v75, sel_downloadAuthorizationHeader);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDownloadAuthorizationHeader:", v43);

  }
  v74.receiver = self;
  v74.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy softwareUpdateScanPolicy](&v74, sel_softwareUpdateScanPolicy);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "additionalServerParams");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(v9, "additionalServerParams");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v73.receiver = self;
    v73.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
    -[SUCorePolicy softwareUpdateScanPolicy](&v73, sel_softwareUpdateScanPolicy);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "additionalServerParams");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addEntriesFromDictionary:", v48);

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("|"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionId");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "appendFormat:", CFSTR("scanUUID:%@|"), v50);

  objc_msgSend(v9, "additionalServerParams");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "appendFormat:", CFSTR("additionalServerParams:%@|"), v51);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "oslog");
  v53 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v88 = v49;
    _os_log_impl(&dword_1DDFDD000, v53, OS_LOG_TYPE_DEFAULT, "[POLICY] MacRecoveryOSUpdate catalog download options summary: %{public}@", buf, 0xCu);
  }
  v66 = v49;

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "oslog");
  v55 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v88 = v9;
    _os_log_impl(&dword_1DDFDD000, v55, OS_LOG_TYPE_DEFAULT, "[POLICY] MacRecoveryOSUpdate catalog downloadOptions: %{public}@", buf, 0xCu);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v68.receiver = self;
  v68.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy policyExtensions](&v68, sel_policyExtensions);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v70 != v59)
          objc_enumerationMutation(v56);
        v61 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "oslog");
        v63 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v61, "extensionName");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v88 = v64;
          _os_log_impl(&dword_1DDFDD000, v63, OS_LOG_TYPE_DEFAULT, "[POLICY] extending MacRecoveryOSUpdate catalog download options for extension %{public}@", buf, 0xCu);

        }
        objc_msgSend(v61, "extendMASoftwareUpdateCatalogDownloadOptions:", v9);
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
    }
    while (v58);
  }

  return v9;
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return -[SUCorePolicyMacRecoveryOSUpdate constructSoftwareUpdateMAAssetQueryWithPurpose:](self, "constructSoftwareUpdateMAAssetQueryWithPurpose:", 0);
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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D4E050]);
  v40.receiver = self;
  v40.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy softwareUpdateAssetType](&v40, sel_softwareUpdateAssetType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v4;
  v9 = (void *)objc_msgSend(v7, "initWithType:andPurpose:", v8, v4);

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v12 = v11;
  if (v10)
  {
    -[SUCorePolicy hwModelStr](self, "hwModelStr");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v6, v13, 0);
    objc_msgSend(v9, "addKeyValueArray:with:", CFSTR("SupportedDeviceModels"), v14);

  }
  else
  {
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", v6, 0);
    objc_msgSend(v9, "addKeyValueArray:with:", CFSTR("SupportedDeviceModels"), v13);
  }

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("hwModelStr:%@|"), v15);

  -[SUCorePolicy productType](self, "productType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18 = v17;
  if (v16)
  {
    -[SUCorePolicy productType](self, "productType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithObjects:", v6, v19, 0);
    objc_msgSend(v9, "addKeyValueArray:with:", CFSTR("SupportedDevices"), v20);

  }
  else
  {
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v6, 0);
    objc_msgSend(v9, "addKeyValueArray:with:", CFSTR("SupportedDevices"), v19);
  }

  -[SUCorePolicy productType](self, "productType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("productType:%@|"), v21);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "oslog");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v5;
    _os_log_impl(&dword_1DDFDD000, v23, OS_LOG_TYPE_DEFAULT, "[POLICY] querying MacRecoveryOSUpdate metadata: %{public}@", buf, 0xCu);
  }
  v34 = v5;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "oslog");
        v31 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v29, "extensionName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v32;
          _os_log_impl(&dword_1DDFDD000, v31, OS_LOG_TYPE_DEFAULT, "[POLICY] extending MacRecoveryOSUpdate query for extension %{public}@", buf, 0xCu);

        }
        objc_msgSend(v29, "extendSoftwareUpdateMAAssetQuery:", v9);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v26);
  }

  return v9;
}

- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  int v51;
  id v52;
  id v53;
  id *v54;
  void *v55;
  int v56;
  id v57;
  id v58;
  id v59;
  id *v60;
  id *v61;
  void *v62;
  void *v63;
  os_log_t log;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = v8;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackError:forReason:withResult:withError:", CFSTR("[POLICY] SELECT_UPDATE_ASSET"), CFSTR("Select MacRecoveryOSUpdate called with unexpected nil primaryAsset param"), 8102, 0);
    goto LABEL_57;
  }
  objc_msgSend(v8, "SUCoreBorder_results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  log = v13;
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 MacRecoveryOSUpdate query results (before filtering)", buf, 2u);
    }
    goto LABEL_56;
  }
  if (v14)
  {
    *(_DWORD *)buf = 134217984;
    v77 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu MacRecoveryOSUpdate query results (before filtering)", buf, 0xCu);
  }
  v60 = a3;
  v61 = a4;
  v62 = v9;

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  log = (os_log_t)objc_claimAutoreleasedReturnValue();
  v15 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v72;
    do
    {
      v18 = 0;
      v19 = v10;
      do
      {
        if (*(_QWORD *)v72 != v17)
          objc_enumerationMutation(log);
        v20 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v18);
        objc_msgSend(v20, "filterSoftwareUpdateAssetArray:", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "oslog");
        v22 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = objc_msgSend(v10, "count");
          objc_msgSend(v20, "extensionName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v77 = v23;
          v78 = 2114;
          v79 = v24;
          _os_log_impl(&dword_1DDFDD000, v22, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu MacRecoveryOSUpdate assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);

        }
        if (!objc_msgSend(v10, "count"))
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "oslog");
          v49 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DDFDD000, v49, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 MacRecoveryOSUpdate assets found, stopping filtering early", buf, 2u);
          }

          v9 = v62;
          goto LABEL_56;
        }
        ++v18;
        v19 = v10;
      }
      while (v16 != v18);
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    }
    while (v16);
  }

  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_3);
  v25 = objc_claimAutoreleasedReturnValue();
  -[NSObject lastObject](v25, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "attributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeStringForKey:", CFSTR("RestoreVersion"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0CB3880];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __98__SUCorePolicyMacRecoveryOSUpdate_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2;
  v69[3] = &unk_1EA877F48;
  v59 = v28;
  v70 = v59;
  objc_msgSend(v29, "predicateWithBlock:", v69);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  log = v25;
  -[NSObject filteredArrayUsingPredicate:](v25, "filteredArrayUsingPredicate:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "oslog");
  v33 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_msgSend(v31, "count");
    *(_DWORD *)buf = 134217984;
    v77 = v34;
    _os_log_impl(&dword_1DDFDD000, v33, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highest MacRecoveryOSUpdate assets in SUCorePolicyMacRecoveryOSUpdate", buf, 0xCu);
  }
  v63 = v10;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v35 = v31;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (!v36)
  {
    v38 = 0;
    v39 = 0;
    goto LABEL_44;
  }
  v37 = v36;
  v38 = 0;
  v39 = 0;
  v40 = *(_QWORD *)v66;
  do
  {
    for (i = 0; i != v37; ++i)
    {
      if (*(_QWORD *)v66 != v40)
        objc_enumerationMutation(v35);
      v42 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
      if (v38
        || (objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "attributes"),
            v45 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v45, "safeStringForKey:", CFSTR("PrerequisiteBuild")),
            v46 = (void *)objc_claimAutoreleasedReturnValue(),
            v46,
            v45,
            !v46))
      {
        if (v39)
          continue;
        objc_msgSend(v42, "attributes");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "safeStringForKey:", CFSTR("PrerequisiteBuild"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          v39 = 0;
          continue;
        }
        v39 = v42;
      }
      else
      {
        v38 = v42;
      }
      v47 = v42;
    }
    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  }
  while (v37);
LABEL_44:

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "restrictToFull");

  if (v51)
  {
    v52 = v39;
    v53 = 0;
    v9 = v62;
    v10 = v63;
    v54 = v61;
    goto LABEL_53;
  }
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "restrictToIncremental");

  v9 = v62;
  v10 = v63;
  v54 = v61;
  if (v56)
  {
    v57 = v38;
    goto LABEL_51;
  }
  if (v38 || !v39)
  {
    v52 = v38;
    v53 = v39;
  }
  else
  {
    v57 = v39;
LABEL_51:
    v52 = v57;
    v53 = 0;
  }
LABEL_53:
  v58 = objc_retainAutorelease(v52);
  *v60 = v58;
  if (v54)
    *v54 = objc_retainAutorelease(v53);

LABEL_56:
LABEL_57:

}

uint64_t __98__SUCorePolicyMacRecoveryOSUpdate_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("RestoreVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeStringForKey:", CFSTR("RestoreVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8980]), "initWithRestoreVersion:", v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8980]), "initWithRestoreVersion:", v8);
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

uint64_t __98__SUCorePolicyMacRecoveryOSUpdate_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("RestoreVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", *(_QWORD *)(a1 + 32), v4);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = CFSTR("NO");
    v11 = 138543874;
    if ((_DWORD)v5)
      v9 = CFSTR("YES");
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest MacRecoveryOSUpdate restore version, highestRestoreVersion=%{public}@, assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v11, 0x20u);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyMacRecoveryOSUpdate)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyMacRecoveryOSUpdate *v5;
  uint64_t v6;
  NSString *installedSFRRestoreVersion;
  uint64_t v8;
  NSString *installedRecoveryOSBuildVersion;
  uint64_t v10;
  NSString *installedRecoveryOSProductVersion;
  uint64_t v12;
  NSString *installedRecoveryOSRestoreVersion;
  uint64_t v14;
  NSString *installedRecoveryOSReleaseType;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v5 = -[SUCorePolicy initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstalledSFRRestoreVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    installedSFRRestoreVersion = v5->_installedSFRRestoreVersion;
    v5->_installedSFRRestoreVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstalledRecoveryOSBuildVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    installedRecoveryOSBuildVersion = v5->_installedRecoveryOSBuildVersion;
    v5->_installedRecoveryOSBuildVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstalledRecoveryOSProductVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    installedRecoveryOSProductVersion = v5->_installedRecoveryOSProductVersion;
    v5->_installedRecoveryOSProductVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstalledRecoveryOSRestoreVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    installedRecoveryOSRestoreVersion = v5->_installedRecoveryOSRestoreVersion;
    v5->_installedRecoveryOSRestoreVersion = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstalledRecoveryOSReleaseType"));
    v14 = objc_claimAutoreleasedReturnValue();
    installedRecoveryOSReleaseType = v5->_installedRecoveryOSReleaseType;
    v5->_installedRecoveryOSReleaseType = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v4 = a3;
  -[SUCorePolicy encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("InstalledSFRRestoreVersion"));

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("InstalledRecoveryOSBuildVersion"));

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("InstalledRecoveryOSProductVersion"));

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("InstalledRecoveryOSRestoreVersion"));

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("InstalledRecoveryOSReleaseType"));

}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyMacRecoveryOSUpdate *v4;
  SUCorePolicyMacRecoveryOSUpdate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = (SUCorePolicyMacRecoveryOSUpdate *)a3;
  if (v4 == self)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v27.receiver = self;
      v27.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
      if (-[SUCorePolicy isEqual:](&v27, sel_isEqual_, v5))
      {
        v6 = (void *)MEMORY[0x1E0DA8920];
        -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](v5, "installedSFRRestoreVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "stringIsEqual:to:", v7, v8))
        {
          v9 = (void *)MEMORY[0x1E0DA8920];
          -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](v5, "installedRecoveryOSBuildVersion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "stringIsEqual:to:", v10, v11))
          {
            v12 = (void *)MEMORY[0x1E0DA8920];
            -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](v5, "installedRecoveryOSProductVersion");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "stringIsEqual:to:", v13))
            {
              v25 = v13;
              v14 = (void *)MEMORY[0x1E0DA8920];
              -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
              v15 = objc_claimAutoreleasedReturnValue();
              -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](v5, "installedRecoveryOSRestoreVersion");
              v16 = objc_claimAutoreleasedReturnValue();
              v24 = (void *)v15;
              v17 = v15;
              v18 = (void *)v16;
              if (objc_msgSend(v14, "stringIsEqual:to:", v17, v16))
              {
                v23 = (void *)MEMORY[0x1E0DA8920];
                -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](v5, "installedRecoveryOSReleaseType");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v23, "stringIsEqual:to:", v19, v20);

              }
              else
              {
                v21 = 0;
              }

              v13 = v25;
            }
            else
            {
              v21 = 0;
            }

          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v5 = -[SUCorePolicy copyWithZone:](&v17, sel_copyWithZone_);
  -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setInstalledSFRRestoreVersion:", v7);

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setInstalledRecoveryOSBuildVersion:", v9);

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setInstalledRecoveryOSProductVersion:", v11);

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setInstalledRecoveryOSRestoreVersion:", v13);

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setInstalledRecoveryOSReleaseType:", v15);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyMacRecoveryOSUpdate(super:%@|installedSFRRestoreVersion:%@|installedRecoveryOSBuildVersion:%@|installedRecoveryOSProductVersion:%@|installedRecoveryOSRestoreVersion:%@|installedRecoveryOSReleaseType:%@)"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy summary](&v21, sel_summary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("installedSFRRestoreVersion:%@|"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("installedRecoveryOSBuildVersion:%@|"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("installedRecoveryOSProductVersion:%@|"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v12;
  }
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("installedRecoveryOSRestoreVersion:%@|"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v15;
  }
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("installedRecoveryOSReleaseType:%@|"), v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v18;
  }
  if ((objc_msgSend(v3, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("|"));
    v19 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v19;
  }
  return v3;
}

- (NSString)installedSFRRestoreVersion
{
  return self->_installedSFRRestoreVersion;
}

- (void)setInstalledSFRRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedSFRRestoreVersion, a3);
}

- (NSString)installedRecoveryOSBuildVersion
{
  return self->_installedRecoveryOSBuildVersion;
}

- (void)setInstalledRecoveryOSBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedRecoveryOSBuildVersion, a3);
}

- (NSString)installedRecoveryOSProductVersion
{
  return self->_installedRecoveryOSProductVersion;
}

- (void)setInstalledRecoveryOSProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedRecoveryOSProductVersion, a3);
}

- (NSString)installedRecoveryOSRestoreVersion
{
  return self->_installedRecoveryOSRestoreVersion;
}

- (void)setInstalledRecoveryOSRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedRecoveryOSRestoreVersion, a3);
}

- (NSString)installedRecoveryOSReleaseType
{
  return self->_installedRecoveryOSReleaseType;
}

- (void)setInstalledRecoveryOSReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_installedRecoveryOSReleaseType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedRecoveryOSReleaseType, 0);
  objc_storeStrong((id *)&self->_installedRecoveryOSRestoreVersion, 0);
  objc_storeStrong((id *)&self->_installedRecoveryOSProductVersion, 0);
  objc_storeStrong((id *)&self->_installedRecoveryOSBuildVersion, 0);
  objc_storeStrong((id *)&self->_installedSFRRestoreVersion, 0);
}

@end
