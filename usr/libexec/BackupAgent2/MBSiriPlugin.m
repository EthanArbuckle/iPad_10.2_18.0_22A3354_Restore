@implementation MBSiriPlugin

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
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSiriPlugin.m"), 17, CFSTR("Absolute path doesn't have domain root %@ as prefix: %@"), v15, v8);

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
  unsigned int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSMutableSet *v26;
  NSMutableSet *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;

  v4 = a3;
  if (objc_msgSend(v4, "isDeviceTransferEngine")
    && -[MBSiriPlugin _deviceIsNonAopDevice](self, "_deviceIsNonAopDevice"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domainForName:", CFSTR("HomeDomain")));

    if (!v6)
      sub_100088BC0();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MBSiriPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", CFSTR("Library/VoiceTrigger/SAT"), v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToOnlyBackupEncrypted"));
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToOnlyBackupEncrypted"));
      v11 = objc_msgSend(v10, "mutableCopy");

      v14 = MBGetDefaultLog(v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v33 = v6;
        v34 = 2114;
        v35 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing \"%{public}@\" from relativePathsToOnlyBackupEncrypted", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), "%{public}@: Removing \"%{public}@\" from relativePathsToOnlyBackupEncrypted", v6, v7);
      }

      objc_msgSend(v11, "removeObject:", v7);
      objc_msgSend(v6, "setRelativePathsToOnlyBackupEncrypted:", v11);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToRestoreOnly"));
    v17 = objc_msgSend(v16, "containsObject:", v7);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToRestoreOnly"));
      v19 = objc_msgSend(v18, "mutableCopy");

      v22 = MBGetDefaultLog(v20, v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v33 = v6;
        v34 = 2114;
        v35 = v7;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing \"%{public}@\" from relativePathsToRestoreOnly", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), "%{public}@: Removing \"%{public}@\" from relativePathsToRestoreOnly", v6, v7);
      }

      objc_msgSend(v19, "removeObject:", v7);
      objc_msgSend(v6, "setRelativePathsToRestoreOnly:", v19);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsNotToRestore"));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsNotToRestore"));
      v26 = (NSMutableSet *)objc_msgSend(v25, "mutableCopy");

    }
    else
    {
      v27 = objc_opt_new(NSMutableSet);
      v26 = v27;
    }
    v29 = MBGetDefaultLog(v27, v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v6;
      v34 = 2114;
      v35 = CFSTR("Library/VoiceTrigger/SAT");
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsNotToRestore", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "%{public}@: Adding \"%{public}@\" to relativePathsNotToRestore", v6, CFSTR("Library/VoiceTrigger/SAT"));
    }

    -[NSMutableSet addObject:](v26, "addObject:", CFSTR("Library/VoiceTrigger/SAT"));
    objc_msgSend(v6, "setRelativePathsNotToRestore:", v26);

  }
  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const __CFString *v20;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isDeviceTransferEngine"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domainManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domainForName:", CFSTR("HomeDomain")));

    if (!v8)
      sub_100088BE8();
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePathsNotToRemoveIfNotRestored"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePathsNotToRemoveIfNotRestored"));
      v11 = (NSMutableSet *)objc_msgSend(v10, "mutableCopy");

    }
    else
    {
      v12 = objc_opt_new(NSMutableSet);
      v11 = v12;
    }
    v14 = MBGetDefaultLog(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = CFSTR("Library/VoiceTrigger/SAT");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsNotToRemoveIfNotRestored", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "%{public}@: Adding \"%{public}@\" to relativePathsNotToRemoveIfNotRestored", v8, CFSTR("Library/VoiceTrigger/SAT"));
    }

    -[NSMutableSet addObject:](v11, "addObject:", CFSTR("Library/VoiceTrigger/SAT"));
    objc_msgSend(v8, "setRelativePathsNotToRemoveIfNotRestored:", v11);

  }
  return 0;
}

- (BOOL)_deviceIsNonAopDevice
{
  id v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v2 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", CFSTR("iPhone5,1"), CFSTR("iPhone5,2"), CFSTR("iPhone5,3"), CFSTR("iPhone5,4"), CFSTR("iPhone6,1"), CFSTR("iPhone6,2"), CFSTR("iPhone7,1"), CFSTR("iPhone7,2"), CFSTR("iPad3,4"), CFSTR("iPad3,5"), CFSTR("iPad3,6"), CFSTR("iPad4,1"), CFSTR("iPad4,2"), CFSTR("iPad4,3"), CFSTR("iPad4,4"), CFSTR("iPad4,5"), CFSTR("iPad4,6"),
         CFSTR("iPad4,7"),
         CFSTR("iPad4,8"),
         CFSTR("iPad4,9"),
         CFSTR("iPad5,1"),
         CFSTR("iPad5,2"),
         CFSTR("iPad5,3"),
         CFSTR("iPad5,4"),
         CFSTR("iPad6,7"),
         CFSTR("iPad6,8"),
         CFSTR("iPad6,11"),
         CFSTR("iPad6,12"),
         0);
  v3 = MBProductType();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

@end
