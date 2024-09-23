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
    sub_100004DD8();
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
  NSSet *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v27;
  void *v28;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v6 = a4;
  if (!a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100004F48();
    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100004E90();
LABEL_6:
  v30 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = -[objc_class encodableElementClass](a3, "encodableElementClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("dictionary"), 0));
  v11 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:", v10);
  v12 = objc_opt_class(NSDictionary);
  v13 = objc_opt_class(NSString);
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v9, objc_opt_class(NSURL), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v28 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v15, v11, 0));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("a")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("b")));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100004158;
  v32[3] = &unk_1000083F0;
  v19 = (id)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemDecoder assetManager](self, "assetManager"));
  v33 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v32));
  v21 = objc_msgSend([a3 alloc], "initWithEncodableElement:assetHandlesByRemoteURL:", v17, v20);
  v31 = 0;
  objc_msgSend(v8, "removeItemAtURL:error:", v7, &v31);
  v22 = v31;
  v23 = v22;
  if (a5)
  {
    v27 = v19;
    v24 = v22;
    *a5 = objc_retainAutorelease(v22);
    v23 = v24;
    v19 = v27;
  }

  return v21;
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
