@implementation WFRemoteQuarantinePolicyManager

- (WFRemoteQuarantinePolicyManager)init
{
  WFRemoteQuarantinePolicyManager *v3;
  uint64_t v4;
  CKContainer *container;
  uint64_t v6;
  CKDatabase *database;
  void *v8;
  void *v9;
  uint64_t v10;
  NSBundle *localPolicyBundle;
  void *v12;
  WFRemoteQuarantinePolicyManager *v13;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFRemoteQuarantinePolicyManager;
  v3 = -[WFRemoteQuarantinePolicyManager init](&v16, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C94C28], "wf_shortcutsContainer");
    v4 = objc_claimAutoreleasedReturnValue();
    container = v3->_container;
    v3->_container = (CKContainer *)v4;

    -[CKContainer publicCloudDatabase](v3->_container, "publicCloudDatabase");
    v6 = objc_claimAutoreleasedReturnValue();
    database = v3->_database;
    v3->_database = (CKDatabase *)v6;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("RemoteQuarantineAsset"), CFSTR("bundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    localPolicyBundle = v3->_localPolicyBundle;
    v3->_localPolicyBundle = (NSBundle *)v10;

    -[WFRemoteQuarantinePolicyManager policyStringForBundleIfValid:](v3, "policyStringForBundleIfValid:", v3->_localPolicyBundle);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("WFRemoteQuarantinePolicyManager.m"), 67, CFSTR("Local policy asset bundle %@ is not valid"), CFSTR("com.apple.Shortcuts.RemoteQuarantineAsset"));

    }
    v13 = v3;

  }
  return v3;
}

- (id)policyString
{
  void *v3;
  void *v4;

  -[WFRemoteQuarantinePolicyManager policyAssetBundle](self, "policyAssetBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteQuarantinePolicyManager policyStringForBundleIfValid:](self, "policyStringForBundleIfValid:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)policyVersion
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFRemoteQuarantinePolicyManager policyAssetBundle](self, "policyAssetBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("ContentVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (id)localizedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFRemoteQuarantinePolicyManager policyAssetBundle](self, "policyAssetBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = v6;
  if (!v7)
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[WFRemoteQuarantinePolicyManager localizedString:]";
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Warning: Can't find remote quarantine localized string for value '%{public}@'", (uint8_t *)&v12, 0x16u);
    }

    v8 = v4;
  }
  v10 = v8;

  return v10;
}

- (id)policyAssetBundle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFRemoteQuarantinePolicyManager latestRemotePolicyAssetBundle](self, "latestRemotePolicyAssetBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFRemoteQuarantinePolicyManager localPolicyBundle](self, "localPolicyBundle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)latestRemotePolicyAssetBundle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFAssetsDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 2, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__WFRemoteQuarantinePolicyManager_latestRemotePolicyAssetBundle__block_invoke;
  v12[3] = &unk_1E7AEA740;
  v12[4] = self;
  objc_msgSend(v5, "if_compactMap:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_63);
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject lastObject](v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6 || (objc_msgSend(v6, "vc_isFileNotFound") & 1) != 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      WFAssetsDirectory();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v15 = "-[WFRemoteQuarantinePolicyManager latestRemotePolicyAssetBundle]";
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Encountered an error while trying to access asset bundles directory (%{public}@). Error: %{public}@", buf, 0x20u);

    }
    v9 = 0;
  }

LABEL_7:
  return v9;
}

- (id)policyStringForBundleIfValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CompatibilityVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 == 2)
  {
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("WFRemoteQuarantinePolicy"), CFSTR("js"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v9, 4, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (objc_msgSend(v10, "length"))
      {
        v12 = v10;
      }
      else
      {
        getWFGeneralLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v17 = "-[WFRemoteQuarantinePolicyManager policyStringForBundleIfValid:]";
          v18 = 2114;
          v19 = v9;
          v20 = 2114;
          v21 = v11;
          _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Failed to parse remote quarantine policy file %{public}@. Error: %{public}@", buf, 0x20u);
        }

        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (void)updatePolicyWithXPCActivity:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  WFCloudKitItemRequest *v23;
  void *v24;
  void *v25;
  WFCloudKitItemRequest *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v33[5];
  id v34;
  SEL v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D13E18];
  v8 = a3;
  objc_msgSend(v7, "sharedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForInfoDictionaryKey:", CFSTR("CFBundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringForKey:", CFSTR("WFRemoteQuarantineConfiguration"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v11);
  objc_msgSend(v14, "UTF8String");
  if ((os_variant_has_internal_content() & (v13 != 0)) != 0)
    v15 = v13;
  else
    v15 = CFSTR("default");
  v16 = v15;
  -[WFRemoteQuarantinePolicyManager latestRemotePolicyAssetBundle](self, "latestRemotePolicyAssetBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForInfoDictionaryKey:", CFSTR("ContentVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  WFEnforceClass(v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("compatibilityVersion = %ld AND contentVersion > %ld AND configuration = %@"), 2, v21, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [WFCloudKitItemRequest alloc];
  -[WFRemoteQuarantinePolicyManager container](self, "container");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteQuarantinePolicyManager database](self, "database");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[WFCloudKitItemRequest initWithContainer:database:](v23, "initWithContainer:database:", v24, v25);

  -[WFCloudKitItemRequest setXpcActivity:](v26, "setXpcActivity:", v8);
  v27 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("contentVersion"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __81__WFRemoteQuarantinePolicyManager_updatePolicyWithXPCActivity_completionHandler___block_invoke;
  v33[3] = &unk_1E7AEA7A8;
  v34 = v6;
  v35 = a2;
  v33[4] = self;
  v30 = v6;
  v31 = -[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:qualityOfService:completionHandler:](v26, "fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:qualityOfService:completionHandler:", v22, v27, CFSTR("ConfigurationAssetQuery"), 0, v29, 1, 17, v33);

}

- (BOOL)processAsset:(id)a3 error:(id *)a4
{
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "compatibilityVersion") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteQuarantinePolicyManager.m"), 214, CFSTR("Cannot process incompatible asset. Found version: %ld. Expected: %ld"), objc_msgSend(v7, "compatibilityVersion"), 2);

  }
  v8 = -[WFRemoteQuarantinePolicyManager persistAssetToDisk:error:](self, "persistAssetToDisk:error:", v7, a4);
  if (v8)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v11 = -[WFRemoteQuarantinePolicyManager deleteAssetBundlesExceptAssetWithIdentifier:error:](self, "deleteAssetBundlesExceptAssetWithIdentifier:error:", v10, &v16);
    v12 = v16;

    if (!v11)
    {
      getWFGeneralLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFRemoteQuarantinePolicyManager processAsset:error:]";
        v19 = 2114;
        v20 = v12;
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Failed to clean-up older assets. Error: %{public}@", buf, 0x16u);
      }

    }
  }

  return v8;
}

- (BOOL)persistAssetToDisk:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unsigned __int8 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "assetDataFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFExtractArchiveFile();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteQuarantinePolicyManager prepareDirectoryForAssetWithIdentifier:error:](self, "prepareDirectoryForAssetWithIdentifier:error:", v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteQuarantinePolicyManager.m"), 236, CFSTR("WFRemoteQuarantinePolicyManager cannot access the filesystem."));

      v27 = 0;
LABEL_35:

      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v16, &v51) & 1) != 0)
      {
        v17 = v51;

        if (v17)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "fileURL");
          v19 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v19, 0, 0, 0);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
          if (v20)
          {
            v21 = v20;
            v38 = v9;
            v40 = v7;
            v22 = *(_QWORD *)v48;
            while (2)
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v48 != v22)
                  objc_enumerationMutation(obj);
                v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                objc_msgSend(v24, "lastPathComponent");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "URLByAppendingPathComponent:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                LODWORD(v24) = objc_msgSend(v13, "moveItemAtURL:toURL:error:", v24, v26, a4);
                if (!(_DWORD)v24)
                {
                  v27 = 0;
                  goto LABEL_31;
                }
              }
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
              if (v21)
                continue;
              break;
            }
            v27 = 1;
LABEL_31:
            v9 = v38;
            v7 = v40;
          }
          else
          {
            v27 = 1;
          }

LABEL_34:
          goto LABEL_35;
        }
      }
      else
      {

      }
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v19 = v9;
    v29 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v29)
    {
      v30 = v29;
      v39 = v9;
      v41 = v7;
      v31 = *(_QWORD *)v44;
      while (2)
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v19);
          v33 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_msgSend(v33, "filename");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "URLByAppendingPathComponent:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "fileURL");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v34) = objc_msgSend(v13, "moveItemAtURL:toURL:error:", v36, v35, a4);

          if (!(_DWORD)v34)
          {
            v27 = 0;
            goto LABEL_28;
          }
        }
        v30 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v30)
          continue;
        break;
      }
      v27 = 1;
LABEL_28:
      v9 = v39;
      v7 = v41;
    }
    else
    {
      v27 = 1;
    }
    goto LABEL_34;
  }
  v27 = 0;
LABEL_36:

  return v27;
}

- (BOOL)deleteAssetBundlesExceptAssetWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFAssetDataDirectoryForIdentifier(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByStandardizingPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WFAssetsDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, 0, 2, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __85__WFRemoteQuarantinePolicyManager_deleteAssetBundlesExceptAssetWithIdentifier_error___block_invoke;
  v25[3] = &unk_1E7AEA7D0;
  v12 = v8;
  v26 = v12;
  objc_msgSend(v10, "if_objectsPassingTest:", v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          if (!objc_msgSend(v6, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), a4, (_QWORD)v21))
          {
            v19 = 0;
            goto LABEL_12;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        if (v16)
          continue;
        break;
      }
    }
    v19 = 1;
LABEL_12:

  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    v19 = v11 == 0;
  }

  return v19;
}

- (id)prepareDirectoryForAssetWithIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WFAssetDataDirectoryForIdentifier(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "fileExistsAtPath:", v9)
    && !objc_msgSend(v7, "removeItemAtURL:error:", v8, a4))
  {
    v11 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, a4);
    v11 = 0;
    if (v10)
      v11 = v8;
  }

  return v11;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (NSBundle)localPolicyBundle
{
  return self->_localPolicyBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPolicyBundle, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

uint64_t __85__WFRemoteQuarantinePolicyManager_deleteAssetBundlesExceptAssetWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  objc_msgSend(a2, "URLByStandardizingPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("bundle")))
  {
    v5 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

    v6 = v5 ^ 1u;
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

void __81__WFRemoteQuarantinePolicyManager_updatePolicyWithXPCActivity_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD aBlock[4];
  id v18;

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__WFRemoteQuarantinePolicyManager_updatePolicyWithXPCActivity_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E7AEE600;
  v18 = *(id *)(a1 + 40);
  v7 = _Block_copy(aBlock);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    (*((void (**)(void *, _QWORD, id))v7 + 2))(v7, 0, v6);
  }
  else if (v5 && objc_msgSend(v5, "count"))
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("WFRemoteQuarantinePolicyManager.m"), 200, CFSTR("We should only be getting at most 1 asset, as defined in the request call."));

    }
    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    v16 = 0;
    v11 = objc_msgSend(v10, "processAsset:error:", v9, &v16);
    v12 = v16;
    if ((v11 & 1) != 0)
    {
      v13 = 1;
      v14 = 0;
    }
    else
    {
      v13 = 0;
      v14 = v12;
    }
    ((void (**)(_QWORD, uint64_t, id))v8)[2](v8, v13, v14);

  }
  else
  {
    v8[2](v8, 2, 0);
  }

}

void __81__WFRemoteQuarantinePolicyManager_updatePolicyWithXPCActivity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  switch(a2)
  {
    case 0:
      getWFGeneralLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "-[WFRemoteQuarantinePolicyManager updatePolicyWithXPCActivity:completionHandler:]_block_invoke";
        v14 = 2114;
        v15 = v6;
        v8 = "%s Failed to refresh remote quarantine policy. Error: %{public}@";
        v9 = v7;
        v10 = OS_LOG_TYPE_ERROR;
        v11 = 22;
LABEL_11:
        _os_log_impl(&dword_1C15B3000, v9, v10, v8, (uint8_t *)&v12, v11);
        goto LABEL_12;
      }
      goto LABEL_12;
    case 2:
      getWFGeneralLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v12 = 136315138;
        v13 = "-[WFRemoteQuarantinePolicyManager updatePolicyWithXPCActivity:completionHandler:]_block_invoke";
        v8 = "%s Remote quarantine policy is up-to-date.";
        goto LABEL_10;
      }
LABEL_12:

      break;
    case 1:
      getWFGeneralLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v12 = 136315138;
        v13 = "-[WFRemoteQuarantinePolicyManager updatePolicyWithXPCActivity:completionHandler:]_block_invoke_2";
        v8 = "%s Successfully refreshed remote quarantine policy.";
LABEL_10:
        v9 = v7;
        v10 = OS_LOG_TYPE_INFO;
        v11 = 12;
        goto LABEL_11;
      }
      goto LABEL_12;
  }
  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, v6, v5);

}

id __64__WFRemoteQuarantinePolicyManager_latestRemotePolicyAssetBundle__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("bundle"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "policyStringForBundleIfValid:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __64__WFRemoteQuarantinePolicyManager_latestRemotePolicyAssetBundle__block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "objectForInfoDictionaryKey:", CFSTR("ContentVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v4, "numberWithUnsignedInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("ContentVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  WFEnforceClass(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v11, "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v10, "compare:", v16);

  return v17;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1192);
  return (id)sharedManager_policyManager;
}

void __48__WFRemoteQuarantinePolicyManager_sharedManager__block_invoke()
{
  WFRemoteQuarantinePolicyManager *v0;
  void *v1;

  v0 = objc_alloc_init(WFRemoteQuarantinePolicyManager);
  v1 = (void *)sharedManager_policyManager;
  sharedManager_policyManager = (uint64_t)v0;

}

@end
