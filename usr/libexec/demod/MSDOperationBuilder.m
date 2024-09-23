@implementation MSDOperationBuilder

- (MSDOperationBuilder)initWithSignedManifest:(id)a3 forBackgroundDownload:(BOOL)a4 verifyHashBeforeStaging:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MSDOperationBuilder *v9;
  MSDOperationBuilder *v10;
  id v11;
  NSObject *v12;
  void *v13;
  MSDOperationBuilder *v14;
  uint8_t v16[16];
  objc_super v17;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MSDOperationBuilder;
  v9 = -[MSDOperationBuilder init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    -[MSDOperationBuilder setSignedManifest:](v9, "setSignedManifest:", v8);
    -[MSDOperationBuilder setForBackgroundDownload:](v10, "setForBackgroundDownload:", v6);
    -[MSDOperationBuilder setVerifyHashBeforeStaging:](v10, "setVerifyHashBeforeStaging:", v5);
    -[MSDOperationBuilder setDisableBackgroundInstall:](v10, "setDisableBackgroundInstall:", +[MSDHubFeatureFlags disableBackgroundInstall](MSDHubFeatureFlags, "disableBackgroundInstall"));
    if (-[MSDOperationBuilder disableBackgroundInstall](v10, "disableBackgroundInstall"))
    {
      v11 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Background install is disabled by feature flag!", v16, 2u);
      }

    }
    +[MSDOperationContext setDownloadOnly:](MSDOperationContext, "setDownloadOnly:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentFilesContext processedContainers](MSDContentFilesContext, "processedContainers"));
    objc_msgSend(v13, "removeAllObjects");

    v14 = v10;
  }

  return v10;
}

- (id)buildBackupOperationsWithPath:(id)a3 andIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MSDManifest *v12;
  void *v13;
  void *v14;
  MSDManifest *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned __int8 v26;
  __CFString **v27;
  void *v28;
  void *v30;
  unsigned int v31;
  id v32;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "getVersion")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSignedManifest getComponentFromPath:forManifestVersion:](MSDSignedManifest, "getComponentFromPath:forManifestVersion:", v6, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "demoUserHomePath"));

  v12 = [MSDManifest alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mergedBackupManifest:", a4, 1));
  v15 = -[MSDManifest initWithDictionary:andUserHomePath:](v12, "initWithDictionary:andUserHomePath:", v14, v11);

  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[MSDContentFilesContext defaultContextForBackupItem:](MSDContentFilesContext, "defaultContextForBackupItem:", v9));
    -[NSObject setMasterManifest:](v16, "setMasterManifest:", v15);
    -[NSObject setVerifyFileHash:](v16, "setVerifyFileHash:", -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "originServerForBackupManifest:", a4, 1));
    -[NSObject setOriginServer:](v16, "setOriginServer:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getDataComponentRealSizeFromSection:forIdentifier:", CFSTR("BackupData"), v9));
    -[NSObject setDiskSpacedRequired:](v16, "setDiskSpacedRequired:", v20);

    -[NSObject setContentBeingInstalled:](v16, "setContentBeingInstalled:", a4, 1);
    -[NSObject setAppIdentifier:](v16, "setAppIdentifier:", v9);
    if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
      v21 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.snapshot");
    else
      v21 = CFSTR("/");
    -[NSObject setRootFileSystemPath:](v16, "setRootFileSystemPath:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("MSDContentFilesPrepareOperation"), CFSTR("MSDContentFilesDownloadOperation"), CFSTR("MSDContentFilesInstallOperation"), 0));
    if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")
      && -[MSDOperationBuilder disableBackgroundInstall](self, "disableBackgroundInstall"))
    {
      objc_msgSend(v22, "removeLastObject");
    }
    if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
      goto LABEL_13;
    objc_msgSend(v22, "addObject:", CFSTR("MSDContentFilesInstallOperation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
    v24 = objc_msgSend(v23, "isItemBaseBackup:", v6);

    if ((v24 & 1) != 0
      || (v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest")),
          v26 = objc_msgSend(v25, "isItemProvisioningProfileBackup:", v6),
          v25,
          (v26 & 1) != 0))
    {
      v27 = &off_10013F068;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
      v31 = objc_msgSend(v30, "isItemConfigurationProfileBackup:", v6);

      if (!v31)
        goto LABEL_13;
      v27 = &off_10013F060;
    }
    objc_msgSend(v22, "addObject:", *v27);
LABEL_13:
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:](self, "sequentialOperationsForIdentifiers:andContext:", v22, v16));

    goto LABEL_14;
  }
  v32 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_1000BA9C4();
  v28 = 0;
LABEL_14:

  return v28;
}

- (id)buildSystemAppOperationsWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  MSDOperationContext *v10;
  void *v11;
  MSDOperationContext *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v42;
  void *v43;
  id v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  _BYTE v52[128];
  const __CFString *v53;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getSystemAppDataList"));

  if (v7 && (v9 = objc_opt_class(NSDictionary, v8), (objc_opt_isKindOfClass(v7, v9) & 1) != 0))
  {
    v44 = v4;
    if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
    {
      v10 = 0;
    }
    else
    {
      v10 = objc_alloc_init(MSDOperationContext);
      -[MSDOperationContext setIdentifier:](v10, "setIdentifier:", v4);
      v53 = CFSTR("MSDSystemAppsDataPrepareOperation");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
      v12 = (MSDOperationContext *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:](self, "sequentialGroupForIdentifiers:andContext:", v11, v10));

      if (!v12)
        goto LABEL_30;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext operations](v12, "operations"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
      objc_msgSend(v5, "addObjectsFromArray:", v14);

      v10 = v12;
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v43 = v7;
    obj = v7;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v47;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v47 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v18);
          v20 = sub_1000604F0();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v51 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Processing system app: %{public}@", buf, 0xCu);
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getSystemAppDependecies:", v19));

          if (v23
            && (v25 = objc_opt_class(NSDictionary, v24), (objc_opt_isKindOfClass(v23, v25) & 1) != 0))
          {
            v26 = objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder buildAppDataOperationsWithIdentifier:andDependencies:](self, "buildAppDataOperationsWithIdentifier:andDependencies:", v19, v23));
            if (!v26)
            {
              v32 = sub_1000604F0();
              v33 = objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                sub_1000BAA24(v33, v34, v35, v36, v37, v38, v39, v40);

              v12 = 0;
              goto LABEL_29;
            }
            v27 = v26;
            if (v10)
              -[NSObject addDependency:](v26, "addDependency:", v10);
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject operations](v27, "operations", v43));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allObjects"));
            objc_msgSend(v5, "addObjectsFromArray:", v29);

          }
          else
          {
            v30 = sub_1000604F0();
            v27 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v51 = v19;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Missing app data dependencies for system app:  %{public}@", buf, 0xCu);
            }
          }

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        v16 = v31;
        if (v31)
          continue;
        break;
      }
    }

    v12 = (MSDOperationContext *)v5;
LABEL_29:
    v7 = v43;
    v4 = v44;
  }
  else
  {
    v42 = sub_1000604F0();
    v10 = (MSDOperationContext *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v10->super, OS_LOG_TYPE_DEFAULT, "Missing SystemApps data section.", buf, 2u);
    }
    v12 = 0;
  }
LABEL_30:

  return v12;
}

- (id)buildAppOperationsWithIdentifier:(id)a3 shouldDeferApp:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  MSDInstallableFileContext *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString **v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  void *v47;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  const char *v56;
  id v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  uint8_t buf[4];
  id v75;

  v4 = a4;
  v6 = a3;
  v72 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getAppManifest:", v6));

  v10 = objc_opt_class(NSDictionary, v9);
  v70 = v8;
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {
    v52 = sub_1000604F0();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v75 = v8;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Unexpected app info format: %{public}@", buf, 0xCu);
    }

    v73 = 0;
    v23 = 0;
    v40 = 0;
    v47 = 0;
    v18 = 0;
    v71 = 0;
    goto LABEL_46;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getAppDependecies:", v6));

  v71 = v12;
  if (v12)
  {
    v14 = objc_opt_class(NSDictionary, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
    {
      v58 = sub_1000604F0();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v75 = v12;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Unexpected app dependencies format: %{public}@", buf, 0xCu);
      }

      v73 = 0;
      v23 = 0;
      v40 = 0;
      v47 = 0;
      v18 = 0;
LABEL_46:
      v69 = 0;
      goto LABEL_47;
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("ProvisioningProfiles")));
  v69 = v15;
  if (v15 && (v16 = v15, objc_msgSend(v15, "count")))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder buildProvisioningProfileOperations:](self, "buildProvisioningProfileOperations:", v16));
    v18 = v17;
    if (!v17)
    {
      v73 = 0;
      v23 = 0;
      goto LABEL_41;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "operations"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allObjects"));
    objc_msgSend(v72, "addObjectsFromArray:", v20);

  }
  else
  {
    v18 = 0;
  }
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Identifier")));
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Hash")));
  v23 = (void *)v22;
  v73 = (void *)v21;
  if (!v21 || !v22)
  {
    v54 = sub_1000604F0();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v75 = v8;
      v56 = "Missing app identifier or hash data from app info: %{public}@";
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);
    }
LABEL_40:

LABEL_41:
    v40 = 0;
    v47 = 0;
LABEL_47:
    v38 = 0;
    v27 = 0;
    v46 = 0;
    v41 = v72;
    goto LABEL_27;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v25 = objc_msgSend(v24, "getAppType:", v6);

  if ((unint64_t)v25 >= 3)
  {
    v57 = sub_1000604F0();
    v55 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v75 = v25;
      v56 = "Received unknown value for app type: %lu";
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  v26 = v18;
  v27 = objc_alloc_init(MSDInstallableFileContext);
  -[MSDOperationContext setIdentifier:](v27, "setIdentifier:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "originServerForApp:", v6));
  -[MSDInstallableFileContext setOriginServer:](v27, "setOriginServer:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "hexStringRepresentation"));
  -[MSDInstallableFileContext setFileHash:](v27, "setFileHash:", v30);

  -[MSDInstallableFileContext setFileType:](v27, "setFileType:", 0);
  -[MSDInstallableFileContext setUniqueIdentifier:](v27, "setUniqueIdentifier:", v73);
  -[MSDInstallableFileContext setCurrentUniqueIdentifier:](v27, "setCurrentUniqueIdentifier:", 0);
  -[MSDInstallableFileContext setUseDiffPatch:](v27, "setUseDiffPatch:", 0);
  -[MSDInstallableFileContext setAlreadyInstalled:](v27, "setAlreadyInstalled:", 0);
  -[MSDInstallableFileContext setPricingAppUpdateDeferred:](v27, "setPricingAppUpdateDeferred:", v4);
  -[MSDInstallableFileContext setVerifyFileHash:](v27, "setVerifyFileHash:", -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  -[MSDInstallableFileContext setDeleteInstallableFileAfterInstall:](v27, "setDeleteInstallableFileAfterInstall:", objc_msgSend(v31, "isOfflineMode") ^ 1);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "getAppRealSize:", v6));
  v34 = objc_msgSend(v33, "unsignedLongLongValue");

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "getAppFileSize:", v6));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)objc_msgSend(v36, "unsignedLongLongValue")+ (_QWORD)v34+ ((unint64_t)(((((unint64_t)(5 * (_QWORD)v34) >> 1) & 0x3FFFFFFFFFFFFFFFLL)* (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64) >> 2)));
  -[MSDOperationContext setDiskSpacedRequired:](v27, "setDiskSpacedRequired:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("MSDApplicationFilePrepareOperation"), CFSTR("MSDApplicationFileDownloadOperation"), 0));
  if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
  {
    v39 = &off_10013F050;
    if (v25 != (id)2)
      v39 = &off_10013F058;
    objc_msgSend(v38, "addObject:", *v39);
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:](self, "sequentialGroupForIdentifiers:andContext:", v38, v27));
  v41 = v72;
  v18 = v26;
  if (v40)
  {
    if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload") && v26)
      objc_msgSend(v40, "addDependency:", v26);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "operations"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "allObjects"));
    objc_msgSend(v72, "addObjectsFromArray:", v43);

    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.retailtech.arkenstone")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ist.windward")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ist.DemoDiscoveryApp")))
    {
      v44 = sub_1000604F0();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v75 = v6;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Skipping updating app data for %{public}@ as requested.", buf, 0xCu);
      }

      v46 = v72;
      v47 = 0;
    }
    else
    {
      v49 = objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder buildAppDataOperationsWithIdentifier:andDependencies:](self, "buildAppDataOperationsWithIdentifier:andDependencies:", v6, v71));
      if (v49)
      {
        v47 = (void *)v49;
        if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
          objc_msgSend(v47, "addDependency:", v40);
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "operations"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "allObjects"));
        objc_msgSend(v72, "addObjectsFromArray:", v51);

        v41 = v72;
        v46 = v72;
      }
      else
      {
        v60 = sub_1000604F0();
        v61 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          sub_1000BAA24(v61, v62, v63, v64, v65, v66, v67, v68);

        v47 = 0;
        v46 = 0;
      }
    }
    v18 = v26;
  }
  else
  {
    v47 = 0;
    v46 = 0;
  }
LABEL_27:

  return v46;
}

- (id)buildStandalonePkgOperationsWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  MSDInstallableFileContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v22;
  const char *v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getManifestInfoFromSection:forIdentifier:", CFSTR("Packages"), v4));

  if (!v6)
  {
    v22 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v4;
      v23 = "Missing Info section for stand-alone package:  %{public}@";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
    }
LABEL_12:
    v20 = 0;
    goto LABEL_6;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Hash")));
  if (!v7)
  {
    v24 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v4;
      v23 = "Missing Hash value in the Info section for stand-alone package:  %{public}@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v8 = (void *)v7;
  v9 = objc_alloc_init(MSDInstallableFileContext);
  -[MSDOperationContext setIdentifier:](v9, "setIdentifier:", v4);
  -[MSDInstallableFileContext setFileType:](v9, "setFileType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hexStringRepresentation"));
  -[MSDInstallableFileContext setFileHash:](v9, "setFileHash:", v10);

  -[MSDInstallableFileContext setVerifyFileHash:](v9, "setVerifyFileHash:", -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getOriginServerFromSection:forIdentifier:", CFSTR("Packages"), v4));
  -[MSDInstallableFileContext setOriginServer:](v9, "setOriginServer:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getStandAlonePackageRealSize:", v4));
  v15 = objc_msgSend(v14, "unsignedLongLongValue");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getStandAlonePackageFileSize:", v4));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)objc_msgSend(v17, "unsignedLongLongValue")+ (_QWORD)v15+ ((unint64_t)(((((unint64_t)(5 * (_QWORD)v15) >> 1) & 0x3FFFFFFFFFFFFFFFLL)* (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64) >> 2)));
  -[MSDOperationContext setDiskSpacedRequired:](v9, "setDiskSpacedRequired:", v18);

  v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("MSDBasePrepareOperation"), CFSTR("MSDInstallableFileDownloadOperation"), 0));
  if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
    -[NSObject addObject:](v19, "addObject:", CFSTR("MSDPackageInstallOperation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:](self, "sequentialOperationsForIdentifiers:andContext:", v19, v9));

LABEL_6:
  return v20;
}

- (id)buildConfigurationProfileOperationsWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MSDInstallableFileContext *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  NSObject *v36;

  v4 = a3;
  if (!v4)
  {
    v23 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000BAA54(v6, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_22;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getManifestDataFromSection:forIdentifier:", CFSTR("ConfigurationProfiles"), v4));

  if (!v6)
  {
    v31 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000BAABC();
    goto LABEL_22;
  }
  if (-[NSObject count](v6, "count") != (id)1)
  {
    v32 = sub_1000604F0();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1000BAC04();
    goto LABEL_18;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getManifestInfoFromSection:forIdentifier:", CFSTR("ConfigurationProfiles"), v4));

  if (!v8)
  {
    v34 = sub_1000604F0();
    v33 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1000BAB2C();
LABEL_18:

LABEL_22:
    v21 = 0;
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](v6, "allKeys"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v6, "objectForKey:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("MSDManifestFileHash")));

  if (!v12)
  {
    v35 = sub_1000604F0();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_1000BAB9C();

    goto LABEL_22;
  }
  v13 = objc_alloc_init(MSDInstallableFileContext);
  -[MSDOperationContext setIdentifier:](v13, "setIdentifier:", v4);
  -[MSDInstallableFileContext setFileType:](v13, "setFileType:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hexStringRepresentation"));
  -[MSDInstallableFileContext setFileHash:](v13, "setFileHash:", v14);

  -[MSDInstallableFileContext setVerifyFileHash:](v13, "setVerifyFileHash:", -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getOriginServerFromSection:forIdentifier:", CFSTR("ConfigurationProfiles"), v4));
  -[MSDInstallableFileContext setOriginServer:](v13, "setOriginServer:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getDataComponentRealSizeFromSection:forIdentifier:", CFSTR("ConfigurationProfiles"), v4));
  -[MSDOperationContext setDiskSpacedRequired:](v13, "setDiskSpacedRequired:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ProfileIdentifier")));
  -[MSDInstallableFileContext setProfileIdentifier:](v13, "setProfileIdentifier:", v19);

  v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("MSDBasePrepareOperation"), CFSTR("MSDInstallableFileDownloadOperation"), 0));
  if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
    -[NSObject addObject:](v20, "addObject:", CFSTR("MSDConfigurationProfileInstallOperation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:](self, "sequentialOperationsForIdentifiers:andContext:", v20, v13));

  v6 = v20;
LABEL_9:

  return v21;
}

- (id)buildAppRemovalOperationsWithIdentifier:(id)a3
{
  id v4;
  id v5;
  MSDInstallableFileContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_alloc_init(MSDInstallableFileContext);
  -[MSDInstallableFileContext setFileType:](v6, "setFileType:", 0);
  -[MSDOperationContext setIdentifier:](v6, "setIdentifier:", v4);

  -[MSDInstallableFileContext setVerifyFileHash:](v6, "setVerifyFileHash:", -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
  v22 = CFSTR("MSDIPAUninstallOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:](self, "sequentialGroupForIdentifiers:andContext:", v7, v6));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "operations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    objc_msgSend(v5, "addObjectsFromArray:", v10);

    v11 = v5;
  }
  else
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000BAC64(v14, v15, v16, v17, v18, v19, v20, v21);

    v11 = 0;
  }

  return v11;
}

- (id)buildSettingsOperationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSettingsDataFromSection:forIdentifier:", CFSTR("BackupData"), v4));

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = "-[MSDOperationBuilder buildSettingsOperationWithIdentifier:]";
      v15 = 2114;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v9 = objc_claimAutoreleasedReturnValue(+[MSDSettingsContext defaultContextForIdentifier:](MSDSettingsContext, "defaultContextForIdentifier:", v4));
    -[NSObject setDataDict:](v9, "setDataDict:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v10, "addObject:", CFSTR("MSDSettingsInstallOperation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:](self, "sequentialOperationsForIdentifiers:andContext:", v10, v9));

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BAC94();
    v11 = 0;
  }

  return v11;
}

- (id)sequentialOperationsForIdentifiers:(id)a3 andContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_claimAutoreleasedReturnValue(+[MSDOperationRepository createOperationFromIdentifier:withContext:](MSDOperationRepository, "createOperationFromIdentifier:withContext:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12), v6, (_QWORD)v18));
        if (!v13)
        {

          v16 = 0;
          goto LABEL_13;
        }
        v14 = (void *)v13;
        if (objc_msgSend(v7, "count"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
          objc_msgSend(v14, "addDependency:", v15);

        }
        objc_msgSend(v7, "addObject:", v14);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = v7;
LABEL_13:

  return v16;
}

- (id)sequentialGroupForIdentifiers:(id)a3 andContext:(id)a4
{
  void *v4;
  MSDOperationGroup *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:](self, "sequentialOperationsForIdentifiers:andContext:", a3, a4));
  v5 = -[MSDOperationGroup initWithOperations:]([MSDOperationGroup alloc], "initWithOperations:", v4);

  return v5;
}

- (id)buildAppDataOperationsWithIdentifier:(id)a3 andDependencies:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MSDOperationContext *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  const char *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  NSObject *v37;
  MSDManifest *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  MSDOperationGroup *v49;
  id v50;
  NSObject *v51;
  id v52;
  id v54;
  NSObject *v55;
  id v56;
  MSDOperationContext *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *obj;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  char *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  const __CFString *v81;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "demoUserHomePath"));

  v66 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_alloc_init(MSDOperationContext);
  v65 = v6;
  -[MSDOperationContext setIdentifier:](v9, "setIdentifier:", v6);
  if (objc_msgSend(v7, "count"))
  {
    v81 = CFSTR("MSDApplicationDataPrepareOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:](self, "sequentialGroupForIdentifiers:andContext:", v10, v9));

    if (v11)
    {
      objc_msgSend(v66, "addObject:", v11);
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      if (!v13)
        goto LABEL_49;
      v14 = v13;
      v60 = *(_QWORD *)v72;
      v63 = v11;
      v57 = v9;
      v58 = v7;
      v59 = v12;
      while (1)
      {
        v15 = 0;
        v56 = v14;
        do
        {
          if (*(_QWORD *)v72 != v60)
            objc_enumerationMutation(v12);
          v61 = v15;
          v16 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v15);
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v16));
          v18 = v16;
          if (!v17 || !-[NSObject count](v17, "count"))
          {
            v24 = sub_1000604F0();
            v20 = objc_claimAutoreleasedReturnValue(v24);
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              goto LABEL_44;
            *(_DWORD *)buf = 138543362;
            v76 = v18;
            v21 = v20;
            v22 = "No dependency listed under: %{public}@";
LABEL_15:
            v23 = 12;
LABEL_16:
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
            goto LABEL_44;
          }
          if (objc_msgSend(v18, "isEqualToString:", CFSTR("ProvisioningProfiles")))
          {
            v19 = sub_1000604F0();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              goto LABEL_44;
            *(_WORD *)buf = 0;
            v21 = v20;
            v22 = "Skip app provisioning profile dependency.";
            v23 = 2;
            goto LABEL_16;
          }
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AppData")) & 1) != 0
            || (objc_msgSend(v18, "isEqualToString:", CFSTR("ExtensionData")) & 1) != 0
            || (objc_msgSend(v18, "isEqualToString:", CFSTR("GroupData")) & 1) != 0
            || (objc_msgSend(v18, "isEqualToString:", CFSTR("UserData")) & 1) != 0
            || (objc_msgSend(v18, "isEqualToString:", CFSTR("SharedAppData")) & 1) != 0)
          {
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            v20 = v17;
            v25 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
            if (v25)
            {
              v26 = v25;
              obj = v20;
              v27 = *(_QWORD *)v68;
              while (2)
              {
                for (i = 0; i != v26; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v68 != v27)
                    objc_enumerationMutation(obj);
                  v29 = *(const char **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
                  v30 = sub_1000604F0();
                  v31 = objc_claimAutoreleasedReturnValue(v30);
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v76 = v29;
                    v77 = 2114;
                    v78 = v18;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Creating operation sequence for app data: <Name = %{public}@, Type = %{public}@>", buf, 0x16u);
                  }

                  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "getManifestDataFromSection:forIdentifier:", v18, v29));

                  if (!v33)
                  {
                    v52 = sub_1000604F0();
                    v37 = objc_claimAutoreleasedReturnValue(v52);
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v76 = "-[MSDOperationBuilder buildAppDataOperationsWithIdentifier:andDependencies:]";
                      v77 = 2114;
                      v78 = (char *)v29;
                      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s - Failed to retrieve master manifest data for %{public}@", buf, 0x16u);
                    }
                    goto LABEL_56;
                  }
                  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
                  v35 = objc_msgSend(v34, "isContainerizedComponent:", v18);

                  if (v35)
                    v36 = objc_claimAutoreleasedReturnValue(+[MSDContentFilesContext defaultContextForContainerizedAppDataItem:](MSDContentFilesContext, "defaultContextForContainerizedAppDataItem:", v29));
                  else
                    v36 = objc_claimAutoreleasedReturnValue(+[MSDContentFilesContext defaultContextForNonContainerizedAppDataItem:](MSDContentFilesContext, "defaultContextForNonContainerizedAppDataItem:", v29));
                  v37 = v36;
                  v38 = -[MSDManifest initWithDictionary:andUserHomePath:]([MSDManifest alloc], "initWithDictionary:andUserHomePath:", v33, v64);
                  -[NSObject setMasterManifest:](v37, "setMasterManifest:", v38);

                  -[NSObject setIdentifier:](v37, "setIdentifier:", v29);
                  -[NSObject setContainerType:](v37, "setContainerType:", v18);
                  -[NSObject setVerifyFileHash:](v37, "setVerifyFileHash:", -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "getOriginServerFromSection:forIdentifier:", v18, v29));
                  -[NSObject setOriginServer:](v37, "setOriginServer:", v40);

                  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "getDataComponentRealSizeFromSection:forIdentifier:", v18, v29));
                  -[NSObject setDiskSpacedRequired:](v37, "setDiskSpacedRequired:", v42);

                  -[NSObject setAppIdentifier:](v37, "setAppIdentifier:", v65);
                  if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
                    v43 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.snapshot");
                  else
                    v43 = CFSTR("/");
                  -[NSObject setRootFileSystemPath:](v37, "setRootFileSystemPath:", v43);
                  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("MSDContentFilesPrepareOperation"), CFSTR("MSDContentFilesDownloadOperation"), CFSTR("MSDContentFilesInstallOperation"), 0));
                  if (-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")
                    && -[MSDOperationBuilder disableBackgroundInstall](self, "disableBackgroundInstall"))
                  {
                    objc_msgSend(v44, "removeLastObject");
                  }
                  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:](self, "sequentialGroupForIdentifiers:andContext:", v44, v37));
                  v11 = v63;
                  if (!v45)
                  {

LABEL_56:
                    v49 = 0;
                    v9 = v57;
                    v7 = v58;
                    goto LABEL_57;
                  }
                  v46 = v45;
                  objc_msgSend(v45, "addDependency:", v63);
                  objc_msgSend(v66, "addObject:", v46);

                }
                v26 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
                if (v26)
                  continue;
                break;
              }
              v20 = obj;
              v17 = obj;
              v12 = v59;
              v14 = v56;
            }
            else
            {
              v17 = v20;
            }
          }
          else
          {
            v47 = sub_1000604F0();
            v20 = objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v76 = v18;
              v21 = v20;
              v22 = "Ignore unrecognized app dependency: %{public}@";
              goto LABEL_15;
            }
          }
LABEL_44:

          v15 = v61 + 1;
        }
        while ((id)(v61 + 1) != v14);
        v48 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
        v14 = v48;
        v9 = v57;
        v7 = v58;
        if (!v48)
        {
LABEL_49:

          v49 = -[MSDOperationGroup initWithOperationGroups:]([MSDOperationGroup alloc], "initWithOperationGroups:", v66);
          goto LABEL_57;
        }
      }
    }
    v54 = sub_1000604F0();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_1000BACF4();

    v49 = 0;
  }
  else
  {
    v50 = sub_1000604F0();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v76 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "No app dependencies for %{public}@; skip building AppData operations ...",
        buf,
        0xCu);
    }

    v49 = objc_alloc_init(MSDOperationGroup);
  }
LABEL_57:

  return v49;
}

- (id)buildProvisioningProfileOperations:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  MSDInstallableFileContext *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  MSDOperationGroup *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id obj;
  void *v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  _BYTE v42[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v4;
  v33 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v35;
    obj = v6;
    v31 = v5;
    while (2)
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getManifestDataFromSection:forIdentifier:", CFSTR("ProvisioningProfiles"), v8));

        if (!v10)
        {
          v25 = sub_1000604F0();
          v12 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v39 = v8;
            v40 = 2114;
            v41 = CFSTR("ProvisioningProfiles");
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ERROR - Missing data for profile:  %{public}@ under component:  %{public}@", buf, 0x16u);
          }
          goto LABEL_23;
        }
        if (objc_msgSend(v10, "count") != (id)1)
        {
          v26 = sub_1000604F0();
          v12 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            sub_1000BAC04();
          goto LABEL_23;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("MSDManifestFileHash")));

        if (!v14)
        {
          v27 = sub_1000604F0();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            sub_1000BAB9C();

          goto LABEL_23;
        }
        v15 = objc_alloc_init(MSDInstallableFileContext);
        -[MSDOperationContext setIdentifier:](v15, "setIdentifier:", v8);
        -[MSDInstallableFileContext setFileType:](v15, "setFileType:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hexStringRepresentation"));
        -[MSDInstallableFileContext setFileHash:](v15, "setFileHash:", v16);

        -[MSDInstallableFileContext setVerifyFileHash:](v15, "setVerifyFileHash:", -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getOriginServerFromSection:forIdentifier:", CFSTR("ProvisioningProfiles"), v8));
        -[MSDInstallableFileContext setOriginServer:](v15, "setOriginServer:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getDataComponentRealSizeFromSection:forIdentifier:", CFSTR("ProvisioningProfiles"), v8));
        -[MSDOperationContext setDiskSpacedRequired:](v15, "setDiskSpacedRequired:", v20);

        v21 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("MSDProvisioningProfilePrepareOperation"), CFSTR("MSDInstallableFileDownloadOperation"), 0));
        if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
          -[NSObject addObject:](v21, "addObject:", CFSTR("MSDProvisioningProfileInstallOperation"));
        v22 = objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:](self, "sequentialOperationsForIdentifiers:andContext:", v21, v15));
        v5 = v31;
        if (!v22)
        {

          v12 = v21;
LABEL_23:
          v6 = obj;

          v24 = 0;
          goto LABEL_24;
        }
        v23 = (void *)v22;
        objc_msgSend(v31, "addObjectsFromArray:", v22);

      }
      v6 = obj;
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v33)
        continue;
      break;
    }
  }

  v24 = -[MSDOperationGroup initWithOperations:]([MSDOperationGroup alloc], "initWithOperations:", v5);
LABEL_24:

  return v24;
}

- (MSDSignedManifest)signedManifest
{
  return self->_signedManifest;
}

- (void)setSignedManifest:(id)a3
{
  objc_storeStrong((id *)&self->_signedManifest, a3);
}

- (BOOL)forBackgroundDownload
{
  return self->_forBackgroundDownload;
}

- (void)setForBackgroundDownload:(BOOL)a3
{
  self->_forBackgroundDownload = a3;
}

- (BOOL)verifyHashBeforeStaging
{
  return self->_verifyHashBeforeStaging;
}

- (void)setVerifyHashBeforeStaging:(BOOL)a3
{
  self->_verifyHashBeforeStaging = a3;
}

- (BOOL)disableBackgroundInstall
{
  return self->_disableBackgroundInstall;
}

- (void)setDisableBackgroundInstall:(BOOL)a3
{
  self->_disableBackgroundInstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedManifest, 0);
}

@end
