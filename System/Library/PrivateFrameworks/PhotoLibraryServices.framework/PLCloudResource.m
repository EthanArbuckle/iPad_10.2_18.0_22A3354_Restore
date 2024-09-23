@implementation PLCloudResource

- (void)repairCloudPlaceholderKindForVideoAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "master");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudResource cloudResourceForResourceType:forAssetUuid:forCloudMaster:](PLCloudResource, "cloudResourceForResourceType:forAssetUuid:forCloudMaster:", 1, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLocallyAvailable");

  if (v8)
    objc_msgSend(v3, "setCloudPlaceholderKind:", 5);
  if (objc_msgSend(v3, "cloudPlaceholderKind") != 5)
  {
    if (objc_msgSend(v3, "hasAdjustments"))
    {
      +[PLCloudResource legacyCloudResourceForResourceType:forAsset:](PLCloudResource, "legacyCloudResourceForResourceType:forAsset:", 5, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isLocallyAvailable");

      if (v10)
        objc_msgSend(v3, "setCloudPlaceholderKind:", 3);
      +[PLCloudResource legacyCloudResourceForResourceType:forAsset:](PLCloudResource, "legacyCloudResourceForResourceType:forAsset:", 4, v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isLocallyAvailable");

      if ((v12 & 1) == 0)
      {
        +[PLCloudResource legacyCloudResourceForResourceType:forAsset:](PLCloudResource, "legacyCloudResourceForResourceType:forAsset:", 3, v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isLocallyAvailable");

        if ((v14 & 1) == 0)
        {
          +[PLCloudResource legacyCloudResourceForResourceType:forAsset:](PLCloudResource, "legacyCloudResourceForResourceType:forAsset:", 2, v3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isLocallyAvailable");

          if ((v16 & 1) == 0)
          {
            +[PLCloudResource legacyCloudResourceForResourceType:forAsset:](PLCloudResource, "legacyCloudResourceForResourceType:forAsset:", 15, v3);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isLocallyAvailable");

            if ((v18 & 1) == 0)
            {
              +[PLCloudResource legacyCloudResourceForResourceType:forAsset:](PLCloudResource, "legacyCloudResourceForResourceType:forAsset:", 7, v3);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isLocallyAvailable");

              if ((v20 & 1) == 0)
              {
                +[PLCloudResource legacyCloudResourceForResourceType:forAsset:](PLCloudResource, "legacyCloudResourceForResourceType:forAsset:", 6, v3);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isLocallyAvailable");

                if ((v22 & 1) == 0)
                {
                  +[PLCloudResource legacyCloudResourceForResourceType:forAsset:](PLCloudResource, "legacyCloudResourceForResourceType:forAsset:", 16, v3);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "isLocallyAvailable");

                  if ((v24 & 1) == 0)
                    goto LABEL_24;
                }
              }
            }
          }
        }
      }
LABEL_23:
      objc_msgSend(v3, "setCloudPlaceholderKind:", 4);
      goto LABEL_24;
    }
    +[PLCloudResource cloudResourceForResourceType:forAssetUuid:forCloudMaster:](PLCloudResource, "cloudResourceForResourceType:forAssetUuid:forCloudMaster:", 5, v5, v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isLocallyAvailable");

    if (v26)
      objc_msgSend(v3, "setCloudPlaceholderKind:", 3);
    +[PLCloudResource cloudResourceForResourceType:forAssetUuid:forCloudMaster:](PLCloudResource, "cloudResourceForResourceType:forAssetUuid:forCloudMaster:", 4, v5, v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isLocallyAvailable");

    if ((v28 & 1) != 0)
      goto LABEL_23;
    +[PLCloudResource cloudResourceForResourceType:forAssetUuid:forCloudMaster:](PLCloudResource, "cloudResourceForResourceType:forAssetUuid:forCloudMaster:", 3, v5, v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isLocallyAvailable");

    if ((v30 & 1) != 0)
      goto LABEL_23;
    +[PLCloudResource cloudResourceForResourceType:forAssetUuid:forCloudMaster:](PLCloudResource, "cloudResourceForResourceType:forAssetUuid:forCloudMaster:", 2, v5, v4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isLocallyAvailable");

    if ((v32 & 1) != 0)
      goto LABEL_23;
    +[PLCloudResource cloudResourceForResourceType:forAssetUuid:forCloudMaster:](PLCloudResource, "cloudResourceForResourceType:forAssetUuid:forCloudMaster:", 7, v5, v4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isLocallyAvailable");

    if ((v34 & 1) != 0)
      goto LABEL_23;
    +[PLCloudResource cloudResourceForResourceType:forAssetUuid:forCloudMaster:](PLCloudResource, "cloudResourceForResourceType:forAssetUuid:forCloudMaster:", 6, v5, v4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isLocallyAvailable");

    if ((v36 & 1) != 0)
      goto LABEL_23;
    +[PLCloudResource cloudResourceForResourceType:forAssetUuid:forCloudMaster:](PLCloudResource, "cloudResourceForResourceType:forAssetUuid:forCloudMaster:", 16, v5, v4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isLocallyAvailable");

    if (v38)
      goto LABEL_23;
  }
LABEL_24:
  PLMigrationGetLog();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "uuid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138412546;
    v42 = v40;
    v43 = 1024;
    v44 = objc_msgSend(v3, "cloudPlaceholderKind");
    _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEBUG, "_fixVideoJPGPath: asset %@ cloudPlaceholderKind is now: %d", (uint8_t *)&v41, 0x12u);

  }
}

+ (id)legacyCloudResourceForResourceType:(unint64_t)a3 forAsset:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a4, "resources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((int)objc_msgSend(v10, "type") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (void)_copyResourceFileFrom:(id)a3 to:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject filePath](v6, "filePath");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = !objc_msgSend(v7, "fileExistsAtPath:", v9) || v8 == 0;
    if (!v10 && (objc_msgSend(v7, "fileExistsAtPath:", v8) & 1) == 0)
    {
      -[NSObject stringByDeletingLastPathComponent](v8, "stringByDeletingLastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v14 = objc_msgSend(v7, "createDirectoryIfNeededAtPath:error:", v13, &v21);
      v15 = v21;
      v12 = v15;
      if (v14)
      {
        v20 = v15;
        v16 = objc_msgSend(v7, "copyItemAtPath:toPath:error:", v9, v8, &v20);
        v17 = v20;

        if (v16)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v23 = v5;
              v24 = 2112;
              v25 = v6;
              _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Copied duplicated resource file from %@ to %@", buf, 0x16u);
            }

          }
          -[NSObject setIsLocallyAvailable:](v6, "setIsLocallyAvailable:", 1);
          if (-[NSObject type](v6, "type") != 1)
            goto LABEL_31;
          -[NSObject asset](v6, "asset");
          v19 = objc_claimAutoreleasedReturnValue();
          -[NSObject persistMetadataToFilesystem](v19, "persistMetadataToFilesystem");
        }
        else
        {
          if (*MEMORY[0x1E0D115D0])
          {
LABEL_31:
            v12 = v17;
            goto LABEL_32;
          }
          __CPLAssetsdOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v23 = v9;
            v24 = 2112;
            v25 = v8;
            v26 = 2112;
            v27 = v17;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to copy master resource file from %@ to duplicated asset %@. Error: %@", buf, 0x20u);
          }
        }
      }
      else
      {
        if (*MEMORY[0x1E0D115D0])
        {
LABEL_32:

LABEL_33:
          goto LABEL_34;
        }
        __CPLAssetsdOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v13;
          v24 = 2112;
          v25 = v12;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to create directory for resource file at %@. Error: %@", buf, 0x16u);
        }
        v17 = v12;
      }

      goto LABEL_31;
    }
  }
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11 && !*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v5;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Missing file path for duplicated resources, skip copying from %@ to %@", buf, 0x16u);
    }
    goto LABEL_33;
  }
LABEL_34:

}

+ (BOOL)legacyCreateNewResourcesIn:(id)a3 inManagedObjectContext:(id)a4 forAsset:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _BYTE *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  void *v53;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  id v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v55 = a4;
  v8 = a5;
  objc_msgSend(v7, "resources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v66 = v7;
        v67 = 2112;
        v68 = a1;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "No resources for cloudMaster %@, unable to create master resources for asset %@", buf, 0x16u);
      }

    }
    v16 = 0;
    goto LABEL_40;
  }
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetUuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v9;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (!v17)
      goto LABEL_38;
    v18 = v17;
    v48 = v10;
    v50 = v9;
    v19 = *(_QWORD *)v61;
    v20 = 1;
    v21 = (_BYTE *)MEMORY[0x1E0D115D0];
    v22 = obj;
LABEL_14:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v19)
        objc_enumerationMutation(v22);
      v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v23);
      objc_msgSend(v24, "assetUuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        if (*v21)
        {
          v20 = 0;
          goto LABEL_24;
        }
        __CPLAssetsdOSLogDomain();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v66 = v24;
          v67 = 2112;
          v68 = v22;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Found cloudResource %@ with unexpected non-nil assetUuid. masterResources: %@", buf, 0x16u);
        }
        v20 = 0;
      }
      else
      {
        objc_msgSend(v24, "setAssetUuid:", v53);
        v27 = (int)objc_msgSend(v24, "type");
        objc_msgSend(v24, "uniformTypeIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localResourcePathForMasterResourceWithCPLType:andUTI:", v27, v28);
        v26 = objc_claimAutoreleasedReturnValue();

        v22 = obj;
        objc_msgSend(v24, "setFilePath:", v26);
      }

LABEL_24:
      if (v18 == ++v23)
      {
        v29 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        v18 = v29;
        if (!v29)
        {
          v10 = v48;
          v9 = v50;
          goto LABEL_39;
        }
        goto LABEL_14;
      }
    }
  }
  objc_msgSend(a1, "assetUUIDToCloudResourcesForCloudMaster:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v53);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v12;
  if (v13)
  {
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_38;
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v66 = a1;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Already have master resources for asset %@", buf, 0xCu);
    }
  }
  else
  {
    v49 = v10;
    v51 = v9;
    objc_msgSend(v12, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = objc_claimAutoreleasedReturnValue();

    v47 = v31;
    objc_msgSend(v12, "objectForKey:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v32, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v34 = v32;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v57 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v40 = (int)objc_msgSend(v39, "type");
          objc_msgSend(v39, "uniformTypeIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localResourcePathForMasterResourceWithCPLType:andUTI:", v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          +[PLCloudResource duplicateCloudResource:forAsset:withFilePath:inManagedObjectContext:](PLCloudResource, "duplicateCloudResource:forAsset:withFilePath:inManagedObjectContext:", v39, v8, v42, v55);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_copyResourceFileFrom:to:", v39, v43);
          objc_msgSend(v33, "addObject:", v43);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v36);
    }

    objc_msgSend(v7, "resources");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "mutableCopy");

    objc_msgSend(v45, "addObjectsFromArray:", v33);
    objc_msgSend(v7, "setResources:", v45);

    v10 = v49;
    v9 = v51;
    v14 = v47;
  }

LABEL_38:
  v20 = 1;
LABEL_39:

  v16 = v20 & 1;
LABEL_40:

  return v16;
}

+ (id)cloudResourceForResourceType:(unint64_t)a3 forAssetUuid:(id)a4 forCloudMaster:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a5, "resources", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((int)objc_msgSend(v13, "type") == a3)
        {
          objc_msgSend(v13, "assetUuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v7);

          if (v15)
          {
            v16 = v13;
            goto LABEL_12;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

+ (id)assetUUIDToCloudResourcesForCloudMaster:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = v3;
  objc_msgSend(v3, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = (_BYTE *)MEMORY[0x1E0D115D0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "assetUuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "objectForKey:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v4, "setObject:forKey:", v13, v12);
          }
          -[NSObject addObject:](v13, "addObject:", v11);
        }
        else
        {
          if (*v9)
            goto LABEL_14;
          __CPLAssetsdOSLogDomain();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v11;
            _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Found nil assetUUID for master resource %@", buf, 0xCu);
          }
        }

LABEL_14:
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)cloudResourcesForResourceType:(unint64_t)a3 forCloudMaster:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "resources", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((int)objc_msgSend(v12, "type") == a3)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)validatedExternalResourceFromCloudResource:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PLValidatedExternalCloudResource *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  BOOL v32;
  PLValidatedExternalCloudResource *v33;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudResource+Migration.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cloudResource"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudResource+Migration.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

LABEL_3:
  if (+[PLResourceInstaller isValidCPLResourceTypeForPersistence:](PLResourceInstaller, "isValidCPLResourceTypeForPersistence:", (int)objc_msgSend(v7, "type")))
  {
    v10 = -[PLValidatedExternalCloudResource initWithCloudResource:]([PLValidatedExternalCloudResource alloc], "initWithCloudResource:", v7);
    objc_msgSend(v7, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "filePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v10;
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v7, "filePath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileURLWithPath:isDirectory:", v14, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = 0;
    }
    v32 = v11 != 0;

    v31 = (int)objc_msgSend(v7, "type");
    v30 = objc_msgSend(v9, "kind");
    objc_msgSend(v7, "uniformTypeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v7, "width");
    v17 = objc_msgSend(v7, "height");
    objc_msgSend(v7, "fingerprint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v7, "fileSize");
    v20 = objc_msgSend(v7, "isAvailable");
    objc_msgSend(v9, "master");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "managedObjectContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = 1;
    BYTE1(v26) = v32;
    LOBYTE(v26) = v20;
    +[PLResourceInstaller validatedExternalResourceFromExternalResourceCloudAttributes:cplType:assetType:uti:resourceWidth:resourceHeight:resourceFingerprint:resourceStableHash:resourceSize:isAvailable:fromAdjustedSet:resourceURL:cloudMaster:isForMigration:context:](PLResourceInstaller, "validatedExternalResourceFromExternalResourceCloudAttributes:cplType:assetType:uti:resourceWidth:resourceHeight:resourceFingerprint:resourceStableHash:resourceSize:isAvailable:fromAdjustedSet:resourceURL:cloudMaster:isForMigration:context:", v33, v31, v30, v16, v29, v17, v18, 0, v19, v26, v28, v21, v27, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)validatedExternalResourcesUsingLegacyCloudResourcesFromAssetWithCloudMaster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "master");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudResource assetUUIDToCloudResourcesForCloudMaster:](PLCloudResource, "assetUUIDToCloudResourcesForCloudMaster:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(a1, "validatedExternalResourceFromCloudResource:asset:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14), v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v5, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "resources");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(a1, "validatedExternalResourceFromCloudResource:asset:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20), v4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v5, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v4, "hasUnrenderedAsyncAdjustments"))
  {
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65941);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForAsyncAdjustedRenderPreviewImageFile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v4, "width");
    v25 = objc_msgSend(v4, "height");
    LOWORD(v28) = objc_msgSend(v4, "kind");
    +[PLResourceInstaller generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:](PLResourceInstaller, "generateValidatedExternalImageResourceOfType:forFilePath:requireFileToBePresent:version:basedOnFullSizeWidth:andHeight:recipe:assetKind:error:", 0, v23, 1, 2, v24, v25, v22, v28, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      objc_msgSend(v5, "addObject:", v26);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;
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
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v40;
  void *v41;

  v41 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", (int)-[PLCloudResource type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[PLCloudResource fileSize](self, "fileSize");
  v5 = -[PLCloudResource height](self, "height");
  v6 = -[PLCloudResource width](self, "width");
  -[PLCloudResource fingerprint](self, "fingerprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource assetUuid](self, "assetUuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("NO");
  if (-[PLCloudResource isAvailable](self, "isAvailable"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[PLCloudResource isLocallyAvailable](self, "isLocallyAvailable"))
    v9 = CFSTR("YES");
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@\n\t%@, size: %llu, height: %lld, width: %lld, fingerprint: %@, assetUUID: %@, isAvailable: %@, isLocallyAvailable: %@ cloudLocalState: %d"), v3, v4, v40, v5, v6, v7, v8, v10, v9, (int)-[PLCloudResource cloudLocalState](self, "cloudLocalState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource filePath](self, "filePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if (v14 != -[PLCloudResource isLocallyAvailable](self, "isLocallyAvailable"))
  {
    v15 = CFSTR("NO");
    if (v14)
      v15 = CFSTR("YES");
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(", isReallyLocallyAvailable %@"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }
  -[PLCloudResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(", UTI: \"%@\"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLCloudResource assetUuid](self, "assetUuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource managedObjectContext](self, "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "isVideo"))
  {
    v22 = (void *)MEMORY[0x1E0C99E98];
    -[PLCloudResource filePath](self, "filePath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fileURLWithPath:isDirectory:", v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "plVideoCodecName");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
      {
        objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(", Codec: \"%@\"), v27);
        v29 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v29;
      }

    }
  }
  -[PLCloudResource lastOnDemandDownloadDate](self, "lastOnDemandDownloadDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[PLCloudResource lastOnDemandDownloadDate](self, "lastOnDemandDownloadDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(", OnDemand DL date: %@"), v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v32;
  }
  -[PLCloudResource prunedAt](self, "prunedAt");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[PLCloudResource prunedAt](self, "prunedAt");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(", Prune date: %@"), v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v35;
  }
  -[PLCloudResource lastPrefetchDate](self, "lastPrefetchDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[PLCloudResource lastPrefetchDate](self, "lastPrefetchDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(", Prefetch date: %@ (%d)"), v37, (int)-[PLCloudResource prefetchCount](self, "prefetchCount"));
    v38 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v38;
  }

  return v18;
}

- (void)applyPropertiesFromCloudResource:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "resourceType");
  objc_msgSend(v4, "identity");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setFileSize:](self, "setFileSize:", objc_msgSend(v13, "fileSize"));
  objc_msgSend(v13, "imageDimensions");
  v7 = v6;
  -[PLCloudResource setWidth:](self, "setWidth:", (uint64_t)v8);
  -[PLCloudResource setHeight:](self, "setHeight:", (uint64_t)v7);
  -[PLCloudResource setType:](self, "setType:", v5);
  -[PLCloudResource setIsAvailable:](self, "setIsAvailable:", objc_msgSend(v13, "isAvailable"));
  objc_msgSend(v13, "fileUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setUniformTypeIdentifier:](self, "setUniformTypeIdentifier:", v9);

  objc_msgSend(v13, "fingerPrint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setFingerprint:](self, "setFingerprint:", v10);

  objc_msgSend(v4, "itemScopedIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setItemIdentifier:](self, "setItemIdentifier:", v12);

}

- (void)_duplicatePropertiesFromCloudResource:(id)a3 withFilePath:(id)a4 forAssetUuid:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  -[PLCloudResource setAssetUuid:](self, "setAssetUuid:", a5);
  -[PLCloudResource setFilePath:](self, "setFilePath:", v8);
  -[PLCloudResource setFileSize:](self, "setFileSize:", objc_msgSend(v22, "fileSize"));
  objc_msgSend(v22, "fingerprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setFingerprint:](self, "setFingerprint:", v9);

  -[PLCloudResource setHeight:](self, "setHeight:", objc_msgSend(v22, "height"));
  -[PLCloudResource setIsAvailable:](self, "setIsAvailable:", objc_msgSend(v22, "isAvailable"));
  -[PLCloudResource setType:](self, "setType:", objc_msgSend(v22, "type"));
  objc_msgSend(v22, "uniformTypeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setUniformTypeIdentifier:](self, "setUniformTypeIdentifier:", v10);

  -[PLCloudResource setWidth:](self, "setWidth:", objc_msgSend(v22, "width"));
  objc_msgSend(v22, "prunedAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setPrunedAt:](self, "setPrunedAt:", v11);

  objc_msgSend(v22, "lastOnDemandDownloadDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setLastOnDemandDownloadDate:](self, "setLastOnDemandDownloadDate:", v12);

  objc_msgSend(v22, "itemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setItemIdentifier:](self, "setItemIdentifier:", v13);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v22;
    objc_msgSend(v14, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudResource setAsset:](self, "setAsset:", v15);

    objc_msgSend(v14, "cloudMaster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudResource setCloudMaster:](self, "setCloudMaster:", v16);

    objc_msgSend(v14, "dateCreated");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    -[PLCloudResource setDateCreated:](self, "setDateCreated:", v17);
LABEL_10:

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v22;
    if (objc_msgSend(v17, "isCPLAssetResource"))
    {
      objc_msgSend(v17, "asset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudResource setAsset:](self, "setAsset:", v18);
    }
    else
    {
      if (!objc_msgSend(v17, "isCPLMasterResource"))
      {
LABEL_9:
        objc_msgSend(v17, "cloudMasterDateCreated");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudResource setDateCreated:](self, "setDateCreated:", v20);

        goto LABEL_10;
      }
      objc_msgSend(v17, "asset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "master");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudResource setCloudMaster:](self, "setCloudMaster:", v19);

    }
    goto LABEL_9;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setIsLocallyAvailable:](self, "setIsLocallyAvailable:", objc_msgSend(v21, "fileExistsAtPath:", v8));

}

- (CPLScopedIdentifier)scopedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLCloudResource cloudMaster](self, "cloudMaster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3 || (v5 = v4) != 0)
  {
    objc_msgSend(v5, "scopedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (CPLScopedIdentifier *)v6;
}

- (id)cplResourceIncludeFile:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  PLCloudResource *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  -[PLCloudResource filePath](self, "filePath");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (v8)
      {
        objc_msgSend(v8, "URLByDeletingLastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v12 = objc_msgSend(v11, "createDirectoryIfNeededAtPath:error:", v10, &v22);
        v13 = v22;

        if ((v12 & 1) == 0 && !*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v24 = self;
            v25 = 2112;
            v26 = v13;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Unable to create directory for cloudResource %@: %@.", buf, 0x16u);
          }

        }
      }
    }
  }
  -[PLCloudResource fingerprint](self, "fingerprint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D11448]), "initWithFileURL:", v7);
    -[NSObject setFileSize:](v16, "setFileSize:", -[PLCloudResource fileSize](self, "fileSize"));
    -[NSObject setImageDimensions:](v16, "setImageDimensions:", (double)-[PLCloudResource width](self, "width"), (double)-[PLCloudResource height](self, "height"));
    -[NSObject setAvailable:](v16, "setAvailable:", -[PLCloudResource isAvailable](self, "isAvailable"));
    -[PLCloudResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setFileUTI:](v16, "setFileUTI:", v17);

    -[PLCloudResource fingerprint](self, "fingerprint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setFingerPrint:](v16, "setFingerPrint:", v18);

    -[PLCloudResource scopedIdentifier](self, "scopedIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11440]), "initWithResourceIdentity:itemScopedIdentifier:resourceType:", v16, v19, (int)-[PLCloudResource type](self, "type"));

  }
  else
  {
    if (*MEMORY[0x1E0D115D0])
    {
      v20 = 0;
      goto LABEL_17;
    }
    __CPLAssetsdOSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = self;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Resource %@ has no finger print", buf, 0xCu);
    }
    v20 = 0;
  }

LABEL_17:
  return v20;
}

- (void)setIsLocallyAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[PLCloudResource willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("isLocallyAvailable"));
  -[PLCloudResource primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("isLocallyAvailable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[PLCloudResource didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("isLocallyAvailable"));
  if (v6 != v3)
  {
    -[PLCloudResource willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isLocallyAvailable"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudResource setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("isLocallyAvailable"));

    -[PLCloudResource didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isLocallyAvailable"));
  }
}

- (void)setLastPrefetchDate:(id)a3
{
  id v4;

  v4 = a3;
  -[PLCloudResource willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lastPrefetchDate"));
  -[PLCloudResource setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("lastPrefetchDate"));

  -[PLCloudResource didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lastPrefetchDate"));
}

- (void)setPrefetchCount:(signed __int16)a3
{
  uint64_t v3;
  void *v5;

  v3 = a3;
  -[PLCloudResource willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("prefetchCount"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResource setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("prefetchCount"));

  -[PLCloudResource didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("prefetchCount"));
}

- (void)setPrunedAt:(id)a3
{
  id v4;

  v4 = a3;
  -[PLCloudResource willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("prunedAt"));
  -[PLCloudResource setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("prunedAt"));

  -[PLCloudResource didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("prunedAt"));
}

- (void)prepareForDeletion
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLCloudResource;
  -[PLManagedObject prepareForDeletion](&v2, sel_prepareForDeletion);
}

+ (id)insertIntoPhotoLibrary:(id)a3 forAsset:(id)a4 withCPLResource:(id)a5 adjusted:(BOOL)a6 withCreationDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudResource.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

    if (v15)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudResource.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cplResource"));

    goto LABEL_3;
  }
  if (!v15)
    goto LABEL_11;
LABEL_3:
  objc_msgSend(v13, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v18, (uint64_t)v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "applyPropertiesFromCloudResource:", v15);
  objc_msgSend(v14, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAssetUuid:", v20);

  objc_msgSend(v19, "setDateCreated:", v16);
  if (v14 && v19)
  {
    if (a6)
    {
      objc_msgSend(v14, "pathForCPLResourceType:adjusted:", objc_msgSend(v15, "resourceType"), 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (int)objc_msgSend(v19, "type");
      objc_msgSend(v19, "uniformTypeIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localResourcePathForMasterResourceWithCPLType:andUTI:", v22, v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v19, "setFilePath:", v21);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v21, 0);

    objc_msgSend(v19, "setIsLocallyAvailable:", v25);
  }

  return v19;
}

+ (id)duplicateCloudResource:(id)a3 forAsset:(id)a4 withFilePath:(id)a5 inManagedObjectContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudResource.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moc"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudResource.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a1, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v15, (uint64_t)v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_duplicatePropertiesFromCloudResource:withFilePath:forAssetUuid:", v11, v13, v17);

  objc_msgSend(v12, "master");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "creationDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDateCreated:", v19);

  return v16;
}

+ (id)nonLocalResourcesInManagedObjectContext:(id)a3 forAssetUUIDs:(id)a4 cplResourceTypes:(id)a5
{
  void *v8;
  id v9;
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
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C97B48];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a1, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assetUuid in %@"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex(isLocallyAvailable) == NO"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex(type) in %@"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3528];
  v22[0] = v14;
  v22[1] = v15;
  v22[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v19);

  objc_msgSend(v11, "executeFetchRequest:error:", v13, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (void)resetPrefetchStateForResourcesWithResourceType:(int64_t)a3 itemIdentifiers:(id)a4 inLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__PLCloudResource_resetPrefetchStateForResourcesWithResourceType_itemIdentifiers_inLibrary___block_invoke;
  v12[3] = &unk_1E36753D0;
  v15 = a1;
  v16 = a3;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(v10, "performTransactionAndWait:", v12);

}

+ (unint64_t)bytesForAllResourcesInLibrary:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  SEL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PLCloudResource_bytesForAllResourcesInLibrary___block_invoke;
  v9[3] = &unk_1E3675558;
  v12 = a1;
  v6 = v5;
  v10 = v6;
  v11 = &v14;
  v13 = a2;
  objc_msgSend(v6, "performTransactionAndWait:", v9);
  v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

+ (BOOL)countOfMediumOriginalLocalCloudResourcesInManagedObjectContext:(id)a3 localCount:(unint64_t *)a4 unavailableCount:(unint64_t *)a5 error:(id *)a6
{
  return +[PLCloudResource _countOfLocalCloudResourcesOfType:inManagedObjectContext:forMediumSized:localCount:unavailableCount:error:](PLCloudResource, "_countOfLocalCloudResourcesOfType:inManagedObjectContext:forMediumSized:localCount:unavailableCount:error:", 1, a3, 1, a4, a5, a6);
}

+ (BOOL)countOfLocalCloudResourcesOfType:(unint64_t)a3 inManagedObjectContext:(id)a4 localCount:(unint64_t *)a5 unavailableCount:(unint64_t *)a6 error:(id *)a7
{
  return +[PLCloudResource _countOfLocalCloudResourcesOfType:inManagedObjectContext:forMediumSized:localCount:unavailableCount:error:](PLCloudResource, "_countOfLocalCloudResourcesOfType:inManagedObjectContext:forMediumSized:localCount:unavailableCount:error:", a3, a4, 0, a5, a6, a7);
}

+ (BOOL)_countOfLocalCloudResourcesOfType:(unint64_t)a3 inManagedObjectContext:(id)a4 forMediumSized:(BOOL)a5 localCount:(unint64_t *)a6 unavailableCount:(unint64_t *)a7 error:(id *)a8
{
  void *v11;
  float v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
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
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unint64_t *v43;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  _BYTE v60[128];
  _QWORD v61[2];
  void *v62;
  _QWORD v63[2];
  _QWORD v64[6];

  v64[4] = *MEMORY[0x1E0C80C00];
  v53 = a4;
  +[PLCloudResource entityName](PLCloudResource, "entityName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D11440], "derivativeGenerationThreshold");
  v13 = (unint64_t)(float)(v12
                                * (float)(unint64_t)objc_msgSend(MEMORY[0x1E0D11440], "maxPixelSizeForResourceType:", 4));
  v14 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v15;
  v64[1] = CFSTR("public.heic");
  v64[2] = CFSTR("public.heif");
  v64[3] = CFSTR("public.avci");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithFormat:", CFSTR("width * height <= %d AND uniformTypeIdentifier IN %@"), v13, v16);
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isAvailable == YES AND type = %d"), a3);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v51 = (void *)v17;
  if (a5)
  {
    v20 = (void *)MEMORY[0x1E0CB3528];
    v63[0] = v18;
    v63[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v22);

  }
  else
  {
    objc_msgSend(v11, "setPredicate:", v18);
  }
  v23 = v11;
  objc_msgSend(v11, "setResultType:", 2);
  v24 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v24, "setName:", CFSTR("count"));
  v25 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "expressionForFunction:arguments:", CFSTR("count:"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setExpression:", v28);
  objc_msgSend(v24, "setExpressionResultType:", 200);
  v61[0] = CFSTR("isLocallyAvailable");
  v61[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPropertiesToFetch:", v29);

  objc_msgSend(v23, "setPropertiesToGroupBy:", &unk_1E3763920);
  v59 = 0;
  v30 = v53;
  objc_msgSend(v53, "executeFetchRequest:error:", v23, &v59);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v59;
  v33 = v32;
  if (v31)
  {
    if (a6)
      *a6 = 0;
    v45 = v32;
    v47 = v28;
    v48 = v24;
    v50 = v23;
    if (a7)
      *a7 = 0;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v46 = v31;
    v34 = v31;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v56 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("count"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "unsignedIntegerValue");

          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("isLocallyAvailable"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v40) = objc_msgSend(v42, "BOOLValue");

          v43 = a7;
          if ((_DWORD)v40)
            v43 = a6;
          if (v43)
            *v43 = v41;
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v36);
    }

    v30 = v53;
    v23 = v50;
    v28 = v47;
    v24 = v48;
    v33 = v45;
    v31 = v46;
  }
  else if (a8)
  {
    *a8 = objc_retainAutorelease(v32);
  }

  return v31 != 0;
}

+ (id)entityName
{
  return CFSTR("CloudResource");
}

void __49__PLCloudResource_bytesForAllResourcesInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 48), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v5, "setName:", CFSTR("totalResourceSize"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("@sum.fileSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpression:", v6);

  objc_msgSend(v5, "setExpressionResultType:", 300);
  v30[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v7);

  objc_msgSend(v4, "setResultType:", 2);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v4, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;
  if (v9)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v9;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v12)
    {
      v13 = v12;
      v18 = v10;
      v19 = v8;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("totalResourceSize"), v18, v19, (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v16, "longLongValue");

        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      }
      while (v13);
      v10 = v18;
      v8 = v19;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v17;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "%@ failed to calculate totalResourceSize %@", buf, 0x16u);

    }
    goto LABEL_13;
  }
LABEL_14:

}

void __92__PLCloudResource_resetPrefetchStateForResourcesWithResourceType_itemIdentifiers_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 48), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("itemIdentifier IN %@ AND type = %d"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v7;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v19 = v8;
      v20 = v6;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v14, "setPrefetchCount:", 0);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setLastPrefetchDate:", v16);

          objc_autoreleasePoolPop(v15);
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
      v6 = v20;
      v8 = v19;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      v28 = v17;
      v29 = 2048;
      v30 = v18;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error fetching Cloud Resources for %@/%ld: %@", buf, 0x20u);
    }
    goto LABEL_13;
  }
LABEL_14:

}

@end
