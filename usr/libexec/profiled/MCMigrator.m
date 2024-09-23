@implementation MCMigrator

- (MCMigrator)init
{
  MCMigrator *v2;
  NSFileManager *v3;
  NSFileManager *fileManager;
  MCNotifier *v5;
  MCNotifier *notifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCMigrator;
  v2 = -[MCMigrator init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSFileManager);
    fileManager = v2->_fileManager;
    v2->_fileManager = v3;

    v5 = objc_opt_new(MCNotifier);
    notifier = v2->_notifier;
    v2->_notifier = v5;

    v2->_systemProfileStorageWasMigratedFromLegacyStorage = 0;
  }
  return v2;
}

- (id)systemMetadataDictionary
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = MCSystemMetadataFilePath(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v4, 1, 0, 0));

  if (!v5 || (v6 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));

    v5 = (void *)v7;
  }
  return v5;
}

- (void)setSystemMetadataDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  v5 = MCSystemMetadataFilePath(v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "MCWriteToBinaryFile:", v6);

}

- (id)userMetadataDictionary
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = MCUserMetadataFilePath(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v4, 1, 0, 0));

  if (!v5 || (v6 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));

    v5 = (void *)v7;
  }
  return v5;
}

- (void)setUserMetadataDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  v5 = MCUserMetadataFilePath(v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "MCWriteToBinaryFile:", v6);

}

- (id)_lastSystemMigratedBuildVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator systemMetadataDictionary](self, "systemMetadataDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", kMCMetaLastMigratedBuildKey));

  return v3;
}

- (id)_lastUserMigratedBuildVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator userMetadataDictionary](self, "userMetadataDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", kMCMetaLastMigratedBuildKey));

  return v3;
}

- (void)_migratePasscodeDidRestore:(BOOL)a3 passcodeWasSet:(BOOL)a4 historyRequired:(BOOL)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v9 = _MCLogObjects[12];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrating passcode...", buf, 2u);
  }
  if (v7 && v6)
  {
    if (MKBGetDeviceLockState(0) == 3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
      v11 = MCBackupContainsPasscodeFilePath();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      objc_msgSend(v10, "writeToFile:atomically:", v12, 1);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
      v13 = MCBackupContainsPasscodeFilePath();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v10, "removeItemAtPath:error:", v12, 0);
    }

  }
  if (!a5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
    objc_msgSend(v14, "clearPasscodeHistory");

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
  objc_msgSend(v15, "migratePasscodeMetadata");

  v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Completed migrating passcode.", v17, 2u);
  }
}

- (BOOL)_isMultiUserMode
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = MCCloudConfigurationDetailsFilePath(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCCIsMultiUserKey));
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)_removeiPCUCertificates
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];

  v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing iPCU associations...", buf, 2u);
  }
  v4 = MCiPCUKeychainMapPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v5));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17));
        +[MCKeychain removeItemWithPersistentID:useSystemKeychain:](MCKeychain, "removeItemWithPersistentID:useSystemKeychain:", v12, 1);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v14 = MCiPCUKeychainMapPath();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "removeItemAtPath:error:", v15, 0);

  v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished removing iPCU associations.", buf, 2u);
  }

}

- (void)_removeOSXServerPayloadAccount
{
  void *v2;
  uint64_t v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  void *j;
  void *v16;
  uint64_t v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id obj;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allInstalledProfileIdentifiers"));
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v31)
  {
    v3 = *(_QWORD *)v39;
    v26 = *(_QWORD *)v39;
    v27 = v2;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v6 = objc_autoreleasePoolPush();
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "installedProfileWithIdentifier:", v5));
        v8 = v7;
        if (v7)
        {
          v29 = v5;
          v32 = v6;
          v9 = objc_msgSend(v7, "createHandler");
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v33 = v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloads"));
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
          if (!v11)
            goto LABEL_23;
          v12 = v11;
          v30 = i;
          v13 = 0;
          v14 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v35 != v14)
                objc_enumerationMutation(v10);
              v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
              v17 = objc_opt_class(MCOSXServerAccountPayload);
              if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID"));
                objc_msgSend(v9, "convertPayloadWithUUIDToUnknownPayload:", v18);

                v19 = _MCLogObjects[12];
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  v20 = v19;
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID"));
                  *(_DWORD *)buf = 138543362;
                  v43 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Removed macOS Server Accounts payload with UUID: %{public}@", buf, 0xCu);

                }
                v13 = 1;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
          }
          while (v12);

          v3 = v26;
          v2 = v27;
          i = v30;
          if ((v13 & 1) != 0)
          {
            if ((objc_msgSend(v33, "isInstalledForUser") & 1) != 0)
              v22 = MCUserProfileStorageDirectory();
            else
              v22 = MCSystemProfileStorageDirectory();
            v10 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "MCHashedFilenameWithExtension:", CFSTR("stub"), v26, v27));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v23));

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "profile"));
            objc_msgSend(v25, "writeStubToPath:", v24);

            i = v30;
LABEL_23:

          }
          v6 = v32;
          v8 = v33;
        }

        objc_autoreleasePoolPop(v6);
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v31);
  }

}

- (void)_removeHardwareBoundPayloads
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char **v13;
  id v14;
  uint64_t v15;
  void *i;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _UNKNOWN **v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *k;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  int v74;
  void *context;
  void *v76;
  id obj;
  void *v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  void *v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "allInstalledProfileIdentifiers"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v108;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v108 != v5)
        objc_enumerationMutation(v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "installedProfileWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * v6)));
      v8 = objc_msgSend(v7, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = objc_msgSend(v9, "count");

      if (v10)
        break;

      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloads"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
  v13 = &selRef_workerQueueDidRecomputeNagMessageWithResult_;
  v76 = v7;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v104;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v104 != v15)
          objc_enumerationMutation(v11);
        if (+[MCMigrator payloadHasHardwareBoundKey:](MCMigrator, "payloadHasHardwareBoundKey:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)i)))
        {
          v17 = _MCLogObjects[12];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: Unenrolling from MDM because identity was hardware-bound", buf, 2u);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
          objc_msgSend(v18, "removeProfileWithIdentifier:installationType:source:", v19, objc_msgSend(v7, "installType"), CFSTR("Hardware-bound Profile Removal"));

          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "allInstalledProfileIdentifiers"));
          v74 = 1;
          v2 = (id)v20;
          goto LABEL_22;
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
      if (v14)
        continue;
      break;
    }
  }
  v74 = 0;
LABEL_22:

  context = objc_autoreleasePoolPush();
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v2;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
  if (v80)
  {
    v79 = *(_QWORD *)v100;
    v21 = kAppSSOKerberosExtensionID;
    v22 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    v83 = kAppSSOKerberosExtensionID;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v100 != v79)
          objc_enumerationMutation(obj);
        v82 = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "installedProfileWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v23)));
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "payloads"));
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v96;
          v81 = v24;
          v84 = *(_QWORD *)v96;
          v85 = v25;
          while (2)
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(_QWORD *)v96 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v13 + 466, "payloadHasHardwareBoundKey:", v30))
              {
                v24 = v81;
                objc_msgSend(v78, "addObject:", v81);
                goto LABEL_54;
              }
              v31 = objc_opt_class(v22[138]);
              if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
              {
                v32 = v30;
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "esso_extensionIdentifier"));
                v34 = objc_msgSend(v33, "isEqualToString:", v21);

                if (v34)
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "esso_extensionData"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("certificateUUID")));

                  if (v36)
                  {
                    v93 = 0u;
                    v94 = 0u;
                    v91 = 0u;
                    v92 = 0u;
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "allInstalledProfileIdentifiers"));
                    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
                    if (v38)
                    {
                      v39 = v38;
                      v40 = *(_QWORD *)v92;
LABEL_38:
                      v41 = 0;
                      while (1)
                      {
                        if (*(_QWORD *)v92 != v40)
                          objc_enumerationMutation(v37);
                        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "installedProfileWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v41)));
                        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "payloadWithUUID:", v36));
                        if (v43)
                          break;

                        if (v39 == (id)++v41)
                        {
                          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
                          v13 = &selRef_workerQueueDidRecomputeNagMessageWithResult_;
                          if (v39)
                            goto LABEL_38;
                          goto LABEL_47;
                        }
                      }
                      v44 = (void *)v43;
                      v13 = &selRef_workerQueueDidRecomputeNagMessageWithResult_;
                      if (!+[MCMigrator payloadHasHardwareBoundKey:](MCMigrator, "payloadHasHardwareBoundKey:", v43))
                      {

                        goto LABEL_47;
                      }
                      v24 = v81;
                      objc_msgSend(v78, "addObject:", v81);

                      v21 = v83;
                      v22 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
                      v25 = v85;
                      goto LABEL_54;
                    }
LABEL_47:

                    v21 = v83;
                    v28 = v84;
                    v22 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
                    v25 = v85;
                  }

                }
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
            v24 = v81;
            if (v27)
              continue;
            break;
          }
        }
LABEL_54:

        v23 = v82 + 1;
      }
      while ((id)(v82 + 1) != v80);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
      v80 = v45;
    }
    while (v45);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v46 = v78;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v87, v113, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v88;
    do
    {
      for (k = 0; k != v48; k = (char *)k + 1)
      {
        if (*(_QWORD *)v88 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)k);
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "identifier"));
        v53 = _MCLogObjects[12];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v112 = v52;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: Removing profile with PayloadIdentifier %@ because it referenced a hardware-bound key", buf, 0xCu);
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
        objc_msgSend(v54, "removeProfileWithIdentifier:installationType:source:", v52, objc_msgSend(v51, "installType"), CFSTR("Hardware-bound Profile Removal"));

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v87, v113, 16);
    }
    while (v48);
  }

  objc_autoreleasePoolPop(context);
  if (v74)
  {
    v56 = MCCloudConfigurationDetailsFilePath(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v57));

    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", kCCConfigurationSourceKey));
      v60 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0 && objc_msgSend(v59, "intValue") == 1)
      {
        v61 = _MCLogObjects[12];
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: Removing cloud configuration for DEP device that was unenrolled due to hardware-bound key", buf, 2u);
        }
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v63 = MCCloudConfigurationDetailsFilePath(v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        objc_msgSend(v62, "removeItemAtPath:error:", v64, 0);

        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v66 = MCLegacyCloudConfigurationDetailsFilePath();
        v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
        objc_msgSend(v65, "removeItemAtPath:error:", v67, 0);

        MCSendCloudConfigurationDetailsChangedNotification();
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v69 = MCPostSetupAutoInstallProfilePath();
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        objc_msgSend(v68, "removeItemAtPath:error:", v70, 0);

        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v72 = MCLegacyPostSetupAutoInstallProfilePath();
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        objc_msgSend(v71, "removeItemAtPath:error:", v73, 0);

      }
    }

  }
}

+ (BOOL)payloadHasHardwareBoundKey:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = objc_opt_class(MCCertificatePayload);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "isHardwareBound");
  else
    v5 = 0;

  return v5;
}

+ (id)stringWithContext:(int)a3
{
  if (a3 > 3)
    return CFSTR("Unknown!");
  else
    return *(&off_1000E3978 + a3);
}

- (void)migratePostDataMigratorWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  __int16 v28;
  _BOOL4 v29;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-MigratePostDataMigrator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCMigrator stringWithContext:](MCMigrator, "stringWithContext:", v5));
  v9 = _MCLogObjects[12];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138543618;
    v27 = v8;
    v28 = 1024;
    v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Beginning post-DataMigrator migration. Context: %{public}@, passcode was set in backup: %d", (uint8_t *)&v26, 0x12u);
  }
  -[MCMigrator _tellAMFIIfWeAreSupervised](self, "_tellAMFIIfWeAreSupervised");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForFeature:", MCFeaturePasscodeHistoryCount));
  v12 = objc_msgSend(v11, "unsignedIntValue") != 0;

  -[MCMigrator _migratePasscodeDidRestore:passcodeWasSet:historyRequired:](self, "_migratePasscodeDidRestore:passcodeWasSet:historyRequired:", (v5 & 0xFFFFFFFE) == 2, v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v13, "notifyClientsToRecomputeCompliance");
  if ((_DWORD)v5 == 3)
    -[MCMigrator _removeiPCUCertificates](self, "_removeiPCUCertificates");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  objc_msgSend(v14, "recomputeAppRulesForNetworkExtension");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "effectiveUserSettings"));
  objc_msgSend(v15, "recomputeAppOptionsEffectiveUserSettings:outEffectiveChangeDetected:", v16, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "effectiveUserSettings"));
  objc_msgSend(v17, "recomputeWebContentFilterEffectiveUserSettings:outEffectiveChangeDetected:outMechanismChangedDetected:", v18, 0, 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  v20 = objc_msgSend(v19, "recomputeAccountVPNAssociations");

  v21 = (const __CFString *)kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey;
  v22 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  v23 = (void *)CFPreferencesCopyAppValue(kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey, kMCNotBackedUpPreferencesDomain);
  v24 = (void *)CFPreferencesCopyAppValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, v22);
  if (objc_msgSend(v24, "BOOLValue") && !v23)
  {
    CFPreferencesSetAppValue(v21, kCFBooleanTrue, v22);
    CFPreferencesAppSynchronize(v22);
  }
  if ((_DWORD)v5 == 2)
  {
    objc_msgSend(v13, "clearAllPasscodeComplianceCaches");
    MCSendClientTruthChangedNotification(objc_msgSend(v13, "recomputeNagMetadata"));
  }
  v25 = _MCLogObjects[12];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Post-DataMigrator migration complete.", (uint8_t *)&v26, 2u);
  }

}

- (void)_tellAMFIIfWeAreSupervised
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  uint8_t v8[16];

  v2 = MCCloudConfigurationDetailsFilePath(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCCIsSupervisedKey));
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      v7 = _MCLogObjects[12];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Informing AMFI that this device is supervised.", v8, 2u);
      }
      +[MCCloudConfigurationWriter setAMFISupervisionFromCloudConfiguration:](MCCloudConfigurationWriter, "setAMFISupervisionFromCloudConfiguration:", v4);
    }
  }

}

- (void)_removeMDMProfileIfDataSeparated
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "verifiedMDMProfileIdentifierWithCleanUp"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v3));
    if (!v4)
    {
      v11 = _MCLogObjects[12];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = 138543362;
        v17 = v3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MCCleanupMigrator: could not create MDM profile from identifier %{public}@", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_20;
    }
    v5 = objc_msgSend(v4, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "count");
      if (v8 == (id)1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personaID"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
          objc_msgSend(v14, "removeProfileWithIdentifier:installationType:source:", v3, objc_msgSend(v4, "installType"), CFSTR("User Enrollment Profile Removal"));

          v15 = _MCLogObjects[12];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v16) = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: Removed data separated (PDUE/ADUE/ADDE) MDM profile", (uint8_t *)&v16, 2u);
          }
        }

        goto LABEL_19;
      }
      if (v8)
      {
        v9 = _MCLogObjects[12];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          v10 = "MCCleanupMigrator: MDM profile contains more than one MDM payload";
          goto LABEL_18;
        }
      }
      else
      {
        v9 = _MCLogObjects[12];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          v10 = "MCCleanupMigrator: MDM profile contains no MDM payloads";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 2u);
        }
      }
    }
    else
    {
      v9 = _MCLogObjects[12];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16) = 0;
        v10 = "MCCleanupMigrator: payloadsWithClass: unexpectedly returned nil for MDM profile";
        goto LABEL_18;
      }
    }
LABEL_19:

LABEL_20:
  }

}

- (void)migrateCleanupMigratorWithContext:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  MCMigrator *v38;
  void *v39;
  id v40;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;
  void *v53;
  uint8_t buf[4];
  void *v55;

  v3 = *(_QWORD *)&a3;
  v5 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-MigrationCleanup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCMigrator stringWithContext:](MCMigrator, "stringWithContext:", v3));
  v7 = _MCLogObjects[12];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: work beginning, context: %{public}@", buf, 0xCu);
  }
  v8 = MCProductBuildVersion();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator systemMetadataDictionary](self, "systemMetadataDictionary"));
  objc_msgSend(v10, "setObject:forKey:", v9, kMCMetaLastMDMMigratedBuildKey);
  -[MCMigrator setSystemMetadataDictionary:](self, "setSystemMetadataDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  if ((_DWORD)v3 == 2)
  {
    v41 = 2;
    -[MCMigrator _removeMDMProfileIfDataSeparated](self, "_removeMDMProfileIfDataSeparated");
    v3 = objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
    objc_msgSend((id)v3, "scheduleTokenUpdate");
  }
  else
  {
    if ((_DWORD)v3 != 3)
      goto LABEL_26;
    v41 = 3;
    v38 = self;
    v39 = v6;
    v40 = v5;
    v12 = _MCLogObjects[12];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: removing profiles", buf, 2u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifiersOfInstalledProfilesWithFilterFlags:", 19, v10));
    v52 = kMCRemoveProfileOptionRemovedDueToMigrationFromOtherDevice;
    v53 = &__kCFBooleanTrue;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v3 = v13;
    v15 = objc_msgSend((id)v3, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v17)
            objc_enumerationMutation((id)v3);
          v19 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          v20 = objc_autoreleasePoolPush();
          objc_msgSend(v11, "removeProfileWithIdentifier:installationType:options:source:", v19, 1, v14, CFSTR("Migrator System Profile Removal"));
          objc_autoreleasePoolPop(v20);
        }
        v16 = objc_msgSend((id)v3, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v16);
    }
    v37 = v9;

    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifiersOfInstalledProfilesWithFilterFlags:", 9));
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v43 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
          v27 = objc_autoreleasePoolPush();
          objc_msgSend(v11, "removeProfileWithIdentifier:installationType:options:source:", v26, 2, v14, CFSTR("Migrator User Profile Removal"));
          objc_autoreleasePoolPop(v27);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v23);
    }

    v28 = SecTrustStoreForDomain(2);
    v29 = SecTrustStoreRemoveAll(v28);
    v30 = _MCLogObjects[12];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v55) = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "MCCleanupMigrator: removed all certificate trust settings (%i)", buf, 8u);
    }

    v6 = v39;
    v5 = v40;
    v9 = v37;
    self = v38;
    v10 = v36;
  }

  LODWORD(v3) = v41;
LABEL_26:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v31, "checkCarrierProfile");

  if ((v3 - 1) <= 1)
    -[MCMigrator _removeOSXServerPayloadAccount](self, "_removeOSXServerPayloadAccount");
  if ((v3 & 0xFFFFFFFE) == 2)
  {
    -[MCMigrator _removeHardwareBoundPayloads](self, "_removeHardwareBoundPayloads");
  }
  else if (!(_DWORD)v3)
  {
    goto LABEL_34;
  }
  v32 = _MCLogObjects[9];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Fixing orphaned accounts...", buf, 2u);
  }
  +[MCAccountUtilities checkAccountConsistencyAndReleaseOrphanedAccounts](MCAccountUtilities, "checkAccountConsistencyAndReleaseOrphanedAccounts");
  +[DMCEnrollmentAccountUtilities removeOrphanedEnrollmentAccounts](DMCEnrollmentAccountUtilities, "removeOrphanedEnrollmentAccounts");
LABEL_34:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "unverifiedInstalledMDMProfileIdentifier"));

  if (v34)
    +[MDMProvisioningProfileTrust didEnrollInMDMWithPasscode:duringMigration:](MDMProvisioningProfileTrust, "didEnrollInMDMWithPasscode:duringMigration:", 0, 1);
  -[MCNotifier sendCleanupMigrationFinishedNotification](self->_notifier, "sendCleanupMigrationFinishedNotification");
  v35 = _MCLogObjects[12];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: work complete", buf, 2u);
  }

}

- (void)migrateWithPostMigrationTaskQueue:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v32;

  v4 = a3;
  v29 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-MigrateWithPostMigrationTask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _lastSystemMigratedBuildVersion](self, "_lastSystemMigratedBuildVersion"));

  v6 = _MCLogObjects[12];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (!v5)
      v7 = "YES";
    *(_DWORD *)buf = 136315138;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Managed Configuration migrating (erase = %s) ...", buf, 0xCu);
  }
  -[MCMigrator _createDirectories](self, "_createDirectories");
  +[MCServerSideHacks setAllowHacksToCallExternalComponents:](MCServerSideHacks, "setAllowHacksToCallExternalComponents:", 0);
  if (v5)
  {
    -[MCMigrator _removeInvalidOptionsFromLegacyCloudConfiguration](self, "_removeInvalidOptionsFromLegacyCloudConfiguration");
    -[MCMigrator _createSystemGroupContainerAndMoveFiles](self, "_createSystemGroupContainerAndMoveFiles");
    -[MCMigrator _moveFilesToPublicDirectories](self, "_moveFilesToPublicDirectories");
    -[MCMigrator _migrateManifestLocation](self, "_migrateManifestLocation");
    -[MCMigrator _removeUnusedManifestArrays](self, "_removeUnusedManifestArrays");
    -[MCMigrator _removeDuplicatedHiddenIdentifiers](self, "_removeDuplicatedHiddenIdentifiers");
    -[MCMigrator _createStubs](self, "_createStubs");
    -[MCMigrator _removeOrphanedManifestEntries](self, "_removeOrphanedManifestEntries");
    -[MCMigrator _transferSignerCertificates](self, "_transferSignerCertificates");
    -[MCMigrator _transferRemovalPasswordsFromOriginalProfiles](self, "_transferRemovalPasswordsFromOriginalProfiles");
    -[MCMigrator _migrateOTAProfiles](self, "_migrateOTAProfiles");
    -[MCMigrator _transferInstallationDatesFromOriginalProfiles](self, "_transferInstallationDatesFromOriginalProfiles");
    -[MCMigrator _transferTagsToProfileStubs](self, "_transferTagsToProfileStubs");
    -[MCMigrator _removeOriginalCopies](self, "_removeOriginalCopies");
  }
  else
  {
    -[MCMigrator _createSystemGroupContainerAndMoveFiles](self, "_createSystemGroupContainerAndMoveFiles");
  }
  -[MCMigrator _applyDefaultSettings](self, "_applyDefaultSettings");
  if (!-[MCMigrator _isMultiUserMode](self, "_isMultiUserMode"))
    -[MCMigrator _migrateSettings](self, "_migrateSettings");
  if (v5)
  {
    -[MCMigrator _migrateClientRestrictions](self, "_migrateClientRestrictions");
    -[MCMigrator _updateClientRestrictions](self, "_updateClientRestrictions");
    -[MCMigrator _updateProfileRestrictions](self, "_updateProfileRestrictions");
    -[MCMigrator _applyImpliedSettings](self, "_applyImpliedSettings");
    -[MCMigrator _migrateSharedDeviceConfiguration](self, "_migrateSharedDeviceConfiguration");
    -[MCMigrator _migrateLostModeLastLocationRequestDate](self, "_migrateLostModeLastLocationRequestDate");
    -[MCMigrator _fixManifestFromStubsIfNecessary](self, "_fixManifestFromStubsIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
    objc_msgSend(v8, "invalidateCache");

    -[MCMigrator _migrateSupervisionSettings](self, "_migrateSupervisionSettings");
    -[MCMigrator _removeSupervisionProfiles](self, "_removeSupervisionProfiles");
    -[MCMigrator _cleanUpAppConfiguration](self, "_cleanUpAppConfiguration");
    -[MCMigrator _removeUnmanageableApps](self, "_removeUnmanageableApps");
  }
  else
  {
    -[MCMigrator _updateClientRestrictions](self, "_updateClientRestrictions");
    -[MCMigrator _updateProfileRestrictions](self, "_updateProfileRestrictions");
    -[MCMigrator _applyImpliedSettings](self, "_applyImpliedSettings");
    -[MCMigrator _fixManifestFromStubsIfNecessary](self, "_fixManifestFromStubsIfNecessary");
  }
  v9 = objc_autoreleasePoolPush();
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  objc_msgSend(v10, "recomputeProfileRestrictionsWithCompletionBlock:", &stru_1000E38E8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "systemUserSettings"));
  v13 = objc_msgSend(v12, "mutableCopy");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  objc_msgSend(v14, "_applyInternalDiagnosticEnforcementToSettings:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentRestrictions"));
  objc_msgSend(v15, "_applyImpliedSettingsToSettingsDictionary:currentSettings:restrictions:", v13, v13, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v18, "setParametersForSettingsByType:sender:", v13, CFSTR("MCMigrator.Migrate"));

  objc_autoreleasePoolPop(v9);
  if (v5)
  {
    -[MCMigrator _migrateProfileStubsForNetworkExtension](self, "_migrateProfileStubsForNetworkExtension");
    GSFontInitialize(-[MCMigrator _migrateExtensibleSSO](self, "_migrateExtensibleSSO"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "effectiveUserSettings"));
    objc_msgSend(v19, "_setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:", v21);

    -[MCMigrator _correctInstallOptionsOnProfileStubs](self, "_correctInstallOptionsOnProfileStubs");
    -[MCMigrator _tagManagedAccounts](self, "_tagManagedAccounts");
    -[MCMigrator _tagIMAPAccountsWithProfileAndPayloadProperties](self, "_tagIMAPAccountsWithProfileAndPayloadProperties");
    -[MCMigrator _correctCloudConfigurationIfNecessary](self, "_correctCloudConfigurationIfNecessary");
    -[MCMigrator _validateCloudConfiguration](self, "_validateCloudConfiguration");
    -[MCMigrator _removeLegacyAPNConfigurations](self, "_removeLegacyAPNConfigurations");
    -[MCMigrator _correctMDMConfigurationFile](self, "_correctMDMConfigurationFile");
    -[MCMigrator _checkValidUserEnrollment](self, "_checkValidUserEnrollment");
  }
  else
  {
    GSFontInitialize(-[MCMigrator _migrateExtensibleSSO](self, "_migrateExtensibleSSO"));
  }
  +[MCServerSideHacks setAllowHacksToCallExternalComponents:](MCServerSideHacks, "setAllowHacksToCallExternalComponents:", 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000325F8;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async(v4, block);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](MCProvisioningProfileJanitor, "sharedJanitor"));
  objc_msgSend(v22, "updateMISTrust");

  v23 = MCProductBuildVersion();
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator systemMetadataDictionary](self, "systemMetadataDictionary"));
  v26 = kMCMetaLastMigratedBuildKey;
  objc_msgSend(v25, "setObject:forKey:", v24, kMCMetaLastMigratedBuildKey);
  -[MCMigrator setSystemMetadataDictionary:](self, "setSystemMetadataDictionary:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator userMetadataDictionary](self, "userMetadataDictionary"));
  objc_msgSend(v27, "setObject:forKey:", v24, v26);
  -[MCMigrator setUserMetadataDictionary:](self, "setUserMetadataDictionary:", v27);
  v28 = _MCLogObjects[12];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Managed Configuration completed migration.", buf, 2u);
  }

}

- (void)_createDirectoryAtPath:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v7);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  }
}

- (void)_createDirectoryAtPath:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    v13 = 0;
    objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, v7, &v13);
    v11 = v13;

    if (v11)
    {
      v12 = _MCLogObjects[12];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create directory with error %{public}@", buf, 0xCu);
      }
    }

  }
}

- (void)_fixDirectoryAtPath:(id)a3 permissions:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v10);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", v6, v10, 0);

  }
}

- (void)_createDirectories
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = objc_autoreleasePoolPush();
  v4 = MCSystemPreferencesDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MCMigrator _createDirectoryAtPath:](self, "_createDirectoryAtPath:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", 493));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v6, NSFilePosixPermissions));

  v8 = MCLegacyProfileStorageDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[MCMigrator _fixDirectoryAtPath:permissions:](self, "_fixDirectoryAtPath:permissions:", v9, v7);

  v10 = MCSystemPreferencesDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[MCMigrator _fixDirectoryAtPath:permissions:](self, "_fixDirectoryAtPath:permissions:", v11, v7);

  v12 = MCLegacyPublicInfoDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[MCMigrator _fixDirectoryAtPath:permissions:](self, "_fixDirectoryAtPath:permissions:", v13, v7);

  objc_autoreleasePoolPop(v3);
}

- (void)_removeInvalidOptionsFromLegacyCloudConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v5 = MCLegacyCloudConfigurationDetailsFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "fileExistsAtPath:", v6);

  if (v7)
  {
    v8 = MCLegacyCloudConfigurationDetailsFilePath();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v9));

    v11 = kCCIsMultiUserKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kCCIsMultiUserKey));
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      objc_msgSend(v10, "removeObjectForKey:", v11);
      v14 = _MCLogObjects[12];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing invalid options from legacy cloud configuration...", v17, 2u);
      }
      v15 = MCLegacyCloudConfigurationDetailsFilePath();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_msgSend(v10, "MCWriteToBinaryFile:", v16);

    }
  }
  objc_autoreleasePoolPop(v3);
}

- (void)_createSystemGroupContainerAndMoveFiles
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = objc_autoreleasePoolPush();
  v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating legacy profile storage directory to system group container...", buf, 2u);
  }
  v5 = MCSystemPublicInfoDirectory(-[MCMigrator _createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary](self, "_createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _attributesForSystemProfileStorageItems](self, "_attributesForSystemProfileStorageItems"));
  -[MCMigrator _createDirectoryAtPath:attributes:](self, "_createDirectoryAtPath:attributes:", v6, v7);

  v8 = MCUserProfileStorageDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _attributesForUserProfileStorageItem](self, "_attributesForUserProfileStorageItem"));
  -[MCMigrator _createDirectoryAtPath:attributes:](self, "_createDirectoryAtPath:attributes:", v9, v10);

  v11 = MCUserPublicInfoDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _attributesForUserProfileStorageItem](self, "_attributesForUserProfileStorageItem"));
  -[MCMigrator _createDirectoryAtPath:attributes:](self, "_createDirectoryAtPath:attributes:", v12, v13);

  -[MCMigrator _fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents](self, "_fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents");
  -[MCMigrator _sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage](self, "_sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage");
  v14 = _MCLogObjects[12];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Completed system group container migration.", v15, 2u);
  }
  objc_autoreleasePoolPop(v3);
}

- (void)_fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v3 = MCSystemProfileLibraryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8 = 0;
  v5 = MCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM(v2, v4, &v8);
  v6 = v8;

  if ((v5 & 1) == 0)
  {
    if (objc_msgSend(v6, "count"))
    {
      v7 = _MCLogObjects[12];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to fix permissions of device profile library with errors %{public}@", buf, 0xCu);
      }
    }
  }

}

- (void)_sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage
{
  id v3;

  if (-[MCMigrator systemProfileStorageWasMigratedFromLegacyStorage](self, "systemProfileStorageWasMigratedFromLegacyStorage"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[MCMigrator notifier](self, "notifier"));
    objc_msgSend(v3, "sendCloudConfigurationDetailsChangedNotification");

  }
}

- (void)_createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[MCMigrator setSystemProfileStorageWasMigratedFromLegacyStorage:](self, "setSystemProfileStorageWasMigratedFromLegacyStorage:", 0);
  if (-[MCMigrator _shouldAttemptToMigrateLegacyProfileStorage](self, "_shouldAttemptToMigrateLegacyProfileStorage"))
    -[MCMigrator _migrateLegacySystemProfileStorage](self, "_migrateLegacySystemProfileStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v4 = MCSystemProfileStorageDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = MCSystemProfileStorageDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _attributesForSystemProfileStorageItems](self, "_attributesForSystemProfileStorageItems"));
    -[MCMigrator _createDirectoryAtPath:attributes:](self, "_createDirectoryAtPath:attributes:", v8, v9);

  }
  -[MCMigrator _removeLegacyProfileStorageDirectory](self, "_removeLegacyProfileStorageDirectory");
}

- (void)_migrateLegacySystemProfileStorage
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v3 = MCLegacyProfileStorageDirectory(-[MCMigrator _removeExistingSystemProfileStorageDirectoryBlockingMigration](self, "_removeExistingSystemProfileStorageDirectoryBlockingMigration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = MCSystemProfileStorageDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v14 = 0;
  v7 = -[MCMigrator _copyAlmostAtomicallyItemAtPath:toPath:error:](self, "_copyAlmostAtomicallyItemAtPath:toPath:error:", v4, v6, &v14);
  v8 = v14;

  if ((v7 & 1) == 0)
  {
    v9 = _MCLogObjects[12];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to move legacy profile storage with error %{public}@", buf, 0xCu);
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v11 = MCSystemProfileStorageDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v10, "fileExistsAtPath:", v12);

  if (v13)
  {
    -[MCMigrator _setAttributesOnSystemProfileStorageDirectory](self, "_setAttributesOnSystemProfileStorageDirectory");
    -[MCMigrator setSystemProfileStorageWasMigratedFromLegacyStorage:](self, "setSystemProfileStorageWasMigratedFromLegacyStorage:", 1);
  }

}

- (void)_removeExistingSystemProfileStorageDirectoryBlockingMigration
{
  void *v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v3 = MCSystemProfileStorageDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v12 = 0;
  v5 = objc_msgSend(v2, "removeItemAtPath:error:", v4, &v12);
  v6 = v12;

  v7 = _MCLogObjects[12];
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Removed the system profile storage directory blocking migration from legacy directory";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    v8 = "Failed to remove the system profile storage directory blocking migration from legacy directory, error: %{public}@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 12;
    goto LABEL_6;
  }

}

- (void)_setAttributesOnSystemProfileStorageDirectory
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _attributesForSystemProfileStorageItems](self, "_attributesForSystemProfileStorageItems"));
  v5 = MCSystemProfileStorageDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10 = 0;
  v7 = objc_msgSend(v3, "setAttributes:ofItemAtPath:error:", v4, v6, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
  {
    v9 = _MCLogObjects[12];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set permissions on new profile storage directory with error %{public}@", buf, 0xCu);
    }
  }

}

- (id)_attributesForSystemProfileStorageItems
{
  return -[MCMigrator _attributeDictionaryForProfileStorageWithPosixPermissions:](self, "_attributeDictionaryForProfileStorageWithPosixPermissions:", 511);
}

- (id)_attributesForUserProfileStorageItem
{
  return -[MCMigrator _attributeDictionaryForProfileStorageWithPosixPermissions:](self, "_attributeDictionaryForProfileStorageWithPosixPermissions:", 493);
}

- (id)_attributeDictionaryForProfileStorageWithPosixPermissions:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = NSFilePosixPermissions;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a3));
  v6[1] = NSFileProtectionKey;
  v7[0] = v3;
  v7[1] = NSFileProtectionNone;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

- (BOOL)_copyAlmostAtomicallyItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  NSObject *v23;
  id v25;
  id *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByDeletingLastPathComponent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR(".temporary")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  objc_msgSend(v14, "removeItemAtPath:error:", v13, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v29 = 0;
  v16 = objc_msgSend(v15, "copyItemAtPath:toPath:error:", v9, v13, &v29);

  v17 = v29;
  if ((v16 & 1) != 0)
  {
    v26 = a5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    v28 = 0;
    v19 = objc_msgSend(v18, "moveItemAtPath:toPath:error:", v13, v8, &v28);
    v20 = v28;

    if ((v19 & 1) == 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
      v27 = 0;
      v22 = objc_msgSend(v21, "removeItemAtPath:error:", v13, &v27);
      v25 = v27;

      if ((v22 & 1) == 0)
      {
        v23 = _MCLogObjects[12];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v31 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to clean up temporary item when copy failed, error %{public}@", buf, 0xCu);
        }
      }
      if (v26)
        *v26 = objc_retainAutorelease(v20);

    }
  }
  else
  {
    v19 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v17);
  }

  return v19;
}

- (BOOL)_shouldAttemptToMigrateLegacyProfileStorage
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;

  v3 = -[MCMigrator _isLegacyProfileStoragePresent](self, "_isLegacyProfileStoragePresent");
  if (v3)
  {
    v4 = MCLegacyProfileStorageDirectory(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = !-[MCMigrator _isDirectoryEmptyAtPath:](self, "_isDirectoryEmptyAtPath:", v5);

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_isLegacyProfileStoragePresent
{
  void *v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  char v7;

  v7 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v3 = MCLegacyProfileStorageDirectory(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v4, &v7);

  if (v7)
    return v5;
  else
    return 0;
}

- (BOOL)_isDirectoryEmptyAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, 0));

  if (v6)
    v7 = objc_msgSend(v6, "count") == 0;
  else
    v7 = 1;

  return v7;
}

- (void)_removeLegacyProfileStorageDirectory
{
  void *v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v3 = MCLegacyProfileStorageDirectory(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10 = 0;
  v5 = objc_msgSend(v2, "removeItemAtPath:error:", v4, &v10);
  v6 = v10;

  if ((v5 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if (objc_msgSend(v7, "isEqualToString:", NSCocoaErrorDomain))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == (id)4)
        goto LABEL_8;
    }
    else
    {

    }
    v9 = _MCLogObjects[12];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to delete legacy profile storage with error %{public}@", buf, 0xCu);
    }
  }
LABEL_8:

}

- (void)_moveFilesToPublicDirectories
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v3 = objc_autoreleasePoolPush();
  v4 = MCSystemProfileStorageDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Truth.plist")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v8 = MCRestrictionsFilePath();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "moveItemAtPath:toPath:error:", v6, v9, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v11 = MCEffectiveUserSettingsFilePath();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v10, "removeItemAtPath:error:", v12, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v14 = MCPublicEffectiveUserSettingsFilePath();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "removeItemAtPath:error:", v15, 0);

  v16 = MCSystemProfileStorageDirectory();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("MCMeta.plist")));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v21 = MCSystemMetadataFilePath(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v19, "moveItemAtPath:toPath:error:", v18, v22, 0);

  objc_autoreleasePoolPop(v3);
}

- (void)_migrateManifestLocation
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  int v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL8 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  char v30;
  id v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint8_t v36[16];
  uint8_t v37[16];
  uint8_t v38[16];
  uint8_t v39[16];
  uint8_t buf[16];

  v3 = objc_autoreleasePoolPush();
  v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning manifest migration...", buf, 2u);
  }
  v5 = MCSystemProfileStorageDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PayloadManifest.plist")));

  v8 = MCSystemProfileStorageDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("PayloadManifest2.plist")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v7);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v10);

  if ((v12 & 1) != 0 || v14)
  {
    if (v12)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v7));
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v15, 0, 0, 0));
        if (v16)
        {
          v17 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            v18 = 1;
            v19 = 2;
            goto LABEL_14;
          }
          v35 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v16, v35) & 1) != 0)
          {
            v19 = 1;
            v18 = 1;
LABEL_14:

            if (v14)
            {
              v20 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v10));
              if (v20)
              {
                v21 = (void *)v20;
                v22 = _MCLogObjects[12];
                v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
                if (v23)
                {
                  *(_WORD *)v39 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Migrating manifest from new path", v39, 2u);
                }
                v24 = MCSystemManifestPath(v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                objc_msgSend(v21, "MCWriteToBinaryFile:", v25);

                v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
                objc_msgSend(v26, "removeItemAtPath:error:", v10, 0);

LABEL_28:
                v34 = _MCLogObjects[12];
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v36 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Completed manifest migration.", v36, 2u);
                }

                goto LABEL_31;
              }
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
              objc_msgSend(v27, "removeItemAtPath:error:", v10, 0);

            }
            v28 = _MCLogObjects[12];
            v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
            v30 = v18 ^ 1;
            if (v19 != 1)
              v30 = 1;
            if ((v30 & 1) != 0)
            {
              if (v29)
              {
                *(_WORD *)v37 = 0;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Not migrating manifest", v37, 2u);
              }
            }
            else
            {
              if (v29)
              {
                *(_WORD *)v38 = 0;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Migrating old-format manifest", v38, 2u);
              }
              v31 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
              v32 = MCSystemManifestPath(objc_msgSend(v31, "setObject:forKey:", v16, CFSTR("OrderedProfiles")));
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              objc_msgSend(v31, "MCWriteToBinaryFile:", v33);

            }
            goto LABEL_28;
          }
        }
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    objc_msgSend(v15, "removeItemAtPath:error:", v7, 0);
    v19 = 0;
    v18 = 0;
    goto LABEL_14;
  }
LABEL_31:

  objc_autoreleasePoolPop(v3);
}

- (void)_removeUnusedManifestArrays
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_autoreleasePoolPush();
  v4 = MCSystemProfileStorageDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PayloadManifest.plist")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v7, 2, 0, 0));

  if (v8 && (v9 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
  {
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("DisabledProfiles"));
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("MissingProfiles"));
    objc_msgSend(v8, "MCWriteToBinaryFile:", v6);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    objc_msgSend(v10, "removeItemAtPath:error:", v6, 0);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)_removeDuplicatedHiddenIdentifiers
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];

  v3 = objc_autoreleasePoolPush();
  v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing duplicated hidden profile identifiers...", buf, 2u);
  }
  v5 = MCSystemProfileStorageDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PayloadManifest.plist")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v8, 2, 0, 0));

  if (v9 && (v10 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("OrderedProfiles")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("HiddenProfiles")));
    v13 = v12;
    if (v11 && v12)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(v11, "removeObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i));
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v15);
      }
      objc_msgSend(v9, "MCWriteToBinaryFile:", v7);
    }

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    objc_msgSend(v11, "removeItemAtPath:error:", v7, 0);
  }

  v18 = _MCLogObjects[12];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Completed removing duplicated hidden profile identifiers.", buf, 2u);
  }
  objc_autoreleasePoolPop(v3);
}

- (void)_createStubs
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _UNKNOWN **v13;
  void *i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  unsigned int v34;
  void *v35;
  os_log_t v36;
  NSObject *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  uint64_t v45;
  id v46;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];

  v2 = objc_autoreleasePoolPush();
  v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating stubs...", buf, 2u);
  }
  v4 = MCSystemProfileStorageDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PayloadManifest.plist")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v7, 0, 0, 0));

  if (v8)
  {
    v9 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v42 = v6;
      v43 = v2;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("HiddenProfiles")));
      v11 = objc_msgSend(v10, "mutableCopy");

      v41 = v8;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("OrderedProfiles")));
      objc_msgSend(v11, "addObjectsFromArray:", v12);

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = v11;
      v13 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      if (!v46)
        goto LABEL_21;
      v45 = *(_QWORD *)v50;
      while (1)
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v45)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
          v16 = objc_autoreleasePoolPush();
          v17 = MCSystemProfileStorageDirectory();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "MCOldStyleSafeFilenameHash"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", v19));

          v21 = MCSystemProfileStorageDirectory();
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "MCOldStyleSafeFilenameHashWithExtension:", CFSTR("stub")));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", v23));

          v25 = MCSystemProfileStorageDirectory();
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "MCHashedFilenameWithExtension:", CFSTR("stub")));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingPathComponent:", v27));

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
          LODWORD(v27) = objc_msgSend(v29, "fileExistsAtPath:", v20);

          if ((_DWORD)v27)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[196], "dataWithContentsOfFile:", v20));
            v31 = (id)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v30, 0));

            if (v31)
            {
              v32 = objc_opt_class(MCConfigurationProfile);
              if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
                objc_msgSend(v31, "writeStubToPath:", v28);
            }
          }
          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
            v34 = objc_msgSend(v33, "fileExistsAtPath:", v24);

            if (!v34)
              goto LABEL_19;
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
            v48 = 0;
            objc_msgSend(v35, "moveItemAtPath:toPath:error:", v24, v28, &v48);
            v31 = v48;

            if (v31)
            {
              v36 = _MCLogObjects[12];
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                v37 = v36;
                v38 = objc_msgSend(v31, "code");
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "domain"));
                *(_DWORD *)buf = 138544130;
                v54 = v24;
                v55 = 2114;
                v56 = v28;
                v57 = 2048;
                v58 = v38;
                v59 = 2114;
                v60 = v39;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Could not move profile from %{public}@ to %{public}@. Error: %ld / %{public}@", buf, 0x2Au);

                v13 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
              }
            }
          }

LABEL_19:
          objc_autoreleasePoolPop(v16);
        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        if (!v46)
        {
LABEL_21:

          v40 = _MCLogObjects[12];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Completed creating stubs.", buf, 2u);
          }

          v6 = v42;
          v2 = v43;
          v8 = v41;
          break;
        }
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_removeOrphanedManifestEntries
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v3 = objc_autoreleasePoolPush();
  v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing orphaned profiles...", buf, 2u);
  }
  v5 = MCSystemProfileStorageDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _removeOrphanedManifestEntriesFromManifestInDirectory:](self, "_removeOrphanedManifestEntriesFromManifestInDirectory:", v6));

  if (v7)
  {
    v9 = MCSystemManifestPath(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v7, "MCWriteToBinaryFile:", v10);

  }
  v11 = MCUserProfileStorageDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _removeOrphanedManifestEntriesFromManifestInDirectory:](self, "_removeOrphanedManifestEntriesFromManifestInDirectory:", v12));

  if (v13)
  {
    v14 = MCUserManifestPath();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "MCWriteToBinaryFile:", v15);

  }
  v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Completed removing orphaned profiles...", v17, 2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (id)_removeOrphanedManifestEntriesFromManifestInDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  id obj;
  id obja;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PayloadManifest.plist")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v5, 1, 0, 0));

  if (v6 && (v7 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v32 = v4;
    v33 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("OrderedProfiles")));
    obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "MCHashedFilenameWithExtension:", CFSTR("stub")));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v15));

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v16));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v17, 0));

          if (v18)
            objc_msgSend(obj, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v11);
    }

    objc_msgSend(v33, "setObject:forKey:", obj, CFSTR("OrderedProfiles"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("HiddenProfiles")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v19, "count")));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obja = v19;
    v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(obja);
          v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "MCHashedFilenameWithExtension:", CFSTR("stub")));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v26));

          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v27));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v28, 0));

          if (v29)
            objc_msgSend(v20, "addObject:", v25);

        }
        v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v22);
    }

    v6 = v33;
    objc_msgSend(v33, "setObject:forKey:", v20, CFSTR("HiddenProfiles"));

    v30 = v33;
    v4 = v32;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)_moveSignerCertificatesInProfileStubDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __SecCertificate *v13;
  void *v14;
  CFDataRef v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ProfileData")));
  if (v4)
  {
    v20 = 0;
    v5 = +[MCProfile dataFromCMSEncodedData:outSignerCertificates:](MCProfile, "dataFromCMSEncodedData:outSignerCertificates:", v4, &v20);
    v6 = v20;
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(__SecCertificate **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12);
            v14 = objc_autoreleasePoolPush();
            v15 = SecCertificateCopyData(v13);
            if (v15)
              objc_msgSend(v7, "addObject:", v15, (_QWORD)v16);

            objc_autoreleasePoolPop(v14);
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v10);
      }

      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SignerCerts"));
    }
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("ProfileData"), (_QWORD)v16);
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("SignerSummary"));

  }
}

- (void)_transferSignerCertificates
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _UNKNOWN **v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  void *j;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id obj;
  MCMigrator *v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[16];
  _BYTE v69[128];
  _BYTE v70[128];

  v3 = objc_autoreleasePoolPush();
  v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Transferring profile signer certificates...", buf, 2u);
  }
  v5 = MCSystemProfileStorageDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PayloadManifest.plist")));

  v8 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v9, 0, 0, 0));

  if (v10)
  {
    v11 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      v52 = v7;
      v53 = v3;
      v56 = self;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("HiddenProfiles")));
      v13 = objc_msgSend(v12, "mutableCopy");

      v51 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("OrderedProfiles")));
      objc_msgSend(v13, "addObjectsFromArray:", v14);

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = v13;
      v15 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v57)
      {
        v16 = *(_QWORD *)v65;
        v54 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v57; i = (char *)i + 1)
          {
            if (*(_QWORD *)v65 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
            v19 = objc_autoreleasePoolPush();
            v20 = MCSystemProfileStorageDirectory();
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "MCOldStyleSafeFilenameHash"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingPathComponent:", v22));

            v24 = MCSystemProfileStorageDirectory();
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "MCHashedFilenameWithExtension:", CFSTR("stub")));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingPathComponent:", v26));

            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[196], "dataWithContentsOfFile:", v27));
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v28, 0));

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[196], "dataWithContentsOfFile:", v23));
            if (v30)
              v31 = v29 == 0;
            else
              v31 = 1;
            if (!v31)
            {
              v63 = 0;
              v32 = (id)objc_claimAutoreleasedReturnValue(+[MCProfile dataFromCMSEncodedData:outSignerCertificates:](MCProfile, "dataFromCMSEncodedData:outSignerCertificates:", v30, &v63));
              v33 = v63;
              if (!v32)
                v32 = v30;
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[215], "MCSafePropertyListWithData:options:format:error:", v32, 0, 0, 0));
              if (v34
                && (v35 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v34, v35) & 1) != 0))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("EncryptedPayloadContent")));

                v31 = v36 == 0;
                v15 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
                v37 = !v31;
              }
              else
              {
                v37 = 0;
              }
              objc_msgSend(v29, "setEncrypted:", v37);
              if (objc_msgSend(v33, "count"))
                objc_msgSend(v29, "setSignerCertificates:", v33);
              objc_msgSend(v29, "writeStubToPath:", v27);

              v8 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
              v16 = v54;
            }

            objc_autoreleasePoolPop(v19);
          }
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
        }
        while (v57);
      }

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v58 = obj;
      v38 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v39; j = (char *)j + 1)
          {
            if (*(_QWORD *)v60 != v40)
              objc_enumerationMutation(v58);
            v42 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j);
            v43 = MCSystemProfileStorageDirectory();
            v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "MCHashedFilenameWithExtension:", CFSTR("stub")));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringByAppendingPathComponent:", v45));

            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v46));
            if (v47)
            {
              -[MCMigrator _moveSignerCertificatesInProfileStubDictionary:](v56, "_moveSignerCertificatesInProfileStubDictionary:", v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("OTAProfileStub")));
              v49 = objc_msgSend(v48, "mutableCopy");

              if (v49)
              {
                -[MCMigrator _moveSignerCertificatesInProfileStubDictionary:](v56, "_moveSignerCertificatesInProfileStubDictionary:", v49);
                objc_msgSend(v47, "setObject:forKeyedSubscript:", v49, CFSTR("OTAProfileStub"));
              }
              objc_msgSend(v47, "MCWriteToBinaryFile:", v46);

            }
          }
          v39 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        }
        while (v39);
      }

      v50 = _MCLogObjects[12];
      v7 = v52;
      v3 = v53;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Completed transferring profile signer certificates.", buf, 2u);
      }

      v10 = v51;
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_transferRemovalPasswordsFromOriginalProfiles
{
  NSObject *v2;
  void *v3;
  void *v4;
  _UNKNOWN **v5;
  void *i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *context;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  _BYTE v50[128];

  context = objc_autoreleasePoolPush();
  v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Migrating profile removal passwords...", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifiersOfInstalledProfilesWithFilterFlags:", 3));

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v45;
    v5 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v37)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v8 = objc_autoreleasePoolPush();
        v9 = MCSystemProfileStorageDirectory();
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MCOldStyleSafeFilenameHash"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v11));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[196], "dataWithContentsOfFile:", v12));
        if (v13)
        {
          v39 = v8;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v13, 0));
          v15 = MCSystemProfileStorageDirectory();
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MCHashedFilenameWithExtension:", CFSTR("stub")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v17));

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[196], "dataWithContentsOfFile:", v18));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v19, 0));

          v21 = objc_opt_class(MCConfigurationProfile);
          if ((objc_opt_isKindOfClass(v14, v21) & 1) != 0 && v20)
          {
            objc_msgSend(v20, "setLocked:", objc_msgSend(v14, "isLocked"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "removalPasscode"));
            if (v22)
            {
              v35 = v14;
              objc_msgSend(v20, "setRemovalPasscode:", v22);
              v42 = 0u;
              v43 = 0u;
              v40 = 0u;
              v41 = 0u;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "payloads"));
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
              if (v24)
              {
                v25 = v24;
                v26 = *(_QWORD *)v41;
                v34 = v22;
                while (2)
                {
                  for (j = 0; j != v25; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v41 != v26)
                      objc_enumerationMutation(v23);
                    v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
                    v29 = objc_opt_class(MCRemovalPasswordPayload);
                    if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
                    {
                      v22 = v34;
                      objc_msgSend(v28, "setRemovalPasscode:", v34);
                      goto LABEL_25;
                    }
                  }
                  v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
                  v22 = v34;
                  if (v25)
                    continue;
                  break;
                }
              }
LABEL_25:

              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUID"));
              +[MCKeychain setString:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setString:forService:account:label:description:useSystemKeychain:outError:", v22, CFSTR("MCProfileRemovalPasscode"), v31, 0, 0, objc_msgSend(v20, "isInstalledForSystem"), 0, context);

              v14 = v35;
            }
            objc_msgSend(v20, "writeStubToPath:", v18);

          }
          else
          {
            v30 = _MCLogObjects[12];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "The original profile cannot be decrypted. Removing the lock on the profile.", buf, 2u);
            }
            objc_msgSend(v20, "setLocked:", 0);
            objc_msgSend(v20, "writeStubToPath:", v18);
          }
          v8 = v39;

          v5 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
        }

        objc_autoreleasePoolPop(v8);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v38);
  }

  v32 = _MCLogObjects[12];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Completed migrating profile removal passwords.", buf, 2u);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_migrateOTAProfiles
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *j;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  _UNKNOWN **v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  MCMigrator *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *log;
  void *v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id obj;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  void *v104;
  _BYTE v105[128];
  _BYTE v106[128];

  v3 = objc_autoreleasePoolPush();
  v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating OTA profiles...", buf, 2u);
  }
  v5 = MCSystemProfileStorageDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ProfileService")));

  v8 = MCSystemProfileStorageDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("PayloadManifest.plist")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v11, 2, 0, 0));

  if (v12)
  {
    v13 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("Profile")));
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("Service")));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("SCEP")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v10));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v14, 2, 0, 0));

      if (v15)
      {
        v16 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("HiddenProfiles")));
          v18 = objc_msgSend(v17, "mutableCopy");

          v74 = v15;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("OrderedProfiles")));
          v20 = objc_msgSend(v19, "mutableCopy");

          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v21 = v18;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v100;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(_QWORD *)v100 != v24)
                  objc_enumerationMutation(v21);
                objc_msgSend(v20, "removeObject:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)i));
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
            }
            while (v23);
          }
          v78 = self;
          v79 = v12;
          v76 = v3;
          v77 = v10;
          v75 = v7;
          v80 = v21;

          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          obj = v20;
          v26 = v86;
          v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
          if (v93)
          {
            v92 = *(_QWORD *)v96;
            do
            {
              for (j = 0; j != v93; j = (char *)j + 1)
              {
                if (*(_QWORD *)v96 != v92)
                  objc_enumerationMutation(obj);
                v28 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)j);
                v29 = objc_autoreleasePoolPush();
                v30 = MCSystemProfileStorageDirectory();
                v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "MCHashedFilenameWithExtension:", CFSTR("stub")));
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingPathComponent:", v32));

                v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v33));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("PayloadUUID")));
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", v35));
                if (v36)
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKey:", v36));
                  v38 = objc_msgSend(v37, "MCMutableDeepCopy");

                  if (v38)
                  {
                    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
                    objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("MCProfileIsRemovalStub"));

                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("PayloadContent")));
                    v41 = v40;
                    if (v40)
                    {
                      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("SCEP")));
                      if (v42)
                      {
                        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKey:", v42));
                        if (v43)
                        {
                          v84 = v43;
                          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("Persistent Reference")));
                          if (v44)
                          {
                            v87 = v44;
                            objc_msgSend(v81, "addObject:", v44);
                            objc_msgSend(v41, "setObject:forKey:", v87, CFSTR("EnrollmentIdentityPersistentID"));
                            objc_msgSend(v41, "removeObjectForKey:", CFSTR("SCEP"));
                            objc_msgSend(v34, "setObject:forKey:", v38, CFSTR("OTAProfileStub"));
                            objc_msgSend(v34, "MCWriteToBinaryFile:", v33);
                            log = _MCLogObjects[12];
                            v45 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
                            v44 = v87;
                            if (v45)
                            {
                              *(_DWORD *)buf = 138543362;
                              v104 = v28;
                              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Migrated OTA profile %{public}@", buf, 0xCu);
                              v44 = v87;
                            }
                          }

                          v43 = v84;
                        }

                      }
                      v26 = v86;
                    }

                  }
                }

                objc_autoreleasePoolPop(v29);
              }
              v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
            }
            while (v93);
          }

          v46 = v80;
          v10 = v77;
          self = v78;
          v12 = v79;
          v47 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
          if (objc_msgSend(v80, "count"))
          {
            v48 = 0;
            do
            {
              v49 = objc_autoreleasePoolPush();
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndex:", v48));
              v51 = MCSystemProfileStorageDirectory();
              v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "MCHashedFilenameWithExtension:", CFSTR("stub")));
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingPathComponent:", v53));

              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47[199], "dictionaryWithContentsOfFile:", v54));
              if (v55 && (v56 = objc_opt_class(v47[199]), (objc_opt_isKindOfClass(v55, v56) & 1) != 0))
              {
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", CFSTR("PayloadContent")));
                if (v57
                  && (v58 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v57, v58) & 1) != 0)
                  && objc_msgSend(v57, "count"))
                {
                  v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndex:", 0));
                  v94 = (void *)v59;
                  if (v59
                    && (v60 = (void *)v59,
                        v61 = objc_opt_class(NSDictionary),
                        (objc_opt_isKindOfClass(v60, v61) & 1) != 0))
                  {
                    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKey:", CFSTR("PERSISTENT_REF")));
                    if (v62 && objc_msgSend(v81, "containsObject:", v62))
                    {
                      v63 = _MCLogObjects[12];
                      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        v104 = v50;
                        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "Removing unused hidden profile %{public}@", buf, 0xCu);
                      }
                      objc_msgSend(v80, "removeObjectAtIndex:", v48);
                      v64 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
                      v65 = MCSystemProfileStorageDirectory();
                      v88 = (void *)objc_claimAutoreleasedReturnValue(v65);
                      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "MCOldStyleSafeFilenameHash"));
                      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "stringByAppendingPathComponent:", v66));
                      objc_msgSend(v64, "removeItemAtPath:error:", v67, 0);

                      v85 = (id)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](v78, "fileManager"));
                      v68 = MCSystemProfileStorageDirectory();
                      v89 = (void *)objc_claimAutoreleasedReturnValue(v68);
                      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "MCHashedFilenameWithExtension:", CFSTR("stub")));
                      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "stringByAppendingPathComponent:", v69));
                      objc_msgSend(v85, "removeItemAtPath:error:", v70, 0);

                      self = v78;
                      v71 = 0;
                      v10 = v77;
                    }
                    else
                    {
                      v71 = 1;
                    }

                    v12 = v79;
                  }
                  else
                  {
                    v71 = 1;
                  }

                }
                else
                {
                  v71 = 1;
                }

                v47 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
              }
              else
              {
                v71 = 1;
              }

              v48 += v71;
              objc_autoreleasePoolPop(v49);
              v46 = v80;
            }
            while (v48 < (unint64_t)objc_msgSend(v80, "count"));
          }
          v15 = v74;
          objc_msgSend(v74, "setObject:forKey:", v46, CFSTR("HiddenProfiles"));
          objc_msgSend(v74, "setObject:forKey:", obj, CFSTR("OrderedProfiles"));
          objc_msgSend(v74, "MCWriteToBinaryFile:", v10);

          v7 = v75;
          v3 = v76;
        }
      }

    }
  }

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  objc_msgSend(v72, "removeItemAtPath:error:", v7, 0);

  v73 = _MCLogObjects[12];
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Completed migrating OTA profiles.", buf, 2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_transferInstallationDatesFromOriginalProfiles
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v27;
  NSObject *v28;
  void *context;
  MCMigrator *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];

  context = objc_autoreleasePoolPush();
  v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Transferring installation dates...", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiersOfInstalledProfilesWithFilterFlags:", 3));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    v30 = self;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v11 = objc_autoreleasePoolPush();
        v12 = MCSystemProfileStorageDirectory();
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "MCOldStyleSafeFilenameHash"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v14));

        v16 = MCSystemProfileStorageDirectory();
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "MCHashedFilenameWithExtension:", CFSTR("stub")));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingPathComponent:", v18));

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v19));
        v21 = v20;
        if (v20)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("InstallDate")));

          if (!v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "attributesOfItemAtPath:error:", v15, 0));

            if (v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", NSFileCreationDate));
              if (!v25)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", NSFileModificationDate));
                if (!v25)
                  goto LABEL_20;
              }
            }
            else
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "attributesOfItemAtPath:error:", v19, 0));

              if (v27)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", NSFileCreationDate));
                if (!v25)
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", NSFileModificationDate));
              }
              else
              {
                v25 = 0;
              }

              self = v30;
              if (!v25)
                goto LABEL_20;
            }
            objc_msgSend(v21, "setObject:forKey:", v25, CFSTR("InstallDate"));
            objc_msgSend(v21, "MCWriteToBinaryFile:", v19);

LABEL_20:
          }
        }

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }

  v28 = _MCLogObjects[12];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Completed transferring installation dates.", buf, 2u);
  }

  objc_autoreleasePoolPop(context);
}

- (BOOL)_applyAccountTagsToProfile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  if (qword_1000FD830 != -1)
    dispatch_once(&qword_1000FD830, &stru_1000E3908);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payloads"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_22;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v23;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v9);
      v11 = (void *)qword_1000FD838;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

      if (objc_msgSend(v13, "length"))
      {
        v14 = objc_opt_class(MCEASAccountPayload);
        if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0
          || (v15 = objc_opt_class(MCCalDAVAccountPayload), (objc_opt_isKindOfClass(v10, v15) & 1) != 0)
          || (v16 = objc_opt_class(MCLDAPAccountPayload), (objc_opt_isKindOfClass(v10, v16) & 1) != 0)
          || (v17 = objc_opt_class(MCSubCalAccountPayload), (objc_opt_isKindOfClass(v10, v17) & 1) != 0))
        {
          objc_msgSend(v10, "performSelector:withObject:", "setAccountPersistentUUID:", v13);
LABEL_14:
          v7 = 1;
          goto LABEL_15;
        }
        v18 = objc_opt_class(MCEmailAccountPayload);
        if ((objc_opt_isKindOfClass(v10, v18) & 1) != 0)
        {
          objc_msgSend(v10, "setPersistentResourceID:", v13);
          goto LABEL_14;
        }
      }
LABEL_15:

      v9 = (char *)v9 + 1;
    }
    while (v6 != v9);
    v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v6 = v19;
  }
  while (v19);
LABEL_22:

  return v7 & 1;
}

- (void)_transferTagsToProfileStubs
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *context;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];

  context = objc_autoreleasePoolPush();
  v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Transferring tags to profiles...", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifiersOfInstalledProfilesWithFilterFlags:", 3));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v10 = objc_autoreleasePoolPush();
        v11 = MCSystemProfileStorageDirectory();
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "MCHashedFilenameWithExtension:", CFSTR("stub")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v13));

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v15, 0));

        v17 = objc_opt_class(MCConfigurationProfile);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0
          && -[MCMigrator _applyAccountTagsToProfile:](self, "_applyAccountTagsToProfile:", v16))
        {
          objc_msgSend(v16, "writeStubToPath:", v14);
        }

        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v19 = MCTagsMappingFilePath(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v18, "removeItemAtPath:error:", v20, 0);

  v21 = _MCLogObjects[12];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Completed transferring tags.", buf, 2u);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_removeOriginalCopies
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[16];
  _BYTE v25[128];

  v3 = objc_autoreleasePoolPush();
  v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing old profile copies...", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifiersOfInstalledProfilesWithFilterFlags:", 3));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = objc_autoreleasePoolPush();
        v14 = MCSystemProfileStorageDirectory(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MCOldStyleSafeFilenameHash", (_QWORD)v20));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v16));

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
        objc_msgSend(v18, "removeItemAtPath:error:", v17, 0);

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

  v19 = _MCLogObjects[12];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Completed removing old profile copies.", buf, 2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_applyDefaultSettings
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char *v51;
  BOOL v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  MCMigrator *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint8_t v72[16];
  uint8_t v73[16];
  uint8_t buf[16];

  v3 = objc_autoreleasePoolPush();
  v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Applying default user settings...", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_deviceSpecificDefaultSettings"));

  if (v6)
  {
    v61 = self;
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "systemUserSettings"));
    v8 = objc_msgSend(v7, "MCMutableDeepCopy");

    v9 = MCRestrictedBoolKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MCRestrictedBoolKey));
    if (!v10)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v8, "setObject:forKey:", v10, v9);
    }
    v11 = MCRestrictedValueKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MCRestrictedValueKey));
    if (!v12)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v8, "setObject:forKey:", v12, v11);
    }
    v13 = MCAssignedObjectKey;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MCAssignedObjectKey));
    if (!v70)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v8, "setObject:forKey:");
    }
    v64 = v13;
    v14 = MCIntersectionKey;
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MCIntersectionKey));
    if (!v71)
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v8, "setObject:forKey:");
    }
    v63 = v14;
    v15 = MCUnionKey;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MCUnionKey));
    if (!v16)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v8, "setObject:forKey:", v16, v15);
    }
    v66 = v15;
    v67 = (void *)v16;
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v9));
    v62 = v3;
    if (v69)
    {
      objc_msgSend(v10, "MCDeepCopyMissingEntriesFromDictionary:", v69);
      v17 = MCFeatureDiagnosticsSubmissionModificationAllowed;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", MCFeatureDiagnosticsSubmissionModificationAllowed));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v17));
      v20 = (void *)v19;
      if (v18 && v19)
      {
        v21 = MCSettingParameterValueKey;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", MCSettingParameterValueKey));
        v23 = v12;
        v24 = v10;
        v25 = objc_msgSend(v22, "copy");
        objc_msgSend(v20, "setObject:forKey:", v25, v21);

        v10 = v24;
        v12 = v23;

        v3 = v62;
      }

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v11));
    if (v26)
    {
      objc_msgSend(v12, "MCDeepCopyMissingEntriesFromDictionary:", v26);
      v27 = MCFeatureAutoLockTime;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", MCFeatureAutoLockTime));
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v27));
      v30 = (void *)v29;
      if (v28 && v29)
      {
        v31 = MCSettingParameterRangeMinimumKey;
        v32 = v10;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", MCSettingParameterRangeMinimumKey));
        v34 = objc_msgSend(v33, "copy");
        objc_msgSend(v30, "setObject:forKey:", v34, v31);

        v10 = v32;
      }
      v35 = MCFeaturePasscodeKeyboardComplexity;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", MCFeaturePasscodeKeyboardComplexity));
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v35));
      v38 = (void *)v37;
      if (v36 && v37)
      {
        v60 = v10;
        v39 = MCSettingParameterValueKey;
        v59 = v26;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", MCSettingParameterValueKey));
        v41 = v6;
        v42 = v12;
        v43 = objc_msgSend(v40, "copy");
        v44 = v39;
        v10 = v60;
        objc_msgSend(v38, "setObject:forKey:", v43, v44);

        v12 = v42;
        v6 = v41;

        v26 = v59;
      }

      v3 = v62;
    }
    v65 = v12;
    v45 = v26;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v64));
    if (v46)
      objc_msgSend(v70, "MCDeepCopyMissingEntriesFromDictionary:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v63));
    if (!v47)
      goto LABEL_37;
    objc_msgSend(v71, "MCDeepCopyMissingEntriesFromDictionary:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _lastUserMigratedBuildVersion](v61, "_lastUserMigratedBuildVersion"));
    if (objc_msgSend(v48, "compare:options:", CFSTR("15G77"), 64) == (id)1)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _lastUserMigratedBuildVersion](v61, "_lastUserMigratedBuildVersion"));
      v50 = v10;
      v51 = (char *)objc_msgSend(v49, "compare:options:", CFSTR("17B1"), 64);

      v52 = v51 + 1 == 0;
      v10 = v50;
      if (!v52)
        goto LABEL_37;
      v53 = _MCLogObjects[12];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Clearing leaked WebContentFilter overrides...", v73, 2u);
      }
      v54 = MCFeatureWebContentFilterWhitelistedURLs;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", MCFeatureWebContentFilterWhitelistedURLs));
      objc_msgSend(v71, "setObject:forKeyedSubscript:", v55, v54);

      v56 = MCFeatureWebContentFilterAutoPermittedURLs;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", MCFeatureWebContentFilterAutoPermittedURLs));
      objc_msgSend(v71, "setObject:forKeyedSubscript:", v48, v56);
    }

LABEL_37:
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v66));
    if (v57)
      objc_msgSend(v67, "MCDeepCopyMissingEntriesFromDictionary:", v57);
    objc_msgSend(v68, "setParametersForSettingsByType:sender:", v8, CFSTR("MCMigrator.ApplyDefaultSettings"));

  }
  v58 = _MCLogObjects[12];
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v72 = 0;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Completed applying default user settings.", v72, 2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_migrateBoolRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 valuesToRestrictions:(id)a6 currentBoolUserSettings:(id)a7
{
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  const void *v33;
  __CFString *key;
  __CFString *applicationID;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v36 = a3;
  v11 = (const __CFString *)a4;
  v12 = (const __CFString *)a5;
  v13 = a6;
  v14 = a7;
  key = (__CFString *)v12;
  applicationID = (__CFString *)v11;
  v15 = (void *)CFPreferencesCopyAppValue(v12, v11);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    v20 = MCRestrictedBoolValueKey;
    do
    {
      v21 = 0;
      v37 = v18;
      do
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v22));
        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v23));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v20));

          if (!v25)
          {
            v26 = v19;
            v27 = v13;
            v28 = v20;
            v29 = v14;
            v30 = v16;
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v31, CFSTR("value")));

            v16 = v30;
            v14 = v29;
            v20 = v28;
            v13 = v27;
            v19 = v26;
            v18 = v37;
            objc_msgSend(v36, "setObject:forKey:", v32, v23);

          }
        }
        else
        {
          objc_msgSend(v38, "addObject:", v22);
        }

        v21 = (char *)v21 + 1;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v38, "count"))
    v33 = v38;
  else
    v33 = 0;
  CFPreferencesSetAppValue(key, v33, applicationID);

}

- (void)_migrateValueRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 keysToRestricitons:(id)a6 currentValueUserSettings:(id)a7
{
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const void *v27;
  __CFString *v28;
  __CFString *v29;
  id v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v30 = a3;
  v11 = (const __CFString *)a4;
  v12 = (const __CFString *)a5;
  v13 = a6;
  v32 = a7;
  v28 = (__CFString *)v12;
  v29 = (__CFString *)v11;
  v14 = (void *)CFPreferencesCopyAppValue(v12, v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    v19 = MCRestrictedValueValueKey;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v21));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v21));
        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", v23));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v19));

          if (!v25)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v22, CFSTR("value")));
            objc_msgSend(v30, "setObject:forKey:", v26, v23);

          }
        }
        else
        {
          objc_msgSend(v31, "setObject:forKey:", v22, v21);
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v31, "count"))
    v27 = v31;
  else
    v27 = 0;
  CFPreferencesSetAppValue(v28, v27, v29);

}

- (void)_migrateBoolValueToFeature:(id)a3 withAppID:(id)a4 forKey:(id)a5 synchronize:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  __CFString *v10;
  __CFString *v11;
  int AppBooleanValue;
  int v13;
  void *v14;
  Boolean keyExistsAndHasValidFormat;

  v6 = a6;
  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = (__CFString *)a5;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v11, v10, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v13 = AppBooleanValue;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    objc_msgSend(v14, "setBoolValue:forSetting:sender:", v13 != 0, v9, CFSTR("MCMigrator.MigrateBoolValueToFeature"));

  }
  CFPreferencesSetAppValue(v11, 0, v10);
  if (v6)
    CFPreferencesAppSynchronize(v10);

}

- (void)_migrateSettings
{
  NSObject *v3;
  const __CFString *v4;
  uint64_t AppBooleanValue;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFNumber *v34;
  _UNKNOWN **v35;
  const __CFNumber *v36;
  CFTypeID v37;
  void *v38;
  void *v39;
  const __CFNumber *v40;
  const __CFNumber *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CFPropertyListRef v47;
  const void *v48;
  CFTypeID v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  int v59;
  void *v60;
  void *v61;
  uint64_t v62;
  float v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  float v69;
  void *v70;
  double v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  id v84;
  NSObject *v85;
  BOOL v86;
  void *v87;
  NSObject *v88;
  const char *v89;
  NSObject *v90;
  os_log_type_t v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  NSObject *log;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  MCMigrator *v111;
  uint64_t v112;
  void *context;
  uint64_t v114;
  id v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  void *v119;
  _BYTE buf[12];
  __int16 v121;
  id v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  _QWORD v127[3];
  _QWORD v128[3];
  _QWORD v129[5];
  _QWORD v130[5];
  _QWORD v131[5];
  _QWORD v132[5];
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;

  context = objc_autoreleasePoolPush();
  v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Migrating settings...", buf, 2u);
  }
  buf[0] = 0;
  v4 = (const __CFString *)MCSpringboardBundleIdentifier;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SBSensitiveJibblerEnabled"), MCSpringboardBundleIdentifier, buf);
  CFPreferencesSetAppValue(CFSTR("SBSensitiveJibblerEnabled"), 0, CFSTR("com.apple.springboard"));
  v6 = MCRestrictedBoolKey;
  if (buf[0])
  {
    v137 = MCRestrictedBoolKey;
    v135 = MCFeatureAllowVoiceDialing;
    v133 = MCSettingParameterValueKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", AppBooleanValue));
    v134 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1));
    v136 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1));
    v138 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    objc_msgSend(v11, "setParametersForSettingsByType:sender:", v10, CFSTR("MCMigrator.MigrateSettings"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "systemUserSettings"));

  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v6));
  v15 = MCRestrictedValueKey;
  v110 = v13;
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", MCRestrictedValueKey));
  v16 = v6;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v106 = v16;
  objc_msgSend(v17, "setObject:forKey:", v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v114 = v15;
  objc_msgSend(v17, "setObject:forKey:", v19, v15);
  v131[0] = CFSTR("explicitContent");
  v131[1] = CFSTR("applicationInstallation");
  v20 = MCFeatureAppInstallationAllowed;
  v132[0] = MCFeatureExplicitContentAllowed;
  v132[1] = MCFeatureAppInstallationAllowed;
  v131[2] = CFSTR("camera");
  v131[3] = CFSTR("screenShot");
  v21 = MCFeatureCameraAllowed;
  v132[2] = MCFeatureCameraAllowed;
  v132[3] = MCFeatureScreenShotAllowed;
  v131[4] = CFSTR("inAppPurchases");
  v132[4] = MCFeatureInAppPurchasesAllowed;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v132, v131, 5));
  -[MCMigrator _migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:](self, "_migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:", v18, v4, CFSTR("SBParentalControlsCapabilities"), v22, v14);
  CFPreferencesSetAppValue(CFSTR("SBParentalControlsMCCapabilities"), 0, v4);
  v129[0] = MCSafariBundleIdentifier;
  v129[1] = MCCameraBundleIdentifier;
  v130[0] = MCFeatureSafariAllowed;
  v130[1] = v21;
  v129[2] = CFSTR("com.apple.youtube");
  v129[3] = MCFeatureITunesAllowed;
  v130[2] = MCFeatureYouTubeAllowed;
  v130[3] = MCFeatureITunesAllowed;
  v129[4] = MCAppStoreBundleIdentifier;
  v130[4] = v20;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v130, v129, 5));
  v109 = (void *)v14;
  -[MCMigrator _migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:](self, "_migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:", v18, v4, CFSTR("SBParentalControlsApplications"), v23, v14);
  CFPreferencesSetAppValue(CFSTR("SBParentalControlsMCApplications"), 0, v4);
  v127[0] = CFSTR("apps");
  v127[1] = CFSTR("tvshows");
  v112 = MCFeatureMaximumAppsRating;
  v128[0] = MCFeatureMaximumAppsRating;
  v128[1] = MCFeatureMaximumTVShowsRating;
  v127[2] = CFSTR("movies");
  v128[2] = MCFeatureMaximumMoviesRating;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v128, v127, 3));
  v111 = self;
  -[MCMigrator _migrateValueRestrictions:withAppID:forKey:keysToRestricitons:currentValueUserSettings:](self, "_migrateValueRestrictions:withAppID:forKey:keysToRestricitons:currentValueUserSettings:", v19, v4, CFSTR("SBParentalControlsMCContentRestrictions"), v24, v108);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectForKeyedSubscript:", MCFeatureMaximumFailedPasscodeAttempts));
  v107 = MCRestrictedValueValueKey;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:"));

  if (v26)
  {
    if (MCGestaltHasSEP(v27))
    {
      v28 = objc_msgSend(v26, "unsignedIntegerValue");
      if (v28 != (id)MCKeybagCurrentMaximumFailedPasscodeAttempts())
      {
        v29 = MCKeybagSetMaximumFailedPasscodeAttempts(v28, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        if (v30)
        {
          log = _MCLogObjects[12];
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v30;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to migrate maximum failed passcode attempts. Error: %{public}@", buf, 0xCu);
          }
        }

      }
    }
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v31, "setParametersForSettingsByType:sender:", v17, CFSTR("MCMigrator.MigrateSettings"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v32, "setObject:forKey:", v33, v114);
  v34 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("SBAutoLockTime"), v4);
  v35 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
  if (v34)
  {
    v36 = v34;
    v37 = CFGetTypeID(v34);
    if (v37 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v36, kCFNumberIntType, buf);
      if ((*(_DWORD *)buf & 0x80000000) != 0)
        *(_DWORD *)buf = 0x7FFFFFFF;
      v125 = v107;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      v126 = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, MCFeatureAutoLockTime);

    }
    CFRelease(v36);
  }
  v40 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("SBDeviceLockGracePeriod"), v4);
  if (v40)
  {
    v41 = v40;
    *(_QWORD *)buf = 0;
    CFNumberGetValue(v40, kCFNumberLongType, buf);
    v123 = v107;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *(_QWORD *)buf));
    v124 = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v43, MCFeaturePasscodeLockGraceTime);

    CFRelease(v41);
  }
  CFPreferencesSetAppValue(CFSTR("SBAutoLockTime"), 0, v4);
  CFPreferencesSetAppValue(CFSTR("SBDeviceLockGracePeriod"), 0, v4);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v44, "setParametersForSettingsByType:sender:", v32, CFSTR("MCMigrator.MigrateSettings"));

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v45, "setObject:forKey:", v46, MCUnionKey);
  v47 = CFPreferencesCopyAppValue(CFSTR("SBTrustedCodeSigningIdentities"), v4);
  if (v47)
  {
    v48 = v47;
    v49 = CFGetTypeID(v47);
    if (v49 == CFArrayGetTypeID())
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
      objc_msgSend(v50, "setUnionValues:forSetting:sender:", v48, MCFeatureTrustedCodeSigningIdentities, CFSTR("MCMigrator.MigrateSettings"));

    }
    CFRelease(v48);
  }
  CFPreferencesSetAppValue(CFSTR("SBTrustedCodeSigningIdentities"), 0, v4);

  buf[0] = 0;
  v51 = CFPreferencesGetAppBooleanValue(CFSTR("Disable While Passcode Locked"), CFSTR("com.apple.assistant"), buf);
  if (buf[0])
  {
    v52 = v51;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v53, "setObject:forKey:", v54, v106);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v54, "setObject:forKey:", v55, MCFeatureAssistantWhileLockedAllowed);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v52 == 0));
    objc_msgSend(v55, "setObject:forKey:", v56, MCRestrictedBoolValueKey);

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    objc_msgSend(v57, "setParametersForSettingsByType:sender:", v53, CFSTR("MCMigrator.MigrateSettings"));

  }
  CFPreferencesSetAppValue(CFSTR("Disable While Passcode Locked"), 0, CFSTR("com.apple.assistant"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
  CFPreferencesAppSynchronize(v4);
  buf[0] = 0;
  v58 = CFPreferencesGetAppBooleanValue(CFSTR("enabled"), CFSTR("com.apple.adtracking"), buf);
  if (buf[0])
  {
    v59 = v58;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    objc_msgSend(v60, "setBoolValue:forSetting:sender:", v59 == 0, MCFeatureLimitAdTrackingForced, CFSTR("MCMigrator.MigrateSettings"));

  }
  CFPreferencesSetAppValue(CFSTR("enabled"), 0, CFSTR("com.apple.adtracking"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.adtracking"));
  -[MCMigrator _migrateBoolValueToFeature:withAppID:forKey:synchronize:](v111, "_migrateBoolValueToFeature:withAppID:forKey:synchronize:", MCFeatureAutoCorrectionAllowed, CFSTR("com.apple.Preferences"), CFSTR("KeyboardAutocorrection"), 0);
  -[MCMigrator _migrateBoolValueToFeature:withAppID:forKey:synchronize:](v111, "_migrateBoolValueToFeature:withAppID:forKey:synchronize:", MCFeatureSmartPunctuationAllowed, CFSTR("com.apple.Preferences"), CFSTR("SmartPunctuation"), 0);
  -[MCMigrator _migrateBoolValueToFeature:withAppID:forKey:synchronize:](v111, "_migrateBoolValueToFeature:withAppID:forKey:synchronize:", MCFeaturePredictiveKeyboardAllowed, CFSTR("com.apple.Preferences"), CFSTR("KeyboardPrediction"), 0);
  -[MCMigrator _migrateBoolValueToFeature:withAppID:forKey:synchronize:](v111, "_migrateBoolValueToFeature:withAppID:forKey:synchronize:", MCFeatureSpellCheckAllowed, CFSTR("com.apple.Preferences"), CFSTR("KeyboardCheckSpelling"), 1);
  v61 = (void *)CFPreferencesCopyAppValue(CFSTR("CookieAcceptPolicy"), CFSTR("com.apple.WebUI"));
  if (v61)
  {
    v62 = objc_opt_class(NSString);
    v63 = 1.5;
    if ((objc_opt_isKindOfClass(v61, v62) & 1) != 0)
    {
      v63 = 2.0;
      if ((objc_msgSend(v61, "isEqualToString:", kMCSafariCookieAcceptPolicyAlways) & 1) == 0)
      {
        v63 = 1.5;
        if ((objc_msgSend(v61, "isEqualToString:", kMCSafariCookieAcceptPolicyOnlyFromMainDocumentDomain) & 1) == 0)
        {
          v63 = 1.0;
          if ((objc_msgSend(v61, "isEqualToString:", kMCSafariCookieAcceptPolicyExclusivelyFromMainDocumentDomain) & 1) == 0)
          {
            if (objc_msgSend(v61, "isEqualToString:", kMCSafariCookieAcceptPolicyNever))
              v63 = 0.0;
            else
              v63 = 1.0;
          }
        }
      }
    }
  }
  else
  {
    v64 = (void *)CFPreferencesCopyAppValue(CFSTR("NSHTTPAcceptCookies"), CFSTR("com.apple.WebFoundation"));
    v63 = 1.5;
    if (v64)
    {
      v65 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v64, v65) & 1) != 0)
      {
        v63 = 2.0;
        if ((objc_msgSend(v64, "isEqualToString:", CFSTR("always")) & 1) == 0)
        {
          if (objc_msgSend(v64, "isEqualToString:", CFSTR("never")))
            v63 = 0.0;
          else
            v63 = 1.5;
        }
        CFPreferencesSetAppValue(CFSTR("NSHTTPAcceptCookies"), 0, CFSTR("com.apple.WebFoundation"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.WebFoundation"));
      }
    }

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v67 = MCFeatureSafariAcceptCookies;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "effectiveValueForSetting:", MCFeatureSafariAcceptCookies));

  if (!v68 || (objc_msgSend(v68, "floatValue"), v69 != v63))
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    *(float *)&v71 = v63;
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v71));
    objc_msgSend(v70, "setValue:forSetting:sender:", v72, v67, CFSTR("MCMigrator.MigrateSettings"));

    v73 = _MCLogObjects[12];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Migrated safari cookie policy.", buf, 2u);
    }
  }

  v74 = MCSystemRootDirectory();
  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "stringByAppendingPathComponent:", CFSTR("/System/Library/OnBoardingBundles/com.apple.onboarding.improvehealth.bundle/ImproveHealth.plist")));

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v76, 0));
  v115 = 0;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v77, &v115));
  v79 = v115;
  if (v78)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("ContentVersion")));
    v81 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v80, v81) & 1) != 0)
    {
      v82 = objc_msgSend(v80, "integerValue");
      v83 = (void *)CFPreferencesCopyAppValue(CFSTR("MCFeatureHealthDataSubmissionAllowedVersion"), CFSTR("com.apple.managedconfiguration.profiled"));
      v84 = objc_msgSend(v83, "integerValue");

      v85 = _MCLogObjects[12];
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v82;
        v121 = 2048;
        v122 = v84;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "ImproveHealth currentContentVersion: %ld lastResetVersion: %ld", buf, 0x16u);
      }
      v86 = (uint64_t)v84 < (uint64_t)v82;
      v35 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
      if (!v86)
        goto LABEL_61;
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
      objc_msgSend(v87, "removeBoolSetting:sender:", MCFeatureHealthDataSubmissionAllowed, CFSTR("MCMigrator.MigrateSettings"));

      v35 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
      CFPreferencesSetAppValue(CFSTR("MCFeatureHealthDataSubmissionAllowedVersion"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v82), CFSTR("com.apple.managedconfiguration.profiled"));
      v88 = _MCLogObjects[12];
      if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        goto LABEL_61;
      *(_WORD *)buf = 0;
      v89 = "Reset Allow Health Data Submission.";
      v90 = v88;
      v91 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      v93 = _MCLogObjects[12];
      if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
LABEL_61:

        goto LABEL_62;
      }
      *(_WORD *)buf = 0;
      v89 = "Failed to read ContentVersion from OnBoardingBundle.";
      v90 = v93;
      v91 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl((void *)&_mh_execute_header, v90, v91, v89, buf, 2u);
    goto LABEL_61;
  }
  v92 = _MCLogObjects[12];
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v79;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "Failed to load ImproveHealth OnBoardingBundle. Error: %{public}@", buf, 0xCu);
  }
LABEL_62:

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "userSettings"));
  v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", v114));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v96, "objectForKeyedSubscript:", v112));
  v98 = objc_msgSend(v97, "mutableCopy");

  v99 = MCSettingParameterRangeMaximumKey;
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", MCSettingParameterRangeMaximumKey));
  LOBYTE(v96) = objc_msgSend(v100, "isEqualToNumber:", &off_1000ED178);

  if ((v96 & 1) == 0)
  {
    objc_msgSend(v98, "setObject:forKeyedSubscript:", &off_1000ED178, v99);
    v117 = v98;
    v118 = v114;
    v116 = v112;
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35[199], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1));
    v119 = v101;
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35[199], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));

    v103 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    objc_msgSend(v103, "setParametersForSettingsByType:sender:", v102, CFSTR("MCMigrator.MigrateSettings"));

  }
  v104 = _MCLogObjects[12];
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Completed migrating settings.", buf, 2u);
  }
  objc_autoreleasePoolPop(context);
}

- (void)_migrateClientRestrictions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _BYTE v61[128];

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "systemClientRestrictions"));

  v53 = v4;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v4, "MCMutableDeepCopy");
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "keyEnumerator"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v7)
    {
      v8 = v7;
      v47 = v2;
      v9 = 0;
      v10 = *(_QWORD *)v56;
      v11 = kMCClientRestrictionsTruth;
      v50 = kMCClientRestrictionsType;
      v49 = kEASAccountClientType;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v56 != v10)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", v13));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v11));
          if (v15)
          {
            objc_msgSend(v5, "setObject:forKey:", v14, v13);
          }
          else
          {
            v59[0] = v11;
            v59[1] = v50;
            v60[0] = v14;
            v60[1] = v49;
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 2));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v13);

            v9 = 1;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v8);

      v2 = v47;
      if ((v9 & 1) == 0)
        goto LABEL_15;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
      objc_msgSend(v6, "setAllClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", v5, CFSTR("MCMigrator.MigrateClientRestrictions"), 0, 0, 0, 0);
    }

LABEL_15:
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v18 = MCNewsBundleIdentifier;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientRestrictionsForClientUUID:", MCNewsBundleIdentifier));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    objc_msgSend(v20, "setClientRestrictions:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", &__NSDictionary0__struct, v18, v18, CFSTR("MCMigrator.MigrateClientRestrictions"), CFSTR("News"), 0, 0, 0, 0, 0);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v22 = kMCLSSystemAppRemovalClientType;
  v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientRestrictionsForClientUUID:", kMCLSSystemAppRemovalClientType));

  if (-[NSMutableDictionary count](v23, "count"))
  {
    v24 = MCFeatureRemovedSystemAppBundleIDs;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", MCFeatureRemovedSystemAppBundleIDs, v23));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", MCFeatureBlacklistedAppBundleIDs, v23));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", MCFeatureBlockedAppBundleIDs, v23));
    if (!objc_msgSend(v25, "count") && (objc_msgSend(v26, "count") || objc_msgSend(v27, "count")))
    {
      v51 = v19;
      v48 = v2;
      v28 = objc_opt_new(NSMutableDictionary);
      v29 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v26));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v27));
      v46 = (void *)v29;
      objc_msgSend(v30, "unionSet:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allObjects"));
      -[NSMutableDictionary MCSetUnionRestriction:values:](v28, "MCSetUnionRestriction:values:", v24, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
      objc_msgSend(v32, "setClientRestrictions:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", v28, v22, v22, CFSTR("MCMigrator.MigrateClientRestrictions"), &stru_1000E4AA0, 0, 0, 0, 0, 0);

      v33 = _MCLogObjects[12];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Migrated original removed system apps.", buf, 2u);
      }

      v2 = v48;
      v23 = v28;
      v19 = v51;
    }

  }
  v34 = (const __CFString *)MCiCloudDriveBundleIdentifier;
  v35 = (void *)CFPreferencesCopyAppValue(CFSTR("SBIconVisibility"), MCiCloudDriveBundleIdentifier);
  v36 = v35;
  if (!v35 || (objc_msgSend(v35, "BOOLValue") & 1) == 0)
  {
    v52 = v19;
    v37 = v2;
    v38 = MCFeatureRemovedSystemAppBundleIDs;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", MCFeatureRemovedSystemAppBundleIDs, v23));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v34));
    v41 = v40;
    if (v39)
      objc_msgSend(v40, "addObjectsFromArray:", v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "allObjects"));
    objc_msgSend(v42, "MCSetUnionRestriction:values:", v38, v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    objc_msgSend(v44, "setClientRestrictions:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", v42, v22, v22, CFSTR("MCMigrator.MigrateClientRestrictions"), &stru_1000E4AA0, 0, 0, 0, 0, 0);

    CFPreferencesSetAppValue(CFSTR("SBIconVisibility"), kCFBooleanTrue, v34);
    CFPreferencesAppSynchronize(v34);
    v45 = _MCLogObjects[12];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Migrated iCloud Drive app.", buf, 2u);
    }

    v2 = v37;
    v19 = v52;
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_updateClientRestrictions
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  unsigned int v18;
  void *context;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unsigned int v25;
  _BYTE v26[128];

  context = objc_autoreleasePoolPush();
  v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating client restrictions...", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "systemClientRestrictions"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v11));
        v13 = objc_msgSend(v12, "mutableCopy");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
        objc_msgSend(v14, "_applyHeuristicsToRestrictions:forProfile:ignoresUnrestrictableApps:", v13, 0, 0);

        objc_msgSend(v5, "setObject:forKey:", v13, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v15, "setAllClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", v5, CFSTR("MCMigrator.UpdateClientRestrictions"), 0, 0, 0, 0);

  v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 67109120;
    v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Done updating. %d client restrictions processed.", buf, 8u);

  }
  objc_autoreleasePoolPop(context);
}

- (id)_updateProfileRestrictionsForProfileRestrictions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v15));
        v12 = objc_msgSend(v11, "mutableCopy");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
        objc_msgSend(v13, "_applyHeuristicsToRestrictions:forProfile:ignoresUnrestrictableApps:", v12, 0, 0);

        objc_msgSend(v4, "setObject:forKey:", v12, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_updateProfileRestrictions
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];

  v3 = objc_autoreleasePoolPush();
  v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating profile restrictions...", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemProfileRestrictions"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _updateProfileRestrictionsForProfileRestrictions:](self, "_updateProfileRestrictionsForProfileRestrictions:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userProfileRestrictions"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _updateProfileRestrictionsForProfileRestrictions:](self, "_updateProfileRestrictionsForProfileRestrictions:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v11, "setSystemProfileRestrictions:userProfileRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outAppWhitelistSettingsChanged:outRecomputedNag:outError:", v7, v10, CFSTR("MCMigrator.UpdateProfileRestrictions"), 0, 0, 0, 0, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100039568;
  v15[3] = &unk_1000E3930;
  v16 = v7;
  v17 = v10;
  v13 = v10;
  v14 = v7;
  objc_msgSend(v12, "recomputeProfileRestrictionsWithCompletionBlock:", v15);

  objc_autoreleasePoolPop(v3);
}

- (void)_applyImpliedSettings
{
  void *v2;
  NSObject *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = objc_autoreleasePoolPush();
  v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating implied settings...", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v5 = objc_msgSend(v4, "effectiveRestrictedBoolForSetting:", MCFeatureDiagnosticsSubmissionAllowed);

  if (v5 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    objc_msgSend(v6, "setBoolValue:forSetting:sender:", 0, MCFeatureAppAnalyticsAllowed, CFSTR("MCMigrator.ApplyImpliedSettings"));

  }
  v7 = _MCLogObjects[12];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Done updating.", v8, 2u);
  }
  objc_autoreleasePoolPop(v2);
}

- (void)_migrateProfileStubsForNetworkExtension
{
  void *v2;
  Class v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _UNKNOWN **v11;
  _UNKNOWN **v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  void *i;
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
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id obj;
  void *v51;
  void *context;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v2 = objc_autoreleasePoolPush();
  if (!MCNEProfileIngestionClass())
  {
    v5 = _MCLogObjects[12];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v46 = "Skipping migrating NetworkExtension settings: not applicable";
LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v46, buf, 2u);
    goto LABEL_49;
  }
  v3 = NSClassFromString(CFSTR("NEProfileIngestion"));
  v4 = objc_opt_respondsToSelector(v3, "getServiceIDForPayload:");
  v5 = _MCLogObjects[12];
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) == 0)
  {
    if (!v6)
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v46 = "Skipping migrating NetworkExtension settings: nothing to do";
    goto LABEL_48;
  }
  v47 = v2;
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Migrating NetworkExtension settings to profiles...", buf, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifiersOfInstalledProfilesWithFilterFlags:", 3));

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v9)
  {
    v10 = v9;
    v11 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    v12 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    v13 = *(_QWORD *)v60;
    v49 = *(_QWORD *)v60;
    do
    {
      v14 = 0;
      v48 = v10;
      do
      {
        if (*(_QWORD *)v60 != v13)
          objc_enumerationMutation(obj);
        v53 = v14;
        v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v14);
        context = objc_autoreleasePoolPush();
        v16 = MCSystemProfileStorageDirectory(context);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "MCHashedFilenameWithExtension:", CFSTR("stub")));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingPathComponent:", v18));

        v20 = v11[159];
        v54 = (void *)v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[196], "dataWithContentsOfFile:", v19));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "profileWithData:outError:", v21, 0));

        v23 = objc_opt_class(MCConfigurationProfile);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
        {
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "payloads"));
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
          if (v25)
          {
            v26 = v25;
            v51 = v22;
            v27 = 0;
            v28 = *(_QWORD *)v56;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(_QWORD *)v56 != v28)
                  objc_enumerationMutation(v24);
                v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 4));
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "type"));

                if (v32)
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "type"));
                  objc_msgSend(v31, "setObject:forKey:", v33, CFSTR("PayloadType"));

                }
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUID"));

                if (v34)
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUID"));
                  objc_msgSend(v31, "setObject:forKey:", v35, CFSTR("PayloadUUID"));

                }
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));

                if (v36)
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
                  objc_msgSend(v31, "setObject:forKey:", v37, CFSTR("PayloadIdentifier"));

                }
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "displayName"));

                if (v38)
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "displayName"));
                  objc_msgSend(v31, "setObject:forKey:", v39, CFSTR("PayloadDisplayName"));

                }
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "persistentResourceID"));

                if (v40)
                {
                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "persistentResourceID"));
                  objc_msgSend(v31, "setObject:forKey:", v41, CFSTR("IdentificationUUID"));

                }
                if (objc_msgSend(v30, "version"))
                {
                  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v30, "version")));
                  objc_msgSend(v31, "setObject:forKey:", v42, CFSTR("PayloadVersion"));

                }
                v43 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class performSelector:withObject:](v3, "performSelector:withObject:", "getServiceIDForPayload:", v31));
                if (v43)
                {
                  objc_msgSend(v30, "setPersistentResourceID:", v43);
                  v27 = 1;
                }

              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
            }
            while (v26);

            v11 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
            v10 = v48;
            v13 = v49;
            v12 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
            v22 = v51;
            if ((v27 & 1) != 0)
            {
              v44 = _MCLogObjects[12];
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v64 = v54;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Migrating NetworkExtension: updating profile stub %{public}@", buf, 0xCu);
              }
              v22 = v51;
              objc_msgSend(v51, "writeStubToPath:", v54);
            }
          }
          else
          {

            v13 = v49;
          }
        }

        objc_autoreleasePoolPop(context);
        v14 = v53 + 1;
      }
      while ((id)(v53 + 1) != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v10);
  }

  if ((objc_opt_respondsToSelector(v3, "profileMigrationComplete") & 1) != 0)
    -[objc_class performSelector:](v3, "performSelector:", "profileMigrationComplete");
  v45 = _MCLogObjects[12];
  v2 = v47;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Completed migrating NetworkExtension settings.", buf, 2u);
  }

LABEL_49:
  objc_autoreleasePoolPop(v2);
}

- (void)_migrateExtensibleSSO
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v4 = objc_msgSend(v3, "allInstalledPayloadsOfClass:", objc_opt_class(MCExtensibleSingleSignOnPayload));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (objc_msgSend(v5, "count"))
  {
    v16 = 0;
    v6 = +[MCExtensibleSingleSignOnPayloadHandler rebuildConfigurationIncludingPayloads:excludingPayloads:error:](MCExtensibleSingleSignOnPayloadHandler, "rebuildConfigurationIncludingPayloads:excludingPayloads:error:", v5, 0, &v16);
    v7 = v16;
    v8 = _MCLogObjects[12];
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 134217984;
        v18 = v10;
        v11 = "Rebuilt Extensible SSO configuration from %ld payload(s)";
        v12 = v9;
        v13 = OS_LOG_TYPE_DEFAULT;
        v14 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);

      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v15 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218242;
      v18 = v15;
      v19 = 2114;
      v20 = v7;
      v11 = "Failed to rebuild Extensible SSO configuration from %ld payload(s): %{public}@";
      v12 = v9;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 22;
      goto LABEL_7;
    }

  }
  objc_autoreleasePoolPop(v2);
}

- (void)_migrateSharedDeviceConfiguration
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v2 = objc_autoreleasePoolPush();
  v3 = MCSharedDeviceConfigurationFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IfLostReturnToMessage")));
    if (v7)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, kMCSharedDeviceLockScreenFootnoteKey);
      objc_msgSend(v6, "removeObjectForKey:", CFSTR("IfLostReturnToMessage"));
      objc_msgSend(v6, "MCWriteToBinaryFile:", v4);
    }

  }
  v8 = _MCLogObjects[12];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Completed migrating Shared Device Configuration keys.", v9, 2u);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_migrateLostModeLastLocationRequestDate
{
  void *v2;
  const __CFString *v3;
  const __CFString *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSFileCoordinator *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint8_t *v21;
  id v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  char v26;
  uint8_t v27[4];
  id v28;

  v2 = objc_autoreleasePoolPush();
  v3 = (const __CFString *)kMCMDMLostModeLastLocationRequestDateKey;
  v4 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  v5 = (id)CFPreferencesCopyAppValue(kMCMDMLostModeLastLocationRequestDateKey, kMCNotBackedUpPreferencesDomain);
  if (v5
    || (v6 = ((uint64_t (*)(void))MCConfigurationProfilesSystemGroupContainer)(),
        (v5 = (id)_CFPreferencesCopyValueWithContainer(v3, v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost, v6)) != 0))
  {
    v7 = _MCLogObjects[12];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Migrating the Lost Mode last location request date.", buf, 2u);
    }
    v8 = objc_alloc((Class)NSURL);
    v9 = MCSystemLostModeRequestPath();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v8, "initFileURLWithPath:isDirectory:", v10, 0);

    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x2020000000;
    v26 = 0;
    v12 = objc_opt_new(NSFileCoordinator);
    v21 = buf;
    v22 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003A3DC;
    v19[3] = &unk_1000E3958;
    v5 = v5;
    v20 = v5;
    -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v12, "coordinateWritingItemAtURL:options:error:byAccessor:", v11, 0, &v22, v19);
    v13 = v22;

    if (!v24[24])
    {
      v14 = _MCLogObjects[12];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 138543362;
        v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not read device lost mode last location for migration: %{public}@", v27, 0xCu);
      }
    }
    v15 = ((uint64_t (*)(void))MCConfigurationProfilesSystemGroupContainer)();
    v16 = _CFPreferencesSetValueWithContainer(v3, 0, v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost, v15);
    v17 = MCConfigurationProfilesSystemGroupContainer(v16);
    _CFPreferencesSynchronizeWithContainer(v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost, v17);
    CFPreferencesSetValue(v3, 0, v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    CFPreferencesSetAppValue(v3, 0, v4);
    CFPreferencesAppSynchronize(v4);

    _Block_object_dispose(buf, 8);
  }
  v18 = _MCLogObjects[12];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Completed migrating the Lost Mode last location request date.", buf, 2u);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_fixManifestFromStubsIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = objc_autoreleasePoolPush();
  v4 = MCSystemProfileStorageDirectory(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = MCSystemManifestPath(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[MCMigrator _fixManifestFromStubsIfNecessaryWithStubPath:manifestPath:](self, "_fixManifestFromStubsIfNecessaryWithStubPath:manifestPath:", v5, v7);

  v8 = MCUserProfileStorageDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = MCUserManifestPath();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[MCMigrator _fixManifestFromStubsIfNecessaryWithStubPath:manifestPath:](self, "_fixManifestFromStubsIfNecessaryWithStubPath:manifestPath:", v9, v11);

  objc_autoreleasePoolPop(v3);
}

- (void)_fixManifestFromStubsIfNecessaryWithStubPath:(id)a3 manifestPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _profilesFromManifestAtPath:](self, "_profilesFromManifestAtPath:", v7));
    v19 = 0;
    v20 = 0;
    -[MCMigrator _profilesFromStubsAtPath:orderedProfiles:hiddenProfiles:](self, "_profilesFromStubsAtPath:orderedProfiles:hiddenProfiles:", v6, &v20, &v19);
    v10 = v20;
    v11 = v19;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator _generatedManifestIfNeededFromOrderedProfiles:hiddenProfiles:existingManifest:](self, "_generatedManifestIfNeededFromOrderedProfiles:hiddenProfiles:existingManifest:", v10, v11, v9));
    v13 = _MCLogObjects[12];
    if (v12)
    {
      if (os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Fixing incomplete profile manifest at path: %@", buf, 0xCu);
      }
      if ((objc_msgSend(v12, "MCWriteToBinaryFile:", v8) & 1) != 0)
        goto LABEL_14;
      v14 = _MCLogObjects[12];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      v15 = "Could not write replacement manifest file to path: %@";
      v16 = v14;
      v17 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      if (!os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      v15 = "Profile manifest is complete, not rewriting, path: %@";
      v16 = v13;
      v17 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, 0xCu);
    goto LABEL_14;
  }
  v18 = _MCLogObjects[12];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "stub path (%@) or manifest path (%@) is nil", buf, 0x16u);
  }
LABEL_15:

}

- (id)_profilesFromManifestAtPath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableSet *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v3, 0, 0, 0));

  if (v4 && (v5 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    v6 = objc_opt_new(NSMutableSet);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OrderedProfiles")));
    v8 = v7;
    if (v7)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v30;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v30 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v12);
            v14 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
              -[NSMutableSet addObject:](v6, "addObject:", v13);
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v10);
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HiddenProfiles")));
    v16 = v15;
    if (v15)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v26;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v20);
            v22 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
              -[NSMutableSet addObject:](v6, "addObject:", v21);
            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v18);
      }
    }
    v23 = -[NSMutableSet copy](v6, "copy");

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_profilesFromStubsAtPath:(id)a3 orderedProfiles:(id *)a4 hiddenProfiles:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  NSMutableSet *v26;
  NSObject *v27;
  id v28;
  id *v29;
  void *v30;
  id *v31;
  NSMutableSet *v32;
  NSMutableSet *v33;
  uint64_t v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
  v41 = 0;
  v35 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v8, &v41));
  v11 = v41;

  if (v10)
  {
    v28 = v11;
    v29 = a4;
    v31 = a5;
    v33 = objc_opt_new(NSMutableSet);
    v32 = objc_opt_new(NSMutableSet);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = v10;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v38;
      v34 = kMCInstallProfileOptionFilterFlag;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathExtension"));
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("stub"));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v16));
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v19));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v20, 0));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "installOptions"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v34));
            v24 = objc_msgSend(v23, "intValue");

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
            if (v25)
            {
              if ((v24 & 2) != 0)
                v26 = v33;
              else
                v26 = v32;
              -[NSMutableSet addObject:](v26, "addObject:", v25);
            }

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v13);
    }

    *v29 = -[NSMutableSet copy](v32, "copy");
    *v31 = -[NSMutableSet copy](v33, "copy");

    v10 = v30;
    v11 = v28;
  }
  else
  {
    v27 = _MCLogObjects[12];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v35;
      v45 = 2112;
      v46 = v11;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Cannot read directory for profiles stubs: %@: %@", buf, 0x16u);
    }
    *a4 = 0;
    *a5 = 0;
  }

}

- (id)_generatedManifestIfNeededFromOrderedProfiles:(id)a3 hiddenProfiles:(id)a4 existingManifest:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSMutableSet *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7 || v8 || v9)
  {
    v12 = objc_opt_new(NSMutableSet);
    v13 = v12;
    if (v7)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[NSMutableSet setByAddingObjectsFromSet:](v12, "setByAddingObjectsFromSet:", v7));

      v13 = (void *)v14;
    }
    if (v8)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "setByAddingObjectsFromSet:", v8));

      v13 = (void *)v15;
    }
    if (v10 && (objc_msgSend(v13, "isSubsetOfSet:", v10) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v16 = objc_opt_new(NSMutableDictionary);
      if (v7)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v17, CFSTR("OrderedProfiles"));

      }
      if (v8)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v18, CFSTR("HiddenProfiles"));

      }
      v11 = -[NSMutableDictionary copy](v16, "copy");

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_migrateSupervisionSettings
{
  void *v3;
  uint64_t IsAppleTV;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[8];
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v3 = objc_autoreleasePoolPush();
  IsAppleTV = MCGestaltIsAppleTV();
  if ((IsAppleTV & 1) == 0)
  {
    v5 = MCSystemPublicInfoDirectory(IsAppleTV);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Chaperone.plist")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    v9 = MCCloudConfigurationDetailsFilePath(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v10, 0);

    if (v11)
    {
      v12 = _MCLogObjects[12];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Supervision settings have been migrated.", buf, 2u);
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
      v14 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v7, 0);

      v15 = 0;
      if (v14)
      {
        v16 = _MCLogObjects[12];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Migrating supervision settings...", buf, 2u);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v7));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("organization")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allInstalledProfileIdentifiers"));

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        obj = v19;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
        v53 = v17;
        if (v20)
        {
          v50 = v7;
          v21 = *(_QWORD *)v60;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v60 != v21)
                objc_enumerationMutation(obj);
              v23 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
              v24 = objc_autoreleasePoolPush();
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "installedProfileWithIdentifier:", v23));

              if (objc_msgSend(v26, "containsPayloadOfClass:", objc_opt_class(MCChaperonePayload)))
              {
                v57 = 0u;
                v58 = 0u;
                v55 = 0u;
                v56 = 0u;
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "payloads"));
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
                if (v29)
                {
                  v30 = v29;
                  v49 = v3;
                  v31 = *(_QWORD *)v56;
                  while (2)
                  {
                    for (j = 0; j != v30; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v56 != v31)
                        objc_enumerationMutation(v28);
                      v33 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
                      v34 = objc_autoreleasePoolPush();
                      v35 = objc_opt_class(MCChaperonePayload);
                      LOBYTE(v20) = objc_opt_isKindOfClass(v33, v35);
                      if ((v20 & 1) != 0)
                      {
                        v36 = v33;
                        v37 = _MCLogObjects[12];
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Supervision profile found. Using information in profile for migration.", buf, 2u);
                        }
                        v51 = objc_msgSend(v36, "nonChaperonePairingAllowed");
                        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "pairingCertificateData"));

                        objc_autoreleasePoolPop(v34);
                        goto LABEL_30;
                      }
                      objc_autoreleasePoolPop(v34);
                    }
                    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
                    if (v30)
                      continue;
                    break;
                  }
                  v27 = 0;
                  v51 = 1;
LABEL_30:
                  v3 = v49;
                }
                else
                {
                  v27 = 0;
                  LOBYTE(v20) = 0;
                  v51 = 1;
                }

                objc_autoreleasePoolPop(v24);
                goto LABEL_33;
              }

              objc_autoreleasePoolPop(v24);
            }
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
            if (v20)
              continue;
            break;
          }
          v27 = 0;
          v51 = 1;
LABEL_33:
          v7 = v50;
        }
        else
        {
          v27 = 0;
          v51 = 1;
        }
        v15 = (void *)v27;

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
        objc_msgSend(v38, "removeItemAtPath:error:", v7, 0);

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v40 = v39;
        if (v52)
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v52, kCCOrganizationNameKey);
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v20 & 1));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, kCCIsSupervisedKey);

        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v51));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, kCCAllowPairingKey);

        if (v15)
        {
          v64 = v15;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v43, kCCSupervisorHostCertificatesKey);

        }
        objc_msgSend(v40, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCIsMandatoryKey);
        objc_msgSend(v40, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCCloudConfigurationUICompleteKey);
        v44 = MCCloudConfigurationDetailsFilePath(objc_msgSend(v40, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCPostSetupProfileWasInstalledKey));
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        objc_msgSend(v40, "MCWriteToBinaryFile:", v45);

        MCSendCloudConfigurationDetailsChangedNotification();
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
        objc_msgSend(v46, "setBoolValue:forSetting:sender:", v51, MCFeatureHostPairingAllowed, CFSTR("MCMigrator.MigrateSupervisionSettings"));

      }
      v47 = _MCLogObjects[12];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Finished migrating supervision settings.", buf, 2u);
      }

    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCMigrator fileManager](self, "fileManager"));
    objc_msgSend(v48, "removeItemAtPath:error:", v7, 0);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)_removeSupervisionProfiles
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *context;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  context = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allInstalledProfileIdentifiers"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "installedProfileWithIdentifier:", v9));

        if (objc_msgSend(v12, "containsPayloadOfClass:", objc_opt_class(MCChaperonePayload)))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
          objc_msgSend(v13, "removeProfileWithIdentifier:installationType:source:", v9, objc_msgSend(v12, "installType"), CFSTR("Supervision Profile Removal"));

          v14 = _MCLogObjects[12];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removed supervision profile.", buf, 2u);
          }
        }

        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_cleanUpAppConfiguration
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *k;
  void *v35;
  void *v36;
  void *v37;
  os_log_t v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *m;
  void *v46;
  NSObject *v47;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *context;
  void *contexta;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];

  v50 = objc_autoreleasePoolPush();
  v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up app configuration.", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set", self));
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allInstalledProfileIdentifiers"));

  v52 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v51)
          objc_enumerationMutation(v5);
        v7 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        context = objc_autoreleasePoolPush();
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "installedProfileWithIdentifier:", v7));

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payloads"));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v65;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v65 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)j);
              v16 = objc_autoreleasePoolPush();
              v17 = objc_opt_class(MCDefaultsPayload);
              if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domains"));
                objc_msgSend(v3, "addObjectsFromArray:", v18);

              }
              objc_autoreleasePoolPop(v16);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          }
          while (v12);
        }

        objc_autoreleasePoolPop(context);
      }
      v52 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    }
    while (v52);
  }

  v19 = MDMAppManagementFilePath();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v20));

  contexta = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", kMDMManagedAppMetadataByBundleIDKey));
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allKeys"));

  v53 = (void *)v23;
  objc_msgSend(v3, "addObjectsFromArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCManagedPreferencesManager globalManagedPreferencesDomain](MCManagedPreferencesManager, "globalManagedPreferencesDomain"));
  objc_msgSend(v3, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "fileManager"));
  v27 = MCSystemPreferencesDirectory();
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "contentsOfDirectoryAtPath:error:", v28, 0));

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v30 = v29;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(_QWORD *)v61 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)k);
        v36 = objc_autoreleasePoolPush();
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByDeletingPathExtension"));
        if ((objc_msgSend(v37, "rangeOfString:options:", CFSTR("com.apple."), 8)
           || (objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.Numbers")) & 1) != 0
           || (objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.Pages")) & 1) != 0
           || objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.Keynote")))
          && (objc_msgSend(v3, "containsObject:", v37) & 1) == 0)
        {
          objc_msgSend(v25, "addObject:", v37);
        }

        objc_autoreleasePoolPop(v36);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v25, "count"))
  {
    v38 = _MCLogObjects[12];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      v40 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 134217984;
      v74 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Removing %lu unused managed default domains.", buf, 0xCu);

    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v41 = v25;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v57;
      do
      {
        for (m = 0; m != v43; m = (char *)m + 1)
        {
          if (*(_QWORD *)v57 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)m);
          if (objc_msgSend(v46, "length"))
            +[MCManagedPreferencesManager setManagedPreferences:forDomain:](MCManagedPreferencesManager, "setManagedPreferences:forDomain:", &__NSDictionary0__struct, v46);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
      }
      while (v43);
    }

  }
  v47 = _MCLogObjects[12];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Finished cleaning up app configuration.", buf, 2u);
  }

  objc_autoreleasePoolPop(v50);
}

- (void)_removeUnmanageableApps
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  int v34;
  _BYTE v35[128];
  _QWORD v36[2];

  v2 = objc_autoreleasePoolPush();
  v36[0] = MCiBooksBundleIdentifier;
  v36[1] = MCShortcutsOldBundleIdentifier;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  v5 = ((uint64_t (*)(void))MDMAppManagementFilePath)();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v6));

  if (objc_msgSend(v7, "count"))
  {
    v8 = kMDMManagedAppMetadataByBundleIDKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kMDMManagedAppMetadataByBundleIDKey));
    v10 = objc_msgSend(v9, "mutableCopy");

    if (objc_msgSend(v10, "count"))
    {
      v11 = _MCLogObjects[12];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cleaning up managed apps...", buf, 2u);
      }
      v26 = v8;
      v28 = v2;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v10, "count")));
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v27 = v10;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v17)
              objc_enumerationMutation(v13);
            v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v4, "containsObject:", v19))
            {
              ++v16;
            }
            else
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v19));
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        }
        while (v15);
      }
      else
      {
        v16 = 0;
      }

      if ((objc_msgSend(v13, "isEqualToDictionary:", v12) & 1) == 0)
      {
        v21 = objc_msgSend(v7, "mutableCopy");
        v22 = MDMAppManagementFilePath(objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, v26));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        objc_msgSend(v21, "MCWriteToBinaryFile:", v23);

        v24 = _MCLogObjects[12];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v34 = v16;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Removed %d apps.", buf, 8u);
        }

      }
      v25 = _MCLogObjects[12];
      v10 = v27;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Finished cleaning up managed apps.", buf, 2u);
      }

      v2 = v28;
    }

  }
  objc_autoreleasePoolPop(v2);
}

- (void)_correctInstallOptionsOnProfileStubs
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *context;
  void *contexta;
  id obj;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];

  context = objc_autoreleasePoolPush();
  v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Correcting stubs with incorrect install options...", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest", context));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allInstalledProfileIdentifiers"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v31 = *(_QWORD *)v33;
    v7 = kMCInstallProfileOptionIsInstalledByMDM;
    v30 = kMCInstallProfileOptionsIsInstalledByDeclarativeManagement;
    v8 = kMCInstallProfileOptionManagingProfileIdentifier;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v31)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "installedProfileWithIdentifier:", v10));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "installOptions"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v7));
        LODWORD(v12) = objc_msgSend(v15, "BOOLValue");

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v30));
        v17 = objc_msgSend(v16, "BOOLValue");

        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v8));
        v19 = (void *)v18;
        if ((_DWORD)v12)
          v20 = v18 == 0;
        else
          v20 = 0;
        if (v20 && (v17 & 1) == 0)
        {
          v21 = objc_msgSend(v14, "mutableCopy");
          objc_msgSend(v21, "removeObjectForKey:", v7);
          v22 = objc_msgSend(v21, "copy");
          objc_msgSend(v13, "setInstallOptions:", v22);

          v23 = objc_msgSend(v13, "isInstalledForUser");
          if ((v23 & 1) != 0)
            v24 = MCUserProfileStorageDirectory();
          else
            v24 = MCSystemProfileStorageDirectory(v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          objc_msgSend(v13, "writeStubToDirectory:", v25);

        }
        objc_autoreleasePoolPop(v11);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }

  v26 = _MCLogObjects[12];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Completed install options corrections.", buf, 2u);
  }

  objc_autoreleasePoolPop(contexta);
}

- (void)_tagManagedAccounts
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _BOOL8 v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *context;
  id obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  int v26;
  _BYTE v27[128];

  context = objc_autoreleasePoolPush();
  v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Tagging managed accounts...", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = v3;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accounts"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    v8 = kMCDMManagedProfileToManagingProfileKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mcProfileUUID"));
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dependentsOfParent:inDomain:", v11, v8));
          v13 = objc_msgSend(v12, "count");

          v14 = v13 != 0;
          if (v13)
            ++v6;
        }
        else
        {
          v14 = 0;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14));
        objc_msgSend(v10, "setAccountProperty:forKey:", v15, CFSTR("MCAccountIsManaged"));

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Completed tagging %d accounts as managed.", buf, 8u);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_tagIMAPAccountsWithProfileAndPayloadProperties
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  id v38;
  void *context;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  int v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];

  v34 = objc_autoreleasePoolPush();
  v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Adding missing tags to IMAP accounts...", buf, 2u);
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](MailAccount, "mailAccounts", v34));
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allInstalledProfileIdentifiers"));

  obj = v4;
  v38 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  v5 = 0;
  if (v38)
  {
    v37 = *(_QWORD *)v62;
    v6 = MailAccountManagedTag;
    v47 = kMCAccountProfileUUIDKey;
    v45 = MailAccountManagedTag;
    v46 = kMCAccountPayloadUUIDKey;
    v7 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v62 != v37)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v40 = v8;
        v10 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v8);
        context = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "installedProfileWithIdentifier:", v10));

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v48 = v12;
        v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "payloads"));
        v13 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v58;
          v42 = *(_QWORD *)v58;
          do
          {
            v16 = 0;
            v43 = v14;
            do
            {
              if (*(_QWORD *)v58 != v15)
                objc_enumerationMutation(v44);
              v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v16);
              v18 = objc_autoreleasePoolPush();
              v19 = objc_opt_class(v7[137]);
              if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
              {
                v50 = v17;
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "persistentResourceID"));
                v53 = 0u;
                v54 = 0u;
                v55 = 0u;
                v56 = 0u;
                v51 = v41;
                v21 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
                if (v21)
                {
                  v22 = v21;
                  v23 = *(_QWORD *)v54;
                  v49 = v20;
                  do
                  {
                    for (i = 0; i != v22; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v54 != v23)
                        objc_enumerationMutation(v51);
                      v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
                      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accountPropertyForKey:", v6));
                      v27 = v26;
                      if (v26 && objc_msgSend(v26, "isEqualToString:", v20))
                      {
                        v52 = v5;
                        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "UUID"));
                        objc_msgSend(v25, "setAccountProperty:forKey:", v28, v47);

                        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "UUID"));
                        objc_msgSend(v25, "setAccountProperty:forKey:", v29, v46);

                        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "deliveryAccount"));
                        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "UUID"));
                        objc_msgSend(v30, "setAccountProperty:forKey:", v31, v47);

                        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "UUID"));
                        objc_msgSend(v30, "setAccountProperty:forKey:", v32, v46);

                        v6 = v45;
                        v20 = v49;
                        v5 = v52 + 1;

                      }
                    }
                    v22 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
                  }
                  while (v22);
                }

                v7 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
                v15 = v42;
                v14 = v43;
              }
              objc_autoreleasePoolPop(v18);
              v16 = (char *)v16 + 1;
            }
            while (v16 != v14);
            v14 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
          }
          while (v14);
        }

        objc_autoreleasePoolPop(context);
        v8 = v40 + 1;
      }
      while ((id)(v40 + 1) != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v38);
  }

  v33 = _MCLogObjects[12];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v66 = v5;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Done adding missing tags to %d IMAP accounts.", buf, 8u);
  }

  objc_autoreleasePoolPop(v35);
}

- (void)_validateCloudConfiguration
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  unsigned int v14;
  NSObject *v15;
  _BOOL8 v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfigurationWriter sharedInstance](MCCloudConfigurationWriter, "sharedInstance"));
  v4 = MCCloudConfigurationDetailsFilePath(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v5));

  v20 = 0;
  v7 = objc_msgSend(v3, "_validateDetails:outReasonWhyInvalid:", v6, &v20);
  v8 = v20;
  v9 = _MCLogObjects[12];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Cloud configuration is valid";
      v11 = v9;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Cloud configuration is invalid: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v6, "removeObjectForKey:", kCCSkipSetupKey);
    v19 = 0;
    v14 = objc_msgSend(v3, "_validateDetails:outReasonWhyInvalid:", v6, &v19);
    v8 = v19;
    v15 = _MCLogObjects[12];
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Fixed cloud configuration by deleting skip keys", buf, 2u);
      }
      v17 = MCCloudConfigurationDetailsFilePath(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      objc_msgSend(v6, "MCWriteToBinaryFile:", v18);

      MCSendCloudConfigurationDetailsChangedNotification();
    }
    else if (v16)
    {
      *(_DWORD *)buf = 138543362;
      v22 = v8;
      v10 = "Unable to fix cloud configuration: %{public}@";
      v11 = v15;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 12;
      goto LABEL_12;
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_correctCloudConfigurationIfNecessary
{
  objc_autoreleasePoolPop(objc_autoreleasePoolPush());
}

- (void)_wakeDaemonsPostMigration
{
  NSObject *v2;
  uint64_t Mode;
  void *v4;
  uint8_t v5[16];

  v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Waking daemons post migration", v5, 2u);
  }
  Mode = MCPowerlogControlReadMode();
  v4 = (void *)objc_claimAutoreleasedReturnValue(Mode);
  MCPowerlogControlSwitchMode();

}

- (void)_removeLegacyAPNConfigurations
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *context;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;

  context = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCAPNPayload apnDomainName](MCAPNPayload, "apnDomainName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManagedPreferencesManager managedPreferencesForDomain:](MCManagedPreferencesManager, "managedPreferencesForDomain:", v2));

  if (v3)
  {
    v4 = _MCLogObjects[12];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MCMigrator removing APN defaults: %@", buf, 0xCu);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCAPNPayload apnDomainName](MCAPNPayload, "apnDomainName"));
    +[MCManagedPreferencesManager removeManagedPreferences:fromDomain:](MCManagedPreferencesManager, "removeManagedPreferences:fromDomain:", v5, v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest", v3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allInstalledProfileIdentifiers"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "installedProfileWithIdentifier:", v14));

        if (objc_msgSend(v16, "containsPayloadOfClass:", objc_opt_class(MCAPNPayload)))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
          objc_msgSend(v17, "removeProfileWithIdentifier:installationType:source:", v14, objc_msgSend(v16, "installType"), CFSTR("migrator APN cleanup"));

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_correctMDMConfigurationFile
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v2 = objc_autoreleasePoolPush();
  v3 = MDMFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization DMCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "DMCSafePropertyListWithData:options:format:error:", v5, 1, 0, 0));
  v7 = v6;
  if (v6)
  {
    v8 = kMDMIsProfileLockedKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kMDMIsProfileLockedKey));

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "verifiedMDMProfileIdentifierWithCleanUp"));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "isLocked")));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v8);

      }
      else
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v8);
      }

      v14 = MDMFilePath();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_msgSend(v7, "DMCWriteToBinaryFile:", v15);

    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)_checkValidUserEnrollment
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint8_t v24[16];

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "installedMDMProfile"));

  if (v4)
  {
    v5 = objc_msgSend(v4, "payloadsWithClass:", objc_opt_class(MCMDMPayload));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    if (v7)
    {
      if ((objc_msgSend(v7, "isUserEnrollment") & 1) == 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enrollmentID"));

        if (v8)
        {
          v9 = _MCLogObjects[12];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Fixing UserEnrollment in profile stub and MDM.plist", v24, 2u);
          }
          objc_msgSend(v7, "setIsUserEnrollment:", 1);
          v10 = objc_msgSend(v4, "isInstalledForUser");
          if ((v10 & 1) != 0)
            v11 = MCUserProfileStorageDirectory();
          else
            v11 = MCSystemProfileStorageDirectory(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          v13 = MDMFilePath(objc_msgSend(v4, "writeStubToDirectory:", v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary MCDictionaryFromFile:](NSDictionary, "MCDictionaryFromFile:", v14));
          v16 = objc_msgSend(v15, "mutableCopy");

          objc_msgSend(v16, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMDMUserEnrollmentKey);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enrollmentID"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, kMDMEnrollmentIDKey);

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "iCloudEnrollmentID"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, kMDMiCloudEnrollmentIDKey);

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "easEnrollmentID"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, kMDMEASEnrollmentIDKey);

          v21 = MDMFilePath(v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          objc_msgSend(v16, "MCWriteToBinaryFile:", v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
          objc_msgSend(v23, "refreshDetailsFromDisk");

        }
      }
    }

  }
  objc_autoreleasePoolPop(v2);
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (MCNotifier)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_notifier, a3);
}

- (BOOL)systemProfileStorageWasMigratedFromLegacyStorage
{
  return self->_systemProfileStorageWasMigratedFromLegacyStorage;
}

- (void)setSystemProfileStorageWasMigratedFromLegacyStorage:(BOOL)a3
{
  self->_systemProfileStorageWasMigratedFromLegacyStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
