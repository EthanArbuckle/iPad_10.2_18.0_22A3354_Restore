@implementation FMDPairingLockRegisterAction

- (FMDPairingLockRegisterAction)initWithProvider:(id)a3 registerRequestInfo:(id)a4
{
  id v6;
  id v7;
  FMDPairingLockRegisterAction *v8;
  FMDPairingLockRegisterAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDPairingLockRegisterAction;
  v8 = -[FMDPairingLockRegisterAction init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_provider, v6);
    objc_storeStrong((id *)&v9->_registerRequestInfo, a4);
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
  return CFSTR("FMDPairingLockRegisterAction");
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  FMDPairingLockRegisterRequest *v10;
  void *v11;
  void *v12;
  FMDPairingLockRegisterRequest *v13;
  id v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  FMDPairingLockRegisterAction *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockRegisterAction registerRequestInfo](self, "registerRequestInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber"));
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Action FMDPairingLockRegisterAction %@ started for %@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockRegisterAction provider](self, "provider"));
  v10 = [FMDPairingLockRegisterRequest alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "account"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockRegisterAction registerRequestInfo](self, "registerRequestInfo"));
  v13 = -[FMDPairingLockRegisterRequest initWithAccount:registerRequestInfo:](v10, "initWithAccount:registerRequestInfo:", v11, v12);

  objc_initWeak((id *)buf, self);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_10009B1A4;
  v18 = &unk_1002C1E30;
  objc_copyWeak(&v20, (id *)buf);
  v14 = v4;
  v19 = v14;
  -[FMDRequest setCompletionHandler:](v13, "setCompletionHandler:", &v15);
  -[FMDPairingLockRegisterAction setRequest:](self, "setRequest:", v13, v15, v16, v17, v18);
  objc_msgSend(v9, "enqueueRequest:", v13);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)willCancelAction
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDPairingLockRegisterAction provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverInteractionController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockRegisterAction request](self, "request"));
  objc_msgSend(v3, "cancelRequest:", v4);

}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
    goto LABEL_4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "registerRequestInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockRegisterAction registerRequestInfo](self, "registerRequestInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serialNumber"));
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v11 & 1) != 0)
    v12 = 1;
  else
LABEL_4:
    v12 = 0;

  return v12;
}

- (FMDFMIPServiceProvider)provider
{
  return (FMDFMIPServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (FMDPairingLockRegisterRequestInfo)registerRequestInfo
{
  return self->_registerRequestInfo;
}

- (void)setRegisterRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_registerRequestInfo, a3);
}

- (id)onCompletionHandler
{
  return self->_onCompletionHandler;
}

- (void)setOnCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FMDPairingLockRegisterRequest)request
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
  objc_storeStrong((id *)&self->_registerRequestInfo, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
