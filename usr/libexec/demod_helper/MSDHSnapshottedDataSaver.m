@implementation MSDHSnapshottedDataSaver

- (void)rescueDataToShelterFromSnapshottedVolumes
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MSDHSnapshottedDataSaver generateItemDomainsToBeSheltered](self, "generateItemDomainsToBeSheltered"));
  -[MSDHSnapshottedDataSaver rescueDataBasedOnItemDomains:](self, "rescueDataBasedOnItemDomains:", v3);

}

- (void)rescueDataBasedOnItemDomains:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v15;
  uint64_t v16;
  void *i;
  const __CFString *v18;
  int64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *j;
  const __CFString *v27;
  void *v28;
  __CFString *v29;
  unsigned __int8 v30;
  id v31;
  NSObject *v32;
  _BOOL4 v33;
  unsigned __int8 v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *k;
  const __CFString *v45;
  unsigned __int8 v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  id v54;
  MSDHSnapshottedDataSaver *v55;
  NSObject *obj;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *context;
  void *v61;
  NSObject *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73;
  _BYTE v74[15];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  uint8_t v84[128];
  uint8_t buf[4];
  const __CFString *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];

  v54 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = sub_100024A40();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v86 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Rescuing needed files to data shelter at %{public}@", buf, 0xCu);
  }

  if (objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter")))
  {
    v83 = 0;
    v7 = objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"), &v83);
    v8 = v83;
    v9 = v8;
    if ((v7 & 1) == 0)
    {
      v53 = sub_100024A40();
      obj = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        sub_10002988C(v9, obj);
      goto LABEL_73;
    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }
  -[MSDHSnapshottedDataSaver moveBluetoothFilesToDataShelter](self, "moveBluetoothFilesToDataShelter");
  -[MSDHSnapshottedDataSaver moveSecondPartyAppFilesToDataShelter](self, "moveSecondPartyAppFilesToDataShelter");
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v54;
  v58 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v80;
    v55 = self;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v80 != v57)
          objc_enumerationMutation(obj);
        v59 = v11;
        v12 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v11);
        context = objc_autoreleasePoolPush();
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v62 = v12;
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v76;
          while (2)
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(_QWORD *)v76 != v16)
                objc_enumerationMutation(v62);
              v18 = *(const __CFString **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v4, "fileExistsAtPath:", v18))
              {
                v19 = -[MSDHSnapshottedDataSaver getFileSizeForItemAtPath:](self, "getFileSizeForItemAtPath:", v18);
                if (v19 < 0)
                {
                  v35 = sub_100024A40();
                  v36 = objc_claimAutoreleasedReturnValue(v35);
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v86 = v18;
                    _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to get file size for item: %{public}@", buf, 0xCu);
                  }

                  goto LABEL_54;
                }
                v15 = (const __CFString *)((char *)v15 + v19);
              }
            }
            v14 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
            if (v14)
              continue;
            break;
          }
        }
        else
        {
          v15 = 0;
        }

        v20 = sub_100024A40();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v86 = v15;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Total free disk space needed for current item domain: %{public, iec-bytes}llu", buf, 0xCu);
        }

        if (-[MSDHSnapshottedDataSaver canDeviceHaveEnoughSpaceForItemDomainWithSize:](self, "canDeviceHaveEnoughSpaceForItemDomainWithSize:", v15))
        {
          v72 = 0u;
          v70 = 0u;
          v71 = 0u;
          v69 = 0u;
          v62 = v62;
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v69, v91, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v70;
            v25 = v10;
            while (2)
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(_QWORD *)v70 != v24)
                  objc_enumerationMutation(v62);
                v27 = *(const __CFString **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"), "stringByAppendingPathComponent:", v27));
                v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByDeletingLastPathComponent"));
                v30 = objc_msgSend(v4, "fileExistsAtPath:", v27);
                v31 = sub_100024A40();
                v32 = objc_claimAutoreleasedReturnValue(v31);
                v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
                if ((v30 & 1) != 0)
                {
                  if (v33)
                  {
                    *(_DWORD *)buf = 138543362;
                    v86 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, ">>> Copying item from: '%{public}@'", buf, 0xCu);
                  }

                  v68 = v25;
                  v34 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v68);
                  v10 = v68;

                  if ((v34 & 1) == 0)
                  {
                    v37 = sub_100024A40();
                    v38 = objc_claimAutoreleasedReturnValue(v37);
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription"));
                      *(_DWORD *)buf = 138543618;
                      v86 = v29;
                      v87 = 2114;
                      v88 = v39;
                      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to create parent folder %{public}@ with error - %{public}@", buf, 0x16u);

                    }
                    goto LABEL_52;
                  }
                  if ((objc_msgSend(v4, "cloneFile:to:expectingHash:correctOwnership:", v27, v28, 0, 0) & 1) == 0)
                  {
                    v40 = sub_100024A40();
                    v38 = objc_claimAutoreleasedReturnValue(v40);
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription"));
                      *(_DWORD *)buf = 138543874;
                      v86 = v27;
                      v87 = 2114;
                      v88 = v28;
                      v89 = 2114;
                      v90 = v47;
                      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to copy item from %{public}@ to %{public}@ with error - %{public}@", buf, 0x20u);

                    }
LABEL_52:

LABEL_53:
                    self = v55;
                    goto LABEL_54;
                  }
                  objc_msgSend(v61, "addObject:", v28);
                  if (!+[MSDXattr setContentRoot:](MSDXattr, "setContentRoot:", v28))
                    goto LABEL_53;
                  v25 = v10;
                }
                else
                {
                  if (v33)
                  {
                    *(_DWORD *)buf = 138543362;
                    v86 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, ">>> Skipping non-existent item: %{public}@", buf, 0xCu);
                  }

                }
              }
              v23 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v69, v91, 16);
              if (v23)
                continue;
              break;
            }
            v10 = v25;
            self = v55;
          }
        }
        else
        {
          v48 = sub_100024A40();
          v62 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            sub_100029858(&v73, v74, v62);
LABEL_54:

          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v62 = v61;
          v41 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v65;
            while (2)
            {
              for (k = 0; k != v42; k = (char *)k + 1)
              {
                if (*(_QWORD *)v65 != v43)
                  objc_enumerationMutation(v62);
                v45 = *(const __CFString **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)k);
                if (objc_msgSend(v4, "fileExistsAtPath:", v45))
                {
                  v63 = v10;
                  v46 = objc_msgSend(v4, "removeItemAtPath:error:", v45, &v63);
                  v9 = v63;

                  if ((v46 & 1) == 0)
                  {
                    v50 = sub_100024A40();
                    v51 = objc_claimAutoreleasedReturnValue(v50);
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
                      *(_DWORD *)buf = 138543618;
                      v86 = v45;
                      v87 = 2114;
                      v88 = v52;
                      _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to clean up item %{public}@ with error - %{public}@", buf, 0x16u);

                    }
                    objc_autoreleasePoolPop(context);
                    goto LABEL_73;
                  }
                  v10 = v9;
                }
              }
              v42 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
              if (v42)
                continue;
              break;
            }
          }
        }

        objc_autoreleasePoolPop(context);
        v11 = v59 + 1;
      }
      while ((id)(v59 + 1) != v58);
      v49 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
      v58 = v49;
    }
    while (v49);
  }
  v9 = v10;
LABEL_73:

}

- (id)generateItemDomainsToBeSheltered
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[128];
  _QWORD v38[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(&off_10004DEC8, "count"))
    objc_msgSend(v3, "addObject:", &off_10004DEC8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v4, "addObject:", CFSTR("/private/var/mobile/Library/Biome"));
  objc_msgSend(v4, "addObject:", CFSTR("/private/var/db/biome"));
  objc_msgSend(v3, "addObject:", v4);
  v36 = 1;
  v5 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.powerlog", &v36);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Library")));

    -[NSObject addObject:](v7, "addObject:", v9);
    objc_msgSend(v3, "addObject:", v7);
    free(v6);

  }
  else
  {
    v10 = sub_100024A40();
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10002990C(&v36, v7, v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("/private/var/mobile/Library/AggregateDictionary")));
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), 0));
  v14 = v13;
  if (v13 && objc_msgSend(v13, "count"))
  {
    v30 = v4;
    v31 = v2;
    v15 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self BEGINSWITH 'log-aggregated-'")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self CONTAINS 'Analytics-'")));
    v29 = (void *)v15;
    v38[0] = v15;
    v38[1] = v28;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredArrayUsingPredicate:", v17));

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v23)));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v24));
          objc_msgSend(v3, "addObject:", v25);

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v21);
    }

    v4 = v30;
    v2 = v31;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v26, "addObject:", CFSTR("/private/var/db/diagnostics"));
  objc_msgSend(v26, "addObject:", CFSTR("/private/var/db/uuidtext"));
  objc_msgSend(v3, "addObject:", v26);

  return v3;
}

- (int64_t)getFileSizeForItemAtPath:(id)a3
{
  id v3;
  int v4;
  off_t st_size;
  id v6;
  NSObject *v7;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[2];
  stat v13;

  memset(&v13, 0, sizeof(v13));
  v3 = objc_retainAutorelease(a3);
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v13))
  {
    v9 = sub_100024A40();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100029A50();
    goto LABEL_9;
  }
  v4 = v13.st_mode & 0xF000;
  if (v4 == 0x8000)
  {
    st_size = v13.st_size;
    goto LABEL_11;
  }
  if (v4 != 0x4000)
  {
    v6 = sub_100024A40();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100029978();
LABEL_9:

LABEL_10:
    st_size = -1;
    goto LABEL_11;
  }
  v12[0] = 0;
  v12[1] = 0;
  if (dirstat_np(objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), 0, v12, 16))
  {
    v10 = sub_100024A40();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000299DC();

    goto LABEL_10;
  }
  st_size = v12[0];
LABEL_11:

  return st_size;
}

- (BOOL)canDeviceHaveEnoughSpaceForItemDomainWithSize:(int64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  char *v12;
  BOOL v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int64_t v25;

  v4 = (void *)MGCopyAnswer(CFSTR("DiskUsage"), 0);
  v5 = v4;
  if (!v4)
  {
    v15 = sub_100024A40();
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100029AC4(v6, v16, v17);
    goto LABEL_15;
  }
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", kMGQDiskUsageAmountDataAvailable));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kMGQDiskUsageAmountDataReserved));
  v8 = sub_100024A40();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
    v11 = v7 == 0;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100029AFC(v10, v18, v19);

LABEL_15:
    v13 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134218496;
    v21 = -[NSObject longLongValue](v6, "longLongValue");
    v22 = 2048;
    v23 = objc_msgSend(v7, "longLongValue");
    v24 = 2048;
    v25 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "dataAvailable:  %lld - dataReserved:  %lld - itemDomainSize:  %lld", (uint8_t *)&v20, 0x20u);
  }

  v12 = (char *)-[NSObject longLongValue](v6, "longLongValue");
  v13 = (uint64_t)v12 > (uint64_t)((char *)objc_msgSend(v7, "longLongValue") + a3);

LABEL_9:
  return v13;
}

- (void)moveBluetoothFilesToDataShelter
{
  -[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:](self, "movePreservedFilesToDataShelter:removeFilesOnSuccess:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter"), 0);
}

- (void)moveSecondPartyAppFilesToDataShelter
{
  -[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:](self, "movePreservedFilesToDataShelter:removeFilesOnSuccess:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter"), 1);
}

- (void)movePreservedFilesToDataShelter:(id)a3 removeFilesOnSuccess:(BOOL)a4
{
  _BOOL4 v4;
  char *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  char *v26;
  unsigned __int8 v27;
  id v28;
  NSObject *v29;
  char *v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  NSObject *v34;
  char *v35;
  int *v36;
  char *v37;
  int v38;
  int v39;
  id v40;
  id v41;
  id v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  id v48;
  id v49;
  NSObject *v50;
  unsigned __int8 v51;
  id v52;
  id v53;
  NSObject *v54;
  void *v55;
  __int128 v56;
  _BOOL4 v57;
  char *v58;
  id obj;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  char *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  char *v80;
  _BYTE v81[128];
  _QWORD v82[2];

  v4 = a4;
  v5 = (char *)a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = sub_100024A40();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v74 = v5;
    v75 = 1024;
    LODWORD(v76) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preserving files from %{public}@ - removeFilesOnSuccess:  %{BOOLean}d", buf, 0x12u);
  }
  v57 = v4;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
  v82[0] = NSURLIsRegularFileKey;
  v82[1] = NSURLIsDirectoryKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, v10, 0, &stru_100048C38));

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v11;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (!v62)
  {
    v38 = 0;
    v13 = 0;
    goto LABEL_40;
  }
  v58 = v5;
  v13 = 0;
  v60 = v6;
  v61 = *(_QWORD *)v70;
  *(_QWORD *)&v12 = 136315906;
  v56 = v12;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v70 != v61)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v14);
      v67 = 0;
      v68 = 0;
      v16 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v68, NSURLIsRegularFileKey, &v67, v56);
      v17 = v68;
      v18 = v67;

      if ((v16 & 1) == 0)
      {
        v40 = sub_100024A40();
        v34 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v44 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
          v45 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
          *(_DWORD *)buf = 138543618;
          v74 = v44;
          v75 = 2114;
          v76 = v45;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "getResourceValue NSURLIsRegularFileKey failed for %{public}@ with error %{public}@", buf, 0x16u);

        }
        v25 = 0;
        v26 = 0;
        v24 = 0;
        v20 = 0;
        goto LABEL_33;
      }
      v65 = 0;
      v66 = 0;
      v19 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v66, NSURLIsDirectoryKey, &v65);
      v20 = v66;
      v13 = v65;

      if ((v19 & 1) != 0)
      {
        if ((objc_msgSend(v17, "BOOLValue") & 1) == 0 && !objc_msgSend(v20, "BOOLValue")
          || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path")),
              v22 = +[MSDXattr isContentRoot:](MSDXattr, "isContentRoot:", v21),
              v21,
              !v22))
        {
          v25 = 0;
          v26 = 0;
          v24 = 0;
LABEL_22:
          v38 = 0;
          v39 = 1;
          goto LABEL_23;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", objc_msgSend(v58, "length")));

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"), "stringByAppendingPathComponent:", v24));
        v26 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByDeletingLastPathComponent"));
        if ((objc_msgSend(v60, "fileExistsAtPath:", v26) & 1) == 0)
        {
          v64 = v13;
          v27 = objc_msgSend(v60, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, 0, &v64);
          v18 = v64;

          if ((v27 & 1) == 0)
          {
            v42 = sub_100024A40();
            v34 = objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v43 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
              *(_DWORD *)buf = 138543618;
              v74 = v26;
              v75 = 2114;
              v76 = v43;
              _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to create parent folder %{public}@. Error: %{public}@", buf, 0x16u);

            }
            goto LABEL_33;
          }
          v13 = v18;
        }
        v28 = sub_100024A40();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
          *(_DWORD *)buf = 136315650;
          v74 = "-[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:]";
          v75 = 2114;
          v76 = v30;
          v77 = 2114;
          v78 = v25;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s - Clone item %{public}@ ==> %{public}@", buf, 0x20u);

        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
        v32 = objc_msgSend(v60, "cloneFile:to:expectingHash:correctOwnership:", v31, v25, 0, 0);

        if ((v32 & 1) != 0)
          goto LABEL_22;
        v33 = sub_100024A40();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
          v36 = __error();
          v37 = strerror(*v36);
          *(_DWORD *)buf = v56;
          v74 = "-[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:]";
          v75 = 2114;
          v76 = v35;
          v77 = 2114;
          v78 = v25;
          v79 = 2080;
          v80 = v37;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s - Failed to clone item %{public}@ ==> %{public}@ - Error:  %s", buf, 0x2Au);

        }
      }
      else
      {
        v41 = sub_100024A40();
        v34 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v46 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
          v47 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
          *(_DWORD *)buf = 138543618;
          v74 = v46;
          v75 = 2114;
          v76 = v47;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "getResourceValue NSURLIsDirectoryKey failed for %{public}@ with error %{public}@", buf, 0x16u);

        }
        v25 = 0;
        v26 = 0;
        v24 = 0;
      }
      v18 = v13;
LABEL_33:

      v39 = 0;
      v38 = 6;
      v13 = v18;
LABEL_23:

      if (!v39)
        goto LABEL_38;
      v14 = (char *)v14 + 1;
    }
    while (v62 != v14);
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    v62 = v48;
  }
  while (v48);
  v38 = 0;
LABEL_38:
  v5 = v58;
  v6 = v60;
LABEL_40:

  if (v38 || !v57)
  {
    v52 = v13;
  }
  else
  {
    v49 = sub_100024A40();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v74 = v5;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Remove preserved files from:  %{public}@", buf, 0xCu);
    }

    v63 = v13;
    v51 = objc_msgSend(v6, "removeItemAtPath:error:", v5, &v63);
    v52 = v63;

    if ((v51 & 1) == 0)
    {
      v53 = sub_100024A40();
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedDescription"));
        *(_DWORD *)buf = 136315650;
        v74 = "-[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:]";
        v75 = 2114;
        v76 = v5;
        v77 = 2114;
        v78 = v55;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%s - Failed to remove preserved files from:  %{public}@ - Error:  %{public}@", buf, 0x20u);

      }
    }
  }

}

- (BOOL)adjustContentUnder:(id)a3 userHomePath:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  char **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  __int128 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  unsigned __int8 v34;
  id v35;
  unsigned __int8 v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  BOOL v49;
  id v50;
  NSObject *v51;
  unsigned __int8 v52;
  id v53;
  NSObject *v54;
  id v55;
  id v57;
  id v58;
  id v59;
  void *v60;
  __int128 v61;
  NSObject *obj;
  id v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  char v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];

  v5 = a3;
  v64 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v78 = 0;
  if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v78))
    v7 = v78 == 0;
  else
    v7 = 1;
  v8 = &selRef_hasXattr_path_;
  v66 = v6;
  if (v7)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_40;
  }
  v77 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, &v77));
  v14 = v77;
  v15 = v14;
  if (!v13)
  {
    v57 = sub_100024A40();
    v47 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_100029BB4();
    v48 = 0;
    v9 = 0;
    v20 = 0;
    v11 = 0;
    goto LABEL_76;
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v16 = v13;
  v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
  if (!v17)
  {
    v9 = 0;
    v20 = 0;
    v11 = 0;
    goto LABEL_39;
  }
  v19 = v17;
  v9 = 0;
  v20 = 0;
  v11 = 0;
  v65 = *(_QWORD *)v74;
  *(_QWORD *)&v18 = 136315906;
  v61 = v18;
  obj = v16;
  do
  {
    v21 = 0;
    do
    {
      v22 = v11;
      v23 = v9;
      if (*(_QWORD *)v74 != v65)
        objc_enumerationMutation(obj);
      v24 = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v21), v61));

      v72 = v15;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "attributesOfItemAtPath:error:", v11, &v72));
      v25 = v72;

      if (!v9)
      {
        v53 = sub_100024A40();
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          sub_100029D3C();
        goto LABEL_64;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileType"));
      v27 = objc_msgSend(v26, "isEqualToString:", NSFileTypeSymbolicLink);

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"), "stringByAppendingPathComponent:", v64));
        if (!v28 || objc_msgSend(v11, "caseInsensitiveCompare:", v28))
        {

LABEL_32:
          v15 = v25;
          goto LABEL_33;
        }
        v29 = sub_100024A40();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v80 = (const char *)v28;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Found wormhole in staging to user volume: %@", buf, 0xCu);
        }

      }
      if (!+[MSDXattr isNotExtracted:](MSDXattr, "isNotExtracted:", v11))
      {
        -[MSDHSnapshottedDataSaver adjustContentUnder:userHomePath:](self, "adjustContentUnder:userHomePath:", v11, v64);
        goto LABEL_32;
      }
      v31 = objc_claimAutoreleasedReturnValue(-[MSDHSnapshottedDataSaver originalPathFor:](self, "originalPathFor:", v11));

      v32 = sub_100024A40();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = (const char *)v11;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@ is not extracted (under a content root), should use the original content.", buf, 0xCu);
      }

      v71 = v25;
      v34 = objc_msgSend(v66, "removeItemAtPath:error:", v11, &v71);
      v35 = v71;

      if ((v34 & 1) == 0)
      {
        v55 = sub_100024A40();
        v54 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          sub_100029DC4();
        v20 = (void *)v31;
        v25 = v35;
LABEL_64:
        v47 = obj;

        v48 = 0;
        v49 = 0;
        v15 = v25;
        v5 = v24;
        goto LABEL_65;
      }
      if (objc_msgSend(v66, "fileExistsAtPath:", v31))
      {
        v70 = v35;
        v36 = objc_msgSend(v66, "moveItemAtPath:toPath:error:", v31, v11, &v70);
        v15 = v70;

        if ((v36 & 1) == 0)
        {
          v37 = sub_100024A40();
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
            *(_DWORD *)buf = v61;
            v80 = "-[MSDHSnapshottedDataSaver adjustContentUnder:userHomePath:]";
            v81 = 2112;
            v82 = v31;
            v83 = 2112;
            v84 = v11;
            v85 = 2112;
            v86 = v39;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s: Could not move item %@ to %@.  Error:  %@", buf, 0x2Au);

          }
        }
        v20 = (void *)v31;
      }
      else
      {
        v20 = (void *)v31;
        v15 = v35;
      }
LABEL_33:
      v5 = v24;
      v21 = (char *)v21 + 1;
    }
    while (v19 != v21);
    v16 = obj;
    v40 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    v19 = v40;
  }
  while (v40);
LABEL_39:

  v10 = v20;
  v12 = v15;
  v6 = v66;
  v8 = &selRef_hasXattr_path_;
LABEL_40:
  if (!objc_msgSend(v8 + 467, "isContentRoot:", v5))
  {
    v48 = 0;
    v49 = 1;
    goto LABEL_67;
  }
  v41 = objc_msgSend(v8 + 467, "isContentRootToRemove:", v5);
  objc_msgSend(v8 + 467, "removeXattr:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHSnapshottedDataSaver originalPathFor:](self, "originalPathFor:", v5));

  if (!objc_msgSend(v6, "fileExistsAtPath:", v20))
    goto LABEL_44;
  v69 = v12;
  v42 = objc_msgSend(v6, "removeItemAtPath:error:", v20, &v69);
  v15 = v69;

  if ((v42 & 1) == 0)
  {
    v58 = sub_100024A40();
    v47 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_100029CBC();
    v48 = 0;
    goto LABEL_76;
  }
  v12 = v15;
  v6 = v66;
LABEL_44:
  if ((v41 & 1) == 0)
  {
    v50 = sub_100024A40();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v80 = (const char *)v5;
      v81 = 2112;
      v82 = (uint64_t)v20;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Moving content root item %@ to %@.", buf, 0x16u);
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByDeletingLastPathComponent"));
    v6 = v66;
    if ((objc_msgSend(v66, "fileExistsAtPath:isDirectory:", v48, &v78) & 1) == 0
      && !-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:](self, "createIntermdediateDirectoriesInPathAndRestoreAttributes:", v48))
    {
      v49 = 0;
      v10 = v20;
      goto LABEL_67;
    }
    v68 = v12;
    v52 = objc_msgSend(v66, "moveItemAtPath:toPath:error:", v5, v20, &v68);
    v15 = v68;

    if ((v52 & 1) != 0)
    {
      v49 = 1;
      goto LABEL_66;
    }
    v59 = sub_100024A40();
    v47 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
      *(_DWORD *)buf = 138412802;
      v80 = (const char *)v5;
      v81 = 2112;
      v82 = (uint64_t)v20;
      v83 = 2112;
      v84 = v60;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Cannot move %@ to %@.  Error:  %@", buf, 0x20u);

    }
LABEL_76:
    v49 = 0;
    goto LABEL_65;
  }
  v67 = v12;
  v43 = objc_msgSend(v6, "removeItemAtPath:error:", v5, &v67);
  v15 = v67;

  if ((v43 & 1) == 0)
  {
    v44 = sub_100024A40();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_100029C3C();

  }
  v46 = sub_100024A40();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = (const char *)v20;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Removed %@.", buf, 0xCu);
  }
  v48 = 0;
  v49 = 1;
LABEL_65:

LABEL_66:
  v10 = v20;
  v12 = v15;
  v6 = v66;
LABEL_67:

  return v49;
}

- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _BYTE *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - fullPath:  %@", buf, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = sub_10000AA34;
  v20 = sub_10000AA44;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathComponents"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000AA4C;
  v10[3] = &unk_100048BF8;
  v12 = buf;
  v8 = v6;
  v11 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  LOBYTE(v7) = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v14, 8);
  return (char)v7;
}

- (id)originalPathFor:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;
  NSObject *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"));
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"), "stringByStandardizingPath"));
    v7 = objc_msgSend(v3, "rangeOfString:", v6);
    v9 = v8;

  }
  else
  {
    v7 = v4;
    v9 = v5;
  }
  if (v7)
  {
    v12 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002A010();

    v10 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v9));
  }

  return v10;
}

@end
