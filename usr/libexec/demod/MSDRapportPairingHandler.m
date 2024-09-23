@implementation MSDRapportPairingHandler

- (MSDRapportPairingHandler)initWithDevice:(id)a3 andCompletion:(id)a4
{
  id v6;
  id v7;
  MSDRapportPairingHandler *v8;
  MSDRapportPairingHandler *v9;
  dispatch_queue_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MSDRapportPairingHandler;
  v8 = -[MSDRapportPairingHandler init](&v33, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDRapportPairingHandler setCompletionHandler:](v8, "setCompletionHandler:", v7);
    -[MSDRapportPairingHandler setDevice:](v9, "setDevice:", v6);
    v10 = dispatch_queue_create("com.apple.MobileStoreDemo.RapportPairingHandler", 0);
    -[MSDRapportPairingHandler setQueue:](v9, "setQueue:", v10);

    -[MSDRapportPairingHandler setRetryLeft:](v9, "setRetryLeft:", 1);
    objc_initWeak(&location, v9);
    v11 = objc_alloc_init((Class)RPCompanionLinkClient);
    -[MSDRapportPairingHandler setRpClient:](v9, "setRpClient:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler queue](v9, "queue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](v9, "rpClient"));
    objc_msgSend(v13, "setDispatchQueue:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](v9, "rpClient"));
    objc_msgSend(v14, "setControlFlags:", 1030);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](v9, "rpClient"));
    objc_msgSend(v15, "setFlags:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rpDevice"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](v9, "rpClient"));
    objc_msgSend(v17, "setDestinationDevice:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](v9, "rpClient"));
    objc_msgSend(v18, "setPasswordType:", 2);

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001F0C4;
    v30[3] = &unk_10013D840;
    objc_copyWeak(&v31, &location);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](v9, "rpClient"));
    objc_msgSend(v19, "setInterruptionHandler:", v30);

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001F14C;
    v28[3] = &unk_10013D840;
    objc_copyWeak(&v29, &location);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](v9, "rpClient"));
    objc_msgSend(v20, "setInvalidationHandler:", v28);

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001F1D4;
    v26[3] = &unk_10013DD68;
    objc_copyWeak(&v27, &location);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](v9, "rpClient"));
    objc_msgSend(v21, "setAuthCompletionHandler:", v26);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001F21C;
    v24[3] = &unk_10013DD90;
    objc_copyWeak(&v25, &location);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](v9, "rpClient"));
    objc_msgSend(v22, "setPromptForPasswordHandler:", v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  MSDRapportPairingHandler *v11;
  __int16 v12;
  void *v13;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler device](self, "device"));
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Deallocating handler for device: %{public}@!", buf, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](self, "rpClient"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](self, "rpClient"));
    objc_msgSend(v7, "setInvalidationHandler:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](self, "rpClient"));
    objc_msgSend(v8, "invalidate");

    -[MSDRapportPairingHandler setRpClient:](self, "setRpClient:", 0);
  }
  v9.receiver = self;
  v9.super_class = (Class)MSDRapportPairingHandler;
  -[MSDRapportPairingHandler dealloc](&v9, "dealloc");
}

- (void)activate
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  MSDRapportPairingHandler *v10;
  __int16 v11;
  void *v12;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler device](self, "device"));
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Activating handler for device: %{public}@!", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v6 = objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F4FC;
  block[3] = &unk_10013D840;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_activate
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](self, "rpClient"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F600;
  v5[3] = &unk_10013DD68;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "activateWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_hanldeAuthCompletionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  int v12;
  MSDRapportPairingHandler *v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BA8BC((uint64_t)self, v4);

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:reason:](NSError, "errorDomainMSDWithCode:message:reason:", 3727741107, CFSTR("Cannot authenticate demo peer."), v8));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Authentication successfully completed!", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler completionHandler](self, "completionHandler"));
  if (v10)
  {
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler completionHandler](self, "completionHandler"));
    ((void (**)(_QWORD, void *))v11)[2](v11, v9);

  }
}

- (void)_handlePasswordPromptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  int64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[4];
  _BYTE v21[10];
  int v22;

  v7 = objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v21 = a3;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MSDRapportPairingHandler: Pairing secret requested with flags: %d throttle: %d", buf, 0xEu);
  }

  v10 = 1000000000;
  if ((a3 & 0x20000) != 0 && a4 >= 1)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v21 = self;
      *(_WORD *)&v21[8] = 1024;
      v22 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Authentication needs to be throttled: %d", buf, 0x12u);
    }

    v10 = 1000000000 * a4 + 1000000000;
  }
  if ((a3 & 0x10000) != 0)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Pairing secret provided was incorrect!", buf, 0xCu);
    }

    -[MSDRapportPairingHandler setRetryLeft:](self, "setRetryLeft:", (char *)-[MSDRapportPairingHandler retryLeft](self, "retryLeft") - 1);
  }
  if (-[MSDRapportPairingHandler retryLeft](self, "retryLeft") < 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744512, CFSTR("Unexpected server response.")));
    -[MSDRapportPairingHandler _hanldeAuthCompletionWithError:](self, "_hanldeAuthCompletionWithError:", v17);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    v15 = dispatch_time(0, v10);
    v16 = objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001FB9C;
    block[3] = &unk_10013D840;
    objc_copyWeak(&v19, (id *)buf);
    dispatch_after(v15, v16, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_fetchPairingSecretFromServer
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  MSDKVStoreRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  MSDRapportPairingHandler *v13;
  __int16 v14;
  int64_t v15;

  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2048;
    v15 = -[MSDRapportPairingHandler retryLeft](self, "retryLeft");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching pairing secret from server with retry left: %ld", buf, 0x16u);
  }

  v6 = objc_alloc_init(MSDKVStoreRequest);
  objc_initWeak((id *)buf, self);
  -[MSDKVStoreRequest setIsPost:](v6, "setIsPost:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler device](self, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  -[MSDKVStoreRequest setKey:](v6, "setKey:", v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001FDAC;
  v10[3] = &unk_10013DDE0;
  objc_copyWeak(&v11, (id *)buf);
  -[MSDServerRequest setCompletion:](v6, "setCompletion:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  objc_msgSend(v9, "handleRequestAsync:", v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

- (void)_handleKVStoreResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  MSDRapportPairingHandler *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7 || !v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000BA940((uint64_t)self, v7);

    -[MSDRapportPairingHandler setRetryLeft:](self, "setRetryLeft:", (char *)-[MSDRapportPairingHandler retryLeft](self, "retryLeft") - 1);
    if (-[MSDRapportPairingHandler retryLeft](self, "retryLeft") < 1)
      -[MSDRapportPairingHandler _hanldeAuthCompletionWithError:](self, "_hanldeAuthCompletionWithError:", v7);
    else
      -[MSDRapportPairingHandler _fetchPairingSecretFromServer](self, "_fetchPairingSecretFromServer");
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Found pairing secret: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportPairingHandler rpClient](self, "rpClient"));
    objc_msgSend(v11, "tryPassword:", v6);

  }
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%p]>"), v5, self));

  return v6;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MSDRapportDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RPCompanionLinkClient)rpClient
{
  return self->_rpClient;
}

- (void)setRpClient:(id)a3
{
  objc_storeStrong((id *)&self->_rpClient, a3);
}

- (int64_t)retryLeft
{
  return self->_retryLeft;
}

- (void)setRetryLeft:(int64_t)a3
{
  self->_retryLeft = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
