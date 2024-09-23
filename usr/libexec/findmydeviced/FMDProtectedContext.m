@implementation FMDProtectedContext

- (FMDProtectedContext)initWithContextKey:(id)a3
{
  return -[FMDProtectedContext initWithContextKey:contextUUID:](self, "initWithContextKey:contextUUID:", a3, 0);
}

- (FMDProtectedContext)initWithContextKey:(id)a3 contextUUID:(id)a4
{
  id v6;
  id v7;
  FMDProtectedContext *v8;
  FMDProtectedContext *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FMDProtectedContext;
  v8 = -[FMDProtectedContext init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    -[FMDProtectedContext setContextKey:](v8, "setContextKey:", v6);
    if (v7)
    {
      -[FMDProtectedContext setContextUUID:](v9, "setContextUUID:", v7);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      -[FMDProtectedContext setContextUUID:](v9, "setContextUUID:", v10);

    }
    -[FMDProtectedContext setProtectionClass:](v9, "setProtectionClass:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextKey](v9, "contextKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext fileURLForContextKey:](v9, "fileURLForContextKey:", v11));

    -[FMDProtectedContext setupDataArchiverWithURL:](v9, "setupDataArchiverWithURL:", v12);
  }

  return v9;
}

- (void)setProtectionClass:(int64_t)a3
{
  int64_t v4;
  id v5;

  self->_protectionClass = a3;
  v4 = -[FMDProtectedContext _fmDataProtectionClass](self, "_fmDataProtectionClass");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext dataArchiver](self, "dataArchiver"));
  objc_msgSend(v5, "setDataProtectionClass:", v4);

}

- (void)setupDataArchiverWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)FMDataArchiver), "initWithFileURL:", v4);
    -[NSObject setBackedUp:](v5, "setBackedUp:", 0);
    -[NSObject setCreateDirectories:](v5, "setCreateDirectories:", 1);
    -[NSObject setDataProtectionClass:](v5, "setDataProtectionClass:", -[FMDProtectedContext _fmDataProtectionClass](self, "_fmDataProtectionClass"));
    -[FMDProtectedContext setDataArchiver:](self, "setDataArchiver:", v5);
  }
  else
  {
    v6 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1002263F4(self, v5);
  }

}

- (void)saveContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextKey](self, "contextKey"));
  v8 = v5;
  v9 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  -[FMDProtectedContext setContextDictionary:](self, "setContextDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextKey](self, "contextKey"));
  -[FMDProtectedContext saveForContextKey:](self, "saveForContextKey:", v7);

}

- (id)context:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextKey](self, "contextKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextForContextKey:error:](self, "contextForContextKey:error:", v5, a3));

  return v6;
}

+ (id)directoryURLForContextKey:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v13;
  void *v14;

  v5 = a3;
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(a1, v4), "rootDirectoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 1));

  }
  else
  {
    v9 = 0;
  }
  v10 = sub_1000031B8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "New protected context directory URL %@", (uint8_t *)&v13, 0xCu);
  }

  return v9;
}

+ (id)rootDirectoryURL
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  if (+[FMDProtectedContext isUnittest](FMDProtectedContext, "isUnittest"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContext unittestRootURL](FMDProtectedContext, "unittestRootURL"));
  }
  else
  {
    v3 = objc_alloc_init((Class)FMInternalFileContainer);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_preferencesPathURLForDomain:", CFSTR("com.apple.icloud.findmydeviced.protectedcontext")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByDeletingLastPathComponent"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("protectedContexts"), 1));

    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10022647C();

  }
  return v2;
}

+ (void)setIsUnittest:(BOOL)a3
{
  byte_100306490 = a3;
}

+ (BOOL)isUnittest
{
  return byte_100306490;
}

+ (void)setUnittestRootURL:(id)a3
{
  objc_storeStrong((id *)&qword_100306488, a3);
}

+ (NSURL)unittestRootURL
{
  return (NSURL *)(id)qword_100306488;
}

- (id)fileURLForContextKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContext directoryURLForContextKey:](FMDProtectedContext, "directoryURLForContextKey:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextUUID](self, "contextUUID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextUUID](self, "contextUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v7, 0));
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1002264DC();

  }
  return v5;
}

- (id)contextForContextKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  NSErrorUserInfoKey v24;
  id v25;
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextDictionary](self, "contextDictionary"));
  v8 = objc_msgSend(v7, "copy");

  if (!v8)
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10022653C();

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext dataArchiver](self, "dataArchiver"));
    v13 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v23 = 0;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "readDictionaryAndClasses:error:", v14, &v23));
    v15 = v23;

    if (v15)
    {
      v16 = sub_1000031B8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to read %@", buf, 0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerGeneral sharedInstance](FMDEventLoggerGeneral, "sharedInstance"));
      objc_msgSend(v18, "sendError:forEventName:", v15, CFSTR("FMDProtectedContextFailedReadEventName"));

      v24 = NSUnderlyingErrorKey;
      v25 = v15;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.findmydeviced.protectedcontext"), 1, v19));

      if (a4)
        *a4 = objc_retainAutorelease(v20);

    }
    -[FMDProtectedContext setContextDictionary:](self, "setContextDictionary:", v8);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  return v21;
}

- (void)saveForContextKey:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextDictionary](self, "contextDictionary", a3));

  if (v4)
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10022662C(self, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext dataArchiver](self, "dataArchiver"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextDictionary](self, "contextDictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "saveDictionary:", v8));

    if (v9)
    {
      v10 = sub_1000031B8();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10022659C(v9, v11);

    }
  }
}

- (int64_t)_fmDataProtectionClass
{
  return -[FMDProtectedContext protectionClass](self, "protectionClass");
}

- (NSUUID)contextUUID
{
  return self->_contextUUID;
}

- (void)setContextUUID:(id)a3
{
  objc_storeStrong((id *)&self->_contextUUID, a3);
}

- (int64_t)protectionClass
{
  return self->_protectionClass;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (void)setContextDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_contextDictionary, a3);
}

- (NSString)contextKey
{
  return self->_contextKey;
}

- (void)setContextKey:(id)a3
{
  objc_storeStrong((id *)&self->_contextKey, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_contextKey, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_contextUUID, 0);
}

@end
