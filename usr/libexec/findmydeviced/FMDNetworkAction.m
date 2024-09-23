@implementation FMDNetworkAction

- (FMDNetworkAction)initWithRequest:(id)a3 andServerInteractionController:(id)a4
{
  id v7;
  id v8;
  FMDNetworkAction *v9;
  FMDNetworkAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDNetworkAction;
  v9 = -[FMDNetworkAction init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_serverInteractionController, a4);
  }

  return v10;
}

- (id)actionType
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(FMDNetworkAction, a2);
  return NSStringFromClass(v2);
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD);
  _QWORD *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _BYTE *v23;
  id v24;
  id location;
  uint8_t v26[4];
  FMDNetworkAction *v27;
  __int16 v28;
  void *v29;
  _BYTE buf[24];
  id (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = sub_100052F5C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction request](self, "request"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ run for request - %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = sub_10000362C;
  v32 = sub_100003654;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction request](self, "request"));
  v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionHandler"));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000365C;
  v21[3] = &unk_1002C10F8;
  objc_copyWeak(&v24, &location);
  v21[4] = self;
  v23 = buf;
  v9 = (void (**)(_QWORD))v4;
  v22 = v9;
  v10 = objc_retainBlock(v21);
  v11 = sub_100052F5C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_100225248((int)self, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction request](self, "request"));
  objc_msgSend(v13, "setCompletionHandler:", v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction request](self, "request"));
  if (objc_msgSend(v14, "cancelled"))
  {

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction serverInteractionController](self, "serverInteractionController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction request](self, "request"));
    v17 = objc_msgSend(v15, "enqueueRequest:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_12;
  }
  v18 = sub_100052F5C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction request](self, "request"));
    *(_DWORD *)v26 = 138412546;
    v27 = self;
    v28 = 2112;
    v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ request cancelled or did not enqueue: %@", v26, 0x16u);

  }
  if (v9)
    v9[2](v9);
LABEL_12:

  objc_destroyWeak(&v24);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)willCancelAction
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  FMDNetworkAction *v9;
  __int16 v10;
  void *v11;

  v3 = sub_100052F5C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction request](self, "request"));
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ will cancel request: %@", (uint8_t *)&v8, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction serverInteractionController](self, "serverInteractionController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction request](self, "request"));
  objc_msgSend(v6, "cancelRequest:", v7);

}

- (BOOL)shouldCancelAction:(id)a3
{
  return 0;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNetworkAction request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%p:%@"), v3, self, v4));

  return (NSString *)v5;
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_serverInteractionController, a3);
}

- (FMDRequest)request
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
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
}

@end
