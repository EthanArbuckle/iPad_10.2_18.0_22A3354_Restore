@implementation MFURLRouter

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF8B4;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA468 != -1)
    dispatch_once(&qword_1005AA468, block);
  return (id)qword_1005AA460;
}

- (MFURLRouter)initWithRoutes:(id)a3
{
  id v5;
  MFURLRouter *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  id v11;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFURLRouter;
  v6 = -[MFURLRouter init](&v9, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MFURLRouter log](MFURLRouter, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Create new router with routes: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_routes, a3);
  }

  return v6;
}

- (BOOL)canRouteRequest:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFURLRouter _prioritizedRoutesForRequest:](self, "_prioritizedRoutesForRequest:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_notEmpty"));
  v5 = v4 != 0;

  return v5;
}

- (void)routeRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
    *(_DWORD *)buf = 138543362;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Router received new request: %{public}@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFURLRouter delegate](self, "delegate"));
  v8 = v7;
  if (!v7)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Router has no delegate. Assuming routing is allowed. request=%{public}@", buf, 0xCu);
    }

    goto LABEL_12;
  }
  v9 = objc_msgSend(v7, "urlRouter:decidePolicyForRoutingRequest:", self, v4);
  v10 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = sub_1001BF7F0((unint64_t)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
    *(_DWORD *)buf = 138543618;
    v21 = v12;
    v22 = 2114;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Router delgate provided policy for request. policy=%{public}@ request=%{public}@", buf, 0x16u);

  }
  if (v9 != (id)1)
  {
    if (v9 == (id)2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_blockedURLErrorWithRequest:](NSError, "mf_blockedURLErrorWithRequest:", v4));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v14));
      objc_msgSend(v4, "completeWithResultOfFuture:", v15);

      goto LABEL_13;
    }
LABEL_12:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001BFDB8;
    v18[3] = &unk_10051A910;
    v18[4] = self;
    v19 = v4;
    objc_msgSend(v17, "performBlock:", v18);

  }
LABEL_13:

}

- (id)_routeRequest:(id)a3 routes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _BYTE buf[12];
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_publicDescription"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending request to route: %{public}@. request=%{public}@", buf, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeRequest:", v6));
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001C00F0;
    v17[3] = &unk_1005231B0;
    objc_copyWeak(&v20, (id *)buf);
    v18 = v6;
    v19 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "onScheduler:recover:", v13, v17));

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_noSuitableRouteErrorWithRequest:](NSError, "mf_noSuitableRouteErrorWithRequest:", v6));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v15));

  }
  return v14;
}

- (id)_prioritizedRoutesForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFURLRouter routes](self, "routes"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C0398;
  v10[3] = &unk_1005231D8;
  v6 = v4;
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_filter:", v10));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_100523218));
  return v8;
}

- (MFURLRoutingDelegate)delegate
{
  return (MFURLRoutingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  objc_storeStrong((id *)&self->_routes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
