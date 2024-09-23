@implementation BKMigrator

- (void)migrateIfNecessary
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL8 v7;
  int v8;
  double v9;

  DMProgressHostIsReady(self, a2);
  v3 = BSContinuousMachTimeNow(-[BKMigrator _migrateBackBoard](self, "_migrateBackBoard"));
  v4 = DMPerformMigrationIfNeeded();
  v5 = BKLogCommon(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    v8 = 134217984;
    v9 = BSContinuousMachTimeNow(v7) - v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migration complete (if performed). (Elapsed time: %.2f seconds)", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_migrateBackBoard
{
  id v2;

  -[BKMigrator _removeUnusedFiles](self, "_removeUnusedFiles");
  v2 = (id)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  objc_msgSend(v2, "migrateDefaultsIfNecessary");

}

- (void)_removeUnusedFiles
{
  int v3;
  int *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];

  v3 = open((const char *)objc_msgSend(CFSTR("/tmp/RestoreRunning"), "fileSystemRepresentation"), 36);
  if (v3 != -1)
  {
    close(v3);
    goto LABEL_6;
  }
  v4 = __error();
  if (*v4 != 35)
  {
LABEL_6:
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("~/Library/Calendar/Calendar.sqlitedb.restored"), CFSTR("~/Library/AddressBook/AddressBook.sqlitedb.restored"), CFSTR("~/Library/AddressBook/AddressBookImages.sqlitedb.restored"), CFSTR("~/Library/SpringBoard/IconState.plist.restored"), CFSTR("~/Library/Preferences/com.apple.springboard.plist.restored"), 0));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "stringByExpandingTildeInPath"));
          -[BKMigrator _moveRestoredFileAtPath:](self, "_moveRestoredFileAtPath:", v11);

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }
    goto LABEL_13;
  }
  v5 = BKLogCommon(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "A restore is currently running. Waiting to move restored preferences into place until later", buf, 2u);
  }
LABEL_13:

}

- (BOOL)_moveRestoredFileAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByDeletingPathExtension"));
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v3);
  if ((_DWORD)v6)
  {
    v7 = BKLogCommon(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v3;
      v18 = 2114;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Moving restored file into place from %{public}@ to %{public}@", buf, 0x16u);
    }

    objc_msgSend(v4, "removeItemAtPath:error:", v5, 0);
    v15 = 0;
    v9 = objc_msgSend(v4, "moveItemAtPath:toPath:error:", v3, v5, &v15);
    v10 = v15;
    v11 = v10;
    if ((v9 & 1) == 0)
    {
      v12 = BKLogCommon(v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v17 = v3;
        v18 = 2114;
        v19 = v5;
        v20 = 2114;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to move file at path %{public}@ to %{public}@: %{public}@", buf, 0x20u);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
