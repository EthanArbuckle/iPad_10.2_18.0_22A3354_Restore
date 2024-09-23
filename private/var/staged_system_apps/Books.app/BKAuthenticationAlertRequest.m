@implementation BKAuthenticationAlertRequest

+ (id)sharedRequester
{
  if (qword_1009F5200 != -1)
    dispatch_once(&qword_1009F5200, &stru_1008EE920);
  return (id)qword_1009F51F8;
}

- (BKAuthenticationAlertRequest)init
{
  BKAuthenticationAlertRequest *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *authQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAuthenticationAlertRequest;
  v2 = -[BKAuthenticationAlertRequest init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ibooks.authentication.request", 0);
    authQueue = v2->_authQueue;
    v2->_authQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AMSPromise cancel](self->_authPromise, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)BKAuthenticationAlertRequest;
  -[BKAuthenticationAlertRequest dealloc](&v3, "dealloc");
}

- (void)_notifyHandlers:(BOOL)a3
{
  NSObject *authQueue;
  _QWORD v4[5];
  BOOL v5;

  authQueue = self->_authQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C04C8;
  v4[3] = &unk_1008E83C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(authQueue, v4);
}

- (void)requestAuthenticationPolitely:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *authQueue;
  id v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;
  _QWORD block[4];
  id v21;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
  v8 = objc_msgSend(v7, "currentReachabilityStatus");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    if (objc_msgSend(v9, "launchedToTest"))
    {

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
      v11 = objc_msgSend(v10, "reading");

      if (!v11)
      {
        authQueue = self->_authQueue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1001C0730;
        v17[3] = &unk_1008E7388;
        v19 = a3;
        v17[4] = self;
        v18 = v6;
        v16 = v6;
        dispatch_async(authQueue, v17);
        v14 = v18;
        goto LABEL_6;
      }
    }
  }
  v12 = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0720;
  block[3] = &unk_1008E7818;
  v21 = v6;
  v13 = v6;
  dispatch_async(v12, block);
  v14 = v21;
LABEL_6:

}

- (void)_handleAuthResult:(id)a3 error:(id)a4
{
  id v5;
  NSObject *authQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  BKAuthenticationAlertRequest *v10;

  v5 = a3;
  authQueue = self->_authQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C0D90;
  v8[3] = &unk_1008E7338;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(authQueue, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authQueue, 0);
  objc_storeStrong((id *)&self->_authPromise, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
