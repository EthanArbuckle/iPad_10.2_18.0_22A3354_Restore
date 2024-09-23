@implementation GKDataTransport

+ (GKDataTransport)transportWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5
{
  id v7;
  id v8;
  id v9;
  GKDataTransport *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[GKDataTransport initWithBag:clientProxy:credential:]([GKDataTransport alloc], "initWithBag:clientProxy:credential:", v9, v8, v7);

  return v10;
}

- (GKDataTransport)initWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  GKDataTransport *v15;
  GKDataTransport *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  GKActivity *activity;
  objc_super v22;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!os_log_GKGeneral)
    v13 = (id)GKOSLoggers(v11);
  v14 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKDataTransport: initWithBag:", buf, 2u);
  }
  v22.receiver = self;
  v22.super_class = (Class)GKDataTransport;
  v15 = -[GKDataTransport init](&v22, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_storeBag, a3);
    objc_storeStrong((id *)&v16->_clientProxy, a4);
    objc_storeStrong((id *)&v16->_credential, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKDataTransport - %@"), v17));
    v19 = objc_claimAutoreleasedReturnValue(+[GKActivity named:](GKActivity, "named:", v18));
    activity = v16->_activity;
    v16->_activity = (GKActivity *)v19;

  }
  return v16;
}

- (GKPlayerCredential)credential
{
  return self->_credential;
}

- (id)errorForBagError:(id)a3 serverError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v9 = objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, NSUnderlyingErrorKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v7, "code"), v9));

  }
  else
  {
    if (v6)
    {
      v12 = v6;
    }
    else
    {
      if (!v5)
      {
        v11 = 0;
        goto LABEL_9;
      }
      v12 = v5;
    }
    v11 = v12;
  }
LABEL_9:

  return v11;
}

- (void)postRequest:(id)a3 forBagKey:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataTransport activity](self, "activity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("postRequest method:%@ bagKey:%@"), CFSTR("default"), v9));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D7F74;
  v16[3] = &unk_1002BB518;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v11, "childNamed:execute:", v12, v16);

}

- (void)postRequest:(id)a3 forBagKey:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataTransport activity](self, "activity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataTransport.m", 94, "-[GKDataTransport postRequest:forBagKey:result:]"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D8344;
  v16[3] = &unk_1002BB518;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v11, "childNamed:execute:", v12, v16);

}

- (id)language
{
  return -[GKClientProxy language](self->_clientProxy, "language");
}

- (GKStoreBag)storeBag
{
  return self->_storeBag;
}

- (void)setStoreBag:(id)a3
{
  objc_storeStrong((id *)&self->_storeBag, a3);
}

- (GKClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (GKActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_storeBag, 0);
}

@end
