@implementation FMDAccessoryInfoAction

- (FMDAccessoryInfoAction)initWithAccount:(id)a3 registry:(id)a4 accessoryTypes:(id)a5 serverInteractionController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FMDAccessoryInfoAction *v14;
  FMDAccessoryInfoAction *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FMDAccessoryInfoAction;
  v14 = -[FMDAccessoryInfoAction init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_registry, v11);
    objc_storeWeak((id *)&v15->_account, v10);
    objc_storeWeak((id *)&v15->_serverInteractionController, v13);
    objc_storeStrong((id *)&v15->_accessoryTypes, a5);
  }

  return v15;
}

- (id)actionType
{
  return CFSTR("FMDAccessoryInfoAction");
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  FMDAccessoryInfoRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  FMDAccessoryInfoRequest *v12;
  id v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoAction accessoryTypes](self, "accessoryTypes"));
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Action accessory info for %@ started", buf, 0xCu);

  }
  v8 = [FMDAccessoryInfoRequest alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoAction account](self, "account"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoAction registry](self, "registry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoAction accessoryTypes](self, "accessoryTypes"));
  v12 = -[FMDAccessoryInfoRequest initWithAccount:registry:accessoryTypes:](v8, "initWithAccount:registry:accessoryTypes:", v9, v10, v11);

  objc_initWeak((id *)buf, self);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100066F1C;
  v18 = &unk_1002C1E30;
  objc_copyWeak(&v20, (id *)buf);
  v13 = v4;
  v19 = v13;
  -[FMDRequest setCompletionHandler:](v12, "setCompletionHandler:", &v15);
  -[FMDAccessoryInfoAction setRequest:](self, "setRequest:", v12, v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoAction serverInteractionController](self, "serverInteractionController"));
  objc_msgSend(v14, "enqueueRequest:", v12);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)willCancelAction
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoAction serverInteractionController](self, "serverInteractionController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoAction request](self, "request"));
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
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v6 = objc_opt_class(FMDAccessoryInfoAction, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryInfoAction accessoryTypes](self, "accessoryTypes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryTypes"));
    objc_msgSend(v10, "addObjectsFromArray:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    -[FMDAccessoryInfoAction setAccessoryTypes:](self, "setAccessoryTypes:", v12);

  }
  return isKindOfClass & 1;
}

- (FMDExtConfigurationRegistry)registry
{
  return (FMDExtConfigurationRegistry *)objc_loadWeakRetained((id *)&self->_registry);
}

- (void)setRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_registry, a3);
}

- (FMDServerInteractionController)serverInteractionController
{
  return (FMDServerInteractionController *)objc_loadWeakRetained((id *)&self->_serverInteractionController);
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeWeak((id *)&self->_serverInteractionController, a3);
}

- (FMDAccessoryInfoRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (FMDAccount)account
{
  return (FMDAccount *)objc_loadWeakRetained((id *)&self->_account);
}

- (void)setAccount:(id)a3
{
  objc_storeWeak((id *)&self->_account, a3);
}

- (NSArray)accessoryTypes
{
  return self->_accessoryTypes;
}

- (void)setAccessoryTypes:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryTypes, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_destroyWeak((id *)&self->_registry);
}

@end
