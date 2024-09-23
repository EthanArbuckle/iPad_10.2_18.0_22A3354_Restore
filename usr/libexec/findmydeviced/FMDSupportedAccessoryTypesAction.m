@implementation FMDSupportedAccessoryTypesAction

- (FMDSupportedAccessoryTypesAction)initWithAccount:(id)a3 registry:(id)a4 serverInteractionController:(id)a5
{
  id v9;
  id v10;
  id v11;
  FMDSupportedAccessoryTypesAction *v12;
  FMDSupportedAccessoryTypesAction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMDSupportedAccessoryTypesAction;
  v12 = -[FMDSupportedAccessoryTypesAction init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_registry, a4);
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeStrong((id *)&v13->_serverInteractionController, a5);
  }

  return v13;
}

- (id)actionType
{
  return CFSTR("SupportedAccessoryTypesAction");
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  FMDSupportedAccessoryTypesRequest *v7;
  void *v8;
  void *v9;
  FMDSupportedAccessoryTypesRequest *v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id buf[2];

  v4 = a3;
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Action SupportedAccessoryTypesAction started", (uint8_t *)buf, 2u);
  }

  v7 = [FMDSupportedAccessoryTypesRequest alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryTypesAction account](self, "account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryTypesAction registry](self, "registry"));
  v10 = -[FMDSupportedAccessoryTypesRequest initWithAccount:registry:](v7, "initWithAccount:registry:", v8, v9);

  objc_initWeak(buf, self);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100032660;
  v16 = &unk_1002C1E30;
  objc_copyWeak(&v18, buf);
  v11 = v4;
  v17 = v11;
  -[FMDRequest setCompletionHandler:](v10, "setCompletionHandler:", &v13);
  -[FMDSupportedAccessoryTypesAction setRequest:](self, "setRequest:", v10, v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryTypesAction serverInteractionController](self, "serverInteractionController"));
  objc_msgSend(v12, "enqueueRequest:", v10);

  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);

}

- (void)willCancelAction
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryTypesAction serverInteractionController](self, "serverInteractionController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryTypesAction request](self, "request"));
  objc_msgSend(v4, "cancelRequest:", v3);

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

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  LOBYTE(self) = objc_opt_isKindOfClass(v4, v6);

  return self & 1;
}

- (FMDExtConfigurationRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_serverInteractionController, a3);
}

- (FMDSupportedAccessoryTypesRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_registry, 0);
}

@end
