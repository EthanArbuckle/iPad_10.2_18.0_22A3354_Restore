@implementation NWActivityDistributionStoreDescriptor

+ (id)withGroupAndOptions:(int64_t)a3 groupTarget:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  id v17;

  v5 = a4;
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136446978;
    v11 = "+[NWActivityDistributionStoreDescriptor withGroupAndOptions:groupTarget:]";
    v12 = 1024;
    v13 = 58;
    v14 = 2048;
    v15 = a3;
    v16 = 2112;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Initiating store descriptor for %ld and options %@", (uint8_t *)&v10, 0x26u);
  }

  v8 = -[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]([NWActivityDistributionStoreDescriptor alloc], "_initWithGroupAndOptions:groupTarget:", a3, v5);
  return v8;
}

- (id)_initWithGroupAndOptions:(int64_t)a3 groupTarget:(id)a4
{
  id v5;
  NWActivityDistributionStoreDescriptor *v6;
  void *v7;
  __CFString *v8;
  NSString *v9;
  NSString *v10;
  id v11;
  NSObject *v12;
  NSString *v13;
  NSString *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *i;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  NSString *backingStore;
  uint64_t v28;
  NSString *sqlTable;
  int v30;
  NWActivityDistributionStoreDescriptor *v31;
  id v32;
  NSObject *v33;
  id v35;
  id v36;
  NSObject *v37;
  NSString *v38;
  NSString *v39;
  __CFString *v40;
  void *v41;
  NWActivityDistributionStoreDescriptor *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  uint8_t v49[128];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  const __CFString *v55;

  v5 = a4;
  v48.receiver = self;
  v48.super_class = (Class)NWActivityDistributionStoreDescriptor;
  v6 = -[NWActivityDistributionStoreDescriptor init](&v48, "init");
  if (!v6)
    goto LABEL_29;
  v7 = objc_autoreleasePoolPush();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[WAUtil resourcePath](WAUtil, "resourcePath"));
  v9 = objc_retainAutorelease(NSSQLiteStoreType);
  v10 = objc_retainAutorelease(NSFileProtectionNone);
  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v51 = "_Bool createPolicy(_Bool, _Bool, NSString *__autoreleasing *, NSString *__autoreleasing *)";
    v52 = 1024;
    v53 = 29;
    v54 = 2112;
    v55 = CFSTR("LEGACY");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWActivityDistributionStoreDescriptor is running in %@ MODE", buf, 0x1Cu);
  }

  v13 = v9;
  v14 = v10;
  if (!v8)
  {
    v35 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
      v52 = 1024;
      v53 = 79;
      v54 = 2112;
      v55 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to access bundle path %@", buf, 0x1Cu);
    }
    goto LABEL_39;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentsOfDirectoryAtPath:error:", v8, 0));

  if (!-[NSObject count](v16, "count"))
  {
    v36 = WALogCategoryDefaultHandle();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
      v52 = 1024;
      v53 = 83;
      v54 = 2112;
      v55 = v8;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:Found no files in %@", buf, 0x1Cu);
    }

LABEL_39:
    v30 = 0;
    LODWORD(v17) = 0;
    goto LABEL_26;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v16 = v16;
  v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v17)
  {
    v38 = v14;
    v39 = v13;
    v40 = v8;
    v41 = v7;
    v42 = v6;
    v18 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v17; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("."), v38, v39, v40, v41));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));

        if (objc_msgSend(v20, "hasSuffix:", CFSTR("sqlite"))
          && -[__CFString hasPrefix:](v22, "hasPrefix:", CFSTR("NWActivity_")))
        {
          if (a3)
          {
            v23 = WALogCategoryDefaultHandle();
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
              v52 = 1024;
              v53 = 106;
              v54 = 2048;
              v55 = (const __CFString *)a3;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unsupported Group %ld", buf, 0x1Cu);
            }

          }
          else if (-[__CFString hasSuffix:](v22, "hasSuffix:", CFSTR("cdf_allActivities")))
          {
            v25 = WALogCategoryDefaultHandle();
            v17 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
              v52 = 1024;
              v53 = 99;
              v54 = 2112;
              v55 = v22;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found file %@", buf, 0x1Cu);
            }

            v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v20));
            v6 = v42;
            backingStore = v42->backingStore;
            v42->backingStore = (NSString *)v26;

            v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v22));
            sqlTable = v42->sqlTable;
            v42->sqlTable = (NSString *)v28;

            LODWORD(v17) = 1;
            goto LABEL_24;
          }
        }

      }
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v17)
        continue;
      break;
    }
    v6 = v42;
LABEL_24:
    v8 = v40;
    v7 = v41;
    v14 = v38;
    v13 = v39;
  }

  v30 = 1;
LABEL_26:

  objc_autoreleasePoolPop(v7);
  if (!v30)
  {
LABEL_32:
    v31 = 0;
    goto LABEL_33;
  }
  if (!(_DWORD)v17)
  {
LABEL_29:
    v32 = WALogCategoryDefaultHandle();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
      v52 = 1024;
      v53 = 112;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find distribution", buf, 0x12u);
    }

    goto LABEL_32;
  }
  v31 = v6;
LABEL_33:

  return v31;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  void *v3;
  NSString *storeProt;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *storeKind;
  void *v11;
  id v12;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", self->backingStore));
  objc_msgSend(v3, "addEntriesFromDictionary:", &off_1000DFF80);
  storeProt = self->storeProt;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v8 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, NSSQLitePragmasOption, storeProt, NSPersistentStoreFileProtectionKey, v5, NSMigratePersistentStoresAutomaticallyOption, v6, NSInferMappingModelAutomaticallyOption, v7, NSReadOnlyPersistentStoreOption, 0));

  storeKind = self->storeKind;
  v16 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "addPersistentStoreWithType:configuration:URL:options:error:", storeKind, 0, v15, v9, &v16));
  v12 = v16;

  if (v11)
  {
    persistentStoreCoordinator = self->__persistentStoreCoordinator;
    self->__persistentStoreCoordinator = 0;

  }
  return 0;
}

- (void)findInterpolatedPercentileFromWiFiStats:(id)a3 andReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  id v8;
  _UNKNOWN **v9;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *i;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  _UNKNOWN **v23;
  void *v24;
  sqlite3 *v25;
  id v26;
  int v27;
  int v28;
  id v29;
  NSObject *v30;
  NSString *backingStore;
  NSString *sqlTable;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  void *context;
  id v38;
  void (**v39)(id, _QWORD, void *);
  id v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  sqlite3_stmt *ppStmt;
  sqlite3 *ppDb;
  uint8_t v49[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  NSString *v58;
  __int16 v59;
  int v60;
  uint8_t v61[128];
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  id v69;
  _BYTE v70[16];
  NSErrorUserInfoKey v71;
  const __CFString *v72;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  ppDb = 0;
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = &AnalyticsSendEventLazy_ptr;
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/System/Library/PrivateFrameworks/WiFiAnalytics.framework/%@"), self->backingStore)));
  if (sqlite3_open_v2((const char *)objc_msgSend(v10, "UTF8String"), &ppDb, 1, 0))
  {
    sqlite3_close_v2(ppDb);
    v11 = WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = sqlite3_errmsg(ppDb);
      v14 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      *(_DWORD *)buf = 136446978;
      v63 = "-[NWActivityDistributionStoreDescriptor findInterpolatedPercentileFromWiFiStats:andReply:]";
      v64 = 1024;
      v65 = 166;
      v66 = 2080;
      v67 = v13;
      v68 = 2080;
      v69 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to open database with message '%s' for file %s", buf, 0x26u);
    }

    v71 = NSLocalizedFailureReasonErrorKey;
    v72 = CFSTR("WAErrorCodeSQLiteNotOK");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9020, v15));

    v7[2](v7, 0, v16);
  }
  else
  {
    v38 = v10;
    v39 = v7;
    ppStmt = 0;
    context = objc_autoreleasePoolPush();
    bzero(buf, 0x320uLL);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v40 = v6;
    v17 = v6;
    v42 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
    if (v42)
    {
      v41 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v41)
            objc_enumerationMutation(v17);
          v19 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v19));
          objc_msgSend(v20, "doubleValue");
          v22 = v21;
          v23 = v9;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[119], "stringWithFormat:", CFSTR("SELECT \"%@\" from \"%@\";"),
                            v19,
                            self->sqlTable));
          v25 = ppDb;
          v26 = objc_retainAutorelease(v24);
          v27 = sqlite3_prepare_v2(v25, (const char *)objc_msgSend(v26, "UTF8String"), -1, &ppStmt, 0);
          if (v27)
          {
            v28 = v27;
            v29 = WALogCategoryDefaultHandle();
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              backingStore = self->backingStore;
              sqlTable = self->sqlTable;
              *(_DWORD *)v49 = 136447490;
              v50 = "-[NWActivityDistributionStoreDescriptor findInterpolatedPercentileFromWiFiStats:andReply:]";
              v51 = 1024;
              v52 = 187;
              v53 = 2112;
              v54 = v19;
              v55 = 2112;
              v56 = backingStore;
              v57 = 2112;
              v58 = sqlTable;
              v59 = 1024;
              v60 = v28;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:Parameter %@ not found in file %@ table %@ returned %d", v49, 0x36u);
            }

            v9 = v23;
          }
          else
          {
            v33 = 0;
            while (sqlite3_step(ppStmt) == 100)
            {
              v34 = sqlite3_column_double(ppStmt, 0);
              *(double *)&v70[8 * v33] = v34;
              if (v22 >= v34)
              {
                v35 = 99.0;
                if ((v33 + 100) <= 0x63)
                  v35 = (double)(v33 + 100)
                      - (v22 - *(double *)&v70[8 * v33 + 8]) / (v34 - *(double *)&v70[8 * v33 + 8]);
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v35));
                objc_msgSend(v8, "setObject:forKey:", v36, v19);

                break;
              }
              if (--v33 == -99)
                break;
            }
            sqlite3_finalize(ppStmt);
          }

        }
        v42 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
      }
      while (v42);
    }

    objc_autoreleasePoolPop(context);
    v7 = v39;
    ((void (**)(id, id, void *))v39)[2](v39, v8, 0);
    v6 = v40;
    v10 = v38;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->storeProt, 0);
  objc_storeStrong((id *)&self->storeKind, 0);
  objc_storeStrong((id *)&self->sqlTable, 0);
  objc_storeStrong((id *)&self->backingStore, 0);
}

@end
