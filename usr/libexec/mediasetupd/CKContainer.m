@implementation CKContainer

+ (id)MSDCloudKitContainer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021AC0;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_1000527A0 != -1)
    dispatch_once(&qword_1000527A0, block);
  return (id)qword_100052798;
}

+ (id)MSDCloudKitContainerID
{
  return kMediaSetupCloudKitContainerIdentifier;
}

+ (id)MSDPublicCloudKitContainer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021BEC;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_1000527B0 != -1)
    dispatch_once(&qword_1000527B0, block);
  return (id)qword_1000527A8;
}

+ (id)MSDPublicCloudKitContainerID
{
  return kMediaSetupPublicCloudKitContainerIdentifier;
}

- (void)acceptShareWithShareMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *);
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315395;
    v24 = "-[CKContainer(MSDCloudDataContainer) acceptShareWithShareMetadata:completion:]";
    v25 = 2113;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s shareMetaData %{private}@", buf, 0x16u);
  }

  if (v6)
  {
    v10 = objc_alloc((Class)CKAcceptSharesOperation);
    v20 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v12 = objc_msgSend(v10, "initWithShareMetadatas:", v11);

    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_100021E94;
    v18 = &unk_100049F08;
    v19 = v7;
    objc_msgSend(v12, "setPerShareCompletionBlock:", &v15);
    objc_msgSend(v12, "setQualityOfService:", 17, v15, v16, v17, v18);
    -[CKContainer addOperation:](self, "addOperation:", v12);
    v13 = v19;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v14 = MSErrorDomain;
    v21 = MSUserInfoErrorStringKey;
    v22 = CFSTR("Failed to accept share for Nil ShareMetaData");
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, 1, v12));
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)fetchShareMetadataForShareURL:(id)a3 withShareToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_10002E034();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315651;
    v30 = "-[CKContainer(MSDCloudDataContainer) fetchShareMetadataForShareURL:withShareToken:completion:]";
    v31 = 2113;
    v32 = v8;
    v33 = 2113;
    v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s URL %{private}@ shareToken  %{private}@", buf, 0x20u);
  }

  if (v8)
  {
    v13 = objc_alloc((Class)CKFetchShareMetadataOperation);
    if (v9)
    {
      v26 = v8;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
      v24 = v8;
      v25 = v9;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      v16 = objc_msgSend(v13, "initWithShareURLs:invitationTokensByShareURL:", v14, v15);

    }
    else
    {
      v23 = v8;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
      v16 = objc_msgSend(v13, "initWithShareURLs:", v14);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100022200;
    v21[3] = &unk_100049F30;
    v22 = v10;
    objc_msgSend(v16, "setPerShareMetadataBlock:", v21);
    objc_msgSend(v16, "setFetchShareMetadataCompletionBlock:", &stru_100049F50);
    objc_msgSend(v16, "setQualityOfService:", 17);
    -[CKContainer addOperation:](self, "addOperation:", v16);
    v20 = v22;
    goto LABEL_12;
  }
  v17 = sub_10002E034();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_1000223B0(v18);

  if (v10)
  {
    v19 = MSErrorDomain;
    v27 = MSUserInfoErrorStringKey;
    v28 = CFSTR("Failed to fetchShareMetadata for Nil Share URL");
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, 1, v16));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v20);
LABEL_12:

  }
}

@end
