@implementation MILaunchServicesOperationManager

- (id)_lsApplicationWorkspaceInstance
{
  return +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
}

+ (id)_appReferenceManagerInstance
{
  return +[MIAppReferenceManager defaultManager](MIAppReferenceManager, "defaultManager");
}

- (id)_diskImageManagerInstance
{
  return +[MIDiskImageManager sharedInstance](MIDiskImageManager, "sharedInstance");
}

+ (id)_registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  int v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!objc_msgSend(a1, "appReferencesEnabled")
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance")),
        v16 = objc_msgSend(v15, "isSharediPad"),
        v15,
        (v16 & 1) != 0))
  {
    v17 = 0;
    goto LABEL_4;
  }
  v22 = sub_10000B4F8();
  v17 = 0;
  if (a6 - 1 > 1
    || !v22
    || (v23 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForSystemSharedContent](MILaunchServicesOperationManager, "instanceForSystemSharedContent")), v26 = 0, v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "registerInstalledInfo:forAppBundleID:personas:inDomain:error:", v12, v13, v14, a6, &v26)), v17 = v26, v24, v23, v24))
  {
LABEL_4:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForCurrentUser](MILaunchServicesOperationManager, "instanceForCurrentUser"));
    v25 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "registerInstalledInfo:forAppBundleID:personas:inDomain:error:", v12, v13, v14, a6, &v25));
    v20 = v25;

    v17 = v20;
    if (!a7)
      goto LABEL_7;
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_100052B3C();
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "+[MILaunchServicesOperationManager _registerInstalledInfo:forAppBundleID:personas:inDomain:error:]", CFSTR("Failed to register installation record in system domain for %@ : %@"));
  v19 = 0;
  if (a7)
  {
LABEL_5:
    if (!v19)
      *a7 = objc_retainAutorelease(v17);
  }
LABEL_7:

  return v19;
}

+ (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_msgSend((id)objc_opt_class(a1), "_registerInstalledInfo:forAppBundleID:personas:inDomain:error:", v14, v13, v12, a6, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

+ (id)registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
  if (!objc_msgSend(a1, "appReferencesEnabled"))
  {
    v16 = 0;
    goto LABEL_6;
  }
  v12 = sub_10000B4F8();
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_appReferenceManagerInstance"));
  v29 = 0;
  v30 = 0;
  v14 = objc_msgSend(v13, "addReferenceForIdentity:inDomain:forUserWithID:resultingPersonaUniqueStrings:error:", v10, a5, v12, &v30, &v29);
  v15 = v30;
  v16 = v29;

  if ((v14 & 1) != 0)
  {
    if (v15)
    {
LABEL_7:
      v28 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_registerInstalledInfo:forAppBundleID:personas:inDomain:error:", v9, v11, v15, a5, &v28));
      v20 = v16;
      v16 = v28;
      goto LABEL_8;
    }
LABEL_6:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaUniqueString"));
    v31 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));

    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    v25 = MIStringForInstallationDomain(a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 136316162;
    v33 = "+[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:]";
    v34 = 2112;
    v35 = v10;
    v36 = 2112;
    v37 = v26;
    v38 = 1024;
    v39 = v12;
    v40 = 2112;
    v41 = v16;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to add reference for %@ in %@ for client with uid %u : %@", buf, 0x30u);

  }
  v23 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v24 = MIStringForInstallationDomain(a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v24);
    MOLogWrite(v23, 3, "+[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:]", CFSTR("Failed to add reference for %@ in %@ for client with uid %u : %@"));
    v19 = 0;
LABEL_8:
    v21 = a6;

    if (!a6)
      goto LABEL_11;
    goto LABEL_9;
  }
  v19 = 0;
  v21 = a6;
  if (!a6)
    goto LABEL_11;
LABEL_9:
  if (!v19)
    *v21 = objc_retainAutorelease(v16);
LABEL_11:

  return v19;
}

+ (id)registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
  v25 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v9, a4, &v25));
  v11 = v25;
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundle"));
    if (v13)
    {
      v22 = a1;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personaUniqueString"));
      v24 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:](MILaunchServicesDatabaseGatherer, "fetchInfoForBundle:forPersona:inContainer:withError:", v13, v14, v10, &v24));
      v16 = v24;

      if (!v15)
      {
        v17 = 0;
        v11 = v16;
        if (!a5)
          goto LABEL_13;
        goto LABEL_11;
      }
      v23 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "registerInstalledInfo:forIdentity:inDomain:error:", v15, v8, a4, &v23));
      v18 = v23;
      v11 = v16;
    }
    else
    {
      v19 = sub_100010E50((uint64_t)"+[MILaunchServicesOperationManager registerUsingDiscoveredInfoForAppIdentity:inDomain:error:]", 160, MIInstallerErrorDomain, 36, 0, 0, CFSTR("Failed to find bundle in bundle container %@ for %@"), v12, (uint64_t)v10);
      v18 = (id)objc_claimAutoreleasedReturnValue(v19);
      v17 = 0;
      v15 = 0;
    }

    v11 = v18;
    if (!a5)
      goto LABEL_13;
  }
  else
  {
    v17 = 0;
    v13 = 0;
    v15 = 0;
    if (!a5)
      goto LABEL_13;
  }
LABEL_11:
  if (!v17)
    *a5 = objc_retainAutorelease(v11);
LABEL_13:
  v20 = v17;

  return v20;
}

+ (id)_instanceForUID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10009E008);
  v6 = (void *)qword_10009E000;
  if (!qword_10009E000)
  {
    v7 = objc_opt_new(NSMutableDictionary);
    v8 = (void *)qword_10009E000;
    qword_10009E000 = (uint64_t)v7;

    v6 = (void *)qword_10009E000;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));
  if (!v9)
  {
    v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithUID:", v3);
    objc_msgSend((id)qword_10009E000, "setObject:forKeyedSubscript:", v9, v5);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10009E008);

  return v9;
}

+ (id)instanceForCurrentUser
{
  return objc_msgSend(a1, "_instanceForUID:", sub_10000B4F8());
}

+ (id)instanceForSystemSharedContent
{
  void *v3;
  unsigned int v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
  v4 = objc_msgSend(v3, "isSharediPad");

  if (v4)
  {
    v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v5)
      sub_100052BB0(v5, v6, v7, v8, v9, v10, v11, v12);
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "+[MILaunchServicesOperationManager instanceForSystemSharedContent]", CFSTR("System Shared instance is not valid in a Shared iPad configuration."));
    v13 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_instanceForUID:", 0));
  }
  return v13;
}

- (MILaunchServicesOperationManager)initWithUID:(unsigned int)a3
{
  MILaunchServicesOperationManager *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *pendingOperations;
  NSUUID *v11;
  NSUUID *instanceID;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MILaunchServicesOperationManager;
  v4 = -[MILaunchServicesOperationManager init](&v14, "init");
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.installd.LSOperationManager", v6);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new(NSMutableDictionary);
    pendingOperations = v4->_pendingOperations;
    v4->_pendingOperations = v9;

    v4->_serialNumber = 1;
    v11 = objc_opt_new(NSUUID);
    instanceID = v4->_instanceID;
    v4->_instanceID = v11;

    v4->_targetUID = a3;
  }
  return v4;
}

+ (BOOL)appReferencesEnabled
{
  return +[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled");
}

- (NSURL)storageBaseURL
{
  void *v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (-[MILaunchServicesOperationManager targetUID](self, "targetUID")
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance")),
        v3 = objc_msgSend(v2, "isSharediPad"),
        v2,
        !v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentUserLaunchServicesOperationStorageBaseURL"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchServicesOperationStorageBaseURL"));
  }
  v6 = (void *)v5;

  return (NSURL *)v6;
}

- (NSURL)instanceStorageBaseURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager storageBaseURL](self, "storageBaseURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager instanceID](self, "instanceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v5, 1));

  return (NSURL *)v6;
}

- (NSURL)lookAsideStorageBaseURL
{
  void *v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (-[MILaunchServicesOperationManager targetUID](self, "targetUID")
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance")),
        v3 = objc_msgSend(v2, "isSharediPad"),
        v2,
        !v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentUserLaunchServicesOperationLookAsideStorageBaseURL"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchServicesOperationLookAsideStorageBaseURL"));
  }
  v6 = (void *)v5;

  return (NSURL *)v6;
}

- (BOOL)_createStorageBaseDirectoryWithError:(id *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned __int8 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager storageBaseURL](self, "storageBaseURL"));
  v7 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:", v6, 0, 493, 4, a3);

  v8 = 0;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager instanceStorageBaseURL](self, "instanceStorageBaseURL"));
    v8 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:", v9, 0, 493, 4, a3);

  }
  return v8;
}

- (id)_storageURLForOperationSerialNumber:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager instanceStorageBaseURL](self, "instanceStorageBaseURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu.plist"), a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 0));

  return v6;
}

+ (BOOL)_writeLaunchServicesOperation:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v16;
  id v17;

  v7 = a4;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v17));
  v9 = v17;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v11 = objc_msgSend(v10, "uid");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v16 = v9;
    v13 = objc_msgSend(v8, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:", v7, 420, v11, objc_msgSend(v12, "gid"), 4, 1, &v16);
    v14 = v16;

    v9 = v14;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v13 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if ((v13 & 1) == 0)
    *a5 = objc_retainAutorelease(v9);
LABEL_7:

  return v13;
}

- (BOOL)_onQueue_journalLaunchServicesOperation:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  id v14;
  id v15;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager _storageURLForOperationSerialNumber:](self, "_storageURLForOperationSerialNumber:", objc_msgSend(v6, "serialNumber")));
  v15 = 0;
  v9 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:](self, "_createStorageBaseDirectoryWithError:", &v15);
  v10 = v15;
  if ((v9 & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _onQueue_journalLaunchServicesOperation:error:]", CFSTR("Failed to create storage base dir: %@"));

    v10 = 0;
  }
  v14 = v10;
  v11 = objc_msgSend((id)objc_opt_class(self), "_writeLaunchServicesOperation:toURL:error:", v6, v8, &v14);
  v12 = v14;

  if (a4 && (v11 & 1) == 0)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (BOOL)_onQueue_deleteLaunchServicesOperationForSerialNumber:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v13;

  v7 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager _storageURLForOperationSerialNumber:](self, "_storageURLForOperationSerialNumber:", a3));
  v13 = 0;
  v10 = objc_msgSend(v8, "removeItemAtURL:error:", v9, &v13);
  v11 = v13;

  if ((v10 & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _onQueue_deleteLaunchServicesOperationForSerialNumber:error:]", CFSTR("Failed to remove registration for %lu : %@"));
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v10;
}

- (BOOL)_onQueue_addPendingLaunchServicesOperation:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  id v15;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager pendingOperations](self, "pendingOperations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operationUUID"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  if (objc_msgSend(v8, "count") == (id)1)
  {
    v10 = (void *)os_transaction_create("com.apple.installd.pendingLSOperation");
    -[MILaunchServicesOperationManager setPendingOperationTransaction:](self, "setPendingOperationTransaction:", v10);

  }
  v15 = 0;
  v11 = -[MILaunchServicesOperationManager _onQueue_journalLaunchServicesOperation:error:](self, "_onQueue_journalLaunchServicesOperation:error:", v6, &v15);
  v12 = v15;
  v13 = v12;
  if (v11)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      MOLogWrite(qword_10009E048, 5, "-[MILaunchServicesOperationManager _onQueue_addPendingLaunchServicesOperation:error:]", CFSTR("Added pending LS operation %@"));
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v12);
  }

  return v11;
}

- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3 dueToLSSave:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager pendingOperations](self, "pendingOperations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v12));
  if (!v8)
  {
    v9 = qword_10009E048;
    if (v4)
    {
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_21;
      v10 = CFSTR("LS reported save for unknown operation UUID %@");
    }
    else
    {
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_21;
      v10 = CFSTR("Ignoring attempt to remove unknown operation UUID %@");
    }
    v11 = 3;
    goto LABEL_20;
  }
  objc_msgSend(v7, "removeObjectForKey:", v12);
  -[MILaunchServicesOperationManager _onQueue_deleteLaunchServicesOperationForSerialNumber:error:](self, "_onQueue_deleteLaunchServicesOperationForSerialNumber:error:", objc_msgSend(v8, "serialNumber"), 0);
  if (!objc_msgSend(v7, "count"))
    -[MILaunchServicesOperationManager setPendingOperationTransaction:](self, "setPendingOperationTransaction:", 0);
  v9 = qword_10009E048;
  if (v4)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v10 = CFSTR("Removing operation after LS save: %@");
LABEL_15:
      v11 = 5;
LABEL_20:
      MOLogWrite(v9, v11, "-[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:]", v10);
    }
  }
  else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v10 = CFSTR("Removed operation: %@");
    goto LABEL_15;
  }
LABEL_21:

}

- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3
{
  -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:](self, "_onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:", a3, 0);
}

- (void)_onQueue_handleLaunchServicesOperationFailureForUUID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v8);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_100052C24();
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v9 = v6;
    v10 = v7;
    MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _onQueue_handleLaunchServicesOperationFailureForUUID:error:]", CFSTR("LaunchServices reported failure when saving LS operation UUID %@ : %@"));
  }
  -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:](self, "_onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:", v6, 0, v9, v10);

}

- (unint64_t)serialNumber
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_serialNumber;
}

- (unint64_t)_onQueue_nextSerialNumber
{
  NSObject *v3;
  unint64_t result;

  v3 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  result = -[MILaunchServicesOperationManager serialNumber](self, "serialNumber");
  ++self->_serialNumber;
  return result;
}

+ (id)_mostRecentInstanceDirURLWithinURL:(id)a3
{
  id v3;
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  unsigned int v8;
  NSMutableArray *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v17;
  id v18;
  id v19;
  NSMutableArray *v20;
  void *v21;
  id v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _QWORD v30[4];
  id v31;
  NSMutableArray *v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[5];
  id v42;
  _BYTE v43[128];

  v22 = a3;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", CFSTR("MostRecent"), 1));
  v20 = objc_opt_new(NSMutableArray);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_100048978;
  v41[4] = sub_100048988;
  v42 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3032000000;
  v38 = sub_100048978;
  v39 = sub_100048988;
  v40 = 0;
  if (objc_msgSend(v21, "itemExistsAtURL:", obj))
  {
    v3 = obj;
  }
  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100048990;
    v30[3] = &unk_100085918;
    v4 = v21;
    v31 = v4;
    v33 = v41;
    v34 = &v35;
    v5 = v20;
    v32 = v5;
    v6 = objc_msgSend(v4, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v22, 1, v30);
    v7 = v36[5];
    if (v7)
    {
      v29 = 0;
      v8 = objc_msgSend(v4, "moveItemAtURL:toURL:error:", v7, obj, &v29);
      v19 = v29;
      if (v8)
      {
        objc_storeStrong(v36 + 5, obj);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_100052C98();
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v17 = v19;
          MOLogWrite(qword_10009E048, 3, "+[MILaunchServicesOperationManager _mostRecentInstanceDirURLWithinURL:]", CFSTR("Failed to rename identified most recent instance dir: %@"));
        }
      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = v5;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            v24 = 0;
            v14 = objc_msgSend(v4, "removeItemAtURL:error:", v13, &v24, v17, v18);
            v15 = v24;
            if ((v14 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
            {
              v17 = v13;
              v18 = v15;
              MOLogWrite(qword_10009E048, 3, "+[MILaunchServicesOperationManager _mostRecentInstanceDirURLWithinURL:]", CFSTR("Failed to remove old instance directory at %@ : %@"));
            }

          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
        }
        while (v10);
      }

      v3 = v36[5];
    }
    else
    {
      v19 = 0;
      v3 = 0;
    }

  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(v41, 8);
  return v3;
}

- (id)_setUpLookAsideAtDirAndFindMostRecentInstance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  id v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  unsigned __int8 v19;
  id v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  id v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  void *v37;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager storageBaseURL](self, "storageBaseURL"));
  if (objc_msgSend(v5, "itemDoesNotExistOrIsNotDirectoryAtURL:", v4))
  {
    objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);
    v7 = objc_msgSend((id)objc_opt_class(self), "_mostRecentInstanceDirURLWithinURL:", v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      v9 = (void *)v8;
      v51 = 0;
      v52 = &v51;
      v53 = 0x2020000000;
      v54 = 0;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_1000491F4;
      v50[3] = &unk_100085940;
      v50[4] = &v51;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v8, 1, v50));
      if (v10)
      {
        v11 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
          v42 = v10;
          MOLogWrite(v11, 3, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Failed to enumerate most recent instance dir %@ : %@"));

        }
      }
      if (*((_BYTE *)v52 + 24))
      {
        v47 = 0;
        v12 = objc_msgSend(v5, "moveItemAtURL:toURL:error:", v6, v4, &v47);
        v13 = v47;
        if ((v12 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            sub_100052DF4();
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Failed to move operation storage base to look aside: %@"));
          v17 = 0;
          v18 = 1;
LABEL_69:

          _Block_object_dispose(&v51, 8);
          if (v18)
            goto LABEL_70;
LABEL_71:
          v17 = v17;
          v37 = v17;
          goto LABEL_72;
        }
        v46 = 0;
        v14 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:](self, "_createStorageBaseDirectoryWithError:", &v46);
        v15 = v46;
        if ((v14 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            sub_100052D0C();
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v39 = v15;
            MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Failed to re-create operation storage base: %@"));
          }
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent", v39, v42));
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v16, 1));

        v18 = 0;
      }
      else
      {
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
          MOLogWrite(qword_10009E048, 5, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("LS operation journal is empty; nothing to reconcile"));
        v49 = 0;
        v35 = objc_msgSend(v5, "removeItemAtURL:keepParent:error:", v6, 1, &v49, v39, v42);
        v13 = v49;
        if ((v35 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            sub_100052D80();
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v41 = v13;
            MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Failed to clear out LS operation storage base dir: %@"));
          }
        }
        v48 = 0;
        v36 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:](self, "_createStorageBaseDirectoryWithError:", &v48, v41);
        v15 = v48;
        if ((v36 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            sub_100052D0C();
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Failed to re-create operation storage base: %@"));
        }
        v17 = 0;
        v18 = 1;
      }

      goto LABEL_69;
    }
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      MOLogWrite(qword_10009E048, 5, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Did not discover any LS operation journal instances to reconcile"));
  }
  else
  {
    v45 = 0;
    v19 = objc_msgSend(v5, "removeItemAtURL:keepParent:error:", v6, 1, &v45);
    v20 = v45;
    if ((v19 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_100052F50();
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v39 = v20;
        MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Failed to clear out old content in storage base: %@"));
      }
    }
    v44 = 0;
    v21 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:](self, "_createStorageBaseDirectoryWithError:", &v44, v39);
    v22 = v44;
    if ((v21 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_100052D0C();
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v40 = v22;
        MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Failed to re-create operation storage base: %@"));
      }
    }
    v23 = objc_msgSend((id)objc_opt_class(self), "_mostRecentInstanceDirURLWithinURL:", v4);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (v24)
    {
      v17 = (id)v24;

      goto LABEL_71;
    }
    v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v25)
      sub_100052EDC(v25, v26, v27, v28, v29, v30, v31, v32);
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Failed to locate most recent instance dir in LS operation lookaside dir; purging state"));
    v43 = v20;
    v33 = objc_msgSend(v5, "removeItemAtURL:keepParent:error:", v4, 0, &v43, v40);
    v34 = v43;

    if ((v33 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_100052E68();
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]", CFSTR("Failed to remove lookaside directory: %@"));
    }

  }
  v17 = 0;
LABEL_70:
  v37 = 0;
LABEL_72:

  return v37;
}

+ (BOOL)_shouldContinueAfterCheckingAttemptCountInDir:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("ReconcileAttempts.txt"), 0));
  v33 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfURL:encoding:error:](NSString, "stringWithContentsOfURL:encoding:error:", v5, 4, &v33));
  v7 = v33;
  v8 = v7;
  if (v6)
  {
    v9 = (char *)objc_msgSend(v6, "integerValue");
    if ((unint64_t)(v9 - 5) <= 0xFFFFFFFFFFFFFFFBLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_100053050((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v27 = v9;
        MOLogWrite(qword_10009E048, 3, "+[MILaunchServicesOperationManager _shouldContinueAfterCheckingAttemptCountInDir:]", CFSTR("Discovered %ld previous reconcile attempts; declaring defeat"));
      }
      objc_msgSend(v4, "removeItemAtURL:error:", v3, 0, v27);
LABEL_24:
      v22 = 0;
      goto LABEL_32;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v9 + 1));
    v32 = v8;
    v20 = objc_msgSend(v19, "writeToURL:atomically:encoding:error:", v5, 1, 4, &v32);
    v21 = v32;

    if (v20)
    {

      v22 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_1000530D0();
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v28 = v21;
        MOLogWrite(qword_10009E048, 3, "+[MILaunchServicesOperationManager _shouldContinueAfterCheckingAttemptCountInDir:]", CFSTR("Failed to write new count to previous reconcile attempts count: %@"));
      }
      objc_msgSend(v4, "removeItemAtURL:error:", v3, 0, v28);

      v22 = 0;
    }
    v8 = v21;
    goto LABEL_32;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  if (objc_msgSend(v17, "isEqualToString:", NSCocoaErrorDomain))
  {
    v18 = objc_msgSend(v8, "code");

    if (v18 == (id)260)
      goto LABEL_18;
  }
  else
  {

  }
  v23 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v30 = v8;
    MOLogWrite(v23, 3, "+[MILaunchServicesOperationManager _shouldContinueAfterCheckingAttemptCountInDir:]", CFSTR("Failed to read previous attempts file at %@ : %@"));

  }
LABEL_18:

  v31 = 0;
  v22 = 1;
  v24 = objc_msgSend(CFSTR("1"), "writeToURL:atomically:encoding:error:", v5, 1, 4, &v31);
  v8 = v31;
  if ((v24 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100052FC4(v5);
    v25 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path", v27, v30));
      MOLogWrite(v25, 3, "+[MILaunchServicesOperationManager _shouldContinueAfterCheckingAttemptCountInDir:]", CFSTR("Failed to write previous attempts file to %@ : %@"));

    }
    goto LABEL_24;
  }
LABEL_32:

  return v22;
}

+ (id)_operationFromURL:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v25;
  id v26;

  v5 = a3;
  v6 = objc_opt_class(MILaunchServicesOperation);
  v7 = objc_opt_class(MILaunchServicesRegisterOperation);
  v8 = objc_opt_class(MILaunchServicesSetPersonasOperation);
  v9 = objc_opt_class(MILaunchServicesUnregisterOperation);
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(MILaunchServicesUnregisterMountPointOperation), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v26 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v5, 3, &v26));
  v13 = v26;
  if (v12)
  {
    v25 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v11, v12, &v25));
    v15 = v25;

    if (v14)
      goto LABEL_8;
    v16 = (void *)MIInstallerErrorDomain;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v19 = sub_100010E50((uint64_t)"+[MILaunchServicesOperationManager _operationFromURL:error:]", 694, v16, 4, v15, 0, CFSTR("Failed to unarchive registration data from %@"), v18, (uint64_t)v17);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v13 = v15;
  }
  else
  {
    v21 = (void *)MIInstallerErrorDomain;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v23 = sub_100010E50((uint64_t)"+[MILaunchServicesOperationManager _operationFromURL:error:]", 688, v21, 4, v13, 0, CFSTR("Failed to read registration data from %@"), v22, (uint64_t)v17);
    v20 = objc_claimAutoreleasedReturnValue(v23);
  }
  v15 = (id)v20;

  if (a4)
  {
    v15 = objc_retainAutorelease(v15);
    v14 = 0;
    *a4 = v15;
  }
  else
  {
    v14 = 0;
  }
LABEL_8:

  return v14;
}

+ (id)_discoverOrderedJournalEntriesInInstanceDir:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *, int);
  void *v17;
  NSMutableArray *v18;
  id v19;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000498B8;
  v17 = &unk_100085968;
  v19 = a1;
  v7 = v5;
  v18 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v4, 1, &v14));

  if (v8)
  {
    v9 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
      v13 = v8;
      MOLogWrite(v9, 3, "+[MILaunchServicesOperationManager _discoverOrderedJournalEntriesInInstanceDir:]", CFSTR("Failed to enumerate %@ : %@"));

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v7, "sortedArrayUsingComparator:", &stru_1000859A8, v12, v13, v14, v15, v16, v17));

  return v10;
}

+ (void)_reconcileOperations:(id)a3 unregisterMountPoints:(id *)a4 registerMountPoints:(id *)a5 restartUniqueOperations:(id *)a6
{
  id v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  NSString *v27;
  char isKindOfClass;
  _BOOL4 v29;
  objc_class *v30;
  NSString *v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v43;
  id v44;
  NSMutableSet *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];

  v6 = a3;
  v7 = objc_opt_new(NSMutableSet);
  v8 = objc_opt_new(NSMutableSet);
  v9 = objc_opt_new(NSMutableDictionary);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v47;
    v44 = v10;
    v45 = v7;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v14);
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
          MOLogWrite(qword_10009E048, 5, "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoints:restartUniqueOperations:]", CFSTR("Reconciling pending LS operation %@"));
        objc_opt_class(MILaunchServicesUnregisterMountPointOperation);
        if ((objc_opt_isKindOfClass(v15) & 1) != 0)
        {
          v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mountPoint"));
          -[NSMutableSet removeObject:](v8, "removeObject:", v16);
          -[NSMutableSet addObject:](v7, "addObject:", v16);
LABEL_22:

          goto LABEL_23;
        }
        objc_opt_class(MILaunchServicesRegisterOperation);
        if ((objc_opt_isKindOfClass(v15) & 1) != 0)
        {
          v16 = v15;
          v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mountPoint"));
          if (v17)
          {
            -[NSMutableSet removeObject:](v7, "removeObject:", v17);
            -[NSMutableSet addObject:](v8, "addObject:", v17);
          }
          else
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleID"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v24);

          }
          goto LABEL_21;
        }
        objc_opt_class(MILaunchServicesUnregisterOperation);
        if ((objc_opt_isKindOfClass(v15) & 1) != 0)
        {
          v17 = v15;
          v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v16);
LABEL_21:

          goto LABEL_22;
        }
        objc_opt_class(MILaunchServicesSetPersonasOperation);
        if ((objc_opt_isKindOfClass(v15) & 1) != 0)
        {
          v16 = v15;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v18));
          if (v19)
          {
            objc_opt_class(MILaunchServicesRegisterOperation);
            if ((objc_opt_isKindOfClass(v19) & 1) != 0)
            {
              v20 = v19;
              v21 = v18;
              v22 = v9;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "personaUniqueStrings"));
              objc_msgSend(v20, "updatePersonaUniqueStrings:", v23);

              v10 = v44;
              v9 = v22;
              v18 = v21;
              goto LABEL_33;
            }
            objc_opt_class(MILaunchServicesSetPersonasOperation);
            if ((objc_opt_isKindOfClass(v19) & 1) != 0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v18);
LABEL_33:
              v7 = v45;
            }
            else
            {
              objc_opt_class(MILaunchServicesUnregisterOperation);
              isKindOfClass = objc_opt_isKindOfClass(v19);
              v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
              if ((isKindOfClass & 1) != 0)
              {
                v10 = v44;
                v7 = v45;
                if (v29)
                {
                  *(_DWORD *)buf = 136315394;
                  v51 = "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoint"
                        "s:restartUniqueOperations:]";
                  v52 = 2112;
                  v53 = v18;
                  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Encountered set personas operation for %@ after unregister operation", buf, 0x16u);
                }
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                  MOLogWrite(qword_10009E048, 3, "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoints:restartUniqueOperations:]", CFSTR("Encountered set personas operation for %@ after unregister operation"));
              }
              else
              {
                v7 = v45;
                if (v29)
                {
                  v35 = (objc_class *)objc_opt_class(v19);
                  v36 = NSStringFromClass(v35);
                  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
                  *(_DWORD *)buf = 136315650;
                  v51 = "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoint"
                        "s:restartUniqueOperations:]";
                  v52 = 2112;
                  v53 = v37;
                  v54 = 2112;
                  v55 = v18;
                  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Encountered unexpected LS operation of class %@ for bundle ID %@ before set personas operation", buf, 0x20u);

                }
                v10 = v44;
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                {
                  v43 = qword_10009E048;
                  v30 = (objc_class *)objc_opt_class(v19);
                  v31 = NSStringFromClass(v30);
                  v39 = (void *)objc_claimAutoreleasedReturnValue(v31);
                  MOLogWrite(v43, 3, "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoints:restartUniqueOperations:]", CFSTR("Encountered unexpected LS operation of class %@ for bundle ID %@ before set personas operation"));

                  v10 = v44;
                }
              }
            }
          }
          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v18);
          }

          goto LABEL_22;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          v32 = (objc_class *)objc_opt_class(v15);
          v33 = NSStringFromClass(v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          *(_DWORD *)buf = 136315394;
          v51 = "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoints:restar"
                "tUniqueOperations:]";
          v52 = 2112;
          v53 = v34;
          _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Encountered unknown class while enumerating saved operations: %@", buf, 0x16u);

        }
        v25 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v26 = (objc_class *)objc_opt_class(v15);
          v27 = NSStringFromClass(v26);
          v16 = (id)objc_claimAutoreleasedReturnValue(v27);
          MOLogWrite(v25, 3, "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoints:restartUniqueOperations:]", CFSTR("Encountered unknown class while enumerating saved operations: %@"));
          goto LABEL_22;
        }
LABEL_23:
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v38 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      v12 = v38;
    }
    while (v38);
  }

  *a4 = -[NSMutableSet copy](v7, "copy");
  *a5 = -[NSMutableSet copy](v8, "copy");
  *a6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v9, "allValues"));

}

- (void)_reconcileOperations:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
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
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  unsigned __int8 v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  id v36;
  id v37;
  unsigned __int8 v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  unsigned int v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id obj;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  _BYTE v72[24];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];

  v67 = 0;
  v68 = 0;
  v66 = 0;
  v49 = a3;
  objc_msgSend((id)objc_opt_class(self), "_reconcileOperations:unregisterMountPoints:registerMountPoints:restartUniqueOperations:", v49, &v68, &v67, &v66);
  v4 = v68;
  v47 = v67;
  v46 = v66;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v63;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v63 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v8);
        v61 = 0;
        v10 = -[MILaunchServicesOperationManager unregisterAppsAtMountPoint:error:](self, "unregisterAppsAtMountPoint:error:", v9, &v61, v43, v44);
        v11 = v61;
        if ((v10 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
            *(_DWORD *)buf = 136315650;
            v70 = "-[MILaunchServicesOperationManager _reconcileOperations:]";
            v71 = 2112;
            *(_QWORD *)v72 = v13;
            *(_WORD *)&v72[8] = 2112;
            *(_QWORD *)&v72[10] = v11;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to restart unregister operation for mount point %@ : %@", buf, 0x20u);

          }
          v12 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
            v44 = v11;
            MOLogWrite(v12, 3, "-[MILaunchServicesOperationManager _reconcileOperations:]", CFSTR("Failed to restart unregister operation for mount point %@ : %@"));

          }
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v6);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v14 = v47;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager _diskImageManagerInstance](self, "_diskImageManagerInstance", v43, v44));
        objc_msgSend(v20, "reregisterContentsAtMountPoint:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
    }
    while (v16);
  }
  v48 = v14;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v21 = v46;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v54;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v54 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v25);
        objc_opt_class(MILaunchServicesRegisterOperation);
        if ((objc_opt_isKindOfClass(v26) & 1) != 0)
        {
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleID"));
          v29 = objc_msgSend(v27, "domain");
          v52 = 0;
          v30 = -[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:](self, "registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:", v28, v29, 0, &v52);
          v31 = v52;
          if ((v30 & 1) != 0)
            goto LABEL_41;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            v41 = -[MILaunchServicesOperationManager targetUID](self, "targetUID");
            *(_DWORD *)buf = 136315906;
            v70 = "-[MILaunchServicesOperationManager _reconcileOperations:]";
            v71 = 1024;
            *(_DWORD *)v72 = v41;
            *(_WORD *)&v72[4] = 2112;
            *(_QWORD *)&v72[6] = v28;
            *(_WORD *)&v72[14] = 2112;
            *(_QWORD *)&v72[16] = v31;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to restart register operation for %u/%@ : %@", buf, 0x26u);
          }
          v32 = qword_10009E048;
          if (qword_10009E048)
          {
            if (*(int *)(qword_10009E048 + 44) < 3)
              goto LABEL_41;
          }
          v33 = (void *)-[MILaunchServicesOperationManager targetUID](self, "targetUID", v43, v44, v45);
          v44 = v28;
          v45 = v31;
          v43 = v33;
          v34 = v32;
          v35 = CFSTR("Failed to restart register operation for %u/%@ : %@");
          goto LABEL_40;
        }
        objc_opt_class(MILaunchServicesUnregisterOperation);
        if ((objc_opt_isKindOfClass(v26) & 1) == 0)
          goto LABEL_42;
        v36 = v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bundleID"));
        v37 = objc_msgSend(v36, "domain");
        v51 = 0;
        v38 = -[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:](self, "registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:", v28, v37, 0, &v51);
        v31 = v51;
        if ((v38 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            v42 = -[MILaunchServicesOperationManager targetUID](self, "targetUID");
            *(_DWORD *)buf = 136315906;
            v70 = "-[MILaunchServicesOperationManager _reconcileOperations:]";
            v71 = 1024;
            *(_DWORD *)v72 = v42;
            *(_WORD *)&v72[4] = 2112;
            *(_QWORD *)&v72[6] = v28;
            *(_WORD *)&v72[14] = 2112;
            *(_QWORD *)&v72[16] = v31;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to restart unregister operation for %u/%@ : %@", buf, 0x26u);
          }
          v39 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v40 = (void *)-[MILaunchServicesOperationManager targetUID](self, "targetUID", v43, v44, v45);
            v44 = v28;
            v45 = v31;
            v43 = v40;
            v34 = v39;
            v35 = CFSTR("Failed to restart unregister operation for %u/%@ : %@");
LABEL_40:
            MOLogWrite(v34, 3, "-[MILaunchServicesOperationManager _reconcileOperations:]", v35);
          }
        }
LABEL_41:

LABEL_42:
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    }
    while (v23);
  }

}

- (void)reconcile
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager lookAsideStorageBaseURL](self, "lookAsideStorageBaseURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:](self, "_setUpLookAsideAtDirAndFindMostRecentInstance:", v3));
  if (v5 && objc_msgSend((id)objc_opt_class(self), "_shouldContinueAfterCheckingAttemptCountInDir:", v3))
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "_discoverOrderedJournalEntriesInInstanceDir:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[MILaunchServicesOperationManager _reconcileOperations:](self, "_reconcileOperations:", v7);
    v10 = 0;
    v8 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v10);
    v9 = v10;
    if ((v8 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_1000531D0();
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager reconcile]", CFSTR("Failed to remove lookaside storage base: %@"));
    }

  }
}

- (void)purge
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager lookAsideStorageBaseURL](self, "lookAsideStorageBaseURL"));
  v16 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:keepParent:error:", v4, 0, &v16);
  v6 = v16;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000532D0(v4);
    v7 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
      v14 = v6;
      MOLogWrite(v7, 3, "-[MILaunchServicesOperationManager purge]", CFSTR("Failed to purge registration lookaside dir at %@ : %@"));

    }
    v6 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager storageBaseURL](self, "storageBaseURL", v12, v14));

  v15 = v6;
  v9 = objc_msgSend(v3, "removeItemAtURL:keepParent:error:", v8, 1, &v15);
  v10 = v15;

  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100053244(v8);
    v11 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      MOLogWrite(v11, 3, "-[MILaunchServicesOperationManager purge]", CFSTR("Failed to purge registration dir at %@ : %@"));

    }
  }

}

- (id)_onQueue_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  NSObject *v15;
  NSUUID *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  MILaunchServicesRegisterOperation *v20;
  id v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSUUID *v35;
  id v36;
  id v37;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  void *v41;
  NSUUID *v42;
  unsigned __int8 v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v48;
  void *v49;
  MILaunchServicesRegisterOperation *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  int v55;
  id v56;
  id v57;
  MILaunchServicesRegisterOperation *v58;
  id v60;
  id v61;
  id v62;
  _QWORD v63[5];
  id v64;
  NSUUID *v65;
  id v66;
  uint64_t *v67;
  id v68;
  char v69;
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;

  v13 = a3;
  v14 = a4;
  v60 = a5;
  v61 = a7;
  v15 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v15);

  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = sub_100048978;
  v75 = sub_100048988;
  v76 = 0;
  v16 = objc_opt_new(NSUUID);
  v17 = -[MILaunchServicesOperationManager targetUID](self, "targetUID");
  v18 = (void *)objc_opt_new(LSOperationRequestContext);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
  objc_msgSend(v18, "setTargetUserID:", v19);

  v20 = -[MILaunchServicesRegisterOperation initWithBundleID:domain:personas:mountPoint:operationUUID:serialNumber:]([MILaunchServicesRegisterOperation alloc], "initWithBundleID:domain:personas:mountPoint:operationUUID:serialNumber:", v60, a6, v61, v14, v16, -[MILaunchServicesOperationManager _onQueue_nextSerialNumber](self, "_onQueue_nextSerialNumber"));
  v70 = 0;
  LOBYTE(a6) = -[MILaunchServicesOperationManager _onQueue_addPendingLaunchServicesOperation:error:](self, "_onQueue_addPendingLaunchServicesOperation:error:", v20, &v70);
  v21 = v70;
  if ((a6 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000533D0();
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v50 = v20;
      v54 = v21;
      MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _onQueue_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:]", CFSTR("Failed to write journal operation %@ : %@"));
    }
  }
  v58 = v20;
  v69 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance", v50, v54));
  v23 = objc_msgSend(v22, "isRunningInTestMode:outError:", &v69, 0);
  if (v69)
    v24 = v23;
  else
    v24 = 0;
  if (v24 == 1)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v26 = objc_msgSend(v25, "isPlaceholder");

    if ((v26 & 1) == 0)
    {
      if (objc_msgSend(v22, "testFlagsAreSet:", 8))
      {
        v48 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bundleIdentifier"));
          MOLogWrite(v48, 5, "-[MILaunchServicesOperationManager _onQueue_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:]", CFSTR("Exiting before registering %@ with LS"));

        }
        exit(1);
      }
      if (objc_msgSend(v22, "testFlagsAreSet:", 16))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "testFileSentinelForSyncURL"));

        v68 = 0;
        LODWORD(v27) = objc_msgSend(&stru_100086E88, "writeToURL:atomically:encoding:error:", v28, 1, 4, &v68);
        v55 = v17;
        v56 = v13;
        v57 = v68;
        if ((_DWORD)v27)
        {
          while (1)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager", v51));
            v30 = objc_msgSend(v29, "itemExistsAtURL:", v28);

            if (!v30)
              break;
            v31 = qword_10009E048;
            if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "path"));
              MOLogWrite(v31, 5, "-[MILaunchServicesOperationManager _onQueue_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:]", CFSTR("%@ exists, waiting before registering the app with LS"));

            }
            sleep(1u);
          }
        }
        else
        {
          v32 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "path"));
            MOLogWrite(v32, 3, "-[MILaunchServicesOperationManager _onQueue_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:]", CFSTR("Failed to write to %@ : %@"));

          }
        }

        v13 = v56;
        LODWORD(v17) = v55;
      }
    }
  }
  v33 = v21;

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10004B064;
  v63[3] = &unk_1000859D0;
  v67 = &v71;
  v63[4] = self;
  v34 = (id)objc_claimAutoreleasedReturnValue(+[ICLBundleRecord bundleRecordArrayToInfoDictionaryArray:](ICLBundleRecord, "bundleRecordArrayToInfoDictionaryArray:", v13));
  v64 = v34;
  v35 = v16;
  v65 = v35;
  v36 = v18;
  v66 = v36;
  v37 = sub_10000B6A0(v63);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

  if (v72[5])
  {
    v39 = objc_msgSend((id)objc_opt_class(self), "appReferencesEnabled");
    if ((_DWORD)v17)
      v40 = v39;
    else
      v40 = 0;
    if (v61 && v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager _lsApplicationWorkspaceInstance](self, "_lsApplicationWorkspaceInstance"));
      v42 = objc_opt_new(NSUUID);
      v62 = v38;
      v43 = objc_msgSend(v41, "setPersonaUniqueStrings:forApplicationWithBundleIdentifier:operationUUID:requestContext:saveObserver:error:", v61, v60, v42, v36, 0, &v62);
      v44 = v62;

      if ((v43 & 1) != 0)
      {
        v38 = v44;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_10005335C();
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _onQueue_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:]", CFSTR("Failed to push persona unique strings for %@ to LaunchServices: %@"));

        v38 = 0;
      }
    }
  }
  else
  {
    -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:](self, "_onQueue_removePendingLaunchServicesOperationForUUID:", v35);
  }
  v45 = (void *)v72[5];
  if (a8 && !v45)
  {
    *a8 = objc_retainAutorelease(v38);
    v45 = (void *)v72[5];
  }
  v46 = v45;

  _Block_object_dispose(&v71, 8);
  return v46;
}

- (id)_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_100048978;
  v44 = sub_100048988;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_100048978;
  v38 = sub_100048988;
  v39 = 0;
  v18 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B2F8;
  block[3] = &unk_1000859F8;
  v31 = &v40;
  block[4] = self;
  v19 = v14;
  v27 = v19;
  v20 = v15;
  v28 = v20;
  v21 = v16;
  v29 = v21;
  v33 = a6;
  v22 = v17;
  v30 = v22;
  v32 = &v34;
  dispatch_sync(v18, block);

  v23 = (void *)v41[5];
  if (a8 && !v23)
  {
    *a8 = objc_retainAutorelease((id)v35[5]);
    v23 = (void *)v41[5];
  }
  v24 = v23;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v24;
}

- (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7
{
  return -[MILaunchServicesOperationManager _registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:](self, "_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:", a3, 0, a4, a6, a5, a7);
}

- (id)registerInstalledInfoForBuiltInAppAtURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v18 = 0;
  v7 = objc_msgSend(objc_alloc((Class)MIExecutableBundle), "initWithBundleURL:error:", v6, &v18);

  v8 = v18;
  if (v7)
  {
    v17 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:](MILaunchServicesDatabaseGatherer, "fetchInfoForBundle:forPersona:inContainer:withError:", v7, 0, 0, &v17));
    v10 = v17;

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
      v16 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager registerInstalledInfo:forAppBundleID:personas:inDomain:error:](self, "registerInstalledInfo:forAppBundleID:personas:inDomain:error:", v9, v12, 0, 1, &v16));
      v8 = v16;

      if (!a4)
        goto LABEL_10;
    }
    else
    {
      v13 = 0;
      v8 = v10;
      if (!a4)
        goto LABEL_10;
    }
  }
  else
  {
    v9 = 0;
    v13 = 0;
    if (!a4)
      goto LABEL_10;
  }
  if (!v13)
    *a4 = objc_retainAutorelease(v8);
LABEL_10:
  v14 = v13;

  return v14;
}

- (id)registerInstalledInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  NSSet *v17;
  void *v18;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v14 = objc_msgSend(v13, "deviceHasPersonas");

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primaryPersonaString"));
    v17 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v16));

  }
  else
  {
    v17 = objc_opt_new(NSSet);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager _registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:](self, "_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:", v12, v11, v10, 3, v17, a6));

  return v18;
}

- (BOOL)registerUsingDiscoveredInformationForAppBundleID:(id)a3 inDomain:(unint64_t)a4 resultingRecordPromise:(id *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  unsigned int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id *v37;
  id *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v10 = a3;
  v43 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v10, a4, &v43));
  v12 = v43;
  v13 = v12;
  if (v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundle"));
    if (v15)
    {
      v38 = a5;
      v41 = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:](MILaunchServicesDatabaseGatherer, "fetchInfoForBundle:forPersona:inContainer:withError:", v15, 0, v11, &v41));
      v17 = v41;

      if (!v16)
      {
        v21 = 0;
        v23 = 0;
        LOBYTE(v24) = 0;
        v13 = v17;
        goto LABEL_20;
      }
      v37 = a6;
      v18 = objc_msgSend((id)objc_opt_class(self), "_appReferenceManagerInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v40 = v17;
      v20 = objc_msgSend(v19, "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:", v10, a4, sub_10000B4F8(), &v40);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = v40;

      if (v21)
      {
        v39 = v22;
        v23 = (id)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager registerInstalledInfo:forAppBundleID:personas:inDomain:error:](self, "registerInstalledInfo:forAppBundleID:personas:inDomain:error:", v16, v10, v21, a4, &v39));
        v13 = v39;

        v24 = v23 != 0;
        goto LABEL_24;
      }
      v31 = (void *)MIInstallerErrorDomain;
      v32 = MIStringForInstallationDomain(a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = sub_100010E50((uint64_t)"-[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:]", 1157, v31, 4, v22, 0, CFSTR("Failed to fetch persona unique strings for %@ in domain %@"), v33, (uint64_t)v10);
      v13 = (id)objc_claimAutoreleasedReturnValue(v34);

      a6 = v37;
    }
    else
    {
      v30 = sub_100010E50((uint64_t)"-[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:]", 1146, MIInstallerErrorDomain, 36, 0, 0, CFSTR("Failed to find bundle in bundle container %@ for %@"), v14, (uint64_t)v11);
      v16 = 0;
      v25 = v13;
      v13 = (id)objc_claimAutoreleasedReturnValue(v30);
    }
    goto LABEL_18;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
  if (!objc_msgSend(v25, "isEqualToString:", MIContainerManagerErrorDomain))
  {
    v16 = 0;
    v15 = 0;
LABEL_18:

    v21 = 0;
    goto LABEL_19;
  }
  v38 = a5;
  v26 = objc_msgSend(v13, "code");

  if (v26 != (id)21)
  {
    v21 = 0;
    v16 = 0;
    v15 = 0;
LABEL_19:
    v23 = 0;
    LOBYTE(v24) = 0;
    goto LABEL_20;
  }
  v37 = a6;

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "builtInApplicationBundleIDs"));
  v29 = objc_msgSend(v28, "containsObject:", v10);

  if (v29)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      MOLogWrite(qword_10009E048, 5, "-[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:]", CFSTR("Not unregistering %@ since it is a built in app"));
    v13 = 0;
    v23 = 0;
    v15 = 0;
    v16 = 0;
    v21 = 0;
    v24 = 1;
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[LSPrecondition emptyPrecondition](LSPrecondition, "emptyPrecondition"));
    v42 = 0;
    v24 = -[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:](self, "unregisterAppForBundleID:inDomain:operationType:precondition:error:", v10, a4, 3, v35, &v42);
    v13 = v42;

    v23 = 0;
    v15 = 0;
    v16 = 0;
    v21 = 0;
  }
LABEL_24:
  a6 = v37;
  if (v38 && v24)
  {
    v23 = objc_retainAutorelease(v23);
    *v38 = v23;
    LOBYTE(v24) = 1;
    goto LABEL_27;
  }
LABEL_20:
  if (a6 && (v24 & 1) == 0)
  {
    v13 = objc_retainAutorelease(v13);
    *a6 = v13;
  }
LABEL_27:

  return v24;
}

- (BOOL)_onQueue_setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSUUID *v13;
  void *v14;
  void *v15;
  MILaunchServicesSetPersonasOperation *v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  id v20;
  NSUUID *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  BOOL v26;
  _QWORD v28[5];
  id v29;
  id v30;
  NSUUID *v31;
  id v32;
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v10 = a3;
  v11 = a4;
  v12 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v12);

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v13 = objc_opt_new(NSUUID);
  v14 = (void *)objc_opt_new(LSOperationRequestContext);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MILaunchServicesOperationManager targetUID](self, "targetUID")));
  objc_msgSend(v14, "setTargetUserID:", v15);

  v16 = -[MILaunchServicesSetPersonasOperation initWithBundleID:domain:personas:registrationUUID:serialNumber:]([MILaunchServicesSetPersonasOperation alloc], "initWithBundleID:domain:personas:registrationUUID:serialNumber:", v11, a5, v10, v13, -[MILaunchServicesOperationManager _onQueue_nextSerialNumber](self, "_onQueue_nextSerialNumber"));
  v34 = 0;
  v17 = -[MILaunchServicesOperationManager _onQueue_addPendingLaunchServicesOperation:error:](self, "_onQueue_addPendingLaunchServicesOperation:error:", v16, &v34);
  v18 = v34;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100053444();
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _onQueue_setPersonaUniqueStrings:forAppBundleID:inDomain:error:]", CFSTR("Failed to write journal operation %@ : %@"));
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10004BCD8;
  v28[3] = &unk_100085A20;
  v33 = &v35;
  v28[4] = self;
  v19 = v10;
  v29 = v19;
  v20 = v11;
  v30 = v20;
  v21 = v13;
  v31 = v21;
  v22 = v14;
  v32 = v22;
  v23 = sub_10000B6A0(v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  if (*((_BYTE *)v36 + 24))
  {
    v25 = 1;
  }
  else
  {
    -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:](self, "_onQueue_removePendingLaunchServicesOperationForUUID:", v21);
    v25 = *((unsigned __int8 *)v36 + 24);
    if (a6 && !*((_BYTE *)v36 + 24))
    {
      *a6 = objc_retainAutorelease(v24);
      v25 = *((unsigned __int8 *)v36 + 24);
    }
  }
  v26 = v25 != 0;

  _Block_object_dispose(&v35, 8);
  return v26;
}

- (BOOL)setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  BOOL v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100048978;
  v30 = sub_100048988;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if ((objc_msgSend((id)objc_opt_class(self), "appReferencesEnabled") & 1) != 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004BF1C;
    v16[3] = &unk_100085A48;
    v19 = &v22;
    v16[4] = self;
    v17 = v10;
    v18 = v11;
    v20 = &v26;
    v21 = a5;
    dispatch_sync(v12, v16);

    v13 = *((unsigned __int8 *)v23 + 24);
    if (a6 && !*((_BYTE *)v23 + 24))
    {
      *a6 = objc_retainAutorelease((id)v27[5]);
      v13 = *((unsigned __int8 *)v23 + 24);
    }
    v14 = v13 != 0;

  }
  else
  {
    v14 = 1;
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (BOOL)_onQueue_unregisterAppForBundleID:(id)a3 domain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  NSUUID *v15;
  void *v16;
  void *v17;
  MILaunchServicesUnregisterOperation *v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  NSUUID *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  BOOL v28;
  _QWORD v30[5];
  id v31;
  NSUUID *v32;
  id v33;
  id v34;
  uint64_t *v35;
  unsigned int v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v12 = a3;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v14);

  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v15 = objc_opt_new(NSUUID);
  v16 = (void *)objc_opt_new(LSOperationRequestContext);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MILaunchServicesOperationManager targetUID](self, "targetUID")));
  objc_msgSend(v16, "setTargetUserID:", v17);

  v18 = -[MILaunchServicesUnregisterOperation initWithBundleID:domain:registrationUUID:serialNumber:]([MILaunchServicesUnregisterOperation alloc], "initWithBundleID:domain:registrationUUID:serialNumber:", v12, a4, v15, -[MILaunchServicesOperationManager _onQueue_nextSerialNumber](self, "_onQueue_nextSerialNumber"));
  v37 = 0;
  v19 = -[MILaunchServicesOperationManager _onQueue_addPendingLaunchServicesOperation:error:](self, "_onQueue_addPendingLaunchServicesOperation:error:", v18, &v37);
  v20 = v37;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100053588();
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _onQueue_unregisterAppForBundleID:domain:operationType:precondition:error:]", CFSTR("Failed to write journal operation %@ : %@"));
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10004C314;
  v30[3] = &unk_100085A70;
  v35 = &v38;
  v30[4] = self;
  v21 = v12;
  v31 = v21;
  v22 = v15;
  v32 = v22;
  v36 = a5;
  v23 = v13;
  v33 = v23;
  v24 = v16;
  v34 = v24;
  v25 = sub_10000B6A0(v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  if (*((_BYTE *)v39 + 24))
  {
    v27 = 1;
  }
  else
  {
    -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:](self, "_onQueue_removePendingLaunchServicesOperationForUUID:", v22);
    v27 = *((unsigned __int8 *)v39 + 24);
    if (a7 && !*((_BYTE *)v39 + 24))
    {
      *a7 = objc_retainAutorelease(v26);
      v27 = *((unsigned __int8 *)v39 + 24);
    }
  }
  v28 = v27 != 0;

  _Block_object_dispose(&v38, 8);
  return v28;
}

- (BOOL)unregisterAppForBundleID:(id)a3 inDomain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  unsigned __int8 v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  BOOL v29;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD block[5];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  unint64_t v39;
  int v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _BYTE v48[56];

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a6;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  if (a4 == 1)
    a4 = 2;
  v41 = 0;
  v42[0] = &v41;
  v42[1] = 0x3032000000;
  v42[2] = sub_100048978;
  v42[3] = sub_100048988;
  v43 = 0;
  v14 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C7F0;
  block[3] = &unk_100085A98;
  v37 = &v44;
  block[4] = self;
  v15 = v12;
  v35 = v15;
  v39 = a4;
  v40 = v9;
  v16 = v13;
  v36 = v16;
  v38 = &v41;
  dispatch_sync(v14, block);

  if (*((_BYTE *)v45 + 24))
  {
    v17 = 0;
    goto LABEL_24;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v42[0] + 40), "domain"));
  if (objc_msgSend(v18, "isEqualToString:", LSApplicationWorkspaceErrorDomain))
  {
    v19 = objc_msgSend(*(id *)(v42[0] + 40), "code") == (id)117;

    if (v19)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v31 = v9;
        v32 = v16;
        MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]", CFSTR("Failed to unregister using operation type %d for precondition %@"));
      }
      v33 = 0;
      v20 = -[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:](self, "registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:", v15, a4, 0, &v33, v31, v32);
      v21 = v33;
      v22 = v21;
      *((_BYTE *)v45 + 24) = v20;
      if ((v20 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_1000535FC((uint64_t)v15, (uint64_t)v42, v9);
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]", CFSTR("Successfully registered the record for %@ from on-disk state after failing to unregister (Operation type %d) due to precondition validation failure %@"));
        v17 = 0;
      }
      else
      {
        v22 = v21;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_1000536A4();
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        {
          v17 = v22;
        }
        else
        {
          MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]", CFSTR("Failed to register information for %@ after precondition validation failure : %@"));
          v17 = v22;
        }
      }
      goto LABEL_23;
    }
  }
  else
  {

  }
  v17 = *(id *)(v42[0] + 40);
  v23 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    v24 = MIStringForInstallationDomain(a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    sub_100053718((uint64_t)v15, v25, (uint64_t)v17, (uint64_t)v48);
  }

  v26 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v27 = MIStringForInstallationDomain(a4);
    v22 = (id)objc_claimAutoreleasedReturnValue(v27);
    MOLogWrite(v26, 3, "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]", CFSTR("Failed to unregister record for %@ in domain %@ : %@"));
LABEL_23:

  }
LABEL_24:
  v28 = *((unsigned __int8 *)v45 + 24);
  if (a7 && !*((_BYTE *)v45 + 24))
  {
    *a7 = objc_retainAutorelease(v17);
    v28 = *((unsigned __int8 *)v45 + 24);
  }
  v29 = v28 != 0;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v44, 8);

  return v29;
}

- (BOOL)_onQueue_unregisterApplicationsAtMountPoint:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSUUID *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MILaunchServicesUnregisterMountPointOperation *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  MILaunchServicesUnregisterMountPointOperation *v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = objc_opt_new(NSUUID);
  v9 = sub_10000B4F8();
  v10 = (void *)objc_opt_new(LSOperationRequestContext);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9));
  objc_msgSend(v10, "setTargetUserID:", v11);

  v12 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v24 = (MILaunchServicesUnregisterMountPointOperation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    MOLogWrite(v12, 5, "-[MILaunchServicesOperationManager _onQueue_unregisterApplicationsAtMountPoint:error:]", CFSTR("Unregistering apps on %@"));

  }
  v13 = -[MILaunchServicesUnregisterMountPointOperation initWithMountPoint:operationUUID:serialNumber:]([MILaunchServicesUnregisterMountPointOperation alloc], "initWithMountPoint:operationUUID:serialNumber:", v6, v8, -[MILaunchServicesOperationManager _onQueue_nextSerialNumber](self, "_onQueue_nextSerialNumber"));
  v26 = 0;
  v14 = -[MILaunchServicesOperationManager _onQueue_addPendingLaunchServicesOperation:error:](self, "_onQueue_addPendingLaunchServicesOperation:error:", v13, &v26);
  v15 = v26;
  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_10005378C();
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v24 = v13;
      v25 = v15;
      MOLogWrite(qword_10009E048, 3, "-[MILaunchServicesOperationManager _onQueue_unregisterApplicationsAtMountPoint:error:]", CFSTR("Failed to write journal operation %@ : %@"));
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager _lsApplicationWorkspaceInstance](self, "_lsApplicationWorkspaceInstance", v24, v25));
  v17 = objc_msgSend(v16, "unregisterApplicationsAtMountPoint:operationUUID:saveObserver:requestContext:", v6, v8, self, v10);

  if ((v17 & 1) == 0)
  {
    -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:](self, "_onQueue_removePendingLaunchServicesOperationForUUID:", v8);
    v18 = (void *)MIInstallerErrorDomain;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v21 = sub_100010E50((uint64_t)"-[MILaunchServicesOperationManager _onQueue_unregisterApplicationsAtMountPoint:error:]", 1370, v18, 4, 0, 0, CFSTR("Failed to unregister applications at mount point %@"), v20, (uint64_t)v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (a4)
    {
      v15 = objc_retainAutorelease(v22);
      *a4 = v15;
    }
    else
    {
      v15 = v22;
    }
  }

  return v17;
}

- (BOOL)unregisterAppsAtMountPoint:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100048978;
  v20 = sub_100048988;
  v21 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004CC44;
  v12[3] = &unk_100084EF0;
  v14 = &v22;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  dispatch_sync(v7, v12);

  v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = *((unsigned __int8 *)v23 + 24);
  }
  v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)operationWithUUIDWasSaved:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004CD68;
  v7[3] = &unk_100084F18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  MIRunTransactionalTask(v5, "LS operation saved", v7);

}

- (void)operationWithUUID:(id)a3 didFailToSaveWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004CE3C;
  v11[3] = &unk_100084F68;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  MIRunTransactionalTask(v8, "LS operation failed to save", v11);

}

- (NSUUID)instanceID
{
  return self->_instanceID;
}

- (unsigned)targetUID
{
  return self->_targetUID;
}

- (NSMutableDictionary)pendingOperations
{
  return self->_pendingOperations;
}

- (OS_os_transaction)pendingOperationTransaction
{
  return self->_pendingOperationTransaction;
}

- (void)setPendingOperationTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOperationTransaction, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pendingOperationTransaction, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
}

@end
