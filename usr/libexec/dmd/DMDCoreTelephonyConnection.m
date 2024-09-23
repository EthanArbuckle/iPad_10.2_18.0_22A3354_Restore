@implementation DMDCoreTelephonyConnection

- (DMDCoreTelephonyConnection)init
{
  DMDCoreTelephonyConnection *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMDCoreTelephonyConnection;
  v2 = -[DMDCoreTelephonyConnection init](&v4, "init");
  if (v2)
    v2->ctConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue(kCFAllocatorDefault, CFSTR("com.apple.dmd"), &_dispatch_main_q, 0);
  return v2;
}

- (void)dealloc
{
  __CTServerConnection *ctConnection;
  objc_super v4;

  ctConnection = self->ctConnection;
  if (ctConnection)
  {
    CFRelease(ctConnection);
    self->ctConnection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DMDCoreTelephonyConnection;
  -[DMDCoreTelephonyConnection dealloc](&v4, "dealloc");
}

- (void)fetchCachedVinylInfoWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  __CTServerConnection *ctConnection;
  id v7;
  uint64_t CachedVinylInfo;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, int, void *);
  void *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  ctConnection = self->ctConnection;
  if (ctConnection)
  {
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_1000344D0;
    v20 = &unk_1000BAD28;
    v7 = v4;
    v21 = v7;
    CachedVinylInfo = _CTServerConnectionStandaloneGetCachedVinylInfo(ctConnection, &v17);
    if (HIDWORD(CachedVinylInfo))
    {
      v9 = CachedVinylInfo;
      v22[0] = DMFCoreTelephonyErrorCodeKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17, v18, v19, v20));
      v23[0] = v10;
      v22[1] = DMFCoreTelephonyErrorDomainKey;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
      v23[1] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000752BC();
      v13 = DMFErrorWithCodeAndUserInfo(204, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

    }
    else
    {
      _CTServerConnectionSendBarrier(self->ctConnection, 0);
    }

  }
  else
  {
    v15 = DMFErrorWithCodeAndUserInfo(200, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v16);

  }
}

- (void)refreshCellularPlansWithCSN:(id)a3 serverURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __CTServerConnection *ctConnection;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, int);
  void *v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "absoluteString"));
  ctConnection = self->ctConnection;
  if (ctConnection)
  {
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_10003477C;
    v25 = &unk_1000BAD50;
    v12 = v9;
    v26 = v12;
    v13 = _CTServerConnectionStandaloneDownloadProfile(ctConnection, v8, v10, &v22);
    if (HIDWORD(v13))
    {
      v14 = v13;
      v27[0] = DMFCoreTelephonyErrorCodeKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v22, v23, v24, v25));
      v28[0] = v15;
      v27[1] = DMFCoreTelephonyErrorDomainKey;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
      v28[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000753AC();
      v18 = DMFErrorWithCodeAndUserInfo(204, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      (*((void (**)(id, void *))v12 + 2))(v12, v19);

    }
    else
    {
      _CTServerConnectionSendBarrier(self->ctConnection, 0);
    }

  }
  else
  {
    v20 = DMFErrorWithCodeAndUserInfo(200, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    (*((void (**)(id, void *))v9 + 2))(v9, v21);

  }
}

@end
