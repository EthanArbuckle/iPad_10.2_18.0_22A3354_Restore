@implementation MBKeyboardPlugin

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
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBKeyboardPlugin.m"), 21, CFSTR("Absolute path doesn't have domain root %@ as prefix: %@"), v15, v8);

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
    -[MBKeyboardPlugin _updatePathsForKeyboardDomainWithEngine:](self, "_updatePathsForKeyboardDomainWithEngine:", v4);

  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "isDeviceTransferEngine"))
    -[MBKeyboardPlugin _updatePathsForKeyboardDomainWithEngine:](self, "_updatePathsForKeyboardDomainWithEngine:", v5);

  return 0;
}

- (void)_removeRelativePathsFromPathsNotToBackup:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBKeyboardPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v12, v7));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relativePathsNotToBackup"));
        v15 = objc_msgSend(v14, "containsObject:", v13);

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relativePathsNotToBackup"));
          v17 = objc_msgSend(v16, "mutableCopy");

          v20 = MBGetDefaultLog(v18, v19);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v27 = v7;
            v28 = 2114;
            v29 = v12;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing \"%{public}@\" from relativePathsNotToBackup", buf, 0x16u);
            _MBLog(CFSTR("DEFAULT"), "%{public}@: Removing \"%{public}@\" from relativePathsNotToBackup", v7, v12);
          }

          objc_msgSend(v17, "removeObject:", v13);
          objc_msgSend(v7, "setRelativePathsNotToBackup:", v17);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

}

- (void)_removeRelativePathsFromPathsNotToRestore:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBKeyboardPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v12, v7));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relativePathsNotToRestore"));
        v15 = objc_msgSend(v14, "containsObject:", v13);

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relativePathsNotToRestore"));
          v17 = objc_msgSend(v16, "mutableCopy");

          v20 = MBGetDefaultLog(v18, v19);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v27 = v7;
            v28 = 2114;
            v29 = v12;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing \"%{public}@\" from relativePathsNotToRestore", buf, 0x16u);
            _MBLog(CFSTR("DEFAULT"), "%{public}@: Removing \"%{public}@\" from relativePathsNotToRestore", v7, v12);
          }

          objc_msgSend(v17, "removeObject:", v13);
          objc_msgSend(v7, "setRelativePathsNotToRestore:", v17);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

}

- (void)_addRelativePathsToPathsToBackupAndRestore:(id)a3 forDomain:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableSet *v14;
  NSMutableSet *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];

  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToBackupAndRestore"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToBackupAndRestore"));
          v14 = (NSMutableSet *)objc_msgSend(v13, "mutableCopy");

        }
        else
        {
          v15 = objc_opt_new(NSMutableSet);
          v14 = v15;
        }
        v17 = MBGetDefaultLog(v15, v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v24 = v6;
          v25 = 2114;
          v26 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToBackupAndRestore", buf, 0x16u);
          _MBLog(CFSTR("DEFAULT"), "%{public}@: Adding \"%{public}@\" to relativePathsToBackupAndRestore", v6, v11);
        }

        -[NSMutableSet addObject:](v14, "addObject:", CFSTR("Library/Keyboard"));
        objc_msgSend(v6, "setRelativePathsToBackupAndRestore:", v14);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

}

- (void)_updatePathsForKeyboardDomainWithEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableSet *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableSet *v15;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domainForName:", CFSTR("KeyboardDomain")));

  if (!v6)
    sub_100087928();
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing all paths from relativePathsNotToBackupToDrive", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "%{public}@: Removing all paths from relativePathsNotToBackupToDrive", v6);
  }

  v11 = objc_opt_new(NSMutableSet);
  objc_msgSend(v6, "setRelativePathsNotToBackupToDrive:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("Library/Keyboard"), CFSTR("Library/KeyboardServices/TextReplacements.db"), CFSTR("Library/KeyboardServices/TextReplacements.db-wal"), CFSTR("Library/KeyboardServices/TextReplacements.db-shm"), CFSTR("Library/Keyboard/CoreDataUbiquitySupport"), 0));
  -[MBKeyboardPlugin _removeRelativePathsFromPathsNotToBackup:forDomain:](self, "_removeRelativePathsFromPathsNotToBackup:forDomain:", v12, v6);
  -[MBKeyboardPlugin _removeRelativePathsFromPathsNotToRestore:forDomain:](self, "_removeRelativePathsFromPathsNotToRestore:forDomain:", v12, v6);
  objc_msgSend(v12, "removeObject:", CFSTR("Library/Keyboard/CoreDataUbiquitySupport"));
  -[MBKeyboardPlugin _addRelativePathsToPathsToBackupAndRestore:forDomain:](self, "_addRelativePathsToPathsToBackupAndRestore:forDomain:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToIgnoreExclusionsForDrive"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePathsToIgnoreExclusionsForDrive"));
    v15 = (NSMutableSet *)objc_msgSend(v14, "mutableCopy");

  }
  else
  {
    v16 = objc_opt_new(NSMutableSet);
    v15 = v16;
  }
  v18 = MBGetDefaultLog(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v6;
    v26 = 2114;
    v27 = CFSTR("Library/Keyboard");
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToIgnoreExclusionsForDrive", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "%{public}@: Adding \"%{public}@\" to relativePathsToIgnoreExclusionsForDrive", v6, CFSTR("Library/Keyboard"));
  }

  v20 = -[NSMutableSet addObject:](v15, "addObject:", CFSTR("Library/Keyboard"));
  v22 = MBGetDefaultLog(v20, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v6;
    v26 = 2114;
    v27 = CFSTR("Library/KeyboardServices");
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToIgnoreExclusionsForDrive", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "%{public}@: Adding \"%{public}@\" to relativePathsToIgnoreExclusionsForDrive", v6, CFSTR("Library/KeyboardServices"));
  }

  -[NSMutableSet addObject:](v15, "addObject:", CFSTR("Library/KeyboardServices"));
  objc_msgSend(v6, "setRelativePathsToIgnoreExclusionsForDrive:", v15);

}

@end
