@implementation ASCoreDataManager

+ (ASCoreDataManager)sharedInstance
{
  if (qword_100511598 != -1)
    dispatch_once(&qword_100511598, &stru_1004CEBB8);
  return (ASCoreDataManager *)(id)qword_100511590;
}

- (ASCoreDataManager)initWithStore:(id)a3
{
  return -[ASCoreDataManager initWithStore:options:](self, "initWithStore:options:", a3, 0);
}

- (ASCoreDataManager)initWithStore:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  ASCoreDataManager *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *coreDataDirectoryURL;
  NSURL *v15;
  NSURL *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  ASCoreDataManager *v22;
  ASCoreDataManager *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  int v43;
  id v44;
  void *v45;
  ASCoreDataManager *v46;
  ASCoreDataManager *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[6];
  uint8_t buf[12];
  unsigned int v68;
  id v69;
  objc_super v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  const __CFString *v75;
  _UNKNOWN **v76;
  void *v77;
  uint8_t v78[8];
  uint8_t *v79;
  uint64_t v80;
  char v81;
  const __CFString *v82;
  _UNKNOWN **v83;
  const __CFString *v84;
  _UNKNOWN **v85;
  const __CFString *v86;
  _UNKNOWN **v87;

  v6 = a3;
  v7 = a4;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 1;
  v70.receiver = self;
  v70.super_class = (Class)ASCoreDataManager;
  v8 = -[ASCoreDataManager init](&v70, "init");
  if (v8)
  {
    v9 = objc_alloc_init((Class)NSFileManager);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager storeNameWithExtensionForStoreWithName:](v8, "storeNameWithExtensionForStoreWithName:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLsForDirectory:inDomains:", 5, 8));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLsForDirectory:inDomains:", 5, 1));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "URLByAppendingPathComponent:isDirectory:", CFSTR("CoreAS"), 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Model56902430"), "stringByAppendingString:", CFSTR(".momd")));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "URLByAppendingPathComponent:", v12));

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "URLByAppendingPathComponent:isDirectory:", CFSTR("CoreAS"), 1));
    coreDataDirectoryURL = v8->_coreDataDirectoryURL;
    v8->_coreDataDirectoryURL = (NSURL *)v13;

    v15 = v8->_coreDataDirectoryURL;
    if (!v15)
    {
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
        sub_1003D7380();
      *((_BYTE *)v72 + 24) = 0;
      v15 = v8->_coreDataDirectoryURL;
    }
    v16 = v15;
    v69 = 0;
    objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v69);
    v17 = v69;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v8->_coreDataDirectoryURL, "URLByAppendingPathComponent:", v63));
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
        sub_1003D7320();
      *((_BYTE *)v72 + 24) = 0;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("2BC2E664-199A-4A80-910A-CD19B11354F2")));
    v19 = objc_msgSend(v18, "integerValue");
    v20 = 1;
    switch((unint64_t)v19)
    {
      case 1uLL:
        v86 = CFSTR("2BC2E664-199A-4A80-910A-CD19B11354F2");
        v87 = &off_1004F4B10;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1));
        v8 = -[ASCoreDataManager initWithStore:options:](v8, "initWithStore:options:", v6, v21);

        v22 = v8;
        goto LABEL_50;
      case 3uLL:
        v23 = (ASCoreDataManager *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager migrateCoreDataManager](v8, "migrateCoreDataManager"));
        goto LABEL_18;
      case 4uLL:
        if (!-[ASCoreDataManager removeStoreWithURL:error:](v8, "removeStoreWithURL:error:", v62, 0))
          goto LABEL_20;
        v24 = qword_1005185D0;
        if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
          sub_1003D72F0(v24, v25, v26, v27, v28, v29, v30, v31);
        v23 = -[ASCoreDataManager initWithStore:](v8, "initWithStore:", v6);
        v8 = v23;
LABEL_18:
        v22 = v23;
        goto LABEL_50;
      case 6uLL:
        v20 = 0;
        goto LABEL_20;
      default:
LABEL_20:
        v32 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v61);
        -[ASCoreDataManager setGgQex4P6Prvm5Zac:](v8, "setGgQex4P6Prvm5Zac:", v32);

        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentStoreDescription persistentStoreDescriptionWithURL:](NSPersistentStoreDescription, "persistentStoreDescriptionWithURL:", v62));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager ggQex4P6Prvm5Zac](v8, "ggQex4P6Prvm5Zac"));
        LODWORD(v32) = v33 == 0;

        if ((_DWORD)v32)
        {
          v34 = qword_1005185D0;
          if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
            sub_1003D72C0(v34, v35, v36, v37, v38, v39, v40, v41);
          *((_BYTE *)v72 + 24) = 0;
        }
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager ggQex4P6Prvm5Zac](v8, "ggQex4P6Prvm5Zac"));
        v42 = objc_msgSend(objc_alloc((Class)NSPersistentContainer), "initWithName:managedObjectModel:", CFSTR("Model56902430"), v59);
        -[ASCoreDataManager setXc4PEFTuh2u6xE7M:](v8, "setXc4PEFTuh2u6xE7M:", v42);

        if (v19 == (id)6)
          v43 = v20;
        else
          v43 = 1;
        if (v43 != 1)
          goto LABEL_31;
        v44 = -[ASCoreDataManager j2Xe3JZjJDN8Y8xD:](v8, "j2Xe3JZjJDN8Y8xD:", v8->_coreDataDirectoryURL);
        if (v44 == (id)1)
        {
          v84 = CFSTR("2BC2E664-199A-4A80-910A-CD19B11354F2");
          v85 = &off_1004F4B28;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1));
          v8 = -[ASCoreDataManager initWithStore:options:](v8, "initWithStore:options:", v6, v54);

          goto LABEL_45;
        }
        if (v44 == (id)3)
        {
          v82 = CFSTR("2BC2E664-199A-4A80-910A-CD19B11354F2");
          v83 = &off_1004F4B40;
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1));
          v8 = -[ASCoreDataManager initWithStore:options:](v8, "initWithStore:options:", v6, v45);

LABEL_45:
          v22 = v8;
          goto LABEL_49;
        }
LABEL_31:
        if (v20)
        {
          v46 = (ASCoreDataManager *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager fjcJHNNiQ83H10La](v8, "fjcJHNNiQ83H10La"));
          v22 = v46;
          if (!v46)
          {
            *((_BYTE *)v72 + 24) = 0;
            goto LABEL_49;
          }
          v68 = -[ASCoreDataManager length](v46, "length");
          *(_DWORD *)buf = 0;
          v47 = objc_retainAutorelease(v22);
          -[ASCoreDataManager bytes](v47, "bytes");
          v56 = buf;
          sub_10027ADA4();
          if (!*(_DWORD *)buf)
          {
            v57 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v78, 16, buf);
            objc_msgSend(v58, "setOption:forKey:", v57, NSSQLiteSEEKeychainItemOption);
            objc_msgSend(v58, "setOption:forKey:", NSFileProtectionCompleteUntilFirstUserAuthentication, NSPersistentStoreFileProtectionKey);
            v48 = qword_1005185D0;
            if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "CoreData store encryption enabled.", buf, 2u);
            }

          }
        }
        else
        {
          v49 = qword_1005185D0;
          if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v78 = 0;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "CoreData store encryption disabled due to legacyMode detected.", v78, 2u);
          }
        }
        *(_QWORD *)v78 = 0;
        v79 = v78;
        v80 = 0x2020000000;
        v81 = 0;
        v77 = v58;
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1, v56));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager xc4PEFTuh2u6xE7M](v8, "xc4PEFTuh2u6xE7M"));
        objc_msgSend(v51, "setPersistentStoreDescriptions:", v50);

        v52 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager xc4PEFTuh2u6xE7M](v8, "xc4PEFTuh2u6xE7M"));
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_100018858;
        v66[3] = &unk_1004CEBE0;
        v66[4] = v78;
        v66[5] = &v71;
        objc_msgSend(v52, "loadPersistentStoresWithCompletionHandler:", v66);

        if (v79[24])
        {
          v75 = CFSTR("2BC2E664-199A-4A80-910A-CD19B11354F2");
          v76 = &off_1004F4B10;
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
          v8 = -[ASCoreDataManager initWithStore:options:](v8, "initWithStore:options:", v6, v53);

          v22 = v8;
        }
        else if (*((_BYTE *)v72 + 24))
        {
          v8 = v8;
          v22 = v8;
        }
        else
        {
          v22 = 0;
        }
        _Block_object_dispose(v78, 8);
LABEL_49:

LABEL_50:
        break;
    }
  }
  else
  {
    v22 = 0;
  }
  _Block_object_dispose(&v71, 8);

  return v22;
}

- (BOOL)removeStoreWithURL:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v21 = v6;
  objc_msgSend(v7, "removeItemAtURL:error:", v5, &v21);
  v8 = v21;

  v9 = v8;
  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-wal"), v10));
    v20 = 0;
    objc_msgSend(v7, "removeItemAtPath:error:", v11, &v20);
    v12 = v20;
    if (v12)
    {
      v13 = (id)qword_1005185D0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Failed to remove -wal file with error %@", buf, 0xCu);

      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-shm"), v10));
    v19 = v12;
    objc_msgSend(v7, "removeItemAtPath:error:", v15, &v19);
    v9 = v19;

    if (v9)
    {
      v16 = (id)qword_1005185D0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Failed to remove -shm file with error %@", buf, 0xCu);

      }
    }

  }
  return v8 == 0;
}

- (int64_t)j2Xe3JZjJDN8Y8xD:(id)a3
{
  id v4;
  int64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", a3));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(&off_1004F4F38, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = 5;
    v18 = *(_QWORD *)v23;
    while (2)
    {
      v19 = v4;
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(&off_1004F4F38);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager storeNameWithExtensionForStoreWithName:](self, "storeNameWithExtensionForStoreWithName:", v7, v18));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_coreDataDirectoryURL, "URLByAppendingPathComponent:", v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "relativePath"));
        if ((objc_msgSend(v20, "fileExistsAtPath:", v10) & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v10));
          v21 = 0;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "readDataUpToLength:error:", 16, &v21));
          v13 = v21;
          if (v13)
          {
            v15 = (id)qword_1005185D0;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
              sub_1003D7470(v16, buf, v15);
            }

            goto LABEL_20;
          }
          strcpy((char *)buf, "SQLite format 3");
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 16));
          if (objc_msgSend(v14, "isEqualToData:", v12))
          {
            if (objc_msgSend(v7, "isEqualToString:", CFSTR("Model56902430g")))
              v5 = 3;
            else
              v5 = 1;
          }
          else
          {
            v5 = 2;
          }

        }
      }
      v4 = objc_msgSend(&off_1004F4F38, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
LABEL_20:
    v5 = 5;
  }

  return v5;
}

- (id)migrateCoreDataManager
{
  NSObject *v3;
  ASCoreDataManager *v4;
  void *v5;
  ASCoreDataManager *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ASCoreDataManager *v18;
  void *v19;
  ASCoreDataManager *v20;
  PJXBDBF1h0EU80dy *v21;
  void *v22;
  id v23;
  NSObject *v24;
  ASCoreDataManager *v25;
  id v27;
  uint8_t buf[8];
  const __CFString *v29;
  _UNKNOWN **v30;
  const __CFString *v31;
  _UNKNOWN **v32;

  v3 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Migration requirement detected. Performing migration", buf, 2u);
  }
  v4 = [ASCoreDataManager alloc];
  v31 = CFSTR("2BC2E664-199A-4A80-910A-CD19B11354F2");
  v32 = &off_1004F4B58;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v6 = -[ASCoreDataManager initWithStore:options:](v4, "initWithStore:options:", CFSTR("Model56902430g"), v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager retrieveLegacyRavioliWithCoreDataManager:](self, "retrieveLegacyRavioliWithCoreDataManager:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager storeNameWithExtensionForStoreWithName:](self, "storeNameWithExtensionForStoreWithName:", CFSTR("Model56902430g")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_coreDataDirectoryURL, "URLByAppendingPathComponent:", v8));
  if (!-[ASCoreDataManager removeStoreWithURL:error:](self, "removeStoreWithURL:error:", v9, 0))
  {
    v10 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D7524(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  v18 = [ASCoreDataManager alloc];
  v29 = CFSTR("2BC2E664-199A-4A80-910A-CD19B11354F2");
  v30 = &off_1004F4B70;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v20 = -[ASCoreDataManager initWithStore:options:](v18, "initWithStore:options:", CFSTR("Model56902430i"), v19);

  v21 = -[PJXBDBF1h0EU80dy initWithCoreDataManager:]([PJXBDBF1h0EU80dy alloc], "initWithCoreDataManager:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[RavioliConstants ravioliUUID](_TtC3asd16RavioliConstants, "ravioliUUID"));
  v27 = 0;
  -[PJXBDBF1h0EU80dy c94QZ147F1UWY71l:jkjlhN0UgO78kW6q:error:](v21, "c94QZ147F1UWY71l:jkjlhN0UgO78kW6q:error:", v22, v7, &v27);
  v23 = v27;

  v24 = qword_1005185D0;
  if (v23)
  {
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D74C4();
    v25 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Restored existing JSON Bags into new store.", buf, 2u);
    }
    v25 = v20;
  }

  return v25;
}

- (id)gFJw2BGPtEQWyLz5
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager xc4PEFTuh2u6xE7M](self, "xc4PEFTuh2u6xE7M"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager xc4PEFTuh2u6xE7M](self, "xc4PEFTuh2u6xE7M"));
    v5 = objc_msgSend(v4, "newBackgroundContext");

    objc_msgSend(v5, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)npsTCqegVwa7yuzs
{
  uint64_t v2;
  id v3;
  _QWORD block[5];
  __CFString *v5;
  id v6;

  if (self->_coreDataDirectoryURL)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019364;
    block[3] = &unk_1004CEC08;
    block[4] = self;
    v5 = CFSTR("Model56902430");
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Model56902430"), "stringByAppendingString:", CFSTR("i")));
    v2 = qword_1005115A0;
    v3 = v6;
    if (v2 != -1)
      dispatch_once(&qword_1005115A0, block);

  }
}

- (void)mILKmibfRWMwFVWD:(id)a3 iZGmRj7VI4MJ9lO1:(id)a4 AndError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100019984;
  v22 = sub_100019994;
  v23 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager gFJw2BGPtEQWyLz5](self, "gFJw2BGPtEQWyLz5"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001999C;
  v13[3] = &unk_1004CEC30;
  v14 = v8;
  v15 = v9;
  v16 = v10;
  v17 = &v18;
  v11 = v10;
  objc_msgSend(v11, "performBlockAndWait:", v13);

  v12 = (void *)v19[5];
  if (v12)
    *a5 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v18, 8);

}

- (id)storeNameWithExtensionForStoreWithName:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingString:", CFSTR(".sqlite")));
}

- (NSPersistentContainer)xc4PEFTuh2u6xE7M
{
  return self->_xc4PEFTuh2u6xE7M;
}

- (void)setXc4PEFTuh2u6xE7M:(id)a3
{
  objc_storeStrong((id *)&self->_xc4PEFTuh2u6xE7M, a3);
}

- (NSManagedObjectModel)ggQex4P6Prvm5Zac
{
  return self->_ggQex4P6Prvm5Zac;
}

- (void)setGgQex4P6Prvm5Zac:(id)a3
{
  objc_storeStrong((id *)&self->_ggQex4P6Prvm5Zac, a3);
}

- (NSURL)coreDataDirectoryURL
{
  return self->_coreDataDirectoryURL;
}

- (void)setCoreDataDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_coreDataDirectoryURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataDirectoryURL, 0);
  objc_storeStrong((id *)&self->_ggQex4P6Prvm5Zac, 0);
  objc_storeStrong((id *)&self->_xc4PEFTuh2u6xE7M, 0);
}

- (id)retrieveLegacyRavioliWithCoreDataManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gFJw2BGPtEQWyLz5"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("DB_R09283478")));
  objc_msgSend(v5, "setFetchLimit:", 1);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10001C860;
  v24[4] = sub_10001C870;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_10001C860;
  v22[4] = sub_10001C870;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10001C860;
  v20 = sub_10001C870;
  v21 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C878;
  v10[3] = &unk_1004CEC98;
  v13 = v22;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v14 = v24;
  v15 = &v16;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  return v8;
}

- (id)fjcJHNNiQ83H10La
{
  const __CFDictionary *v2;
  void *v3;
  void *v4;
  const __CFDictionary *v5;
  OSStatus v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  CFTypeRef result;
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[6];
  _QWORD v21[6];

  v14 = (void *)MGCopyAnswer(CFSTR("UniqueChipID"), 0);
  v16 = objc_msgSend(v14, "longValue");
  v13 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v16, 8));
  v20[0] = kSecClass;
  v20[1] = kSecAttrAccount;
  v21[0] = kSecClassGenericPassword;
  v21[1] = CFSTR("asd.uuid.data.a");
  v20[2] = kSecMatchLimit;
  v20[3] = kSecReturnAttributes;
  v21[2] = kSecMatchLimitOne;
  v21[3] = &__kCFBooleanTrue;
  v20[4] = kSecReturnData;
  v20[5] = kSecAttrAccessGroup;
  v21[4] = &__kCFBooleanTrue;
  v21[5] = CFSTR("com.apple.asd");
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 6));
  result = 0;
  if (!SecItemCopyMatching(v2, &result))
  {
    v11 = (void *)result;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "objectForKey:", kSecValueData));

    if (v4)
      goto LABEL_9;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v19[0] = 0;
  v19[1] = 0;
  objc_msgSend(v3, "getUUIDBytes:", v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v19, 16));
  v17[0] = kSecClass;
  v17[1] = kSecAttrAccount;
  v18[0] = kSecClassGenericPassword;
  v18[1] = CFSTR("asd.uuid.data.a");
  v17[2] = kSecValueData;
  v17[3] = kSecAttrAccessible;
  v18[2] = v4;
  v18[3] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  v17[4] = kSecAttrAccessGroup;
  v18[4] = CFSTR("com.apple.asd");
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 5));
  v6 = SecItemAdd(v5, 0);
  if (!v6)
  {

LABEL_9:
    v10 = (void *)v13;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v13));
    objc_msgSend(v3, "appendData:", v4);
    v9 = objc_msgSend(v3, "copy");
    goto LABEL_10;
  }
  v7 = v6;
  v8 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D8AF8(v7, v8);

  v9 = 0;
  v10 = (void *)v13;
LABEL_10:

  return v9;
}

@end
