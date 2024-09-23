@implementation MBScreenTimePlugin

- (id)_standardizePath:(id)a3 fromDomain:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByStandardizingPath"));
  if (objc_msgSend(v8, "isAbsolutePath"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
    v10 = objc_msgSend(v8, "hasPrefix:", v9);

    if ((v10 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBScreenTimePlugin.m"), 16, CFSTR("Absolute path doesn't have domain root %@ as prefix: %@"), v15, v8);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v11, "length") + 1));

    v8 = (void *)v12;
  }

  return v8;
}

- (id)startingBackupWithEngine:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isDeviceTransferEngine"))
    -[MBScreenTimePlugin _updatePathsForHomeDomainWithEngine:](self, "_updatePathsForHomeDomainWithEngine:", v4);

  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "isDeviceTransferEngine"))
    -[MBScreenTimePlugin _updatePathsForHomeDomainWithEngine:](self, "_updatePathsForHomeDomainWithEngine:", v5);

  return 0;
}

- (void)_updatePathsForHomeDomainWithEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSMutableSet *v18;
  NSMutableSet *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSMutableSet *v25;
  NSMutableSet *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const __CFString *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domainForName:", CFSTR("HomeDomain")));

  if (!v6)
    sub_100088E68();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MBScreenTimePlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", CFSTR("Library/Application Support/com.apple.remotemanagementd"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsNotToBackup"));
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsNotToBackup"));
    v11 = objc_msgSend(v10, "mutableCopy");

    v14 = MBGetDefaultLog(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v31 = v6;
      v32 = 2114;
      v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing \"%{public}@\" from relativePathsNotToBackup", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "%{public}@: Removing \"%{public}@\" from relativePathsNotToBackup", v6, v7);
    }

    objc_msgSend(v11, "removeObject:", v7);
    objc_msgSend(v6, "setRelativePathsNotToBackup:", v11);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToBackupAndRestore"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToBackupAndRestore"));
    v18 = (NSMutableSet *)objc_msgSend(v17, "mutableCopy");

  }
  else
  {
    v19 = objc_opt_new(NSMutableSet);
    v18 = v19;
  }
  v21 = MBGetDefaultLog(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v31 = v6;
    v32 = 2114;
    v33 = CFSTR("Library/Application Support/com.apple.remotemanagementd");
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToBackupAndRestore", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "%{public}@: Adding \"%{public}@\" to relativePathsToBackupAndRestore", v6, CFSTR("Library/Application Support/com.apple.remotemanagementd"));
  }

  -[NSMutableSet addObject:](v18, "addObject:", CFSTR("Library/Application Support/com.apple.remotemanagementd"));
  objc_msgSend(v6, "setRelativePathsToBackupAndRestore:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToIgnoreExclusionsForDrive"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToIgnoreExclusionsForDrive"));
    v25 = (NSMutableSet *)objc_msgSend(v24, "mutableCopy");

  }
  else
  {
    v26 = objc_opt_new(NSMutableSet);
    v25 = v26;
  }
  v28 = MBGetDefaultLog(v26, v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v31 = v6;
    v32 = 2114;
    v33 = CFSTR("Library/Application Support/com.apple.remotemanagementd");
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToIgnoreExclusionsForDrive", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "%{public}@: Adding \"%{public}@\" to relativePathsToIgnoreExclusionsForDrive", v6, CFSTR("Library/Application Support/com.apple.remotemanagementd"));
  }

  -[NSMutableSet addObject:](v25, "addObject:", CFSTR("Library/Application Support/com.apple.remotemanagementd"));
  objc_msgSend(v6, "setRelativePathsToIgnoreExclusionsForDrive:", v25);

}

@end
