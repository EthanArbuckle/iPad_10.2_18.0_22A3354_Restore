@implementation FMDPairingLockUpdateInfoAction

- (FMDPairingLockUpdateInfoAction)initWithProvider:(id)a3 updateRequestInfo:(id)a4
{
  id v6;
  id v7;
  FMDPairingLockUpdateInfoAction *v8;
  FMDPairingLockUpdateInfoAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDPairingLockUpdateInfoAction;
  v8 = -[FMDPairingLockUpdateInfoAction init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_provider, v6);
    objc_storeStrong((id *)&v9->_updateRequestInfo, a4);
  }

  return v9;
}

- (void)performOnActionCompletion:(id)a3
{
  id v4;
  id onCompletionHandler;

  v4 = objc_retainBlock(a3);
  onCompletionHandler = self->_onCompletionHandler;
  self->_onCompletionHandler = v4;

}

- (id)actionType
{
  return CFSTR("FMDPairingLockUpdateInfoAction");
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  FMDPairingLockUpdateInfoRequest *v10;
  void *v11;
  void *v12;
  FMDPairingLockUpdateInfoRequest *v13;
  id v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  FMDPairingLockUpdateInfoAction *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoAction updateRequestInfo](self, "updateRequestInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingCheckToken"));
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Action FMDPairingLockUpdateInfoAction %@ started for %@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoAction provider](self, "provider"));
  v10 = [FMDPairingLockUpdateInfoRequest alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "account"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoAction updateRequestInfo](self, "updateRequestInfo"));
  v13 = -[FMDPairingLockUpdateInfoRequest initWithAccount:updateRequestInfo:](v10, "initWithAccount:updateRequestInfo:", v11, v12);

  objc_initWeak((id *)buf, self);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100052AAC;
  v18 = &unk_1002C1E30;
  objc_copyWeak(&v20, (id *)buf);
  v14 = v4;
  v19 = v14;
  -[FMDRequest setCompletionHandler:](v13, "setCompletionHandler:", &v15);
  -[FMDPairingLockUpdateInfoAction setRequest:](self, "setRequest:", v13, v15, v16, v17, v18);
  objc_msgSend(v9, "enqueueRequest:", v13);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)willCancelAction
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoAction provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverInteractionController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoAction request](self, "request"));
  objc_msgSend(v3, "cancelRequest:", v4);

}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)shouldCancelAction:(id)a3
{
  return 0;
}

- (FMDFMIPServiceProvider)provider
{
  return (FMDFMIPServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (FMDPairingLockUpdateRequestInfo)updateRequestInfo
{
  return self->_updateRequestInfo;
}

- (void)setUpdateRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_updateRequestInfo, a3);
}

- (id)onCompletionHandler
{
  return self->_onCompletionHandler;
}

- (void)setOnCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FMDPairingLockUpdateInfoRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_onCompletionHandler, 0);
  objc_storeStrong((id *)&self->_updateRequestInfo, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
