@implementation FRNewsReferralItemDecoder

- (FRNewsReferralItemDecoder)init
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
    v6 = "-[FRNewsReferralItemDecoder init]";
    v7 = 2080;
    v8 = "FRNewsReferralItemEncoding.m";
    v9 = 1024;
    v10 = 147;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRNewsReferralItemDecoder init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FRNewsReferralItemDecoder)initWithAssetManager:(id)a3
{
  id v5;
  FRNewsReferralItemDecoder *v6;
  FRNewsReferralItemDecoder *v7;
  objc_super v9;

  v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000782B0();
  v9.receiver = self;
  v9.super_class = (Class)FRNewsReferralItemDecoder;
  v6 = -[FRNewsReferralItemDecoder init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetManager, a3);

  return v7;
}

- (id)destructivelyDecodeReferraltemOfClass:(Class)a3 withQueryValue:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v30;
  void *v31;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;

  v6 = a4;
  if (!a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100078420();
    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100078368();
LABEL_6:
  v33 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = -[objc_class encodableElementClass](a3, "encodableElementClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("dictionary"), 0));
  v11 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:", v10);
  v13 = objc_opt_class(NSDictionary, v12);
  v15 = objc_opt_class(NSString, v14);
  v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v15, v9, objc_opt_class(NSURL, v16), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v31 = v11;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v18, v11, 0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("a")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("b")));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000213D4;
  v35[3] = &unk_1000D9A80;
  v22 = (id)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemDecoder assetManager](self, "assetManager"));
  v36 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v35));
  v24 = objc_msgSend([a3 alloc], "initWithEncodableElement:assetHandlesByRemoteURL:", v20, v23);
  v34 = 0;
  objc_msgSend(v8, "removeItemAtURL:error:", v7, &v34);
  v25 = v34;
  v26 = v25;
  if (a5)
  {
    v30 = v22;
    v27 = v25;
    *a5 = objc_retainAutorelease(v25);
    v26 = v27;
    v22 = v30;
  }

  return v24;
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end
