@implementation SUCorePolicyExtensionSplatUpdate

- (SUCorePolicyExtensionSplatUpdate)init
{
  SUCorePolicyExtensionSplatUpdate *v2;
  void *v3;
  uint64_t v4;
  NSString *installedSplatRestoreVersion;
  void *v6;
  uint64_t v7;
  NSString *installedSplatProductVersion;
  void *v9;
  uint64_t v10;
  NSString *installedSplatProductVersionExtra;
  void *v12;
  uint64_t v13;
  NSString *installedSplatBuildVersion;
  void *v15;
  uint64_t v16;
  NSString *installedSplatReleaseType;
  void *v18;
  void *v19;
  NSString *v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  NSString *installedBaseOSRestoreVersion;
  void *v26;
  uint64_t v27;
  NSString *installedBaseOSProductVersion;
  void *v29;
  uint64_t v30;
  NSString *installedBaseOSBuildVersion;
  void *v32;
  uint64_t v33;
  NSString *installedBaseOSReleaseType;
  NSString *requestedSplatRestoreVersion;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)SUCorePolicyExtensionSplatUpdate;
  v2 = -[SUCorePolicyExtension init](&v37, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "splatCryptex1RestoreVersion");
    v4 = objc_claimAutoreleasedReturnValue();
    installedSplatRestoreVersion = v2->_installedSplatRestoreVersion;
    v2->_installedSplatRestoreVersion = (NSString *)v4;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "splatCryptex1ProductVersion");
    v7 = objc_claimAutoreleasedReturnValue();
    installedSplatProductVersion = v2->_installedSplatProductVersion;
    v2->_installedSplatProductVersion = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "splatCryptex1ProductVersionExtra");
    v10 = objc_claimAutoreleasedReturnValue();
    installedSplatProductVersionExtra = v2->_installedSplatProductVersionExtra;
    v2->_installedSplatProductVersionExtra = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "splatCryptex1BuildVersion");
    v13 = objc_claimAutoreleasedReturnValue();
    installedSplatBuildVersion = v2->_installedSplatBuildVersion;
    v2->_installedSplatBuildVersion = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "splatCryptex1ReleaseType");
    v16 = objc_claimAutoreleasedReturnValue();
    installedSplatReleaseType = v2->_installedSplatReleaseType;
    v2->_installedSplatReleaseType = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "releaseType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v2->_installedSplatReleaseType;

      if (v20)
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "restoreVersion");
        v24 = objc_claimAutoreleasedReturnValue();
        installedBaseOSRestoreVersion = v2->_installedBaseOSRestoreVersion;
        v2->_installedBaseOSRestoreVersion = (NSString *)v24;

        objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "productVersion");
        v27 = objc_claimAutoreleasedReturnValue();
        installedBaseOSProductVersion = v2->_installedBaseOSProductVersion;
        v2->_installedBaseOSProductVersion = (NSString *)v27;

        objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "buildVersion");
        v30 = objc_claimAutoreleasedReturnValue();
        installedBaseOSBuildVersion = v2->_installedBaseOSBuildVersion;
        v2->_installedBaseOSBuildVersion = (NSString *)v30;

        objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "releaseType");
        v33 = objc_claimAutoreleasedReturnValue();
        installedBaseOSReleaseType = v2->_installedBaseOSReleaseType;
        v2->_installedBaseOSReleaseType = (NSString *)v33;

        requestedSplatRestoreVersion = v2->_requestedSplatRestoreVersion;
        v2->_requestedSplatRestoreVersion = 0;

        v2->_allowSameRestoreVersion = 0;
        return v2;
      }
      objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "releaseType");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v2->_installedSplatReleaseType;
      v2->_installedSplatReleaseType = (NSString *)v21;

    }
    goto LABEL_6;
  }
  return v2;
}

- (id)_stringRemovingParenthesis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("("), &stru_1EA87A8E8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(")"), &stru_1EA87A8E8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  SUCorePolicyExtensionSplatUpdate *v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  objc_class *v33;
  char *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  NSObject *v50;
  _BOOL4 v51;
  const __CFString *v52;
  const __CFString *v53;
  id v54;
  void *v55;
  char *v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  void *v64;
  void *v65;
  SUCorePolicyExtensionSplatUpdate *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  _BOOL4 v81;
  const char *v82;
  id v83;
  id v85;
  id v86;
  id v87;
  SUCorePolicyExtensionSplatUpdate *v88;
  void *v89;
  SUCorePolicyExtensionSplatUpdate *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  _QWORD v94[4];
  char *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t v104[128];
  uint8_t buf[4];
  SUCorePolicyExtensionSplatUpdate *v106;
  __int16 v107;
  const char *v108;
  __int16 v109;
  const __CFString *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  const __CFString *v114;
  __int16 v115;
  const __CFString *v116;
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
  v87 = v5;
  v90 = self;
  if (!v6)
    goto LABEL_46;
  v7 = v6;
  v8 = *(_QWORD *)v101;
  v91 = *(_QWORD *)v101;
  do
  {
    v9 = 0;
    v92 = v7;
    do
    {
      if (*(_QWORD *)v101 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "attributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safeStringForKey:", CFSTR("ReleaseType"));
        v12 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0DA8920];
        objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "releaseType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v13, "stringIsEqual:to:", v12, v15);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v10, "attributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "safeObjectForKey:ofClass:", CFSTR("Revoked"), objc_opt_class());
          v17 = objc_claimAutoreleasedReturnValue();

          v18 = -[NSObject BOOLValue](v17, "BOOLValue");
          objc_msgSend(v10, "attributes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "safeStringForKey:", CFSTR("RestoreVersion"));
          v20 = objc_claimAutoreleasedReturnValue();

          v21 = objc_alloc(MEMORY[0x1E0DA8980]);
          -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v21, "initWithRestoreVersion:", v22);

          v24 = (SUCorePolicyExtensionSplatUpdate *)v20;
          v25 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8980]), "initWithRestoreVersion:", v20);
          v93 = v23;
          if ((objc_msgSend(v23, "isComparable:", v25) & 1) != 0)
          {
            v26 = objc_msgSend(v23, "compare:", v25);
            v27 = v26;
            if (!v18)
            {
              v88 = v24;
              -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](v90, "installedSplatProductVersionExtra");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUCorePolicyExtensionSplatUpdate _stringRemovingParenthesis:](v90, "_stringRemovingParenthesis:", v39);
              v40 = objc_claimAutoreleasedReturnValue();
              v41 = (void *)v40;
              v42 = &stru_1EA87A8E8;
              if (v40)
                v42 = (__CFString *)v40;
              v29 = v42;

              objc_msgSend(v10, "attributes");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "safeStringForKey:", CFSTR("ProductVersionExtra"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUCorePolicyExtensionSplatUpdate _stringRemovingParenthesis:](v90, "_stringRemovingParenthesis:", v44);
              v45 = objc_claimAutoreleasedReturnValue();

              v89 = (void *)v45;
              if (v45)
                v46 = -[NSObject compare:options:](v29, "compare:options:", v45, 1);
              else
                v46 = 0;
              v24 = v88;
              if (v27 == -1
                || !v27
                && (-[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](v90, "allowSameRestoreVersion")
                 || v46 == -1))
              {
                objc_msgSend(v86, "addObject:", v10);
                v48 = 1;
              }
              else
              {
                v48 = 0;
              }
              objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "oslog");
              v50 = objc_claimAutoreleasedReturnValue();

              self = v90;
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                v51 = -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](v90, "allowSameRestoreVersion");
                *(_DWORD *)buf = 138544642;
                v52 = CFSTR("YES");
                if (v51)
                  v53 = CFSTR("YES");
                else
                  v53 = CFSTR("NO");
                v106 = v88;
                if (!v48)
                  v52 = CFSTR("NO");
                v107 = 2114;
                v108 = (const char *)v12;
                v109 = 2114;
                v110 = (const __CFString *)v29;
                v111 = 2114;
                v112 = v89;
                v113 = 2114;
                v114 = v53;
                v115 = 2114;
                v116 = v52;
                _os_log_impl(&dword_1DDFDD000, v50, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering update asset by restore version, restoreVersion=%{public}@, releaseType=%{public}@ installedProductVersionExtra=%{public}@ targetProductVersionExtra=%{public}@ allowSameRestoreVersion=%{public}@ | keep=%{public}@", buf, 0x3Eu);
              }

              v5 = v87;
              goto LABEL_42;
            }
            self = v90;
            if (v26)
            {
              objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "oslog");
              v29 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v106 = v24;
                v107 = 2114;
                v108 = (const char *)v12;
                v109 = 2114;
                v110 = CFSTR("NO");
                v30 = v29;
                v31 = "[POLICY] filtering revoked asset by restore version, restoreVersion=%{public}@, releaseType=%{publ"
                      "ic}@ | keep=%{public}@";
                goto LABEL_19;
              }
LABEL_42:
              v7 = v92;

LABEL_43:
              v8 = v91;
              goto LABEL_44;
            }
            objc_msgSend(v85, "addObject:", v10);
            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "oslog");
            v29 = objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              goto LABEL_42;
            *(_DWORD *)buf = 138543874;
            v106 = v24;
            v107 = 2114;
            v108 = (const char *)v12;
            v109 = 2114;
            v110 = CFSTR("YES");
            v30 = v29;
            v31 = "[POLICY] filtering revoked asset by restore version, restoreVersion=%{public}@, releaseType=%{public}@"
                  " | keep=%{public}@";
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "oslog");
            v29 = objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              self = v90;
              goto LABEL_42;
            }
            *(_DWORD *)buf = 138543874;
            self = v90;
            v106 = v90;
            v107 = 2114;
            v108 = (const char *)v93;
            v109 = 2114;
            v110 = v25;
            v30 = v29;
            v31 = "%{public}@ Incomparable RestoreVersion. Skipping asset for installedSplatRestoreVersion=%{public}@ tar"
                  "getSplatRestoreVersion=%{public}@";
          }
LABEL_19:
          _os_log_impl(&dword_1DDFDD000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0x20u);
          goto LABEL_42;
        }
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "oslog");
        v17 = objc_claimAutoreleasedReturnValue();

        v7 = v92;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "releaseType");
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v106 = self;
          v107 = 2114;
          v108 = (const char *)v12;
          v109 = 2114;
          v110 = v37;
          _os_log_impl(&dword_1DDFDD000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Incompatible asset ReleaseType: %{public}@ Device ReleaseType: %{public}@", buf, 0x20u);

        }
        goto LABEL_43;
      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v106 = self;
        v107 = 2112;
        v108 = v34;
        _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Unexpected type in MobileAsset asset array: %@", buf, 0x16u);

      }
LABEL_44:

      ++v9;
    }
    while (v7 != v9);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
  }
  while (v7);
LABEL_46:

  v54 = objc_alloc(MEMORY[0x1E0DA8928]);
  v55 = (void *)objc_msgSend(v54, "initWithProjectName:", *MEMORY[0x1E0DA8A10]);
  objc_msgSend(v55, "getStringConfigForKey:", *MEMORY[0x1E0DA89E0]);
  v56 = (char *)objc_claimAutoreleasedReturnValue();

  if (v56)
    goto LABEL_57;
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v58 = v86;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v60; ++i)
      {
        if (*(_QWORD *)v97 != v61)
          objc_enumerationMutation(v58);
        objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "attributes");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "safeStringForKey:", CFSTR("ProductVersionExtra"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
          objc_msgSend(v57, "addObject:", v64);

      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    }
    while (v60);
  }

  objc_msgSend(v57, "sortedArrayUsingSelector:", sel_compare_);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "lastObject");
  v56 = (char *)objc_claimAutoreleasedReturnValue();

  v5 = v87;
  v66 = v90;
  if (v56)
  {
LABEL_57:
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "oslog");
    v68 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = objc_msgSend(v86, "count");
      *(_DWORD *)buf = 134218242;
      v106 = (SUCorePolicyExtensionSplatUpdate *)v69;
      v107 = 2114;
      v108 = v56;
      _os_log_impl(&dword_1DDFDD000, v68, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu update assets before filtering for productVersionExtra=%{public}@", buf, 0x16u);
    }

    v70 = (void *)MEMORY[0x1E0CB3880];
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __67__SUCorePolicyExtensionSplatUpdate_filterSoftwareUpdateAssetArray___block_invoke;
    v94[3] = &unk_1EA877F48;
    v56 = v56;
    v95 = v56;
    objc_msgSend(v70, "predicateWithBlock:", v94);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "filteredArrayUsingPredicate:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = (id)objc_msgSend(v72, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "oslog");
    v74 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = objc_msgSend(v58, "count");
      *(_DWORD *)buf = 134218242;
      v106 = (SUCorePolicyExtensionSplatUpdate *)v75;
      v107 = 2114;
      v108 = v56;
      _os_log_impl(&dword_1DDFDD000, v74, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu update assets left after filtering for productVersionExtra=%{public}@", buf, 0x16u);
    }

    v66 = v90;
  }
  if (!objc_msgSend(v58, "count"))
  {
    v79 = objc_msgSend(v85, "count");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "oslog");
    v77 = objc_claimAutoreleasedReturnValue();

    v81 = os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT);
    if (v79)
    {
      if (v81)
      {
        *(_DWORD *)buf = 138543618;
        v106 = v90;
        v107 = 2082;
        v108 = "-[SUCorePolicyExtensionSplatUpdate filterSoftwareUpdateAssetArray:]";
        v82 = "%{public}@ %{public}s - Returning splat rollback";
LABEL_71:
        _os_log_impl(&dword_1DDFDD000, v77, OS_LOG_TYPE_DEFAULT, v82, buf, 0x16u);
      }
    }
    else if (v81)
    {
      *(_DWORD *)buf = 138543618;
      v106 = v90;
      v107 = 2082;
      v108 = "-[SUCorePolicyExtensionSplatUpdate filterSoftwareUpdateAssetArray:]";
      v82 = "%{public}@ %{public}s - Returning empty asset set";
      goto LABEL_71;
    }
    v78 = v85;
    goto LABEL_73;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "oslog");
  v77 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v106 = v66;
    v107 = 2082;
    v108 = "-[SUCorePolicyExtensionSplatUpdate filterSoftwareUpdateAssetArray:]";
    _os_log_impl(&dword_1DDFDD000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s - Returning splat updates", buf, 0x16u);
  }
  v78 = v58;
LABEL_73:

  v83 = v78;
  return v83;
}

uint64_t __67__SUCorePolicyExtensionSplatUpdate_filterSoftwareUpdateAssetArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DA8920];
  objc_msgSend(v3, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("ProductVersionExtra"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "stringIsEqual:to:", v6, *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeStringForKey:", CFSTR("ProductVersionExtra"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("NO");
    v16 = 138543874;
    v17 = v10;
    v18 = 2114;
    if ((_DWORD)v7)
      v14 = CFSTR("YES");
    v19 = v12;
    v20 = 2114;
    v21 = v14;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering update asset for productVersionExtra=%{public}@, assetProductVersionExtra=%{public}@ | keep=%{public}@", (uint8_t *)&v16, 0x20u);

  }
  return v7;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
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
  const __CFString *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint8_t buf[4];
  SUCorePolicyExtensionSplatUpdate *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasSplat");

    if (v6)
    {
      -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPrerequisiteReleaseType:", v7);

      objc_msgSend(v4, "prerequisiteReleaseType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("|"), "stringByAppendingFormat:", CFSTR("releaseType:%@|"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setAllowSameVersion:", -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion"));
      v10 = objc_msgSend(v4, "allowSameVersion");
      v11 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("allowSameVersion:%@|"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "additionalServerParams");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSafeObject:forKey:", v14, CFSTR("Build"));

      objc_msgSend(v4, "additionalServerParams");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeStringForKey:", CFSTR("Build"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("Build"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "additionalServerParams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSafeObject:forKey:", v19, CFSTR("ProductVersionExtra"));

      objc_msgSend(v4, "additionalServerParams");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safeStringForKey:", CFSTR("ProductVersionExtra"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("ProductVersionExtra"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "additionalServerParams");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSafeObject:forKey:", v24, CFSTR("InstalledSplatRestoreVersion"));

      objc_msgSend(v4, "additionalServerParams");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "safeStringForKey:", CFSTR("InstalledSplatRestoreVersion"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("InstalledSplatRestoreVersion"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "additionalServerParams");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setSafeObject:forKey:", v29, CFSTR("RequestedRestoreVersion"));

      objc_msgSend(v4, "additionalServerParams");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "safeStringForKey:", CFSTR("RequestedRestoreVersion"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("RequestedRestoreVersion"), v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "additionalServerParams");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion"))
        v34 = CFSTR("true");
      else
        v34 = CFSTR("false");
      objc_msgSend(v33, "setSafeObject:forKey:", v34, CFSTR("AllowSameRestoreVersion"));

      objc_msgSend(v4, "additionalServerParams");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "safeStringForKey:", CFSTR("AllowSameRestoreVersion"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("AllowSameRestoreVersion"), v36);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ without hasSplat = YES, yet calling extendMASoftwareUpdateCatalogDownloadOptions (no extended download options will be added)"), self);
      objc_msgSend(v35, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] DOWNLOAD_OPTIONS"), v36, 8102, 0);
      v37 = CFSTR("|");
    }

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "oslog");
    v39 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = self;
      v43 = 2114;
      v44 = v37;
      _os_log_impl(&dword_1DDFDD000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading software update catalog with extended download options: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "oslog");
    v39 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v39, OS_LOG_TYPE_DEFAULT, "Options class is not MAMsuDownloadOptions, so unable to set splat options.", buf, 2u);
    }
    v37 = CFSTR("|");
  }

}

- (BOOL)isSplatPolicy
{
  return 1;
}

- (SUCorePolicyExtensionSplatUpdate)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyExtensionSplatUpdate *v5;
  uint64_t v6;
  NSString *installedSplatRestoreVersion;
  uint64_t v8;
  NSString *installedSplatBuildVersion;
  uint64_t v10;
  NSString *installedSplatProductVersion;
  uint64_t v12;
  NSString *installedSplatProductVersionExtra;
  uint64_t v14;
  NSString *installedSplatReleaseType;
  uint64_t v16;
  NSString *installedBaseOSRestoreVersion;
  uint64_t v18;
  NSString *installedBaseOSBuildVersion;
  uint64_t v20;
  NSString *installedBaseOSProductVersion;
  uint64_t v22;
  NSString *installedBaseOSReleaseType;
  uint64_t v24;
  NSString *requestedSplatRestoreVersion;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUCorePolicyExtensionSplatUpdate;
  v5 = -[SUCorePolicyExtension init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installedSplatRestoreVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    installedSplatRestoreVersion = v5->_installedSplatRestoreVersion;
    v5->_installedSplatRestoreVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installedSplatBuildVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    installedSplatBuildVersion = v5->_installedSplatBuildVersion;
    v5->_installedSplatBuildVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installedSplatProductVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    installedSplatProductVersion = v5->_installedSplatProductVersion;
    v5->_installedSplatProductVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installedSplatProductVersionExtra"));
    v12 = objc_claimAutoreleasedReturnValue();
    installedSplatProductVersionExtra = v5->_installedSplatProductVersionExtra;
    v5->_installedSplatProductVersionExtra = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installedSplatReleaseType"));
    v14 = objc_claimAutoreleasedReturnValue();
    installedSplatReleaseType = v5->_installedSplatReleaseType;
    v5->_installedSplatReleaseType = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installedBaseOSRestoreVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    installedBaseOSRestoreVersion = v5->_installedBaseOSRestoreVersion;
    v5->_installedBaseOSRestoreVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installedBaseOSBuildVersion"));
    v18 = objc_claimAutoreleasedReturnValue();
    installedBaseOSBuildVersion = v5->_installedBaseOSBuildVersion;
    v5->_installedBaseOSBuildVersion = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installedBaseOSProductVersion"));
    v20 = objc_claimAutoreleasedReturnValue();
    installedBaseOSProductVersion = v5->_installedBaseOSProductVersion;
    v5->_installedBaseOSProductVersion = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installedBaseOSReleaseType"));
    v22 = objc_claimAutoreleasedReturnValue();
    installedBaseOSReleaseType = v5->_installedBaseOSReleaseType;
    v5->_installedBaseOSReleaseType = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedSplatRestoreVersion"));
    v24 = objc_claimAutoreleasedReturnValue();
    requestedSplatRestoreVersion = v5->_requestedSplatRestoreVersion;
    v5->_requestedSplatRestoreVersion = (NSString *)v24;

    v5->_allowSameRestoreVersion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowSameRestoreVersion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
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
  id v14;

  v14 = a3;
  -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("installedSplatRestoreVersion"));

  -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("installedSplatBuildVersion"));

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("installedSplatProductVersion"));

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("installedSplatProductVersionExtra"));

  -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("installedSplatReleaseType"));

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("installedBaseOSRestoreVersion"));

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("installedBaseOSBuildVersion"));

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("installedBaseOSProductVersion"));

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("installedBaseOSReleaseType"));

  -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("requestedSplatRestoreVersion"));

  objc_msgSend(v14, "encodeBool:forKey:", -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion"), CFSTR("allowSameRestoreVersion"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyExtensionSplatUpdate *v4;
  SUCorePolicyExtensionSplatUpdate *v5;
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
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  int v32;
  void *v33;
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
  uint64_t v51;
  void *v52;

  v4 = (SUCorePolicyExtensionSplatUpdate *)a3;
  if (v4 == self)
  {
    LOBYTE(v32) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E0DA8920];
      -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](v5, "installedSplatRestoreVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "stringIsEqual:to:", v7, v8))
      {
        v9 = (void *)MEMORY[0x1E0DA8920];
        -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](v5, "installedSplatBuildVersion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "stringIsEqual:to:", v10, v11))
        {
          v12 = (void *)MEMORY[0x1E0DA8920];
          -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](v5, "installedSplatProductVersion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = v13;
          if (objc_msgSend(v12, "stringIsEqual:to:", v13))
          {
            v14 = (void *)MEMORY[0x1E0DA8920];
            -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](v5, "installedSplatProductVersionExtra");
            v15 = objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "stringIsEqual:to:", v15))
            {
              v47 = (void *)v15;
              v16 = (void *)MEMORY[0x1E0DA8920];
              -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](v5, "installedSplatReleaseType");
              v17 = objc_claimAutoreleasedReturnValue();
              -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = (void *)v17;
              if (objc_msgSend(v16, "stringIsEqual:to:", v17))
              {
                v18 = (void *)MEMORY[0x1E0DA8920];
                -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](v5, "installedBaseOSRestoreVersion");
                v19 = objc_claimAutoreleasedReturnValue();
                -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = (void *)v19;
                if (objc_msgSend(v18, "stringIsEqual:to:", v19))
                {
                  v43 = (void *)MEMORY[0x1E0DA8920];
                  -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](v5, "installedBaseOSBuildVersion");
                  v20 = objc_claimAutoreleasedReturnValue();
                  -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
                  v21 = objc_claimAutoreleasedReturnValue();
                  v22 = v43;
                  v42 = (void *)v21;
                  v44 = (void *)v20;
                  if (objc_msgSend(v22, "stringIsEqual:to:", v20))
                  {
                    v40 = (void *)MEMORY[0x1E0DA8920];
                    -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](v5, "installedBaseOSProductVersion");
                    v23 = objc_claimAutoreleasedReturnValue();
                    -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
                    v24 = objc_claimAutoreleasedReturnValue();
                    v25 = v40;
                    v39 = (void *)v24;
                    v41 = (void *)v23;
                    if (objc_msgSend(v25, "stringIsEqual:to:", v23))
                    {
                      v26 = (void *)MEMORY[0x1E0DA8920];
                      -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](v5, "installedBaseOSReleaseType");
                      v27 = objc_claimAutoreleasedReturnValue();
                      -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = (void *)v27;
                      if (objc_msgSend(v26, "stringIsEqual:to:", v27))
                      {
                        v28 = v47;
                        v29 = (void *)MEMORY[0x1E0DA8920];
                        -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](v5, "requestedSplatRestoreVersion");
                        v30 = objc_claimAutoreleasedReturnValue();
                        -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = (void *)v30;
                        if (objc_msgSend(v29, "stringIsEqual:to:", v30))
                        {
                          v31 = -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](v5, "allowSameRestoreVersion");
                          v32 = v31 ^ -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion") ^ 1;
                        }
                        else
                        {
                          LOBYTE(v32) = 0;
                        }
                        v33 = (void *)v51;
                        v13 = v52;

                      }
                      else
                      {
                        v28 = v47;
                        LOBYTE(v32) = 0;
                        v33 = (void *)v51;
                        v13 = v52;
                      }

                    }
                    else
                    {
                      v28 = v47;
                      LOBYTE(v32) = 0;
                      v33 = (void *)v51;
                      v13 = v52;
                    }

                  }
                  else
                  {
                    v28 = v47;
                    LOBYTE(v32) = 0;
                    v33 = (void *)v51;
                    v13 = v52;
                  }

                }
                else
                {
                  v28 = v47;
                  LOBYTE(v32) = 0;
                  v33 = (void *)v51;
                  v13 = v52;
                }

              }
              else
              {
                v28 = v47;
                LOBYTE(v32) = 0;
                v33 = (void *)v51;
                v13 = v52;
              }

            }
            else
            {
              v28 = (void *)v15;
              LOBYTE(v32) = 0;
              v33 = (void *)v51;
              v13 = v52;
            }

          }
          else
          {
            LOBYTE(v32) = 0;
            v33 = (void *)v51;
          }

        }
        else
        {
          LOBYTE(v32) = 0;
        }

      }
      else
      {
        LOBYTE(v32) = 0;
      }

    }
    else
    {
      LOBYTE(v32) = 0;
    }
  }

  return v32;
}

- (id)extensionName
{
  return CFSTR("SUCorePolicyExtensionSplatUpdate");
}

- (id)summary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  _BOOL4 v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  uint64_t v58;

  -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("|installedSplatRestoreVersion=%@"), v5);
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1EA87A8E8;
  }
  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("|installedSplatProductVersion=%@"), v10);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v12;
  }
  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("|installedSplatProductVersionExtra=%@"), v15);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v17;
  }
  -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("|installedSplatReleaseType=%@"), v20);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v22;
  }
  -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("|installedSplatBuildVersion=%@"), v25);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v27;
  }
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("|installedBaseOSRestoreVersion=%@"), v30);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v32;
  }
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("|installedBaseOSProductVersion=%@"), v35);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v36);
    v37 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v37;
  }
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("|installedBaseOSReleaseType=%@"), v40);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v41);
    v42 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v42;
  }
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("|installedBaseOSBuildVersion=%@"), v45);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v46);
    v47 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v47;
  }
  -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v49, "initWithFormat:", CFSTR("|requestedSplatRestoreVersion=%@"), v50);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v51);
    v52 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v52;
  }
  v53 = objc_alloc(MEMORY[0x1E0CB3940]);
  v54 = -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion");
  v55 = CFSTR("NO");
  if (v54)
    v55 = CFSTR("YES");
  v56 = (void *)objc_msgSend(v53, "initWithFormat:", CFSTR("|allowSameRestoreVersion=%@"), v55);
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v57, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v57, "stringByAppendingString:", CFSTR("|"));
    v58 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v58;
  }
  return v57;
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
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicyExtensionSplatUpdate extensionName](self, "extensionName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion");
  v13 = CFSTR("NO");
  if (v12)
    v13 = CFSTR("YES");
  v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@(installedSplatRestoreVersion:%@|installedSplatBuildVersion:%@|installedSplatProductVersion:%@|installedSplatProductVersionExtra:%@|installedSplatReleaseType:%@|installedBaseOSRestoreVersion:%@|installedBaseOSBuildVersion:%@|installedBaseOSProductVersion:%@|installedBaseOSReleaseType:%@|requestedSplatRestoreVersion:%@|allowSameRestoreVersion:%@)"), v16, v3, v4, v5, v15, v6, v7, v8, v9, v10, v11, v13);

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SUCorePolicyExtensionSplatUpdate *v4;
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

  v4 = objc_alloc_init(SUCorePolicyExtensionSplatUpdate);
  -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatRestoreVersion:](v4, "setInstalledSplatRestoreVersion:", v5);

  -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatBuildVersion:](v4, "setInstalledSplatBuildVersion:", v6);

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatProductVersion:](v4, "setInstalledSplatProductVersion:", v7);

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatProductVersionExtra:](v4, "setInstalledSplatProductVersionExtra:", v8);

  -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatReleaseType:](v4, "setInstalledSplatReleaseType:", v9);

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSRestoreVersion:](v4, "setInstalledBaseOSRestoreVersion:", v10);

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSBuildVersion:](v4, "setInstalledBaseOSBuildVersion:", v11);

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSProductVersion:](v4, "setInstalledBaseOSProductVersion:", v12);

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSReleaseType:](v4, "setInstalledBaseOSReleaseType:", v13);

  -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setRequestedSplatRestoreVersion:](v4, "setRequestedSplatRestoreVersion:", v14);

  -[SUCorePolicyExtensionSplatUpdate setAllowSameRestoreVersion:](v4, "setAllowSameRestoreVersion:", -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion"));
  return v4;
}

- (NSString)installedSplatRestoreVersion
{
  return self->_installedSplatRestoreVersion;
}

- (void)setInstalledSplatRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedSplatRestoreVersion, a3);
}

- (NSString)installedSplatBuildVersion
{
  return self->_installedSplatBuildVersion;
}

- (void)setInstalledSplatBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedSplatBuildVersion, a3);
}

- (NSString)installedSplatProductVersion
{
  return self->_installedSplatProductVersion;
}

- (void)setInstalledSplatProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedSplatProductVersion, a3);
}

- (NSString)installedSplatProductVersionExtra
{
  return self->_installedSplatProductVersionExtra;
}

- (void)setInstalledSplatProductVersionExtra:(id)a3
{
  objc_storeStrong((id *)&self->_installedSplatProductVersionExtra, a3);
}

- (NSString)installedSplatReleaseType
{
  return self->_installedSplatReleaseType;
}

- (void)setInstalledSplatReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_installedSplatReleaseType, a3);
}

- (NSString)installedBaseOSRestoreVersion
{
  return self->_installedBaseOSRestoreVersion;
}

- (void)setInstalledBaseOSRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedBaseOSRestoreVersion, a3);
}

- (NSString)installedBaseOSBuildVersion
{
  return self->_installedBaseOSBuildVersion;
}

- (void)setInstalledBaseOSBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedBaseOSBuildVersion, a3);
}

- (NSString)installedBaseOSProductVersion
{
  return self->_installedBaseOSProductVersion;
}

- (void)setInstalledBaseOSProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedBaseOSProductVersion, a3);
}

- (NSString)installedBaseOSReleaseType
{
  return self->_installedBaseOSReleaseType;
}

- (void)setInstalledBaseOSReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_installedBaseOSReleaseType, a3);
}

- (NSString)requestedSplatRestoreVersion
{
  return self->_requestedSplatRestoreVersion;
}

- (void)setRequestedSplatRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_requestedSplatRestoreVersion, a3);
}

- (BOOL)allowSameRestoreVersion
{
  return self->_allowSameRestoreVersion;
}

- (void)setAllowSameRestoreVersion:(BOOL)a3
{
  self->_allowSameRestoreVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedSplatRestoreVersion, 0);
  objc_storeStrong((id *)&self->_installedBaseOSReleaseType, 0);
  objc_storeStrong((id *)&self->_installedBaseOSProductVersion, 0);
  objc_storeStrong((id *)&self->_installedBaseOSBuildVersion, 0);
  objc_storeStrong((id *)&self->_installedBaseOSRestoreVersion, 0);
  objc_storeStrong((id *)&self->_installedSplatReleaseType, 0);
  objc_storeStrong((id *)&self->_installedSplatProductVersionExtra, 0);
  objc_storeStrong((id *)&self->_installedSplatProductVersion, 0);
  objc_storeStrong((id *)&self->_installedSplatBuildVersion, 0);
  objc_storeStrong((id *)&self->_installedSplatRestoreVersion, 0);
}

@end
