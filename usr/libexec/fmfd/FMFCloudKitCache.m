@implementation FMFCloudKitCache

- (FMFCloudKitCache)init
{
  FMFCloudKitCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accountQueue;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *records;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *zoneServerChangeTokens;
  NSMutableDictionary *v23;
  NSMutableDictionary *serverChangeTokens;
  objc_super v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];

  v26.receiver = self;
  v26.super_class = (Class)FMFCloudKitCache;
  v2 = -[FMFCloudKitCache init](&v26, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.icloud.fmfd.cloudkitCache.accountQueue", 0);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](v2, "scopeStringForAccountWithScope:", 2));
    v29[0] = v5;
    v6 = objc_opt_new(NSMutableDictionary);
    v30[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](v2, "scopeStringForAccountWithScope:", 3));
    v29[1] = v7;
    v8 = objc_opt_new(NSMutableDictionary);
    v30[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](v2, "scopeStringForAccountWithScope:", 1));
    v29[2] = v9;
    v10 = objc_opt_new(NSMutableDictionary);
    v30[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
    v12 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
    records = v2->_records;
    v2->_records = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](v2, "scopeStringForAccountWithScope:", 2));
    v27[0] = v14;
    v15 = objc_opt_new(NSMutableDictionary);
    v28[0] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](v2, "scopeStringForAccountWithScope:", 3));
    v27[1] = v16;
    v17 = objc_opt_new(NSMutableDictionary);
    v28[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](v2, "scopeStringForAccountWithScope:", 1));
    v27[2] = v18;
    v19 = objc_opt_new(NSMutableDictionary);
    v28[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
    v21 = (NSMutableDictionary *)objc_msgSend(v20, "mutableCopy");
    zoneServerChangeTokens = v2->_zoneServerChangeTokens;
    v2->_zoneServerChangeTokens = v21;

    v23 = objc_opt_new(NSMutableDictionary);
    serverChangeTokens = v2->_serverChangeTokens;
    v2->_serverChangeTokens = v23;

  }
  return v2;
}

+ (id)cacheDirectory
{
  void *v2;
  void *v3;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storedDSID"));

  v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("FMFCloudKitCache")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v3));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_v%@"), CFSTR("1")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", v12));

  return v13;
}

+ (id)pathToServerChangeTokenDataForScope:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("serverChangeTokens")));

  v6 = CKDatabaseScopeString(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("data")));
  return v9;
}

+ (id)pathToServerChangeTokenDataForZoneWithID:(id)a3 inDatabaseWithScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("zoneServerChangeToken")));

  v9 = CKDatabaseScopeString(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ownerName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingPathExtension:", CFSTR("data")));
  return v18;
}

+ (id)pathToDataForRecordWithID:(id)a3 inDatabaseWithScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("records")));

  v9 = CKDatabaseScopeString(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ownerName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathComponent:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathExtension:", CFSTR("data")));
  return v23;
}

+ (id)pathToDataForUnacceptedCKShareTokenForShareURL:(id)a3 InDatabaseWithScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("unacceptedShares")));

  v9 = CKDatabaseScopeString(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("data")));

  return v13;
}

+ (id)pathToAllUnacceptedCKSharesInDatabaseWithScope:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("unacceptedShares")));

  v6 = CKDatabaseScopeString(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v7));

  return v8;
}

- (id)scopeStringForAccountWithScope:(int64_t)a3
{
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100047B44;
  v12 = sub_100047B54;
  v13 = 0;
  v4 = objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache accountQueue](self, "accountQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047B5C;
  v7[3] = &unk_10009AC60;
  v7[4] = &v8;
  v7[5] = a3;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (BOOL)updateUnacceptedShareInvitationsWithShareURLString:(id)a3 invitationTokenBase64String:(id)a4 InDatabaseWithScope:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;

  v10 = a3;
  v11 = a4;
  v12 = sub_100011D0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    *(_DWORD *)buf = 136315394;
    v35 = "-[FMFCloudKitCache updateUnacceptedShareInvitationsWithShareURLString:invitationTokenBase64String:InDatabaseWithScope:error:]";
    v36 = 2112;
    v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: share path: %@", buf, 0x16u);

  }
  v33 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v33));

  v16 = v33;
  if (v16)
  {
    v17 = v16;
    v18 = sub_100011D0C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100064B58();

    v20 = objc_retainAutorelease(v17);
    v21 = 0;
    *a6 = v20;
  }
  else
  {
    v22 = (void *)objc_opt_class(self);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pathToDataForUnacceptedCKShareTokenForShareURL:InDatabaseWithScope:", v23, a5));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByDeletingLastPathComponent"));
    v32 = 0;
    objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, 0, &v32);
    v27 = v32;

    v31 = v27;
    objc_msgSend(v15, "writeToFile:options:error:", v24, 0, &v31);
    v20 = v31;

    v21 = v20 == 0;
    if (v20)
    {
      v28 = sub_100011D0C();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_100064AEC();

      *a6 = objc_retainAutorelease(v20);
    }

  }
  return v21;
}

- (id)unacceptedShareInvitationsInDatabaseWithScope:(int64_t)a3
{
  id v3;
  NSObject *v4;
  _UNKNOWN **v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSSet *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  id v35;
  uint64_t v36;
  id obj;
  NSObject *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  NSObject *v47;
  _BYTE v48[128];

  v3 = objc_msgSend((id)objc_opt_class(self), "pathToAllUnacceptedCKSharesInDatabaseWithScope:", a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v35 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enumeratorAtPath:", v4));

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    v36 = *(_QWORD *)v41;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        v12 = *(NSObject **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v11);
        v13 = sub_100011D0C();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[FMFCloudKitCache unacceptedShareInvitationsInDatabaseWithScope:]";
          v46 = 2112;
          v47 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Unaccepted Share at path: %@", buf, 0x16u);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v12));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("data")));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[354], "defaultManager"));
        v18 = objc_msgSend(v17, "fileExistsAtPath:", v16);

        if ((v18 & 1) != 0)
        {
          v39 = 0;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v16, 0, &v39));
          v20 = v39;
          if (v20)
          {
            v21 = sub_100011D0C();
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v45 = "-[FMFCloudKitCache unacceptedShareInvitationsInDatabaseWithScope:]";
              v46 = 2112;
              v47 = v20;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: read error: %@", buf, 0x16u);
            }

          }
          v23 = v9;
          v24 = v4;
          v25 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          v38 = v20;
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v26, v19, &v38));
          v28 = v38;

          if (v28)
          {
            v29 = sub_100011D0C();
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v45 = "-[FMFCloudKitCache unacceptedShareInvitationsInDatabaseWithScope:]";
              v46 = 2112;
              v47 = v28;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: unarchive error: %@", buf, 0x16u);
            }
          }
          else
          {
            v30 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://www.icloud.com/share/")));
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v30, "absoluteString"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingPathComponent:", v12));

            objc_msgSend(v35, "setValue:forKey:", v27, v33);
          }
          v9 = v23;

          v4 = v24;
          v5 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
          v10 = v36;
        }
        else
        {
          v31 = sub_100011D0C();
          v28 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v45 = "-[FMFCloudKitCache unacceptedShareInvitationsInDatabaseWithScope:]";
            v46 = 2112;
            v47 = v4;
            _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s: no file at %@", buf, 0x16u);
          }
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v9);
  }

  return v35;
}

- (BOOL)removeUnacceptedShareInvitationWithShareURLString:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;

  v8 = a3;
  v9 = (void *)objc_opt_class(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathToDataForUnacceptedCKShareTokenForShareURL:InDatabaseWithScope:", v10, a4));

  v12 = sub_100011D0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    *(_DWORD *)buf = 136315394;
    v27 = "-[FMFCloudKitCache removeUnacceptedShareInvitationWithShareURLString:inDatabaseWithScope:error:]";
    v28 = 2112;
    v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: share path: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = objc_msgSend(v15, "fileExistsAtPath:", v11);

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByDeletingLastPathComponent"));
    v25 = 0;
    v19 = objc_msgSend(v17, "removeItemAtPath:error:", v18, &v25);
    v20 = v25;

    if ((v19 & 1) == 0)
    {
      v21 = sub_100011D0C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100064BC4();

      v20 = objc_retainAutorelease(v20);
      *a5 = v20;
    }
  }
  else
  {
    v23 = sub_100011D0C();
    v20 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100064C30();
    v19 = 1;
  }

  return v19;
}

- (id)serverChangeTokenForDatabaseWithScope:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](self, "scopeStringForAccountWithScope:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache serverChangeTokens](self, "serverChangeTokens"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (!v7)
  {
    v10 = objc_msgSend((id)objc_opt_class(self), "pathToServerChangeTokenDataForScope:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

    if ((v13 & 1) != 0)
    {
      v28 = 0;
      v14 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v11, 0, &v28));
      v15 = v28;
      if (!v15)
      {
        v27 = 0;
        v21 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CKServerChangeToken), v14, &v27);
        v8 = (id)objc_claimAutoreleasedReturnValue(v21);
        v22 = v27;
        if (!v22)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache serverChangeTokens](self, "serverChangeTokens"));
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v8, v5);

          v8 = v8;
          v9 = v8;
          goto LABEL_12;
        }
        v23 = v22;
        v24 = sub_100011D0C();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_100064C9C();

LABEL_11:
        v9 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v16 = v15;
      v17 = sub_100011D0C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100064D08();

    }
    else
    {
      v19 = sub_100011D0C();
      v14 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_100064D74();
    }
    v8 = 0;
    goto LABEL_11;
  }
  v8 = v7;
  v9 = v8;
LABEL_13:

  return v9;
}

- (BOOL)updateServerChangeToken:(id)a3 forDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](self, "scopeStringForAccountWithScope:", a4));
  v28 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v28));
  v11 = v28;
  if (v11)
  {
    v12 = v11;
    v13 = sub_100011D0C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100064E4C();

    v15 = objc_retainAutorelease(v12);
    v16 = 0;
    *a5 = v15;
  }
  else
  {
    v17 = objc_msgSend((id)objc_opt_class(self), "pathToServerChangeTokenDataForScope:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByDeletingLastPathComponent"));
    v27 = 0;
    objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v27);
    v21 = v27;

    v26 = v21;
    objc_msgSend(v10, "writeToFile:options:error:", v18, 0, &v26);
    v15 = v26;

    v16 = v15 == 0;
    if (v15)
    {
      v22 = sub_100011D0C();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_100064DE0();

      *a5 = objc_retainAutorelease(v15);
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache serverChangeTokens](self, "serverChangeTokens"));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, v9);

    }
  }

  return v16;
}

- (BOOL)removeServerChangeTokenForZoneWithID:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v23;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](self, "scopeStringForAccountWithScope:", a4));
  v10 = objc_msgSend((id)objc_opt_class(self), "pathToServerChangeTokenDataForZoneWithID:inDatabaseWithScope:", v8, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = 0;
    v15 = objc_msgSend(v14, "removeItemAtPath:error:", v11, &v23);
    v16 = v23;

    if ((v15 & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache zoneServerChangeTokens](self, "zoneServerChangeTokens"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v9));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, v8);

    }
    else
    {
      v20 = sub_100011D0C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100064EB8();

      v16 = objc_retainAutorelease(v16);
      *a5 = v16;
    }
  }
  else
  {
    v19 = sub_100011D0C();
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100064F24();
    v15 = 1;
  }

  return v15;
}

- (BOOL)updateServerChangeToken:(id)a3 forZoneWithID:(id)a4 inDatabaseWithScope:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](self, "scopeStringForAccountWithScope:", a5));
  v32 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v32));
  v14 = v32;
  if (v14)
  {
    v15 = v14;
    v16 = sub_100011D0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100064FFC();

    v18 = objc_retainAutorelease(v15);
    v19 = 0;
    *a6 = v18;
  }
  else
  {
    v20 = objc_msgSend((id)objc_opt_class(self), "pathToServerChangeTokenDataForZoneWithID:inDatabaseWithScope:", v11, a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByDeletingLastPathComponent"));
    v31 = 0;
    objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v23, 1, 0, &v31);
    v24 = v31;

    v30 = v24;
    objc_msgSend(v13, "writeToFile:options:error:", v21, 0, &v30);
    v18 = v30;

    v19 = v18 == 0;
    if (v18)
    {
      v25 = sub_100011D0C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_100064F90();

      *a6 = objc_retainAutorelease(v18);
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache zoneServerChangeTokens](self, "zoneServerChangeTokens"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v12));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v10, v11);

    }
  }

  return v19;
}

- (id)serverChangeTokenForZoneWithID:(id)a3 inDatabaseWithScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](self, "scopeStringForAccountWithScope:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache zoneServerChangeTokens](self, "zoneServerChangeTokens"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));

  if (!v10)
  {
    v13 = objc_msgSend((id)objc_opt_class(self), "pathToServerChangeTokenDataForZoneWithID:inDatabaseWithScope:", v6, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = objc_msgSend(v15, "fileExistsAtPath:", v14);

    if ((v16 & 1) != 0)
    {
      v32 = 0;
      v17 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v14, 0, &v32));
      v18 = v32;
      if (!v18 && v17)
      {
        v31 = 0;
        v19 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CKServerChangeToken), v17, &v31);
        v11 = (id)objc_claimAutoreleasedReturnValue(v19);
        v20 = v31;
        if (!v20)
        {
          if (v6 && v11 && v7)
          {
            v28 = objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache zoneServerChangeTokens](self, "zoneServerChangeTokens"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v7));
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v11, v6);

          }
          else
          {
            v30 = sub_100011D0C();
            v28 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v34 = "-[FMFCloudKitCache serverChangeTokenForZoneWithID:inDatabaseWithScope:]";
              v35 = 2112;
              v36 = 0;
              v37 = 2112;
              v38 = v6;
              v39 = 2112;
              v40 = v11;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s: Invalid scope, ID, or zoneServerChangeToken. Scope: %@, zoneID: %@, zoneServerChangeToken: %@", buf, 0x2Au);
            }
          }

          v11 = v11;
          v12 = v11;
          goto LABEL_17;
        }
        v21 = v20;
        v22 = sub_100011D0C();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_100065068();

LABEL_16:
        v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v25 = sub_100011D0C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1000650D4();

    }
    else
    {
      v24 = sub_100011D0C();
      v17 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        sub_100065140();
    }
    v11 = 0;
    goto LABEL_16;
  }
  v11 = v10;
  v12 = v11;
LABEL_18:

  return v12;
}

- (BOOL)updateRecord:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](self, "scopeStringForAccountWithScope:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
  v30 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v30));
  v12 = v30;
  if (v12)
  {
    v13 = v12;
    v14 = sub_100011D0C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100065218();

    v16 = objc_retainAutorelease(v13);
    v17 = 0;
    *a5 = v16;
  }
  else
  {
    v18 = objc_msgSend((id)objc_opt_class(self), "pathToDataForRecordWithID:inDatabaseWithScope:", v10, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByDeletingLastPathComponent"));
    v29 = 0;
    objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v29);
    v22 = v29;

    v28 = v22;
    objc_msgSend(v11, "writeToFile:options:error:", v19, 0, &v28);
    v16 = v28;

    v17 = v16 == 0;
    if (v16)
    {
      v23 = sub_100011D0C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_1000651AC();

      *a5 = objc_retainAutorelease(v16);
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache records](self, "records"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v9));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v8, v10);

    }
  }

  return v17;
}

- (BOOL)removeRecordWithID:(id)a3 inDatabaseWithScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v23;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](self, "scopeStringForAccountWithScope:", a4));
  v10 = objc_msgSend((id)objc_opt_class(self), "pathToDataForRecordWithID:inDatabaseWithScope:", v8, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = 0;
    v15 = objc_msgSend(v14, "removeItemAtPath:error:", v11, &v23);
    v16 = v23;

    if ((v15 & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache records](self, "records"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v9));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, v8);

    }
    else
    {
      v20 = sub_100011D0C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100065284();

      v16 = objc_retainAutorelease(v16);
      *a5 = v16;
    }
  }
  else
  {
    v19 = sub_100011D0C();
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000652F0();
    v15 = 1;
  }

  return v15;
}

- (id)recordWithID:(id)a3 inDatabaseWithScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache scopeStringForAccountWithScope:](self, "scopeStringForAccountWithScope:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache records](self, "records"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));

  if (!v10)
  {
    v13 = objc_msgSend((id)objc_opt_class(self), "pathToDataForRecordWithID:inDatabaseWithScope:", v6, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = objc_msgSend(v15, "fileExistsAtPath:", v14);

    if ((v16 & 1) == 0)
    {
      v22 = sub_100011D0C();
      v19 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100065434();
      v11 = 0;
      v12 = 0;
      goto LABEL_17;
    }
    v30 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v14, 0, &v30));
    v18 = v30;
    if (v18)
    {
      v19 = v18;
      v20 = sub_100011D0C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1000653C8();
      v11 = 0;
    }
    else
    {
      v31[0] = objc_opt_class(CKRecord);
      v31[1] = objc_opt_class(CKShare);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
      v21 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));

      v29 = 0;
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v21, v17, &v29));
      v19 = v29;
      if (!v19)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCloudKitCache records](self, "records"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v7));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v11, v6);

        v11 = v11;
        v12 = v11;
        goto LABEL_16;
      }
      v24 = sub_100011D0C();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10006535C();

    }
    v12 = 0;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  v11 = v10;
  v12 = v11;
LABEL_18:

  return v12;
}

- (NSMutableDictionary)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (NSMutableDictionary)zoneServerChangeTokens
{
  return self->_zoneServerChangeTokens;
}

- (void)setZoneServerChangeTokens:(id)a3
{
  objc_storeStrong((id *)&self->_zoneServerChangeTokens, a3);
}

- (NSMutableDictionary)serverChangeTokens
{
  return self->_serverChangeTokens;
}

- (void)setServerChangeTokens:(id)a3
{
  objc_storeStrong((id *)&self->_serverChangeTokens, a3);
}

- (OS_dispatch_queue)accountQueue
{
  return self->_accountQueue;
}

- (void)setAccountQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountQueue, 0);
  objc_storeStrong((id *)&self->_serverChangeTokens, 0);
  objc_storeStrong((id *)&self->_zoneServerChangeTokens, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

@end
