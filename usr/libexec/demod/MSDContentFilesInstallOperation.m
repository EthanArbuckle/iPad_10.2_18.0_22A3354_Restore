@implementation MSDContentFilesInstallOperation

- (MSDContentFilesInstallOperation)initWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MSDContentFilesInstallOperation *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v7 = -[MSDContentFilesInstallOperation initWithContext:andContentCacheManager:andTargetDevice:](self, "initWithContext:andContentCacheManager:andTargetDevice:", v4, v5, v6);

  return v7;
}

- (MSDContentFilesInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4 andTargetDevice:(id)a5
{
  id v8;
  id v9;
  MSDContentFilesInstallOperation *v10;
  MSDContentFilesInstallOperation *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MSDContentFilesInstallOperation;
  v10 = -[MSDOperation initWithContext:](&v13, "initWithContext:", a3);
  v11 = v10;
  if (v10)
  {
    -[MSDContentFilesInstallOperation setContentCacheProtocol:](v10, "setContentCacheProtocol:", v8);
    -[MSDContentFilesInstallOperation setTargetDeviceDelegate:](v11, "setTargetDeviceDelegate:", v9);
  }

  return v11;
}

- (id)methodSelectors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_createWormholeInStagingToUserHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_constructStagingArea"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_patchBackupFolderIfNeeded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_moveFilesFromStagingToSecondaryStaging"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_addToProcessedContainersIfNeeded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, v4, v5, v6, 0));

  return v7;
}

- (BOOL)rollback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  id v13;
  NSObject *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagingRootPath"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondaryStagingRootPath"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
  v8 = objc_msgSend(v7, "removeWorkDirectory:", v4);

  if ((v8 & 1) == 0)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
  v10 = objc_msgSend(v9, "removeWorkDirectory:", v6);

  if ((v10 & 1) == 0)
  {
    v15 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
LABEL_8:
      sub_1000C06E4();
LABEL_9:

    v11 = 0;
    goto LABEL_4;
  }
  v11 = 1;
LABEL_4:

  return v11;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)_createWormholeInStagingToUserHome
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  unsigned __int8 v24;
  id v25;
  unsigned __int8 v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  unsigned __int8 v30;
  BOOL v31;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesInstallOperation targetDeviceDelegate](self, "targetDeviceDelegate"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "demoUserHomePath"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stagingRootPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v5));

  if (+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly"))
    v9 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata");
  else
    v9 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("/.MSDWorkContainer")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("/MSD_staging")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("/MSD_secondary_staging")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v17));

  v19 = sub_1000604F0();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v45 = v8;
    v46 = 2114;
    v47 = v14;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Creating wormhole in staging from %{public}@ to %{public}@...", buf, 0x16u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByDeletingLastPathComponent"));
  v43 = 0;
  v22 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v43);
  v23 = v43;

  if ((v22 & 1) == 0)
  {
    v33 = sub_1000604F0();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1000C08D0(v23, v34);
    goto LABEL_26;
  }
  v42 = v23;
  v24 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v42);
  v25 = v42;

  if ((v24 & 1) == 0)
  {
    v35 = sub_1000604F0();
    v34 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1000C084C((uint64_t)v14, v25);
    goto LABEL_25;
  }
  v41 = v25;
  v26 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v41);
  v23 = v41;

  if ((v26 & 1) == 0)
  {
    v36 = sub_1000604F0();
    v34 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1000C084C((uint64_t)v18, v23);
    goto LABEL_26;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destinationOfSymbolicLinkAtPath:error:", v8, 0));

  if (v27)
  {
    v40 = v23;
    v28 = objc_msgSend(v3, "removeItemAtPath:error:", v8, &v40);
    v25 = v40;

    if ((v28 & 1) != 0)
    {
      v23 = v25;
      goto LABEL_12;
    }
    v38 = sub_1000604F0();
    v34 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1000C07CC(v25, v34);
LABEL_25:
    v23 = v25;
LABEL_26:

    v31 = 0;
    goto LABEL_14;
  }
LABEL_12:
  v29 = v23;
  v39 = v23;
  v30 = objc_msgSend(v3, "createSymbolicLinkAtPath:withDestinationPath:error:", v8, v14, &v39);
  v23 = v39;

  if ((v30 & 1) == 0)
  {
    v37 = sub_1000604F0();
    v34 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1000C074C(v23, v34);
    goto LABEL_26;
  }
  v31 = 1;
LABEL_14:

  return v31;
}

- (BOOL)_constructStagingArea
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id *v35;
  unsigned __int8 v36;
  int v37;
  int v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  unsigned __int8 v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;
  BOOL v57;
  id v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  void *v85;
  void *v86;
  id obj;
  uint64_t v89;
  void *v90;
  void *v91;
  id v92;
  _QWORD v93[11];
  _QWORD block[9];
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t);
  id v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  char v137;
  _QWORD v138[3];
  char v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;
  _QWORD v146[5];
  id v147;
  uint8_t v148[128];
  uint8_t buf[4];
  uint64_t v150;
  __int16 v151;
  void *v152;
  _BYTE v153[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stagingRootPath"));

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesInstallOperation _retrieveContentRootPath](self, "_retrieveContentRootPath"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "stringByAppendingPathComponent:", v85));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "masterManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "masterManifest"));

  v146[0] = 0;
  v146[1] = v146;
  v146[2] = 0x3032000000;
  v146[3] = sub_100059C2C;
  v146[4] = sub_100059C3C;
  v147 = (id)objc_claimAutoreleasedReturnValue(-[MSDContentFilesInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
  v140 = 0;
  v141 = &v140;
  v142 = 0x3032000000;
  v143 = sub_100059C2C;
  v144 = sub_100059C3C;
  v145 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v138[0] = 0;
  v138[1] = v138;
  v138[2] = 0x2020000000;
  v139 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  LOBYTE(v4) = objc_msgSend(v8, "verifyFileHash");

  v139 = (char)v4;
  v134 = 0;
  v135 = &v134;
  v136 = 0x2020000000;
  v137 = 1;
  v128 = 0;
  v129 = &v128;
  v130 = 0x3032000000;
  v131 = sub_100059C2C;
  v132 = sub_100059C3C;
  v133 = 0;
  v92 = objc_alloc_init((Class)NSMutableSet);
  v122 = 0;
  v123 = &v122;
  v124 = 0x3032000000;
  v125 = sub_100059C2C;
  v126 = sub_100059C3C;
  v127 = objc_alloc_init((Class)NSMutableArray);
  v116 = 0;
  v117 = &v116;
  v118 = 0x3032000000;
  v119 = sub_100059C2C;
  v120 = sub_100059C3C;
  v121 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v110 = 0;
  v111 = &v110;
  v112 = 0x3032000000;
  v113 = sub_100059C2C;
  v114 = sub_100059C3C;
  v115 = objc_alloc_init((Class)NSMutableArray);
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = sub_100059C2C;
  v108 = sub_100059C3C;
  v109 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v153, 16);
  if (v9)
  {
    v89 = *(_QWORD *)v101;
    *(_QWORD *)&v10 = 138543362;
    v84 = v10;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v101 != v89)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * v11);
      v13 = objc_autoreleasePoolPush();
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "stringByAppendingPathComponent:", v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByDeletingLastPathComponent"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "metadataForFile:", v12));
      v17 = v16;
      if (!v16)
        break;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getFileType"));
      objc_msgSend(v92, "addObject:", v15);
      if (objc_msgSend(v18, "isEqualToString:", NSFileTypeDirectory))
      {
        objc_msgSend(v92, "addObject:", v14);
      }
      else
      {
        if (objc_msgSend(v18, "isEqualToString:", NSFileTypeSymbolicLink))
        {
          objc_msgSend((id)v111[5], "addObject:", v14);
          v20 = (void *)v105[5];
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getTargetFile"));
          objc_msgSend(v20, "setObject:forKey:", v21, v14);
          goto LABEL_17;
        }
        if (!objc_msgSend(v18, "isEqualToString:", NSFileTypeRegular))
        {
          v25 = sub_1000604F0();
          v21 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v150 = v12;
            v151 = 2114;
            v152 = v18;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Ignore path %{public}@ of unexpected file type %{public}@", buf, 0x16u);
          }
LABEL_17:
          v19 = 0;
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend((id)v123[5], "addObject:", v14);
        v22 = objc_msgSend(v17, "getFileSize");
        v23 = (void *)v117[5];
        if (v22)
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getHash"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject hexStringRepresentation](v21, "hexStringRepresentation"));
          objc_msgSend(v23, "setObject:forKey:", v24, v14);

          goto LABEL_17;
        }
        objc_msgSend((id)v117[5], "setObject:forKey:", CFSTR("ZERO_SIZE"), v14);
      }
      v19 = 0;
LABEL_19:

      objc_autoreleasePoolPop(v13);
      if (!v17)
      {

        if (v19 == 6)
          goto LABEL_54;
        goto LABEL_29;
      }
      if (v9 == (id)++v11)
      {
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v153, 16);
        v9 = v27;
        if (v27)
          goto LABEL_3;
        goto LABEL_27;
      }
    }
    v26 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v84;
      v150 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Cannot find metadata for path %{public}@", buf, 0xCu);
    }
    v18 = 0;
    v19 = 6;
    goto LABEL_18;
  }
LABEL_27:

LABEL_29:
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v28 = v92;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v96, v148, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v97;
    while (2)
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v97 != v30)
          objc_enumerationMutation(v28);
        v32 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)v31);
        v33 = objc_autoreleasePoolPush();
        if ((objc_msgSend((id)v141[5], "fileExistsAtPath:", v32) & 1) != 0
          || (v34 = (void *)v141[5],
              v35 = (id *)(v129 + 5),
              v95 = (id)v129[5],
              v36 = objc_msgSend(v34, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v32, 1, 0, &v95), objc_storeStrong(v35, v95), *((_BYTE *)v135 + 24) = v36, (v36 & 1) != 0))
        {
          v37 = 0;
          v38 = 1;
        }
        else
        {
          v39 = sub_1000604F0();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v129[5], "localizedDescription"));
            *(_DWORD *)buf = 138543618;
            v150 = v32;
            v151 = 2114;
            v152 = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Could not create directory at %{public}@ - %{public}@", buf, 0x16u);

          }
          v38 = 0;
          v37 = 6;
        }
        objc_autoreleasePoolPop(v33);
        if (!v38)
        {

          if (v37 == 6)
            goto LABEL_54;
          goto LABEL_46;
        }
        v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      v42 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v96, v148, 16);
      v29 = v42;
      if (v42)
        continue;
      break;
    }
  }

LABEL_46:
  v43 = objc_msgSend((id)v111[5], "count", v84);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059C44;
  block[3] = &unk_10013EBB8;
  block[4] = &v110;
  block[5] = &v104;
  block[6] = &v140;
  block[7] = &v128;
  block[8] = &v134;
  dispatch_apply((size_t)v43, 0, block);
  if (!*((_BYTE *)v135 + 24))
  {
    v59 = sub_1000604F0();
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      sub_1000C0950(v60, v61, v62, v63, v64, v65, v66, v67);
    goto LABEL_61;
  }
  v44 = objc_msgSend((id)v123[5], "count");
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_100059DB0;
  v93[3] = &unk_10013EBE0;
  v93[4] = &v122;
  v93[5] = &v116;
  v93[6] = &v140;
  v93[7] = &v128;
  v93[8] = v146;
  v93[9] = v138;
  v93[10] = &v134;
  dispatch_apply((size_t)v44, 0, v93);
  if (!*((_BYTE *)v135 + 24))
  {
    v68 = sub_1000604F0();
    v60 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      sub_1000C0980(v60, v69, v70, v71, v72, v73, v74, v75);
    goto LABEL_61;
  }
  if (!+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly"))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "containerType"));
    v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("BackupData"));

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
    if (v47)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v50 = objc_msgSend(v49, "contentBeingInstalled");
      v52 = objc_msgSend(v48, "restoreBackupAttributesUnder:range:manifestUID:deviceUID:", v91, v50, v51, &off_10014D988, &off_10014D988);
      *((_BYTE *)v135 + 24) = v52;
    }
    else
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "containerType"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "identifier"));
      v56 = objc_msgSend(v48, "restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:", v91, v53, v55, &off_10014D988, &off_10014D988);
      *((_BYTE *)v135 + 24) = v56;

    }
  }
  if (!*((_BYTE *)v135 + 24))
  {
    v76 = sub_1000604F0();
    v60 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      sub_1000C09B0(v60, v77, v78, v79, v80, v81, v82, v83);
LABEL_61:

  }
LABEL_54:
  v57 = *((_BYTE *)v135 + 24) != 0;
  _Block_object_dispose(&v104, 8);

  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v116, 8);

  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v128, 8);

  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(v138, 8);
  _Block_object_dispose(&v140, 8);

  _Block_object_dispose(v146, 8);
  return v57;
}

- (BOOL)_patchBackupFolderIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerType"));

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("BackupData"))
    && objc_msgSend(v4, "hasSuffix:", CFSTR("baseBackup")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesInstallOperation targetDeviceDelegate](self, "targetDeviceDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stagingRootPath"));
    objc_msgSend(v7, "patchBackupFolderInStaging:", v9);

  }
  return 1;
}

- (BOOL)_moveFilesFromStagingToSecondaryStaging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagingRootPath"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondaryStagingRootPath"));

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v4;
    v14 = 2114;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Moving files from %{public}@ to %{public}@.", (uint8_t *)&v12, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesInstallOperation targetDeviceDelegate](self, "targetDeviceDelegate"));
  v10 = objc_msgSend(v9, "moveFilesToFinalDst:finalPath:", v4, v6);

  return v10;
}

- (BOOL)_addToProcessedContainersIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentFilesContext processedContainers](MSDContentFilesContext, "processedContainers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueName"));

  if ((objc_msgSend(v3, "containsObject:", v5) & 1) == 0)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding to processed containers: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v3, "addObject:", v5);
  }

  return 1;
}

- (id)_retrieveContentRootPath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentRootPath"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pseudoContentRootPath"));

  }
  return v4;
}

- (MSDContentCacheManagerProtocol)contentCacheProtocol
{
  return self->_contentCacheProtocol;
}

- (void)setContentCacheProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_contentCacheProtocol, a3);
}

- (MSDTargetDeviceProtocol)targetDeviceDelegate
{
  return self->_targetDeviceDelegate;
}

- (void)setTargetDeviceDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_targetDeviceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceDelegate, 0);
  objc_storeStrong((id *)&self->_contentCacheProtocol, 0);
}

@end
