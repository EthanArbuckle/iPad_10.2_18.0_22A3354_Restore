@implementation FMDPairingCheckCommandAction

- (FMDPairingCheckCommandAction)initWithProvider:(id)a3 pairingCheckRequestInfo:(id)a4
{
  id v6;
  id v7;
  FMDPairingCheckCommandAction *v8;
  FMDPairingCheckCommandAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDPairingCheckCommandAction;
  v8 = -[FMDPairingCheckCommandAction init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_provider, v6);
    objc_storeStrong((id *)&v9->_pairingCheckRequestInfo, a4);
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
  return CFSTR("FMDPairingCheckCommandAction");
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  FMDPairingCheckCommandRequest *v10;
  void *v11;
  void *v12;
  FMDPairingCheckCommandRequest *v13;
  id v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  FMDPairingCheckCommandAction *v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandAction pairingCheckRequestInfo](self, "pairingCheckRequestInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingCheckToken"));
    *(_DWORD *)buf = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Action FMDPairingCheckCommandAction %@ started for %@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandAction provider](self, "provider"));
  v10 = [FMDPairingCheckCommandRequest alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "account"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandAction pairingCheckRequestInfo](self, "pairingCheckRequestInfo"));
  v13 = -[FMDPairingCheckCommandRequest initWithAccount:pairingCheckRequestInfo:](v10, "initWithAccount:pairingCheckRequestInfo:", v11, v12);

  objc_initWeak((id *)buf, self);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100092FE8;
  v19 = &unk_1002C1E30;
  objc_copyWeak(&v21, (id *)buf);
  v14 = v4;
  v20 = v14;
  -[FMDRequest setCompletionHandler:](v13, "setCompletionHandler:", &v16);
  -[FMDPairingCheckCommandAction setRequest:](self, "setRequest:", v13, v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverInteractionController"));
  objc_msgSend(v15, "enqueueRequest:", v13);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

- (void)willCancelAction
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandAction provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverInteractionController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandAction request](self, "request"));
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairingCheckRequestInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingCheckToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandAction pairingCheckRequestInfo](self, "pairingCheckRequestInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pairingCheckToken"));
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

- (FMDPairingCheckCommandRequestInfo)pairingCheckRequestInfo
{
  return self->_pairingCheckRequestInfo;
}

- (void)setPairingCheckRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_pairingCheckRequestInfo, a3);
}

- (id)onCompletionHandler
{
  return self->_onCompletionHandler;
}

- (void)setOnCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FMDPairingCheckCommandRequest)request
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
  objc_storeStrong((id *)&self->_pairingCheckRequestInfo, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
