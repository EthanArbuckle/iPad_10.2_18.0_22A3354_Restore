@implementation FRNewsReferralItemEncoder

- (FRNewsReferralItemEncoder)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRNewsReferralItemEncoder init]";
    v7 = 2080;
    v8 = "FRNewsReferralItemEncoding.m";
    v9 = 1024;
    v10 = 27;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRNewsReferralItemEncoder init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FRNewsReferralItemEncoder)initWithReferralItem:(id)a3 sharedDirectoryFileURL:(id)a4
{
  id v6;
  id v7;
  FRNewsReferralItemEncoder *v8;
  FRNewsReferralItem *v9;
  FRNewsReferralItem *referralItem;
  NSURL *v11;
  NSURL *sharedDirectoryFileURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100004C68();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100004BB0();
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FRNewsReferralItemEncoder;
  v8 = -[FRNewsReferralItemEncoder init](&v14, "init");
  if (v8)
  {
    v9 = (FRNewsReferralItem *)objc_msgSend(v6, "copy");
    referralItem = v8->_referralItem;
    v8->_referralItem = v9;

    v11 = (NSURL *)objc_msgSend(v7, "copy");
    sharedDirectoryFileURL = v8->_sharedDirectoryFileURL;
    v8->_sharedDirectoryFileURL = v11;

  }
  return v8;
}

- (id)encodeQueryValueWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  id v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  void *v18;
  id *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  NSMutableDictionary *v29;
  uint64_t *v30;
  id obj;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_100003B00;
  v36 = sub_100003B10;
  v37 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemEncoder sharedDirectoryFileURL](self, "sharedDirectoryFileURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 1));

  v10 = (id *)(v33 + 5);
  obj = (id)v33[5];
  objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &obj);
  objc_storeStrong(v10, obj);
  if (v33[5])
  {
    v11 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemEncoder referralItem](self, "referralItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetHandles"));
    v14 = objc_opt_new(NSMutableDictionary);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100003B18;
    v26[3] = &unk_1000083C8;
    v15 = v9;
    v27 = v15;
    v28 = v5;
    v30 = &v32;
    v16 = v14;
    v29 = v16;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);
    if (v33[5])
    {
      v11 = 0;
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "encodableElement"));
      v38[0] = CFSTR("a");
      v38[1] = CFSTR("b");
      v39[0] = v17;
      v39[1] = v16;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
      v22 = (void *)v17;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", CFSTR("dictionary"), 0));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, 0));
      v19 = (id *)(v33 + 5);
      v25 = (id)v33[5];
      objc_msgSend(v18, "writeToURL:options:error:", v23, 1, &v25);
      objc_storeStrong(v19, v25);
      v20 = v22;
      if (v33[5])
      {
        v11 = 0;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
        v20 = v22;
      }

    }
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v33[5]);

  _Block_object_dispose(&v32, 8);
  return v11;
}

- (FRNewsReferralItem)referralItem
{
  return self->_referralItem;
}

- (NSURL)sharedDirectoryFileURL
{
  return self->_sharedDirectoryFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDirectoryFileURL, 0);
  objc_storeStrong((id *)&self->_referralItem, 0);
}

@end
