@implementation STUFileBackedDirectoryDataStore

- (STUFileBackedDirectoryDataStore)initWithBaseURL:(id)a3
{
  id v6;
  STUFileBackedDirectoryDataStore *v7;
  STUFileBackedDirectoryDataStore *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUFileBackedDirectoryDataStore.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v11.receiver = self;
  v11.super_class = (Class)STUFileBackedDirectoryDataStore;
  v7 = -[STUFileBackedDirectoryDataStore init](&v11, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->mBaseURL, a3);

  return v8;
}

- (id)stu_urlForKey:(id)a3
{
  NSURL *mBaseURL;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  mBaseURL = self->mBaseURL;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](mBaseURL, "path"));
  v9[0] = v5;
  v9[1] = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v6));

  return v7;
}

- (id)stu_plistObjectForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUFileBackedDirectoryDataStore stu_urlForKey:](self, "stu_urlForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v3));
  if (v4)
  {
    v10 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 0, 0, &v10));
    v6 = v10;
    if (!v5)
    {
      v7 = sub_100026878();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10007B664();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)stu_setPlistObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  unsigned __int8 v14;
  NSObject *v15;
  id v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUFileBackedDirectoryDataStore stu_urlForKey:](self, "stu_urlForKey:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByDeletingLastPathComponent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) != 0)
  {
    v13 = 0;
    goto LABEL_4;
  }
  v27 = 0;
  v14 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v27);
  v13 = v27;
  if ((v14 & 1) != 0)
  {
LABEL_4:
    if (v6)
    {
      v26 = 0;
      v15 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v6, 200, 0, &v26));
      v16 = v26;

      if (v15)
      {
        v25 = v16;
        v17 = -[NSObject writeToURL:options:error:](v15, "writeToURL:options:error:", v8, 268435457, &v25);
        v13 = v25;

        if ((v17 & 1) != 0)
        {
          v18 = 1;
          goto LABEL_19;
        }
        v22 = sub_100026878();
        v21 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_10007B6C4();
        v16 = v13;
      }
      else
      {
        v20 = sub_100026878();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v29 = v6;
          v30 = 2114;
          v31 = v7;
          v32 = 2114;
          v33 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to serialize object %{public}@ for key %{public}@: %{public}@", buf, 0x20u);
        }
      }

      v18 = 0;
    }
    else
    {
      v15 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v24 = v13;
      v18 = -[NSObject removeItemAtURL:error:](v15, "removeItemAtURL:error:", v8, &v24);
      v16 = v24;

    }
    v13 = v16;
    goto LABEL_19;
  }
  v19 = sub_100026878();
  v15 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_10007B724((uint64_t)v9, v15);
  v18 = 0;
LABEL_19:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBaseURL, 0);
}

@end
