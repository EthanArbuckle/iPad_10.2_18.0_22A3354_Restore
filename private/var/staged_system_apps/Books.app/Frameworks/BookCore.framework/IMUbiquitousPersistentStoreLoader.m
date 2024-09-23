@implementation IMUbiquitousPersistentStoreLoader

- (IMUbiquitousPersistentStoreLoader)initWithIdentifier:(id)a3
{
  id v4;
  IMUbiquitousPersistentStoreLoader *v5;
  NSString *v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMUbiquitousPersistentStoreLoader;
  v5 = -[IMUbiquitousPersistentStoreLoader init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = v6;

  }
  return v5;
}

- (IMUbiquitousPersistentStoreLoader)initWithPersistentStoreURL:(id)a3
{
  id v5;
  IMUbiquitousPersistentStoreLoader *v6;
  IMUbiquitousPersistentStoreLoader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMUbiquitousPersistentStoreLoader;
  v6 = -[IMUbiquitousPersistentStoreLoader init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_persistentStoreURL, a3);

  return v7;
}

- (IMUbiquitousPersistentStoreLoader)init
{
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;

  v3 = NSStringFromSelector("initWithIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = NSStringFromSelector("initWithPersistentStoreURL:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Please use one of the defaultInitializers {%@} or {%@}"), v4, v6);

  return 0;
}

- (id)addPersistentStoreToPersistentStoreCoordinator:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v4 = (char *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v5, "setValue:forKey:", v6, NSMigratePersistentStoresAutomaticallyOption);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v5, "setValue:forKey:", v7, NSInferMappingModelAutomaticallyOption);

  v8 = (char *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousPersistentStoreLoader storeURL](self, "storeURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousPersistentStoreLoader addPersistentStoreToPersistentStoreCoordinator:withType:configuration:URL:options:](self, "addPersistentStoreToPersistentStoreCoordinator:withType:configuration:URL:options:", v4, NSSQLiteStoreType, 0, v8, v5));
  if (!v9)
  {
    v10 = BCIMLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[IMUbiquitousPersistentStoreLoader addPersistentStoreToPersistentStoreCoordinator:]";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCUbiquitousPersistentStoreLoader.m";
      v19 = 1024;
      v20 = 78;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v12 = BCIMLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "@\"Failed to add persistentStore at URL: %@ Error: %@ -- Crashing to avoid data loss\", buf, 0x16u);
    }

    +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("%@ failed to add persistentStore to PSC: %@ at URL: %@"), CFSTR("self"), v4, v8);
  }

  return v9;
}

- (id)addPersistentStoreToPersistentStoreCoordinator:(id)a3 withType:(id)a4 configuration:(id)a5 URL:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  double v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  unsigned __int8 v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  NSObject *v61;
  _BOOL4 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  NSObject *v72;
  id AssociatedObject;
  void *v74;
  id v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  void *v85;
  IMUbiquitousPersistentStoreLoader *object;
  id v88;
  id v89;
  id v90;
  id v91;
  __CFString *v92;
  id v93;
  NSMutableArray *obj;
  NSObject *obja;
  NSObject *v96;
  void *v97;
  NSMutableArray *v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  _BYTE v110[128];
  uint8_t v111[128];
  uint8_t buf[4];
  const __CFString *v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  __CFString *v117;
  __int16 v118;
  id v119;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (__CFString *)a6;
  v16 = a7;
  v109 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addPersistentStoreWithType:configuration:URL:options:error:", v13, v14, v15, v16, &v109));
  v93 = v109;
  if (v17)
  {
    v18 = v93;
  }
  else
  {
    object = self;
    v88 = v14;
    v91 = v16;
    v89 = v13;
    v19 = BCIMLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v113 = CFSTR("self");
      v114 = 2112;
      v115 = (uint64_t)v12;
      v116 = 2112;
      v117 = v15;
      v118 = 2112;
      v119 = v93;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%@ failed to add persistentStore to PSC: %@ at URL: %@ -- Error: %@", buf, 0x2Au);
    }
    v90 = v12;

    v92 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v15, "path"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByDeletingLastPathComponent"));
    v97 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "enumeratorAtPath:", v23));
    v98 = objc_opt_new(NSMutableArray);
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v106 != v28)
            objc_enumerationMutation(v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i)));
          if (objc_msgSend(v30, "hasPrefix:", v21)
            && (objc_msgSend(v30, "hasSuffix:", CFSTR("bak")) & 1) == 0)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v30));
            -[NSMutableArray addObject:](v98, "addObject:", v31);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
      }
      while (v27);
    }

    v32 = -[NSMutableArray count](v98, "count");
    v33 = BCIMLog();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = v34;
    if (v32)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "There is an existing persistentStore. Maybe the files are somehow corrupted -- Attempting Move and Retry", buf, 2u);
      }

      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v96 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld.%@"), (uint64_t)v36, CFSTR("bak")));
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      obj = v98;
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v102;
        v40 = v93;
        while (2)
        {
          v41 = 0;
          v42 = v40;
          do
          {
            if (*(_QWORD *)v102 != v39)
              objc_enumerationMutation(obj);
            v43 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)v41);
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "URLByAppendingPathExtension:", v96));
            v100 = v42;
            v45 = objc_msgSend(v97, "moveItemAtURL:toURL:error:", v43, v44, &v100);
            v40 = v100;

            if (!v45)
            {

              v46 = BCIMLog();
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                sub_1B7D1C();
              v17 = 0;
              v13 = v89;
              v12 = v90;
              v14 = v88;
              goto LABEL_49;
            }
            v41 = (char *)v41 + 1;
            v42 = v40;
          }
          while (v38 != v41);
          v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
          if (v38)
            continue;
          break;
        }
      }
      else
      {
        v40 = v93;
      }

      v70 = objc_claimAutoreleasedReturnValue(-[__CFString URLByAppendingPathExtension:](v92, "URLByAppendingPathExtension:", v96));
      v71 = BCIMLog();
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v113 = v92;
        v114 = 2112;
        v115 = v70;
        _os_log_impl(&dword_0, v72, OS_LOG_TYPE_DEFAULT, "Successfully moved existing persistingStore from URL: %@ to URL: %@", buf, 0x16u);
      }
      obja = v70;

      AssociatedObject = objc_getAssociatedObject(object, CFSTR("kIMDidRetryAddPersistentStore"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
      v13 = v89;
      v12 = v90;
      v14 = v88;
      if ((objc_msgSend(v74, "BOOLValue") & 1) != 0)
      {
        v75 = BCIMLog();
        v76 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          sub_1B7CE8(v76, v77, v78, v79, v80, v81, v82, v83);

        v17 = 0;
      }
      else
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));

        v74 = v85;
        objc_setAssociatedObject(object, CFSTR("kIMDidRetryAddPersistentStore"), v85, &stru_2E8.segname[9]);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousPersistentStoreLoader addPersistentStoreToPersistentStoreCoordinator:withType:configuration:URL:options:](object, "addPersistentStoreToPersistentStoreCoordinator:withType:configuration:URL:options:", v90, v89, v88, v92, v91));
        if (v17)
          objc_setAssociatedObject(object, CFSTR("kIMDidRetryAddPersistentStore"), 0, &stru_2E8.segname[9]);
      }
      v47 = obja;

LABEL_49:
      v59 = v40;
    }
    else
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_1B7CB4(v35, v48, v49, v50, v51, v52, v53, v54);

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v15, "path"));
      v56 = objc_msgSend(v97, "isWritableFileAtPath:", v55);

      v13 = v89;
      if ((v56 & 1) != 0)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v15, "path"));
        v99 = v93;
        v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "attributesOfFileSystemForPath:error:", v57, &v99));
        v59 = v99;

        v60 = BCIMLog();
        v61 = objc_claimAutoreleasedReturnValue(v60);
        v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
        v12 = v90;
        v96 = v58;
        if (v58)
        {
          v14 = v88;
          if (v62)
            sub_1B7BF4();
        }
        else
        {
          v14 = v88;
          if (v62)
            sub_1B7B8C(v61, v63, v64, v65, v66, v67, v68, v69);
        }

        v17 = 0;
      }
      else
      {
        v84 = BCIMLog();
        v96 = objc_claimAutoreleasedReturnValue(v84);
        v12 = v90;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
          sub_1B7C54();
        v17 = 0;
        v59 = v93;
        v14 = v88;
      }
    }

    v18 = v59;
    v16 = v91;
    v15 = v92;
  }

  return v17;
}

- (BOOL)storeFileExists
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousPersistentStoreLoader storeURL](self, "storeURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  return v6;
}

- (void)deletePersistentStore
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousPersistentStoreLoader storeURL](self, "storeURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v10 = 0;
    v6 = objc_msgSend(v3, "removeItemAtURL:error:", v2, &v10);
    v7 = v10;
    if ((v6 & 1) == 0)
    {
      v8 = BCIMLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1B7D7C();

    }
  }
  else
  {
    v7 = 0;
  }

}

+ (id)databaseFolderURL
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("storeFiles")));

  return v6;
}

- (NSURL)storeURL
{
  NSURL *persistentStoreURL;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  persistentStoreURL = self->_persistentStoreURL;
  if (!persistentStoreURL)
  {
    v4 = objc_msgSend((id)objc_opt_class(self), "databaseFolderURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v17 = 0;
    v8 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v17);
    v9 = v17;

    if ((v8 & 1) == 0)
    {
      v10 = BCIMLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1B7DDC();

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousPersistentStoreLoader storeName](self, "storeName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousPersistentStoreLoader identifier](self, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@.sqlite"), v12, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v14));
    -[IMUbiquitousPersistentStoreLoader setPersistentStoreURL:](self, "setPersistentStoreURL:", v15);

    persistentStoreURL = self->_persistentStoreURL;
  }
  return persistentStoreURL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)persistentStoreURL
{
  return self->_persistentStoreURL;
}

- (void)setPersistentStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreURL, a3);
}

- (NSString)storeName
{
  return self->_storeName;
}

- (void)setStoreName:(id)a3
{
  objc_storeStrong((id *)&self->_storeName, a3);
}

- (NSString)managedObjectModelName
{
  return self->_managedObjectModelName;
}

- (void)setManagedObjectModelName:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectModelName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectModelName, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_persistentStoreURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
