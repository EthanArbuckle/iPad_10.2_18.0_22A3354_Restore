@implementation BKAcquireSlotRequest

- (BKAcquireSlotRequest)init
{
  BKAcquireSlotRequest *v2;
  id v3;
  uint64_t v4;
  ICStoreRequestContext *requestContext;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAcquireSlotRequest;
  v2 = -[BKAcquireSlotRequest init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)ICStoreRequestContext);
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ae_initWithActiveAccountAllowAuthenticationOnceADay"));
    requestContext = v2->_requestContext;
    v2->_requestContext = (ICStoreRequestContext *)v4;

  }
  return v2;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100113C6C;
  v5[3] = &unk_1008E9F90;
  v6 = a3;
  v4 = v6;
  -[BKAcquireSlotRequest performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v5);

}

- (void)execute
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "acquireSlotURL"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100113D5C;
  v5[3] = &unk_1008EB210;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "valueWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_acquireSlotWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id buf[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAcquireSlotRequest additionalParams](self, "additionalParams"));

  v6 = v4;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAcquireSlotRequest additionalParams](self, "additionalParams"));
      objc_msgSend(v7, "setQuery:", v8);

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    }
    else
    {
      v9 = sub_1000CA2E0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Nil url, can't add additional query parms.", (uint8_t *)buf, 2u);
      }

      v6 = 0;
    }
  }
  v11 = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:", v6);
  objc_msgSend(v11, "setHTTPMethod:", CFSTR("GET"));
  objc_initWeak(buf, self);
  v12 = objc_msgSend(objc_alloc((Class)ICStoreURLRequest), "initWithURLRequest:requestContext:", v11, self->_requestContext);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100114020;
  v14[3] = &unk_1008EB238;
  objc_copyWeak(&v15, buf);
  objc_msgSend(v13, "enqueueDataRequest:withCompletionHandler:", v12, v14);
  objc_destroyWeak(&v15);

  objc_destroyWeak(buf);
}

- (NSString)additionalParams
{
  return self->_additionalParams;
}

- (void)setAdditionalParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_requestContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_additionalParams, 0);
}

@end
