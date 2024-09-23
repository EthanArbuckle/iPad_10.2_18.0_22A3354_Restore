@implementation ASPCarryLog_PersistentStateMgr

- (ASPCarryLog_PersistentStateMgr)initWithIdentifier:(id)a3
{
  id v5;
  ASPCarryLog_PersistentStateMgr *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *plistPath;
  void *v11;
  uint64_t v12;
  NSURL *plistUrl;
  NSMutableDictionary *stateDict;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSMutableDictionary *v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  ASPCarryLog_PersistentStateMgr *v36;
  id v38;
  id v39;
  id v40;
  objc_super v41;
  uint8_t buf[4];
  id v43;

  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)ASPCarryLog_PersistentStateMgr;
  v6 = -[ASPCarryLog_PersistentStateMgr init](&v41, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR(".plist")));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/NANDTelemetryServices"), "stringByAppendingPathComponent:", v8));
    plistPath = v6->_plistPath;
    v6->_plistPath = (NSString *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
    v12 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v11, 0));
    plistUrl = v6->_plistUrl;
    v6->_plistUrl = (NSURL *)v12;

    stateDict = v6->_stateDict;
    v6->_stateDict = 0;

    -[ASPCarryLog_PersistentStateMgr _tryInitializePlistDir](v6, "_tryInitializePlistDir");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
    v16 = objc_msgSend(v7, "fileExistsAtPath:", v15);

    v17 = 0;
    v18 = 0;
    if (v16)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistUrl](v6, "plistUrl"));
      v40 = 0;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v19, &v40));
      v20 = v40;

      if (v20)
      {
        v21 = (void *)oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
          sub_100040F28(v21, v6);
        v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
        v39 = v20;
        objc_msgSend(v7, "removeItemAtPath:error:", v22, &v39);
        v18 = v39;

      }
      else
      {
        v23 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v17));
        v18 = 0;
        v22 = v6->_stateDict;
        v6->_stateDict = (NSMutableDictionary *)v23;
      }

    }
    if (!v6->_stateDict)
    {
      v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v25 = v6->_stateDict;
      v6->_stateDict = v24;

      v26 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_retainAutorelease(v5);
        v28 = v26;
        v29 = objc_msgSend(v27, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v43 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Persistent state absent for %s. Generated an empty one.", buf, 0xCu);

      }
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
    v31 = objc_msgSend(v7, "fileExistsAtPath:", v30);

    if ((v31 & 1) == 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](v6, "stateDict"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistUrl](v6, "plistUrl"));
      v38 = v18;
      objc_msgSend(v32, "writeToURL:error:", v33, &v38);
      v34 = v38;

      v18 = v34;
      if (!v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistPath](v6, "plistPath"));
        disableFileBackUp(v35);

        v18 = 0;
      }
    }
    v36 = v6;

  }
  return v6;
}

- (void)_tryInitializePlistDir
{
  void *v2;
  unsigned int v3;
  BOOL v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  id v15;

  v13 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", CFSTR("/private/var/db/NANDTelemetryServices"), &v13);
  if (v3)
    v4 = v13 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v5 = (void *)oslog;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        sub_10004108C(v5);
      v12 = 0;
      objc_msgSend(v2, "removeItemAtPath:error:", CFSTR("/private/var/db/NANDTelemetryServices"), &v12);
      v6 = v12;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v5;
        v8 = objc_msgSend(CFSTR("/private/var/db/NANDTelemetryServices"), "UTF8String");
        *(_DWORD *)buf = 136315138;
        v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Plist directory %s does not exist. Creating it", buf, 0xCu);

      }
      v6 = 0;
    }
    v11 = v6;
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/db/NANDTelemetryServices"), 0, 0, &v11);
    v9 = v11;

    if (v9)
    {
      v10 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        sub_100040FC0(v10, v9);

    }
  }

}

- (id)getValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)saveValue:(id)a3 forKey:(id)a4 doPersist:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);

  if (v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistUrl](self, "plistUrl"));
    v14 = 0;
    objc_msgSend(v11, "writeToURL:error:", v12, &v14);
    v13 = v14;

  }
}

- (void)removeKey:(id)a3 doPersist:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
    objc_msgSend(v9, "removeObjectForKey:", v6);

    if (v4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr stateDict](self, "stateDict"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_PersistentStateMgr plistUrl](self, "plistUrl"));
      v13 = 0;
      objc_msgSend(v10, "writeToURL:error:", v11, &v13);
      v12 = v13;

    }
  }

}

- (NSMutableDictionary)stateDict
{
  return self->_stateDict;
}

- (void)setStateDict:(id)a3
{
  objc_storeStrong((id *)&self->_stateDict, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)plistPath
{
  return self->_plistPath;
}

- (void)setPlistPath:(id)a3
{
  objc_storeStrong((id *)&self->_plistPath, a3);
}

- (NSURL)plistUrl
{
  return self->_plistUrl;
}

- (void)setPlistUrl:(id)a3
{
  objc_storeStrong((id *)&self->_plistUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistUrl, 0);
  objc_storeStrong((id *)&self->_plistPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_stateDict, 0);
}

@end
