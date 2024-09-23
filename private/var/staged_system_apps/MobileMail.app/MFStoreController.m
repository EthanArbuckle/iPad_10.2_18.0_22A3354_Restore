@implementation MFStoreController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A8A84;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA3C0 != -1)
    dispatch_once(&qword_1005AA3C0, block);
  return (OS_os_log *)(id)qword_1005AA3B8;
}

+ (id)openPossibleStoreURL:(id)a3 presentingFrom:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  unsigned __int8 v35;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v10 = objc_msgSend(v9, "isUserInteractionEnabled");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v11, "setUserInteractionEnabled:", 0);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1001A8DEC;
  v33[3] = &unk_10051C6A8;
  v12 = v7;
  v34 = v12;
  v35 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFDeallocInvocationToken tokenWithLabel:invocationBlock:](EFDeallocInvocationToken, "tokenWithLabel:invocationBlock:", CFSTR("MFStoreController Interaction Resumer"), v33));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_canLoadAsStoreURL:", v6));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001A8EEC;
  v30[3] = &unk_10051A910;
  v15 = v13;
  v31 = v15;
  v16 = v14;
  v32 = v16;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001A8F14;
  v25[3] = &unk_100522B18;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "afterDelay:performBlock:", v30, 2.0));
  v26 = v17;
  v29 = a1;
  v18 = v6;
  v27 = v18;
  v19 = v12;
  v28 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "onScheduler:then:", v8, v25));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001A8F48;
  v23[3] = &unk_10051AA98;
  v21 = v15;
  v24 = v21;
  objc_msgSend(v20, "onScheduler:always:", v8, v23);

  return v20;
}

+ (id)_canLoadAsStoreURL:(id)a3
{
  id v3;
  id v4;
  _QWORD *v5;
  Class v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001A9054;
  v9[3] = &unk_10051A848;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v10 = v4;
  v5 = objc_retainBlock(v9);
  v6 = off_1005A2BC0();
  if (v6)
    -[objc_class getCanLoadURL:completionBlock:](v6, "getCanLoadURL:completionBlock:", v3, v5);
  else
    ((void (*)(_QWORD *, _QWORD))v5[2])(v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "future"));

  return v7;
}

+ (id)_presentStoreURL:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  MFStoreController *v7;
  void *v8;
  MFStoreController *v9;
  _QWORD v11[4];
  MFStoreController *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MFStoreController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFStoreController _presentStoreURL:from:](v7, "_presentStoreURL:from:", v5, v6));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A91F4;
  v11[3] = &unk_10051AA98;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "always:", v11);

  return v8;
}

- (MFStoreController)init
{
  MFStoreController *v2;
  SKStoreProductViewController *v3;
  SKStoreProductViewController *storeViewController;
  EFPromise *v5;
  EFPromise *promise;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFStoreController;
  v2 = -[MFStoreController init](&v8, "init");
  if (v2)
  {
    v3 = (SKStoreProductViewController *)objc_alloc_init(off_1005A2BC0());
    storeViewController = v2->_storeViewController;
    v2->_storeViewController = v3;

    v5 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    promise = v2->_promise;
    v2->_promise = v5;

  }
  return v2;
}

- (id)_presentStoreURL:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  SKStoreProductViewController *storeViewController;
  id v9;
  SKStoreProductViewController *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  MFStoreController *v16;

  v6 = a3;
  v7 = a4;
  storeViewController = self->_storeViewController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001A93C8;
  v14[3] = &unk_100522B40;
  v9 = v6;
  v15 = v9;
  v16 = self;
  -[SKStoreProductViewController loadProductWithURL:completionBlock:](storeViewController, "loadProductWithURL:completionBlock:", v9, v14);
  v10 = self->_storeViewController;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A9514;
  v13[3] = &unk_10051AA98;
  v13[4] = self;
  objc_msgSend(v7, "presentViewController:animated:completion:", v10, 1, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EFPromise future](self->_promise, "future"));

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_storeViewController, 0);
}

@end
