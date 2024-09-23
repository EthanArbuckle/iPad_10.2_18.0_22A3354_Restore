@implementation MSDContentFilesPrepareOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly")
    && +[MSDHubFeatureFlags disableBackgroundInstall](MSDHubFeatureFlags, "disableBackgroundInstall"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_deteremineContentFilesInstallNecessity"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_generateDeviceManifest"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_compareManifests"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, v4, 0));
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_deteremineContentFilesInstallNecessity"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_prepareStagingArea"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_generateDeviceManifest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_compareManifests"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_processAlreadyHaveList"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, v4, v6, v7, 0));

  }
  return v5;
}

- (BOOL)_deteremineContentFilesInstallNecessity
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  int v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  if ((objc_msgSend(v3, "containerized") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentRootPath"));

    if (!v5 && !+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly"))
    {
      v6 = sub_1000604F0();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        v17 = 138543362;
        v18 = v9;
        v10 = "No content root path found for containerized component: %{public}@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, 0xCu);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentFilesContext processedContainers](MSDContentFilesContext, "processedContainers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueName"));
  v14 = objc_msgSend(v11, "containsObject:", v13);

  if (v14)
  {
    v15 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueName"));
      v17 = 138543362;
      v18 = v9;
      v10 = "Shared container is already installed: %{public}@";
      goto LABEL_10;
    }
LABEL_11:

    -[MSDOperation setSkipped:](self, "setSkipped:", 1);
  }
  return 1;
}

- (BOOL)_prepareStagingArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;

  v17.receiver = self;
  v17.super_class = (Class)MSDContentFilesPrepareOperation;
  if (-[MSDBasePrepareOperation _prepareStagingArea](&v17, "_prepareStagingArea"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stashedStagingRootPath"));

    if (!+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly")
      && objc_msgSend(v4, "fileExistsAtPath:", v6))
    {
      v7 = sub_1000604F0();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found container already stashed at: %{public}@", buf, 0xCu);
      }

      v9 = -[MSDContentFilesPrepareOperation _restoreStashedStagingToSecondaryStaging](self, "_restoreStashedStagingToSecondaryStaging");
      if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
      {
        if ((v9 & 1) == 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
          v11 = objc_msgSend(v10, "bailOnStashedStagingRestoreFailure");

          if (v11)
          {
            v12 = sub_1000604F0();
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Treat stashed staging restore failure as fatal error!", buf, 2u);
            }

            v14 = 0;
            goto LABEL_16;
          }
          goto LABEL_15;
        }
LABEL_14:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
        v14 = 1;
        objc_msgSend(v15, "setRestored:", 1);

        -[MSDOperation setSkipped:](self, "setSkipped:", 1);
LABEL_16:

        return v14;
      }
      if (v9)
        goto LABEL_14;
    }
LABEL_15:
    v14 = 1;
    goto LABEL_16;
  }
  return 0;
}

- (BOOL)_generateDeviceManifest
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
  unsigned __int8 v12;
  id v13;
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
  BOOL v29;
  MSDManifest *v30;
  void *v31;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentRootPath"));

  if (!v7)
  {
    if (+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly"))
    {
      v30 = objc_alloc_init(MSDManifest);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      objc_msgSend(v31, "setDeviceManifest:", v30);

      v29 = 1;
      goto LABEL_8;
    }
    v44 = sub_1000604F0();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_1000BBCD4(v45, v46, v47, v48, v49, v50, v51, v52);

LABEL_18:
    v29 = 0;
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("plist")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/DeviceManifests"), "stringByAppendingPathComponent:", v10));
  v57 = 0;
  v12 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/DeviceManifests"), 1, 0, &v57);
  v13 = v57;
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    v33 = sub_1000604F0();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1000BBD34(v14, v34);

    goto LABEL_18;
  }
  v53 = v13;
  v54 = v10;
  v56 = v3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rootFileSystemPath"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentRootPath"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v23 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "containerType"));
  v55 = v5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "demoUserHomePath"));
  v26 = v23;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:", v21, v24, v19, v25, v11));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    objc_msgSend(v28, "setDeviceManifest:", v27);

    v29 = 1;
  }
  else
  {
    v35 = sub_1000604F0();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_1000BBD04(v36, v37, v38, v39, v40, v41, v42, v43);

    v29 = 0;
  }
  v5 = v55;
  v3 = v56;
  v4 = v26;
LABEL_8:

  return v29;
}

- (BOOL)_compareManifests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MSDContentFilesPrepareOperation *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id obj;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "masterManifest"));

  v31 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceManifest"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dict"));
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v37)
  {
    v7 = *(_QWORD *)v39;
    v33 = *(_QWORD *)v39;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v8);
        v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dict"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v9));

        if (!v12)
        {
          objc_msgSend(v36, "addObject:", v9);
          goto LABEL_19;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadataForFile:", v9));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadataForFile:", v9));
        v15 = objc_msgSend(v13, "compareWith:", v14);
        if ((_DWORD)v15 != 5)
        {
          v18 = v15;
          v19 = v6;
          v20 = v4;
          v21 = sub_1000604F0();
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata compareResultToNSString:](MSDFileMetadata, "compareResultToNSString:", v18));
            *(_DWORD *)buf = 138543618;
            v43 = v9;
            v44 = 2114;
            v45 = v32;
            _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "File meta data mismatch: %{public}@ (%{public}@)", buf, 0x16u);

          }
          if (v18 < 4)
          {
            objc_msgSend(v36, "addObject:", v9);
            v23 = sub_1000604F0();
            v17 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v9;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "File found with incorrect metadata; Add to creation list: %{public}@",
                buf,
                0xCu);
            }
            v4 = v20;
            v6 = v19;
            v7 = v33;
            goto LABEL_17;
          }
          v4 = v20;
          v6 = v19;
          v7 = v33;
          if ((_DWORD)v18 != 4)
            goto LABEL_18;
        }
        objc_msgSend(v34, "addObject:", v9);
        v16 = sub_1000604F0();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v43 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Add to already have list: %{public}@", buf, 0xCu);
        }
LABEL_17:

LABEL_18:
LABEL_19:

        objc_autoreleasePoolPop(v10);
        v8 = (char *)v8 + 1;
      }
      while (v37 != v8);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      v37 = v24;
    }
    while (v24);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v31, "context"));
  objc_msgSend(v25, "setAlreadyHaveList:", v34);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v31, "context"));
  objc_msgSend(v27, "setCloneFailedList:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v31, "context"));
  objc_msgSend(v28, "setCreationList:", v36);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v31, "context"));
  objc_msgSend(v29, "setDeviceManifest:", 0);

  return 1;
}

- (BOOL)_processAlreadyHaveList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  unsigned __int8 v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  id v42;
  id v43;
  NSObject *v44;
  void *v45;
  __int128 v47;
  MSDContentFilesPrepareOperation *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  id obj;
  uint64_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  uint64_t v61;
  _BYTE v62[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v50 = +[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentRootPath"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootFileSystemPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v9 = v8;
  if (v5)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentRootPath"));
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pseudoContentRootPath"));
  v11 = (void *)v10;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v10));

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "alreadyHaveList"));

  obj = v13;
  v55 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v55)
  {
    v15 = 0;
    v54 = *(_QWORD *)v57;
    *(_QWORD *)&v14 = 138543362;
    v47 = v14;
    v48 = self;
    v49 = v3;
LABEL_6:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v54)
        objc_enumerationMutation(obj);
      v17 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v16);
      v18 = objc_autoreleasePoolPush();
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "masterManifest"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metadataForFile:", v17));

      if (!v21)
      {
        v43 = sub_1000604F0();
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          sub_1000BBDB4();

        objc_autoreleasePoolPop(v18);
        goto LABEL_32;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getFileType"));
      v23 = objc_msgSend(v22, "isEqualToString:", NSFileTypeRegular);

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getHash"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "hexStringRepresentation"));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "findFileInCache:", v25));
        if (v26)
        {
          v27 = 0;
          v28 = 0;
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stringByAppendingPathComponent:", v17));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileCachePathFromSourcePath:forBackgroundDownload:", v27, v50));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingPathComponent:", v25));

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getAccessControlList"));
          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getAccessControlList"));
            v32 = objc_msgSend(v31, "length") != 0;

          }
          else
          {
            v32 = 0;
          }

          if (!objc_msgSend(v52, "isReadableFileAtPath:", v27) || v32)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance", v47));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getHash"));
            v41 = objc_msgSend(v39, "cloneFile:to:expectingHash:", v27, v28, v40);

            if ((v41 & 1) == 0)
            {
LABEL_22:
              v35 = sub_1000604F0();
              v36 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v47;
                v61 = v17;
                _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to clone file %{public}@; Adding it to creation list.",
                  buf,
                  0xCu);
              }

              self = v48;
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v48, "context"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "cloneFailedList"));
              objc_msgSend(v38, "addObject:", v17);

              v15 = 0;
              v3 = v49;
              goto LABEL_14;
            }
          }
          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getHash"));
            v34 = objc_msgSend(v52, "cloneFile:to:expectingHash:correctOwnership:", v27, v28, v33, 0);

            if ((v34 & 1) == 0)
              goto LABEL_22;
          }
          v15 = 1;
          self = v48;
          v3 = v49;
        }
      }
      else
      {
        v27 = 0;
        v28 = 0;
        v25 = 0;
      }
LABEL_14:

      objc_autoreleasePoolPop(v18);
      if (v55 == (id)++v16)
      {
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        v55 = v42;
        if (v42)
          goto LABEL_6;
        break;
      }
    }
  }
  v15 = 1;
LABEL_32:

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  objc_msgSend(v45, "setAlreadyHaveList:", 0);

  return v15 & 1;
}

- (BOOL)_restoreStashedStagingToSecondaryStaging
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
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  unsigned __int8 v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  unsigned __int8 v40;
  BOOL v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned __int8 v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  _QWORD v71[2];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  NSObject *v75;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stashedStagingRootPath"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"), "stringByAppendingPathComponent:", CFSTR("/.MSDWorkContainer")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/MSD_stashed_staging")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pseudoContentRootPath"));

  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "secondaryStagingRootPath"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentRootPath"));
  v65 = objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v15, "stringByAppendingPathComponent:", v17));

  v18 = sub_1000604F0();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v73 = v6;
    v74 = 2114;
    v75 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Restoring files from: %{public}@ to: %{public}@", buf, 0x16u);
  }

  v66 = v15;
  v67 = v13;
  if (v13 && objc_msgSend(v4, "fileExistsAtPath:", v68))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contentRootPath"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v21));

    v23 = sub_1000604F0();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v73 = v68;
      v74 = 2114;
      v75 = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Renaming pseudo content content root path from: %{public}@ to: %{public}@", buf, 0x16u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByDeletingLastPathComponent](v22, "stringByDeletingLastPathComponent"));
    v70 = 0;
    v26 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v70);
    v27 = v70;

    if ((v26 & 1) != 0)
    {
      v69 = v27;
      v28 = v4;
      v29 = objc_msgSend(v4, "moveItemAtPath:toPath:error:", v68, v22, &v69);
      v30 = v69;

      if ((v29 & 1) != 0)
      {

        v4 = v28;
        v15 = v66;
        v13 = v67;
        goto LABEL_10;
      }
      v62 = sub_1000604F0();
      v61 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        sub_1000BBEAC(v30, v61);
      v27 = v30;
      v4 = v28;
    }
    else
    {
      v60 = sub_1000604F0();
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        sub_1000BBF2C();
    }
    v15 = v66;

    v13 = v67;
LABEL_27:
    v38 = (void *)v65;
LABEL_28:

    v41 = 0;
    goto LABEL_14;
  }
LABEL_10:
  if ((objc_msgSend(v3, "moveStagingToFinal:finalPath:", v6, v15) & 1) == 0)
  {
    v52 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000BBE7C(v22, v53, v54, v55, v56, v57, v58, v59);
    goto LABEL_27;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "containerType"));
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("BackupData"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v36 = v35;
  if (!v33)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "containerType"));
    v63 = v11;
    v64 = v6;
    v45 = v7;
    v46 = v3;
    v47 = v4;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "identifier"));
    v38 = (void *)v65;
    v50 = objc_msgSend(v34, "restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:", v65, v44, v49, &off_10014D868, &off_10014D868);

    v4 = v47;
    v3 = v46;
    v7 = v45;
    v11 = v63;
    v6 = v64;

    if ((v50 & 1) != 0)
      goto LABEL_13;
    goto LABEL_16;
  }
  v37 = objc_msgSend(v35, "contentBeingInstalled");
  v38 = (void *)v65;
  v40 = objc_msgSend(v34, "restoreBackupAttributesUnder:range:manifestUID:deviceUID:", v65, v37, v39, &off_10014D868, &off_10014D868);

  if ((v40 & 1) == 0)
  {
LABEL_16:
    v51 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000BBE18();
    v15 = v66;
    v13 = v67;
    goto LABEL_28;
  }
LABEL_13:
  v41 = 1;
  v15 = v66;
  v13 = v67;
LABEL_14:
  v71[0] = v6;
  v71[1] = v11;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));
  objc_msgSend(v3, "removeWorkDirectories:", v42);

  return v41;
}

@end
