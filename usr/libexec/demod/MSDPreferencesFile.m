@implementation MSDPreferencesFile

+ (id)sharedInstance
{
  if (qword_1001751C8 != -1)
    dispatch_once(&qword_1001751C8, &stru_10013DE48);
  return (id)qword_1001751C0;
}

- (MSDPreferencesFile)init
{
  MSDPreferencesFile *v2;
  MSDPreferencesFile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDPreferencesFile;
  v2 = -[MSDPreferencesFile init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MSDPreferencesFile populateCache](v2, "populateCache");
  return v3;
}

+ (id)preferencesFilePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFileUrl](MSDPreferencesFile, "preferencesFileUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));

  return v3;
}

+ (BOOL)preferencesFileExists
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFilePath](MSDPreferencesFile, "preferencesFilePath"));
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  return v4;
}

- (void)reload
{
  MSDPreferencesFile *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MSDPreferencesFile populateCache](obj, "populateCache");
  objc_sync_exit(obj);

}

- (id)objectForKey:(id)a3
{
  id v4;
  MSDPreferencesFile *v5;
  void *v6;
  void *v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile cache](v5, "cache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

    objc_sync_exit(v5);
  }
  else
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000BAD54(v10, v11, v12, v13, v14, v15, v16, v17);

    v7 = 0;
  }

  return v7;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  MSDPreferencesFile *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  const char *v18;
  id v19;
  int v21;
  const char *v22;

  v6 = a3;
  v7 = a4;
  v9 = v7;
  if (!v6 || !v7)
  {
    v17 = sub_1000604F0();
    v13 = (MSDPreferencesFile *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136446210;
      v22 = "-[MSDPreferencesFile setObject:forKey:]";
      v18 = "%{public}s - Both object and key must be non-nil.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, &v13->super, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, 0xCu);
    }
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v10 = objc_opt_class(NSString, v8);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v19 = sub_1000604F0();
    v13 = (MSDPreferencesFile *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136446210;
      v22 = "-[MSDPreferencesFile setObject:forKey:]";
      v18 = "%{public}s - Key must be of type NSString.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!+[NSPropertyListSerialization propertyList:isValidForFormat:](NSPropertyListSerialization, "propertyList:isValidForFormat:", v6, 100))-[MSDPreferencesFile raiseInvalidPropertyListObjectExceptionForObject:](self, "raiseInvalidPropertyListObjectExceptionForObject:", v6);
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_1000BADC4((uint64_t)v9, (uint64_t)v6, v12);

  v13 = self;
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile cache](v13, "cache"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile deepCopy:](v13, "deepCopy:", v6));
  objc_msgSend(v14, "setObject:forKey:", v15, v9);

  v16 = -[MSDPreferencesFile saveCache](v13, "saveCache");
  objc_sync_exit(v13);
LABEL_15:

  return v16;
}

- (BOOL)removeObjectForKey:(id)a3
{
  id v4;
  MSDPreferencesFile *v5;
  void *v6;
  unsigned __int8 v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile cache](v5, "cache"));
    objc_msgSend(v6, "removeObjectForKey:", v4);

    v7 = -[MSDPreferencesFile saveCache](v5, "saveCache");
    objc_sync_exit(v5);

  }
  else
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000BAE44(v10, v11, v12, v13, v14, v15, v16, v17);

    v7 = 0;
  }

  return v7;
}

- (BOOL)removeObjectsForKeys:(id)a3
{
  id v4;
  MSDPreferencesFile *v5;
  void *v6;
  unsigned __int8 v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile cache](v5, "cache"));
    objc_msgSend(v6, "removeObjectsForKeys:", v4);

    v7 = -[MSDPreferencesFile saveCache](v5, "saveCache");
    objc_sync_exit(v5);

  }
  else
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000BAEB4(v10, v11, v12, v13, v14, v15, v16, v17);

    v7 = 0;
  }

  return v7;
}

- (void)populateCache
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;

  if (!+[MSDPreferencesFile preferencesFileExists](MSDPreferencesFile, "preferencesFileExists"))
  {
LABEL_7:
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    -[MSDPreferencesFile setCache:](self, "setCache:", v4);
    goto LABEL_8;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFileUrl](MSDPreferencesFile, "preferencesFileUrl"));
  v10 = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v3, &v10));
  v5 = v10;

  if (!v4)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFilePath](MSDPreferencesFile, "preferencesFilePath"));
      *(_DWORD *)buf = 136446722;
      v12 = "-[MSDPreferencesFile populateCache]";
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s - Failed to read preferences file:  %{public}@ - Error:  %{public}@", buf, 0x20u);

    }
    goto LABEL_7;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));
  -[MSDPreferencesFile setCache:](self, "setCache:", v6);

LABEL_8:
}

- (BOOL)saveCache
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPreferencesFile cache](self, "cache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFileUrl](MSDPreferencesFile, "preferencesFileUrl"));
  v10 = 0;
  v4 = objc_msgSend(v2, "writeToURL:error:", v3, &v10);
  v5 = v10;

  if ((v4 & 1) == 0)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFilePath](MSDPreferencesFile, "preferencesFilePath"));
      *(_DWORD *)buf = 136446722;
      v12 = "-[MSDPreferencesFile saveCache]";
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - Failed to save preferences file:  %{public}@ - Error:  %{public}@", buf, 0x20u);

    }
  }

  return v4;
}

- (void)raiseInvalidPropertyListObjectExceptionForObject:(id)a3
{
  id v3;
  uint64_t v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;

  v3 = a3;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Object %@ of type %@ is not a valid property list object."), v3, objc_opt_class(v3, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("InvalidPropertyListObject"), v6, 0));
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[MSDPreferencesFile raiseInvalidPropertyListObjectExceptionForObject:]";
    v12 = 2114;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s - Exception:  %{public}@", buf, 0x16u);
  }

  objc_msgSend(v7, "raise");
}

+ (id)preferencesFileUrl
{
  if (qword_1001751D8 != -1)
    dispatch_once(&qword_1001751D8, &stru_10013DE68);
  return (id)qword_1001751D0;
}

- (id)deepCopy:(id)a3
{
  return (id)(id)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, a3, 0);
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
