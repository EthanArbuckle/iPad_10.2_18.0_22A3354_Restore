@implementation KTAccountStateHolder

- (KTAccountStateHolder)initWithFileStorage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  KTAccountStateHolder *v7;
  KTAccountStateHolder *v8;
  NSObject *v9;
  objc_super v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  if (v4)
  {
LABEL_4:
    v11.receiver = self;
    v11.super_class = (Class)KTAccountStateHolder;
    v7 = -[KTAccountStateHolder init](&v11, "init");
    v8 = v7;
    if (v7)
      -[KTAccountStateHolder setUrl:](v7, "setUrl:", v4);
    goto LABEL_11;
  }
  v12 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", &v12));
  v6 = v12;
  if (v5)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("AccountState.pblist")));

    goto LABEL_4;
  }
  if (qword_1002A7BC8 != -1)
    dispatch_once(&qword_1002A7BC8, &stru_10024C700);
  v9 = qword_1002A7BD0;
  if (os_log_type_enabled((os_log_t)qword_1002A7BD0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "TransparencyFileSupport transparencyFilesPath: %@", buf, 0xCu);
  }

  v4 = 0;
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)loadAccountMetadata
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v2));

  if (v3)
  {
    v10 = 0;
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(KTAccountState, v4), v3, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v10;
    if (!v6)
    {
      if (qword_1002A7BC8 != -1)
        dispatch_once(&qword_1002A7BC8, &stru_10024C720);
      v8 = qword_1002A7BD0;
      if (os_log_type_enabled((os_log_t)qword_1002A7BD0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "loadAccountMetadata failed: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)persistAccountChanges:(id)a3
{
  uint64_t (**v4)(id, KTAccountState *);
  KTAccountState *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v4 = (uint64_t (**)(id, KTAccountState *))a3;
  v5 = (KTAccountState *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder loadAccountMetadata](self, "loadAccountMetadata"));
  if (!v5)
    v5 = objc_alloc_init(KTAccountState);
  v6 = v4[2](v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v20 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v20));
  v9 = v20;
  if (!v8)
  {
    if (qword_1002A7BC8 != -1)
      dispatch_once(&qword_1002A7BC8, &stru_10024C740);
    v13 = qword_1002A7BD0;
    if (os_log_type_enabled((os_log_t)qword_1002A7BD0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "persistAccountChanges failed archive: %@", buf, 0xCu);
    }

    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
  v19 = v9;
  objc_msgSend(v8, "writeToURL:options:error:", v10, 268435457, &v19);
  v11 = v19;

  if (v11)
  {
    if (qword_1002A7BC8 != -1)
      dispatch_once(&qword_1002A7BC8, &stru_10024C760);
    v12 = qword_1002A7BD0;
    if (os_log_type_enabled((os_log_t)qword_1002A7BD0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "persistAccountChanges failed write: %@", buf, 0xCu);
    }

LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  if (qword_1002A7BC8 != -1)
    dispatch_once(&qword_1002A7BC8, &stru_10024C780);
  v16 = (void *)qword_1002A7BD0;
  v14 = 1;
  if (os_log_type_enabled((os_log_t)qword_1002A7BD0, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
    *(_DWORD *)buf = 138412290;
    v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "wrote account metadata: %@", buf, 0xCu);

  }
LABEL_16:

  return v14;
}

- (void)clearAccountMetadata
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  if (qword_1002A7BC8 != -1)
    dispatch_once(&qword_1002A7BC8, &stru_10024C7A0);
  v3 = (void *)qword_1002A7BD0;
  if (os_log_type_enabled((os_log_t)qword_1002A7BD0, OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "deleting account metadata: %@", (uint8_t *)&v8, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
  objc_msgSend(v6, "removeItemAtURL:error:", v7, 0);

}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
